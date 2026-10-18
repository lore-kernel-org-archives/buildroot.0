Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADC2CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8077560608;
	Sun, 18 Oct 2026 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ijw5KB5146_G; Sun, 18 Oct 2026 20:03:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 81DDB6060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792353802;
	b=Ool+EEUlgWvWnlUSQjM+4Q7LxiztTVV8qnq2yHn9pEQLonSlm0+voPAqU/DGgYeqPX0K
	 xf3qmNuTHmIDjanEQmysCCF3iDxwwQCNFlUOxMIwJZGq3LbB/6RznBnlGyiN4vQgeIqqj
	 ABuC/JczQkXuE5FtzQYOG560kA8plyX8aE5HEeRD3AGQSmqwF4et2XvjPqIGVsS54a1hc
	 xH9wb0TuECTMwHm4IWAQSp61DwRCgvygWi6czhPlAy5KLqIn2uj6fuouQMOT4GAmdcT9b
	 RCLUablZ1Dq3AZuvxalhxPgbxiKTfueTbbkUnyP1gvOpWiHjLgrw3opFdX5JmbTlwpw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792353802;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Et+dPOEl5rC0BD6GX3K8LLIMTCWbSLYMI5a9TaXGrRU=;
	b=NaoApFOZ0q81zBet8cFQ/2/a0qCSAhOLgcqAeXDhqgYh3+geW+V6oaKyKgyJ0EeMiZze
	 cTunzEZIRIrLaytvL48kubXio8xT4meuvNDq/ue7ykp6r04hPPzUfFHbXGyGjtZcVTm9x
	 4k2nedO+0mH0N/Wpt0r6YRo5YJ5iH8OTS+dAFG6QMsf5XNYPcnjs7ApcqsNHbOGa9lz6p
	 zSeGbJFV0GjfGeqP3D79Ed+dBLK9B9LZH3qWp9q5C+p1gms+DDql5Ll7jeMFQuGG/6we9
	 fiEG0RilnDWvQmftLlFvi9AzQMVWpl2WrUaBrF3dglYoPSc78h+wchP2C8qBjm83pQg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792353802;
	bh=Et+dPOEl5rC0BD6GX3K8LLIMTCWbSLYMI5a9TaXGrRU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WiS12EZuFf0hyTbfgczEcpKCgt+c6ORI4tAkzse+c3FB7UmNM+ZVSsjWC0xY8UNTB
	 8UgQWI8EZ6Vn66sAIsgBdwsaEiOp1S7CxI7laXnl6WyKjUMG9rdnQ72WJwyY2GvzdK
	 t9id2sOZjjWe30cLd+RLXTIlNzWjPuiLdWTic3VkTn7U6h8/WxNdpd8ctdbkz2oI25
	 HnS1xPbsXAUvsNJUBIYJngxGlcCF/jXVzuCztMrbUQiZvtIkHqh00KSuJpXSA7oHRZ
	 zQ2MWPCAbRe+mf1yQGAyu6ASaIzPGEJtu0EkZ3Y0knULBc5YtuPXLxk9irJ+GgnyWS
	 Ox9Abt5hkXLAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81DDB6060D;
	Sun, 18 Oct 2026 20:03:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 253C61AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 094EF406CA
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAJb1TgWnaIh for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:03:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 444CD406D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792353800;
 b=EvSwW0BqGgg5RW/AaUcvfGXHZW+csfoyDf0G4tBE5JV+DI31ipIzsZgkhunZfQ1JRnOm
 C6vXI2cabOWVvxC43SuhJ6h/zw6q8DACLzlszVhU3QGo2SVA1JgLAwSUAt5E7PbeLPUGE
 T+C+Gry3ZnZ0MOJ5yjuA8NyVg2rK+/XFjGHbAYerP7Mq9mWw3hcRDdzEuV06Oay/JLBoy
 taAuLNCN3pLML2mhng5yJRoqHi7yXUhd/FGmPXPv+lDn0q5kz84D8k8X/PATWXCSewmxP
 NCpPphG4GJPlkGAfL0lD1JQqZ+Ri1uRdoWzawoDzV7AaSb3vqKWJMnKsmASEdOLcAHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792353800;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pVSwY/HWPTqGmX3D14mxsG+MUtem/g67RkbKBsu/MEo=;
 b=ZB33AsNJMsqLY0Vp13abfsgu81QbvlfqlUFmEOPZlnc0ZzWO8lZVYyaGzZyfq4XoFPfJ
 i46uUE6huO3GENAIvsWQT0OD+VcssE/RigOjLIuELCKlB0d+la0bR3ouSFKFw7lDfe9Qi
 uZ8Cmkr+cMGJH+MUNltS1YIo6upqKBDLCggTarLiHtDTzfU22xHsExUgf6V5qY0ugXR14
 62PbV5TeXw7qrjnszB+1zMdYYJV2DSe+4O57mpev9GUPtXvRbeRpv7M5uc1SV96Qnx9uB
 F2GII0iMjg2iKdRIvJBjrnZL0J1CeXjoOT8fiyFTSOTzrrMXlIqvS7VMMVPIqqs1raQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 444CD406D1
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:03:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14B94983EB; Sun, 18 Oct 2026 20:01:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:02:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d04496c8c14a84c6ff9f23a023eb70eea61c683a
X-Git-Newrev: 4f526f47accaa636ff10b288aadd1009d9cefc2a
X-Patchwork-Hint: ignore
Message-Id: <20261018200158.14B94983EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: fix build with ffmpeg 7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f526f47accaa636ff10b288aadd1009d9cefc2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-transcode-fix-build-with-ffmpeg-7.0.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/gerbera/0001-transcode-fix-build-with-ffmpeg-7.0.patch b/package/gerbera/0001-transcode-fix-build-with-ffmpeg-7.0.patch
new file mode 100644
index 0000000000..903987ede1
--- /dev/null
+++ b/package/gerbera/0001-transcode-fix-build-with-ffmpeg-7.0.patch
@@ -0,0 +1,60 @@
+From 56bb6e877794c1209e1930e851b8b8642b4b26ba Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 10 Oct 2026 23:37:15 +0200
+Subject: [PATCH] transcode: fix build with ffmpeg 7.0
+
+Fixes build error with ffmpeg 7.0.3:
+
+src/transcoding/transcode_int_util.cc: In member function
+ 'int StreamContext::createEncoder(AVStream*, AVFormatContext*)':
+src/transcoding/transcode_int_util.cc:608:17: error:
+ 'AV_CODEC_CONFIG_PIX_FORMAT' was not declared in this scope
+src/transcoding/transcode_int_util.cc:607:19: error:
+ 'avcodec_get_supported_config' was not declared in this scope;
+ did you mean 'avcodec_get_hw_config'?
+src/transcoding/transcode_int_util.cc:638:17: error:
+ 'AV_CODEC_CONFIG_SAMPLE_FORMAT' was not declared in this scope
+src/transcoding/transcode_int_util.cc:637:19: error:
+ 'avcodec_get_supported_config' was not declared in this scope;
+ did you mean 'avcodec_get_hw_config'?
+
+Adjust the version check according to ffmpeg docs:
+
+https://code.ffmpeg.org/FFmpeg/FFmpeg/src/tag/n9.0.2/doc/APIchanges#L446
+"2024-09-08 - 3305767560a - lavc 61.13.100 - avcodec.h
+  Add avcodec_get_supported_config() and enum AVCodecConfig; deprecate
+  AVCodec.pix_fmts, AVCodec.sample_fmts, AVCodec.supported_framerates,
+  AVCodec.supported_samplerates and AVCodec.ch_layouts."
+
+Upstream: https://github.com/gerbera/gerbera/commit/73fa1638958fae7db0579b694983164b10946b8d
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/transcoding/transcode_int_util.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/transcoding/transcode_int_util.cc b/src/transcoding/transcode_int_util.cc
+index 014942ab9..89964615c 100644
+--- a/src/transcoding/transcode_int_util.cc
++++ b/src/transcoding/transcode_int_util.cc
+@@ -619,7 +619,7 @@ int StreamContext::createEncoder(
+             enc_ctx->sample_aspect_ratio = settings.aspectRatio;
+ 
+             // Set first supported pixel format
+-#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(61, 0, 0))
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(61, 13, 100))
+             /* take first format from list of supported formats */
+             if (encoder->pix_fmts)
+                 enc_ctx->pix_fmt = encoder->pix_fmts[0];
+@@ -652,7 +652,7 @@ int StreamContext::createEncoder(
+ #endif
+ 
+             // Set first supported sample format
+-#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(61, 0, 0))
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(61, 13, 100))
+             if (encoder->sample_fmts)
+                 enc_ctx->sample_fmt = encoder->sample_fmts[0];
+ #else
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
