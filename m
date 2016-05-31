From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:32:12 +0200
Subject: [Buildroot] [git commit] php-memcached: re add package,
	now compatible with PHP 7
Message-ID: <20160601161312.4EBF8802A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96ad5fa0529b03f8a2aba0c7ec0d61fe2c8f3d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Related: https://bugs.php.net/bug.php?id=70751

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/php-memcached/Config.in          | 15 +++++++++++++++
 package/php-memcached/php-memcached.hash |  2 ++
 package/php-memcached/php-memcached.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7421bc2..0eeb6c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -616,6 +616,7 @@ menu "External php extensions"
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
