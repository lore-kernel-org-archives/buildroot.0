Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B19FC282D2
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138C24F075;
	Sat,  1 Mar 2025 14:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wa0qYqVPP9bR; Sat,  1 Mar 2025 14:27:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94A7D4F07F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94A7D4F07F;
	Sat,  1 Mar 2025 14:27:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 798DA181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6025840AFE
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5RiBWfTzF7Ge for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 14:27:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C50A40118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C50A40118
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C50A40118
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:14 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-86714f41f5bso1297353241.3
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 06:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839232; x=1741444032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UbHZLhWUKGr4ozKjKMXyiIgnc6J6zkOgnWiO6UK51Lo=;
 b=tE4TnsYKlvcCb1l0F9LdNWGk/hb5ZoiQEFKzl9fNQ5X2KRVhGshmlJ1yRB7gehx8Fe
 HdLyDVs1K/+Pkla2OvukRI8Sjqujnnin1tVEWkCtU0f43v6XqlDGcnbRbMZIz15lwhMV
 voLB8oaBK965NpeI3mP1HygOPdbHqYUKo71365SByT23crJvLQ3oZdz55euoXT5cjylT
 mtOb5bsy2pERdWwkBmCOmIwP5yq1hBRDXgsWkK/2KdJdN8IBIYOeq+EamnDKx2lWP+ZC
 vqFFdx0Al2v2VBAwIogzneDDzkYf4uAGyvkC+3kknechxKfbQr1MB81cm7hxotQk85C4
 pTWw==
X-Gm-Message-State: AOJu0YzZZC87foqCtx1l6rBm2TBT/PPTr+ugIY9X58Q3ZlboJcSWAJ9L
 OgzRt8TxLL4A/jPaeOUnW4rfOjd9YsHFn1hyoXMXHu/OgxStTScpc77CFDP9obs=
X-Gm-Gg: ASbGncsOfcpJ/m+RWeKJ2BtB7YSq+9AwAnsEIoCzML7AglNJ3OVD0deU2kaQuAkY6v8
 64yI5G5/mAsOignBV9Pgsdewb7NNW3mg1rmfxU0UylEd3EM8db7eE6D6kueoppqPz5+JNQFBqmr
 9MiMg7KJcENbts0cugVSI5RJf0AcgAaMn3BTa69Dyyee9Ik03UREsVWl86xTuto0Z4MjK9QvrsP
 J/0NkOJZASdTfjnMpxp96XIkaEpvuRei5ABEStgx0IjU6UVqJJkmqkQB5wxWkA8ldXJBPx05WnY
 Ag+rMMbfbVbbdKfuDB1E4tXz3MEuWerbrqW5gwcANdN2gWDK/9vWNNpKS57tH5dFTA==
X-Google-Smtp-Source: AGHT+IFKYgr/Aw8oFXACPlGrmRcalp+P3LaTMwdy4iqL5wCclELD53cNmgvySf1TRNb9xOpmsCORZw==
X-Received: by 2002:a05:6102:32d2:b0:4bc:de7e:4153 with SMTP id
 ada2fe7eead31-4c0449c78b4mr5948898137.3.1740839232305; 
 Sat, 01 Mar 2025 06:27:12 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:e8e3:b53d:c3e3:1bc3])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-86b3dc1359esm858841241.10.2025.03.01.06.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:27:11 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sat,  1 Mar 2025 10:26:16 -0400
Message-ID: <20250301142619.72570-9-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250301142619.72570-1-gilles.talis@gmail.com>
References: <20250301142619.72570-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839232; x=1741444032; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UbHZLhWUKGr4ozKjKMXyiIgnc6J6zkOgnWiO6UK51Lo=;
 b=PZEGFa8CYyWEO3++ngeKW7KZo20rebLDnIl/GcR8JMIdoT5IzbN55vM2pwpGmkf3JW
 aF7fei6xQu7g/5yZtueL6/XtRUWJdkdYHre9cAiLMu7uI0MdDv2zASYppYDzyQd3qKYD
 4LU6Xdo5zoJmxdIjUn6eLp1cUUrn0k333GrtOCfekc6IzBi+a0XpAoelIcgehmCXTJ8K
 C3uxDRr53btToVdinJSQDcTfsBtV4rYS0gpQfbW+g9I18OEgQNRdBDG6YoOVpvrlzKM2
 OPFa8ahOaXUs0fQMba/YencGRscRJ2Z0hBqhGnAS2bYGNeO1JzrfcOjnRXbXlgTH51oZ
 0cUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PZEGFa8C
Subject: [Buildroot] [PATCH 08/11] configs/freescale_imx8dxlevk: bump BSP
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
 board/freescale/imx8dxlevk/patches/linux/linux.hash         | 2 +-
 board/freescale/imx8dxlevk/patches/uboot/uboot.hash         | 2 +-
 configs/freescale_imx8dxlevk_defconfig                      | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 0266b45d6a..58100572e4 100644
--- a/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  37f0dee8b3b52d6c7f8a46c3bdd4138b528f9cc607015400e7cad0c206df41d7  imx-atf-lf-6.6.23-2.0.0.tar.gz
+sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx8dxlevk/patches/linux/linux.hash b/board/freescale/imx8dxlevk/patches/linux/linux.hash
index 3c4223976b..620a7377ef 100644
--- a/board/freescale/imx8dxlevk/patches/linux/linux.hash
+++ b/board/freescale/imx8dxlevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx8dxlevk/patches/uboot/uboot.hash b/board/freescale/imx8dxlevk/patches/uboot/uboot.hash
index 4e0d729ca0..4b763ba3ba 100644
--- a/board/freescale/imx8dxlevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx8dxlevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/configs/freescale_imx8dxlevk_defconfig b/configs/freescale_imx8dxlevk_defconfig
index 1ee1413eb0..c3017074c9 100644
--- a/configs/freescale_imx8dxlevk_defconfig
+++ b/configs/freescale_imx8dxlevk_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8dxl-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8dxl-evk"
@@ -24,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8dxl"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8dxl_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
