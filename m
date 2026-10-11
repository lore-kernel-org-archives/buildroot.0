Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819EACA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 581BB40659;
	Sun, 11 Oct 2026 13:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srvppAlj4iMT; Sun, 11 Oct 2026 13:05:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 68E2F40664
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723944;
	b=PTPG2Nuz2tKYXlmafM5flObvHJbQw98h6i4ZcKSBHAV8Uwt+oEIWzJdAaSHnIJQX/kkW
	 UUzkiZlPE5rNwZ+x8IgDN2bzpxGy2dTmaGuh3qIUC1QSVQY0566FBt41tFGN3NTenyEHT
	 vQkAWeROntREdFXtbIW1I1MPId8+oPAt1GDNYMmUoxot9YqIukmRTG2lPvLMp4EHbeDCc
	 i0aps3KzLTK7NDG73n73m1Bh/QTYbiDKC27vFcp9cG6i5ILlIPgcn4OkYr/aC5vuzoj/g
	 /3VEaPO5WwbrsVC7risjQVzf9zgg8AwPwidiFm3Ql89glTGRVZ/9RyXZhw75l0TAYYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723944;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tq8XDIcpU6+0ICoBplxaNodNFZhcxP/eu9s8DK5AQ9c=;
	b=ghGdrn00N9Ly7LtnC7pdaZ81g5ZezlXcR7mqF2W7VGm60b3NpZ/lOkoURh/ob6y3Ye8v
	 KAKDcme6Dw59EDf0ms9rn8blz0lkhhXYmHWsuTUaUsMDY2c/I7d6Zjsegl0KhyBE/mQkD
	 Rcn6IeGT5r2NrYDv+zPvrQPSZLg6NHzCkePAoMLIOqchy0A/YI6jX99Jnpu0Y0Qht/GfH
	 xCbe8gDq3dbfjeiz4D0xH8Fy94DRbQkxQL1Gev33I34o1VMtTg9YErkSijBsKRd9PCakq
	 oRSs63L1fWI7FrLQZ2esp+uMfQzPOwYe913z3D1UVWRdy/0evof1wf0dNQNouusaXdQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="sTLq/Dnv";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723944;
	bh=tq8XDIcpU6+0ICoBplxaNodNFZhcxP/eu9s8DK5AQ9c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUVrmNysta5K6k2mrYZlOkJqTNEs/yUbJGJROaxwk4n5kuhn0HWSsRcbgFFbnr7br
	 whbg1WXhTfhsFjc0GLfzHKaBvtSLl75VxAZzdszOsvB5A6bKuYuAJ4tQqz0B6MRjNh
	 8VxxWg/CJMEJB96Oa+wp119zXCrrIM1MP5iAod4fU2SiaROqvv5O2MYz8A6O2U8HXX
	 sStvONHBpU+LFHif3A8tAWBvW+zCYeTkI6PzN0UpnMj6zBMCbEbyOo6BLQ2w1iV4HP
	 SydJeYRccx5JS9HgG2sKpPaKzbLcaDq25wbdDM+7XHJJHnb4kkz6necg/o7CizFNa4
	 LhgRkjgeJ6qiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68E2F40664;
	Sun, 11 Oct 2026 13:05:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C8231A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02D0740664
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cG2kgT43ROr for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:05:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F096A40659
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723942;
 b=l70qFrhqTNNXbyeZaK5EoUeqoRI0772aJH5cA0OXEBL4oLABSDCBmhAPuxZ4eTxwaZKI
 CXU5WlBXr+iwp6uAq9oC57BD8FQynKEsfnm3eHeV6/HWsY8Up+l2LH3dZKv7dF6iY6PDu
 M+ZHBmtLEHJ8Eh7r4e5C4J0gE/WCRaOfx9WD9gPWncp8IW+fPVDJr5xcDti9LesUdnADt
 ritVFrv6sPVq1VKL2TG+hhWtDJjSeQjq5ybz4+2DWAUWGhFqIhfTkjHlmvELdOsScybcA
 uk9AIRcYUn+36IHkndV07VUDLI0nlnyQGEOb0gMK0dQ87FB6h5QFQNCRBoOg+NMH9oQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723942;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=KdT+1GMRQSxRN3PJMaFDXBDlV7TAoF/nAQAIe4OKwgo=;
 b=Kz/LD9uiul4OpblaA9jkOea13cRPl8DmwY6GUspXPtwNkpZ6wZYRDbp21i5p39ddq5qH
 vu0EPBQ5j3acPIEHEjfwEKhdgu/wfHiBQhkPjwyNXKEtHH0vVW9dOP5YQYU+5SVM2dPWo
 oXhf9dIG0nwaMWPtP9JE1JFQacl1l5RFNDAJiArDqDs/+fSxWbOguKzm0GEh+docDEbgf
 qMkRTD7CXzL2XFHrg5QJwydhX6kOcQcrrr0uWk+t6eWWDxBIm7584yYZDCbjj7tzfAehw
 pHW1B1vZagWpZeQ2TEzLsPxNUmk884k3PuATpOyvzEMWbfDLQ+KOMLgwIOKesZW3ZVA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="sTLq/Dnv"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sTLq/Dnv
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F096A40659
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723663;
 bh=KdT+1GMRQSxRN3PJMaFDXBDlV7TAoF/nAQAIe4OKwgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sTLq/DnvFdtPXoEpQYe1FHiLGrGBMts15J8vo5Imx3HDrB9Iy0eGqQANZqzHVd+nC
 IPWRYd8wzoyS1PzVOehCKo1pIm5XYPRxrWqZlycPyyGgVdrZX81SqhpiE3Pnx+jWny
 5sYe3LXIKWBLrW/CAC3Dd1bRNrYkMTiDr8YxlVFPcblFvyER1nqWGBqvpzw0pTrQF0
 XrjgMLLwbx+xjOzF/fCmQIakBCe55Z75cl51Ui0UtIQ9CNQapWkdGL6loF5L5P5NQY
 1AfRc+rq/+nk6OsSl9Ogg1QyrkgHckA8U8C6EUeFLmYdOXgwWWVak5DQo6hfwB0XEj
 /3EeQvr8XTdzA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 iyHdWrByyM/yKb+asbMzkj4IQT78lZoxoEif+kr8A6YU4pWuolzamweWk2s4i6l/grpOVbVfryM
 bOsD3yf9AAk+BKVkD+x/bYhV3gZ08rSM6+2Yq/koUlPKE8GeTpFapDqPTwzoH2LIOLOizpyHqhU
 YJcQYPursLzq5eL+8cmo4xTsVJZM7gBt8cmtlj0pu7+fwoQ3UZyFP23pdjRL5nkmig4nJe6RPtJ
 F8OY99aZy9FoNQpiXj82PCOGdWQ3wD5AHpQmINuuiGQGUUMC9DrA0yEoVJW/7ihV/UmeeXuxXC3
 MHvEmL9s6Psqp8H+Jgw0/yXR0MJx3CfxHvk8XcQdVqppVOfFsCyeHh3uWpDC2xZHjCPfYKgTGWO
 mtbcd1zz0+0gLvpJ3f9bzFHtt1huVDCMGT67PSOWaOSrI0PBydCF7N8zazxfCAlZCS2HQneyctm
 3YhZmvPjpqs+0CafmM/BqJGDWkDUK67kyfJqqth/blxkAU/TSQe4Lg/Icds+uq56jyg4bm6TnPx
 OBgoc0GQzniYbnobm/S23D5oEdzK0DuCvhRCUKDDassyROtZe04q0WdMBkRrEqjhFkvb1oasFtY
 Vjimtwoasr2+lAHqLQhlB7Bilpg2U0ud/2VWoi1dKP56rd2nQrZOd5BvnYhe7w==
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1022EA4C585D;
 Sun, 11 Oct 2026 15:01:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAk-000000007Fz-3szD;
 Sun, 11 Oct 2026 13:01:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 11 Oct 2026 15:00:33 +0200
Message-ID: <20261011130058.3443432-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 28/52] package/libcamera-apps: fix build with
 ffmpeg 7.0
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 ...ncoder-libav-Updates-for-ffmpeg-v7.1.patch | 48 +++++++++++++++++++
 ...oder-libav-fix-build-with-ffmpeg-7.0.patch | 37 ++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch
 create mode 100644 package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch

diff --git a/package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch b/package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch
new file mode 100644
index 0000000000..3b92ac3592
--- /dev/null
+++ b/package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch
@@ -0,0 +1,48 @@
+From d67bc17a420b6c3519d4cfa24b4b4e5c7293165b Mon Sep 17 00:00:00 2001
+From: Naushir Patuck <naush@raspberrypi.com>
+Date: Wed, 8 Oct 2025 10:51:46 +0100
+Subject: [PATCH] encoder: libav: Updates for ffmpeg v7.1
+
+Fix some API breakages change for ffmpeg v7.1 packaged with Trixie.
+
+Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
+
+Upstream: https://github.com/raspberrypi/rpicam-apps/commit/d67bc17a420b6c3519d4cfa24b4b4e5c7293165b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ encoder/libav_encoder.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/encoder/libav_encoder.cpp b/encoder/libav_encoder.cpp
+index 10c00e0..ba8b9fe 100644
+--- a/encoder/libav_encoder.cpp
++++ b/encoder/libav_encoder.cpp
+@@ -337,13 +337,13 @@ void LibAvEncoder::initAudioOutCodec(VideoOptions const *options, StreamInfo con
+ #if LIBAVCODEC_VERSION_MAJOR < 61
+ 	codec_ctx_[AudioOut]->sample_fmt = codec->sample_fmts[0];
+ #else
+-	enum AVSampleFormat **sample_fmts = nullptr;
++	const enum AVSampleFormat *sample_fmts = nullptr;
+ 	avcodec_get_supported_config(codec_ctx_[AudioOut], codec, AV_CODEC_CONFIG_SAMPLE_FORMAT, 0,
+ 								 (const void **)&sample_fmts, nullptr);
+ 	if (!sample_fmts)
+ 		throw std::runtime_error("libav: no supported sample formats for audio codec");
+ 	else
+-		codec_ctx_[AudioOut]->sample_fmt = (*sample_fmts)[0];
++		codec_ctx_[AudioOut]->sample_fmt = sample_fmts[0];
+ #endif
+ 
+ 	codec_ctx_[AudioOut]->bit_rate = options->Get().audio_bitrate.bps();
+@@ -652,7 +652,7 @@ void LibAvEncoder::audioThread()
+ 	uint32_t out_channels = codec_ctx_[AudioOut]->ch_layout.nb_channels;
+ #endif
+ 
+-	SwrContext *conv;
++	SwrContext *conv = nullptr;
+ 	AVAudioFifo *fifo;
+ 
+ #if LIBAVUTIL_VERSION_MAJOR < 57
+-- 
+2.47.3
+
diff --git a/package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch b/package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch
new file mode 100644
index 0000000000..ae525b77d2
--- /dev/null
+++ b/package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch
@@ -0,0 +1,37 @@
+From 1a4860f36cffe167965351b7a59be46d7a7ae5ec Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 10 Oct 2026 23:58:02 +0200
+Subject: [PATCH] encoder: libav: fix build with ffmpeg 7.0
+
+Adjust the version check according to ffmpeg docs:
+
+https://code.ffmpeg.org/FFmpeg/FFmpeg/src/tag/n9.0.2/doc/APIchanges#L446
+"2024-09-08 - 3305767560a - lavc 61.13.100 - avcodec.h
+  Add avcodec_get_supported_config() and enum AVCodecConfig; deprecate
+  AVCodec.pix_fmts, AVCodec.sample_fmts, AVCodec.supported_framerates,
+  AVCodec.supported_samplerates and AVCodec.ch_layouts."
+
+Upstream: not applicable, support for older ffmpeg versions was removed:
+https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ encoder/libav_encoder.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/encoder/libav_encoder.cpp b/encoder/libav_encoder.cpp
+index 31f5e55..8e24e7d 100644
+--- a/encoder/libav_encoder.cpp
++++ b/encoder/libav_encoder.cpp
+@@ -321,7 +321,7 @@ void LibAvEncoder::initAudioOutCodec(VideoOptions const *options, StreamInfo con
+ 
+ 	codec_ctx_[AudioOut]->sample_rate = options->Get().audio_samplerate ? options->Get().audio_samplerate
+ 																  : stream_[AudioIn]->codecpar->sample_rate;
+-#if LIBAVCODEC_VERSION_MAJOR < 61
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(61, 13, 100))
+ 	codec_ctx_[AudioOut]->sample_fmt = codec->sample_fmts[0];
+ #else
+ 	const enum AVSampleFormat *sample_fmts = nullptr;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
