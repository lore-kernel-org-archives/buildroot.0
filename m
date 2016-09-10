From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Sep 2016 21:17:15 +0200
Subject: [Buildroot] [PATCH v3,2/2] php: add apache support
In-Reply-To: <1473535035-130056-1-git-send-email-fabrice.fontaine@orange.com>
References: <1473535035-130056-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <1473535035-130056-2-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Continue work started by Bernd Kuhls in
https://patchwork.ozlabs.org/patch/437544/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Remove unneeded php-04-apache.patch
 - Fix pthread detection if Apache MPM is event or worker
 - Update pthread detection mechanism (--enable-pthreads does not exist
   anymore)
 - Remove unneeded --oldincludedir
 - Fix php module path

 package/php/Config.in | 17 +++++++++++++++++
 package/php/php.mk    | 31 +++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index eee8d26..5f5a976 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -9,6 +9,9 @@ config BR2_PACKAGE_PHP
 
 if BR2_PACKAGE_PHP
 
+config BR2_PACKAGE_PHP_APACHE
+	bool
+
 config BR2_PACKAGE_PHP_CLI
 	bool
 
@@ -24,6 +27,20 @@ choice
 	help
 	  Select the PHP interface(s).
 
+config BR2_PACKAGE_PHP_SAPI_APACHE
+	bool "Apache"
+	select BR2_PACKAGE_APACHE
+	select BR2_PACKAGE_PHP_APACHE
+	depends on !BR2_STATIC_LIBS # apache
+	depends on BR2_TOOLCHAIN_HAS_THREADS # apache
+	depends on BR2_USE_MMU # apr
+	help
+	  Apache module
+
+comment "apache module needs a toolchain w/ dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_PHP_SAPI_CGI
 	bool "CGI"
 	# CGI uses fork()
diff --git a/package/php/php.mk b/package/php/php.mk
index 7df10be..083cd58 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -81,6 +81,37 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
 
+ifeq ($(BR2_PACKAGE_PHP_APACHE),y)
+PHP_DEPENDENCIES += apache
+
+PHP_CONF_OPTS += \
+	--with-apxs2=$(STAGING_DIR)/usr/bin/apxs \
+	--with-config-file-path=/etc/apache2 \
+	--with-config-file-scan-dir=/etc/apache2/php \
+	--localstatedir=/var
+
+# PHP assumes pthreads are not working when cross-compiling,
+# needed for Apache-MPM event or worker
+ifeq ($(BR2_PACKAGE_APACHE_EVENT)$(BR2_PACKAGE_APACHE_WORKER),y)
+PHP_CONF_ENV += ac_cv_pthreads_lib=pthread
+PHP_CONF_OPTS += --enable-maintainer-zts
+
+define PHP_FIX_THREADS_DETECTION
+	$(SED) 's/pthreads_working\=no/pthreads_working\=yes/' $(@D)/configure
+endef
+
+PHP_PRE_CONFIGURE_HOOKS += PHP_FIX_THREADS_DETECTION
+endif
+
+# PHP sets a full path with $(TARGET_DIR) for libphp module instead of a
+# relative path
+define PHP_FIX_MODULE_PATH
+	$(SED) 's:$(TARGET_DIR)/usr/::' $(TARGET_DIR)/etc/apache2/httpd.conf
+endef
+
+PHP_POST_INSTALL_TARGET_HOOKS += PHP_FIX_MODULE_PATH
+endif
+
 ### Extensions
 PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
-- 
2.5.0
