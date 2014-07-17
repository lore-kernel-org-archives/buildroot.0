From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Jul 2014 18:20:15 -0300
Subject: [Buildroot] [PATCH 3/3] php-memcached: new package
In-Reply-To: <1405632015-22462-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405632015-22462-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1405632015-22462-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                      |  1 +
 package/php-memcached/Config.in        | 17 +++++++++++++++++
 package/php-memcached/php-memcached.mk | 27 +++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 package/php-memcached/Config.in
 create mode 100644 package/php-memcached/php-memcached.mk

diff --git a/package/Config.in b/package/Config.in
index 60398c8..0cacf31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -446,6 +446,7 @@ menu "External php extensions"
 	source "package/php-geoip/Config.in"
 	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
+	source "package/php-memcached/Config.in"
 	source "package/php-ssh2/Config.in"
 	source "package/php-yaml/Config.in"
 	source "package/php-zmq/Config.in"
diff --git a/package/php-memcached/Config.in b/package/php-memcached/Config.in
new file mode 100644
index 0000000..c9f4b7d
--- /dev/null
+++ b/package/php-memcached/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PHP_MEMCACHED
+	bool "php-memcached"
+	depends on BR2_INSTALL_LIBSTDCPP # libmemcached
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libmemcached
+	depends on BR2_TOOLCHAIN_USES_GLIBC # libmemcached
+	select BR2_PACKAGE_PHP_EXT_SESSION
+	select BR2_PACKAGE_LIBMEMCACHED
+	select BR2_PACKAGE_ZLIB
+	help
+	  PHP extension for interfacing with memcached via
+	  libmemcached library.
+
+	  http://pecl.php.net/package/memcached
+
+comment "php-memcached needs a (e)glibc toolchain w/ C++, threads"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
new file mode 100644
index 0000000..866e18c
--- /dev/null
+++ b/package/php-memcached/php-memcached.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# php-memcached
+#
+################################################################################
+
+PHP_MEMCACHED_VERSION = 2.2.0
+PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
+PHP_MEMCACHED_SITE = http://pecl.php.net/get
+PHP_MEMCACHED_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--disable-memcached-sasl \
+	--with-libmemcached-dir=$(STAGING_DIR)/usr
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
1.8.5.5
