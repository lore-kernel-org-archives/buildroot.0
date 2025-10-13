Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AC8CCD184
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 03:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F367080E4F;
	Mon, 13 Oct 2025 03:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id em33no1N37Bn; Mon, 13 Oct 2025 03:17:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D68DC80E8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D68DC80E8A;
	Mon, 13 Oct 2025 03:17:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3AC72A8
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A4734070B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWvKcl0fI7oS for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 03:17:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BAF040659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BAF040659
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BAF040659
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:00 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7811fa91774so3119227b3a.0
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760325420; x=1760930220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e9hUxoR0fmmy4hP9mN6hS8746ENfhlugSCnc8LbKaAE=;
 b=cQUoFgVTrfFLF5NByvq/ZtRX14nkjH9C3bBGurIKuQ8sIE+QsOdajTeVx17QJM645J
 v4hXm6oPD/TEt7tulc3mVxxLkVOi1WVVzFHtR68AHawR6Xm9+fPgkMB7ofNlMbNRzp2i
 01SgPZkuyoomzKNP6/BfMPe0DYHJ9N7nSxfMPqPbVxK/Leh+JjxSP447WAqXiDFJWpAI
 WtYZU6Wq9Crrm0oYPdleJOjy8OnApcb2VlFppd2W5dGf1PHSMjSCm9ZD2RSfTBuZJlK7
 EHVuSylDtYYtlniA+WoTbiu7MXJLIAgtciiN0N7u/wB6Q0KfpVZc9WlNSjK565buH+aZ
 mvUQ==
X-Gm-Message-State: AOJu0Yyd9y2VCzKtL5+bDN8O050nhnFEA5yI231A4hi5XID90vDEVE1g
 Xop12LFTidOSDF3k6sl4hOGh1qhUzACegQ/3rWTKBITwflRrOnMIhYnI7uQmzf0l
X-Gm-Gg: ASbGncvSP02yafewOLnp7wqjCLQwxPpPGEeyCc8E4kWoJsNchVACxu5vZCVGfBG8qH4
 PEoXQrW72Gvz/czntfptkzvZ6vIfMgr01AU9kYuNePEqaCudiUSyREDEcj4K0BNk9WSQoyvO4DG
 86wkIsOiUz2zNAj17/bTqUlYCnkumyQVHMSwQLN63v3qt2J++qi6/CPxZt3anNGrK5DgDoBwwYd
 wmiHSU9oWtEAVWTXr36XNLyyP/2Lr5rTnOEvXiFJQZcACdtS8NGRgsO5bb/Pkq2N0ev5PLZO3Fg
 BSP9n8eww3Atd4utcVzIYezH4a8hD8t5v+6p9lSWcEBdkrZ2Opvkh2UGPJ1rXXpniNP5D6n2bWy
 xE7W+VpN/ajiAEVMvmxUb7av6jy6+TZUVDN1rhuUKxf1vBtQhpOC390ocRdamOWxQ8Y+mTKsv/g
 qJbeVr5RifiKO7Gn8P0kIRbFmwSay7dSdR+uSrfgLcDH9W0rb7T6dxKqku
X-Google-Smtp-Source: AGHT+IGb616WzcpbVv9sxItyUklveqVn9C4p7nX29B2/J+Vrn6map4zO1Dp75CNxffd29SIVGnE2dg==
X-Received: by 2002:a05:6a20:3d8c:b0:2b4:41d9:b068 with SMTP id
 adf61e73a8af0-32da8462f7emr24061601637.37.1760325419531; 
 Sun, 12 Oct 2025 20:16:59 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61ac8d7fsm10195647a91.21.2025.10.12.20.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 20:16:59 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:14:46 -0700
Message-Id: <20251013031453.566526-2-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013031453.566526-1-nemaakhilesh@gmail.com>
References: <20251013031453.566526-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760325420; x=1760930220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e9hUxoR0fmmy4hP9mN6hS8746ENfhlugSCnc8LbKaAE=;
 b=kN9rR6mJSGx7WKAkSHje9PbDswPav2NNBpc43VSCDnOVhS+Y1SbEwLmHnP0oFY5ne2
 j3GKOpADXOx5AjIzzaUB/DCYZbPEgshPS/heC+u7c919z2ak5v7yX165Jo6AUT8zeHfU
 ZaC/rITDTHgjPwd0nz374xPG6SxrQgMzfXSNBnkjhk7mIbQ6gjLBl1cNuQjAfaq6rn2X
 ftemT4Y0o2OZAtENhBYf0qCqktSJUItZdXoXFybgll9ektBcC4GP+udC0x1Q86WK/A6x
 Wb/T4SL86dOWOkK7bPmnXoixsA7PsDPULZuQiCrPe+YZZq5VTkghoJapAL0I4jUEP6iq
 QvhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kN9rR6mJ
Subject: [Buildroot] [PATCH 2/9] configs/ls1046a-frwy: bump BSP tag to
 lf-6.12.34-2.1.0
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
Cc: Vladimir Oltean <olteanv@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the kernel, U-Boot, ATF tags and readme.txt.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../arm-trusted-firmware.hash                    |  2 +-
 .../ls1046a-frwy/patches/linux/linux.hash        |  2 +-
 .../ls1046a-frwy/patches/uboot/uboot.hash        |  2 +-
 board/freescale/ls1046a-frwy/readme.txt          | 16 ++++++++--------
 configs/ls1046a-frwy_defconfig                   |  6 +++---
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index c05084df76..7981c74137 100644
--- a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  738f029c6bfcdac5649e2c252970b1f44c1ce7fee9fe4657a25edc666375ffa8  atf-lf-6.12.20-2.0.0.tar.gz
+sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  atf-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
index 3aea05469c..f30030c86a 100644
--- a/board/freescale/ls1046a-frwy/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  c98177e85ace6400b06301101af3065e90463920c3e166da4ed22deffe960fb8  linux-lf-6.12.20-2.0.0.tar.gz
+sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  linux-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
index 1072686160..38d54d9922 100644
--- a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a39f7db3ffd2b7263ea5d02b0631decac1c89f7c1b96b77ba8e302f3641a3eb3  u-boot-lf-6.12.20-2.0.0.tar.gz
+sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  u-boot-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index 79a2ecdecf..57eb743d5a 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -12,7 +12,7 @@ For more details about the board and the QorIQ Layerscape SoC, see the following
 Layerscape platforms are officially supported by NXP under the Layerscape
 Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
 common with i.MX), but has a slower release cadence than LF. The currently used
-tag is lf-6.12.20-2.0.0, which is in line with the latest LF tag. Generally, in
+tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generally, in
 Buildroot, the latest Linux Factory release tag is always used, which may be
 considered pre-release software, as it may contain features which are not yet
 documented, and it generally undergoes less testing.
@@ -22,13 +22,13 @@ For the software Layerscape Debian Linux SDK User Guide, see:
   - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
 
 The components from NXP are:
-  - rcw, lf-6.12.20-2.0.0
-  - atf (fork), lf-6.12.20-2.0.0
-  - uboot (fork), lf-6.12.20-2.0.0
-  - qoriq-fm-ucode (blob), lf-6.12.20-2.0.0
-  - linux (fork), lf-6.12.20-2.0.0
-  - fmlib, lf-6.12.20-2.0.0
-  - fmc, lf-6.12.20-2.0.0
+  - rcw, lf-6.12.34-2.1.0
+  - atf (fork), lf-6.12.34-2.1.0
+  - uboot (fork), lf-6.12.34-2.1.0
+  - qoriq-fm-ucode (blob), lf-6.12.34-2.1.0
+  - linux (fork), lf-6.12.34-2.1.0
+  - fmlib, lf-6.12.34-2.1.0
+  - fmc, lf-6.12.34-2.1.0
 
 Build
 =====
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index f12b27b817..838d132d55 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-frwy/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.20-2.0.0)/linux-lf-6.12.20-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.34-2.1.0)/linux-lf-6.12.34-2.1.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.20-2.0.0)/atf-lf-6.12.20-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.34-2.1.0)/atf-lf-6.12.34-2.1.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046afrwy"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.20-2.0.0)/u-boot-lf-6.12.20-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046afrwy_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
