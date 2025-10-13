Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19F7CCD184
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 03:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A18B780E35;
	Mon, 13 Oct 2025 03:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQA_LqFeMDyZ; Mon, 13 Oct 2025 03:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5429480E10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5429480E10;
	Mon, 13 Oct 2025 03:15:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C1822A8
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A21461136
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qh-gp7r40-wj for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 03:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C57961135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C57961135
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C57961135
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:14:58 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-339e71ccf48so5296208a91.3
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760325297; x=1760930097;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wmB41l+/gM4g6pjz9laLNCxxBA/pa/EApsk2bMn+Dx4=;
 b=qVpAo7cifqPSqFzh9ZRR5QsyLce3jxCNrydfV6xQOqaiiiol2wuGze4OdxZjhMQvQm
 O6DcR4XOd5hrsaKA3J2Z61idueYR4Vq/TEGHqRaTzI5kskpRLWvRgoof6G4zN4um/wfI
 DXLdvHehYvJPqvvfuHd9r5FSZMaLui3uU2S2hz58YWoBcdMOk3eKGgcaifRsFX3bKK+z
 dFfvaZkgH7sNRizpSHyzft5zBKI4jTy49CsCHsy7TJioe+/FKsZZ4eaYF0BNzNBa9m36
 WYpau6lELaQ7/PZwb59Vy/Xz39JYuVdpv8gXGmoDHsNnC9kyX+rhQKqM7IRuWT8/g63G
 acfg==
X-Gm-Message-State: AOJu0YwsVKCj4AvWoM4hyGSRrGXN0f7K0LNlOsYY6F+gx6LS/AtsEY5F
 EQqjDDj5NHwrh19tftKfbsZ7lCagPjBkl5z1dAR3p9pUnTtHMWGvqxHRkSA5lFAW
X-Gm-Gg: ASbGnct5vnnxPKmRXScHmUyQsqQVb0tbDWjea35mIs8qtW+KDj2jI8LoFF/QbSiVO2b
 d/TGo2yLfyTbJEN9bN8cqTFSNOyEmrbvXH+jwmZe0brsuqvN+8mOU3I1WDKM1+YGjqIYiOKkHRm
 HE5QYs7ubjdTvBy726U/pAdrog1cSurrV4pBkZLLGNUOx7wmvjYPxHikqmpysBJrSBWfKdHLu7Z
 QwFiG3pvGbhYfIVBathXAoSQaOV9RRAFCL7G9yVMPkgx2h+W4fVjyW4RxRzFcynY9jNgZgOZk6l
 M9DIbkj/oAvtUgDA91MqpexPfgJXGm0KKJaJ+mZjTE8N2YdfK4nvjPwVEkXqOCeFCkNPuXMTCnJ
 bXt6afPE1AH+T3GR83kBcQLMl+IhrE7r1LsEKTekp6+4l9wIQ5tj3THQcOX/bO14aoZdehitdna
 notWwu9skal7Z26qH8gyI4YaWUpWrl64HLnzxWwgDh3A+teqYSFfzr6pv3
X-Google-Smtp-Source: AGHT+IH0eJWeLLZKP0ezXI8Cuw8dkavR/7n8ueBP9i5GW3xZEVazJIXqfhs+B9lg5oc2jI7f4Gn/Dw==
X-Received: by 2002:a17:90b:17cf:b0:338:3221:9dc0 with SMTP id
 98e67ed59e1d1-33b5139ab33mr26054433a91.37.1760325297164; 
 Sun, 12 Oct 2025 20:14:57 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61ac8d7fsm10195647a91.21.2025.10.12.20.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 20:14:56 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:14:45 -0700
Message-Id: <20251013031453.566526-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760325297; x=1760930097; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wmB41l+/gM4g6pjz9laLNCxxBA/pa/EApsk2bMn+Dx4=;
 b=A6s6FY5yFeckXFcT9mzdIKfR6wlzhQGzk3zESLdg8/+dZvwBQYk5iF8jL8aFM3M219
 TtudDn6SK4bkV5UiO/Nc0rr11QrKyfbHtwDsAVnZ5e7w+ReHfgBAFHcJAzmIokYLJlgU
 N4Ph6sj8DiJjV2T46Y9Z1/d8ysbg0a16GILvhDyB0CdTsadD9Bky2CcIppym4L3RHAIJ
 86HZxu2EL9Tq70v7O+AibtwRgjpAbmynfDI6RA7S+CmIIjwfCD7i+j8dkQRAHH75DwJQ
 +OGzk6PTl9nkhRCnKSjXLSJMFPpJ9Mat8k4f6uFNJSMv5P0rJ6s5Tcg0r1i9nBNXFHWZ
 +pBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A6s6FY5y
Subject: [Buildroot] [PATCH 1/9] configs/ls1046a-rdb: bump BSP tag to
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
 .../ls1046a-rdb/patches/linux/linux.hash         |  2 +-
 .../ls1046a-rdb/patches/uboot/uboot.hash         |  2 +-
 board/freescale/ls1046a-rdb/readme.txt           | 16 ++++++++--------
 configs/ls1046a-rdb_defconfig                    |  6 +++---
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index c05084df76..7981c74137 100644
--- a/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  738f029c6bfcdac5649e2c252970b1f44c1ce7fee9fe4657a25edc666375ffa8  atf-lf-6.12.20-2.0.0.tar.gz
+sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  atf-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/patches/linux/linux.hash b/board/freescale/ls1046a-rdb/patches/linux/linux.hash
index 3aea05469c..f30030c86a 100644
--- a/board/freescale/ls1046a-rdb/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-rdb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  c98177e85ace6400b06301101af3065e90463920c3e166da4ed22deffe960fb8  linux-lf-6.12.20-2.0.0.tar.gz
+sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  linux-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash b/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
index 1072686160..38d54d9922 100644
--- a/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a39f7db3ffd2b7263ea5d02b0631decac1c89f7c1b96b77ba8e302f3641a3eb3  u-boot-lf-6.12.20-2.0.0.tar.gz
+sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  u-boot-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/readme.txt b/board/freescale/ls1046a-rdb/readme.txt
index ede7a607a8..e2f344dce9 100644
--- a/board/freescale/ls1046a-rdb/readme.txt
+++ b/board/freescale/ls1046a-rdb/readme.txt
@@ -11,7 +11,7 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
 Layerscape platforms are officially supported by NXP under the Layerscape
 Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
 common with i.MX), but has a slower release cadence than LF. The currently used
-tag is lf-6.12.20-2.0.0, which is in line with the latest LF tag. Generally, in
+tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generally, in
 Buildroot, the latest Linux Factory release tag is always used, which may be
 considered pre-release software, as it may contain features which are not yet
 documented, and it generally undergoes less testing.
@@ -21,13 +21,13 @@ For the software Layerscape Debian Linux SDK User Guide, see:
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
diff --git a/configs/ls1046a-rdb_defconfig b/configs/ls1046a-rdb_defconfig
index 21c63e43b4..f9be2d42b2 100644
--- a/configs/ls1046a-rdb_defconfig
+++ b/configs/ls1046a-rdb_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-rdb/genimage.cfg"
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
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.20-2.0.0)/u-boot-lf-6.12.20-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
