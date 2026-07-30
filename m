Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87695C5516D
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 20:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53D6560A6A;
	Thu, 30 Jul 2026 20:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPCnLcDMQ_gw; Thu, 30 Jul 2026 20:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 648E960A7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785441692;
	bh=5ujzTZuK4GQ9dpaORivuQJ+3lZ+fbpoyqTqnVvSuM1Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b5G1j7Rhp7S6TBDcU5Dy87ba4NeFENa5MokevfuaBpON/VyoTOie99FSAPKospFVk
	 B/j8xl70YFIuzO3CvKnxWdnWW0yYFBRU2lSrO4d3bxkSSHyyr0cY0J947p+ryGaAOM
	 gab32YynXlx4qA7/Wnzfh+gah69eOeqLfEPkZy6E7ngfigsqMTXYcoIJrsSo5K2NRh
	 jxaCb90yhE3z1XPiYy/JMv5ajOMKGIV+zoiXJheogNT9elHeDlMtP3bDvjoW2K4lWA
	 lN8swHsj29LPDFGEFbotwdmOEbsELkhBYZWIxzHby6dOK5c6dyDbvm6tWTjJoHpe/y
	 FjSc1b+FQT39g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 648E960A7F;
	Thu, 30 Jul 2026 20:01:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E1B669
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FCD060A6A
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LE_Q2wT-9vqv for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 20:01:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED33260A7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED33260A7F
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED33260A7F
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-47f9ab7ee38so64186f8f.2
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 13:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785441688; x=1786046488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gesk9ttJyDRFl/M9cQuZQ2ZQIvCD69ERh5DZ5bmZQeM=;
 b=DzPEKsdjBdp0vaEs4yfGUZQRza6Cn7+50gCuUZUu3ii7ZARnNUjer2MwD00ThLaN3L
 ZIdbq8qRfxrwVIifOuk8d5m/KxTAFQmFtzmJQsOYoxZJBsTAh82nc9DGud1cIkvWQTds
 iWuKO0OP2dXAv6izW5/i+pQTkFWs/d1jlDtzVFIT2cAWJzSbx05cowIdlbr7Q5YaWoif
 7/DqNVWRBoMpYb0fvGqkbsSuIDeRW6GCUIM39sRfWt/olmXTbcrFzWjuFiEyDWP4G5pv
 /KouEMA3t25pWjF/tQIheaRkxCGegsKZBCOOTe+K7zL1jYb4hNGLOA4+iNuncEf9+apN
 5xvA==
X-Gm-Message-State: AOJu0YydRa2DVcTs0cdVsM4V1V1LOC0qMgpklgrYHRtrP97UZnOj61FZ
 NeXliYbm56p5RkpYDJITuhINxcVphmcqHbYAJTIkcGaPHRGWqGaoJBdFysEKmdM98wmlwepMLaZ
 Qw0yI
X-Gm-Gg: AR+sD13IVTQH2GZTATVunKAHx+Q/TvTXEtBam5SwUDbRZQ0k2A/zYTxKNROY+Jov8F8
 u4Ysbva68g9McALjjNLmeOBSdsJOu0CCNe+C969Y8fGRZFmj94HyqregfE/NMVP0xTAjxcv9D7a
 uDugr6sa2lyNC+ZRjSwLM+iflDq8cZP6fF+rfZOBK3I2w0yJ0J8FukopBw6vIUPyqDYUX8OOD3l
 uNFfuRDH0cg75Yi1VckERdQlVFhPU6o3B2y2OQztKdNTfossTKSLeSVWZ9KDjWqjVG4Ubz33eic
 8NQ9E9dVuXu3natxjiMrgB4OVEg48ulb3r7s81OBTbcDcm6CqbiHfGPB+iz7nJ0Era0ncTJrnry
 UqWkfRQ8TCe/VAKMZ7Hp46BizvgAk18MyZX0IYqtZbZJln5YBuEqkW6/REbiMXViV+FLjYY52ph
 L56+znTW8az0hAij2dct0bt++OPtPZ7YRPyYXe+fDMG2Ssi/a34bXifFGDuPtAsIi2c8ufrcbD1
 sR5XJVOljl9/8RPopx9uqDQfP9GVZ478PwchWi1nuc08UCaMSF7WX1IAgrlNAQgbLm2EFCmhfBI
 7eYLl1K3nmO5/2Xgu50sNNm3gRiWZCMfoi5HQ8zPZuMBChOA8r4b3gLEn+zXhKq+
X-Received: by 2002:a05:6000:2384:b0:45e:e1a4:c4c3 with SMTP id
 ffacd0b85a97d-47fc81f53c6mr6186716f8f.15.1785441687940; 
 Thu, 30 Jul 2026 13:01:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc892cc3asm9639387f8f.23.2026.07.30.13.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 13:01:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Julien Olivain <ju.o@free.fr>, linux-amarula@amarulasolutions.com
Date: Thu, 30 Jul 2026 22:01:18 +0200
Message-ID: <20260730200118.3547779-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730200118.3547779-1-dario.binacchi@amarulasolutions.com>
References: <20260730200118.3547779-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785441688; x=1786046488;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gesk9ttJyDRFl/M9cQuZQ2ZQIvCD69ERh5DZ5bmZQeM=;
 b=pW+cjX1/LLbBHMZoSVDWmYzxQvrTRu7GD77La84y55TxzrW+6MGx8wO4UIRFU0OYYh
 s+sxzqSaQZ/44bL9XD9qx2bs0TdJDFEY04cc6z1tO6gMA/of644PVriuPOasM5o95ck7
 Vbd3lOmITSgI33Ku5m4vLeDp440P8WgqxEq00=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=pW+cjX1/
Subject: [Buildroot] [PATCH 3/3] package/armadillo: bump to version 15.4.2
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index c4425ed26201..4fdff326cbbb 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  12781baf33c71b622c2f040fd27143479d120ec89d40f889621f0b1bb6232e27  armadillo-15.4.1.tar.xz
+sha256  58fa258d0e1f93074c9afa792027fc259b85cb974ccc0b932b061d4ada5bd83a  armadillo-15.4.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 15dd721680e7..15704952d3a1 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.4.1
+ARMADILLO_VERSION = 15.4.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
