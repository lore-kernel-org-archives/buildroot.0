Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F3AEEE250
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 19:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CE4E600D4;
	Thu,  1 Jan 2026 19:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0ODXf4d-K-Q; Thu,  1 Jan 2026 19:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B37F060647
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767294352;
	bh=1JrSmBJr1KIrw+nnb17TrOkjZ4Ll2N8oXNKRQ/QYabI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E5s0pXL11DJdOrlGzXrfJ5lLN4WhCI5vErMTJcrCySohHpspkI5rQbgR7abNBAVey
	 9OoW47oypRZlw/5maXAZZxiMzumvIXWhAtSZU65lPuJYksYjmtW1smyaYKFfFsZwZB
	 61KMPLXAt7RV5JcvkBzOW/Ly+ZfxWvbATj2eiCCgi87gUinNx/xqf+AeMzvIuvl5vf
	 ZjSxedLLO4OuFcftBlMWFWuZNmFWG85ol2P0SzlHD9cYCoSEV0NEA25fimxd50dUmD
	 KP7uvq2NRC+vDHswKEdC86hC/oBzL6DpAgvYdMjJO0Lm/JkV0gEuXMioytNshP1BAA
	 sE1RuK8LJ3hAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B37F060647;
	Thu,  1 Jan 2026 19:05:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39CE3351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C20E402A8
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5j6s2bxylR2 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 19:05:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 195A44020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 195A44020B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 195A44020B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:05:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 19558A4C2EF2;
 Thu,  1 Jan 2026 20:05:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33848)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbNyx-000000003yY-1v2V;
 Thu, 01 Jan 2026 19:05:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Jan 2026 20:05:09 +0100
Message-ID: <20260101190511.1604441-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101190511.1604441-1-bernd@kuhls.net>
References: <20260101190511.1604441-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767294312;
 bh=TPLBdw69z7lGV7gs3M/52U6gqThx3RTAu58sovMgedk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YIHMRSpT4mOBJvgNts4j40KqOQQDS6llUemB3qLYoewXgBNkbYyiPjx5t+6iYLRFl
 6j9j9wI5YSRaUQGqNQTOxpdM44rVKniRkQlm9T2R0r0dzq6vATnAJzZsyPpYUpuNTE
 mgEvwi6Ivtu/sJ/YgY4pT7HLi6YF2hk4bdv2l3h7ddiskxohEH2Y5PCBbC7tYdHZQ9
 MiGlwbbM1pdPCjAXPVGYk7OP+yHmCw8ncu/AvU7yT1b6KXOJbn3mbG6t2lWF/h+si4
 IKFJHmyRT5rMIaRaTpiZehaRvFW3szqrJXpoDgN57rowIQHK+BwIh6ds7fgCsjwCQ6
 4zSTlu7aNnIfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YIHMRSpT
Subject: [Buildroot] [PATCH 3/5] package/qt6/qt6multimedia: fix build with
 ffmpeg 8.0
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
