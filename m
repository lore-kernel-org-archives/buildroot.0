From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 14:46:43 +0200
Subject: [Buildroot] [git commit] php: rework selection of interfaces
Message-ID: <20161024124806.645287FE1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c457213fbca5f3493544c8a4335b623620458b0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following suggestion of Yann Morin, rework selection of php
interfaces: use booleans instead of choice to be able to select
multiple interfaces as they are not exclusive. We make sure at least
one of the options is selected.

It should be noted that previously CGI and FPM could not be selected
at the same time. This is now possible. Bug that prevented compilation
of CGI and FPM binaries at the same time has been fixed since PHP 5.4
(https://github.com/php-build/php-build/issues/101).

Legacy handling is added for the two options that are removed, and the
appropriate new options are selected.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy      | 16 ++++++++++++++++
 package/php/Config.in | 46 ++++++----------------------------------------
 package/php/php.mk    |  8 ++++----
 3 files changed, 26 insertions(+), 44 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f26f97f..50ccedd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,22 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_PHP_SAPI_CLI_CGI
+	bool "PHP CGI and CLI options are now seperate"
+	select BR2_PACKAGE_PHP_SAPI_CLI
+	select BR2_PACKAGE_PHP_SAPI_CGI
+	help
+	  The PHP Interface options have been split up into a
+	  separate option for each interface.
+
+config BR2_PACKAGE_PHP_SAPI_CLI_FPM
+	bool "PHP CLI and FPM options are now separate"
+	select BR2_PACKAGE_PHP_SAPI_CLI
+	select BR2_PACKAGE_PHP_SAPI_FPM
+	help
+	  The PHP Interface options have been split up into a
+	  separate option for each interface.
+
 config BR2_PACKAGE_WVSTREAMS
 	bool "wvstreams removed"
 	select BR2_LEGACY
diff --git a/package/php/Config.in b/package/php/Config.in
index eee8d26..2e9e344 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_PHP
 	bool "php"
+	select BR2_PACKAGE_PHP_SAPI_CGI if \
+	       !BR2_PACKAGE_PHP_SAPI_CLI && \
+	       !BR2_PACKAGE_PHP_SAPI_FPM
 	help
 	  PHP  is a widely-used general-purpose scripting
 	  language that is especially suited for Web development
@@ -9,61 +12,24 @@ config BR2_PACKAGE_PHP
 
 if BR2_PACKAGE_PHP
 
-config BR2_PACKAGE_PHP_CLI
-	bool
-
-config BR2_PACKAGE_PHP_CGI
-	bool
-
-config BR2_PACKAGE_PHP_FPM
-	bool
-
-choice
-	prompt "Interface"
-	default BR2_PACKAGE_PHP_SAPI_CGI
-	help
-	  Select the PHP interface(s).
-
 config BR2_PACKAGE_PHP_SAPI_CGI
-	bool "CGI"
+	bool "CGI interface"
 	# CGI uses fork()
 	depends on BR2_USE_MMU
-	select BR2_PACKAGE_PHP_CGI
 	help
 	  Common Gateway Interface
 
 config BR2_PACKAGE_PHP_SAPI_CLI
-	bool "CLI"
-	select BR2_PACKAGE_PHP_CLI
+	bool "CLI interface"
 	help
 	  Command Line Interface
 
 config BR2_PACKAGE_PHP_SAPI_FPM
-	bool "FPM"
+	bool "FPM interface"
 	depends on BR2_USE_MMU
-	select BR2_PACKAGE_PHP_FPM
 	help
 	  PHP-FPM (FastCGI Process Manager)
 
-config BR2_PACKAGE_PHP_SAPI_CLI_CGI
-	bool "CGI and CLI"
-	# CGI uses fork()
-	depends on BR2_USE_MMU
-	select BR2_PACKAGE_PHP_CLI
-	select BR2_PACKAGE_PHP_CGI
-	help
-	  Command line and Common gateway interfaces
-
-config BR2_PACKAGE_PHP_SAPI_CLI_FPM
-	bool "FPM and CLI"
-	depends on BR2_USE_MMU
-	select BR2_PACKAGE_PHP_CLI
-	select BR2_PACKAGE_PHP_FPM
-	help
-	  Command line and PHP-FPM (FastCGI Process Manager)
-
-endchoice
-
 source "package/php/Config.ext"
 
 endif
diff --git a/package/php/php.mk b/package/php/php.mk
index f925ec1..f85cb37 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -77,9 +77,9 @@ else
 PHP_CONF_ENV += ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=no
 endif
 
-PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
-PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
-PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
+PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CLI),--enable-cli,--disable-cli)
+PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CGI),--enable-cgi,--disable-cgi)
+PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_FPM),--enable-fpm,--disable-fpm)
 
 ### Extensions
 PHP_CONF_OPTS += \
@@ -285,7 +285,7 @@ PHP_CONF_OPTS += \
 PHP_DEPENDENCIES += jpeg libpng freetype
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_FPM),y)
+ifeq ($(BR2_PACKAGE_PHP_SAPI_FPM),y)
 define PHP_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(@D)/sapi/fpm/init.d.php-fpm \
 		$(TARGET_DIR)/etc/init.d/S49php-fpm
