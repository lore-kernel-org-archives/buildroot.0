From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Feb 2014 13:34:11 -0000
Subject: [Buildroot] [git commit] php-imagick: new package
Message-ID: <20140228133411.1F1EF9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d27ff2fe0ce7e455aef93ffc58c6e4150ab49d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                  |    1 +
 package/php-imagick/Config.in      |    8 ++++++++
 package/php-imagick/php-imagick.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1fd4719..19c9c4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -397,6 +397,7 @@ source "package/php/Config.in"
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
