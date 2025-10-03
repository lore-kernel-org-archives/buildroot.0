Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB40CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 13:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87FD440EE7;
	Fri,  3 Oct 2025 13:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3R9CN24M-D2; Fri,  3 Oct 2025 13:56:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1BEA40F04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1BEA40F04;
	Fri,  3 Oct 2025 13:56:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B84D391C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 13:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA7C2610B0
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 13:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gg4XE1x8jd99 for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 13:56:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8470160756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8470160756
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8470160756
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 13:56:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc8f.dip0.t-ipconnect.de [79.214.204.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6590EA4C5D11;
 Fri,  3 Oct 2025 15:56:34 +0200 (CEST)
Received: from [192.168.1.144] (port=51596 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4gGw-000000005Y4-09uT;
 Fri, 03 Oct 2025 13:56:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  3 Oct 2025 15:56:33 +0200
Message-ID: <20251003135633.371759-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759499794;
 bh=TPLBdw69z7lGV7gs3M/52U6gqThx3RTAu58sovMgedk=;
 h=From:To:Cc:Subject:Date:From;
 b=qQv7XhmbROLRU3AkdrZBKsuPcCeTQ5szb+T7vGbAykjsoLcBFtE9QeL+Ugv4b8c3g
 mkicjtY3e2WvnWpSxIlN5+l1/DpG8za8hOrMGCakJfX4UArnzbndPHIeuEEEReIVAv
 x4dkiNpL977t6sMlLAcXxwmB60DloeN45JI1eWgVkTXMW+h+PGQ6uRSIauPLW8RdeT
 +F3+t2wQeE6iVSZVQZ4jjottW9Z7+ZCNXG53BEqwxsY2bgl5n/DcMwtp0fbbx2UdD1
 xB+D4en7bmr4p4KNNsTTV/7A5AiZNAxb57mcWhJqV7EqCHnx3t9CfvuobPq2Vupec2
 TT6ywDqYIEFeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=qQv7Xhmb
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6multimedia: fix build with
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
