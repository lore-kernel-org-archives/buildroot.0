From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Oct 2009 14:23:08 +0200
Subject: [Buildroot] [git commit master] imagemagick: fix -clean target
Message-ID: <20091013122416.1ECAE77552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f72f3fd30e6ad3c8edc5963636231e339f5824a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #657

imagemagick-clean target currently tries to remove $(TARGET_DIR) as
there is no IMAGEMAGICK_BINARY anymore.

Signed-off-by: Simon Pasch <fpasch@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                            |    1 +
 package/imagemagick/imagemagick.mk |   15 +++------------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index d12e3a8..2c03c9c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -28,6 +28,7 @@
 	#617: netkit/inetd requires RPC and fails to build if RPC is disabled
 	#619: netkittelnet requires netkitbase to install, but there's no dependency
 	#653: [SECURITY] Update php package to version 5.2.11
+	#657: Bug in imagemagick-clean target
 
 2009.08, Released August 31th, 2009:
 
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index e95b6e8..2bcd076 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -9,8 +9,6 @@ IMAGEMAGICK_SOURCE:=ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 IMAGEMAGICK_SITE:=ftp://ftp.imagemagick.org/pub/ImageMagick
 IMAGEMAGICK_DIR:=$(BUILD_DIR)/ImageMagick-$(IMAGEMAGICK_VERSION)
 IMAGEMAGICK_CAT:=$(BZCAT)
-#IMAGEMAGICK_BINARY:=convert
-#IMAGEMAGICK_TARGET_BINARY:=usr/bin/$(IMAGEMAGICK_BINARY)
 IMAGEMAGICK_LIB:=$(TARGET_DIR)/usr/lib/libMagickCore.so
 
 IMAGEMAGICK_TARGET_BINARIES:=$(TARGET_DIR)/usr/bin/animate
@@ -137,16 +135,9 @@ imagemagick-source: $(DL_DIR)/$(IMAGEMAGICK_SOURCE)
 imagemagick-unpacked:$(IMAGEMAGICK_DIR)/.unpacked
 
 imagemagick-clean:
-	rm -f $(TARGET_DIR)/$(IMAGEMAGICK_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/usr/bin/animate
-	rm -f $(TARGET_DIR)/usr/bin/compare
-	rm -f $(TARGET_DIR)/usr/bin/composite
-	rm -f $(TARGET_DIR)/usr/bin/conjure
-	rm -f $(TARGET_DIR)/usr/bin/convert
-	rm -f $(TARGET_DIR)/usr/bin/display
-	rm -f $(TARGET_DIR)/usr/bin/import
-	rm -f $(TARGET_DIR)/usr/bin/mogrify
-	rm -f $(TARGET_DIR)/usr/bin/montage
+	for target_binary in $(IMAGEMAGICK_TARGET_BINARIES); do \
+		rm -f $$target_binary; \
+	done
 	rm -rf $(TARGET_DIR)/usr/lib/libMagick*
 	rm -rf $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)
 	-$(MAKE) -C $(IMAGEMAGICK_DIR) clean
-- 
1.6.3.3
