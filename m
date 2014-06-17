From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 11:39:23 -0300
Subject: [Buildroot] [PATCHv2 2/2] php-geoip: new package
In-Reply-To: <1403015963-27278-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403015963-27278-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403015963-27278-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in              |  1 +
 package/php-geoip/Config.in    |  8 ++++++++
 package/php-geoip/php-geoip.mk | 26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/php-geoip/Config.in
 create mode 100644 package/php-geoip/php-geoip.mk

diff --git a/package/Config.in b/package/Config.in
index d9bd23d..8bdbe4c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -429,6 +429,7 @@ endif
 if BR2_PACKAGE_PHP
 if !BR2_PREFER_STATIC_LIB
 menu "External php extensions"
+	source "package/php-geoip/Config.in"
 	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
 	source "package/php-ssh2/Config.in"
diff --git a/package/php-geoip/Config.in b/package/php-geoip/Config.in
new file mode 100644
index 0000000..adb2046
--- /dev/null
+++ b/package/php-geoip/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PHP_GEOIP
+	bool "php-geoip"
+	depends on BR2_PACKAGE_PHP
+	select BR2_PACKAGE_GEOIP
+	help
+	  PHP GeoIP-based IP address mapper to geographical places.
+
+	  http://pecl.php.net/package/geoip
diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
new file mode 100644
index 0000000..99f74e0
--- /dev/null
+++ b/package/php-geoip/php-geoip.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# php-geoip
+#
+################################################################################
+
+PHP_GEOIP_VERSION = 1.1.0
+PHP_GEOIP_SOURCE = geoip-$(PHP_GEOIP_VERSION).tgz
+PHP_GEOIP_SITE = http://pecl.php.net/get
+PHP_GEOIP_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--with-geoip=$(STAGING_DIR)/usr
+# phpize does the autoconf magic
+PHP_GEOIP_DEPENDENCIES = geoip php host-autoconf
+PHP_GEOIP_LICENSE = PHP
+PHP_GEOIP_LICENSE_FILES = LICENSE
+
+define PHP_GEOIP_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_GEOIP_PRE_CONFIGURE_HOOKS += PHP_GEOIP_PHPIZE
+
+$(eval $(autotools-package))
-- 
1.8.5.5
