From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 25 Oct 2019 18:11:08 +0000
Subject: [Buildroot] [PATCH v3 2/2] package/php-xdebug: new package
In-Reply-To: <20191025181045.11182-1-nicolas.carrier@orolia.com>
References: <20191025181045.11182-1-nicolas.carrier@orolia.com>
Message-ID: <20191025181045.11182-2-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extension for PHP to assist with debugging and development.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---

Changes v2 -> v3:
  - sorted correctly the new entry in the top level Config.in
  - use the AUTOCONF and AUTOHEADER variables from automake.mk

Changes v1 -> v2:
  - move xdebug to php extensions submenu, with the following two consequences:
        - makes it dependent on php
        - makes it wrapped inside !STATIC test
  - removed empty line in Config.in
  - removed Web page: prefix in help string
  - one option per line in PHP_XDEBUG_CONF_OPTS
  - renamed to php-xdebug
  - changed license to `Xdebug License (PHP-3.0-like)`

---
 package/Config.in                  |  1 +
 package/php-xdebug/Config.in       |  6 ++++++
 package/php-xdebug/php-xdebug.hash |  3 +++
 package/php-xdebug/php-xdebug.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/php-xdebug/Config.in
 create mode 100644 package/php-xdebug/php-xdebug.hash
 create mode 100644 package/php-xdebug/php-xdebug.mk

diff --git a/package/Config.in b/package/Config.in
index d78b4c444b..4f1b80a8e4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -801,6 +801,7 @@ menu "External php extensions"
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
index 0000000000..d645142efc
--- /dev/null
+++ b/package/php-xdebug/php-xdebug.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
+sha256 b2aeb55335c5649034fe936abb90f61df175c4f0a0f0b97a219b3559541edfbd  php-xdebug-2.7.2.tar.gz
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
new file mode 100644
index 0000000000..a77bbeee90
--- /dev/null
+++ b/package/php-xdebug/php-xdebug.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# php-xdebug
+#
+################################################################################
+
+PHP_XDEBUG_VERSION = 2.7.2
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
+		PHP_AUTOCONF=$(AUTOCONF) \
+		PHP_AUTOHEADER=$(AUTOHEADER) \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_XDEBUG_PRE_CONFIGURE_HOOKS += PHP_XDEBUG_PHPIZE
+
+$(eval $(autotools-package))
-- 
2.20.1
