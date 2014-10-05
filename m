From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 19:38:57 +0200
Subject: [Buildroot] [PATCH v2 09/16] package/php: Add support for GD module
In-Reply-To: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412530744-20649-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/Config.ext |    8 ++++++++
 package/php/php.mk     |    8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 6880cd7..f745cc9 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -194,6 +194,14 @@ config BR2_PACKAGE_PHP_EXT_EXIF
 	help
 	  EXIF support
 
+config BR2_PACKAGE_PHP_EXT_GD
+	bool "GD"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	help
+	  GD support
+
 comment "Mathematical extensions"
 
 config BR2_PACKAGE_PHP_EXT_BCMATH
diff --git a/package/php/php.mk b/package/php/php.mk
index 2e97c9a..648dc55 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -213,6 +213,14 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_SNMP),y)
 	PHP_DEPENDENCIES += netsnmp
 endif
 
+ifeq ($(BR2_PACKAGE_PHP_EXT_GD),y)
+	PHP_CONF_OPTS += --with-gd --with-jpeg-dir=$(STAGING_DIR)/usr \
+		--with-png-dir=$(STAGING_DIR)/usr \
+		--with-zlib-dir=$(STAGING_DIR)/usr \
+		--with-freetype-dir=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += jpeg libpng freetype
+endif
+
 define PHP_EXTENSIONS_FIXUP
 	$(SED) "/prefix/ s:/usr:$(STAGING_DIR)/usr:" \
 		$(STAGING_DIR)/usr/bin/phpize
-- 
1.7.10.4
