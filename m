Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7F3CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70EAC407E9;
	Tue,  6 Oct 2026 16:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSXq5UyglejL; Tue,  6 Oct 2026 16:41:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7C595407F7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304868;
	b=ZoJn7RkSKjCJVi9Jm6Skrs9sReUN4vzQZWl6hcwT1Ct6FqHp9NsIKXbjUg2Y8JCWgraT
	 /w0On95Ktk+LGRydi+KBAGW8a/ONUsb40NSSX0YfMpPBLaQXw11t50iyNiUGh8Jj/oUzo
	 u4horTm/H68NxKOYdtw2c481QdGPUaQ+PtlBfvl//Gk6HNlH6+UyTsH0RZP2wbDP6wuvq
	 3/cIXIyRqleDgjW9D5xkWAeLxeRaGCE7JgH4AZY9R0q6KNNLIcnT/k7ed6Q35bfPXOs5R
	 D0TKqYxfpE2XJP1liGXjcmX28YIRRubKjoZpUz1/66L8xpJ7LHNtbNtAaM7M/6HDzlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304868;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HpLu6qIQTTz8oQYmPKOL19IQmODiap5FbvBCEVAnYJ0=;
	b=muB2VuCVRQ9X7qGDdGjWAxN/gUBfQgEEfPDl++e/+RB1wvnWuzQOpX3CVt2GnM3547qz
	 V7zSCsSBnSLwN+nRCYhQfxVGd3idLC1AOQFTQciEox8sRLxi6mmNAljPvMGR0yW2qvB64
	 sQvihx9OqseNIZrhMqt0EIJjTaybzxW5yIJW1zFFlTXyAapMNP69HQVZnTHxyvTVAluL9
	 qSfvJdrRoNzkS9+8zgRiv9TZECRdnKISD3Y14wwft4T9GSkEox5qOmvrzgThQdx4Pktgg
	 +sdY0NhKw401H8qybxUPcpm31gXYgDexZRftlf3Z1zyd/ku4JdnXHxPAcY3M1t1vhlQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304868;
	bh=HpLu6qIQTTz8oQYmPKOL19IQmODiap5FbvBCEVAnYJ0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qpILESn83aB9Uy/GRkbdC8+0ix0f0eJzS/dq1yj5uYJqkyDMQF6sbw/ZQi9w/fYzM
	 P96uoqZH4dtKYTKMFVxevDDuIvOwzPBN8yTAX30BIr1xZlf0A62p/KdNmqzt6YR09k
	 kU5ai+LALmNVKh31F4YLErycgs1bnWf3r588IzN6b4X++yetOT5SuVjEeyNKwJolOL
	 /MsWwXmsFf2gyehj4OgUOuh+8GAKPfg0B/4dHNHFLulE5KjUA9qhPz5jgFzgLrGhF6
	 SJs9k4r4KEwZJldn8IS68GvkTjZ7o4c3192dawu9QpRdsnu/Uxniyo690IyTXqlUN2
	 PPujbY8sJ2R1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C595407F7;
	Tue,  6 Oct 2026 16:41:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24408317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EC3160817
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTWOFL00YSjX for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:38:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 07AFC607F6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304686;
 b=cQR0h/b55BhsAc9pEow/JK70VZuOithSqcLMAKY/qzfVI9Vb3A7r5gPB41KPUzz19D9z
 lpKLIiu0IZPIJ+9tom5kDIXYmzN4Df/bRBa71O73ZVhnQettNgINGzFJN3Jl7YXIO2Aef
 R2Ybk8QF+HT61bU6C6lKrN0a6OYnvWNh9DEfy9HIeanIkFxfTTHNWeyH3DibnLVplO4A3
 ZGJlWSeoyDBD4A5SMQn1QkKu6fNfXijwc8u0XbXQ76Q1dWfxjt1jJHxSaGr6IdoZHzib8
 5wGWkrV4jdW6ABZYb6RWBn8gqO6pR0WiweOGpt0PdwSSMs2R/oeE8qmcHMDGpzP0M1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304686;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Oq9SJMDbHuGn8rf5kcHVz/511Rf1KJHQnSAfFaeIeAo=;
 b=bQbBW5ojKBHxT2fjO2QkK9Pwx00EsR+ZumX3JynpULL4pZlOrLZKGTgec5Ng03qvCpgg
 IOx70/8HR2R/PJjRQds/WldNEaBfH0/0z3C7U/JFZ0sRvRv0XC0ajIWkZ3NUS43Eao3ct
 Zanb/jBqKQhp5jsl8ZMEOSfS9oKDH8aht6vnFyWb17kbhd/g0l10Oyl+UzEdwMCX56VWf
 w8vamvjvxmL4OZQfCZWrfeZVYByLuwt45nT05+oryMkVD1J7oT8t47+xk9EuuqV8PJVG9
 +IiK+gfWoLC7ruQLJbjTsjKbYnC8gek2F6PyPqK21e/yNKzwJCIjBmMeMq41pWTlUGA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RpYKolWc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RpYKolWc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07AFC607F6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303714;
 bh=Oq9SJMDbHuGn8rf5kcHVz/511Rf1KJHQnSAfFaeIeAo=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=RpYKolWcFE5zBTH9z782ICK1wRpNCmSquYUZrqL0+qC5Q192njoMaQ5lw8O9TUl/y
 JJ7o+s+TMj9Mpq/5WtJRrrbvmVNolopcfJ3gfSNzVTQzscxaXEu7rkbtIkQd+Laib9
 6brxlD9tU7K3JBJlxa7JthhnjPfaUg5hyN0eD18PnFSRgi+FwmTTQXWRejjfCbTJix
 h//DL6+x0KlKrPxoZodAnmJAD1zPczBqX3c96+jGRFqynGztGEphOF4LHq36wDY3M7
 EsScE7derv2JzWopTIVMjfMnec7mNYt3OgzJ5C4d8vZ3r5NVX5B1mYtT/HnqT2zzu/
 m9/K2oa8jV3tg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 R8d4z7psdSkhd/+gWHSePuutGj56MZK+yE8eRg+3ZACQSg1yNLTNVEh7oADHqkWD1vlx1nUxs6A
 ZwHUOLMnFVHrpkiphkHoKXasiw+40OctfNN0yao0sdc6J4PmJ64+FwqAotJHTPJ70d7fmoC44ew
 c6Ab7oLrP9d0qbx/dPu4JXpOKMtZKC63b50mdiyT1R4wDWPnfkmYIBcXv08eReA4eHdqX1Zuh4Z
 bkzmeT0oEcP81JlQk47SV/VFKHnRqsKV4flySyXvDfKJgpGjIlqBM5MTG7o9B/58Kvvs9GEyGDI
 88KmlMzY4WpwT+xnorWcoIG9SS+i7An1UASbvvWDGvCrLMiVCSbWP+nXtTNhaUmDU01V4pTKca0
 5guV+gRN1FhfiL+ijjhhuymob9tvhXJ52dtDMaV6Rvf6dg0B7VSMO6KYdjLYMoy7dlPHLPS7shT
 FCWLeXUNmxcyuOK8Ex3OyAzTuVSTt1/BJw2BMQsCrXutNUXohHyGBq26cAzXvwBNixXhiulpgcm
 QlM2YFbLiSLMn5ybOV4Xaxzsi5Sl6+ynzZSY8RhhCWj7B0gEJn8Xx3G+pwsTuj+Ho80vx4NbEMd
 8O1I4as=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1BFD8A4C5586
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uo-000000000ir-0xEV
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:39 +0200
Message-ID: <20261006162106.3439373-59-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 58/84] package/gstreamer1/gst1-libav: fix
 build with ffmpeg 9.x
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
 ...av-Fix-build-failure-with-FFmpeg-9.0.patch | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch

diff --git a/package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch b/package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch
new file mode 100644
index 0000000000..31899e0a48
--- /dev/null
+++ b/package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch
@@ -0,0 +1,72 @@
+From be9bdb67f4fc868977f1f74e95b6ebe19ef792ec Mon Sep 17 00:00:00 2001
+From: Reilly Brogan <reilly@reillybrogan.com>
+Date: Tue, 4 Aug 2026 12:09:11 -0500
+Subject: [PATCH] gst-libav: Fix build failure with FFmpeg 9.0
+
+Closes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5251
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/12217>
+
+Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/be9bdb67f4fc868977f1f74e95b6ebe19ef792ec
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ext/libav/gstavviddec.c | 15 +++++++++------
+ ext/libav/gstavvidenc.c | 15 +++++++++------
+ 2 files changed, 18 insertions(+), 12 deletions(-)
+
+diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
+index e21f3e1558..39335d98b1 100644
+--- a/ext/libav/gstavviddec.c
++++ b/ext/libav/gstavviddec.c
+@@ -2677,12 +2677,15 @@ gst_ffmpegviddec_register (GstPlugin * plugin)
+       continue;
+ 
+     /* no quasi codecs, please */
+-    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO ||
+-        in_plugin->id == AV_CODEC_ID_V210 ||
+-        in_plugin->id == AV_CODEC_ID_V210X ||
+-        in_plugin->id == AV_CODEC_ID_V308 ||
+-        in_plugin->id == AV_CODEC_ID_V408 ||
+-        in_plugin->id == AV_CODEC_ID_V410 || in_plugin->id == AV_CODEC_ID_R210
++    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO
++        || in_plugin->id == AV_CODEC_ID_V210
++        || in_plugin->id == AV_CODEC_ID_V210X
++        || in_plugin->id == AV_CODEC_ID_R210
++#if LIBAVCODEC_VERSION_MAJOR < 63
++        || in_plugin->id == AV_CODEC_ID_V308
++        || in_plugin->id == AV_CODEC_ID_V408
++        || in_plugin->id == AV_CODEC_ID_V410
++#endif
+ #if LIBAVCODEC_VERSION_MAJOR < 61
+         || in_plugin->id == AV_CODEC_ID_AYUV
+ #endif
+diff --git a/ext/libav/gstavvidenc.c b/ext/libav/gstavvidenc.c
+index 2ae6a1b451..b8e010e70c 100644
+--- a/ext/libav/gstavvidenc.c
++++ b/ext/libav/gstavvidenc.c
+@@ -1025,12 +1025,15 @@ gst_ffmpegvidenc_register (GstPlugin * plugin)
+       continue;
+ 
+     /* no quasi codecs, please */
+-    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO ||
+-        in_plugin->id == AV_CODEC_ID_V210 ||
+-        in_plugin->id == AV_CODEC_ID_V210X ||
+-        in_plugin->id == AV_CODEC_ID_V308 ||
+-        in_plugin->id == AV_CODEC_ID_V408 ||
+-        in_plugin->id == AV_CODEC_ID_V410 || in_plugin->id == AV_CODEC_ID_R210
++    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO
++        || in_plugin->id == AV_CODEC_ID_V210
++        || in_plugin->id == AV_CODEC_ID_V210X
++        || in_plugin->id == AV_CODEC_ID_R210
++#if LIBAVCODEC_VERSION_MAJOR < 63
++        || in_plugin->id == AV_CODEC_ID_V308
++        || in_plugin->id == AV_CODEC_ID_V408
++        || in_plugin->id == AV_CODEC_ID_V410
++#endif
+ #if LIBAVCODEC_VERSION_MAJOR < 61
+         || in_plugin->id == AV_CODEC_ID_AYUV
+ #endif
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
