Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000C2CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 12:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90CD0610C6;
	Sun, 12 Oct 2025 12:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMUIpJkWLiIq; Sun, 12 Oct 2025 12:10:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CC4610B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CC4610B5;
	Sun, 12 Oct 2025 12:10:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD3A812B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 12:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1C49810AC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 12:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H62jZ8Jq8hDw for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 12:10:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 078AE81144
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 078AE81144
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 12:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB276870CD; Sun, 12 Oct 2025 12:10:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 13:43:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2adac697ff59697195497baa958ec54cb78f5c05
X-Git-Newrev: 51cfb92e6d89476e7318b209ade4f805a5ec529f
X-Patchwork-Hint: ignore
Message-Id: <20251012121021.EB276870CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aubio: fix build with ffmpeg 8.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=51cfb92e6d89476e7318b209ade4f805a5ec529f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-source_avcodec-fix-build-with-ffmpeg-8.0.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/aubio/0002-source_avcodec-fix-build-with-ffmpeg-8.0.patch b/package/aubio/0002-source_avcodec-fix-build-with-ffmpeg-8.0.patch
new file mode 100644
index 0000000000..db5003e76b
--- /dev/null
+++ b/package/aubio/0002-source_avcodec-fix-build-with-ffmpeg-8.0.patch
@@ -0,0 +1,37 @@
+From d79fa30d780eca95548352ce01cf9104f46aeec4 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 5 Oct 2025 11:37:52 +0200
+Subject: [PATCH] [source_avcodec] fix build with ffmpeg 8.0
+
+AV_INPUT_BUFFER_MIN_SIZE was removed with upstream commit
+https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=1d66a122df9fd5d8400b05c74462d0082990fc01
+
+A similar fix is used by Arch Linux:
+https://gitlab.archlinux.org/archlinux/packaging/packages/aubio/-/commit/bdf858e4291aa170a23c470ac1caf2c827bfd01d
+
+Upstream: https://github.com/aubio/aubio/pull/427
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/io/source_avcodec.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/io/source_avcodec.c b/src/io/source_avcodec.c
+index 71ea8b5f..1fb14bf5 100644
+--- a/src/io/source_avcodec.c
++++ b/src/io/source_avcodec.c
+@@ -67,7 +67,11 @@
+ #if LIBAVCODEC_VERSION_INT < AV_VERSION_INT(56, 56, 0)
+ #define AUBIO_AVCODEC_MAX_BUFFER_SIZE FF_MIN_BUFFER_SIZE
+ #else
++#if LIBAVCODEC_VERSION_INT < AV_VERSION_INT(60, 40, 100)
+ #define AUBIO_AVCODEC_MAX_BUFFER_SIZE AV_INPUT_BUFFER_MIN_SIZE
++#else
++#define AUBIO_AVCODEC_MAX_BUFFER_SIZE 16384
++#endif
+ #endif
+ 
+ #if LIBAVCODEC_VERSION_MAJOR >= 59
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
