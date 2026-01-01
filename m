Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EB6EEE24B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 19:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38AB640699;
	Thu,  1 Jan 2026 19:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBsfSTCz-E18; Thu,  1 Jan 2026 19:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 619B34070C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767295217;
	bh=eQxBObuU56wIxztUVUNmApJOnd87gbakDKLqV6gPUeE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RC4BOelbCPuCqBpbraC1Bdzc2rEYIMw4qT5LqfFDP/Z2TJK+okqJ/w7u6UPAcy4GZ
	 lwzm954JQlYEQ51NbItwiwr1DJZJlNwiYrRWwhhQASlt9t/hwk+vf11HnPAoWONiYC
	 A/jplaWaaYsTs1mqUhKKWD9H0QfOAtqgA1wk00r3fX2Wvf8HhKzgcbFNB+bIXhSzTY
	 fCgV/y51UgyjD9Hy6kri17rI4oEfHJ1pbzou/Qd+t7NW9nvuiYS/MV8ld9ol3MhWkz
	 bGWPsefEO8IFx+hVHnHI8mOqLwZ6r0M/077sSRnHD02XG/negOts+g5xHxc4PubVI2
	 wI2TUpH6lhEXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 619B34070C;
	Thu,  1 Jan 2026 19:20:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 435F5351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 361A140719
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAzkU-RVWR2I for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 19:20:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 22FBB4070C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22FBB4070C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22FBB4070C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:20:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 44173A4C2EEA;
 Thu,  1 Jan 2026 20:19:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35326)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbOD6-000000006Zs-2kPB;
 Thu, 01 Jan 2026 19:19:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Jan 2026 20:19:46 +0100
Message-ID: <20260101191948.1714200-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101191948.1714200-1-bernd@kuhls.net>
References: <20260101191948.1714200-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767295189;
 bh=6JbYDpisrctD8RXm0MnjEPB89CHYFnPLobNqbifeqLg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WlZFVYF/3BYNbWO/3qgWLO8/P+TaNiC9ByGEk+g0AIN+SSHg/wBrc3VC7uaakx4n4
 44lS6Z23nHivh/e9dp2ysbL3d1L2Nm8of/zo6cPiXQZDHAElB6lffh7bgkUxGG57ke
 SY+4J85/twePV4OJT4rY5lR9ggqNvHOfvHI+VX6zJi2zLPkJqf/VcXADHAnbldwMMg
 dzlBV+0C3VIwheaP6LsYkATL8lX2HdB+szvdXOINsEVjvqwW3nPnStnH+5fyKAXUwA
 VER8OCIBhagsX0Bbrx6clcXMY3nrL4BRdXZI7uhgRbgcLpsHAh7C/xgnXRxec8oalK
 mmSj6tMXmgGYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WlZFVYF/
Subject: [Buildroot] [PATCH v2 2/4] package/freeswitch: fix build with
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
 package/freeswitch/0004-ffmpeg8.patch | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/freeswitch/0004-ffmpeg8.patch

diff --git a/package/freeswitch/0004-ffmpeg8.patch b/package/freeswitch/0004-ffmpeg8.patch
new file mode 100644
index 0000000000..486231e79c
--- /dev/null
+++ b/package/freeswitch/0004-ffmpeg8.patch
@@ -0,0 +1,52 @@
+From 0ce211af3a3ad0b1060b542d0a92a07dab5d2d59 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 23 Aug 2025 18:15:39 +0200
+Subject: [PATCH] [mod_av] Add support for FFmpeg 8.0
+
+remove deprecated FF_API_FF_PROFILE_LEVEL:
+https://github.com/FFmpeg/FFmpeg/commit/822432769868da325ba03774df1084aa78b9a5a0
+
+Upstream: https://github.com/signalwire/freeswitch/pull/2896
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mod/applications/mod_av/avcodec.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/mod/applications/mod_av/avcodec.c b/src/mod/applications/mod_av/avcodec.c
+index a9d449b562c..9962b821d53 100644
+--- a/src/mod/applications/mod_av/avcodec.c
++++ b/src/mod/applications/mod_av/avcodec.c
+@@ -530,7 +530,7 @@ static void init_profile(avcodec_profile_t *aprofile, const char *name)
+ 	aprofile->decoder_thread_count = avcodec_globals.dec_threads;
+ 
+ 	if (!strcasecmp(name, "H264")) {
+-		aprofile->ctx.profile = FF_PROFILE_H264_BASELINE;
++		aprofile->ctx.profile = AV_PROFILE_H264_BASELINE;
+ 		aprofile->ctx.level = 31;
+ #ifdef AV_CODEC_FLAG_PSNR
+ 		aprofile->ctx.flags |= AV_CODEC_FLAG_PSNR;
+@@ -2071,7 +2071,7 @@ static void parse_profile(avcodec_profile_t *aprofile, switch_xml_t profile)
+ 
+ 	ctx = &aprofile->ctx;
+ 
+-	ctx->profile = FF_PROFILE_H264_BASELINE;
++	ctx->profile = AV_PROFILE_H264_BASELINE;
+ 	ctx->level = 31;
+ 
+ 	for (param = switch_xml_child(profile, "param"); param; param = param->next) {
+@@ -2094,11 +2094,11 @@ static void parse_profile(avcodec_profile_t *aprofile, switch_xml_t profile)
+ 
+ 			if (ctx->profile == 0 && !strcasecmp(aprofile->name, "H264")) {
+ 				if (!strcasecmp(value, "baseline")) {
+-					ctx->profile = FF_PROFILE_H264_BASELINE;
++					ctx->profile = AV_PROFILE_H264_BASELINE;
+ 				} else if (!strcasecmp(value, "main")) {
+-					ctx->profile = FF_PROFILE_H264_MAIN;
++					ctx->profile = AV_PROFILE_H264_MAIN;
+ 				} else if (!strcasecmp(value, "high")) {
+-					ctx->profile = FF_PROFILE_H264_HIGH;
++					ctx->profile = AV_PROFILE_H264_HIGH;
+ 				}
+ 			}
+ 		} else if (!strcmp(name, "level")) {
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
