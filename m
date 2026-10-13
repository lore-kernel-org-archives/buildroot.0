Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09622CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFA03608AD;
	Tue, 13 Oct 2026 21:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4JkIDdpWD1I; Tue, 13 Oct 2026 21:50:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 616EA60890
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928240;
	b=hzilqRk5bTOp+roOH1gmEoxjOpvsMyFJ43Qht+5IlKiqFyQOwwhjzPncJaKmgyKGpGtO
	 1OG2xAyOm4IPiAJWIVOod5rDTjc49/o0+9nIv6Uw+gQz2r6+HzKPLHbytHZL/XpBicGQ9
	 Av6HbGPmbs/+xBhQJxtUxx7BflPK7BabbkTAY4W5WTIP+cMp7inQoPp+340m01zzDchmU
	 9JKW4zZrCguDpk9w0D7aA+W0qQAbTFUw2BVMNyPmR1mdGHMizPpsRhvyJi84PJWmLMvcK
	 xF21Ge86+pL7iddn+PHgj2OZcOic07KeBuKcfJUrSVK6ZpZymdBdlnoizV56FPAGyzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tq8XDIcpU6+0ICoBplxaNodNFZhcxP/eu9s8DK5AQ9c=;
	b=HTA4IOQNE+O3AsxLslaHXOSkCSaEDtqoRwjGsXUWQtPDQiw4hknth22G3GmxuSR/EW0S
	 bw6O8CILcO23oUDuk2O0F6FAK5BESxP8zQHXopTYlA3e+syDVz97hZI2ivFzyFB+98rbt
	 qRpSBPQB6xP7Uz5M5l44IGWgAVROJCsOll1rhFMexTwzobsCWY98V/rJIP74cXiqft6IU
	 dZ6T9QRZ2ehmraAE2vv8CYsDqm6iVlr5WjAPhp3wkHWhxDPO/jnSxgZH4sDuLggyYwhbb
	 wTQOLAfnnzFfDZPlOPyuyyqEJDOKppUXf8Uta6GxqzpGsTjL+u92dVYXOxFwcF7sIIw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928240;
	bh=tq8XDIcpU6+0ICoBplxaNodNFZhcxP/eu9s8DK5AQ9c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DtS7XnwvRaIRp5Biah0LsgLo6RasQ6Z/MHwsmxIOhBbS5j5IuiARzjLaUqvuIMTMf
	 VLuy/NjbwG/MW5vnzUedGKCzNb59z02f4EHIFtaCtiiboBitfaA3G3ENFzuOGZrqrH
	 EPGlJcDgwDIpnSeonFqdSvyJR6UzLTI7uaZbwh0q9vddmqnLBTiOZLS8ueOireX2e3
	 qxYtwTvSUZHdSL4h8GcHoXo1HGyX1rbDxne/TiNKCVjEIoSKsnrX7IURsxhy1oyyhO
	 XBd6WaLS6esgULDvZXH3l0R6hG6+/k/+rTNfp/n/svWTFe8Ut/QHnToVOwfyK18Xzi
	 R9jrP1YEZqz7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616EA60890;
	Tue, 13 Oct 2026 21:50:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B7B9235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CA94406F2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfOQZHRvmRzN for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:50:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B7760406C2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928236;
 b=AraKDvhNT8UTUWy8tYb8Vj3nHK6Kpfs5soRCi56gN6BUMlx49CCdYP8rn9tTkwp9ur9n
 nViRHT0tD2HJDKcs3T9W11mZ8vfYRXg/6C3i/NrxIckO9iNT4RQNIzKoK3+cA+nhtnm4c
 mfWq+WAVTgJdPxpr+1m1++u4+CQXEYIPaZ/ZqWr4XQoENAogBu3lTog41qMZUrT9BTM2q
 TdSCfmMxu0nMMWsKT4fo6HqdlyUp/dDJ6xIceR7gV/JGuKi0wu8TSWx2s6TIxzoMJq9P2
 9l07Era+jtMviyp4uuosUifa4AZc/EdZgZR6q3hla7qH/AfQDil59q1HI2WUjGkXZeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928236;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=KdT+1GMRQSxRN3PJMaFDXBDlV7TAoF/nAQAIe4OKwgo=;
 b=LWOMWR0ZIvY8IujfarLqfvdG2Xxjr94mda+UjhUwvmyOrGMgLrUhCNLdOqdyqtYjpLgt
 b//jH0Z/Xb9Q6gXq1OixfZ18wh43R0D7ua+D8gHC0vPV2vI3Z4x4TalDeP9S8QfJIvmA5
 L2Lac8PBB7jYCvkuO1U6NYh8JHqfczHEGrrvR2KuZTOgqCg9NTiWM6uKPWCalIb0Ou085
 XNsrhg+O6z3Pt+MH14ybk847lvBozSwu94YJa7VlbvIX1oQ03lpSY2SQ8feCE3GaLH52L
 AdFY40uknp9Z+VsZdvvg5JoNUxu6A8gYIgdRGgZMHDboa7idvlqpV2MoJ2vj1S9Vyiw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tgop9Zk1; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tgop9Zk1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7760406C2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791928231;
 bh=KdT+1GMRQSxRN3PJMaFDXBDlV7TAoF/nAQAIe4OKwgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tgop9Zk1RHknp0idA/3USMKBFhTW0zn+JtVetf5jzgqyfpC5olAre2vumbedny/7E
 SakQ7sM9DFxqEo45i9umYZE5vatCJBJfsZ9ktr1/u/P3OUuHpGejvOtnd4vnJ2PJFW
 edjIRRg/+ne5MZIQtVm9DU0dqk6gTlqwOiHWTLtZt0V2af1NEhxVjGN4xFZaAEcX60
 55KImXJ/WQ0DyqZrkF134+YOsPzupBA7YxuwJOBsgoj6Dh5Q0QwN7Qv1G5IyZzBoZp
 RuRlxOztgekjhadey4nIVMcivMtq2U/GF3BdvqYsW/0B8aCGo9VrlQLcP9a0RtPWPu
 UERAb+JmZkSvg==
X-KAS-Sym: v3:f51bdf72230551df:iRrhmmgc7+3BXX9A7J0fNbonZj/POtdddEk4Wm3Jhqtu+
 sXfYOd4zBWKrruPbrjPdv/aES5XyA4HhkYwm1co6isH0XaNMXgtqj5ztLda6xfN7JMCG5kC0l9e
 eg7Z6CBkYtSFlvHI38C/3xfc6/ar0E34i0+9kgHjEx4muSh1jt+pz1nqnncJQ+adhAsuZfnsXvq
 YBz93Ws0X6CBfGw73C81W2yZVNFEiDXmm2njJa1Z97kdSXiwA83kCl7e1Iei+EnLIJKwlHgl7U+
 TiUmmYdu0QK4VggGIaCUOAcqzRcmHRIsp9t18czpbCJYDCR+z7UrxaMk/Rs6hLK7VsWaFchw==:
 wUGapCWHi02hYzXtGLMJfWS8hEJrDDSAs3twQWLUNgEcYypzSE6iuCwI1NIukq+Y5Mv22/mPuQA
 gHOmrEMEVWqoMAOg4PFhN2p0EMu7Tb4+MvC2rRJRc+Mwizu+T4VKdlIWQ84m1IiNl9roKREjH7R
 E0yTVTtd0B5RHwql1wMnRvrrmxLXLbS2F6PuTccrxUjpLwsktjzP4DhB8bxUDKrcFtYW04KU1hb
 OViaRnPJ1dlfjR5sbsLYiJ6euFI31KVm8Bra6xwS97rfUiMf8Tm8HqGJH/UCemrLId41CWwWX15
 rt3+qYSStWZYb0lC6XSZewOlAHLZC8Cq2JWiofHrWRn1SXo6WCE/tTJUEpHcSXP2vr2q0YtQmFD
 9BfEv73zF+4ZzkCqoNl5X8haSlt+/IeSSdI9npWLRYs5pS4cwfZR2Mu30Ois8Sa1Qs2ZHsUdyG1
 qnFQPdmI76ligHY+1Gu3yJMmhMMuhK/0VlewMhFKQNZEOdeFV60mrok31tifz/HiJQm2qPWgOcF
 IPC1Ayr3Jmodk1Q2/eBmXXcfTjRVt3lYOxG915jWkqRyPfHLpELveDsWNLDJlMUedpeJ4JQTUrw
 CO6pb46dsT2PMDhPE8ph7/eFGSY7+RmsJWAhcwegDfdyvmWPiHsyaCq7em8=
Received: from fli4l.lan.fli4l (p54a1b220.dip0.t-ipconnect.de [84.161.178.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D489EA4C5896;
 Tue, 13 Oct 2026 23:50:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37044)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xGkOF-000000001g9-0zoY;
 Tue, 13 Oct 2026 21:50:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 13 Oct 2026 23:50:26 +0200
Message-ID: <20261013215029.317512-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013215029.317512-1-bernd@kuhls.net>
References: <20261013215029.317512-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/5] package/libcamera-apps: fix build with
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
