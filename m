Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD266C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 17:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A41E40B47;
	Tue, 23 Jul 2024 17:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttPlyedK3lvx; Tue, 23 Jul 2024 17:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2E9B40AA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2E9B40AA2;
	Tue, 23 Jul 2024 17:14:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8789A1BF83E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 17:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 740BB402F4
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 17:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgSLWQZcZNET for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 17:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2858340299
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2858340299
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2858340299
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 17:14:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3684eb5be64so2970832f8f.3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721754879; x=1722359679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e+oyxrolNHziMj6gZvZlk0QRJ8ubckgPAxGMf0JRBaU=;
 b=jU646Ebk7H3b+E839EL9KimtLrv+rEqk98cDlm26kC2tBDk3DC/3Ut322ghrBnTHFh
 T7/tQX6OKhVea/S4ZrYDyTGMjxZXejrJdsC5n/pRdScW0xTsKU15tLp9v1YlUT++SER6
 oEOanv+gFzQgHdOXu+drkpT7BzfFz6iLOLXr84gdmH3VPMhgHPyRIuMJaZbIr7w6sK9e
 IHCtAsjOuu1bxccpcFqOPW1URP2mxpuYqTtl9zI25nLQBwzN2rI6a+M9RXmjj/P6DqQS
 1atSKP8nKdaI8dhwZfNzalwozylzM6pNyKf1fFZqJXgRqpPjUz8G2iviPX2GDHQ/f3wF
 bYRg==
X-Gm-Message-State: AOJu0YzvN66vx2Hw7aYxmyObe4Aa+oDp0lVxBjM8dwZ9BdfGGxM0iHZn
 +WJ7elu4JPVbk0KyviYFPy4+6Axr/x6sbQojEE5OJj/ATIWXgMDdyLOWzA==
X-Google-Smtp-Source: AGHT+IGl/V6l7QgUWAxdSq4+a8vvEJFNmJId75IFR4QpvNv/pQpDoxK7t3kNIeBOBLWS1PcvCf0DNQ==
X-Received: by 2002:a5d:6b09:0:b0:367:8383:6305 with SMTP id
 ffacd0b85a97d-369dee62a72mr2066024f8f.55.1721754878510; 
 Tue, 23 Jul 2024 10:14:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ed7b8sm12042323f8f.106.2024.07.23.10.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 10:14:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 19:14:35 +0200
Message-ID: <20240723171435.1231918-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721754879; x=1722359679; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e+oyxrolNHziMj6gZvZlk0QRJ8ubckgPAxGMf0JRBaU=;
 b=XbGqHR4cLsw5kInQ+0I5qnbg+njInwrw0Zfszai4iozca9fbn4usll0l2knCQkHSt+
 tAFGY7Vp9Cn9sgBiTzojpoNKRFOEH4t8CJkRr0Ix5oedUnjA5hjNVbmKHmwxiPrcNSYs
 rZFCDiK27wo9UHxXLrsoEbDYn28RYhVbhowg9wA6KUZRYsThlL9y7mYfwR+FaiOCeZfD
 GhXZvkIvH1t65Hmb9Tt72Fg23RJcIKn4pFDFRDQExQUWf0ORlDnLyAFBM87dplUPORxp
 nK8IOdSirdGYu44P2v75HvMiFRrl/LWzmB6KaGsgAiH/+sZV5R8q6CPUCj22krvE8cPF
 3n6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XbGqHR4c
Subject: [Buildroot] [PATCH 1/1] package/libcamera-apps: bump to version
 1.5.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use official tarball
- Switch to meson-package
- libcamera-apps unconditionally uses linux/dma-heap.h since version
  1.3.0 and
  https://github.com/raspberrypi/rpicam-apps/commit/11338687635cc5564c348c2f60c8c58c5779151d
  which is only available since kernel >= 5.5 and
  https://github.com/torvalds/linux/commit/a69b0e855d3fd278ff6f09a23e1edf929538e304
- This bump will fix the following build failure raised since bump of
  libcamera to version 0.3.0 in commit
  82efc2faa923e8881748738963be1fbe3cb2bb45:

/workdir/instance-1/output-1/build/libcamera-apps-1.2.1/core/libcamera_app.cpp: In member function 'void LibcameraApp::ConfigureViewfinder()':
/workdir/instance-1/output-1/build/libcamera-apps-1.2.1/core/libcamera_app.cpp:327:25: error: 'class libcamera::CameraConfiguration' has no member named 'transform'
  327 |         configuration_->transform = options_->transform;
      |                         ^~~~~~~~~

It shall be noted that upstream changed its name from libcamera-apps to
rpicam-apps perhaps the package shall also be renamed on buildroot side

Fixes: 82efc2faa923e8881748738963be1fbe3cb2bb45
 - http://autobuild.buildroot.org/results/18bb6d9c88c1a813a350658b251293744e161916

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcamera-apps/Config.in           |  9 ++++--
 package/libcamera-apps/libcamera-apps.hash |  2 +-
 package/libcamera-apps/libcamera-apps.mk   | 32 ++++++++++------------
 3 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index 711fd6de05..f169d8c52e 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libcamera
 	depends on !BR2_STATIC_LIBS # gnutls/libcamera
 	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_JPEG
@@ -24,7 +25,9 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 
 	  https://github.com/raspberrypi/libcamera-apps
 
-comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
+comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, headers >= 5.5"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index 1437a0e8fa..00b499d247 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e6b74a0ba10a962f1930199d7dd828c8d9ee370dfe1fdfd8ae2638df744f1344  libcamera-apps-1.2.1.tar.gz
+sha256  576bcd585f1c8d8bc80e37fa3c8a172e9d1c8406490438cf6d0fbc7ba4996ec1  rpicam-apps-1.5.0.tar.xz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 2a217f095f..17983bb8ca 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.2.1
-LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
+LIBCAMERA_APPS_VERSION = 1.5.0
+LIBCAMERA_APPS_SOURCE = rpicam-apps-$(LIBCAMERA_APPS_VERSION).tar.xz
+LIBCAMERA_APPS_SITE = https://github.com/raspberrypi/rpicam-apps/releases/download/v$(LIBCAMERA_APPS_VERSION)
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
 LIBCAMERA_APPS_DEPENDENCIES = \
@@ -18,42 +19,37 @@ LIBCAMERA_APPS_DEPENDENCIES = \
 	tiff
 
 LIBCAMERA_APPS_CONF_OPTS = \
-	-DENABLE_COMPILE_FLAGS_FOR_TARGET=disabled \
-	-DENABLE_OPENCV=0 \
-	-DENABLE_TFLITE=0
+	-Denable_opencv=disabled \
+	-Denable_tflite=disabled
 
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 LIBCAMERA_APPS_DEPENDENCIES += libdrm
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_drm=enabled
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_drm=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_LIBDRM),yy)
 LIBCAMERA_APPS_DEPENDENCIES += ffmpeg libdrm
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=enabled
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBCAMERA_APPS_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
 	$(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_X11=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=enabled
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_X11=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_QT5),y)
 LIBCAMERA_APPS_DEPENDENCIES += qt5base
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_QT=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_qt=enabled
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_QT=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_qt=disabled
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LIBCAMERA_APPS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-endif
-
-$(eval $(cmake-package))
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
