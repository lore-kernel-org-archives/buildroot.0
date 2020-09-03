From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 22:10:22 +0200
Subject: [Buildroot] [git commit] package/php-xdebug: new package
Message-ID: <20200903200232.E3DD687163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b7dffd0984e1b274273f5638a975165606384f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Extension for PHP to assist with debugging and development.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/php-xdebug/Config.in       |  6 ++++++
 package/php-xdebug/php-xdebug.hash |  3 +++
 package/php-xdebug/php-xdebug.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 677350a555..06b2b2f6a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1916,6 +1916,9 @@ N:	Nicholas Sielicki <sielicki@yandex.com>
 F:	board/intel/galileo/
 F:	configs/galileo_defconfig
 
+N:	Nicolas Carrier <nicolas.carrier@orolia.com>
+F:	package/php-xdebug/
+
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
 
diff --git a/package/Config.in b/package/Config.in
index 8c2726b4ce..bbbd2a3642 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -837,6 +837,7 @@ menu "External php extensions"
 	source "package/php-imagick/Config.in"
 	source "package/php-memcached/Config.in"
 	source "package/php-ssh2/Config.in"
+	source "package/php-xdebug/Config.in"
 	source "package/php-yaml/Config.in"
 	source "package/php-zmq/Config.in"
 endmenu
diff --git a/package/php-xdebug/Config.in b/package/php-xdebug/Config.in
new file mode 100644
index 0000000000..b5919e06cd
--- /dev/null
+++ b/package/php-xdebug/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PHP_XDEBUG
+	bool "php-xdebug"
+	help
+	  Extension for PHP to assist with debugging and development.
+
+	  http://xdebug.org
diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
new file mode 100644
index 0000000000..8b90352ebf
--- /dev/null
+++ b/package/php-xdebug/php-xdebug.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
+sha256 e330c5ccb77890b06dd7bf093567051450b2438b79fed8e7e6c4834278d46092  php-xdebug-2.9.6.tar.gz
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
new file mode 100644
index 0000000000..ab6ade4cb1
--- /dev/null
+++ b/package/php-xdebug/php-xdebug.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# php-xdebug
+#
+################################################################################
+
+PHP_XDEBUG_VERSION = 2.9.6
+PHP_XDEBUG_SITE = $(call github,xdebug,xdebug,$(PHP_XDEBUG_VERSION))
+PHP_XDEBUG_INSTALL_STAGING = YES
+PHP_XDEBUG_LICENSE = Xdebug License (PHP-3.0-like)
+PHP_XDEBUG_LICENSE_FILES = LICENSE
+# phpize does the autoconf magic
+PHP_XDEBUG_DEPENDENCIES = php host-autoconf
+PHP_XDEBUG_CONF_OPTS = \
+	--enable-xdebug \
+	--with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--with-xdebug=$(STAGING_DIR)/usr
+
+define PHP_XDEBUG_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_XDEBUG_PRE_CONFIGURE_HOOKS += PHP_XDEBUG_PHPIZE
+
+$(eval $(autotools-package))
