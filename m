Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC4DCAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 14:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B83140239;
	Fri,  3 Oct 2025 14:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poPHCSRMLg30; Fri,  3 Oct 2025 14:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02C3940F5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02C3940F5B;
	Fri,  3 Oct 2025 14:31:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41F7F91C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 14:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28B436124A
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 14:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NctyVJmhuNVv for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 14:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15C32611FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C32611FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15C32611FB
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 14:30:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc8f.dip0.t-ipconnect.de [79.214.204.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2170FA4C5D13;
 Fri,  3 Oct 2025 16:30:45 +0200 (CEST)
Received: from [192.168.1.144] (port=36342 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4go0-00000000316-2kte;
 Fri, 03 Oct 2025 14:30:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Fri,  3 Oct 2025 16:30:43 +0200
Message-ID: <20251003143043.641856-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251003143043.641856-1-bernd@kuhls.net>
References: <20251003143043.641856-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759501845;
 bh=9iFS5YXydo2Nm3bbzfIkOhuegZmN7jRcBZ2x3VDTsIo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TmekjWmXMMd3KeHptzG/x1nrCixQnd9SXpcxPHmiGEeNSgDw2doo9MJ2/YI1VsrIV
 oEHI7ull3fg5xHjP0diCSeGGVnYMG1XvrakR3c1NH0rq1H/MS6s9Hni//ieWIvCXfN
 wJ828T1C5SMdK+9ZAGXSeGssE7F9XxLpF/zC083OBzHg1eE6f3irctFKiT8NevNum3
 c6ULg04ORURh0ArjV0jzSTaLCLL5f95mfL5QyGVcBcbR4IQi3i4PBFPdLxDlfqj0mi
 SWltsBYlVHvaODIa1G0JQyIPGnc1pGSnD3t6waHxWSalfTJvblQ7lopZzGaIahX5QJ
 7ttMnSLJBYLgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=TmekjWmX
Subject: [Buildroot] [PATCH 2/2] package/mpv: bump version to 0.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added upstream patch to fix build with ffmpeg 8.0.

Added dependency to libplacebo:
https://github.com/mpv-player/mpv/commit/f5ca11e12bc55d14bd6895b619c4abfd470c6452

Added optional dependency to libdisplay-info when libdrm is enabled:
https://github.com/mpv-player/mpv/commit/a4d9bdd262b808d0c8663d28023ff21fef862803

Removed rpi-specific code:
https://github.com/mpv-player/mpv/commit/343a5fd345a84572ea5693a805119067d5b0fbc8

Removed configure options for atomic support:
https://github.com/mpv-player/mpv/commit/2fa695c3f9d4164344228ef4083e87369de3bb33

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...mpilation-after-deprecated-definitio.patch | 39 +++++++++++++++++++
 package/mpv/Config.in                         | 12 ++++--
 package/mpv/mpv.hash                          |  4 +-
 package/mpv/mpv.mk                            | 22 +++--------
 4 files changed, 55 insertions(+), 22 deletions(-)
 create mode 100644 package/mpv/0001-demux_mkv-fix-compilation-after-deprecated-definitio.patch

diff --git a/package/mpv/0001-demux_mkv-fix-compilation-after-deprecated-definitio.patch b/package/mpv/0001-demux_mkv-fix-compilation-after-deprecated-definitio.patch
new file mode 100644
index 0000000000..8e216497f4
--- /dev/null
+++ b/package/mpv/0001-demux_mkv-fix-compilation-after-deprecated-definitio.patch
@@ -0,0 +1,39 @@
+From 26b29fba02a2782f68e2906f837d21201fc6f1b9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>
+Date: Fri, 28 Mar 2025 19:12:01 +0100
+Subject: [PATCH] demux_mkv: fix compilation after deprecated definitions
+ removal
+
+See: https://github.com/FFmpeg/FFmpeg/commit/822432769868da325ba03774df1084aa78b9a5a0
+
+Upstream: https://github.com/mpv-player/mpv/commit/26b29fba02a2782f68e2906f837d21201fc6f1b9
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ demux/demux_mkv.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/demux/demux_mkv.c b/demux/demux_mkv.c
+index 135edcc23d82b..cc7ce3e98f4f6 100644
+--- a/demux/demux_mkv.c
++++ b/demux/demux_mkv.c
+@@ -2200,16 +2200,16 @@ static int demux_mkv_open_sub(demuxer_t *demuxer, mkv_track_t *track)
+             // [0x30..0x37] are component tags utilized for
+             // non-mobile captioning service ("profile A").
+             if (component_tag >= 0x30 && component_tag <= 0x37)
+-                lav->profile = FF_PROFILE_ARIB_PROFILE_A;
++                lav->profile = AV_PROFILE_ARIB_PROFILE_A;
+             break;
+         case 0x0012:
+             // component tag 0x87 signifies a mobile/partial reception
+             // (1seg) captioning service ("profile C").
+             if (component_tag == 0x87)
+-                lav->profile = FF_PROFILE_ARIB_PROFILE_C;
++                lav->profile = AV_PROFILE_ARIB_PROFILE_C;
+             break;
+         }
+-        if (lav->profile == FF_PROFILE_UNKNOWN)
++        if (lav->profile == AV_PROFILE_UNKNOWN)
+             MP_WARN(demuxer, "ARIB caption profile %02x / %04x not supported.\n",
+                     component_tag, data_component_id);
+     }
diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 5c32f593fe..a4515a97e0 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -6,18 +6,21 @@ config BR2_PACKAGE_MPV_SUPPORTS_VAAPI
 
 config BR2_PACKAGE_MPV
 	bool "mpv"
-	depends on BR2_INSTALL_LIBSTDCPP # libass
+	depends on BR2_INSTALL_LIBSTDCPP # libass, libplacebo
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libplacebo
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_STATIC_LIBS # libplacebo
 	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_LIBDISPLAY_INFO if BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_LIBASS
+	select BR2_PACKAGE_LIBPLACEBO
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	# Select xkbcommon for wayland to avoid being mysterious
@@ -35,10 +38,11 @@ config BR2_PACKAGE_MPV
 
 	  https://mpv.io/
 
-comment "mpv needs a toolchain w/ C++, NPTL, gcc >= 4.9"
+comment "mpv needs a toolchain w/ C++, NPTL, gcc >= 10, dynamic library"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
+		BR2_STATIC_LIBS
diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index a09015619d..55011bf339 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  41df981b7b84e33a2ef4478aaf81d6f4f5c8b9cd2c0d337ac142fc20b387d1a9  mpv-0.35.1.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL
+sha256  10a0f4654f62140a6dd4d380dcf0bbdbdcf6e697556863dc499c296182f081a3  mpv-0.40.0.tar.gz
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  LICENSE.GPL
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 8832b68ece..29d4ebfaf7 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.35.1
+MPV_VERSION = 0.40.0
 MPV_SITE = $(call github,mpv-player,mpv,v$(MPV_VERSION))
 MPV_DEPENDENCIES = \
-	host-pkgconf ffmpeg libass zlib \
+	host-pkgconf ffmpeg libass libplacebo zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 MPV_LICENSE = GPL-2.0+
 MPV_LICENSE_FILES = LICENSE.GPL
@@ -37,6 +37,10 @@ else
 MPV_CONF_OPTS += -Dalsa=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDISPLAY_INFO),y)
+MPV_DEPENDENCIES += libdisplay-info
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
 MPV_CONF_OPTS += -Dgbm=enabled
 MPV_DEPENDENCIES += mesa3d
@@ -162,14 +166,6 @@ else
 MPV_CONF_OPTS += -Dsdl2=disabled
 endif
 
-# Raspberry Pi support
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-MPV_CONF_OPTS += -Drpi=enabled -Dgl=enabled
-MPV_DEPENDENCIES += rpi-userland
-else
-MPV_CONF_OPTS += -Drpi=disabled
-endif
-
 # va-api support
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += -Dvaapi=enabled
@@ -214,10 +210,4 @@ else
 MPV_CONF_OPTS += -Dx11=disabled
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-MPV_CONF_OPTS += -Dstdatomic=enabled
-else
-MPV_CONF_OPTS += -Dstdatomic=disabled
-endif
-
 $(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
