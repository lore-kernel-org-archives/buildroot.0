Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F01DC67861
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 07:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E791A4026A;
	Sat,  6 Apr 2024 07:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtI2zVLA2rg9; Sat,  6 Apr 2024 07:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D130E40396
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D130E40396;
	Sat,  6 Apr 2024 07:32:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5142D1BF390
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EA216080E
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNaBnN8VrxS3 for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 07:32:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0631606C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0631606C7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0631606C7
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 07:32:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cabe.dip0.t-ipconnect.de [79.214.202.190])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C251FA4C1958;
 Sat,  6 Apr 2024 09:32:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60956)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rt0X9-000000000gm-3ZZp;
 Sat, 06 Apr 2024 07:32:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Apr 2024 09:31:59 +0200
Message-Id: <20240406073216.1054073-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712388736;
 bh=ykwN/F9RvejWAyuWdTvCjrkX7YnX422OxYmJ0QxieJg=;
 h=From:To:Cc:Subject:Date:From;
 b=fgIW+REKcV4GyXjKRCEvQiE9lOzIAQ2z/8C00Yq6Akk1fDCAbC1WSwYr2Fmd7m4c1
 ieVdkgB6M5zW/57sn1uNy7zmijgAf7LtoQaQavn47JBLRBwLV08Rg8sO8OpSfvYLsr
 KI/NQ3Y+6j5xxKB4z2wA2nt5sOGbDWKra4zZ9asaq9PvGUR/+/OoSehyw5MY6hYzYq
 luzguKcVgpkDuWkjs1nwBu0RK9wSJ1QMMWpo+WtYjWDqpDBAi9ZEaYN+bR2Z7VNRKO
 8cx7opRAffRUarZA9/UOek1iZ5u+R9foijC5bKM97BL7rQg1CEl4Ix3X3Is0P24OyQ
 h1WupJapT4ueQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=fgIW+REK
Subject: [Buildroot] [PATCH 01/18] package/freeswitch: fix build with ffmpeg
 6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...002-mod_av-fix-build-with-ffmpeg-6.0.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch

diff --git a/package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch b/package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch
new file mode 100644
index 0000000000..bd38d76d85
--- /dev/null
+++ b/package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch
@@ -0,0 +1,48 @@
+From 2e75bb8b2c7f70c5d16c9e3d14b1427f4eb80c9c Mon Sep 17 00:00:00 2001
+From: Korynkai <matt@qmxtech.com>
+Date: Thu, 17 Aug 2023 21:10:31 +0200
+Subject: [PATCH] mod_av: fix build with ffmpeg 6.0
+
+Upstream: https://github.com/signalwire/freeswitch/issues/2202
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mod/applications/mod_av/avformat.c | 2 ++
+ src/mod/applications/mod_av/mod_av.h   | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/src/mod/applications/mod_av/avformat.c b/src/mod/applications/mod_av/avformat.c
+index 69475c169f..0a1662aed6 100644
+--- a/src/mod/applications/mod_av/avformat.c
++++ b/src/mod/applications/mod_av/avformat.c
+@@ -455,6 +455,7 @@ static int mod_avformat_alloc_output_context2(AVFormatContext **avctx, const cha
+ 	}
+ 
+ 	s->oformat = oformat;
++#if (LIBAVFORMAT_VERSION_MAJOR < LIBAVFORMAT_N)
+ 	if (s->oformat->priv_data_size > 0) {
+ 		s->priv_data = av_mallocz(s->oformat->priv_data_size);
+ 		if (!s->priv_data) {
+@@ -468,6 +469,7 @@ static int mod_avformat_alloc_output_context2(AVFormatContext **avctx, const cha
+ 	} else {
+ 		s->priv_data = NULL;
+ 	}
++#endif
+ 
+ 	if (filename) {
+ #if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(58,7,100))
+diff --git a/src/mod/applications/mod_av/mod_av.h b/src/mod/applications/mod_av/mod_av.h
+index a89e6cb8f7..ef9bd48d73 100644
+--- a/src/mod/applications/mod_av/mod_av.h
++++ b/src/mod/applications/mod_av/mod_av.h
+@@ -42,6 +42,7 @@
+ 
+ #define LIBAVCODEC_V 59
+ #define LIBAVFORMAT_V 59
++#define LIBAVFORMAT_N 60
+ #define LIBAVUTIL_V 57
+ 
+ struct mod_av_globals {
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
