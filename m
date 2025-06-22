Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D129EC7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 09:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F2640D13;
	Sun, 22 Jun 2025 09:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snEmmMuhSffT; Sun, 22 Jun 2025 09:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A29D40CD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A29D40CD9;
	Sun, 22 Jun 2025 09:41:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8A6B12C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EDF640CD9
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQV4VUASX49t for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 09:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1463E40CBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1463E40CBC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1463E40CBC
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:41:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bd3.dip0.t-ipconnect.de [91.58.11.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 70451A4C0D9B;
 Sun, 22 Jun 2025 11:41:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58460)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uTHCL-0000000016Q-0afl;
 Sun, 22 Jun 2025 09:41:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
Date: Sun, 22 Jun 2025 11:41:13 +0200
Message-Id: <20250622094113.3582035-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750585274;
 bh=S0Mm1JaoXuH0t5jCarH49YcYrjNmD/9RT2qkcem3Zx4=;
 h=From:To:Cc:Subject:Date:From;
 b=QCkbum25d+ERfH8+PbCUTLYZfyD5txYZad49UO1So7tRBw/p74sNS/WdCE/23rbhO
 B9823T+nJ+yhaMC9oOLbX46nZRcwMpxkpAxxVH6vMvCCTZ9+i64ee9F/0Wkbj+5KIO
 ObUy3F4ufqUcBV9KenbTB21bu/XnDtn54rwO/yqWctRE3+LSGkyMXLyEXix4K2eZd5
 ERaFN8otxaO/genTd2GrQmoKhNXg+m8jD9fNV7W4FZ5lDSZnkYO6Xja+b4z/jZBPfm
 RlAmP3OlhaGjhnBsJJIFuihmBM9ZcxR8aTA0JJuOzwhdfuEJOVWMSzl58najPP3TFi
 wrpwkvAAQpY9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=QCkbum25
Subject: [Buildroot] [PATCH 1/1] package/minidlna: Fix build with ffmpeg-7.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...01-libav.h-fix-build-with-ffmpeg-7.0.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/minidlna/0001-libav.h-fix-build-with-ffmpeg-7.0.patch

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
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
