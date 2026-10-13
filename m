Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C2ACC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9786440709;
	Tue, 13 Oct 2026 21:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lq-LzrsGGpb; Tue, 13 Oct 2026 21:50:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 96491406F2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928252;
	b=EYUPucZmjtUJeJLx6XRc5uA3gGpUl3/szKac4Av2Rso0mbeb4hOdhkZiV8oMNBNI6mxN
	 HGqHh5gZCMhyarguULcsmvPz0vbL/14oAxiU1UvxQC7Z4/Ep0c7/RLGJcPCN8wrj8wpMp
	 MTGPwmvY+9efDGjHxBVxoWgYH5nNdm12QrzU3XpbcbLfLljfLxtPxFVghWrCUeVTzg83G
	 ifop4zNNLAy7IUByg2hH8QIuUEc7WVmFZCWh7/JeBsYqtt5mWCFa2CI3+hkRoQlIl6B8y
	 l+nTFfsgix1+x9pbVK8CWYUA8jaSBHxO754Zjf+m/fHqCoel6DXjY3tg/O/omHHye3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/wvqTOJHzzadmzDP3eCuPRYvoNRqRPuUxJHk3d54lRk=;
	b=dZJfYvQnavr7WKOFnmNu3LQmf3BMoXoggtFXYEqj9LKHXfrq/crrl2olyJgpP9cKmCP7
	 v5JEwPPWEuOWk2Rkwyjjictd8iaOYbm3pZfMc3RN3sZ3XTZDlPnSoKFgqW4zwm8sSeGa9
	 syL2Xfe2RqBbC2S33bwL1Bx8wriPlR9vFyQAXZqDFEDiNbYXlkDXqlNQ1mlG4al1BhV53
	 gmQk6wL14XNPCCgEQKyqk6FnqFOIikK5+FBq6VS9WXfGcRMUo/M8rN6Q1RpNO6WMNOShQ
	 W6k+XeJpuk34CDy5hm/YnGS9Uk9JLnVfE/NWm0GGpJD1xp8HEOPMmp4FH2HCUW2D5ow==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928252;
	bh=/wvqTOJHzzadmzDP3eCuPRYvoNRqRPuUxJHk3d54lRk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=raeInOgIpX/uNyIMxk91zBycqORtyoByBYS9cV8GkoL418lZ9AyJngj0p6M8Fb2+B
	 /261ff7wmAzNlwWltdD9OIx0f/z3hnU+DypWHYfoqudO+yTq4D/sZGowwFS7QBnpra
	 pdaeCIYdZWYEvfdvPdhdu4gGVUR/HoxKoHdPYxgaXy0BOs01BQh8W3sF0YuNLebbBG
	 NNhp3DMEPvAdkmZM4EZTfFjEumwN5O+P/Am9pFrYI6cOHncojm5XmCVFEIbDQunKiD
	 h/M0wMhpUYmBxf6bzSAW8LBSi0MpKSzR4Spnj+/u6BZUFyCiybJJUgVnoBjtEyuLwX
	 wfZtZPHmJcKYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96491406F2;
	Tue, 13 Oct 2026 21:50:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10660235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0211E60890
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQU5yNTLCF3P for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:50:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A2D2160681
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928251;
 b=Tt7sXFPfDhqgI/fXKPfr59rez5giEMb1fK4vM0Kz3nbwyBOUuNAEQSUo3sO+q3C1qaTk
 69QWzLS9lbRwVIsp8HJN5qERvsj+xoTlY0Wf+FjufRqoCmfHtu2wqL0KmQZ24josXH+q7
 p+g6Eu20qyzgf1Mj89eaZAhCWkf5wUsVYfhWiCOnb5U5t5ti2M+gD7FrKUbAdjeTG0xtz
 XOrwQjBE0yOz7PGnmMhL9Pe9ywgwFOf5+QAJ57Lx4bZdVB2XkZEU7RwLZXccxUyrOJReI
 bmm6FQ0eqU5Qdx9cIJT/ln67w2mYax6qE+wjSmcAXehkyqQcqi2joBPNe2SscTiNh4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928251;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=x3vfAW92qdIcoqpv6PVbL3hB5HfNKRdn5r5MN1njYy4=;
 b=O/ha8V2EQnqSJ0ZJMOFPllIdqYlBmrnAIIxGZQ3uB/np8TPsc/haw2nBg8gri8MxuA4b
 DUGdDDvtBQU6yKGp89b+HOByHcYdxaqeMe5bdI9AdyEt6UMfOAlA70j6TCd7TTg0cJvcW
 0+e2GgFB5KUC0AWeWJeD6wU0KXKioDkYevtsuuNWwOkDDVQFYZB/zSWD51HWNBKqDLn+a
 K7JxhEn8tzEmrNnkbPFk2ZcdNyDk6OJGqy+hWvIJ5jTympCY8YqmapAD5w4SWNk32D5ZL
 1mOnig8dX5YqpZE5K8lqqMVEoB5paMPfJ3ZvyNsbVcbk/bSDrVwlDD1pLUpgRsCrBcQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ifYhbTlo; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ifYhbTlo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2D2160681
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791928231;
 bh=x3vfAW92qdIcoqpv6PVbL3hB5HfNKRdn5r5MN1njYy4=;
 h=From:To:Cc:Subject:Date:From;
 b=ifYhbTlo/mg0qiMQSdR/KtRAWbUgtw/wNGhSmeTslsbiTTPJt0ttEnRDhGcC56a5T
 Peqc8MtHg0RuoF2xn9RZ6cAOFOnUCnRf1+68nwqhTuN9WYkErXHWNjTGl+5bfZFfOP
 2sc0a+CKcU5SWZASQJ/u52tN/hH0dhBTig3vfIZpPzYFC8JWdgjSVkAH0X4fAGRAXD
 IKQdD7OyRTDVw1koG6egbdkcOWFJMzPmuUQ7+z/6O1Y14IelXH/ige5YdL1SIK0Ziq
 8F49TXeRZmWwT5nU0+10wDRKOmcHFZuRWv+VUrLRvYodF+Lb21XCopxie/OKkBokj1
 spAwX3Wb8uPEw==
X-KAS-Sym: v3:f51bdf72230551df:iRrhmmgc7+3BXX9A7J0fNbonZj/POtdddEk4Wm3Jhqtu+
 sXfYOd4zBWKrruPbrjPdv/aES5XyA4HhkYwm1co6isH0XaNMXgtqj5ztLda6xfN7JMCG5kC0l9e
 eg7Z6CBkYtSFlvHI38C/3xfc6/ar0E34i0+9kgHjEx4muSh1jt+pz1nqnncJQ+adhAsuZfnsXvq
 YBz93Ws0X6CBfGw73C81W2yZVNFEiDXmm2njJa1Z97kdSXiwA83kCl7e1Iei+EnLIJKwlHgl7U+
 TiUmmYdu0QK4VggGIaCUOAcqzRcmHRIsp9t18czpbCJYDCR+z7UrxaMk/Rs6hLK7VsWaFchw==:
 p089goSVcsA065nm4aKhpTwqMPXG99f0Ywj6zomMTTvilB/typW97+BoDBYwn1gSULbCgmxm9VO
 Be7dtOiwEY6+wg0s2Vus3Fn782iwX2HjrktgjC7QWe09qDBZPwQ5CWWPvly9TE5YIqPj8XqmuPm
 AN+QWKZlQuRHemFvWNA71esyrdgWqk2AdgHionwPlauNx01r6moYMLo9FODHSlvGmwVndjNOHkr
 bGgq9f5Sr69QJLOD2GI6RS1PJhY4vOfcj53EJ2XzmsjMRNHmKqX+0OLd2cx3oZQS0eKx7q+XXTM
 67amX1M5b6cjKwcOF+H/aWom702cG8OsRZT7/RNDFG1c4GdN12Kp/hlPojnN6gC3oHVOfh3l4Mf
 pBGjDwQfGM0UJwr8AJ3s51PePg0BgH2DplFGxVfizXsOwrgKb+MVNgfoNf9htzQIcZPCAIaiJxb
 Pq8H9EQ+aBk8tODsNRzBVugI4vCMvjqrIdhY9y9/Y20QZsPXaPS9ZXB2AjvM8H3e2LyjgDuYdf8
 PojviSWtTF2Du4CPDJTGY5xRPPbDPgETK+WeWiTExlrNIhhCqJseookq7W5eYABQFblqmXlt/BS
 83ltX/0yte8UBq6qvJfu2oUt9Sbd6xXdEeucKAxRPXfr79OPDsiYoilZicY=
Received: from fli4l.lan.fli4l (p54a1b220.dip0.t-ipconnect.de [84.161.178.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C4EF2A4C5816;
 Tue, 13 Oct 2026 23:50:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37044)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xGkOF-000000001g9-0aAo;
 Tue, 13 Oct 2026 21:50:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 13 Oct 2026 23:50:25 +0200
Message-ID: <20261013215029.317512-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/5] package/gerbera: fix build with ffmpeg 7.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-transcode-fix-build-with-ffmpeg-7.0.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/gerbera/0001-transcode-fix-build-with-ffmpeg-7.0.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
