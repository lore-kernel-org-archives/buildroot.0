From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 23 Nov 2019 12:20:33 -0800
Subject: [Buildroot] [PATCH v2 2/3] package/php: add option to force
 building the shared library
In-Reply-To: <20191123202034.1397950-1-aduskett@gmail.com>
References: <20191123202034.1397950-1-aduskett@gmail.com>
Message-ID: <20191123202034.1397950-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The uWSGI plugin requires libphp7.so to build. This option forces PHP to build
the libphp7.so file.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/php/Config.in | 9 +++++++++
 package/php/php.mk    | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 2469573541..f2ccf8a5c4 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -19,6 +19,15 @@ config BR2_PACKAGE_PHP
 
 if BR2_PACKAGE_PHP
 
+config BR2_PACKAGE_PHP_BUILD_SHARED_LIBRARY
+	bool "Build the shared library"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Build the libphp7.so file.
+
+comment "Building the shared library needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_PHP_SAPI_APACHE
 	bool "Apache interface"
 	depends on BR2_PACKAGE_APACHE
diff --git a/package/php/php.mk b/package/php/php.mk
index 9589530101..6570fccc6f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -122,6 +122,10 @@ PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_MBSTRING),--enable-mbstring) \
 	$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
+ifeq ($(BR2_PACKAGE_PHP_BUILD_SHARED_LIBRARY),y)
+PHP_CONF_OPTS += --enable-embed=shared
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
 PHP_CONF_OPTS += --with-mcrypt=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += libmcrypt
-- 
2.23.0
