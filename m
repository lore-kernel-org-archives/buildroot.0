From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 17 Jul 2008 06:20:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  sdl_image
Message-ID: <20080717132016.3A5433C889@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-17 06:20:05 -0700 (Thu, 17 Jul 2008)
New Revision: 22861

Log:
package: sdl_image package

Based on patch by artemys. Closes #4194

Added:
   trunk/buildroot/package/sdl_image/
   trunk/buildroot/package/sdl_image/Config.in
   trunk/buildroot/package/sdl_image/sdl_image.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-07-17 13:19:54 UTC (rev 22860)
+++ trunk/buildroot/package/Config.in	2008-07-17 13:20:05 UTC (rev 22861)
@@ -340,6 +340,7 @@
 source "package/libpng/Config.in"
 source "package/libungif/Config.in"
 source "package/sdl/Config.in"
+source "package/sdl_image/Config.in"
 source "package/sdl_mixer/Config.in"
 source "package/sdl_ttf/Config.in"
 source "package/tiff/Config.in"

Added: trunk/buildroot/package/sdl_image/Config.in
===================================================================
--- trunk/buildroot/package/sdl_image/Config.in	                        (rev 0)
+++ trunk/buildroot/package/sdl_image/Config.in	2008-07-17 13:20:05 UTC (rev 22861)
@@ -0,0 +1,66 @@
+config BR2_PACKAGE_SDL_IMAGE
+	bool "SDL_image"
+	depends on BR2_PACKAGE_SDL
+	default n
+	help
+	  SDL_image is an image file loading library. It loads images
+	  as SDL surfaces, and supports the following formats:
+	  BMP, GIF, JPEG, LBM, PCX, PNG, PNM, TGA, TIFF, XCF, XPM, XV.
+
+	  http://www.libsdl.org/projects/SDL_image/
+
+menu "SDL_image file format support"
+	depends on BR2_PACKAGE_SDL_IMAGE
+
+config BR2_PACKAGE_SDL_IMAGE_BMP
+	bool "enable BMP file format support"
+	default y
+
+config BR2_PACKAGE_SDL_IMAGE_GIF
+	bool "enable GIF file format support"
+	default n
+
+config BR2_PACKAGE_SDL_IMAGE_JPEG
+	bool "enable JPEG file format support"
+	select BR2_PACKAGE_JPEG
+	default n
+
+config BR2_PACKAGE_SDL_IMAGE_LBM
+	bool "enable LBM file format support"
+	default n
+
+config BR2_PACKAGE_SDL_IMAGE_PCX
+	bool "enable PCX file format support"
+	default n
+
+config BR2_PACKAGE_SDL_IMAGE_PNG
+	bool "enable PNG file format support"
+	select BR2_PACKAGE_LIBPNG
+	default n
+
+config BR2_PACKAGE_SDL_IMAGE_PNM
+	bool "enable PNM file format support"
+	default n
+
+config BR2_PACKAGE_SDL_IMAGE_TARGA
+	bool "enable TARGA format support"
+	default n
+
+config BR2_PACKAGE_SDL_IMAGE_TIFF
+	bool "enable TIFF file format support"
+	select BR2_PACKAGE_TIFF
+	default n
+
+config BR2_PACKAGE_SDL_IMAGE_XCF
+	bool "enable XCF file format support"
+	default n
+
+config BR2_PACKAGE_SDL_IMAGE_XPM
+	bool "enable XPM format support"
+	default n
+
+config BR2_PACKAGE_SDL_IMAGE_XV
+	bool "enable XV file format support"
+	default n
+
+endmenu

Added: trunk/buildroot/package/sdl_image/sdl_image.mk
===================================================================
--- trunk/buildroot/package/sdl_image/sdl_image.mk	                        (rev 0)
+++ trunk/buildroot/package/sdl_image/sdl_image.mk	2008-07-17 13:20:05 UTC (rev 22861)
@@ -0,0 +1,157 @@
+#############################################################
+#
+# SDL_image addon for SDL
+#
+#############################################################
+SDL_IMAGE_VERSION:=1.2.6
+SDL_IMAGE_SOURCE:=SDL_image-$(SDL_IMAGE_VERSION).tar.gz
+SDL_IMAGE_SITE:=http://www.libsdl.org/projects/SDL_image/release
+SDL_IMAGE_CAT:=$(ZCAT)
+SDL_IMAGE_DIR:=$(BUILD_DIR)/SDL_image-$(SDL_IMAGE_VERSION)
+
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_BMP),y)
+SDL_IMAGE_BMP=--enable-bmp
+else
+SDL_IMAGE_BMP=--enable-bmp=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_GIF),y)
+SDL_IMAGE_GIF=--enable-gif
+else
+SDL_IMAGE_GIF=--enable-gif=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_JPEG),y)
+SDL_IMAGE_OPTIONAL_DEPENDS+=$(STAGING_DIR)/usr/lib/libjpeg.a
+SDL_IMAGE_JPEG=--enable-jpg
+else
+SDL_IMAGE_JPEG=--enable-jpg=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_LBM),y)
+SDL_IMAGE_LBM=--enable-lbm
+else
+SDL_IMAGE_LBM=--enable-lbm=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_PCX),y)
+SDL_IMAGE_PCX=--enable-pcx
+else
+SDL_IMAGE_PCX=--enable-pcx=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_PNG),y)
+SDL_IMAGE_OPTIONAL_DEPENDS+=$(STAGING_DIR)/usr/lib/libpng.so
+SDL_IMAGE_PNG=--enable-png
+else
+SDL_IMAGE_PNG=--enable-png=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_PNM),y)
+SDL_IMAGE_PNM=--enable-pnm
+else
+SDL_IMAGE_PNM=--enable-pnm=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_TARGA),y)
+SDL_IMAGE_TARGA=--enable-tga
+else
+SDL_IMAGE_TARGA=--enable-tga=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_TIFF),y)
+SDL_IMAGE_OPTIONAL_DEPENDS+=$(STAGING_DIR)/usr/lib/libtiff.so
+SDL_IMAGE_TIFF=--enable-tif
+else
+SDL_IMAGE_TIFF=--enable-tif=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_XCF),y)
+SDL_IMAGE_XCF=--enable-xcf
+else
+SDL_IMAGE_XCF=--enable-xcf=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_XPM),y)
+SDL_IMAGE_XPM=--enable-xpm
+else
+SDL_IMAGE_XPM=--enable-xpm=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE_XV),y)
+SDL_IMAGE_XV=--enable-xv
+else
+SDL_IMAGE_XV=--enable-xv=no
+endif
+
+
+$(DL_DIR)/$(SDL_IMAGE_SOURCE):
+	$(WGET) -P $(DL_DIR) $(SDL_IMAGE_SITE)/$(SDL_IMAGE_SOURCE)
+
+sdl_image-source: $(DL_DIR)/$(SDL_IMAGE_SOURCE)
+
+$(SDL_IMAGE_DIR)/.unpacked: $(DL_DIR)/$(SDL_IMAGE_SOURCE)
+	$(SDL_IMAGE_CAT) $(DL_DIR)/$(SDL_IMAGE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(SDL_IMAGE_DIR) package/sdl_image sdl_image-$(SDL_IMAGE_VERSION)\*.patch
+	$(CONFIG_UPDATE) $(SDL_IMAGE_DIR)
+	touch $@
+
+$(SDL_IMAGE_DIR)/.configured: $(SDL_IMAGE_DIR)/.unpacked $(SDL_IMAGE_OPTIONAL_DEPENDS)
+	(cd $(SDL_IMAGE_DIR); rm -rf config.cache; \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	./configure \
+	--target=$(GNU_TARGET_NAME) \
+	--host=$(GNU_TARGET_NAME) \
+	--build=$(GNU_HOST_NAME) \
+	--prefix=$(STAGING_DIR)/usr \
+	--with-sdl-prefix=$(STAGING_DIR)/usr \
+	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
+	--disable-sdltest \
+	--disable-static \
+	$(SDL_IMAGE_BMP) \
+	$(SDL_IMAGE_GIF) \
+	$(SDL_IMAGE_JPEG) \
+	$(SDL_IMAGE_LBM) \
+	$(SDL_IMAGE_PCX) \
+	$(SDL_IMAGE_PNG) \
+	$(SDL_IMAGE_PNM) \
+	$(SDL_IMAGE_TARGA) \
+	$(SDL_IMAGE_TIFF) \
+	$(SDL_IMAGE_XCF) \
+	$(SDL_IMAGE_XPM) \
+	$(SDL_IMAGE_XV) \
+	);
+	touch $@
+
+$(SDL_IMAGE_DIR)/.compiled: $(SDL_IMAGE_DIR)/.configured
+	$(MAKE) -C $(SDL_IMAGE_DIR)
+	touch $@
+
+$(STAGING_DIR)/usr/lib/libSDL_image.so: $(SDL_IMAGE_DIR)/.compiled
+	$(MAKE) -C $(SDL_IMAGE_DIR) install
+	touch -c $@
+
+$(TARGET_DIR)/usr/lib/libSDL_image.so: $(STAGING_DIR)/usr/lib/libSDL_image.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_image*.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/usr/lib/libSDL_image.so
+
+sdl_image: uclibc sdl $(TARGET_DIR)/usr/lib/libSDL_image.so
+
+sdl_image-clean:
+	-rm -f $(TARGET_DIR)/usr/lib/libSDL_image*.so*
+	-$(MAKE) -C $(SDL_IMAGE_DIR) uninstall
+	-$(MAKE) -C $(SDL_IMAGE_DIR) clean
+
+sdl_image-dirclean:
+	rm -rf $(SDL_IMAGE_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_SDL_IMAGE)),y)
+TARGETS+=sdl_image
+endif
