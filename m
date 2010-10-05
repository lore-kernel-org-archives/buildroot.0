From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Oct 2010 09:15:06 +0200
Subject: [Buildroot] [git commit master 1/1] imagemagick: remove fixed
	jpeg+tiff dependencies, add optional deps
Message-ID: <20101005071708.A2E048B854@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=246c1f4deabe3872b050eef1cc087d3004c50515
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For fontconfig/freetype/jpeg/libpng/librsvg/libxml2/tiff.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imagemagick/Config.in      |    2 -
 package/imagemagick/imagemagick.mk |   54 ++++++++++++++++++++++++++++++++---
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/package/imagemagick/Config.in b/package/imagemagick/Config.in
index d6d6d8b..e66ded0 100644
--- a/package/imagemagick/Config.in
+++ b/package/imagemagick/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_IMAGEMAGICK
 	bool "imagemagick"
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_TIFF
 	help
 	  ImageMagick(R) is a software suite to create, edit, and compose
 	  bitmap images. It can read, convert and write images in a variety of
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index f80fe6f..f14adb9 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -10,8 +10,6 @@ IMAGEMAGICK_SITE = ftp://ftp.imagemagick.org/pub/ImageMagick
 IMAGEMAGICK_LIBTOOL_PATCH = NO
 IMAGEMAGICK_INSTALL_STAGING = YES
 
-IMAGEMAGICK_DEPENDENCIES = jpeg tiff
-
 ifeq ($(BR2_LARGEFILE),y)
 IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
 else
@@ -21,8 +19,6 @@ endif
 IMAGEMAGICK_CONF_OPT = --program-transform-name='s,,,' \
 		--without-perl \
 		--without-wmf \
-		--without-xml \
-		--without-rsvg \
 		--without-openexr \
 		--without-jp2 \
 		--without-jbig \
@@ -31,7 +27,55 @@ IMAGEMAGICK_CONF_OPT = --program-transform-name='s,,,' \
 		--without-dps \
 		--without-gslib \
 		--without-fpx \
-		--without-freetype \
 		--without-x
 
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+IMAGEMAGICK_CONF_OPT += --with-fontconfig
+IMAGEMAGICK_DEPENDENCIES += fontconfig
+else
+IMAGEMAGISK_CONF_OPT += --without-fontconfig
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+IMAGEMAGICK_CONF_OPT += --with-freetype
+IMAGEMAGICK_DEPENDENCIES += freetype
+else
+IMAGEMAGISK_CONF_OPT += --without-freetype
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+IMAGEMAGICK_CONF_OPT += --with-jpeg
+IMAGEMAGICK_DEPENDENCIES += jpeg
+else
+IMAGEMAGISK_CONF_OPT += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+IMAGEMAGICK_CONF_OPT += --with-png
+IMAGEMAGICK_DEPENDENCIES += libpng
+else
+IMAGEMAGISK_CONF_OPT += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_LIBRSVG),y)
+IMAGEMAGICK_CONF_OPT += --with-rsvg
+IMAGEMAGICK_DEPENDENCIES += librsvg
+else
+IMAGEMAGISK_CONF_OPT += --without-rsvg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+IMAGEMAGICK_CONF_OPT += --with-xml
+IMAGEMAGICK_DEPENDENCIES += libxml2
+else
+IMAGEMAGISK_CONF_OPT += --without-xml
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+IMAGEMAGICK_CONF_OPT += --with-tiff
+IMAGEMAGICK_DEPENDENCIES += tiff
+else
+IMAGEMAGISK_CONF_OPT += --without-tiff
+endif
+
 $(eval $(call AUTOTARGETS,package,imagemagick))
-- 
1.7.1
