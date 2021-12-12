Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789EFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E6D460E5E;
	Sun, 12 Dec 2021 14:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQwj5bkVR5kf; Sun, 12 Dec 2021 14:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8182B60D6A;
	Sun, 12 Dec 2021 14:13:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4801BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F3B48574B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZVEGixanaXf for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABBA68574E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CD59182D86; Sun, 12 Dec 2021 14:06:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:04:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d59055f791ff5f44f534e5f72ab6f2704091493
X-Git-Newrev: 04d69e105bc0de2926332ace94fb08b87cf7b5f6
X-Patchwork-Hint: ignore
Message-Id: <20211212140652.CD59182D86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-rgb-led-matrix: needs -fPIC
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

commit: https://git.buildroot.net/buildroot/commit/?id=04d69e105bc0de2926332ace94fb08b87cf7b5f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit e821078031e14df69e5142f23e9cb7b5a1ea0e77:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: led-matrix.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZTVN10rgb_matrix11FrameCanvasE' which may bind externally can not be used when making a shared object; recompile with -fPIC

Fixes:
 - http://autobuild.buildroot.org/results/be291d6b0efdc1914babfb4a9be5eb863058eaf5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
index b220bbc3db..85c1d1a320 100644
--- a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
+++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
@@ -10,8 +10,12 @@ RPI_RGB_LED_MATRIX_LICENSE = GPL-2.0
 RPI_RGB_LED_MATRIX_LICENSE_FILES = COPYING
 RPI_RGB_LED_MATRIX_INSTALL_STAGING = YES
 
+RPI_RGB_LED_MATRIX_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -fPIC"
+
 define RPI_RGB_LED_MATRIX_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lib all
+	$(MAKE) $(RPI_RGB_LED_MATRIX_MAKE_OPTS) -C $(@D)/lib all
 endef
 
 define RPI_RGB_LED_MATRIX_INSTALL_STAGING_CMDS
@@ -31,7 +35,7 @@ ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER),y)
 RPI_RGB_LED_MATRIX_DEPENDENCIES += graphicsmagick
 
 define RPI_RGB_LED_MATRIX_BUILD_IMAGE_VIEWER_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) $(RPI_RGB_LED_MATRIX_MAKE_OPTS) \
 		MAGICK_CXXFLAGS="-I$(STAGING_DIR)/usr/include/GraphicsMagick $(shell $(STAGING_DIR)/usr/bin/GraphicsMagick++-config --cxxflags)" \
 		MAGICK_LDFLAGS="-L$(STAGING_DIR)/usr/lib $(shell $(STAGING_DIR)/usr/bin/GraphicsMagick++-config --libs)" \
 		-C $(@D)/utils led-image-viewer
@@ -46,7 +50,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_TEXT_SCROLLER),y)
 define RPI_RGB_LED_MATRIX_BUILD_TEXT_SCROLLER_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/utils text-scroller
+	$(MAKE) $(RPI_RGB_LED_MATRIX_MAKE_OPTS) -C $(@D)/utils text-scroller
 endef
 RPI_RGB_LED_MATRIX_POST_BUILD_HOOKS += RPI_RGB_LED_MATRIX_BUILD_TEXT_SCROLLER_CMDS
 
@@ -62,7 +66,7 @@ ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER),y)
 RPI_RGB_LED_MATRIX_DEPENDENCIES += ffmpeg
 
 define RPI_RGB_LED_MATRIX_BUILD_VIDEO_VIEWER_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) $(RPI_RGB_LED_MATRIX_MAKE_OPTS) \
 		AV_CXXFLAGS="$(shell $(HOST_DIR)/bin/pkg-config --cflags libavcodec libavformat libswscale libavutil)" \
 		AV_LDFLAGS="$(shell $(HOST_DIR)/bin/pkg-config --libs libavcodec libavformat libswscale libavutil)" \
 		-C $(@D)/utils video-viewer
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
