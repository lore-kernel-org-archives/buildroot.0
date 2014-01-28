From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jan 2014 18:26:31 -0300
Subject: [Buildroot] [PATCH 6/6] php-imagick: new package
In-Reply-To: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
References: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1390944391-3892-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                  |  1 +
 package/php-imagick/Config.in      |  8 ++++++++
 package/php-imagick/php-imagick.mk | 26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/php-imagick/Config.in
 create mode 100644 package/php-imagick/php-imagick.mk

diff --git a/package/Config.in b/package/Config.in
index 7878b53..a4b9ce3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -398,6 +398,7 @@ source "package/php/Config.in"
 if BR2_PACKAGE_PHP
 if !BR2_PREFER_STATIC_LIB
 menu "External php extensions"
+source "package/php-imagick/Config.in"
 source "package/php-ssh2/Config.in"
 source "package/php-yaml/Config.in"
 source "package/php-zmq/Config.in"
diff --git a/package/php-imagick/Config.in b/package/php-imagick/Config.in
new file mode 100644
index 0000000..1d55fcc
--- /dev/null
+++ b/package/php-imagick/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PHP_IMAGICK
+	bool "php-imagick"
+	depends on BR2_PACKAGE_PHP
+	select BR2_PACKAGE_IMAGEMAGICK
+	help
+	  PHP wrapper to the ImageMagick library.
+
+	  http://pecl.php.net/package/imagick
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
new file mode 100644
index 0000000..148d519
--- /dev/null
+++ b/package/php-imagick/php-imagick.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# php-imagick
+#
+################################################################################
+
+PHP_IMAGICK_VERSION = 3.1.2
+PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
+PHP_IMAGICK_SITE = http://pecl.php.net/get
+PHP_IMAGICK_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--with-imagick=$(STAGING_DIR)/usr
+# phpize does the autoconf magic
+PHP_IMAGICK_DEPENDENCIES = imagemagick php host-autoconf
+PHP_IMAGICK_LICENSE = PHP
+PHP_IMAGICK_LICENSE_FILES = LICENSE
+
+define PHP_IMAGICK_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_IMAGICK_PRE_CONFIGURE_HOOKS += PHP_IMAGICK_PHPIZE
+
+$(eval $(autotools-package))
-- 
1.8.3.2
