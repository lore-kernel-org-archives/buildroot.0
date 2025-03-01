Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61781C282C6
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CEA34F077;
	Sat,  1 Mar 2025 14:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Tyr5jo2uzQC; Sat,  1 Mar 2025 14:27:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BACE44F086
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BACE44F086;
	Sat,  1 Mar 2025 14:27:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 880D6181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 775F260C14
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPts3HOldcfZ for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 14:27:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C44D60AE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C44D60AE8
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C44D60AE8
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:06 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-86b2cc89e4aso2656333241.1
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 06:27:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839225; x=1741444025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I5bPKPQpQJIxYP4mStXgzCUnKRcufY31IMtJ03N3wAs=;
 b=G+6HoYtnTAhUw/3e61DaLM+d9fuOf0kejzxHiwORPj5wua9GhRGXG8dKOgXFuDOoDU
 ZPef7rXiDNWZ0+ObbjmdSIdT3GXglzwlmxELSkamPyqMi1DYk3MC8VE389HcWs6fSuk4
 Bda0NU7TtAt96ZEwb5C2PKXN+yjTQHjy2h7gsg5/9sgaWUNczaJbgRaT8EAMYpb7SIFD
 cj1AjgccMLDUbxaJrHSZeJvVUVJGilA2iXw6C9lEAR90WYlSd20u6j+2MRUaNqdZ6PkU
 XUt5m7YzHaS0IIcA0I1VJRBO1aXXfASQtjYZqvBQ9zFfTDgYlqVfSqzENJNqiZ9/sNNN
 wKQQ==
X-Gm-Message-State: AOJu0YylrUhaKXmBYciiBzpa4U8mUJ5ExNpMIJ65d1vta+r7SZ4x7hK9
 eQISxuKybCeiK5QYrSP61SJombdbuBBiD2RdG8kI5pdKVjB+vhK+4Xa0Hy3xLzw=
X-Gm-Gg: ASbGncsewPX0SEZUDPBBkRTVH/XQNZsmlTM8JFQSis4c3it3SYcqo8r9lkq2AAZCdrI
 RB6VclG3tXdf2vbqkRagXNHkS/4LufgZTCe/PyzeU82mVzxCF2CV6Bm5wsQtFRaP6/k7+7HfoPw
 Qm9Z7NUyeLTb19YB32wCf5IeP1rk7tyJOxjG+c+UB9bQr6howtuddl4YLA0Byq8xbSvhVv2B/qW
 5QTYWSMGiaW9dtEPrI/ZY3PK5cM8Hrmgz++bln61Orzs06rT+iusAKx4YnrJfBwMSCMzD3y6cXz
 baqa7hZQsJzkxzVCEXHeHPSxAmh7nm1qK6xRGFP7ODXvYOB1I1QO0Ddr73Yioi+awg==
X-Google-Smtp-Source: AGHT+IE4DKciSfYOqh9n+HChxZCk6QIbXmlaL0nfOQv1X23m1MlN5eBuRX4yfoHZ3WZvPS1+RJ3Fug==
X-Received: by 2002:a05:6102:6e8a:b0:4c1:6ea0:1eb5 with SMTP id
 ada2fe7eead31-4c16ea024famr2843396137.15.1740839225068; 
 Sat, 01 Mar 2025 06:27:05 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:e8e3:b53d:c3e3:1bc3])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-86b3dc1359esm858841241.10.2025.03.01.06.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:27:03 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sat,  1 Mar 2025 10:26:13 -0400
Message-ID: <20250301142619.72570-6-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250301142619.72570-1-gilles.talis@gmail.com>
References: <20250301142619.72570-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839225; x=1741444025; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I5bPKPQpQJIxYP4mStXgzCUnKRcufY31IMtJ03N3wAs=;
 b=Fo5Vro+ClKANEFhboo8S3YOaszW8QPaAJ38DFib4Yc4UqRDq546guq3NlVX40Psy1j
 GgSTxEhY20ikX/qlEDnBLojsz6j5IGf0TRJ+CPCFNboibt4WbBbWPlwo5m69jFdLPrRf
 tw0vzFgCGihNW7ZE0Rcxir4dX0s7BBKfZHfpg4elTf/zKzoXt2WQJJZTBBJzECizJapk
 f1x22L1VyFBp2GXPiKq0QeV2D3iOb7crmJhawd4Ij334fqq9lGK13rqvCLZEWn41eCbp
 X6m9Ee2hXa4DpzIxgSk2kycGVfLe4Tz0amfLVFxd+WjOXkTocTllwRAQb5VvakspvqU9
 xBKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fo5Vro+C
Subject: [Buildroot] [PATCH 05/11] configs/freescale_imx8mpevk: bump BSP
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
 board/freescale/imx8mpevk/patches/linux/linux.hash          | 2 +-
 board/freescale/imx8mpevk/patches/uboot/uboot.hash          | 2 +-
 configs/freescale_imx8mpevk_defconfig                       | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 0266b45d6a..58100572e4 100644
--- a/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  37f0dee8b3b52d6c7f8a46c3bdd4138b528f9cc607015400e7cad0c206df41d7  imx-atf-lf-6.6.23-2.0.0.tar.gz
+sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx8mpevk/patches/linux/linux.hash b/board/freescale/imx8mpevk/patches/linux/linux.hash
index 3c4223976b..620a7377ef 100644
--- a/board/freescale/imx8mpevk/patches/linux/linux.hash
+++ b/board/freescale/imx8mpevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx8mpevk/patches/uboot/uboot.hash b/board/freescale/imx8mpevk/patches/uboot/uboot.hash
index 4e0d729ca0..4b763ba3ba 100644
--- a/board/freescale/imx8mpevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx8mpevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
index cb9f896a7a..894b5a2faf 100644
--- a/configs/freescale_imx8mpevk_defconfig
+++ b/configs/freescale_imx8mpevk_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mp-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-evk"
@@ -21,13 +21,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_evk"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx8mpevk/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
