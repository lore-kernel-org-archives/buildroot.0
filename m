From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Oct 2009 22:11:59 +0200
Subject: [Buildroot] [git commit master] imagemagick: fix build
Message-ID: <20091001201352.B95B7776DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=01ca43795471240afa2187857d27eb4ec4a87521
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix various breakage in the imagemagick build:
- libWand.* is now called libMagickWand.*
- libMagic.* is now called libMagickCore.*
- References to wrong version numbers in directories
- Libraries missing from clean target

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imagemagick/imagemagick.mk |   27 ++++++++++++++-------------
 1 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b082df6..e95b6e8 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -3,14 +3,15 @@
 # imagemagick
 #
 #############################################################
-IMAGEMAGICK_VERSION:=6.4.8-4
+IMAGEMAGICK_MAJOR:=6.4.8
+IMAGEMAGICK_VERSION:=$(IMAGEMAGICK_MAJOR)-4
 IMAGEMAGICK_SOURCE:=ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 IMAGEMAGICK_SITE:=ftp://ftp.imagemagick.org/pub/ImageMagick
 IMAGEMAGICK_DIR:=$(BUILD_DIR)/ImageMagick-$(IMAGEMAGICK_VERSION)
 IMAGEMAGICK_CAT:=$(BZCAT)
 #IMAGEMAGICK_BINARY:=convert
 #IMAGEMAGICK_TARGET_BINARY:=usr/bin/$(IMAGEMAGICK_BINARY)
-IMAGEMAGICK_LIB:=$(TARGET_DIR)/usr/lib/libMagick.so
+IMAGEMAGICK_LIB:=$(TARGET_DIR)/usr/lib/libMagickCore.so
 
 IMAGEMAGICK_TARGET_BINARIES:=$(TARGET_DIR)/usr/bin/animate
 IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/compare
@@ -63,22 +64,22 @@ $(IMAGEMAGICK_DIR)/.compiled: $(IMAGEMAGICK_DIR)/.configured
 	$(MAKE) -C $(IMAGEMAGICK_DIR)
 	touch $@
 
-$(STAGING_DIR)/usr/lib/libMagick.a: $(IMAGEMAGICK_DIR)/.compiled
+$(STAGING_DIR)/usr/lib/libMagickCore.a: $(IMAGEMAGICK_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(IMAGEMAGICK_DIR) install
 	touch -c $@
 
-$(IMAGEMAGICK_LIB): $(STAGING_DIR)/usr/lib/libMagick.a
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/lib/libWand.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libWand.so*
-	mkdir -p $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION)
-	$(IMAGEMAGICK_COPY) -r $(STAGING_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION) $(TARGET_DIR)/usr/lib
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/lib/libMagick.so* $(TARGET_DIR)/usr/lib/
+$(IMAGEMAGICK_LIB): $(STAGING_DIR)/usr/lib/libMagickCore.a
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/lib/libMagickWand.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libMagickWand.so*
+	mkdir -p $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)
+	$(IMAGEMAGICK_COPY) -r $(STAGING_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR) $(TARGET_DIR)/usr/lib
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/lib/libMagickCore.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(IMAGEMAGICK_LIB)*
 	touch -c $@
 
 $(IMAGEMAGICK_DIR)/.libinstall: $(IMAGEMAGICK_LIB)
-	libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-6.3.5/modules-Q16/coders
-	libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-6.3.5/modules-Q16/filters
+	libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)/modules-Q16/coders
+	libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)/modules-Q16/filters
 	touch $@
 
 $(TARGET_DIR)/usr/bin/animate: $(IMAGEMAGICK_LIB)
@@ -146,8 +147,8 @@ imagemagick-clean:
 	rm -f $(TARGET_DIR)/usr/bin/import
 	rm -f $(TARGET_DIR)/usr/bin/mogrify
 	rm -f $(TARGET_DIR)/usr/bin/montage
-	rm -rf $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION)
-	rm -rf $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION)
+	rm -rf $(TARGET_DIR)/usr/lib/libMagick*
+	rm -rf $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)
 	-$(MAKE) -C $(IMAGEMAGICK_DIR) clean
 
 imagemagick-dirclean:
-- 
1.6.3.3
