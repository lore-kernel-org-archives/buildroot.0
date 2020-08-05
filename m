From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 23:02:54 +0200
Subject: [Buildroot] [git commit] package/php: add FFI extension support
Message-ID: <20200805210223.DDD4A82DE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e16f05c0f00081d446ebee56d9f3ad3cf41da1ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/Config.ext | 10 ++++++++++
 package/php/php.mk     |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index b0ab2c9ec7..b628291f78 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -427,4 +427,14 @@ config BR2_PACKAGE_PHP_EXT_XSL
 	help
 	  XSL transformation support
 
+config BR2_PACKAGE_PHP_EXT_FFI
+	bool "FFI"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBFFI
+	help
+	  Foreign Function Interface support
+
+comment "PHP FFI extension needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 endmenu
diff --git a/package/php/php.mk b/package/php/php.mk
index 48af0f6fdc..1296c50c6d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -333,6 +333,11 @@ PHP_CONF_OPTS += \
 PHP_DEPENDENCIES += jpeg libpng freetype zlib
 endif
 
+ifeq ($(BR2_PACKAGE_PHP_EXT_FFI),y)
+PHP_CONF_OPTS += --with-ffi
+PHP_DEPENDENCIES += libffi
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_SAPI_FPM),y)
 define PHP_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(@D)/sapi/fpm/init.d.php-fpm \
