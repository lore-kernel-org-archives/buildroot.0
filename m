Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51939CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B21D81FA8;
	Sun,  7 Apr 2024 11:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XakTDhlfqrAA; Sun,  7 Apr 2024 11:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F1C481FC2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1C481FC2;
	Sun,  7 Apr 2024 11:45:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1CD51BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF57D405C3
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAswOqDoB0jr for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:45:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8C7F405C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8C7F405C8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8C7F405C8
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:45:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CBD06A4C2D8F;
 Sun,  7 Apr 2024 13:44:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx4-000000005Wv-2QZT;
 Sun, 07 Apr 2024 11:44:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:27 +0200
Message-Id: <20240407114445.683504-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490286;
 bh=ykwN/F9RvejWAyuWdTvCjrkX7YnX422OxYmJ0QxieJg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=trosVITGe+f3AeeilH+BB2HIuXaPHi+ELhtyyZ/cPyOk9fOMRM5xGrc2BTe9Lpxg1
 gHiRmZ62/vMxMjaP7YvxaVfzSQir5WpMwI3eB0eTR6REJVNDRkTCrH4YVyAoXDFh7f
 1KZMolbixkqpwdhiIIft4Hurv6jah4xINeS+6gXoWWfmTZI52Pt6ow/Ts2cHKhXc9v
 SQsjaeksxAegQnRluOW6jSCPT/zFi9AlseDgLERNixNr3QdAh3A0RPqmVd+TXpsmxy
 /Sy51iS1W4W92wJUfcrKhslvW9WrWvE9GReQGW2VU15S0dHT4iEAlLCiTZfqookRlV
 1JjGcj3WhPKmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=trosVITG
Subject: [Buildroot] [PATCH v2 02/20] package/freeswitch: fix build with
 ffmpeg 6.0
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
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
