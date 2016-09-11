From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 12 Sep 2016 00:26:06 +0200
Subject: [Buildroot] [PATCH 2/4] php: rework selection of interfaces
In-Reply-To: <1473632768-53238-1-git-send-email-fabrice.fontaine@orange.com>
References: <1473632768-53238-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <1473632768-53238-2-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following suggestion of Yann Morin, rework selection of php interfaces:
use booleans instead of choice to be able to select multiple interfaces
as they are not exclusive

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/php/Config.in | 40 +++++-----------------------------------
 package/php/php.mk    |  8 ++++----
 2 files changed, 9 insertions(+), 39 deletions(-)

diff --git a/package/php/Config.in b/package/php/Config.in
index eee8d26..c90ad4f 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PHP
 	bool "php"
+	select BR2_PACKAGE_PHP_SAPI_CGI if !BR2_PACKAGE_PHP_HAS_SAPI
 	help
 	  PHP  is a widely-used general-purpose scripting
 	  language that is especially suited for Web development
@@ -9,61 +10,30 @@ config BR2_PACKAGE_PHP
 
 if BR2_PACKAGE_PHP
 
-config BR2_PACKAGE_PHP_CLI
+# Helper to make sure at least one interface is selected.
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
 	bool "CGI"
 	# CGI uses fork()
 	depends on BR2_USE_MMU
-	select BR2_PACKAGE_PHP_CGI
 	help
 	  Common Gateway Interface
 
 config BR2_PACKAGE_PHP_SAPI_CLI
 	bool "CLI"
-	select BR2_PACKAGE_PHP_CLI
+	select BR2_PACKAGE_PHP_HAS_SAPI
 	help
 	  Command Line Interface
 
 config BR2_PACKAGE_PHP_SAPI_FPM
 	bool "FPM"
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
index 7df10be..97e3396 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -77,9 +77,9 @@ else
 PHP_CONF_ENV += ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=no
 endif
 
-PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
-PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
-PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
+PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CLI),,--disable-cli)
+PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CGI),,--disable-cgi)
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
