Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60E2EEE254
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 19:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D9304048D;
	Thu,  1 Jan 2026 19:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlXfQJg0bS8q; Thu,  1 Jan 2026 19:05:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A939B404C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767294340;
	bh=eQxBObuU56wIxztUVUNmApJOnd87gbakDKLqV6gPUeE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r4uVKLtERGYiUscqi/FWCAoW0a2WuTi3ypvmtCn6uKFpGQC9mSYo1EE6nmrtts47n
	 3Yc7XH7s1M+OvBY4S+2OaG7jjxk+rTfPufxLi5D/OZhoQIhtl3Z+TDe5CSVo5wAxXX
	 JRsaRJpytwqrsDelbPxANYftKsr/SMf/dQcK/pnM8gzt04kZ2Fp7hGmp1RXREfkYPw
	 kz+SzUnxU4EUm8tQ2wO66t5GOaSKWSKEry4nEeMqVeqyTUQfXjHM9gW9zUPxohc0uQ
	 IlV4qwB3QJm1S59cXn7FZoHy6eZBo48UMnYUUnrlGWrdrJ4nC+E5ZdJhyERY7zjqOR
	 8z0sj/f/iQmdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A939B404C3;
	Thu,  1 Jan 2026 19:05:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3312E19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23A034029B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eq8TUJ4r0JKI for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 19:05:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C2E94008B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C2E94008B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C2E94008B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:05:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06542A4C2EEA;
 Thu,  1 Jan 2026 20:05:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33848)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbNyx-000000003yY-1XBp;
 Thu, 01 Jan 2026 19:05:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Jan 2026 20:05:08 +0100
Message-ID: <20260101190511.1604441-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101190511.1604441-1-bernd@kuhls.net>
References: <20260101190511.1604441-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767294312;
 bh=6JbYDpisrctD8RXm0MnjEPB89CHYFnPLobNqbifeqLg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kQFBtu79aJbgvLFxcQPrr8EKMbXSaGOufeNm4/Q+WQFFmXFWKv+g+b0hiL7I0vX1u
 3fqaIGbo+kE6x4ESWd9qTGfpY6E5zhJ423kQFFRMD4UrwTnF9a6a+nJom612IfmKxh
 ctxxFCLH4fsdCf2q/+72Exp/kJooQeUUxngnypSAjnyMMGoR4e6/PC7U6Go523Ru99
 ZcSvuo7VIMrHL4HQBstsn6pQAWyzc/hF7jz8HHr5fZvQz7e/0+dH4bThg22jaGc6Id
 3Es552IS6yRN3ibEer+VwzlOjcyOkRNoaOneVmA4xWTK1b5+nsGv28q7VgmIO4HkIT
 PexdlkPh1aUDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=kQFBtu79
Subject: [Buildroot] [PATCH 2/5] package/freeswitch: fix build with ffmpeg
 8.0
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
