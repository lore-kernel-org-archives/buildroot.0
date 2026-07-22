Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CC4C4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 17:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C539660634;
	Wed, 22 Jul 2026 17:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDjp8bCf4Iqn; Wed, 22 Jul 2026 17:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D492560665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784742118;
	bh=1k6DBoj/veK4JLj1ntA7wrXTVWjBi6yvIAfZ7d1l5dI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h7JvLtTncAr3RHI7kcEueK7PvlwT2ePwLuKx4/6RCQLiGX13ctuKUKknqyMQ5rf2u
	 U2fH4/Vi6tzl166E/vH64jhtSNOgWRoCY0DOk/yFez1mNrK5sE+8kpS79JcbxQV21m
	 Y3VZAhmWnOdWP9F6+IqGnVrguye/7ERZZGN4eqmtI/ThKkmBCbW2g0I09YgrwLquzi
	 vmLH9o4w8+xmuzCLhR1zRvGoa9EOAF/633XZ72aDznl1w6iry4XrSUeSDwNIN1f723
	 GFeArYiRt5PP5s+6lPb7nPvrjAu6Rc8Q/eBLPDHSZgMJBpvzpeKvMK/EBXiDjLUiH6
	 nY4vnRD5szy7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D492560665;
	Wed, 22 Jul 2026 17:41:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8188A2E5
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6748980F18
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwP1PLM8olqZ for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 17:41:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D77980DD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D77980DD9
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D77980DD9
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:41:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-495635a85d2so27962275e9.0
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 10:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784742114; x=1785346914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RoMXIAEfjVY/96aN4OcZAWAfjuuJndLDfI55sHelvcM=;
 b=sgpF7ZR762KYwo4x6J0WlnvXczg5S0LQE7JpjQAtXenkYNJ/hzUMp7Ebd1LqY7w25w
 VL5TCyNzGf2ratDCGg1LABsAns+ZvBQA9p7m3s1ciC17H6gHWkOuk6k+9gcnSDXQJIJb
 NHH5w28iC1heInfT1KzRthHs9fnuR8szZYoDE5GLEwUjz7cvPKGPb7d3EdQDGAeANXAt
 H5Jfu8z+n3eILbOIBpO5lolMlChPW9ARe/P1hH8wC7KWkEl14He7jFOd9Sp+ZGI/+ZNP
 xl1pOE8w1lN5pId3U5j0ZWVgMcij7/yd7K/PcrrDXK2t23B0PRVkR5JwT34JdNipTuA4
 436g==
X-Gm-Message-State: AOJu0YzN6JnAN6ZNQ1rGpFRNk+1hP5gC2Gnnve2MrXP859bZQWf7gEsG
 iFNETGQLMXIwd1NOmnwSh8oY3hcsiMu+/CFectkuJAlOQK2GqpxQQQM9FjjfUHmk5WHL3RfcBG8
 sC8cQ
X-Gm-Gg: AR+sD12unZLcElJZips5auhMF9Zwf4eOt++klj2WbhbL4CP4KjRstRAiTHZPxAqlvM8
 R6ZfzBaSvqyaeKAdfxM1YOpwfWMC2YNNfW+Yt4fGwtHaGSLQrgYjDzg7Kb8DUwIF0QW6+xVHz4s
 I9JhoKXx9sjNXPRY/9Bgs5gyNXmhyHoCHPfoGZ4lLhEW7kusqseKjV7jF3PamPyGnyKNZbThv2f
 DQSg0oQfA54n6+viQAOjYb4w5Gi5LjinXpIQa9q9E4CihLDksrxyAG9dbhm/LSEQy0SmDDNawKw
 KKVmnwwRrsDjlmUe48FMGc4tNCYPbAAHFk1q231avmGmikRxvPTKqLprcEJdh8/RGusRq8K/Avx
 FXyY5BjDQidGPoMOqBz2Hrp6/KsaZDXmrTsgFgZt86PxmkE3ofO0yqEFvz3aecj2QB2lPIRhyuD
 S38Ph6VsK9RRZSrjBTx5dVM7S7covsYBv9/3Ca5Aw7VD23InvKnTD0WWevcsxNOS9BsNLcVSqto
 WXJTmpeLnBs0CAxxEnQp+vwSbA6D6qD2FfIQLgHCPGPfkevTRk9eOd9HwXdGRJ0uNaeIG5aYpIJ
X-Received: by 2002:a05:600c:1987:b0:495:52a5:8829 with SMTP id
 5b1f17b1804b1-49552a58960mr234873135e9.11.1784742113931; 
 Wed, 22 Jul 2026 10:41:53 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-495686a8600sm146269995e9.6.2026.07.22.10.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2026 10:41:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Wed, 22 Jul 2026 19:41:48 +0200
Message-ID: <20260722174148.3910808-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784742114; x=1785346914;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RoMXIAEfjVY/96aN4OcZAWAfjuuJndLDfI55sHelvcM=;
 b=rny+T+kIOa9/f4mFz9GQrnC1fO0uz2rqWwyjc5lTexwukY1J8g9YIZ8GGFvgVNz2VU
 cMbmsUKgJgv56Odc/1OshR5IqF8liNAYRhYw7jYBHJOIaqYcvTCpydnae4xXtSD1+m84
 RdMrT/cv4V928obgy4TozkqoAodjMs1GXM9yw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rny+T+kI
Subject: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump Linux
 to 6.12.96 and U-Boot to 2026.07
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
 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash | 2 +-
 board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash | 2 +-
 configs/imx8mn_bsh_smm_s2_defconfig                         | 4 ++--
 configs/imx8mn_bsh_smm_s2_pro_defconfig                     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
index f26f856a1a4b..e675afabcfe2 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c92591d896e79ecddbc3319136f0c2f855e832b397de7593f013ad7590a43e53  linux-6.12.80.tar.xz
+sha256  7d2e1b5d5ab36b3a01856e71782dad2a54e634fb2b37c0a42998def3bbf957c1  linux-6.12.96.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
index 36322a6a904c..ff6e4ed2e2f6 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 223acec01d8d..50a5eb2d9b9b 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.80"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index cccbe2e37057..6a4a662b923b 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.80"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,7 +29,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
