From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 02:06:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  imagemagick
Message-ID: <20070723090634.3EAD8A5E22@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 02:06:34 -0700 (Mon, 23 Jul 2007)
New Revision: 19210

Log:
Add imagemagick package

Added:
   trunk/buildroot/package/imagemagick/
   trunk/buildroot/package/imagemagick/Config.in
   trunk/buildroot/package/imagemagick/imagemagick-6.3.4-add-errno-h-if-argz-h-does-not-exist.patch
   trunk/buildroot/package/imagemagick/imagemagick.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-23 09:00:58 UTC (rev 19209)
+++ trunk/buildroot/package/Config.in	2007-07-23 09:06:34 UTC (rev 19210)
@@ -289,6 +289,7 @@
 source "package/fbv/Config.in"
 source "package/fbset/Config.in"
 endif
+source "package/imagemagick/Config.in"
 source "package/jpeg/Config.in"
 source "package/libpng/Config.in"
 source "package/libungif/Config.in"

Added: trunk/buildroot/package/imagemagick/Config.in
===================================================================
--- trunk/buildroot/package/imagemagick/Config.in	                        (rev 0)
+++ trunk/buildroot/package/imagemagick/Config.in	2007-07-23 09:06:34 UTC (rev 19210)
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_IMAGEMAGICK
+	bool "imagemagick"
+	default n
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_TIFF
+	help
+	  ImageMagick(R) is a software suite to create, edit, and compose
+	  bitmap images. It can read, convert and write images in a variety of
+	  formats (about 100) including DPX, EXR, GIF, JPEG, JPEG-2000, PDF,
+	  PhotoCD, PNG, Postscript, SVG, and TIFF. Use ImageMagick to
+	  translate, flip, mirror, rotate, scale, shear and transform images,
+	  adjust image colors, apply various special effects, or draw text,
+	  lines, polygons, ellipses and B?zier curves.
+
+	  http://www.imagemagick.org/

Added: trunk/buildroot/package/imagemagick/imagemagick-6.3.4-add-errno-h-if-argz-h-does-not-exist.patch
===================================================================
--- trunk/buildroot/package/imagemagick/imagemagick-6.3.4-add-errno-h-if-argz-h-does-not-exist.patch	                        (rev 0)
+++ trunk/buildroot/package/imagemagick/imagemagick-6.3.4-add-errno-h-if-argz-h-does-not-exist.patch	2007-07-23 09:06:34 UTC (rev 19210)
@@ -0,0 +1,11 @@
+--- ImageMagick-6.3.4.old/configure	2007-05-12 05:49:25.000000000 +0200
++++ ImageMagick-6.3.4.new/configure	2007-05-21 16:53:32.000000000 +0200
+@@ -9484,6 +9484,8 @@ cat >>conftest.$ac_ext <<_ACEOF
+ /* end confdefs.h.  */
+ #if HAVE_ARGZ_H
+ #  include <argz.h>
++#else
++#  include <errno.h>
+ #endif
+ 
+ typedef error_t ac__type_new_;

Added: trunk/buildroot/package/imagemagick/imagemagick.mk
===================================================================
--- trunk/buildroot/package/imagemagick/imagemagick.mk	                        (rev 0)
+++ trunk/buildroot/package/imagemagick/imagemagick.mk	2007-07-23 09:06:34 UTC (rev 19210)
@@ -0,0 +1,115 @@
+#############################################################
+#
+# imagemagick
+#
+#############################################################
+IMAGEMAGICK_VER:=6.3.4
+IMAGEMAGICK_SOURCE:=ImageMagick.tar.bz2
+IMAGEMAGICK_SITE:=ftp://ftp.imagemagick.org/pub/ImageMagick
+IMAGEMAGICK_DIR:=$(BUILD_DIR)/ImageMagick-$(IMAGEMAGICK_VER)
+IMAGEMAGICK_CAT:=$(BZCAT)
+IMAGEMAGICK_BINARY:=convert
+IMAGEMAGICK_TARGET_BINARY:=usr/bin/$(IMAGEMAGICK_BINARY)
+
+$(DL_DIR)/$(IMAGEMAGICK_SOURCE):
+	$(WGET) -P $(DL_DIR) $(IMAGEMAGICK_SITE)/$(IMAGEMAGICK_SOURCE)
+
+$(IMAGEMAGICK_DIR)/.unpacked: $(DL_DIR)/$(IMAGEMAGICK_SOURCE)
+	$(IMAGEMAGICK_CAT) $(DL_DIR)/$(IMAGEMAGICK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(IMAGEMAGICK_DIR) package/imagemagick/ imagemagick-$(IMAGEMAGICK_VER)\*.patch\*
+	$(CONFIG_UPDATE) $(IMAGEMAGICK_DIR)/config
+	@touch $@
+
+$(IMAGEMAGICK_DIR)/.configured: $(IMAGEMAGICK_DIR)/.unpacked
+	(cd $(IMAGEMAGICK_DIR); \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--without-perl \
+		--without-wmf \
+		--without-xml \
+		--without-rsvg \
+		--without-openexr \
+		--without-jp2 \
+		--without-jbig \
+		--without-gvc \
+		--without-djvu \
+		--without-dps \
+		--without-gslib \
+		--without-fpx \
+		--without-freetype \
+		--without-x \
+	);
+	@touch $@
+
+$(IMAGEMAGICK_DIR)/.compiled: $(IMAGEMAGICK_DIR)/.configured
+	$(MAKE) -C $(IMAGEMAGICK_DIR)
+	@touch $@
+
+$(STAGING_DIR)/usr/lib/libMagick.a: $(IMAGEMAGICK_DIR)/.compiled
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(IMAGEMAGICK_DIR) install
+	@touch -c $@
+
+$(TARGET_DIR)/usr/lib/libMagick.so: $(STAGING_DIR)/usr/lib/libMagick.a
+	cp -dpf $(STAGING_DIR)/usr/lib/libMagick.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libMagick.so*
+	cp -dpf $(STAGING_DIR)/usr/lib/libWand.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libWand.so*
+	@touch -c $@
+
+$(TARGET_DIR)/$(IMAGEMAGICK_TARGET_BINARY): $(TARGET_DIR)/usr/lib/libMagick.so
+	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-animate $(TARGET_DIR)/usr/bin/animate
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/animate
+	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-compare $(TARGET_DIR)/usr/bin/compare
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/compare
+	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-composite $(TARGET_DIR)/usr/bin/composite
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/composite
+	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-conjure $(TARGET_DIR)/usr/bin/conjure
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/conjure
+	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-convert $(TARGET_DIR)/usr/bin/convert
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/convert
+	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-display $(TARGET_DIR)/usr/bin/display
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/display
+	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-import $(TARGET_DIR)/usr/bin/import
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/import
+	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-mogrify $(TARGET_DIR)/usr/bin/mogrify
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/mogrify
+	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-montage $(TARGET_DIR)/usr/bin/montage
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/montage
+	mkdir -p $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VER)
+	cp -dpfr $(STAGING_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VER) $(TARGET_DIR)/usr/lib
+	@touch -c $@
+
+imagemagick: uclibc jpeg tiff $(TARGET_DIR)/usr/lib/libMagick.so $(TARGET_DIR)/$(IMAGEMAGICK_TARGET_BINARY)
+
+imagemagick-clean:
+	rm -f $(TARGET_DIR)/$(IMAGEMAGICK_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/usr/bin/animate
+	rm -f $(TARGET_DIR)/usr/bin/compare
+	rm -f $(TARGET_DIR)/usr/bin/composite
+	rm -f $(TARGET_DIR)/usr/bin/conjure
+	rm -f $(TARGET_DIR)/usr/bin/convert
+	rm -f $(TARGET_DIR)/usr/bin/display
+	rm -f $(TARGET_DIR)/usr/bin/import
+	rm -f $(TARGET_DIR)/usr/bin/mogrify
+	rm -f $(TARGET_DIR)/usr/bin/montage
+	rm -rf $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VER)
+	rm -rf $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VER)
+	-$(MAKE) -C $(IMAGEMAGICK_DIR) clean
+
+imagemagick-dirclean:
+	rm -rf $(IMAGEMAGICK_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_IMAGEMAGICK)),y)
+TARGETS+=imagemagick
+endif
