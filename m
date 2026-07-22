Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB83C4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 17:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6FAF4080A;
	Wed, 22 Jul 2026 17:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8d3w1XLm5sYd; Wed, 22 Jul 2026 17:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D1F407EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784742036;
	bh=nnFEFRDD1YdHG9mtEFkR2rvYA7/WqTf+dqZl20btGsc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EGE3AFsclEed6A3sjFH9KCGwl5cpFuzAFzgAgyoQsyna6j55/+7BmmZ4sBWBcP2jW
	 Vd5A6BQHIdA177IDFsIO3urLhWaNtIM2ym7t6VS5aRBzsvP6oyw/JuNouN7KlN6Hps
	 Q4GjMLDiWz2OUSEpEtEvlAs/IbOhJF7zN+ovEqTb7TKjYG8MdadkrFbuUZcwR0l1ie
	 bQA0QRIzoUT3Xcj5O4BDiDMXbWNUXgseliEUyb3/aRkzLe2cCs3OwSlP3NZZ7S5d+O
	 BrX3I3/u/2iJqJw2827PvVTyzN9gKgdJMmbob60YCMG/37QYoaFvd9HJmLrPwHlX1M
	 DKYDGxOu5yA2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4D1F407EA;
	Wed, 22 Jul 2026 17:40:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D32F313
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53A32407EA
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-A5bfo7CbNb for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 17:40:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D8E840746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D8E840746
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D8E840746
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:40:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so69149865e9.2
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 10:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784742032; x=1785346832;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hx8qhuzHxNrK2mGnmowkeIk+DHLMlHYprYEe/nhe3aI=;
 b=VJIApxxvgu5qZrfzvYhRGFClqBazqFCf9He2v8V93wYHQUpNFffywDk59rTEUWb7s9
 tIDSqxCHh5O6suBIvbzDFwDm8isJB7K3lEtZGRMl58n612SbVGzaNbUY6ajff5PqP+Tw
 zVfzSnzyUESZ1LPxk/JZi6DiqyyvV5uxmQsJ0DhftGdrPhAckY/nelIWpMCKwShCjQXX
 ByDk1HgSC2hSVCCvuRyiRTxzVRD+3h81+mJ3uRoSV+K3hp4XVSptVRvxFSByMoVKWctx
 XR43Kxg3PdYM0zV3NxEBc4zguXnHmgfxHLE0iCM0IYMS4v1GEU11dHQv2xDsF5U/MJ1Q
 kvGw==
X-Gm-Message-State: AOJu0YwTA7eL8TdFbYSihRPzbky2R722V/AKrKZq53KjmlrS4o6gUUv+
 uZmTX3P4CyIkb8Z3rkx7BbKLZGLz2oDn1FJb/kKeL7s+GYy4OTTSjABZOMnlkyk3RqESZFOOT5m
 xlsKD
X-Gm-Gg: AR+sD10S1mHFv8Uzv8uhuJryOlzMqFy2of9WVUwZqhwgqGP30rKC5sxn9PUNvAjKR0l
 MU5Tp7DQfpeWeQI63IMI4h9WCM+U/hq2shs+GXAK+jADLklokenGaY5dkQq2vH1EDpRWvcglXcf
 afxZD8ykjeeIRdsQhphSZ7RIcLeDnPw3ESNtjGGcelAttNbLoafXjd2nENUckxZmct1NSQYVTrA
 f19s0t460MtLTMVVEwGhNi7hZ4xLb7a/bmLlulCiyjU2LGVnhYjSQksuIYMypI0ENvb9t/cbrCy
 ow5M0NFKjDOdXhs2Rfin29iWGllek8VyZKkbkHW5EG+86wmnJJREnJ/WiYHLRFAMhv2F5R4wp4W
 yxXP46PCD96fRkhbs8drSSeDqIeCp2E5OwjlJgLI7wUNJOPZH79g6eF5Ynamoh6f2HKu2uQotXK
 Xi7977iml9iu9zXJZm9cGRs+HfP9QOlflI/K2KPiFhMj+oIVd8lJuo9IBVPym6jSw7aP30o2AtR
 nUNwPRxgOmbbrn38CPCXEakPcSJcuB3FojnmFFma4dnse3mE/17PrYncbXcxdm7ADUvNu6/H/kI
X-Received: by 2002:a05:600c:474e:b0:493:915b:dc4a with SMTP id
 5b1f17b1804b1-4954a3d005amr315600555e9.8.1784742031671; 
 Wed, 22 Jul 2026 10:40:31 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956a63fa41sm96450875e9.14.2026.07.22.10.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2026 10:40:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Wed, 22 Jul 2026 19:40:28 +0200
Message-ID: <20260722174028.3910046-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784742032; x=1785346832;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hx8qhuzHxNrK2mGnmowkeIk+DHLMlHYprYEe/nhe3aI=;
 b=IreaHYbkmIUylYIlkayLM8ixfcSER+2OllAHhHCEKaeIf4RWA+A/1+HPF5HT7Woxwd
 jgDYVBZxBkEPEm/6PxM5+cCabNYGosWs0LrF5Yxt1Kcoi2M3nvv8U0PfLW/v4F4dW1Xu
 U1hXrTtbvBDj9mY2miA9p8EBZT9bK77thp4/8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=IreaHYbk
Subject: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux to
 6.12.96 and U-Boot to 2026.07
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

The patch bumps the Linux kernel to version 6.12.96 and U-Boot to
version 2026.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 2 +-
 board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
 configs/imx6ulz_bsh_smm_m2_defconfig                  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index e2073c2796cc..5adce2bab48a 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c92591d896e79ecddbc3319136f0c2f855e832b397de7593f013ad7590a43e53  linux-6.12.80.tar.xz
+sha256  7d2e1b5d5ab36b3a01856e71782dad2a54e634fb2b37c0a42998def3bbf957c1  linux-6.12.96.tar.xz
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
index 36322a6a904c..ff6e4ed2e2f6 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index a3d0259a36d2..23c23cd758d1 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.80"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
