Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1D6C7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 10:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84BD181656;
	Sun, 22 Jun 2025 10:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jio2FLSDkS7f; Sun, 22 Jun 2025 10:59:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EC8781E2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EC8781E2A;
	Sun, 22 Jun 2025 10:59:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 378EE154
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CB0E60C11
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zo-TQnLW2zVm for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 10:59:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3296760A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3296760A54
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3296760A54
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:59:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bd3.dip0.t-ipconnect.de [91.58.11.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47544A4C2417
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 12:59:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36454)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uTIPy-000000006HT-1ZaH
 for buildroot@buildroot.org; Sun, 22 Jun 2025 10:59:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 12:59:22 +0200
Message-Id: <20250622105922.2981702-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750589963;
 bh=Xxz5lnBw9wAG0hUL6ay+cYWWpsuvPWyzIqLydHdaGDg=;
 h=From:To:Subject:Date:From;
 b=YL1pWuVCsJHz6m0BKBkKkBYXVsB8Qt6qwyBVMTGYC8invV7/E9/u7y+9+78lh+Tu4
 dympbHWAhxnqGdajIyxuQ8bHYAuqHR0sJXgjbmABU1182+FVfzycVrdUFk0LFmvI7o
 cnuyb3U4zzRfNVlSrkA0Qj7XxB/dNcodLadlpDVe2TP0vRnvsEhlBfYLafwi7zEu/+
 HSu5It6EUERgdqnaAE1vMd/qM2kfmm44qLcJxyz5LaSjLlff3pteuoOEFZ6GfA+v8t
 6nwcXgunoHKlal03kvz5gRLMp6EelFqBrzq4x9UJpbjhvKRr6T1AEZ5AER9D0zfGze
 FZM+ilpL0Aq6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=YL1pWuVC
Subject: [Buildroot] [PATCH/next RFC 1/1] package/opencv3: disable ffmpeg
 support
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

OpenCV3 is incompatible with the upcoming bump of ffmpeg to 7.1.x.

According to the OpenCV3 changelog no new release will occur for the 3.x
branch:
https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs-v2.2%E2%80%90v4.10#version3420
"OpenCV 3.4.20 is last official release in 3.4 branch."

Therefore ffmpeg support is removed so an unmaintained package does not
block the version bump of ffmpeg.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
I sent this patch as RFC for the 2025.11 release because I do not think
the ffmpeg 7.x bump, needed[1] for Kodi 22, will occur in this release
cycle due to Kodi 22 most likely not being released during this period.
But already now it is clear to me that OpenCV3 will lose its ffmpeg
support, see the patch comment above.

I would like to suggest however that we remove OpenCV3 completely from
buildroot and replace it, where possible, with OpenCV4.
In preparation for this switch I sent patches for packages already
having working OpenCV4 support.

Beyond that I identified packages with optional dependencies to OpenCV3
which are incompatible with OpenCV4:
- gtkiostream
- mjpg-streamer: https://github.com/jacksonliam/mjpg-streamer/commit/216c090707ffd71fdf86b0c5b182954846e01bd4
- vlc: https://code.videolan.org/videolan/vlc/-/merge_requests/927

Which way do you prefer?
Remove ffmpeg support from OpenCV3 and keep the package or remove
the OpenCV3 package?

[1] https://github.com/xbmc/xbmc/commit/72fe098c8436c96763f677b4c65d32988b931b5b

 package/opencv3/Config.in  | 9 ---------
 package/opencv3/opencv3.mk | 8 +-------
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index a672497108..097201887f 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -241,15 +241,6 @@ config BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS
 
 comment "3rd party support"
 
-config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
-	bool "ffmpeg support"
-	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_SWSCALE
-	help
-	  Use ffmpeg from the target system.
-
 config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1
 	bool "gstreamer-1.x"
 	depends on BR2_USE_MMU # gstreamer1 -> libglib2
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 218174c17e..a66c7a011e 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -226,17 +226,11 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_VA=OFF \
 	-DWITH_VA_INTEL=OFF \
 	-DWITH_VTK=OFF \
+	-DWITH_FFMPEG=OFF \
 	-DWITH_XINE=OFF
 
 OPENCV3_DEPENDENCIES += host-pkgconf zlib
 
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),y)
-OPENCV3_CONF_OPTS += -DWITH_FFMPEG=ON
-OPENCV3_DEPENDENCIES += ffmpeg bzip2
-else
-OPENCV3_CONF_OPTS += -DWITH_FFMPEG=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1),y)
 OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=ON
 OPENCV3_DEPENDENCIES += gstreamer1 gst1-plugins-base
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
