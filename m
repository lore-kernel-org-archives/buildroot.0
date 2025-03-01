Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AD0C282D1
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4EF24F03B;
	Sat,  1 Mar 2025 14:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsihYwuk7cms; Sat,  1 Mar 2025 14:27:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 701E647C46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 701E647C46;
	Sat,  1 Mar 2025 14:27:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CB8968
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85B4740C16
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLn1OmgVBKJF for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 14:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7398347C46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7398347C46
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7398347C46
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:26:59 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-5209dad13b5so1069597e0c.2
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 06:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839218; x=1741444018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mSrv9/q3MRvLC+Z4j9/lvfJMwGeCBiN3d3iIpeiR0M0=;
 b=mIXqRNrT86YG/IXLr/oltNud8iBB7U/MaRLJzWt7DE67/YvT3PKpA7UZLMJnOCoLj/
 Ml5XS+52qEN7qbXEBewmmIsuWB55q5s99r9SdjuLdbQuQ/T1zHN6t9FSR1ghTXiXWN4d
 BkQwvzZEJfFDQuTkH9N1kHcMxjjv5gbJ77gwv3YadvrK8p//zVhD0DpL0xtxBA/0keQD
 ogLbR3J6lhZHaftrydkxD2svHtT3VxYtYAZfG5fd8VGVWNgEaPGYKeO3TZ51OfhsAzKc
 dUvO9lTpEC1liYGM18OEUKdGdlUite/+FV9GZCKOM2bG9KurbH+bBZsx1MY9QeiA2N+t
 SXOQ==
X-Gm-Message-State: AOJu0Yw8q6Ij0CiVy44VGVA5BX2UictaXJPC73NMX3EtYWFseAjX0o2F
 e7Q/QmGCzFX7b/FKhD9BwBC8jGqGN9IlkXpUwjrnVvWzwwipXNJadT3jytEiyhY=
X-Gm-Gg: ASbGncsXWKfzIF59Cbkbh6Zmx81erCUFbvxWS5T9N+d2PdDo76bgy6MpSFtUNq8Btok
 3WhPjT17VnUGwFDxr7uCf5LmzLUOaZ2PXCXAnucY98NTuK6j57pqOwGPxHO3xQVCcAcgsUdtbIj
 5KdRm3u8KrV2m8O0FrWemmePc2mA1SGl9+lNrb5ZSw4r9RAVanXTDa49gozqWmZHM9NuGKpik0I
 ISakjrxzgOD3TIpYdh6ZOEPXs69KLDTGneG1BBH5X8Di/Z1Roxe7ngAOIqZ/ymOYYVkK85fpuUZ
 IViPwQptQq834GE7SY82jwe3hA2RH+qof6VGWyPlFJucBpY2wfejzvy3g5SmtQPsKw==
X-Google-Smtp-Source: AGHT+IEm8CkQWx3q6NbE4dfgY7n78EkB/OC+koRsdRAjLWURMtldsc4ngoiwKL2kwwoTVCI/v8Lm9w==
X-Received: by 2002:a05:6122:4086:b0:520:6416:56f8 with SMTP id
 71dfb90a1353d-5235b632c3dmr5308143e0c.3.1740839217645; 
 Sat, 01 Mar 2025 06:26:57 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:e8e3:b53d:c3e3:1bc3])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-86b3dc1359esm858841241.10.2025.03.01.06.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:26:56 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sat,  1 Mar 2025 10:26:10 -0400
Message-ID: <20250301142619.72570-3-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250301142619.72570-1-gilles.talis@gmail.com>
References: <20250301142619.72570-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839218; x=1741444018; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mSrv9/q3MRvLC+Z4j9/lvfJMwGeCBiN3d3iIpeiR0M0=;
 b=QwoDb8UurpHdUKcPyzhxRatkw1ysQZMDO0EeW8CkCfxr5eeq7vROwspAVk5zH92u9c
 4Czc/lvOGJans1Pq1ZjxCUhYjbe/R8u16rA+BAeupYU7ECerdaJpl8rnAPw5sYS71V1g
 AWAByx9QtKl/ppbWumb7A6KVZo3RxB6Jq9TKWCM9CGngKmrqP9UDVOf9OvRqnoDLGApn
 eAYzr2zD/+ayTM0ICsVsvEa6kM4d4RYfn52sChYQSf7jCcJzjgmOctDYjFSLvnGcO0LY
 o1z8tNdJ5u9nLzwUPI0ciV41A5liR7rHq2NfiyuKEKwrVdxB3pv0DEYzQjdweILfNNma
 bDGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QwoDb8Uu
Subject: [Buildroot] [PATCH 02/11] configs/freescale_imx8qxpmek: bump BSP
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
 board/freescale/imx8qxpmek/patches/linux/linux.hash         | 2 +-
 board/freescale/imx8qxpmek/patches/uboot/uboot.hash         | 2 +-
 configs/freescale_imx8qxpmek_defconfig                      | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx8qxpmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8qxpmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 0266b45d6a..58100572e4 100644
--- a/board/freescale/imx8qxpmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8qxpmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  37f0dee8b3b52d6c7f8a46c3bdd4138b528f9cc607015400e7cad0c206df41d7  imx-atf-lf-6.6.23-2.0.0.tar.gz
+sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx8qxpmek/patches/linux/linux.hash b/board/freescale/imx8qxpmek/patches/linux/linux.hash
index 3c4223976b..620a7377ef 100644
--- a/board/freescale/imx8qxpmek/patches/linux/linux.hash
+++ b/board/freescale/imx8qxpmek/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx8qxpmek/patches/uboot/uboot.hash b/board/freescale/imx8qxpmek/patches/uboot/uboot.hash
index 4e0d729ca0..4b763ba3ba 100644
--- a/board/freescale/imx8qxpmek/patches/uboot/uboot.hash
+++ b/board/freescale/imx8qxpmek/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/configs/freescale_imx8qxpmek_defconfig b/configs/freescale_imx8qxpmek_defconfig
index 3ff476e992..9dbc4be81b 100644
--- a/configs/freescale_imx8qxpmek_defconfig
+++ b/configs/freescale_imx8qxpmek_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8qxp-mek.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8qxp-mek"
@@ -24,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8qx"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8qxp_mek"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
