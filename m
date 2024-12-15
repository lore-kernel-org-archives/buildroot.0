Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA43E7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 10:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1172884584;
	Sun, 15 Dec 2024 10:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsDPQy-PwTB1; Sun, 15 Dec 2024 10:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 216CE845B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 216CE845B1;
	Sun, 15 Dec 2024 10:55:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 851DD69
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6580441308
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4z7Pzg5pr4J for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 10:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08A9441301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08A9441301
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08A9441301
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:55:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c243.dip0.t-ipconnect.de [79.214.194.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 095E9A4C3E71;
 Sun, 15 Dec 2024 11:55:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54102)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMmHh-000000007l0-0c3i;
 Sun, 15 Dec 2024 10:55:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 11:55:34 +0100
Message-Id: <20241215105537.1396270-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241215105537.1396270-1-bernd@kuhls.net>
References: <20241215105537.1396270-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734260138;
 bh=nd4BDm6hgnx08scg8UUKsCFB9+yBp4cQHX3/52QhOvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D8sZVBmor7mvLFqxBAaXwcgFKtl2R/mdZDHce8xTaMNqyH+tPgteO12MZi9++NC+z
 C3QTbCOVp3tryljrhYD3xIJlTMLKYFLVJxjJo9QJDJ7eJDwAxPKzePBs6e7AMigZwI
 ofQxuJp9I0yjj43elLQu2AL3Iabnfsap3LO2fuOxjL7oKQ3mGaF3EVplD79OPsMKxb
 WySRAeNUVRz5Lc0i9o6bkKq6P00LdXmtjR0gF4POPn34YYZZ+IBLSfFLIW7Hezx6Ib
 9Yjuy4c6z+NMlliAKTwCOthPINLbitZIyKUQmZTeJ12VKlZedyvbqUqRpJKxhqDDJH
 CvDC2Nizm60zA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=D8sZVBmo
Subject: [Buildroot] [PATCH 2/5] package/webkitgtk: multimedia support needs
 gst1-plugins-bad
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error

--   Package 'gstreamer-webrtc-1.0' not found
-- Found GStreamer: GSTREAMER_INCLUDE_DIRS;GSTREAMER_LIBRARIES;GSTREAMER_VERSION;GSTREAMER_BASE_INCLUDE_DIRS;GSTREAMER_BASE_LIBRARIES;GSTREAMER_APP_INCLUDE_DIRS;GSTREAMER_APP_LIBRARIES;GSTREAMER_PBUTILS_INCLUDE_DIRS;GSTREAMER_PBUTILS_LIBRARIES;GSTREAMER_VIDEO_INCLUDE_DIRS;GSTREAMER_VIDEO_LIBRARIES;GSTREAMER_MPEGTS_INCLUDE_DIRS;GSTREAMER_MPEGTS_LIBRARIES;GSTREAMER_TAG_INCLUDE_DIRS;GSTREAMER_TAG_LIBRARIES;GSTREAMER_GL_INCLUDE_DIRS;GSTREAMER_GL_LIBRARIES;GSTREAMER_AUDIO_INCLUDE_DIRS;GSTREAMER_AUDIO_LIBRARIES;GSTREAMER_FFT_INCLUDE_DIRS;GSTREAMER_FFT_LIBRARIES;GSTREAMER_TRANSCODER_INCLUDE_DIRS;GSTREAMER_TRANSCODER_LIBRARIES (Required is at least version "1.18.4")
CMake Error at Source/cmake/GStreamerChecks.cmake:62 (message):
  GStreamerTranscoder >= 1.20 is needed for USE_GSTREAMER_TRANSCODER.
Call Stack (most recent call first):
  Source/cmake/OptionsGTK.cmake:478 (include)
  Source/cmake/WebKitCommon.cmake:237 (include)
  CMakeLists.txt:21 (include)

using this defconfig

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREADS=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_LIBGTK3=y
BR2_PACKAGE_WEBKITGTK=y
BR2_PACKAGE_WEBKITGTK_MULTIMEDIA=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/webkitgtk/webkitgtk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 9328327ac2..ecdb3c788c 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -47,7 +47,7 @@ WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=ON \
 	-DENABLE_WEB_AUDIO=ON \
 	-DENABLE_WEB_CODECS=ON
-WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base
+WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-bad gst1-plugins-base
 else
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=OFF \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
