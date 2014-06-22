From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 21:55:32 +0200
Subject: [Buildroot] [git commit] php-geoip: new package
Message-ID: <20140622195538.731B09D063@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2aada709eff0cbc8d6a7688cd9d71c2b932100f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/php-geoip/Config.in    |    8 ++++++++
 package/php-geoip/php-geoip.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4718719..498630f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -430,6 +430,7 @@ endif
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
