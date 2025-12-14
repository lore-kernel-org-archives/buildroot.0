Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F33D5B16D
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 15:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18799605F0;
	Sun, 14 Dec 2025 15:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNSCqtTmz6eY; Sun, 14 Dec 2025 15:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C1746066D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765726644;
	bh=iQxO3RYwleleOh2eEIh+UFtB3BJcYtMGtdbijTOEbsQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=mAmklZycLr00b9ZuPCg8QOFm9WCd+v9kSU1DP4yyrtw2nfv83WZxTqEBX4V+krWvx
	 KqldubJssObTFZCc23o4K1YIi6fETHDP032Rl4mZmjCShgbZiGH0PIBuEClmKeNfFN
	 jVle3L3bhN2L77+r8WKOmsxwlvxeE8wswcLKfAy0QQfv2uS7a/ac6wgTWkmISfw/va
	 Je2y5VrE1JvCNXVvDPKROuI/GCV82mK/aoKaOInLN0CKK5gSJDPQ9H9wcgZ+XuoJWO
	 SzduIKIvXlr2mf9Azs7pNlG/ddM4cGzA+sqcmsFqaNJOs8+q2izi4NwWSQAEz3omlu
	 5ZJWET94Q3pwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C1746066D;
	Sun, 14 Dec 2025 15:37:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F56E117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 15:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75B83810E9
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 15:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dz2523QEcsqy for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 15:37:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5670C810DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5670C810DF
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5670C810DF
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 15:37:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D3045C1357A;
 Sun, 14 Dec 2025 15:36:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 040AD60713;
 Sun, 14 Dec 2025 15:37:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC9A511940C9C; Sun, 14 Dec 2025 16:37:13 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 16:37:08 +0100
Message-ID: <20251214153711.766150-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765726634; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=/hZf0OLI6RlM61Mf78rE7MpmZTQLLXVFiWy5rHYvTVU=;
 b=ficvKsonhBhEkpsM1yifasiWu2GL6clu3s1KJmV/fT1Ci1n6+6hgsQXKudrWiIS6LbD6de
 9dOMqcESnRD//OBp0Yt8DT4ej/N5t1NAIdNTv95jB+E/sSuq5OtVIULBhUNYMyMPzdu1hL
 SxGh48IpQSthg0zpLmYies6iPWB4fhryOqLaagu43OPYbCJcEnpAlAVhstISPtxLY3lP0/
 Bw4/LXyj0Orqzp1VfSc69MJ6keLh4vf8yOwy9z1Vas/F6KnVRZhQBJK2u89DdKwKky3DHl
 eyRp9s5Yd1sMH7EUqOZsCWY+3yGBbW3CdlYeChb/GWQHgubF5ZqS/nr/mQ3k4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ficvKson
Subject: [Buildroot] [PATCH 1/2] package/python3: make SuperH tweak actually
 effective
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit a68899d49ec4c7f97dea0dcb9995e6a5d7b282c9 ("package/python3:
work around GCC bug 121567"), we introduced a work around for a gcc
bug, by reducing to -O1 the optimization level on SuperH.

However, it turns out that this is not sufficient, as the build will
only succeeded at -O0.

Fixes:

  https://autobuild.buildroot.net/results/31f/31f34a983036b4135c12e5797b5c2258ab33e6c2/

Which is a config with BR2_OPTIMIZE_2=y, which means
BR2_TOOLCHAIN_HAS_GCC_BUG_121567=y, and therefore -O1 is passed, but
still the build fails. At -O0 the build doesn't fail.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/python3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0189a505b4..4e660ecee2 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -192,7 +192,7 @@ endif
 PYTHON3_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_121567),y)
-PYTHON3_CFLAGS += -O1
+PYTHON3_CFLAGS += -O0
 endif
 
 PYTHON3_CONF_ENV += \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
