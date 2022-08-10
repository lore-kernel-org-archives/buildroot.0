Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C253CC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 16:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D91A60FA7;
	Wed, 10 Aug 2022 16:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D91A60FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oiDbEb184akm; Wed, 10 Aug 2022 16:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 453406101F;
	Wed, 10 Aug 2022 16:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 453406101F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E22151BF479
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 16:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB7AB6101F
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 16:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB7AB6101F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nrvgwSvnNHQ for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 16:32:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1784060FA7
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1784060FA7
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 16:32:37 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id kb8so28694527ejc.4
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 09:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=JLVABcrMvCm0d13z+AhDTitXYKErCtvROIxkLXluf78=;
 b=ibM6Wl7ebe27FRHr0MYdbor7bBZIEa9GNaxjoxfrctFXTgtYcTmA1c3WImsAXZtj72
 lgBzFA8LICU2uz0Pkf871xoHLwGCOh5M8LOrljKCNfuIpKTzlClcKO1Mqx7MHQ5v3TKA
 b6o3pmCtMZ/bvTtBC6hpRbDFDCgMaMYKndfHOfmC49gKkCLpmzcAVBPnFCjL6sGBBHdH
 6lCY1CrHzSCHcLvQRONc/yPV/ofXaByI85EWCrT6ROtcRth2m0Mv+drnrjwFHLseGb4Q
 13pGGgi+5DoGgeRVwoV3f6kwfnr9UhUiAHiT1EK8Gc15662tU6pgvLUVGTnqaF66gDpw
 DChw==
X-Gm-Message-State: ACgBeo3BIUlJuVkiGEZecPDiz5DA5U1mIDSuA07T994HQx1Ha2EGBTM+
 PZQYn/7AO9JwCHdWB877nb4jMV2ZZUW0HN1W
X-Google-Smtp-Source: AA6agR4vR/LUSmZtN5UiV+n/GO84q0/HytxI7dQoSuh9toweVZpNopOwQclLrx6ywnT4/poyaRoorw==
X-Received: by 2002:a17:907:7ea0:b0:730:a4e8:27bc with SMTP id
 qb32-20020a1709077ea000b00730a4e827bcmr21410344ejc.166.1660149155483; 
 Wed, 10 Aug 2022 09:32:35 -0700 (PDT)
Received: from nitrogen.local (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 20-20020a170906311400b00730b942f6aasm2474591ejx.81.2022.08.10.09.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 09:32:34 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 18:32:11 +0200
Message-Id: <20220810163211.3694861-1-bram.vlerick@openpixelsystems.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220810122741.3661557-1-bram.vlerick@openpixelsystems.org>
References: <20220810122741.3661557-1-bram.vlerick@openpixelsystems.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=JLVABcrMvCm0d13z+AhDTitXYKErCtvROIxkLXluf78=;
 b=OXBzJuQKsSs7ppo9s+KiLZb8nqVBEPQTfrcxnFGNXsQDxuLvtbTE7QE3w4AOIJfRJq
 UfJWEGpoHiQS2pDh/ZlyJa+YeF/lOCImwfubG2O4VIYMbbeknOqTrqEvnMOVWD6RmmDQ
 A838FhZv4UJ7viDsCmXKgFYXZE84ybIEl9EFCNR73DhjO3MsyPIpXGNP2FklKS2vvvaK
 KAVfuDrMzEqQXJa1iKGLNr7X0Nor7vI0qWs19v44CnLw+9Q/BzdtFpyXPew4MrTrL2VW
 6azH/PjvvgGJE9ia/XKTQOWfOSppY4Vxgrr2OgqwNRdt1rRPkqgNk78uKGgsZ5IMHWm4
 OeTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems-org.20210112.gappssmtp.com
 header.i=@openpixelsystems-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=OXBzJuQK
Subject: [Buildroot] [PATCH v2 1/1] package/freescale-imx/firmware-imx: bump
 version to 8.15
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
Cc: Bram Vlerick <bram.vlerick@openpixelsystems.org>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

New version contains updated binaries which are part of the NXP
5.15.5-1.0.0 Yocto release.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index 98a0e73048..c86e4244ef 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  6b6747bf36ecc53e385234afdce01f69c5775adf0d6685c885281ca6e4e322ef  firmware-imx-8.12.bin
-sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
-sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
+sha256  937e196476b8e95b4b7f2501a14c8326d8a0649f8a3f9228b72373770a08deb3  firmware-imx-8.15.bin
+sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
+sha256  30f61825583b4c26d29a798ad7e4c8ef2f2f390b1e964af302d2dc40e93cb0a4  EULA
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 211a43c4ca..2d1818334a 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.12
+FIRMWARE_IMX_VERSION = 8.15
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
