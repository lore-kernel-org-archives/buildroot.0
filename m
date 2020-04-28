From: Tom Marcuzzi <tom.marcuzzi@orolia.com>
Date: Tue, 28 Apr 2020 10:56:01 +0200
Subject: [Buildroot] [PATCH] package/php: add FFI support
Message-ID: <20200428085601.15825-1-tom.marcuzzi@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/php/Config.ext | 6 ++++++
 package/php/php.mk     | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 66ee935cf0..fc28a523e1 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -425,4 +425,10 @@ config BR2_PACKAGE_PHP_EXT_XSL
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
index 4d2f1b8f63..fd78b36b51 100644
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
2.17.1
