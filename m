Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1800E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 07:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 539DE812EA;
	Thu, 19 Dec 2024 07:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NAj5oOsbcwg; Thu, 19 Dec 2024 07:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 622968130B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 622968130B;
	Thu, 19 Dec 2024 07:58:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3534CE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 07:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7097C8130B
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 07:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6EH7eDLUIcz for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 07:58:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58BDC812EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58BDC812EA
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58BDC812EA
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 07:58:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aab6fa3e20eso77188566b.2
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 23:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734595086; x=1735199886;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KeCpJe6jUfabe+eXlRoAp+o0mUTwQxaq5419fAWJfq8=;
 b=MivkNCmTX8gyOuPlQst3drm3sk50FCCvKGlF8xo6JOIeaBLldyKJsiOdT1W8nwxbIp
 VWGB8torj3lHJ4eiNq4GTfoyIqGpBhl1zImTIppSEgTBBJQe/bkBT/G7o+L4hdikzRek
 g+UzArqICxF1qhbgfCBo9njAKRWApPVPkRurS7Zgqpfh5hLiqR+7fp1pwsjWjA9WJ5ew
 Q8UqwPGatZ8ifmi0rVlmRitmJqUGBp6+fhEjoqw3sm/gjFEEEXj3vwAVnDUEujqUDOhj
 LcMxnTFv8pMvPrpab5ptYA8rkidQNb+t8FTS8wd5R/l4IzSHOR3PnyQlz2syiY0UfT7X
 sfkA==
X-Gm-Message-State: AOJu0Yw7YoYoFVfi0FjJysaPY+vuSbycXZb2D8B35UHVDcfs1NlbT7wN
 krW/LkJDycd3tGdiFkdYjGo8BMtPyil+KDACyiW1v8W4j/2KNjLMjf5k8zsukNFoTBxQpPJU7Hl
 d
X-Gm-Gg: ASbGncvjwQ8MJvmeC5wzRuAXAMpMiJ8NrOtuWv9s3PvUj+1jxgy8WDHoJDlTDaHrP8k
 XbYZE9deSAi6BYbjxeZvX6YLDHZGpjykb1mkNb8UQK/N4baS3l6mlmmNTzc/46dN4qByKgigpza
 hjo7lwOt73osyxrvnIbXiR4+3tlzB6rOjhOeNIlsmmHDIvK25bgpxhMdCrfNNFMcaBhk0kuN1XK
 FhymTkmbhQYYjEFpwaidiZEFtv1+mxT2pcMGeDMbySAh7GZl/g6B0MZ1NvrFOs11nND/qX0eqja
 0R5XnHIFHzLVlzHktR7H
X-Google-Smtp-Source: AGHT+IGdTgjVOHZiGXQRoP59rP4TiQnWshEHNM/r95Y0pD9xK4/Atd3lxOw4liTbPkjZgGb2afBhWg==
X-Received: by 2002:a17:907:774d:b0:aa6:7d82:5414 with SMTP id
 a640c23a62f3a-aabf478a749mr421699266b.30.1734595085949; 
 Wed, 18 Dec 2024 23:58:05 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.41.87])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe4b6bsm36981966b.93.2024.12.18.23.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:58:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 19 Dec 2024 08:58:02 +0100
Message-ID: <20241219075802.2445204-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1734595086; x=1735199886;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KeCpJe6jUfabe+eXlRoAp+o0mUTwQxaq5419fAWJfq8=;
 b=apt4L7Y8DQ0dEqjLsRn/elQkW76P2wPobdd5dHpk4qOgyRfrHVka2o7Oz8+2KmcHLI
 2E5eaMIaLmHl30VTNWxkgO1Qa33U8u1Vqz53VWikfwTBC6q7DlbEQYOrPvClh3WAWGP+
 8QwgkrPysbp3ybrieNQiF8IjcTAxgLsnJKjEE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=apt4L7Y8
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 14.2.2
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
index d94218d91d54..19446b589a5b 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  ebd6215eeb01ee412fed078c8a9f7f87d4e1f6187ebcdc1bc09f46095a4f4003  armadillo-14.0.3.tar.xz
+sha256  3054c8e63db3abdf1a5c8f9fdb7e6b4ad833f9bcfb58324c0ff86de0784c70e0  armadillo-14.2.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 0d2e85464f6a..1798cbf5ed13 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.0.3
+ARMADILLO_VERSION = 14.2.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
