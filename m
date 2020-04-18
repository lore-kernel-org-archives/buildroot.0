From: Louis Aussedat <aussedat.louis@gmail.com>
Date: Sat, 18 Apr 2020 11:03:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/php: fix gd dependencies
In-Reply-To: <20200418090343.140078-1-aussedat.louis@gmail.com>
References: <20200418090343.140078-1-aussedat.louis@gmail.com>
Message-ID: <20200418090343.140078-2-aussedat.louis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to migration to pkg-config in php 7.4, the detection of
library dependencies has been changed.

source from php.net:
--with-gd becomes --enable-gd
--with-png-dir has been removed. libpng is required.
--with-zlib-dir has been removed. zlib is required.
--with-freetype-dir becomes --with-freetype
--with-jpeg-dir becomes --with-jpeg

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
---
 package/php/Config.ext |  1 +
 package/php/php.mk     | 10 ++++------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 193bc1bd03..66ee935cf0 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -256,6 +256,7 @@ config BR2_PACKAGE_PHP_EXT_GD
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
 	help
 	  GD support
 
diff --git a/package/php/php.mk b/package/php/php.mk
index 8282bb1cc7..4d2f1b8f63 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -327,12 +327,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GD),y)
 PHP_CONF_OPTS += \
-	--with-gd \
-	--with-jpeg-dir=$(STAGING_DIR)/usr \
-	--with-png-dir=$(STAGING_DIR)/usr \
-	--with-zlib-dir=$(STAGING_DIR)/usr \
-	--with-freetype-dir=$(STAGING_DIR)/usr
-PHP_DEPENDENCIES += jpeg libpng freetype
+	--enable-gd \
+	--with-jpeg \
+	--with-freetype
+PHP_DEPENDENCIES += jpeg libpng freetype zlib
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_SAPI_FPM),y)
-- 
2.26.0
