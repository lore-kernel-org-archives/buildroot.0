Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F432C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 12:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D5D2813A5;
	Wed, 10 Aug 2022 12:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D5D2813A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OrDvCEAF50q6; Wed, 10 Aug 2022 12:28:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 522BC81321;
	Wed, 10 Aug 2022 12:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 522BC81321
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0222C1BF312
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D99634035D
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99634035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofJM1WbFbsJG for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 12:28:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC54040264
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC54040264
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 12:28:35 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b96so18944078edf.0
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 05:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=19RS+5MLz2/0ZL0vjoPBjUvvllAkaVCloV7zLjYFGXg=;
 b=77waEBEVV3y/WDPGK1MUsrqYunqQ+IHLwQOcBuUWsqjas8EE4hCnUYGEwwQnsybCjx
 8N8bS0cC9uolkgd82enafVgV/Wu/dN4OaSJ3ty+7OL4x0Wyjq3qvMvYc8gNQ9uFU6xru
 qU2GNfPlggSXjyfJNnnDgBRF5bzAUy5Tn5xTErr420LxbOx22FjOmOxLuH5544lsOH7U
 kkdCWZboLYEnyHnK4DvmEgPvP428HSAgY4gUmy0wzEUPIbnJ2/qjvzX/pqliAnTuu0c+
 zVcnFfbWk5DPd0VzgfqbdVC2B4WeWn5W/7jxpGksxTR129Favg5VaOKoemnVeGLN53L3
 beUg==
X-Gm-Message-State: ACgBeo0uDp7xPm9K1QIzU5YTjw/KQDRwuISEI7WoNdtid3R99e+9pe6u
 kTiJF2RwUUSMXCjLCmxgxcjgUmq+CYC2mErj
X-Google-Smtp-Source: AA6agR5ZIFTmS9fCTbXNPlQM34CCT5xmk/tZ+cgU6pnwH/SxPf1B8AxF+9159QBmHif1HjOoW0t7xQ==
X-Received: by 2002:a05:6402:35d6:b0:43d:c3b0:1206 with SMTP id
 z22-20020a05640235d600b0043dc3b01206mr26253644edc.415.1660134513414; 
 Wed, 10 Aug 2022 05:28:33 -0700 (PDT)
Received: from nitrogen.local ([81.82.247.96])
 by smtp.gmail.com with ESMTPSA id
 k5-20020aa7d8c5000000b0043cc7a3ff7fsm7611828eds.33.2022.08.10.05.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:28:32 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 14:27:40 +0200
Message-Id: <20220810122741.3661557-1-bram.vlerick@openpixelsystems.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=19RS+5MLz2/0ZL0vjoPBjUvvllAkaVCloV7zLjYFGXg=;
 b=JMxCINN77ZW3kpFjGqP0YWpnQfw9tUJqSvnv/ksjO9/pUZ3eG5mFEqIYAUAgAoz5y7
 gbV08xWqfjSoKqNKelKyD4zil6s7CYoN2dZeDdhKZanjBdGFQsTndfJiiylxqj43/iTU
 zQC8aK5+opTk8Y0a6a31wzb0hXmMkk43f2Hu8g7ZvGpR2SaKZIfrUbTb8RK7ajgf837+
 LiFVUtbJ2hNysb8Ik+uTaFcxE+G6dV20nd2Ulbl2GgRUTFxDQJ128v+WEpRblbmYFCvO
 CwMsymgdzcm8WHZfxSkJd5vntM7B577Z9LLE0rAbuRr56YAlhHHYGaWHYlAfIWlwQBeD
 YH3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems-org.20210112.gappssmtp.com
 header.i=@openpixelsystems-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=JMxCINN7
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-imx: bump
 version to 8.14
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

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index 98a0e73048..b6bcbb8b84 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  6b6747bf36ecc53e385234afdce01f69c5775adf0d6685c885281ca6e4e322ef  firmware-imx-8.12.bin
+sha256  bfe9c57857e8442e7eb26ba3e1020733b09a7c9b83952ad4822980546c58a7f4  firmware-imx-8.14.bin
 sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
 sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 211a43c4ca..3619c6b794 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.12
+FIRMWARE_IMX_VERSION = 8.14
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
