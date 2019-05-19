From: Dan Walkes <danwalkes@trellis-logic.com>
Date: Sat, 18 May 2019 18:19:42 -0600
Subject: [Buildroot] [PATCH] package/php: support --with-config-file-scan-dir
Message-ID: <1558225183-10288-1-git-send-email-danwalkes@trellis-logic.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To support using multiple php configuration files, allow
setting of a config file scan director via menuconfig.

For php option details see link at [1].

[1] https://www.php.net/manual/en/configuration.file.php

Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
---
 package/php/Config.in | 5 +++++
 package/php/php.mk    | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 2469573..6157d4a 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -45,6 +45,11 @@ config BR2_PACKAGE_PHP_SAPI_FPM
 	help
 	  PHP-FPM (FastCGI Process Manager)
 
+config BR2_PACKAGE_PHP_WITH_CONFIG_FILE_SCAN_DIR
+	string "Specify --with-config-file-scan-dir"
+	help
+	  An additional directory containing php.ini files (e.g. /etc/php.d)
+
 source "package/php/Config.ext"
 
 endif
diff --git a/package/php/php.mk b/package/php/php.mk
index ed71c96..24499e8 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -318,6 +318,10 @@ PHP_CONF_OPTS += \
 PHP_DEPENDENCIES += jpeg libpng freetype
 endif
 
+ifneq ($(call qstrip,$(BR2_PACKAGE_PHP_WITH_CONFIG_FILE_SCAN_DIR)),)
+PHP_CONF_OPTS += --with-config-file-scan-dir=$(BR2_PACKAGE_PHP_WITH_CONFIG_FILE_SCAN_DIR)
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_SAPI_FPM),y)
 define PHP_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(@D)/sapi/fpm/init.d.php-fpm \
-- 
2.7.4
