From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 05:26:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/imagemagick
Message-ID: <20070723122650.30019A65DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 05:26:49 -0700 (Mon, 23 Jul 2007)
New Revision: 19227

Log:
Cleanup imagemagick package

Modified:
   trunk/buildroot/package/imagemagick/imagemagick.mk


Changeset:
Modified: trunk/buildroot/package/imagemagick/imagemagick.mk
===================================================================
--- trunk/buildroot/package/imagemagick/imagemagick.mk	2007-07-23 12:22:37 UTC (rev 19226)
+++ trunk/buildroot/package/imagemagick/imagemagick.mk	2007-07-23 12:26:49 UTC (rev 19227)
@@ -3,10 +3,10 @@
 # imagemagick
 #
 #############################################################
-IMAGEMAGICK_VER:=6.3.4
+IMAGEMAGICK_VERSION:=6.3.4
 IMAGEMAGICK_SOURCE:=ImageMagick.tar.bz2
 IMAGEMAGICK_SITE:=ftp://ftp.imagemagick.org/pub/ImageMagick
-IMAGEMAGICK_DIR:=$(BUILD_DIR)/ImageMagick-$(IMAGEMAGICK_VER)
+IMAGEMAGICK_DIR:=$(BUILD_DIR)/ImageMagick-$(IMAGEMAGICK_VERSION)
 IMAGEMAGICK_CAT:=$(BZCAT)
 IMAGEMAGICK_BINARY:=convert
 IMAGEMAGICK_TARGET_BINARY:=usr/bin/$(IMAGEMAGICK_BINARY)
@@ -16,15 +16,14 @@
 
 $(IMAGEMAGICK_DIR)/.unpacked: $(DL_DIR)/$(IMAGEMAGICK_SOURCE)
 	$(IMAGEMAGICK_CAT) $(DL_DIR)/$(IMAGEMAGICK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(IMAGEMAGICK_DIR) package/imagemagick/ imagemagick-$(IMAGEMAGICK_VER)\*.patch\*
+	toolchain/patch-kernel.sh $(IMAGEMAGICK_DIR) package/imagemagick/ imagemagick-$(IMAGEMAGICK_VERSION)\*.patch\*
 	$(CONFIG_UPDATE) $(IMAGEMAGICK_DIR)/config
-	@touch $@
+	touch $@
 
 $(IMAGEMAGICK_DIR)/.configured: $(IMAGEMAGICK_DIR)/.unpacked
 	(cd $(IMAGEMAGICK_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -46,22 +45,22 @@
 		--without-freetype \
 		--without-x \
 	);
-	@touch $@
+	touch $@
 
 $(IMAGEMAGICK_DIR)/.compiled: $(IMAGEMAGICK_DIR)/.configured
 	$(MAKE) -C $(IMAGEMAGICK_DIR)
-	@touch $@
+	touch $@
 
 $(STAGING_DIR)/usr/lib/libMagick.a: $(IMAGEMAGICK_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(IMAGEMAGICK_DIR) install
-	@touch -c $@
+	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libMagick.so: $(STAGING_DIR)/usr/lib/libMagick.a
 	cp -dpf $(STAGING_DIR)/usr/lib/libMagick.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libMagick.so*
 	cp -dpf $(STAGING_DIR)/usr/lib/libWand.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libWand.so*
-	@touch -c $@
+	touch -c $@
 
 $(TARGET_DIR)/$(IMAGEMAGICK_TARGET_BINARY): $(TARGET_DIR)/usr/lib/libMagick.so
 	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-animate $(TARGET_DIR)/usr/bin/animate
@@ -82,9 +81,9 @@
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/mogrify
 	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-montage $(TARGET_DIR)/usr/bin/montage
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/montage
-	mkdir -p $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VER)
-	cp -dpfr $(STAGING_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VER) $(TARGET_DIR)/usr/lib
-	@touch -c $@
+	mkdir -p $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION)
+	cp -dpfr $(STAGING_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION) $(TARGET_DIR)/usr/lib
+	touch -c $@
 
 imagemagick: uclibc jpeg tiff $(TARGET_DIR)/usr/lib/libMagick.so $(TARGET_DIR)/$(IMAGEMAGICK_TARGET_BINARY)
 
@@ -99,8 +98,8 @@
 	rm -f $(TARGET_DIR)/usr/bin/import
 	rm -f $(TARGET_DIR)/usr/bin/mogrify
 	rm -f $(TARGET_DIR)/usr/bin/montage
-	rm -rf $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VER)
-	rm -rf $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VER)
+	rm -rf $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION)
+	rm -rf $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION)
 	-$(MAKE) -C $(IMAGEMAGICK_DIR) clean
 
 imagemagick-dirclean:
