Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA57CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A009B40712;
	Tue, 13 Oct 2026 21:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ef0G2hwVQNJs; Tue, 13 Oct 2026 21:51:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7CA16406F2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928293;
	b=MS2UL/sG5rgNYLSpVt86wMOUA/+CW2F1HsgjTXzKFJwuIEZXEkOHqrNCzXO3tkZc3iY2
	 QuN7EegLvOb6fqsUAX2OX87WUuCEtVA4cgMDyysyaM0MNRrKia4M9zadgg21uZGqzFE8i
	 0xFWgUX11nsIZSPi1q4Pa0VzVkFT6u/0xQ71bjCBFZ1FaiWRuUhs7n5kOK2HJEUK18cEH
	 QZwwL/XelgMVKiYdetG6/wPxN5dndaQbpLXj5LbcvoNIX4nzTg0RAvnk/B6ANyDTR+JQS
	 MQI+1ecro4/sS8l6iYO4YbM9hRzgqo19KH8EaH7z7MMG6rerQHaYlhNwZmV5wlnNb9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=chsxAgJrLl8Cj8IAPYnIDof3B39IMf25HLY5xq36KQU=;
	b=nKxnkF9O5azMPTZy3uP1jUMk1N3lwX3d5LMd7qnrjKkx8EFDLoyQ9ZnHVchnfbmnVMWD
	 khysdy4q98RVdNZsfWgBUCc9tpmtqLigi79X+3n9tbJXuAEW4TR2p6a7PqElA3jui6KTK
	 IbzlJsIF626x2yrPnaiaAmJd6TNN6XoMwXXCZVPaMzI3/FRk3gqYmC5KLntgE7YV6iy6t
	 99fHdSwDnoyW+Y2gXOQ/f9SZoEBmX9uMyrgvlIiyXYuqOqOhg9WyuMDV8Pi6cTKIqX75E
	 6yR0JTsfz2ahSzKJ9db4dKX//Ay68hHDNuAnMMqCwust2Rl4XdY6kBkdS/5JZawMubg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928293;
	bh=chsxAgJrLl8Cj8IAPYnIDof3B39IMf25HLY5xq36KQU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+KNPRCR9FgC/MPAuLNuAI0Wtmj5DUZoZgKZjymDW+FmUIaPEQXRE5lRQQa64a4oZ
	 qLO070wIM0//246cQrAGAho1MJoNxSz5qXEfk4a4y5idASViU5xMlxY83gETjDzzPA
	 oSwnFVNcm8rsThDNUYDvkvFMdaycGHdtGd4aZSmV0Q1XwJsqsGlGnwCF4YVVyghCZO
	 KwYfq2roixW2buHTgjV0V+EamWEaEra+RNMXaYiiPnFxG02YYCqKnxch01EvThZW+F
	 8rZfGygY1xJlg2wMpwQ8SlhUqEVwSBenuzqZvcctixZjUtAqbik//mbvC9aCTBJ+gK
	 IU+iW5hxP/lRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CA16406F2;
	Tue, 13 Oct 2026 21:51:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DFF72AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74696402AA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ekc1DSREMGTL for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:51:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 904D7401A0
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928289;
 b=c9a7Z4AhWoKmhdl6mwojPQz3lic4zDe+n2nn/UFDAKrFm88IzZR+Ak+fdiwH0MtyMknc
 xzUzGFAuKh4k3zQWiqqJ526oyK0cOzEgdqV3rHB8hqmCq35OVFxCUUN6UUJ72qz5AqqlF
 2v8K17tsWNdzijF151PaqAnc5rSK5f9Vz2k+yMD/9/wcfx47G1I4UI4dJjx6Js6gT6QSv
 30CFkF/2mHCO58cpZVPoIAr/kUbfNPXSqd+AaK41A1/I2w/mGb6+xb8WU8ZDhA9mmofqa
 ZHBGFg7/FcUc/dGFysuMSLSYYjUhbGXrxJehZnmDkyjonQz9w59esKly1xp9RHdM09Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928289;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0sZMHxBJFRYK4VJxcMgTZBZ9yWKpEvGemlpMhPAEvJk=;
 b=YB+jk8IMK2+refSZyyJGX5miWrcm9DsjsjnyNNb4TFcXSRPmTsVknQuDTwf9Ikxmpoup
 2mcPbfBToxYE4lPIL/N3yglUevW1gmd2SgsBLFAs+zs4dBI8rBNXNeSu0jC7/XX6NJp/t
 BAo0K5UgNJeK4wjSuv8OcKWS9UJKf0ATaiEL3LoBmlfjkawT73Ud6FdxdfwEaqL4Wb8MM
 r77NTe/jV/0tRBErPcPicweOpzV0/WYpmsBOEhs6X8W5WalzWw/IvXZtdpEaxspLWrUFS
 q4oQt3yzhwv9s20ilAIKCXb36IeWPusNWvM1Uuhbw9OphvVIr2RbGSn6Dyyx7OAAqiQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rveh5c5V; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rveh5c5V
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 904D7401A0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791928232;
 bh=0sZMHxBJFRYK4VJxcMgTZBZ9yWKpEvGemlpMhPAEvJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rveh5c5VED5gdsNycs5dZnq9dN9CeJPFuDGq1zt25TmIY6j1JR2JhtO+vr0rw9IPK
 rqrKjpb1+pyPoHevDXOD8N0K8b22OuKoezGnIYi4okVKcGKwadjFSBZfl/TwyaIcXW
 kTziTLj7d0qCuZhL8KKnXKv/MWUcQOIMWlJLbCCP/Pf8btiUzHxDIhHizALzymR+0r
 SJO486N63YtqGYizgv6XQQM9+ItehIyAK78eeEo2KDrtIPLZI6NcQZCYdH5uiK4N4H
 IBYga2qKYmlME851V/Zuvq58TmCgshmSfy7Cg3OVrMElcfSYgfFXic++Oz/3TUT95W
 T7eiDRQlqtxGQ==
X-KAS-Sym: v3:f51bdf72230551df:iRrhmmgc7+3BXX9A7J0fNbonZj/POtdddEk4Wm3Jhqtu+
 sXfYOd4zBWKrruPbrjPdv/aES5XyA4HhkYwm1co6isH0XaNMXgtqj5ztLda6xfN7JMCG5kC0l9e
 eg7Z6CBkYtSFlvHI38C/3xfc6/ar0E34i0+9kgHjEx4muSh1jt+pz1nqnncJQ+adhAsuZfnsXvq
 YBz93Ws0X6CBfGw73C81W2yZVNFEiDXmm2njJa1Z97kdSXiwA83kCl7e1Iei+EnLIJKwlHgl7U+
 TiUmmYdu0QK4VggGIaCUOAcqzRcmHRIsp9t18czpbCJYDCR+z7UrxaMk/Rs6hLK7VsWaFchw==:
 Q1GaFWt+mmY5uggKHhY56RbE5v3cXGOgsdnG8a1a/Bejo+2OozC6fCa0n18OacywJZX4FD+qjEw
 J6TBADvP4xDNC5vVSXw9f/1Hcd+wk2brjPkTSDEgoaTeSNcQsnzt2gQhcm2QKhbmBL+bq2rEA3M
 4NXwWXYvsblH05TUAEdiJdRm5EAnRve6rqhLjzMonPKRzT6jKsPWn0Nhp6XTuRnd8JI8aOntkYz
 4W9TDJ49N/WbUuugUFrZG3pmRIqFrBaY1+dOihbXESSwYc5+shDvCzJPHz4t2papi7q0Rvvi2OK
 ZanceDIFAaZzEVl/8sBJuvbxasy3pnLxJqgtEp+fXsCeyjwFzUYXUwLHmd/KiGxwbttDatQ2PN8
 J0DNS6TfQodzOHznF7pdwPDzI6Fdhr+eHXvH2LhRdMfI//5stTGd3r9bMNWOgbBcSTYE3OG3aa0
 lFHMXZ/K8jukWCfpLGa8781JlKrhOV3jPhoUWfTEJprbVJMaQ5ruS1LRjShvYivmlYQ/8rkTcnV
 ZISStH/4qza823244vYS3WyGdTe3t1Y42AF+tP5xOHQLqZxM2CGoNHsjERSMrRfeJyYULjx67MT
 DnLKfeeqLkHhYUqgB3SoHBASftQ2q+WWjYTMZVyZXHdXahSVKfhtC3VWME0=
Received: from fli4l.lan.fli4l (p54a1b220.dip0.t-ipconnect.de [84.161.178.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC50AA4C59B9;
 Tue, 13 Oct 2026 23:50:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37044)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xGkOG-000000001g9-0Ay3;
 Tue, 13 Oct 2026 21:50:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Tue, 13 Oct 2026 23:50:29 +0200
Message-ID: <20261013215029.317512-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013215029.317512-1-bernd@kuhls.net>
References: <20261013215029.317512-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 5/5] package/ffmpeg: bump version to 7.0.3
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

Removed patches 0005, 0006 & 0007 which are included in this release.

Removed configure option --disable-crystalhd due to upstream removal:
http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=5b23b18d40ead8606c92d967279b3f43c94d8a60

Added fix for Kodi to fix a build error introduced by this bump, the
patch was split from the upstream PR because it is incompatible with
ffmpeg 6.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
---
 ...0005-avcodec-mmaldec-Fix-build-error.patch | 32 ------------
 ...ay-dvd-Use-correct-pointer-types-on-.patch | 52 -------------------
 ...hwcontext-vaapi-use-the-correct-type.patch | 28 ----------
 package/ffmpeg/ffmpeg.hash                    |  2 +-
 package/ffmpeg/ffmpeg.mk                      |  3 +-
 package/kodi/0014-Update-to-7.0.patch         | 47 +++++++++++++++++
 6 files changed, 49 insertions(+), 115 deletions(-)
 delete mode 100644 package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch
 delete mode 100644 package/ffmpeg/0006-avcodec-pcm-bluray-dvd-Use-correct-pointer-types-on-.patch
 delete mode 100644 package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
 create mode 100644 package/kodi/0014-Update-to-7.0.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
