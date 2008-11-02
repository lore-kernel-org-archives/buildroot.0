From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  2 Nov 2008 11:21:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl_image
Message-ID: <20081102192121.ABF413C92A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-02 11:21:21 -0800 (Sun, 02 Nov 2008)
New Revision: 23905

Log:
sdl-image: convert to Makefile.autotools.in format

Modified:
   trunk/buildroot/package/sdl_image/sdl_image.mk


Changeset:
Modified: trunk/buildroot/package/sdl_image/sdl_image.mk
===================================================================
--- trunk/buildroot/package/sdl_image/sdl_image.mk	2008-11-02 19:21:17 UTC (rev 23904)
+++ trunk/buildroot/package/sdl_image/sdl_image.mk	2008-11-02 19:21:21 UTC (rev 23905)
@@ -6,152 +6,30 @@
 SDL_IMAGE_VERSION:=1.2.6
 SDL_IMAGE_SOURCE:=SDL_image-$(SDL_IMAGE_VERSION).tar.gz
 SDL_IMAGE_SITE:=http://www.libsdl.org/projects/SDL_image/release
-SDL_IMAGE_CAT:=$(ZCAT)
-SDL_IMAGE_DIR:=$(BUILD_DIR)/SDL_image-$(SDL_IMAGE_VERSION)
+SDL_IMAGE_LIBTOOL_PATCH:=NO
+SDL_IMAGE_INSTALL_STAGING:=YES
+SDL_IMAGE_INSTALL_TARGET:=YES
 
+SDL_IMAGE_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
+		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
+		--disable-sdltest \
+		--disable-static \
+		--enable-bmp=$(if $(BR2_PACKAGE_SDL_IMAGE_BMP),yes,no) \
+		--enable-gif=$(if $(BR2_PACKAGE_SDL_IMAGE_GIF),yes,no) \
+		--enable-jpg=$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),yes,no) \
+		--enable-lbm=$(if $(BR2_PACKAGE_SDL_IMAGE_LBM),yes,no) \
+		--enable-pcx=$(if $(BR2_PACKAGE_SDL_IMAGE_PCX),yes,no) \
+		--enable-png=$(if $(BR2_PACKAGE_SDL_IMAGE_PNG),yes,no) \
+		--enable-pnm=$(if $(BR2_PACKAGE_SDL_IMAGE_PNM),yes,no) \
+		--enable-tga=$(if $(BR2_PACKAGE_SDL_IMAGE_TARGA),yes,no) \
+		--enable-tif=$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),yes,no) \
+		--enable-xcf=$(if $(BR2_PACKAGE_SDL_IMAGE_XCF),yes,no) \
+		--enable-xpm=$(if $(BR2_PACKAGE_SDL_IMAGE_XPM),yes,no) \
+		--enable-xv=$(if $(BR2_PACKAGE_SDL_IMAGE_XV),yes,no) \
 
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_BMP),y)
-SDL_IMAGE_BMP=--enable-bmp
-else
-SDL_IMAGE_BMP=--enable-bmp=no
-endif
+SDL_IMAGE_DEPENDENCIES:=uclibc sdl \
+	$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),jpeg) \
+	$(if $(BR2_PACKAGE_SDL_IMAGE_PNG),libpng) \
+	$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff)
 
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_GIF),y)
-SDL_IMAGE_GIF=--enable-gif
-else
-SDL_IMAGE_GIF=--enable-gif=no
-endif
-
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_JPEG),y)
-SDL_IMAGE_OPTIONAL_DEPENDS+=$(STAGING_DIR)/usr/lib/libjpeg.a
-SDL_IMAGE_JPEG=--enable-jpg
-else
-SDL_IMAGE_JPEG=--enable-jpg=no
-endif
-
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_LBM),y)
-SDL_IMAGE_LBM=--enable-lbm
-else
-SDL_IMAGE_LBM=--enable-lbm=no
-endif
-
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_PCX),y)
-SDL_IMAGE_PCX=--enable-pcx
-else
-SDL_IMAGE_PCX=--enable-pcx=no
-endif
-
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_PNG),y)
-SDL_IMAGE_OPTIONAL_DEPENDS+=$(STAGING_DIR)/usr/lib/libpng.so
-SDL_IMAGE_PNG=--enable-png
-else
-SDL_IMAGE_PNG=--enable-png=no
-endif
-
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_PNM),y)
-SDL_IMAGE_PNM=--enable-pnm
-else
-SDL_IMAGE_PNM=--enable-pnm=no
-endif
-
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_TARGA),y)
-SDL_IMAGE_TARGA=--enable-tga
-else
-SDL_IMAGE_TARGA=--enable-tga=no
-endif
-
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_TIFF),y)
-SDL_IMAGE_OPTIONAL_DEPENDS+=$(STAGING_DIR)/usr/lib/libtiff.so
-SDL_IMAGE_TIFF=--enable-tif
-else
-SDL_IMAGE_TIFF=--enable-tif=no
-endif
-
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_XCF),y)
-SDL_IMAGE_XCF=--enable-xcf
-else
-SDL_IMAGE_XCF=--enable-xcf=no
-endif
-
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_XPM),y)
-SDL_IMAGE_XPM=--enable-xpm
-else
-SDL_IMAGE_XPM=--enable-xpm=no
-endif
-
-ifeq ($(BR2_PACKAGE_SDL_IMAGE_XV),y)
-SDL_IMAGE_XV=--enable-xv
-else
-SDL_IMAGE_XV=--enable-xv=no
-endif
-
-
-$(DL_DIR)/$(SDL_IMAGE_SOURCE):
-	$(WGET) -P $(DL_DIR) $(SDL_IMAGE_SITE)/$(SDL_IMAGE_SOURCE)
-
-sdl_image-source: $(DL_DIR)/$(SDL_IMAGE_SOURCE)
-
-$(SDL_IMAGE_DIR)/.unpacked: $(DL_DIR)/$(SDL_IMAGE_SOURCE)
-	$(SDL_IMAGE_CAT) $(DL_DIR)/$(SDL_IMAGE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SDL_IMAGE_DIR) package/sdl_image sdl_image-$(SDL_IMAGE_VERSION)\*.patch
-	$(CONFIG_UPDATE) $(SDL_IMAGE_DIR)
-	touch $@
-
-$(SDL_IMAGE_DIR)/.configured: $(SDL_IMAGE_DIR)/.unpacked $(SDL_IMAGE_OPTIONAL_DEPENDS)
-	(cd $(SDL_IMAGE_DIR); rm -rf config.cache; \
-	$(TARGET_CONFIGURE_OPTS) \
-	$(TARGET_CONFIGURE_ARGS) \
-	./configure \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--prefix=$(STAGING_DIR)/usr \
-	--with-sdl-prefix=$(STAGING_DIR)/usr \
-	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
-	--disable-sdltest \
-	--disable-static \
-	$(SDL_IMAGE_BMP) \
-	$(SDL_IMAGE_GIF) \
-	$(SDL_IMAGE_JPEG) \
-	$(SDL_IMAGE_LBM) \
-	$(SDL_IMAGE_PCX) \
-	$(SDL_IMAGE_PNG) \
-	$(SDL_IMAGE_PNM) \
-	$(SDL_IMAGE_TARGA) \
-	$(SDL_IMAGE_TIFF) \
-	$(SDL_IMAGE_XCF) \
-	$(SDL_IMAGE_XPM) \
-	$(SDL_IMAGE_XV) \
-	);
-	touch $@
-
-$(SDL_IMAGE_DIR)/.compiled: $(SDL_IMAGE_DIR)/.configured
-	$(MAKE) -C $(SDL_IMAGE_DIR)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libSDL_image.so: $(SDL_IMAGE_DIR)/.compiled
-	$(MAKE) -C $(SDL_IMAGE_DIR) install
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libSDL_image.so: $(STAGING_DIR)/usr/lib/libSDL_image.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_image*.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/usr/lib/libSDL_image.so
-
-sdl_image: uclibc sdl $(TARGET_DIR)/usr/lib/libSDL_image.so
-
-sdl_image-clean:
-	-rm -f $(TARGET_DIR)/usr/lib/libSDL_image*.so*
-	-$(MAKE) -C $(SDL_IMAGE_DIR) uninstall
-	-$(MAKE) -C $(SDL_IMAGE_DIR) clean
-
-sdl_image-dirclean:
-	rm -rf $(SDL_IMAGE_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_SDL_IMAGE)),y)
-TARGETS+=sdl_image
-endif
+$(eval $(call AUTOTARGETS,package,sdl_image))
