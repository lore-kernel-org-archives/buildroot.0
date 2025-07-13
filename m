Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED20C83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 11:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 249218195D;
	Sun, 13 Jul 2025 11:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9INm3StsLkS; Sun, 13 Jul 2025 11:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B3C181970
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B3C181970;
	Sun, 13 Jul 2025 11:06:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 265D05E
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D04440A2C
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MqdsDFPSYAi for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 11:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35A0440A21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35A0440A21
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:06:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14B6D86357; Sun, 13 Jul 2025 11:06:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Jul 2025 13:00:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9135a8a5aa1cedee9f5e3b38338f3a1f12e54607
X-Git-Newrev: aa187f62d6ef55f990fbe245d03f73c9b96ed5aa
X-Patchwork-Hint: ignore
Message-Id: <20250713110616.14B6D86357@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minidlna: Fix build with ffmpeg-7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa187f62d6ef55f990fbe245d03f73c9b96ed5aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-libav.h-fix-build-with-ffmpeg-7.0.patch   | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/minidlna/0001-libav.h-fix-build-with-ffmpeg-7.0.patch b/package/minidlna/0001-libav.h-fix-build-with-ffmpeg-7.0.patch
new file mode 100644
index 0000000000..888c867f36
--- /dev/null
+++ b/package/minidlna/0001-libav.h-fix-build-with-ffmpeg-7.0.patch
@@ -0,0 +1,48 @@
+From 5f698d645d71782c78e6495efd3b5e982f7db8c4 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 13 Apr 2024 15:03:34 +0200
+Subject: [PATCH] libav.h: fix build with ffmpeg 7.0
+
+The old bitmask-based channel layout API was removed:
+https://git.videolan.org/?p=ffmpeg.git;a=blob_plain;f=doc/APIchanges;hb=n7.0
+
+Upstream: https://sourceforge.net/p/minidlna/patches/204/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libav.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/libav.h b/libav.h
+index b69752c..d5a3358 100644
+--- a/libav.h
++++ b/libav.h
+@@ -174,7 +174,12 @@ lav_get_interlaced(AVStream *s)
+ #define lav_codec_tag(s) s->codecpar->codec_tag
+ #define lav_sample_rate(s) s->codecpar->sample_rate
+ #define lav_bit_rate(s) s->codecpar->bit_rate
++#if LIBAVCODEC_VERSION_MAJOR > 52 || \
++    (LIBAVCODEC_VERSION_MAJOR >= 52 && LIBAVCODEC_VERSION_MINOR >= 113)
++#define lav_channels(s) s->codecpar->ch_layout.nb_channels
++#else
+ #define lav_channels(s) s->codecpar->channels
++#endif
+ #define lav_width(s) s->codecpar->width
+ #define lav_height(s) s->codecpar->height
+ #define lav_profile(s) s->codecpar->profile
+@@ -186,7 +191,12 @@ lav_get_interlaced(AVStream *s)
+ #define lav_codec_tag(s) s->codec->codec_tag
+ #define lav_sample_rate(s) s->codec->sample_rate
+ #define lav_bit_rate(s) s->codec->bit_rate
++#if LIBAVCODEC_VERSION_MAJOR > 52 || \
++    (LIBAVCODEC_VERSION_MAJOR >= 52 && LIBAVCODEC_VERSION_MINOR >= 113)
++#define lav_channels(s) s->codec->ch_layout.nb_channels
++#else
+ #define lav_channels(s) s->codec->channels
++#endif
+ #define lav_width(s) s->codec->width
+ #define lav_height(s) s->codec->height
+ #define lav_profile(s) s->codec->profile
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
