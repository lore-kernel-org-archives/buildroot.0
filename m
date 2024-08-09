Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9392C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 12:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5381C41082;
	Fri,  9 Aug 2024 12:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QejCTX_mf_9G; Fri,  9 Aug 2024 12:12:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAD074105C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAD074105C;
	Fri,  9 Aug 2024 12:12:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 757F71BF30F
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 12:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63AC1813E7
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 12:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2M8of6BsR-BI for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 12:12:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D6C38101D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D6C38101D
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D6C38101D
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 12:12:10 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 39BFD3537272; Fri,  9 Aug 2024 14:12:08 +0200 (CEST)
Date: Fri, 9 Aug 2024 14:12:08 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrYHmDKI5LAwlA5a@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723205528; bh=fgBFTocbpzuPVqUJYGSGM1u3PAbEtpVNyTWKf4HWpaE=;
 h=Date:From:To:Cc:Subject:From;
 b=YUubRQ3m/iUrcIuOh495jtGV69SGivIgNP+hq4ekOVrS9ykDnH7rfh00vebmpchEc
 ZPtv0Q3hYRBOSbpGyTY+N9vzVxfpreaNPi9qOlhjxG1v4D40S0hj/2sfLpa3XCrmsn
 Z3k8gt9k1IamWpDz/IEm7hXPWkNCXievrp5USGoZjy+6w5AsKJSmzoWkMtqoHsC+Pl
 oj4qcblm+uolsqOcaJu0wXUkfOb/wb0InayuDsKkyk4OOFhI55o2UktVT+OXw/HLTZ
 XKWvFbTSVLJLOyapxlVgqC1wKlsjtBZBJ/eG5URpMO+I1HnAf9xF2Ml+qtJhp03Ops
 J7AKQc4WCQsWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=YUubRQ3m
Subject: [Buildroot] [PATCH] package/ffmpeg: fix gcc 14.x compile issue
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - http://autobuild.buildroot.net/results/a04/a040cbc991da14c68302062ce96121b1e55c690e

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...ay-dvd-Use-correct-pointer-types-on-.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/ffmpeg/0006-avcodec-pcm-bluray-dvd-Use-correct-pointer-types-on-.patch

diff --git a/package/ffmpeg/0006-avcodec-pcm-bluray-dvd-Use-correct-pointer-types-on-.patch b/package/ffmpeg/0006-avcodec-pcm-bluray-dvd-Use-correct-pointer-types-on-.patch
new file mode 100644
index 0000000000..a77a0cf5ec
--- /dev/null
+++ b/package/ffmpeg/0006-avcodec-pcm-bluray-dvd-Use-correct-pointer-types-on-.patch
@@ -0,0 +1,52 @@
+From 347a70f101be28f8d78e8fd62ffc3a78324f49e9 Mon Sep 17 00:00:00 2001
+From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Date: Thu, 28 Mar 2024 05:35:36 +0100
+Subject: [PATCH] avcodec/pcm-bluray/dvd: Use correct pointer types on BE
+
+Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/347a70f101be28f8d78e8fd62ffc3a78324f49e9
+---
+ libavcodec/pcm-bluray.c | 5 +++--
+ libavcodec/pcm-dvd.c    | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/libavcodec/pcm-bluray.c b/libavcodec/pcm-bluray.c
+index f65609514a..235020d78f 100644
+--- a/libavcodec/pcm-bluray.c
++++ b/libavcodec/pcm-bluray.c
+@@ -167,7 +167,7 @@ static int pcm_bluray_decode_frame(AVCodecContext *avctx, AVFrame *frame,
+             samples *= num_source_channels;
+             if (AV_SAMPLE_FMT_S16 == avctx->sample_fmt) {
+ #if HAVE_BIGENDIAN
+-                bytestream2_get_buffer(&gb, dst16, buf_size);
++                bytestream2_get_buffer(&gb, (uint8_t*)dst16, buf_size);
+ #else
+                 do {
+                     *dst16++ = bytestream2_get_be16u(&gb);
+@@ -187,7 +187,8 @@ static int pcm_bluray_decode_frame(AVCodecContext *avctx, AVFrame *frame,
+             if (AV_SAMPLE_FMT_S16 == avctx->sample_fmt) {
+                 do {
+ #if HAVE_BIGENDIAN
+-                    bytestream2_get_buffer(&gb, dst16, avctx->ch_layout.nb_channels * 2);
++                    bytestream2_get_buffer(&gb, (uint8_t*)dst16,
++                                           avctx->ch_layout.nb_channels * 2);
+                     dst16 += avctx->ch_layout.nb_channels;
+ #else
+                     channel = avctx->ch_layout.nb_channels;
+diff --git a/libavcodec/pcm-dvd.c b/libavcodec/pcm-dvd.c
+index 419b2a138f..319746c62e 100644
+--- a/libavcodec/pcm-dvd.c
++++ b/libavcodec/pcm-dvd.c
+@@ -157,7 +157,7 @@ static void *pcm_dvd_decode_samples(AVCodecContext *avctx, const uint8_t *src,
+     switch (avctx->bits_per_coded_sample) {
+     case 16: {
+ #if HAVE_BIGENDIAN
+-        bytestream2_get_buffer(&gb, dst16, blocks * s->block_size);
++        bytestream2_get_buffer(&gb, (uint8_t*)dst16, blocks * s->block_size);
+         dst16 += blocks * s->block_size / 2;
+ #else
+         int samples = blocks * avctx->ch_layout.nb_channels;
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
