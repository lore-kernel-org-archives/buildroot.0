Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE0DCCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57B48606F5;
	Sun, 18 Oct 2026 20:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yx_VAYZ242iU; Sun, 18 Oct 2026 20:03:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D5BF660638
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792353804;
	b=OIMQ9dMQkPGy0QgSxG4s4P7jcIpiX+HyqSrhgZuhRUNe4M+IurzG4Lp6CQ+lt6qL6cAO
	 2TlkXN6eDBUrtyGtwp8BRs8MdZJQpCWpn/ShHepDzHzIY0SKFCQrvo+uTbSPS834XLW99
	 hqHD220rNxqhjnGST6P1wYllK7oZyeyT8mpSR11AsaPfBu9ViIEONPVMnPDZqIS63dQS4
	 qxd4UXeAMRunghiz35kNxox1bZ92jUKaC8KXfVBZQc6NjaPlxSpQeBLTe3z5PxKix8VSP
	 SeeGkq2WwnwtR1V/hRDz3qsINuS0EvEShpN8NpIRTzgz9YW9z0nk9A3T77qa3N/m1uA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792353804;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5dSwM06fVPrXTRLdsglnFEkJbf2vwnYyPxREL4XVayU=;
	b=oj5aX9znEAzY/eF4J2HKdDMlVI/wg8Tcf08uGoTjaG1wa7WA0pBqg7ZBKtZl5eSgUXHE
	 5dkJ7EpaLZAU2ex25kRL2A7qNzZH3J/v17MHWz7KSCR20XrWE7TBDR6YrjePyGmQYqKmN
	 PnB32WtbIaH5oE6MNFetRxzt3eVul/Eh7PvT60Tkymie6mp3r3Qi5DStIuQwPBUpyofJm
	 8ZANypg00P5Ir6S1WJTOkyXf0t5vRIwxJQRYAOq9WokokZjALyxe3cMcrFfKkeqKEhEKt
	 2dlaf25KUQA/v52xu6iwjKZdrEZpvrlmUFyOrXRE3RTHdlJ+PxJMuXDBd6AOy/N2viw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792353803;
	bh=5dSwM06fVPrXTRLdsglnFEkJbf2vwnYyPxREL4XVayU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ce+1M4WYI9zxhbkMJNeSJ2/aRrVyrk/WKvsQVirSog0ui/5m4xKyeFfPU7y+Zao6G
	 Q0Hyc+FP/psd6t0mMxE6Trejt48aJ+o60+5ghWqmyWrJSmgPomZhG9Z6JpxZ+E2XF+
	 EtuzIeI923Nq7/f17YsvWVqGy8tiOMLnfaqpnXhKww0tvsJY4s9/vaxZTzOQnNPXZL
	 TyWE5uE0mNkCIdcTKt048932LfO60um0Ou2alPLMcnLzmNiZsi7NwMXIOF7ohy4pG7
	 fErvgDM2YhoD9mXVingJPcgyW0ufb17K16PZLfIPP7cMeYMGKWQ19Als27WoUhkmiF
	 w+M1T75cwMi5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5BF660638;
	Sun, 18 Oct 2026 20:03:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BE2279D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 223CC60608
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pb3Htm9T0AQH for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:03:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5C7A660613
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792353800;
 b=asZDqa/2rMxuIMpFdSc4o+Zea9RyL6LtDkg+N4T9PPQr15WikSIIEhSWem240d/OJoN5
 liIGX6ybOUYZJKshJhbolvku022bNl2oiZRaHz7wNzRbBl4TJVSoVJkBmw0LIOnwSEGVE
 DDX4He8dwZXh2DPwpjaidV+EzxFNkWOXQezZT1w4YLjHukK7uXeNAHPV4KQm0W8oiakp+
 tqpylHtiw/DGOqGi9UDLp+FORzCYuiAn95eEqXDrNlTQQkqephTGXxkZFSEHAzgFHXMqZ
 AyYyARJpZn4jIdQYVhnSmkGXMYUk1dGMpP9NNcrRzt7jmzyek8FuDJJMXibEJ7fowXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792353800;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6iKSa95q+t1blK5rmUohp2fyi3c/DpRo8vEF74DMoC8=;
 b=mTVTpFlgi/zW2djzqsTEdLeHAZkMAiUubktx1XX2uqz9DjOsj5GwGjoNmKEmfbqC8MG2
 nd64jIGa7rjolS6AEEc52z5Z7aTmcO1cou1AHwXsB+EzidQ+TCRm/GdoRceHUhgQTo+cD
 rXziGGA+tHGthr88n5Iq1VkctquAk8GAYp8FbHhUJFC27kUl4P5gvArUuUSnFVLHxLQ1H
 9VF6X+2NoCVPnd23WJtXJFutPoeb0v2DT+DQRdVto0Ilau2px+RrBXX8NcDYgk3Eb4BZB
 4yuaL+ykZgTDehAv46cSeZU4YOozAkAtQF71VrZ5wSi6NqTtKLf9D/s6wJGLbqhqccw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C7A660613
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F6B4983EC; Sun, 18 Oct 2026 20:01:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:02:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f526f47accaa636ff10b288aadd1009d9cefc2a
X-Git-Newrev: f2b44208c145a70bbc63e1f4cbfa5d00b2fd2bac
X-Patchwork-Hint: ignore
Message-Id: <20261018200158.1F6B4983EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera-apps: fix build with
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f2b44208c145a70bbc63e1f4cbfa5d00b2fd2bac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...003-encoder-libav-Updates-for-ffmpeg-v7.1.patch | 48 ++++++++++++++++++++++
 ...4-encoder-libav-fix-build-with-ffmpeg-7.0.patch | 37 +++++++++++++++++
 2 files changed, 85 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
