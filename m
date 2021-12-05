Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB30FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C7D141499;
	Mon,  6 Dec 2021 18:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SORNLuzpH0nh; Mon,  6 Dec 2021 18:46:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A510E41BE2;
	Mon,  6 Dec 2021 18:46:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 168581BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1D9541C25
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5z7XEx-Fiv3S for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4004E41C7D
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D876181468; Mon,  6 Dec 2021 18:07:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 16:35:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed7321051552366a8145c6486c24452aab6ff450
X-Git-Newrev: e821078031e14df69e5142f23e9cb7b5a1ea0e77
X-Patchwork-Hint: ignore
Message-Id: <20211206180743.D876181468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-rgb-led-matrix: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e821078031e14df69e5142f23e9cb7b5a1ea0e77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A library to control commonly available 64x64, 32x32 or 16x32
RGB LED panels with the Raspberry Pi. Can support PWM up to
11Bit per channel, providing true 24bpp color with CIE1931
profile.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Arnout: reorder build/install hooks inside conditions]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch       | 46 +++++++++++++
 package/rpi-rgb-led-matrix/Config.in               | 43 ++++++++++++
 package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash |  3 +
 package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk   | 78 ++++++++++++++++++++++
 6 files changed, 172 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fd3ee964b2..1018bce420 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1098,6 +1098,7 @@ F:	package/python-pyjwt/
 F:	package/python-redis/
 F:	package/python-rpi-ws281x/
 F:	package/python-wtforms/
+F:	package/rpi-rgb-led-matrix/
 
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
diff --git a/package/Config.in b/package/Config.in
index 006d3cf284..916bbfd836 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1621,6 +1621,7 @@ menu "Hardware handling"
 	source "package/neardal/Config.in"
 	source "package/owfs/Config.in"
 	source "package/pcsc-lite/Config.in"
+	source "package/rpi-rgb-led-matrix/Config.in"
 	source "package/tslib/Config.in"
 	source "package/uhd/Config.in"
 	source "package/urg/Config.in"
diff --git a/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch b/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch
new file mode 100644
index 0000000000..f7a92f5fb2
--- /dev/null
+++ b/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch
@@ -0,0 +1,46 @@
+From 056a189836a82b832cd8e6f886cb2090344bfa08 Mon Sep 17 00:00:00 2001
+From: Grzegorz Blach <grzegorz@blach.pl>
+Date: Sat, 29 Aug 2020 20:48:57 +0200
+Subject: [PATCH] Rename LDFLAGS to RGB_LDFLAGS.
+
+This change allows additional flags to be added to the linker
+from the command line.
+
+Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
+---
+ utils/Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/utils/Makefile b/utils/Makefile
+index e751adc..e704442 100644
+--- a/utils/Makefile
++++ b/utils/Makefile
+@@ -12,7 +12,7 @@ RGB_INCDIR=$(RGB_LIB_DISTRIBUTION)/include
+ RGB_LIBDIR=$(RGB_LIB_DISTRIBUTION)/lib
+ RGB_LIBRARY_NAME=rgbmatrix
+ RGB_LIBRARY=$(RGB_LIBDIR)/lib$(RGB_LIBRARY_NAME).a
+-LDFLAGS+=-L$(RGB_LIBDIR) -l$(RGB_LIBRARY_NAME) -lrt -lm -lpthread
++RGB_LDFLAGS+=-L$(RGB_LIBDIR) -l$(RGB_LIBRARY_NAME) -lrt -lm -lpthread
+ 
+ # Imagemagic flags, only needed if actually compiled.
+ MAGICK_CXXFLAGS?=$(shell GraphicsMagick++-config --cppflags --cxxflags)
+@@ -28,13 +28,13 @@ $(RGB_LIBRARY): FORCE
+ 	$(MAKE) -C $(RGB_LIBDIR)
+ 
+ text-scroller: text-scroller.o $(RGB_LIBRARY)
+-	$(CXX) $(CXXFLAGS) text-scroller.o -o $@ $(LDFLAGS)
++	$(CXX) $(CXXFLAGS) text-scroller.o -o $@ $(LDFLAGS) $(RGB_LDFLAGS)
+ 
+ led-image-viewer: led-image-viewer.o $(RGB_LIBRARY)
+-	$(CXX) $(CXXFLAGS) led-image-viewer.o -o $@ $(LDFLAGS) $(MAGICK_LDFLAGS)
++	$(CXX) $(CXXFLAGS) led-image-viewer.o -o $@ $(LDFLAGS) $(RGB_LDFLAGS) $(MAGICK_LDFLAGS)
+ 
+ video-viewer: video-viewer.o $(RGB_LIBRARY)
+-	$(CXX) $(CXXFLAGS) video-viewer.o -o $@ $(LDFLAGS) $(AV_LDFLAGS)
++	$(CXX) $(CXXFLAGS) video-viewer.o -o $@ $(LDFLAGS) $(RGB_LDFLAGS) $(AV_LDFLAGS)
+ 
+ %.o : %.cc
+ 	$(CXX) -I$(RGB_INCDIR) $(CXXFLAGS) -c -o $@ $<
+-- 
+2.24.3 (Apple Git-128)
+
diff --git a/package/rpi-rgb-led-matrix/Config.in b/package/rpi-rgb-led-matrix/Config.in
new file mode 100644
index 0000000000..ca945a92af
--- /dev/null
+++ b/package/rpi-rgb-led-matrix/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_RPI_RGB_LED_MATRIX
+	bool "rpi-rgb-led-matrix"
+	depends on BR2_aarch64 || BR2_arm
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	help
+	  A library to control commonly available 64x64, 32x32 or 16x32
+	  RGB LED panels with the Raspberry Pi. Can support PWM up to
+	  11Bit per channel, providing true 24bpp color with CIE1931
+	  profile.
+
+	  https://github.com/hzeller/rpi-rgb-led-matrix
+
+if BR2_PACKAGE_RPI_RGB_LED_MATRIX
+
+config BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER
+	bool "Build led-image-viewer"
+	select BR2_PACKAGE_GRAPHICSMAGICK
+	help
+	  The image viewer reads all kinds of image formats,
+	  including animated gifs.
+
+config BR2_PACKAGE_RPI_RGB_LED_MATRIX_TEXT_SCROLLER
+	bool "Build text-scroller"
+	help
+	  The text scroller allows to show some scrolling text.
+
+config BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER
+	bool "Build video-viewer"
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	help
+	  The video viewer allows to play common video formats
+	  on the RGB matrix (just the picture, no sound).
+
+endif
+
+comment "rpi-rgb-led-matrix needs a toolchain w/ C++, threads, dynamic library"
+	depends on BR2_aarch64 || BR2_arm
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
new file mode 100644
index 0000000000..3b1cb5fd76
--- /dev/null
+++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  5efc0293bb180b958079910e968721ff2dac291c435d065ecec9ceba8589567d  rpi-rgb-led-matrix-63e3e7ffdbe88223cc80e1faa508bc4f3cf2bea4.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
new file mode 100644
index 0000000000..b220bbc3db
--- /dev/null
+++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
@@ -0,0 +1,78 @@
+################################################################################
+#
+# rpi-rgb-led-matrix
+#
+################################################################################
+
+RPI_RGB_LED_MATRIX_VERSION = 63e3e7ffdbe88223cc80e1faa508bc4f3cf2bea4
+RPI_RGB_LED_MATRIX_SITE = $(call github,hzeller,rpi-rgb-led-matrix,$(RPI_RGB_LED_MATRIX_VERSION))
+RPI_RGB_LED_MATRIX_LICENSE = GPL-2.0
+RPI_RGB_LED_MATRIX_LICENSE_FILES = COPYING
+RPI_RGB_LED_MATRIX_INSTALL_STAGING = YES
+
+define RPI_RGB_LED_MATRIX_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lib all
+endef
+
+define RPI_RGB_LED_MATRIX_INSTALL_STAGING_CMDS
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/rpi-rgb-led-matrix/
+	$(INSTALL) -m 0644 $(@D)/include/*.h $(STAGING_DIR)/usr/include/rpi-rgb-led-matrix/
+	$(INSTALL) -D -m 0644 $(@D)/lib/librgbmatrix.a $(STAGING_DIR)/usr/lib/librgbmatrix.a
+	$(INSTALL) -D -m 0755 $(@D)/lib/librgbmatrix.so.1 $(STAGING_DIR)/usr/lib/librgbmatrix.so.1
+	ln -sf librgbmatrix.so.1 $(STAGING_DIR)/usr/lib/librgbmatrix.so
+endef
+
+define RPI_RGB_LED_MATRIX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/librgbmatrix.so.1 $(TARGET_DIR)/usr/lib/librgbmatrix.so.1
+	ln -sf librgbmatrix.so.1 $(TARGET_DIR)/usr/lib/librgbmatrix.so
+endef
+
+ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER),y)
+RPI_RGB_LED_MATRIX_DEPENDENCIES += graphicsmagick
+
+define RPI_RGB_LED_MATRIX_BUILD_IMAGE_VIEWER_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		MAGICK_CXXFLAGS="-I$(STAGING_DIR)/usr/include/GraphicsMagick $(shell $(STAGING_DIR)/usr/bin/GraphicsMagick++-config --cxxflags)" \
+		MAGICK_LDFLAGS="-L$(STAGING_DIR)/usr/lib $(shell $(STAGING_DIR)/usr/bin/GraphicsMagick++-config --libs)" \
+		-C $(@D)/utils led-image-viewer
+endef
+RPI_RGB_LED_MATRIX_POST_BUILD_HOOKS += RPI_RGB_LED_MATRIX_BUILD_IMAGE_VIEWER_CMDS
+
+define RPI_RGB_LED_MATRIX_INSTALL_IMAGE_VIEWER_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/utils/led-image-viewer $(TARGET_DIR)/usr/bin/led-image-viewer
+endef
+RPI_RGB_LED_MATRIX_POST_INSTALL_TARGET_HOOKS += RPI_RGB_LED_MATRIX_INSTALL_IMAGE_VIEWER_CMDS
+endif
+
+ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_TEXT_SCROLLER),y)
+define RPI_RGB_LED_MATRIX_BUILD_TEXT_SCROLLER_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/utils text-scroller
+endef
+RPI_RGB_LED_MATRIX_POST_BUILD_HOOKS += RPI_RGB_LED_MATRIX_BUILD_TEXT_SCROLLER_CMDS
+
+define RPI_RGB_LED_MATRIX_INSTALL_TEXT_SCROLLER_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/utils/text-scroller $(TARGET_DIR)/usr/bin/text-scroller
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/rpi-rgb-led-matrix/fonts/
+	$(INSTALL) -m 0644 $(@D)/fonts/*.bdf $(TARGET_DIR)/usr/share/rpi-rgb-led-matrix/fonts/
+endef
+RPI_RGB_LED_MATRIX_POST_INSTALL_TARGET_HOOKS += RPI_RGB_LED_MATRIX_INSTALL_TEXT_SCROLLER_CMDS
+endif
+
+ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER),y)
+RPI_RGB_LED_MATRIX_DEPENDENCIES += ffmpeg
+
+define RPI_RGB_LED_MATRIX_BUILD_VIDEO_VIEWER_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		AV_CXXFLAGS="$(shell $(HOST_DIR)/bin/pkg-config --cflags libavcodec libavformat libswscale libavutil)" \
+		AV_LDFLAGS="$(shell $(HOST_DIR)/bin/pkg-config --libs libavcodec libavformat libswscale libavutil)" \
+		-C $(@D)/utils video-viewer
+endef
+RPI_RGB_LED_MATRIX_POST_BUILD_HOOKS += RPI_RGB_LED_MATRIX_BUILD_VIDEO_VIEWER_CMDS
+
+define RPI_RGB_LED_MATRIX_INSTALL_VIDEO_VIEWER_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/utils/video-viewer $(TARGET_DIR)/usr/bin/video-viewer
+endef
+RPI_RGB_LED_MATRIX_POST_INSTALL_TARGET_HOOKS += RPI_RGB_LED_MATRIX_INSTALL_VIDEO_VIEWER_CMDS
+endif
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
