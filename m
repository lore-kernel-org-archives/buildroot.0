From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 18 Apr 2016 12:55:14 +0100
Subject: [Buildroot] [PATCH v2 7/8] php-ssh2: re add package,
	now compatible with PHP 7
Message-ID: <1460980514-964-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Related: https://bugs.php.net/bug.php?id=71376

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/Config.in              |  1 +
 package/php-ssh2/Config.in     |  8 ++++++++
 package/php-ssh2/php-ssh2.hash |  2 ++
 package/php-ssh2/php-ssh2.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/php-ssh2/Config.in
 create mode 100644 package/php-ssh2/php-ssh2.hash
 create mode 100644 package/php-ssh2/php-ssh2.mk

diff --git a/package/Config.in b/package/Config.in
index 172a570..c04fbf6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -614,6 +614,7 @@ menu "External php extensions"
 	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
 	source "package/php-memcached/Config.in"
+	source "package/php-ssh2/Config.in"
 	source "package/php-zmq/Config.in"
 endmenu
 endif
diff --git a/package/php-ssh2/Config.in b/package/php-ssh2/Config.in
new file mode 100644
index 0000000..b457900
--- /dev/null
+++ b/package/php-ssh2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PHP_SSH2
+	bool "php-ssh2"
+	depends on BR2_PACKAGE_PHP
+	select BR2_PACKAGE_LIBSSH2
+	help
+	  PHP bindings for the libssh2 library.
+
+	  http://pecl.php.net/package/ssh2
diff --git a/package/php-ssh2/php-ssh2.hash b/package/php-ssh2/php-ssh2.hash
new file mode 100644
index 0000000..1e046df
--- /dev/null
+++ b/package/php-ssh2/php-ssh2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 877f2fa9a709aa2dd9567848fae7b45ecac359904296a0aedbf718e99d8568f5  php-ssh2-aa1739ac26c2177d33ab8d064021032bdc2c3a40.tar.gz
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
new file mode 100644
index 0000000..cfe6070
--- /dev/null
+++ b/package/php-ssh2/php-ssh2.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# php-ssh2
+#
+################################################################################
+
+PHP_SSH2_VERSION = aa1739ac26c2177d33ab8d064021032bdc2c3a40
+PHP_SSH2_SITE = $(call github,php,pecl-networking-ssh2,$(PHP_SSH2_VERSION))
+PHP_SSH2_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--with-ssh2=$(STAGING_DIR)/usr
+# phpize does the autoconf magic
+PHP_SSH2_DEPENDENCIES = libssh2 php host-autoconf
+PHP_SSH2_LICENSE = PHP
+PHP_SSH2_LICENSE_FILES = LICENSE
+
+define PHP_SSH2_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_SSH2_PRE_CONFIGURE_HOOKS += PHP_SSH2_PHPIZE
+
+$(eval $(autotools-package))
-- 
2.7.3
