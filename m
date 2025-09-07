Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B4FCAC581
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 13:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 926F484765;
	Sun,  7 Sep 2025 13:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwDKMOr_pjZV; Sun,  7 Sep 2025 13:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B87B84769
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B87B84769;
	Sun,  7 Sep 2025 13:37:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6A70CA
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A90DA8475D
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLPi9Kw_YW6Z for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 13:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1A1284756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A1284756
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1A1284756
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 49CE04E40C49
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 243DD6061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 634AE102F1C62; 
 Sun,  7 Sep 2025 15:37:27 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Sep 2025 15:37:15 +0200
Message-ID: <20250907133721.3416326-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
References: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757252247; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=+A0MZcP7jwKTJpHMFl6myU48Asm7cMGuVVBsEeBlsC4=;
 b=c+J/Osa6BBYLkK/BznfcZcUR+roGojSG9n5FIbAVYnFdng/yQz0g9HzcN2ABccW0GibVvX
 u/It9L1vsskyb6qXbrcRb8CRwBdF5rry+HRdmfn5sTFa3nAc+h6/1YTx+Q9IzPdJTqpsC1
 6qSvu4BJck8RTE3mmK2STb27nHzrppgKQ9VZgnoR5P4UNZHLKETsaVfK6taMNQy88MVr3e
 Kir/FYB8PLyVQyavkh5i370H63z4LHzLo+xxzioT7y5OCIc4JO0zE4uJ22P9JcSnddmZyK
 wrxAlZ/iAya+3aNhhaxtDST8gD4d3imrXiH2qbvtKU89GdYMD2zD4GW5w3x16A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=c+J/Osa6
Subject: [Buildroot] [PATCH 4/6] package/mediastreamer: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mediastreamer was only needed as a dependency of linphone, as is
anyway bundled in more recent versions of linphone, making a separate
package unnnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |   2 -
 Config.in.legacy                              |   8 +
 package/Config.in                             |   1 -
 ...-nowebcam.c-fix-build-without-ffmpeg.patch |  55 ------
 ...FER_PADDING_SIZE-to-determine-paddin.patch |  46 -----
 package/mediastreamer/Config.in               |  28 ---
 package/mediastreamer/mediastreamer.hash      |   3 -
 package/mediastreamer/mediastreamer.mk        | 179 ------------------
 8 files changed, 8 insertions(+), 314 deletions(-)
 delete mode 100644 package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
 delete mode 100644 package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
 delete mode 100644 package/mediastreamer/Config.in
 delete mode 100644 package/mediastreamer/mediastreamer.hash
 delete mode 100644 package/mediastreamer/mediastreamer.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index a89542365e..9df46e09c9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -727,8 +727,6 @@ package/matchbox-panel/0003-mb-applet-battery.patch lib_patch.Upstream
 package/matchbox-startup-monitor/0001-true-false.patch lib_patch.Upstream
 package/matchbox/0001-defaulttheme.patch lib_patch.Upstream
 package/matchbox/0002-src-Fix-build-with-gcc-10.patch lib_patch.Upstream
-package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch lib_patch.Upstream
-package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch lib_patch.Upstream
 package/memstat/0001-PATH_MAX.patch lib_patch.Upstream
 package/mender-connect/S43mender-connect Shellcheck
 package/menu-cache/0001-Support-gcc10-compilation.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 3e7bd457a6..0f3120e27b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_MEDIASTREAMER
+	bool "mediastreamer has been removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as part of the linphone
+	  removal. In addition, newer version of linphone directly
+	  bundle mediastreamer making a separate package unnecessary.
+
 config BR2_PACKAGE_BELR
 	bool "belr has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 989d7a1efd..2e841c12b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2013,7 +2013,6 @@ menu "Multimedia"
 	source "package/libvpx/Config.in"
 	source "package/libyuv/Config.in"
 	source "package/live555/Config.in"
-	source "package/mediastreamer/Config.in"
 	source "package/x264/Config.in"
 	source "package/x265/Config.in"
 endmenu
diff --git a/package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch b/package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
deleted file mode 100644
index 8e7812c389..0000000000
--- a/package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 342f59f1603f759b6dd90754f8dba14d08947f55 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 27 Feb 2020 16:18:35 +0100
-Subject: [PATCH] src/videofilters/nowebcam.c: fix build without ffmpeg or jpeg
-
-jpeg2yuv is only defined if ffmpeg or turbojpeg is available
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt              | 3 +++
- src/videofilters/nowebcam.c | 4 ++++
- 2 files changed, 7 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0efc1a5f..6668db2b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -336,7 +336,10 @@ if(ENABLE_JPEG)
- 	if(NOT TURBOJPEG_FOUND)
- 		message(WARNING "Could not find libturbo-jpeg, mediastreamer2 will be compiled without LibJpeg-Turbo")
- 		set(ENABLE_JPEG OFF CACHE BOOL "Enable JPEG support" FORCE)
-+		add_definitions(-DNO_JPEG)
- 	endif()
-+else()
-+	add_definitions(-DNO_JPEG)
- endif()
- if(ENABLE_QRCODE)
- 	find_package(Zxing)
-diff --git a/src/videofilters/nowebcam.c b/src/videofilters/nowebcam.c
-index a2344dcd..afb0d7b1 100644
---- a/src/videofilters/nowebcam.c
-+++ b/src/videofilters/nowebcam.c
-@@ -107,7 +107,9 @@ static mblk_t *_ms_load_jpeg_as_yuv(const char *jpgpath, MSVideoSize *reqsize) {
- 	if (err != st_sizel) {
- 		  ms_error("Could not read as much as wanted !");
- 	}
-+#if !(defined(NO_FFMPEG) && defined(NO_JPEG))
- 	m = jpeg2yuv(jpgbuf, st_sizel, reqsize);
-+#endif
- 	ms_free(jpgbuf);
- 	if (m == NULL) {
- 		CloseHandle(fd);
-@@ -140,7 +142,9 @@ static mblk_t *_ms_load_jpeg_as_yuv(const char *jpgpath, MSVideoSize *reqsize) {
- 		if (err != statbuf.st_size) {
- 			ms_error("Could not read as much as wanted: %i<>%li !", err, (long)statbuf.st_size);
- 		}
-+#if !(defined(NO_FFMPEG) && defined(NO_JPEG))
- 		m = jpeg2yuv(jpgbuf,statbuf.st_size,reqsize);
-+#endif
- 		ms_free(jpgbuf);
- 		if (m == NULL) {
- 			close(fd);
--- 
-2.25.0
-
diff --git a/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch b/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
deleted file mode 100644
index 9fd3fda2ec..0000000000
--- a/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 84b1919124884232e0fa30b30458470db27c73fc Mon Sep 17 00:00:00 2001
-From: James Cowgill <jcowgill@debian.org>
-Date: Sat, 18 Aug 2018 12:56:38 +0200
-Subject: [PATCH] Use AV_INPUT_BUFFER_PADDING_SIZE to determine padding
- size
-
-Hardcoding the value for FF_INPUT_BUFFER_PADDING_SIZE is not safe
-because  upstream FFmpeg might change it (as they did in FFmpeg 4.0).
-
-Instead, use FFmpeg's AV_INPUT_BUFFER_PADDING_SIZE if available and
-only hardcode a value if FFmpeg is disabled (in which case the value
-doesn't particularly matter anyway). For compatibility with older
-FFmpeg versions, define AV_INPUT_BUFFER_PADDING_SIZE if hasn't been
-defined yet.
-
-Downloaded from
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=901735
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Fabrice: updated for 4.3.1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- src/utils/ffmpeg-priv.h     | 4 ++++
- src/videofilters/nowebcam.c | 4 ++--
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/utils/ffmpeg-priv.h b/src/utils/ffmpeg-priv.h
-index c0745a9a..d59ea0e1 100644
---- a/src/utils/ffmpeg-priv.h
-+++ b/src/utils/ffmpeg-priv.h
-@@ -115,6 +115,10 @@
- extern "C" {
- #endif
- 
-+#ifndef AV_INPUT_BUFFER_PADDING_SIZE
-+#define AV_INPUT_BUFFER_PADDING_SIZE FF_INPUT_BUFFER_PADDING_SIZE
-+#endif
-+
- #ifndef HAVE_FUN_avcodec_encode_video2
- int avcodec_encode_video2 (AVCodecContext *avctx, AVPacket *avpkt, const AVFrame *frame, int *got_packet_ptr);
- #endif
--- 
-2.18.0
-
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
deleted file mode 100644
index e776b60df3..0000000000
--- a/package/mediastreamer/Config.in
+++ /dev/null
@@ -1,28 +0,0 @@
-config BR2_PACKAGE_MEDIASTREAMER
-	bool "mediastreamer"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # ortp
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
-	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_ALSA_LIB_PCM if BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_MBEDTLS
-	select BR2_PACKAGE_ORTP
-	help
-	  Mediastreamer is a powerful and lightweighted streaming
-	  engine specialized for voice/video telephony applications.
-
-	  It is the library that is responsible for all the receiving
-	  and sending of multimedia streams in linphone, including
-	  voice/video capture, encoding and decoding, and rendering.
-
-	  http://www.linphone.org/technical-corner/mediastreamer2
-
-comment "mediastreamer needs a toolchain w/ threads, C++, dynamic library, gcc >= 5"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
-comment "mediastreamer needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/mediastreamer/mediastreamer.hash b/package/mediastreamer/mediastreamer.hash
deleted file mode 100644
index dfa469d8dd..0000000000
--- a/package/mediastreamer/mediastreamer.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  64bdfe9dd6bfa64b492b21a45ad4bb36d67626a7f3b3ab2084a708864f129e84  mediastreamer-4.4.8.tar.gz
-sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
deleted file mode 100644
index febbb7b343..0000000000
--- a/package/mediastreamer/mediastreamer.mk
+++ /dev/null
@@ -1,179 +0,0 @@
-################################################################################
-#
-# mediastreamer
-#
-################################################################################
-
-MEDIASTREAMER_VERSION = 4.4.8
-MEDIASTREAMER_SITE = \
-	https://gitlab.linphone.org/BC/public/mediastreamer2/-/archive/$(MEDIASTREAMER_VERSION)
-MEDIASTREAMER_LICENSE = GPL-3.0+
-MEDIASTREAMER_LICENSE_FILES = LICENSE.txt
-MEDIASTREAMER_INSTALL_STAGING = YES
-MEDIASTREAMER_DEPENDENCIES = ortp
-MEDIASTREAMER_CONF_OPTS = \
-	-DENABLE_DOC=OFF \
-	-DENABLE_GL=OFF \
-	-DENABLE_GLX=OFF \
-	-DENABLE_MKV=OFF \
-	-DENABLE_SOUND=OFF \
-	-DENABLE_STRICT=OFF \
-	-DENABLE_TOOLS=OFF \
-	-DENABLE_UNIT_TESTS=OFF \
-	-DENABLE_ZRTP=OFF
-
-ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-MEDIASTREAMER_CONF_OPTS += \
-	-DENABLE_ALSA=ON \
-	-DENABLE_SOUND=ON
-MEDIASTREAMER_DEPENDENCIES += alsa-lib
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_ALSA=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_BCG729),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_G729=ON
-MEDIASTREAMER_DEPENDENCIES += bcg729
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_G729=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_JPEG=ON
-MEDIASTREAMER_DEPENDENCIES += jpeg
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_JPEG=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGSM),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_GSM=ON
-MEDIASTREAMER_DEPENDENCIES += libgsm
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_GSM=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBPCAP),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_PCAP=ON
-MEDIASTREAMER_DEPENDENCIES += libpcap
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_PCAP=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBSRTP),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_SRTP=ON
-MEDIASTREAMER_DEPENDENCIES += libsrtp
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_SRTP=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBVPX),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_VPX=ON
-MEDIASTREAMER_DEPENDENCIES += libvpx
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_VPX=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPUS),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_OPUS=ON
-MEDIASTREAMER_DEPENDENCIES += opus
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_OPUS=OFF
-endif
-
-# portaudio backend needs speexdsp as well
-ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEXDSP),yy)
-MEDIASTREAMER_CONF_OPTS += \
-	-DENABLE_PORTAUDIO=ON \
-	-DENABLE_SOUND=ON
-MEDIASTREAMER_DEPENDENCIES += portaudio
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_PORTAUDIO=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-MEDIASTREAMER_CONF_OPTS += \
-	-DENABLE_PULSEAUDIO=ON \
-	-DENABLE_SOUND=ON
-MEDIASTREAMER_DEPENDENCIES += pulseaudio
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_PULSEAUDIO=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SPEEX),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_CODEC=ON
-MEDIASTREAMER_DEPENDENCIES += speex
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_CODEC=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SPEEXDSP),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_DSP=ON
-MEDIASTREAMER_DEPENDENCIES += speexdsp
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_DSP=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_RESAMPLE=ON
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_RESAMPLE=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_FFMPEG=ON
-MEDIASTREAMER_DEPENDENCIES += ffmpeg
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_FFMPEG=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SDL),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_SDL=ON
-MEDIASTREAMER_DEPENDENCIES += sdl
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_SDL=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_X11=ON
-MEDIASTREAMER_DEPENDENCIES += xlib_libX11
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_X11=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_XV=ON
-MEDIASTREAMER_DEPENDENCIES += xlib_libXv
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_XV=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_THEORA=ON
-MEDIASTREAMER_DEPENDENCIES += libtheora
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_THEORA=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBV4L),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_V4L=ON
-MEDIASTREAMER_DEPENDENCIES += libv4l
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_V4L=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ZXING_CPP),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_QRCODE=ON
-MEDIASTREAMER_DEPENDENCIES += zxing-cpp
-else
-MEDIASTREAMER_CONF_OPTS += -DENABLE_QRCODE=OFF
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-MEDIASTREAMER_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
-endif
-
-$(eval $(cmake-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
