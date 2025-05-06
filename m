Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41FFC3ABB6
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 00:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77063605AA;
	Tue,  6 May 2025 00:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPR2bHERCJ0t; Tue,  6 May 2025 00:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7F9B605C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7F9B605C4;
	Tue,  6 May 2025 00:07:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48D0112E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 00:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A2BB40141
 for <buildroot@buildroot.org>; Tue,  6 May 2025 00:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2d0l-ppbA0Rw for <buildroot@buildroot.org>;
 Tue,  6 May 2025 00:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A662B400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A662B400C7
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A662B400C7
 for <buildroot@buildroot.org>; Tue,  6 May 2025 00:07:26 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b03bc416962so3473420a12.0
 for <buildroot@buildroot.org>; Mon, 05 May 2025 17:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746490045; x=1747094845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EK2j+jELxIcT09jygVI1Sw3F+HIayuMtXWr7lioLETw=;
 b=HoYuAbYmL4gqyCIGxtJV0oyZuFe4NDyPrKydBCK++IYiP80Ja39eiaC+z9o1GY2shC
 ItI4d6YureqAEhJ58rJGjwV1nY5v83COioIPoZ2tj5bElW0vC47RqySqSnNbukxERWQe
 jji3tTAJlS+zHrX4FC1FZjjmI9veJ2uF9MM0gIMvVP3LLAual+AIFbjtw+JL1T9y50xZ
 JNVM7ezy45fOG/rbWc9dI773++rz7hTZD8FowSM2K1uSZU3hVFMEAZ8jsr8OfNu4Cx4A
 9CccBLO+swjn/AsD9Si4+2pYF54qZYqwEuZDdkyJKVcrL6jLVMvKXb/EpQp1QEJUcXOB
 drsA==
X-Gm-Message-State: AOJu0YwvnARndMiiRalY8u9y435DoQq+jsyD1S8XDoG0/ns43uVnH0UE
 Cnx/hi8hBuTPOPcaJBYOf+DPdwkr24d1szw7ubKxixzMogAVtm/irOdXSg==
X-Gm-Gg: ASbGncsIbNCbHua43ephuFCOeAB8Db5NHnAwL1CGB5MD6CrylxHpYYFFHTMoHlujD7g
 GgqAMayTnK3vInkc9W+SyIFBOcPQPQPsbr17/L45vvUbcd7KLdq9326QXMm8iGK1kqTCx9+0V3u
 RjqBrH0FJ/GiS3ZU5kw9Ykdd72HutR01o6GINZAIbzr9VB0lGmKcixo8V0rf6QBTwfZZZRHDQD6
 LVPwrormam1T3cBPlH9hicgbq1dEZTYlYedbpGmdjeIrE2lkXGni3wqjKkhP4Sjpc9CpsVRNFhO
 oBKLVFmvEVkJA+SiFaas078HOENPn1IxetPAiTSyvArPzT1QImlj+zg=
X-Google-Smtp-Source: AGHT+IEc3UOiZtUSdGTbpW5p27m9N8vcRayvar0fPvk7t8ntbGe2FxJMQ5Y/NcHzsSxzLsH7fxSFRg==
X-Received: by 2002:a17:90b:540b:b0:2ee:9b09:7d3d with SMTP id
 98e67ed59e1d1-30a619b11afmr12793052a91.19.1746490044711; 
 Mon, 05 May 2025 17:07:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:df30:9eb3:e38e:2117])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4745f92csm9724152a91.6.2025.05.05.17.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 17:07:24 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Mon,  5 May 2025 21:07:15 -0300
Message-Id: <20250506000715.143252-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746490045; x=1747094845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EK2j+jELxIcT09jygVI1Sw3F+HIayuMtXWr7lioLETw=;
 b=Tq5YbSI/sYEuQPWasS7aTy1u4LH9JHv7kDEvw5UCAO800coLQIZb3/U53eDemMrwel
 w3bEUVo8QLNGGpXrzrsabRK2YALYP+iNiY2pvAxd3Zoh06dvsjF7213en5yzN1D/zxXB
 AMJ6Pl0XznvQWktGQZfeKO/OL07uwqb82yYb0rwRaXoGxQj1Du5UdrzCLadVAIXUe5mq
 Ep1RxxucQoM216ZDI4tD+RMGZm3CVYKPwJtau+EIxTIawFCHPBH2RBljNdAaMMqlUIgN
 9VoNQ5w9+S4IYjvZqmqRtH9EyMLb1zpLRP1C3ukAE/YY/egmCavu8XFlczS1QEmQWtaH
 52+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tq5YbSI/
Subject: [Buildroot] [PATCH] configs/imx28evk: Rename the defconfig
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

The i.MX defconfig files follow the following name pattern:

- freescale_<board_name>_defconfig when it uses software components,
such as kernel and U-Boot from NXP.
- <SoC_name><board_name>_defconfig when it uses software components,
such as kernel and U-Boot from upsream.

This imx28evk target uses U-Boot and kernel from upstream, so rename it to
imx28evk_defconfig for consistency.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .checkpackageignore                                          | 2 +-
 board/freescale/imx28evk/readme.txt                          | 2 +-
 configs/{freescale_imx28evk_defconfig => imx28evk_defconfig} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename configs/{freescale_imx28evk_defconfig => imx28evk_defconfig} (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 997ed1b89629..7bfc457c90de 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -139,7 +139,7 @@ configs/engicam_imx6qdl_icore_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx28evk_defconfig lib_defconfig.ForceCheckHash
+configs/imx28evk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx28evk/readme.txt b/board/freescale/imx28evk/readme.txt
index 3b77634fe114..5520ff1f0523 100644
--- a/board/freescale/imx28evk/readme.txt
+++ b/board/freescale/imx28evk/readme.txt
@@ -12,7 +12,7 @@ Build
 
 First, configure Buildroot for your i.MX28 EVK board:
 
-  make freescale_imx28evk_defconfig
+  make imx28evk_defconfig
 
 Build all components:
 
diff --git a/configs/freescale_imx28evk_defconfig b/configs/imx28evk_defconfig
similarity index 100%
rename from configs/freescale_imx28evk_defconfig
rename to configs/imx28evk_defconfig
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
