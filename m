From: Tom Marcuzzi <tom.marcuzzi@orolia.com>
Date: Tue, 28 Jul 2020 18:31:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: add FFI support
Message-ID: <20200728163125.2489208-1-tom.marcuzzi@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
---
 package/php/Config.ext | 6 ++++++
 package/php/php.mk     | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index b0ab2c9ec7..f8beb25afb 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -427,4 +427,10 @@ config BR2_PACKAGE_PHP_EXT_XSL
 	help
 	  XSL transformation support
 
+config BR2_PACKAGE_PHP_EXT_FFI
+	bool "FFI"
+	select BR2_PACKAGE_LIBFFI
+	help
+	  Foreign Function Interface support
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
-- 
2.25.1
