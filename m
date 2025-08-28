Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FCBCA0FF9
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 17:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 579B483D83;
	Thu, 28 Aug 2025 17:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLcQA7bNsedi; Thu, 28 Aug 2025 17:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B4DC83C81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B4DC83C81;
	Thu, 28 Aug 2025 17:42:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76A966C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 17:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7419340A19
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 17:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srbMhMttPdoI for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 17:42:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A55C4409C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A55C4409C5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A55C4409C5
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 17:42:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0F3ECC8F457;
 Thu, 28 Aug 2025 17:41:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A29460303;
 Thu, 28 Aug 2025 17:42:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A71771C22C4CE; 
 Thu, 28 Aug 2025 19:42:05 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Thu, 28 Aug 2025 19:41:52 +0200
Message-ID: <20250828174155.249940-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828174155.249940-1-thomas.petazzoni@bootlin.com>
References: <20250828174155.249940-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756402926; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=TLm6/irSb9RtCwvbkTFW8YvL6oQ8PtNT3UvBz834Tes=;
 b=al3/+xnldk7uU8x900wIOU8gRyKsNVFSKhSgLMThTEgBzH9poTm3FKkD0DMjBeLu2zQaSu
 LNA8dODbp29Q6O1AL9G39ovNDMhUoEgQzh4xDrDTFxr3hVRt4wB6j2ftVM5Wh4WVfsRqIv
 bKiq+qSejO+A0DCu4ic/96mK5GAve4ClayG8QPh4wxTM4aRw2V5M03CcGPXpRr88dkJ4kr
 CMqFRUadgbDDvugQDMP2Vml6G7jE65HifERg5Nq58CoYMlcyJ45EIIkvU78fuxGFiyuBtw
 PIFG7dK2ARB8mod6q8vtMXXGvOvzEJRqW20JmmC7rm48SeW905+mR3A+Qzx5Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=al3/+xnl
Subject: [Buildroot] [PATCH 3/3] package/ffmpeg: add optional support for
 libsoxr
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that libsoxr no longer depends on ffmpeg, we can actually use
libsoxr in ffmpeg.

See:

  https://trac.ffmpeg.org/wiki/FFmpeg%20and%20the%20SoX%20Resampler

for some details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 9ba7ac0f61..5f9cbc138d 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -378,6 +378,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libopenmpt
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSOXR),y)
+FFMPEG_CONF_OPTS += --enable-libsoxr
+FFMPEG_DEPENDENCIES += libsoxr
+else
+FFMPEG_CONF_OPTS += --disable-libsoxr
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX),y)
 FFMPEG_CONF_OPTS += --enable-libspeex
 FFMPEG_DEPENDENCIES += speex
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
