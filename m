Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3696FC021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C15E06FC80;
	Sat,  1 Mar 2025 14:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0-oadj73444; Sat,  1 Mar 2025 14:27:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56A6170734
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56A6170734;
	Sat,  1 Mar 2025 14:27:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FA0768
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02C2B60E59
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rT0JVe5acI2S for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 14:27:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BB6F7046C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BB6F7046C
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BB6F7046C
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:01 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-520b9dc56afso1319152e0c.1
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 06:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839220; x=1741444020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dXw7ZWIp9WU9hPEvG4yFQSWzRDjIFrwJLNqVTeghTiM=;
 b=OLV2cpwF/KEo1bGeMPf0++Nr4JyF1h2u7sHoGMS02uKZDr/patSP9BKuFqiO2UxFag
 CahOAroVXigsjtiS4kZVx9+NT4ch8XtywhzBlgTHJQx2Qh0PqJdQICD1tqEs5r4tI3BD
 0SS5nVT0UFycDKtPH2Xh4+X+fLBz6U1kL7IJp5Fm0Y1PmiRnbEXExoHIPVULuOxBUO0X
 k5e2Rcc2pku0fu9gLYnYjkvAaVd7t6HiKnn1CTuAlTXxioN25acFXU6i/k4kNTDzIWEk
 8XJ70b+inLmuGJSb/Ps0bpSYmqz85rr0dSTxwHY0Mcp1tIPxCfAH5mG+8ejpyXGNjMe5
 rK4Q==
X-Gm-Message-State: AOJu0Yw/PCM5v00jO6WgLRsv+x21z9sXupP4HrLm9mdQokavmGvZwkrP
 wgRMmiPvdYl5qRwNikl2+5TpvA6cTT5YcC3kLEEA6u7YThlK1DgUlTfu19FLjnY=
X-Gm-Gg: ASbGncsZeJzz8hMHx52xyKvnsAxW+Dwy40RNAZdyggo28UvZg32uVpEnySgRO62FiTh
 lwueRR4J5ui2lV8vhJRox8+EmPVooJsTHY9Jg1k2Zfel/q6yy8vxq/k0I5AFsXic5oT62VcGGJw
 BCrHiRsZL+blUS0cnvufMbFZx4zToO+AKZ0S9bb6/MTD54hsur2N845bOOwebtvGigiT3r1m0n7
 jMITiagryzKeQgYBPbnizFxnw3hJchg/JpVPt4AK/0HRO6e/mokvkjFQD0qKwD3GfrOYj5Y593K
 bh+OdPW97M9uMMyqXnd47sY1MGE1OXqe39n4eObO4vJMTkmUWemz4QODnot3+eSqqQ==
X-Google-Smtp-Source: AGHT+IFnQelLz0u59OsFBBbxAMZ1yvaxat/dFx8Uy/v+duv7ic7qJJw7+t7S7nC6BVh9E+Kse/EMwA==
X-Received: by 2002:a05:6122:3185:b0:520:6773:e5ea with SMTP id
 71dfb90a1353d-5235b84e6e0mr4428349e0c.7.1740839220058; 
 Sat, 01 Mar 2025 06:27:00 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:e8e3:b53d:c3e3:1bc3])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-86b3dc1359esm858841241.10.2025.03.01.06.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:26:58 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sat,  1 Mar 2025 10:26:11 -0400
Message-ID: <20250301142619.72570-4-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250301142619.72570-1-gilles.talis@gmail.com>
References: <20250301142619.72570-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839220; x=1741444020; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dXw7ZWIp9WU9hPEvG4yFQSWzRDjIFrwJLNqVTeghTiM=;
 b=HYF/VjdYjGhP/26UHvCI6AoNkv5WSVtu4MDpUoGJkMyhQRYiPKDyG04qwPp2gQdLM2
 YEARZSQVjOL5tRfnJku8EwfkiqT0p32ywdDEHJAZXsem9/6Lt3HPqXVk61wVJd8F0qXq
 52ybGBJzs2QIFDkQj3k4XOPqAXl9RNL8ZxHfaMrY4Nj6Qs/XmrSg0sebd/tycu3/x18o
 lvdTKTyh/+FXcjzXGsarYkRMo/KdY/V9lb8saOGz9pxesrC/NL2Ic9KDVtAoP1BJxPNh
 e1UEuZ+pEHN07w1R2b0XirHZnL9+hgKr27A+HboY5NhKeRUdudOf6UeqXg4MhH7+fSmS
 HXpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HYF/VjdY
Subject: [Buildroot] [PATCH 03/11] configs/freescale_imx8qmmek: bump BSP
 components to lf-6.6.52-2.2.0
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

Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.52-2.2.0
versions.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx8qmmek/patches/linux/linux.hash          | 2 +-
 board/freescale/imx8qmmek/patches/uboot/uboot.hash          | 2 +-
 configs/freescale_imx8qmmek_defconfig                       | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx8qmmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8qmmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 0266b45d6a..58100572e4 100644
--- a/board/freescale/imx8qmmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8qmmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  37f0dee8b3b52d6c7f8a46c3bdd4138b528f9cc607015400e7cad0c206df41d7  imx-atf-lf-6.6.23-2.0.0.tar.gz
+sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx8qmmek/patches/linux/linux.hash b/board/freescale/imx8qmmek/patches/linux/linux.hash
index 3c4223976b..620a7377ef 100644
--- a/board/freescale/imx8qmmek/patches/linux/linux.hash
+++ b/board/freescale/imx8qmmek/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx8qmmek/patches/uboot/uboot.hash b/board/freescale/imx8qmmek/patches/uboot/uboot.hash
index 4e0d729ca0..4b763ba3ba 100644
--- a/board/freescale/imx8qmmek/patches/uboot/uboot.hash
+++ b/board/freescale/imx8qmmek/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/configs/freescale_imx8qmmek_defconfig b/configs/freescale_imx8qmmek_defconfig
index 6fb3a54df1..5b9c07b1f6 100644
--- a/configs/freescale_imx8qmmek_defconfig
+++ b/configs/freescale_imx8qmmek_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8qm-mek.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8qm-mek"
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8qm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8qm_mek"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
