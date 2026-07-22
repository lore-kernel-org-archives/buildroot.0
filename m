Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5089AC531BC
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 15:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F124607E3;
	Wed, 22 Jul 2026 15:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPZ8ho8_6nUY; Wed, 22 Jul 2026 15:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB7BF607DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784734379;
	bh=A02vFwoEhDmIo51abhJbn/2yPkShZjT3pYL9fNnVlMo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H+G8zmHp4ubs91PHgPNzj/MOfeQ8PZpJ7AWhe3uPgGihfPdUmAKMnj/wTWfiWgtIm
	 XBrGzHA7q7mD5TsC++ksmnx9JoVkLhjM/P4OYmNuW8YY8aRXsKnOTsUPBUg3R2PxFL
	 yQMGaRvqjt0YVXtOfpBnICd0BnBN+359ki94P7GAYBiga83c/rKP4UhSSjVbq//Jax
	 tYgsQ8wloY/QZKnI2qI/+29vLFa0pvEOaMjs96P+N58vCPtUiaD3dzYL/nfL0g+50g
	 sxAhmMHpiqq3k5KZZbYjtWM5EPxPTR0/m6S50GlU+Yd7WgMCn0ycU+w/L4Mnx8KmlW
	 Sat9wtIPpkwBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB7BF607DC;
	Wed, 22 Jul 2026 15:32:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7812788
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D957A80F2F
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbfI2zgH1UR3 for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 15:32:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F46780F2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F46780F2D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F46780F2D
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2aD-1xEiTj1WD9-00eLII; Wed, 22
 Jul 2026 17:32:52 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Romain Naour <romain.naour@gmail.com>,
 "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 22 Jul 2026 17:32:20 +0200
Message-ID: <20260722153224.624762-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722153224.624762-1-fiona.klute@gmx.de>
References: <20260722153224.624762-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+Ysv2r7qUS759pRjQTEDS7amaAfaV23LModUNCrwbFbaI++IAlV
 JO7G28ze8n9h+YYyLZqVvUoz8LAdmbXCMXvlIsPe7ABI1TIX9QLEvHIZxgDheIQlWFCt2X2
 E0F+3Dw0s0A+ZBfGl0Lkwb2XJtm1Cn4K8rfIrK5XYs3Zkir64uQV4Lgr85PsiHadDfdAZVV
 lF0imSfR5qL1DXS3f60Uw==
UI-OutboundReport: notjunk:1;M01:P0:OQtlFGNfB/s=;fOektwvBCBoAwpSXfaKRh8G9Cry
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784734372; x=1785339172; i=fiona.klute@gmx.de;
 bh=iyzQlMftA67aDAWUpw338Vj9HYV9IzHKZYVRnEiGb9c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DonYoLuOV40ZYZzF5K5A76LTaqVD2slB8uuxN4Tobt5xKr62C1A9BKOcOp7coDag
 x1RWoWiiuRbxGgZwpEqlnCl93+Lw1MbXoZMyRhKSx5/Ww0u7ySzfnNUxkDdnObjQs
 0ES/fDzdAQ/7df6HnmxZL5sKgJzxZD2VfoYv5vj5tH4PsKf6WZBpsD8aj/aUtU3FE
 EBBQ+AGTpMAlNNEsHds3h8QaPm7Tq5j2PWzH+00N/JV4D03FrvU8yKd7/xJ4PjeMO
 nnuZjBVjzn0994De9yj1gtA2ajhN2S3bwKfoyoeL6ZK6nMZu5W3doXe/A0Aa9vZRC
 LHd6twcaynCHlMMuUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=DonYoLuO
Subject: [Buildroot] [PATCH 3/7] package/ifupdown-scripts: add license info
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 5ef032142c..d7d5244ffc 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+IFUPDOWN_SCRIPTS_LICENSE = GPL-2.0-or-later
+
 define IFUPDOWN_SCRIPTS_PREAMBLE
 	echo "# interface file auto-generated by buildroot" \
 		> $(TARGET_DIR)/etc/network/interfaces
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
