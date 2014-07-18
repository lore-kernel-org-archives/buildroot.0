From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 00:32:44 +0200
Subject: [Buildroot] [git commit] php-memcached: new package
Message-ID: <20140718223552.7DE2F9C769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e30868be1f2ff19b8d64bf94efa4271d353e33fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/php-memcached/Config.in        |   17 +++++++++++++++++
 package/php-memcached/php-memcached.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 017d050..db2d114 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -449,6 +449,7 @@ menu "External php extensions"
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
