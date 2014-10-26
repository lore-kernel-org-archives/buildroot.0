From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:31:00 +0100
Subject: [Buildroot] [git commit] package/php: Add support for GD module
Message-ID: <20141026213820.B5881B0D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e29d47e5503b22b6e63ed68cf09431874708cda4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.ext |    8 ++++++++
 package/php/php.mk     |    8 ++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

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
index afb55b4..c2840f3 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -212,6 +212,14 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_SNMP),y)
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
