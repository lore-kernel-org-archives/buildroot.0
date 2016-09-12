From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 12 Sep 2016 23:31:07 +0200
Subject: [Buildroot] [PATCH v2 1/1] php: rework selection of interfaces
Message-ID: <1473715867-17245-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following suggestion of Yann Morin, rework selection of php interfaces:
use booleans instead of choice to be able to select multiple interfaces
as they are not exclusive

The choice was introduced in commit fcdc9f891 to make sure at least one
SAPI option was selected. Here, we use an auxiliary symbol
BR2_PACKAGE_PHP_HAS_SAPI and CGI will be selected if this symbol is not
set.

It should be noted that previously CGI and FPM could not be selected at
the same time. This is now possible. Bug that prevented compilation of
CGI and FPM binaries at the same time has been fixed since PHP 5.4
(https://github.com/php-build/php-build/issues/101)

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Update commit message
 - Add more comments on BR2_PACKAGE_PHP_HAS_SAPI
 - Add "interface" to SAPI option prompt
 - Explicitly reference in commit message that bug that prevented
   compilation of CGI and FPM binaries at the same time has been
   fixed since PHP 5.4
 - Move user-settable option BR2_PACKAGE_PHP_SAPI_CLI_CGI and
   BR2_PACKAGE_PHP_SAPI_CLI_FPM to Config.in.legacy
 - Explicitly set --enable-cgi and --enable-cli in php.mk

 Config.in.legacy      | 16 ++++++++++++++++
 package/php/Config.in | 47 +++++++++--------------------------------------
 package/php/php.mk    |  8 ++++----
 3 files changed, 29 insertions(+), 42 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 60d414b..6e7b6d9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -169,6 +169,22 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL
 	  In case you were using this option during development of your
 	  Linux kernel, use the override mechanism instead.
 
+config BR2_PACKAGE_PHP_SAPI_CLI_CGI
+	bool "PHP CGI and CLI option is split up"
+	select BR2_PACKAGE_PHP_SAPI_CLI
+	select BR2_PACKAGE_PHP_SAPI_CGI
+	help
+	  The PHP Interface options have been split up into a
+	  separate option for each interface.
+
+config BR2_PACKAGE_PHP_SAPI_CLI_FPM
+	bool "PHP CLI and FPM option is split up"
+	select BR2_PACKAGE_PHP_SAPI_CLI
+	select BR2_PACKAGE_PHP_SAPI_FPM
+	help
+	  The PHP Interface options have been split up into a
+	  separate option for each interface.
+
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
diff --git a/package/php/Config.in b/package/php/Config.in
index eee8d26..8ef0d86 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PHP
 	bool "php"
+	select BR2_PACKAGE_PHP_SAPI_CGI if !BR2_PACKAGE_PHP_HAS_SAPI
 	help
 	  PHP  is a widely-used general-purpose scripting
 	  language that is especially suited for Web development
@@ -9,61 +10,31 @@ config BR2_PACKAGE_PHP
 
 if BR2_PACKAGE_PHP
 
-config BR2_PACKAGE_PHP_CLI
+# Helper to make sure at least one interface is selected.
+# All SAPI options except CGI will select this symbol.
+config BR2_PACKAGE_PHP_HAS_SAPI
 	bool
 
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
+	select BR2_PACKAGE_PHP_HAS_SAPI
 	help
 	  Command Line Interface
 
 config BR2_PACKAGE_PHP_SAPI_FPM
-	bool "FPM"
+	bool "FPM interface"
 	depends on BR2_USE_MMU
-	select BR2_PACKAGE_PHP_FPM
+	select BR2_PACKAGE_PHP_HAS_SAPI
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
index 7df10be..2a7e2cd 100644
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
@@ -280,7 +280,7 @@ PHP_CONF_OPTS += \
 PHP_DEPENDENCIES += jpeg libpng freetype
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_FPM),y)
+ifeq ($(BR2_PACKAGE_PHP_SAPI_FPM),y)
 define PHP_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(@D)/sapi/fpm/init.d.php-fpm \
 		$(TARGET_DIR)/etc/init.d/S49php-fpm
-- 
2.5.0
