Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A79C27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 542E560AA0;
	Tue, 11 Jun 2024 18:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yP4oCqxgvLT6; Tue, 11 Jun 2024 18:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C48360B32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C48360B32;
	Tue, 11 Jun 2024 18:01:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1943E1BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D090860896
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXlBRZleEoxV for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13B7B60875
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13B7B60875
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13B7B60875
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:47 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-70436ac8882so1307553b3a.2
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128847; x=1718733647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oY3nEIdZR5Dlonrl9mDEpcWEFwbPYI9sRXfVfPfTsa4=;
 b=htlIfQxM8BHuROoWE89mHSf0lUzxm1RYXxrYNeuF9FdlpmqrhwTxzxZRKQ/s9zVUTa
 +qmRqijZ5Sxq73lyxsPIXOa/J6/T3XxUOtwwUcf1VRTzb5yllyGmcmmwZGFtIU7/SplR
 kbEbRN8WhPZmwLuLa1vZzzJubgvhVfiwbQN2/pDAOca8U+5XqrpD7Cu9xEIQfc0Gh7tx
 B9qkhRHghP0KMMO0GYOW0JfMS+uCFjUwMbile6ahISriYF23nqk/P8KbCm1IKIJg3Cpu
 /5G6GhW3hTf7qtXeK7q7YvKpMM0Egw5W17KTU1aYEZIcPDKv7z3sqxAd7tKVftTZUIfD
 2vBg==
X-Gm-Message-State: AOJu0YzazXhIfnIZ91Rl+i/ppyTps3D+/zPX6A2EGP+CkhTCCzsX9vRr
 lGnpPHkBy8exq5+rXSsLy1S4viaWXyx4bE9wz42fPFDt3s57F8F4qqwQSAqW
X-Google-Smtp-Source: AGHT+IEy0M40ezr56nocp+hIESEqxx7BaRMDEMBGXtnkEHcqzUZoS+ow0Pgxvx+a+1RGVMfLvcQ6jA==
X-Received: by 2002:a05:6a20:3941:b0:1b6:dae0:5531 with SMTP id
 adf61e73a8af0-1b6dae05947mr6975858637.46.1718128846427; 
 Tue, 11 Jun 2024 11:00:46 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:46 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:00:01 -0700
Message-ID: <20240611180007.2127244-7-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128847; x=1718733647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oY3nEIdZR5Dlonrl9mDEpcWEFwbPYI9sRXfVfPfTsa4=;
 b=P/1li14cn+Lea+F3gC7sSZCCgLWowEJLHNwH41VD06Rw6u3kLfXzfTQNPwRZbLcgww
 qqqlqMM+bVNMqJaI7aBcIUlzR+D04Gb9+OWnSP/wr37yT7Pkwb0Hd8UPQXwXjzf+PFz8
 VEVZBqHSfHJOaQD0VrS2L9NJTsCzMMFjyj/jnlKMpjGStOLWIiU+zBTj6xT7oh5kPPrG
 ieF93ZDh3n//5IxqJBjj+AQe8/7jvYv3RWPBUA8efis2CqPPw1kebpR3n3en2hRpAbNJ
 XZdNV3Nwlopj4lUNIBAQFEc7dCWzECO2btz7Ul7Rt1dbjJ5M0XRQIU5J1Pk65WpXLxXp
 W8ig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P/1li14c
Subject: [Buildroot] [PATCH 06/12] package/freescale-imx/imx-vpu-hantro:
 bump to version 1.31.0
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- To match NXP 6.1.55-2.2.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v49.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash | 6 +++---
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
index 879b82f7bd..069700fc5f 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  2fc836e0ca9a5994c6237ee20b91ccc327fb2529a4ea057e4aedbce3326b6c97  imx-vpu-hantro-1.29.0.bin
-sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
-sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
+sha256  21fb3288f6f44631ebf6479284c5c081ff829a3068811eebbacc510f14300ab4  imx-vpu-hantro-1.31.0.bin
+sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
+sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
index 0987551c42..64df16e21b 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VERSION = 1.29.0
+IMX_VPU_HANTRO_VERSION = 1.31.0
 IMX_VPU_HANTRO_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_SOURCE = imx-vpu-hantro-$(IMX_VPU_HANTRO_VERSION).bin
 IMX_VPU_HANTRO_DEPENDENCIES = linux
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
