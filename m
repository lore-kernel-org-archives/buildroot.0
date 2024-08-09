Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC15C531DA
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 22:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D014181208;
	Fri,  9 Aug 2024 22:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQ8sSy04mKLK; Fri,  9 Aug 2024 22:05:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DCEF811C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DCEF811C3;
	Fri,  9 Aug 2024 22:05:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA9E81BF2FD
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E4E880D6E
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMUmfaLyYCvi for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 22:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D40380C97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D40380C97
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 22:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4244884FC9; Fri,  9 Aug 2024 22:04:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 00:03:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a39e706a91ad6191e499e46bdcaacbe590a144a
X-Git-Newrev: ade2db3ad2e2693ba5e4bfdad0aa75eabe9e5e4c
X-Patchwork-Hint: ignore
Message-Id: <20240809220458.4244884FC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: fix gcc 14.x compile issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ade2db3ad2e2693ba5e4bfdad0aa75eabe9e5e4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/a04/a040cbc991da14c68302062ce96121b1e55c690e

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-bluray-dvd-Use-correct-pointer-types-on-.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
