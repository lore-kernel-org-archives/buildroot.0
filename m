Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A43BEED630
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 19:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F32A4067D;
	Thu,  1 Jan 2026 19:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNGOMHIdn3w1; Thu,  1 Jan 2026 19:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 705E240692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767295241;
	bh=1JrSmBJr1KIrw+nnb17TrOkjZ4Ll2N8oXNKRQ/QYabI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Itb1y2twynWL0DjkEWX/7Hv7eZu/Oaw2t8VRe0em/aw1BU4SPS44/f2vdn8E4GMmU
	 YV4pKp0wLvbvHnWgWUdHevv9TkL2McW9saVauSLsfjmZ1d9jMs40iWTmioG8av05iQ
	 ZcB4gCfdKmVhi4c50p1ompJUqlChQAi23Bbj9AKFss7qQx1xqwgyf9qfbMa3r7axtO
	 9yDb2vPY+1OGT7GMuzdv6Q53p2pCgm1QVF7AuZ9GFcvcxuRarvcxU98vlmtsjecCHm
	 GGYeZeE48FzogBpd0W3aQRa0JmlcPexa+qSmS9cj/gTSTEka+NzQb80TLGTQCYi4kw
	 zNTSpOHXRi6dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705E240692;
	Thu,  1 Jan 2026 19:20:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25B0F351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16B5C60679
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IDqZmuubTUU for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 19:20:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C9A96071F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C9A96071F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C9A96071F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:20:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 78854A4C2EF2;
 Thu,  1 Jan 2026 20:20:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35326)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbOD6-000000006Zs-35n3;
 Thu, 01 Jan 2026 19:19:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Jan 2026 20:19:47 +0100
Message-ID: <20260101191948.1714200-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101191948.1714200-1-bernd@kuhls.net>
References: <20260101191948.1714200-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767295202;
 bh=TPLBdw69z7lGV7gs3M/52U6gqThx3RTAu58sovMgedk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=T1e1OIwRieHvlh0i86VQht20yCAnTCrJzQQrJWrCetfLYPx/iWfbV3vmDPja10adn
 tDQ6QZfqckHSMpWdoXPq2lGmSeNB+pzO59NoxQJ6CLb/m9/dWm3sBHV5Chyqit9t29
 xxmyaxiPA/+vtYBDOHlAzLyO0sqEzV4WdtcFbEEynFCZgUvZzaT1/mjoEmS+JFIUhw
 i/UFjTcFWrWAUHPY8ctfXKs0JvXTo4waErYoUt4gX1nMcnocjmKGfRpkvEV150ym01
 doiUfBdnoZfjVMxMrsRMSlnJtiMpU3GpqgZEXX0kxQkVZC1G/6OADIw6+s8Y7ZSb/B
 +TvGNoZaVNz+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=T1e1OIwR
Subject: [Buildroot] [PATCH v2 3/4] package/qt6/qt6multimedia: fix build
 with ffmpeg 8.0
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
 package/qt6/qt6multimedia/0001-ffmpeg8.patch | 39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/qt6/qt6multimedia/0001-ffmpeg8.patch

diff --git a/package/qt6/qt6multimedia/0001-ffmpeg8.patch b/package/qt6/qt6multimedia/0001-ffmpeg8.patch
new file mode 100644
index 0000000000..9bbeb9e135
--- /dev/null
+++ b/package/qt6/qt6multimedia/0001-ffmpeg8.patch
@@ -0,0 +1,39 @@
+From 9670d9e5eb7acb9efb0f2f1a798a09baace53d82 Mon Sep 17 00:00:00 2001
+From: Tim Blechmann <tim.blechmann@qt.io>
+Date: Mon, 2 Jun 2025 09:56:57 +0800
+Subject: FFmpeg: 7.2 compile fix
+
+AV_CODEC_CAP_SUBFRAMES was deprecated without replacement and removed.
+
+Pick-to: 6.8 6.5
+Change-Id: I45ac1d0d603f88701bdb727a7a472cfea8f32d5d
+Reviewed-by: Pavel Dubsky <pavel.dubsky@qt.io>
+Reviewed-by: Tim Blechmann <tim.blechmann@qt.io>
+(cherry picked from commit 65b11b9f97632101041134e04713697b17819884)
+Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
+(cherry picked from commit ef866d101e58832f0bf86150ed8328e2d3ec9c49)
+
+Upstream: https://code.qt.io/cgit/qt/qtmultimedia.git/commit/?h=6.9.2&id=9670d9e5eb7acb9efb0f2f1a798a09baace53d82
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp b/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp
+index c154fd835..360a33909 100644
+--- a/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp
++++ b/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp
+@@ -99,7 +99,9 @@ void dumpCodecInfo(const Codec &codec)
+         { AV_CODEC_CAP_DR1, "DRAW_HORIZ_DR1" },
+         { AV_CODEC_CAP_DELAY, "DELAY" },
+         { AV_CODEC_CAP_SMALL_LAST_FRAME, "SMALL_LAST_FRAME" },
++#ifdef AV_CODEC_CAP_SUBFRAMES
+         { AV_CODEC_CAP_SUBFRAMES, "SUBFRAMES" },
++#endif
+         { AV_CODEC_CAP_EXPERIMENTAL, "EXPERIMENTAL" },
+         { AV_CODEC_CAP_CHANNEL_CONF, "CHANNEL_CONF" },
+         { AV_CODEC_CAP_FRAME_THREADS, "FRAME_THREADS" },
+-- 
+cgit v1.2.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
