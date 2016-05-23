From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 May 2016 15:51:34 +0100
Subject: [Buildroot] [PATCH v3 next 3/5] php-memcached: re add package,
	now compatible with PHP 7
In-Reply-To: <1464015096-48578-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464015096-48578-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1464015096-48578-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Related: https://bugs.php.net/bug.php?id=70751

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
 - Nothing.

Changes v1 -> v2:
 - This patch didn't exist.

 package/Config.in                        |  1 +
 package/php-memcached/Config.in          | 15 +++++++++++++++
 package/php-memcached/php-memcached.hash |  2 ++
 package/php-memcached/php-memcached.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/php-memcached/Config.in
 create mode 100644 package/php-memcached/php-memcached.hash
 create mode 100644 package/php-memcached/php-memcached.mk

diff --git a/package/Config.in b/package/Config.in
index edc23ba..7e274f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -615,6 +615,7 @@ menu "External php extensions"
 	source "package/php-geoip/Config.in"
 	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
+	source "package/php-memcached/Config.in"
 	source "package/php-zmq/Config.in"
 endmenu
 endif
diff --git a/package/php-memcached/Config.in b/package/php-memcached/Config.in
new file mode 100644
index 0000000..cd97c15
--- /dev/null
+++ b/package/php-memcached/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PHP_MEMCACHED
+	bool "php-memcached"
+	depends on BR2_INSTALL_LIBSTDCPP # libmemcached
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libmemcached
+	select BR2_PACKAGE_PHP_EXT_SESSION
+	select BR2_PACKAGE_LIBMEMCACHED
+	select BR2_PACKAGE_ZLIB
+	help
+	  PHP extension for interfacing with memcached via
+	  libmemcached library.
+
+	  http://pecl.php.net/package/memcached
+
+comment "php-memcached needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/php-memcached/php-memcached.hash b/package/php-memcached/php-memcached.hash
new file mode 100644
index 0000000..f2a096f
--- /dev/null
+++ b/package/php-memcached/php-memcached.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 73266212e791a4817da06be1daddf9ff7dd5b5b0b650b3fbd0f5fc6ccc18491b  php-memcached-6ee96cad7be5caa1f13a1f3e5a4d5f900b9c04ce.tar.gz
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
new file mode 100644
index 0000000..ea241b2
--- /dev/null
+++ b/package/php-memcached/php-memcached.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# php-memcached
+#
+################################################################################
+
+PHP_MEMCACHED_VERSION = 6ee96cad7be5caa1f13a1f3e5a4d5f900b9c04ce
+PHP_MEMCACHED_SITE = $(call github,php-memcached-dev,php-memcached,$(PHP_MEMCACHED_VERSION))
+PHP_MEMCACHED_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--disable-memcached-sasl \
+	--with-libmemcached-dir=$(STAGING_DIR)/usr \
+	--with-zlib-dir=$(STAGING_DIR)/usr
+# phpize does the autoconf magic
+PHP_MEMCACHED_DEPENDENCIES = libmemcached php zlib host-autoconf host-pkgconf
+PHP_MEMCACHED_LICENSE = MIT
+PHP_MEMCACHED_LICENSE_FILES = LICENSE
+
+define PHP_MEMCACHED_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_MEMCACHED_PRE_CONFIGURE_HOOKS += PHP_MEMCACHED_PHPIZE
+
+$(eval $(autotools-package))
-- 
2.7.3
