;;{{{ Setup Load Path

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(package-initialize)

(setq load-path (append
                 load-path
                 '("~/etc/Emacs")
                 ))

(require 'ido)
(ido-mode t)

(desktop-save-mode 1)

(require 'recentf)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)

(setq-default ispell-program-name "aspell")
(fset 'yes-or-no-p 'y-or-n-p)
(transient-mark-mode t)
(column-number-mode t)
(display-time-mode t)
(setq auto-save-interval 300)
;; avoid jump to former paenthese
(setq show-paren-mode 't)
(setq show-paren-style 'parentheses)	; seems does not work
;; avoid jump when scrolling
(setq scroll-setp 1
      scroll-margin 3
      scroll-conservatively 10000)
;; Show buffer name in title
(setq frame-title-format "emacs@%b")
;; auto show image
(auto-image-file-mode)
;; do not backup files
;;(setq make-backup-file nil)
;; big file highligh too slow;
(setq lazy-lock-defer-on-scrolling nil)
;;(setq font-lock-support-mode 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)
;; auto complete function
(global-set-key "\M- " 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))
;; match the next bracket
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)
;; hot key for goto-line
(global-set-key "\M-g" 'goto-line)
;;}}}

(defun my-frame-config (frame)
  "Custom behaviours for new frames."
  (with-selected-frame frame
    (when (display-graphic-p)
      (require 'color-theme)
      (eval-after-load "color-theme"
	'(progn
	   (color-theme-initialize)
	   (color-theme-subtle-hacker)))
      (color-theme-subtle-hacker))))

(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

;;{{{ Show Line Number
;; wb-line-nubmer.el
(set-scroll-bar-mode nil)
;;(require 'wb-line-number)
;;(wb-line-number-enable)
;; setnu.el to show line, no so good
;;(require 'setnu)
;;(setnu-mode t)
;;}}}

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#657b83" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#fdf6e3"))
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes '(sanityinc-solarized-dark))
 '(custom-safe-themes
   '("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default))
 '(display-time-mode t)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(fci-rule-color "#eee8d5")
 '(global-font-lock-mode t nil (font-lock))
 '(ltext-mode-hook '(turn-on-auto-fill text-mode-hook-identify))
 '(make-backup-files nil)
 '(message-send-mail-function 'message-send-mail-with-sendmail)
 '(org-agenda-files
   '("~/documents/personel/notes/kernel.org" "~/documents/work/notes/note.org" "~/documents/work/notes/work.org" "~/documents/work/notes/tasks.org"))
 '(package-selected-packages
   '(exec-path-from-shell highlight-indent-guides highlight-indentation yaml eglot typescript-mode protobuf-mode lsp-mode dockerfile-mode cmake-mode ox-hugo notmuch tabbar ivy-mpdel libmpdel mpdel transient jinja2-mode htmlize plantuml-mode jedi rfc-mode markdown-mode color-theme-sanityinc-solarized use-package posframe gnu-elpa-keyring-update yang-mode metaweblog org2blog pyim pyim-basedict go-mode less-css-mode ztree yaml-mode vbasense uncrustify-mode sr-speedbar screenshot magit lua-mode json-mode groovy-mode gradle-mode flymake-lua cmake-font-lock))
 '(safe-local-variable-values '((c-indent-level . 4)))
 '(send-mail-function 'sendmail-query-once)
 '(show-paren-mode t)
 '(tool-bar-mode nil nil (tool-bar))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16")))
 '(vc-annotate-very-old-color nil))

(prefer-coding-system 'utf-8)

;; Customaztions for slime-mode
;(add-to-list 'load-path "/home/zjw/etc/Emacs/slime")
;(setq inferior-lisp-program "/home/zjw/programs/bin/sbcl")
;(require 'slime)
;;(slime-setup)
;(slime-setup '(slime-fancy))

;; Customizations for rfc-mode
(setq auto-mode-alist
      (cons '("/rfc[0-9]+\\.txt\\(\\.gz\\)?\\'" . rfc-mode)
	    auto-mode-alist))
(autoload 'rfc-mode "rfc-mode" nil t)

(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1))

(setq default-fill-column 60)

;;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; )

(if (display-graphic-p)
(let ((emacs-font-size 14)
;;      (emacs-font-name "Iosevka Custom"))
      (emacs-font-name "Sarasa Mono SC"))
;;        (emacs-font-name "DejaVu Sans Mono"))
  (set-frame-font (format "%s-%s" (eval emacs-font-name) (eval emacs-font-size)))
  (set-fontset-font (frame-parameter nil 'font) 'unicode (eval emacs-font-name))))

(setq x-select-enable-clipboard t)

(defconst my-c-style
  '((c-tab-always-indent           . t)
;;    (c-comment-only-line-offset    . 4)
    (c-hanging-braces-alist        . ((substatement-open after)
                                      (brace-list-open)))
    (c-hanging-colons-alist        . ((member-init-intro before)
                                      (inher-intro)
                                      (case-label after)
                                      (label after)
                                      (access-label after)))
    (c-cleanup-list                . (scope-operator
                                      empty-defun-braces
                                      defun-close-semi))
    (c-offsets-alist               . ((arglist-close     . c-lineup-arglist)
                                      (substatement-open . 0)
                                      (case-label        . 4)
                                      (block-open        . 0)
                                      (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t)
    )
  "My C Programming Style")

;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  ;; (c-add-style "PERSONAL" my-c-style t)
  ;; offset customizations not in my-c-style
  ;; (c-set-offset 'member-init-intro '++)
  (c-set-style "linux")
  (electric-pair-mode '1)
  ;; other customizations
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
;;  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
;;        indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
  (c-toggle-auto-hungry-state 1)
  ;; keybindings for C, C++, and Objective-C.  We can put these in
  ;; c-mode-map because c++-mode-map and objc-mode-map inherit it
  (define-key c-mode-map "\C-m" 'newline-and-indent)
  )

(defun cscope-minor-mode-on ()
  "Turn on `cscope-minor-mode' mode."
  (interactive)
  (cscope-minor-mode 1))
(add-hook 'c-mode-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-hook 'cscope-minor-mode-on)
(add-hook 'c++-mode-hook 'cscope-minor-mode-on)

(setq auto-mode-alist
      (cons '("\\.test\\'" . tcl-mode)
	    auto-mode-alist))

;; Customizations for ans-mode
(setq load-path (cons "/home/zjw/etc/Emacs/asn.1/" load-path))
;;; ASN.1 Mode
(autoload 'asn1-diff-mode "asn1-diff"
  "Major mode for editing comparison of ASN.1 specifications." t)
(autoload 'asn1-diff "asn1-diff"
  "For comparing ASN.1 specifications." t)
(autoload 'asn1-mode "asn1-mode"
  "Major mode for editing ASN.1 specifications." t)

;; Customizations for org-mode
(add-hook 'org-mode-hook #'(lambda ()
                             ;; make the lines in the buffer wrap around the edges of the screen.
                             ;; to press C-c q  or fill-paragraph ever again!
                             (visual-line-mode)
                             (org-indent-mode)
			     (add-to-list 'org-emphasis-alist
					  '("*" (:foreground "#F4A460")
					    ))
			     ))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-log-done 'time)
(setq org-agenda-files (list "~/documents/work/notes/note.org"
                             "~/documents/work/notes/work.org"
			     "~/documents/work/notes/tasks.org"))
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(setq auto-mode-alist
      (cons '("\\.map\\'" . lua-mode)
	    auto-mode-alist))

;;(add-to-list 'org-emphasis-alist
;;             '("*" (:foreground "#F4A460")
;;               ))

(setq org2blog/wp-blog-alist
      '(("myblog"
         :url "https://flyingbyte.tk/xmlrpc.php"
         :username "vitaly")))
(setq org2blog/wp-use-sourcecode-shortcode t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ditaa . t)))

;; org 模式 export plantuml配置
(use-package plantuml-mode
  :init
    (setq plantuml-default-exec-mode 'jar)
    (setq plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
    (setq org-plantuml-jar-path (expand-file-name "/usr/share/plantuml/plantuml.jar"))
    (setq plantuml-java-args (list "-Djava.awt.headless=true" "-jar"))
    (setq org-startup-with-inline-images t)
    (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
    (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t))))

(require 'ob-plantuml)

;; org 模式 export ditaa配置
(setq org-ditaa-jar-path "/usr/bin/ditaa")
(require 'ob-ditaa)

(use-package ox-hugo
  :ensure t            ;Auto-install the package from Melpa (optional)
  :after ox)


;;(setcar org-emphasis-regexp-components " \t('\"{[:alpha:]")
;;(setcar (nthcdr 1 org-emphasis-regexp-components) "[:alpha:]- \t.,:!?;'\")}\\")
;;(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)

;; Customizations for muse-mode
;;(add-to-list 'load-path "/home/zjw/etc/Emacs/muse")

;;(require 'muse-mode)     ; load authoring mode

;;(require 'muse-html)     ; load publishing styles I use
;;(require 'muse-latex)
;;(require 'muse-texinfo)
;;(require 'muse-docbook)

;;(require 'muse-project)  ; publish files in projects


;; Customizations for cscpoe-mode
(require 'xcscope)
(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]
 'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-next-symbol)
(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map [(control f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]  'cscope-display-buffer)
(define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)


;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )


(defun join-lines () (interactive)
 (setq fill-column 100000)
 (fill-paragraph nil)
 (setq fill-column 78)
)


(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(global-set-key "\C-Z" nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; use fold-dwim to fold xml file        ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'nxml-mode-hook 'my-fold-dwim-hook)
(defun my-fold-dwin-hook ()
   (fold-dwim-turn-on-hs-and-hide)
   )

(defun my-xhtml-extras ()
   (make-local-variable 'outline-regexp)
   (setq outline-regexp "\\s *<\\([h][1-6]\\|html\\|body\\|head\\)\\b")
   (make-local-variable 'outline-level)
   (setq outline-level 'my-xhtml-outline-level)
   (outline-minor-mode 1)
   (hs-minor-mode 1))
(defun my-xhtml-outline-level ()
   (save-excursion (re-search-forward html-outline-level))
   (let ((tag (buffer-substring (match-beginning 1) (match-end 1))))
     (if (eq (length tag) 2)
         (- (aref tag 1) ?0)
       0)))
(add-to-list 'hs-special-modes-alist
              '(nxml-mode
                "<!--\\|<[^/>]>\\|<[^/][^>]*[^/]>"
                ""
                "<!--" ;; won't work on its own; uses syntax table
                (lambda (arg) (my-nxml-forward-element))
                nil))
(defun my-nxml-forward-element ()
   (let ((nxml-sexp-element-flag))
     (setq nxml-sexp-element-flag (not (looking-at "<!--")))
     (unless (looking-at outline-regexp)
       (condition-case nil
           (nxml-forward-balanced-item 1)
         (error nil)))))
;;(setq default-frame-alist '((font . "DejaVu LGC Sans Mono-15")))

(global-unset-key (kbd "C-z"))

(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-use-ssh-controlmaster-options nil)
(require 'package)
(add-to-list 'package-archives
	      '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
;;(package-initialize)

(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(add-hook 'c-mode-hook (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

;(add-to-list 'load-path "/home/zjw/etc/Emacs/helm-master/")
;(require 'helm-onfig)

; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)


(defun copy-lines-matching-re (re)
  "find all lines matching the regexp RE in the current buffer
putting the matching lines in a buffer named *matching*"
  (interactive "sRegexp to match: ")
  (let ((result-buffer (get-buffer-create "*matching*")))
    (with-current-buffer result-buffer
      (erase-buffer))
    (save-match-data
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward re nil t)
          (princ (buffer-substring-no-properties (line-beginning-position)
                                                 (line-beginning-position 2))
                 result-buffer))))
    (pop-to-buffer result-buffer)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-mode))

(defun my-put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(setq auto-mode-alist
      (cons '("\\.gradle\\'" . groovy-mode)
	    auto-mode-alist))




(electric-pair-mode 1)


;(setq url-proxy-services '(("no_proxy" . "6wind\\.com")
;                          ("http" . "10.80.1.2:8080")
;			   ("https" . "10.80.1.2:8080")))

(setq url-proxy-services nil)
(advice-add 'url-http-create-request :override
            'url-http-create-request-debug)
(defun url-http-create-request-debug (&optional ref-url)
  "Create an HTTP request for <code>url-http-target-url', referred to by REF-URL."
  (let* ((extra-headers)
         (request nil)
         (no-cache (cdr-safe (assoc "Pragma" url-http-extra-headers)))
         (using-proxy url-http-proxy)
         (proxy-auth (if (or (cdr-safe (assoc "Proxy-Authorization"
                                              url-http-extra-headers))
                             (not using-proxy))
                         nil
                       (let ((url-basic-auth-storage
                              'url-http-proxy-basic-auth-storage))
                         (url-get-authentication url-http-proxy nil 'any nil))))
         (real-fname (url-filename url-http-target-url))
         (host (url-http--encode-string (url-host url-http-target-url)))
         (auth (if (cdr-safe (assoc "Authorization" url-http-extra-headers))
                   nil
                 (url-get-authentication (or
                                          (and (boundp 'proxy-info)
                                               proxy-info)
                                          url-http-target-url) nil 'any nil))))
    (if (equal "" real-fname)
        (setq real-fname "/"))
    (setq no-cache (and no-cache (string-match "no-cache" no-cache)))
    (if auth
        (setq auth (concat "Authorization: " auth "\r\n")))
    (if proxy-auth
        (setq proxy-auth (concat "Proxy-Authorization: " proxy-auth "\r\n")))

    ;; Protection against stupid values in the referrer
    (if (and ref-url (stringp ref-url) (or (string= ref-url "file:nil")
                                           (string= ref-url "")))
        (setq ref-url nil))

    ;; We do not want to expose the referrer if the user is paranoid.
    (if (or (memq url-privacy-level '(low high paranoid))
            (and (listp url-privacy-level)
                 (memq 'lastloc url-privacy-level)))
        (setq ref-url nil))

    ;; url-http-extra-headers contains an assoc-list of
    ;; header/value pairs that we need to put into the request.
    (setq extra-headers (mapconcat
                         (lambda (x)
                           (concat (car x) ": " (cdr x)))
                         url-http-extra-headers "\r\n"))
    (if (not (equal extra-headers ""))
        (setq extra-headers (concat extra-headers "\r\n")))

    ;; This was done with a call to </code>format'.  Concatenating parts has
    ;; the advantage of keeping the parts of each header together and
    ;; allows us to elide null lines directly, at the cost of making
    ;; the layout less clear.
    (setq request
          (concat
             ;; The request
             (or url-http-method "GET") " "
             (url-http--encode-string
              (if using-proxy (url-recreate-url url-http-target-url) real-fname))
             " HTTP/" url-http-version "\r\n"
             ;; Version of MIME we speak
             "MIME-Version: 1.0\r\n"
             ;; (maybe) Try to keep the connection open
             "Connection: " (if (or using-proxy
                                    (not url-http-attempt-keepalives))
                                "close" "keep-alive") "\r\n"
                                ;; HTTP extensions we support
             (if url-extensions-header
                 (format
                  "Extension: %s\r\n" url-extensions-header))
             ;; Who we want to talk to
             (if (/= (url-port url-http-target-url)
                     (url-scheme-get-property
                      (url-type url-http-target-url) 'default-port))
                 (format
                  "Host: %s:%d\r\n" host (url-port url-http-target-url))
               (format "Host: %s\r\n" host))
             ;; Who its from
             (if url-personal-mail-address
                 (concat
                  "From: " url-personal-mail-address "\r\n"))
             ;; Encodings we understand
             (if (or url-mime-encoding-string
                     ;; MS-Windows loads zlib dynamically, so recheck
                     ;; in case they made it available since
                     ;; initialization in url-vars.el.
                     (and (eq 'system-type 'windows-nt)
                          (fboundp 'zlib-available-p)
                          (zlib-available-p)
                          (setq url-mime-encoding-string "gzip")))
                 (concat
                  "Accept-encoding: " url-mime-encoding-string "\r\n"))
             (if url-mime-charset-string
                 (concat
                  "Accept-charset: "
                  (url-http--encode-string url-mime-charset-string)
                  "\r\n"))
             ;; Languages we understand
             (if url-mime-language-string
                 (concat
                  "Accept-language: " url-mime-language-string "\r\n"))
             ;; Types we understand
             "Accept: " (or url-mime-accept-string "*/*") "\r\n"
             ;; User agent
             (url-http-user-agent-string)
             ;; Proxy Authorization
             proxy-auth
             ;; Authorization
             auth
             ;; Cookies
             (when (url-use-cookies url-http-target-url)
               (url-http--encode-string
                (url-cookie-generate-header-lines
                 host real-fname
                 (equal "https" (url-type url-http-target-url)))))
             ;; If-modified-since
             (if (and (not no-cache)
                      (member url-http-method '("GET" nil)))
                 (let ((tm (url-is-cached url-http-target-url)))
                   (if tm
                       (concat "If-modified-since: "
                               (url-get-normalized-date tm) "\r\n"))))
             ;; Whence we came
             (if ref-url (concat
                          "Referer: " ref-url "\r\n"))
             extra-headers
             ;; Length of data
             (if url-http-data
                 (concat
                  "Content-length: " (number-to-string
                                      (length url-http-data))
                  "\r\n"))
             ;; End request
             "\r\n"
             ;; Any data
             url-http-data))
    ;; Bug#23750
    ;;(unless (= (string-bytes request)
    ;;           (length request))
    ;;  (message "   text byte %d vs %d length" (string-bytes request) (length request)))
      ;;(message "===============================")
      ;;(error "Multibyte text in HTTP request: %s" request))
    (url-http-debug "Request is: \n%s" request)
    request))


(setq visible-bell 1)

(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[Aa][Ss][Nn]\\([1]\\|[pP][pP]?\\)?$" . asn1-mode)
		("\\.[Aa][Ss][Nn][dD]$" . asn1-diff-mode2))))


(add-hook 'python-mode-hook #'(lambda ()
                             (cscope-minor-mode-on)
			     ))

(use-package pyim
	     :ensure nil
	     :demand t
	     :config
	     ;; 激活 basedict 拼音词库，五笔用户请继续阅读 README
	     (use-package pyim-basedict
			  :ensure nil
			  :config (pyim-basedict-enable))

	     (setq default-input-method "pyim")

	     ;; 我使用全拼
	     (setq pyim-default-scheme 'quanpin)

	     ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
	     ;; 我自己使用的中英文动态切换规则是：
	     ;; 1. 光标只有在注释里面时，才可以输入中文。
	     ;; 2. 光标前是汉字字符时，才能输入中文。
	     ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
	     (setq-default pyim-english-input-switch-functions
			   '(pyim-probe-dynamic-english
			     pyim-probe-isearch-mode
			     pyim-probe-program-mode
			     pyim-probe-org-structure-template))

	     (setq-default pyim-punctuation-half-width-functions
			   '(pyim-probe-punctuation-line-beginning
			     pyim-probe-punctuation-after-punctuation))

	     ;; 开启拼音搜索功能
	     (pyim-isearch-mode 1)

	     ;; 使用 popup-el 来绘制选词框, 如果用 emacs26, 建议设置
	     ;; 为 'posframe, 速度很快并且菜单不会变形，不过需要用户
	     ;; 手动安装 posframe 包。
	     (setq pyim-page-tooltip 'posframe)

	     ;; 选词框显示5个候选词
	     (setq pyim-page-length 5)

	     :bind
	     (("M-j" . pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
	      ("C-;" . pyim-delete-word-from-personal-buffer)))


(require 'posframe)
(set-face-attribute 'pyim-page t :foreground "#acdccc")


;; emacs daemon 模式忽略了主题和字体的配置
(defun load-theme-font (frame)
 (select-frame frame)
 (load-theme 'sanityinc-solarized-dark t))

;(if (daemonp)
;    (add-hook 'after-make-frame-functions #'load-theme-font)
;  (load-theme 'sanityinc-solarized-dark t))

(menu-bar-mode -1)

(defun my-python-mode-action ()
  (make-local-variable 'before-save-hook)
  (add-hook 'before-save-hook (lambda ()
                                (save-restriction
                                  (widen)
                                  (untabify (point-min) (point-max))))))

(add-hook 'python-mode-hook 'my-python-mode-action)

(setq-local auto-hscroll-mode 'current-line)
