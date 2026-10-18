Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FA2CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFC8960738;
	Sun, 18 Oct 2026 20:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvVfAjIHEmqf; Sun, 18 Oct 2026 20:03:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7D09760656
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792353808;
	b=PPgdXbSBHC24zl0pqRZRNh39e2RKO249BLmrwNAmcCdyQwl9qb39vx2FtbqlXNfWgJcR
	 msTefEcP/VEoO1brVQYdMCCTuC2mLIfLoJBMZ4GpoSmNQ7wFCyuej9WWM8LvAoBTNwizl
	 1wu28bIkoWO87h6luZdTZQUejETUXHTg+uQPiTHIwlaL2hH4QxgpNlaqA4I7Jw12tg/1D
	 WvqUPBq0+I97XHDwFDK0zFj6SpcZ8IP1Ja2WDij0LFK2wcC7O7x5HlHBWvjWQwqdIMPaS
	 i7TZaOcGvA9yF1BIab7OZ7AYOAlicix98t+mimJwrErr9GCNLjyBKzuiqk4U6gLe+Vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792353808;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H7O4Duj2+3wIVcp7qQHOHhzTJ7mID3aeof9rcng4O24=;
	b=OdiNGsZr4WdF5dcGqSpBSups3/EGdTV/eO5kxVYmMfUYSMl8uAmWT7HoFZK5HIPKP12/
	 /RHRA/FSQyyFKYQLV+mVcvxZYmvlYbbuJN8mvhGCg3LTwq5IqSf41l38blI9nkQZqQjiC
	 LITctzAeWDqkRqWaOtvbqwoQpvAXBvFDItEVcR4JzZnHz/p/rYKCZ+f/bxITnOHCHWstO
	 9tuWkJx/4eI0esRdyc25/3D5wj/hzEMSTb3k2nwmdkU0UiJKAWRhA5kfo51kTXRi4IauY
	 bh+00ksaaOGfAVWwzc84xRa35kFGaKSLPQIyen9OcYw9RoYOx9q2eygz57baiHm39cg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792353808;
	bh=H7O4Duj2+3wIVcp7qQHOHhzTJ7mID3aeof9rcng4O24=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Jl2Ic7v8pzJUYMDB9FPJBtE/iZxfTwqsdnahgdTTSriUioYn3BvMJ+fFXpcBUYneu
	 uPdamrfugo/WTPBjwzedJ4PZSoYMiBTbxhcCdUqExWRX0XgnU0scy4eXNCXkJ8BBCT
	 TL/TtLFo8PFvfWue1MzT1doJYmYiadspWdyHscLN532vXKPhKqrR4hYJa9Y1OKnT/V
	 IEgXVjp3NbO4AEbDXtM/RM/D8tl2EYdZaTZu6UEW1czLjvdXoq4WjP//JoguvTPJ39
	 CfpcqezNOqgI0hh3oFR24FRSy+9qwVDgysVUVJSpN/2HlrLIk9Iq0bFHeJ+jII9Fpr
	 UA6Rj+rFImDHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D09760656;
	Sun, 18 Oct 2026 20:03:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF42E61
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95BF080F6C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldXQnT1hCTKN for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:03:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B53C80F27
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792353800;
 b=F1Zzi3jp5X5KFJZHngHl4XjY4GueqfM6pz51BAvZnv1I34KHHWNYx8Ea8d0EeYo25X0P
 Jf4Mwa2hDYN1gInKHQgOLc5YW60oBocA5+xPJ837uvrEFcZJOKZf6UwI7r4b0cFfLGip5
 XxfzgVxDnTDvwKf4OdB6XOJP3/RPeVnLdTK2/geVmfB5bmbRwPv8uL7lsJCmZgQbXSUns
 3ycwHDJ32h5oroZoDzAAdPibR+FVd3vteTILyOP4Jnl814Lc29hhPYGAUGx+7oh+JMjPu
 NcbsGMIdWKJRRQnyp8RXbCgzqwobHjRSF2hsZBf/Kqs0QJP/PpAuM0gJqMDqMKPYR7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792353800;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2l8Taar/a+2XQM2uctk3tzuVQgy9lpBjVIwjSSH/rL0=;
 b=S9MBqj7EpW4B+UX7xVGG0z9rR7TTLgtVreCSpmRZeMxrlEnSAMxG145H8Pj1XZV5Jn++
 0oImq4e0tB2q4OrpH9jBVM4MTTiSjsUVyMYP4MHYlIjlEoavS/NutLE8h90aenq9KOusu
 fgGQnDe9KBWDxRNKnFxE99rkuvAlxXrklXEvaX8qINE1rwERNzDqFCrolMCcEA8UwQHxZ
 I33i35QyhRaZ8mbKMjVFlmLTlZAFALG+e5RQObjoWa3W37fhPyRoex2g8E4mwG7bfbvxo
 nfTBoh/PrFQWDmSQ316N3l/djqHaEGdL0a739zfMeg4zDgQzc0Vk3SWaTyZN+wflLHg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B53C80F27
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41C15983EE; Sun, 18 Oct 2026 20:01:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:03:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4528935750831b19b092d86c3823de6570ce43c
X-Git-Newrev: b68bde564339e96397929b45c04d137bb65df43e
X-Patchwork-Hint: ignore
Message-Id: <20261018200158.41C15983EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: bump version to 7.0.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b68bde564339e96397929b45c04d137bb65df43e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Removed patches 0005, 0006 & 0007 which are included in this release.

Removed configure option --disable-crystalhd due to upstream removal:
http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=5b23b18d40ead8606c92d967279b3f43c94d8a60

Added fix for Kodi to fix a build error introduced by this bump, the
patch was split from the upstream PR because it is incompatible with
ffmpeg 6.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0005-avcodec-mmaldec-Fix-build-error.patch     | 32 -------------
 ...-bluray-dvd-Use-correct-pointer-types-on-.patch | 52 ----------------------
 ...util-hwcontext-vaapi-use-the-correct-type.patch | 28 ------------
 package/ffmpeg/ffmpeg.hash                         |  2 +-
 package/ffmpeg/ffmpeg.mk                           |  3 +-
 package/kodi/0014-Update-to-7.0.patch              | 47 +++++++++++++++++++
 6 files changed, 49 insertions(+), 115 deletions(-)

diff --git a/package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch b/package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch
deleted file mode 100644
index b3b901264f..0000000000
--- a/package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e8a49b1424d405441fb23c2850274a84e95bd892 Mon Sep 17 00:00:00 2001
-From: Zhao Zhili <zhilizhao@tencent.com>
-Date: Tue, 21 Nov 2023 04:05:08 +0800
-Subject: [PATCH] avcodec/mmaldec: Fix build error
-
-Fix #10670.
-
-Signed-off-by: Zhao Zhili <zhilizhao@tencent.com>
-
-Upstream: http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=e8a49b1424d405441fb23c2850274a84e95bd892
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libavcodec/mmaldec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavcodec/mmaldec.c b/libavcodec/mmaldec.c
-index 4bb3eb22ef..2dc7bbee04 100644
---- a/libavcodec/mmaldec.c
-+++ b/libavcodec/mmaldec.c
-@@ -843,7 +843,7 @@ static const AVClass ffmmal_dec_class = {
-         .flush          = ffmmal_flush, \
-         .p.priv_class   = &ffmmal_dec_class, \
-         .p.capabilities = AV_CODEC_CAP_DELAY | AV_CODEC_CAP_HARDWARE, \
--        .caps_internal  = FF_CODEC_CAP_NOT_INIT_THREADSAFE \
-+        .caps_internal  = FF_CODEC_CAP_NOT_INIT_THREADSAFE, \
-         .p.pix_fmts     = (const enum AVPixelFormat[]) { AV_PIX_FMT_MMAL, \
-                                                          AV_PIX_FMT_YUV420P, \
-                                                          AV_PIX_FMT_NONE}, \
--- 
-2.30.2
-
diff --git a/package/ffmpeg/0006-avcodec-pcm-bluray-dvd-Use-correct-pointer-types-on-.patch b/package/ffmpeg/0006-avcodec-pcm-bluray-dvd-Use-correct-pointer-types-on-.patch
deleted file mode 100644
index a77a0cf5ec..0000000000
--- a/package/ffmpeg/0006-avcodec-pcm-bluray-dvd-Use-correct-pointer-types-on-.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 347a70f101be28f8d78e8fd62ffc3a78324f49e9 Mon Sep 17 00:00:00 2001
-From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-Date: Thu, 28 Mar 2024 05:35:36 +0100
-Subject: [PATCH] avcodec/pcm-bluray/dvd: Use correct pointer types on BE
-
-Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/347a70f101be28f8d78e8fd62ffc3a78324f49e9
----
- libavcodec/pcm-bluray.c | 5 +++--
- libavcodec/pcm-dvd.c    | 2 +-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/libavcodec/pcm-bluray.c b/libavcodec/pcm-bluray.c
-index f65609514a..235020d78f 100644
---- a/libavcodec/pcm-bluray.c
-+++ b/libavcodec/pcm-bluray.c
-@@ -167,7 +167,7 @@ static int pcm_bluray_decode_frame(AVCodecContext *avctx, AVFrame *frame,
-             samples *= num_source_channels;
-             if (AV_SAMPLE_FMT_S16 == avctx->sample_fmt) {
- #if HAVE_BIGENDIAN
--                bytestream2_get_buffer(&gb, dst16, buf_size);
-+                bytestream2_get_buffer(&gb, (uint8_t*)dst16, buf_size);
- #else
-                 do {
-                     *dst16++ = bytestream2_get_be16u(&gb);
-@@ -187,7 +187,8 @@ static int pcm_bluray_decode_frame(AVCodecContext *avctx, AVFrame *frame,
-             if (AV_SAMPLE_FMT_S16 == avctx->sample_fmt) {
-                 do {
- #if HAVE_BIGENDIAN
--                    bytestream2_get_buffer(&gb, dst16, avctx->ch_layout.nb_channels * 2);
-+                    bytestream2_get_buffer(&gb, (uint8_t*)dst16,
-+                                           avctx->ch_layout.nb_channels * 2);
-                     dst16 += avctx->ch_layout.nb_channels;
- #else
-                     channel = avctx->ch_layout.nb_channels;
-diff --git a/libavcodec/pcm-dvd.c b/libavcodec/pcm-dvd.c
-index 419b2a138f..319746c62e 100644
---- a/libavcodec/pcm-dvd.c
-+++ b/libavcodec/pcm-dvd.c
-@@ -157,7 +157,7 @@ static void *pcm_dvd_decode_samples(AVCodecContext *avctx, const uint8_t *src,
-     switch (avctx->bits_per_coded_sample) {
-     case 16: {
- #if HAVE_BIGENDIAN
--        bytestream2_get_buffer(&gb, dst16, blocks * s->block_size);
-+        bytestream2_get_buffer(&gb, (uint8_t*)dst16, blocks * s->block_size);
-         dst16 += blocks * s->block_size / 2;
- #else
-         int samples = blocks * avctx->ch_layout.nb_channels;
--- 
-2.39.2
-
diff --git a/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch b/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
deleted file mode 100644
index 177b4f1885..0000000000
--- a/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6f8e365a2af2b6b21701d41eed3b2e3f8a436eeb Mon Sep 17 00:00:00 2001
-From: James Almer <jamrial@gmail.com>
-Date: Wed, 31 Jul 2024 10:00:54 -0300
-Subject: [PATCH] avutil/hwcontext_vaapi: use the correct type for
- VASurfaceAttribExternalBuffers.buffers
-
-Should fix ticket #11115.
-
-Signed-off-by: James Almer <jamrial@gmail.com>
-Upstream: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/6f8e365a2af2b6b21701d41eed3b2e3f8a436eeb
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- libavutil/hwcontext_vaapi.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavutil/hwcontext_vaapi.c b/libavutil/hwcontext_vaapi.c
-index 4cb25dd03212e..15fd84aa40679 100644
---- a/libavutil/hwcontext_vaapi.c
-+++ b/libavutil/hwcontext_vaapi.c
-@@ -1225,7 +1225,7 @@ static int vaapi_map_from_drm(AVHWFramesContext *src_fc, AVFrame *dst,
- 
-     if (!use_prime2 || vas != VA_STATUS_SUCCESS) {
-         int k;
--        unsigned long buffer_handle;
-+        uintptr_t buffer_handle;
-         VASurfaceAttribExternalBuffers buffer_desc;
-         VASurfaceAttrib buffer_attrs[2] = {
-             {
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 4c489f168c..429b11c3d0 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  05fbe9db1f5452a3605bb1d9bf91da9d4bb08162891692e4f172b58c49109412  ffmpeg-6.1.5.tar.xz
+sha256  bbb18f3cc5c1c34b21cf176c0168c4d9aa97697542a97f60d491a58a814dea65  ffmpeg-7.0.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  246041b6ecf9bc32d718a62c57877c78b5eb397b6467e74ed7ae2626ab189c30  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1289cd5e72..4ce129132d 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 6.1.5
+FFMPEG_VERSION = 7.0.3
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -32,7 +32,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-gray \
 	--enable-swscale-alpha \
 	--disable-small \
-	--disable-crystalhd \
 	--disable-dxva2 \
 	--enable-runtime-cpudetect \
 	--disable-hardcoded-tables \
diff --git a/package/kodi/0014-Update-to-7.0.patch b/package/kodi/0014-Update-to-7.0.patch
new file mode 100644
index 0000000000..48a0cc2126
--- /dev/null
+++ b/package/kodi/0014-Update-to-7.0.patch
@@ -0,0 +1,47 @@
+From 8efb3fbddf1af2503b28ed21ccb23255f5031821 Mon Sep 17 00:00:00 2001
+From: Stephan Sundermann <stephansundermann@gmail.com>
+Date: Thu, 11 Apr 2024 17:11:32 +0200
+Subject: [PATCH] Update to 7.0
+
+Upstream: https://github.com/xbmc/xbmc/pull/24972#event-12966390666
+
+Patch was cherry-picked from upstream tree:
+https://github.com/xbmc/xbmc/commits/0e935f9edb30fd905f14230af653930b5fe139e8/
+
+[Bernd: re-add fixes for xbmc/cdrip which are incompatible with
+        ffmpeg 6.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xbmc/cdrip/EncoderFFmpeg.cpp | 2 +-
+ xbmc/cdrip/EncoderFFmpeg.h   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xbmc/cdrip/EncoderFFmpeg.cpp b/xbmc/cdrip/EncoderFFmpeg.cpp
+index 85f5fa412e..907d2591dd 100644
+--- a/xbmc/cdrip/EncoderFFmpeg.cpp
++++ b/xbmc/cdrip/EncoderFFmpeg.cpp
+@@ -235,7 +235,7 @@ void CEncoderFFmpeg::SetTag(const std::string& tag, const std::string& value)
+   av_dict_set(&m_formatCtx->metadata, tag.c_str(), value.c_str(), 0);
+ }
+ 
+-int CEncoderFFmpeg::avio_write_callback(void* opaque, uint8_t* buf, int buf_size)
++int CEncoderFFmpeg::avio_write_callback(void* opaque, const uint8_t* buf, int buf_size)
+ {
+   CEncoderFFmpeg* enc = static_cast<CEncoderFFmpeg*>(opaque);
+   if (enc->Write(buf, buf_size) != buf_size)
+diff --git a/xbmc/cdrip/EncoderFFmpeg.h b/xbmc/cdrip/EncoderFFmpeg.h
+index 48471a4b10..4e9f0f5bbb 100644
+--- a/xbmc/cdrip/EncoderFFmpeg.h
++++ b/xbmc/cdrip/EncoderFFmpeg.h
+@@ -33,7 +33,7 @@ public:
+   bool Close() override;
+ 
+ private:
+-  static int avio_write_callback(void* opaque, uint8_t* buf, int buf_size);
++  static int avio_write_callback(void* opaque, const uint8_t* buf, int buf_size);
+   static int64_t avio_seek_callback(void* opaque, int64_t offset, int whence);
+ 
+   void SetTag(const std::string& tag, const std::string& value);
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
