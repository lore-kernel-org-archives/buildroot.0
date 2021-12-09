Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F433C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 21:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A0FC6F4E8;
	Thu,  9 Dec 2021 21:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpJrv9Y7CbdR; Thu,  9 Dec 2021 21:32:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7199D6F4EC;
	Thu,  9 Dec 2021 21:32:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6904F1BF868
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 21:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D78F860E4
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 21:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SInlB-0pzxQT for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 21:32:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B23A9860E5
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 21:32:22 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d24so12084073wra.0
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 13:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jj4PBRS4IwxSWF1utf9yGQYEshqQB8rJfRrpmycNwpE=;
 b=FhkDJSpWTDPQ76E3KR247SKlraZR3l1vUdZRA0pckuE36UUlIDxtzzHPUg+H3CC/SX
 R0lWnrbjFkNt2kFAb9HjZRSADgHcJ3rlYSoVbjO7UGoHkfN54nqB9c1RKI6E7F2HxOoO
 m7lHmQGTyayGAlNjIxZz+DZ6l7FwF3+azkelSaytq3bLLJ8yqgDHkZSP9ZDX1F1Pdbzj
 8BAqBeZ08KhsTzhOQNfL2Orso/R2mrzBN2edd6GyltD6nxn4M9heqVD+LtWRx9tBrgIV
 UKaTNq0bZgxVi4eOomnVQo5AkGTthJXLXjdnpSqvwlhWAAnJhjxrsZW12J+Pfb+K1Bv4
 nHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jj4PBRS4IwxSWF1utf9yGQYEshqQB8rJfRrpmycNwpE=;
 b=nZv/SlOGW4eUjFyn2brRvkIx913rp9gmyPnrMI1f6uJwoMdEreuiahWMY356qZA+Wv
 O7XpnA2ThgbePK/Urzg7/OWIvtvhOkxgatMXb1OC/mAsrhUDHSCFCEGv8cNP2DZZ1xi2
 5DMMotv7u8sFEWGcK+zo6K9kFfX8A701nX6FmS4Xf+HmizOQQvbyDMw98SLhHxRU1Sr8
 7kVGEMw8oYXBKbnJfU4WyH1WBqShJsNu9VbEHseTlNcEFN3BGvlFxOYVJ/xzy2NNDg2g
 EqSkTEMYyS2dnE6/D5Ug+/OOEMscMPM/bl6gr2leelYk7r5191+tFSBrzzqU/fJijv5A
 oTjg==
X-Gm-Message-State: AOAM531Mjar8sg3mIH2yMSFwsc+u21G2jvHBCU/mGFRhkojJPNteAGlt
 UFPOizR3fzWhnxWQQELzp0dERd6cxITlEg==
X-Google-Smtp-Source: ABdhPJySM0p7HpcuCqtgc6qxCYwR/O6G/Xf2ZeqFq/KBUp4ZzMbNPUU1wh1gX6DfzSYFSoZgEVLvAQ==
X-Received: by 2002:adf:8bd2:: with SMTP id w18mr9097255wra.557.1639085540714; 
 Thu, 09 Dec 2021 13:32:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id w17sm912905wmc.14.2021.12.09.13.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 13:32:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 22:32:06 +0100
Message-Id: <20211209213206.3918378-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpi-rgb-led-matrix: needs -fPIC
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit e821078031e14df69e5142f23e9cb7b5a1ea0e77:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: led-matrix.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZTVN10rgb_matrix11FrameCanvasE' which may bind externally can not be used when making a shared object; recompile with -fPIC

Fixes:
 - http://autobuild.buildroot.org/results/be291d6b0efdc1914babfb4a9be5eb863058eaf5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
