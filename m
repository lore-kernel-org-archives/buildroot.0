Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8F1C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 09:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D66E41723;
	Thu, 11 Jul 2024 09:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IW5Ym2jIEVZP; Thu, 11 Jul 2024 09:05:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E49E4172A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E49E4172A;
	Thu, 11 Jul 2024 09:05:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9FE1BF574
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF6494032A
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssVYG0xrMFI7 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 09:05:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6C60405C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6C60405C7
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6C60405C7
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 09:05:37 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a77bf336171so120720466b.1
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 02:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720688735; x=1721293535;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EIQn8G//3LCRFdLyVO9Jsh3anCCKd6sQoe0ML6jZIUU=;
 b=Cvlp/CHtWwF/U51llvk0c+1i2//tuhXin0h6dzgHnujZgzKrIfx/cEjHWW6SVxctQc
 UKBAB9N5SHkWDzjewI2JAgU226n9ek1QKWky7UVg9o8z8iDvGjJ/PP9XXYMjJ/hSsRTO
 vIsmTgMX1WlcIliCoUS+3+9q5SXGxSHFTDwPrxT8I7MWBk7tmrCC4zsnRE4R+sSBJHwq
 BI91/Bl14tRSXxUQiFyDriqPLUqj4WQSa7R1Fz4BJ1oIGG7E5/oEtjn9Gjejkh/Q7bDf
 cd4P2NEoVe+4TnTW1E1foo8xoGN7YZmpXu789q3QGzpR+YJEL7fTPZ6uKKu5GaDVB6Gz
 8aiQ==
X-Gm-Message-State: AOJu0YwVqNeIn79mzJRplqxzbdahCGVcn5lanoXjCG+pulq3e+xT2Eub
 7Q5+8TUmtDkqJKejEkyZLt/Q6sMf6uF0WO3O6Vpkn7KrT9ObjB7macAw4CugzbDJM6lqmzKx5Ia
 OAgM=
X-Google-Smtp-Source: AGHT+IGWXcy3x2mnLkenOJips8Kqw31bXdc63NylIycPFfpf8cEpesHBlV0eWjY0Dp4F7kt1Qy9Ayg==
X-Received: by 2002:a17:906:c152:b0:a6f:6337:1ad5 with SMTP id
 a640c23a62f3a-a79921b344emr96267466b.27.1720688735502; 
 Thu, 11 Jul 2024 02:05:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.36])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a871f03sm236739166b.197.2024.07.11.02.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 02:05:35 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 11:05:25 +0200
Message-ID: <20240711090526.2206829-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720688735; x=1721293535;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EIQn8G//3LCRFdLyVO9Jsh3anCCKd6sQoe0ML6jZIUU=;
 b=WhK79AmczSwqNuQBcUuJL3AZCq0JP1+LTcCxuEHRSfkx1qFXVkxH9Av3cMwA3j2Kwg
 ohTS9/Z3jQIvXPozBLnzD3Q1EjqeMhbewBBQs6Lw5J7Ltl+d3s3i4CXtnk+6XFwSyi3D
 sq7PTK0tGFdypIygk+35ihr2IHHdcH/YYAfPk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WhK79Amc
Subject: [Buildroot] [PATCH v2 1/2] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.162
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.162 for both
configurations and U-Boot to version 2024.04 for the SD one. Using the
same kernel will subsequently allow adding the hash files in a single
location.

Furthermore, now even the xip configuration uses the same headers as
the used Linux kernel.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Drop 0001-serial-stm32-rework-RX-over-DMA.patch.
 - Update to Linux version to 5.15.162, which now includes the patch
   fixing the UART issue.

 configs/stm32f469_disco_sd_defconfig  | 7 ++++---
 configs/stm32f469_disco_xip_defconfig | 5 +++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 66840a774230..689a12941630 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -1,12 +1,13 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.162"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -21,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 6e6ead0fdebb..000265d83155 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -1,12 +1,13 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_KERNEL_HEADERS_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.162"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
