From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Dec 2016 18:21:02 +0100
Subject: [Buildroot] [PATCH v5,1/1] php: add apache support
Message-ID: <1481476862-7791-1-git-send-email-fabrice.fontaine@orange.com>
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
Changes v4 -> v5 (after review of Arnout Vandecappelle):
 - Patch on pthread detection has been merged upstream and is available
   in php 7.0.14 so https://patchwork.ozlabs.org/patch/670567/
   has been set as "Not Applicable"
 - Remove hook added in v4 and let php updates the apache configuration
   file
 - Patch apxs configuration file to update httpd.conf in the target
   directory with the correct relative path. Without these hooks, apxs
   will only update correctly the httpd.conf in the staging directory

Changes v3 -> v4 (after review of Yann Morin):
 - Do not select apache but depends on it
 - Move pthread detection fix in a separate patch
 - Remove unneeded configuration options such as --with-config-file-path
 - Do not allow php to update apache configuration file by removing -a
   argument from apxs call

Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Remove unneeded php-04-apache.patch
 - Fix pthread detection if Apache MPM is event or worker
 - Update pthread detection mechanism (--enable-pthreads does not exist
   anymore)
 - Remove unneeded --oldincludedir
 - Fix php module path

 package/php/Config.in |  8 ++++++++
 package/php/php.mk    | 27 +++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 57dabc4..ef3a2d9 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PHP
 	bool "php"
 	select BR2_PACKAGE_PHP_SAPI_CGI if \
+	       !BR2_PACKAGE_PHP_SAPI_APACHE && \
 	       !BR2_PACKAGE_PHP_SAPI_CLI && \
 	       !BR2_PACKAGE_PHP_SAPI_FPM &&  \
 	       BR2_USE_MMU
@@ -14,6 +15,13 @@ config BR2_PACKAGE_PHP
 
 if BR2_PACKAGE_PHP
 
+config BR2_PACKAGE_PHP_SAPI_APACHE
+	bool "Apache interface"
+	depends on BR2_PACKAGE_APACHE
+	select BR2_PACKAGE_PHP_HAS_SAPI
+	help
+	  Apache module
+
 config BR2_PACKAGE_PHP_SAPI_CGI
 	bool "CGI interface"
 	# CGI uses fork()
diff --git a/package/php/php.mk b/package/php/php.mk
index 8c1ccef..4f8276d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -81,6 +81,33 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CLI),--enable-cli,--disable-cli)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CGI),--enable-cgi,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_FPM),--enable-fpm,--disable-fpm)
 
+ifeq ($(BR2_PACKAGE_PHP_SAPI_APACHE),y)
+PHP_DEPENDENCIES += apache
+PHP_CONF_OPTS += --with-apxs2=$(STAGING_DIR)/usr/bin/apxs
+
+# Enable thread safety option if Apache MPM is event or worker
+ifeq ($(BR2_PACKAGE_APACHE_MPM_EVENT)$(BR2_PACKAGE_APACHE_MPM_WORKER),y)
+PHP_CONF_OPTS += --enable-maintainer-zts
+endif
+
+# apxs configuration must be patched to update the httpd.conf in the
+# target directory with the correct relative path. Without these hooks,
+# apxs will only update correctly the httpd.conf in the staging directory.
+define PHP_SET_TARGET_PREFIX_APXS
+	$(SED) 's%^prefix =.*%prefix = $(TARGET_DIR)/usr%' \
+		$(STAGING_DIR)/usr/build/config_vars.mk
+endef
+
+PHP_PRE_INSTALL_TARGET_HOOKS += PHP_SET_TARGET_PREFIX_APXS
+
+define PHP_SET_STAGING_PREFIX_APXS
+	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' \
+		$(STAGING_DIR)/usr/build/config_vars.mk
+endef
+
+PHP_POST_INSTALL_TARGET_HOOKS += PHP_SET_STAGING_PREFIX_APXS
+endif
+
 ### Extensions
 PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
-- 
2.5.0
