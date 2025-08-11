Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E589CA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34C1240FDE;
	Mon, 11 Aug 2025 16:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67Ho4qr2--X9; Mon, 11 Aug 2025 16:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13D9440FF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13D9440FF9;
	Mon, 11 Aug 2025 16:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FCE5138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E960683F2D
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zwkg_zgs5mfF for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6476A83F22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6476A83F22
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6476A83F22
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:03 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-615877015daso747720a12.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931361; x=1755536161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LU3i+Fz7DybGZrmeApdElGiO6eIycw2bknsGju0wvHc=;
 b=BPFQgT+hgW9d3czLT53Kem8DB2i5jV1i3IKBVog1ce6xeKI3cqA/rPVsYJsf5nBrMT
 Eolf2q4sk9AzVMb07alSCbsC3q1WH274C/9JNkUPCq6pB1/vk2jWMD7Awn38OUglY66m
 GjUSo6MH3/KA3xDBhB9LwOGEUL24oMFTGOTfiga1K6iCUL+Pqy5Zb8I4w2vcMYN7eeVK
 Gb4qKpN/9wcGtHl9tLezBtwhp8AtpY5ChFaOlWCWdGrDM6b4ZyvnUWbxrIIZc3gtYA3c
 gQWX6kjk6zoftmq0/QAp0bM+JmQO+UmmALbj4KnrrO2QuJN3AgbyhbWGU9FSk/2t8+Dd
 0+dQ==
X-Gm-Message-State: AOJu0YwLXAfI9PFDFqnsNT7YMP9MH5BgTprt/a56rZrwbHmCq1OEuEcT
 kQOfaorViXp9VAfxOix4BYYueHJ+elJm86qnSvpX3itvZC4XPk0BHJ4nv5o7bg==
X-Gm-Gg: ASbGncv6Z7iv8JYZPBoi/lpOlP0uD6aBRUIoKMF2J05Fts2c1BZb5Xnk/E7Yohh0Kp3
 aLg4Rvio3LhONmSbd1pVeHdRWScbn2yuoO6mWi1CzY16X0krB3xcybeVqNPbMlAjjheRSjY7Pn7
 hvNba1MJ91BEwZgUXZ43NQlY5HdeMSEE16NyCjiROrgKYBEjigobglLPLbi9h779cL1bDk2Bt4w
 +X7m00v5XGhbA8Ybz0eAdyi0u6s6AgF/3SnMqkPjFvaEpqaPQ6fv0aXt9jp5XcqiO8gNdt7unv5
 f3hDriJ/uS59ZU/cJPT5A2Tif2GNO7SoAplvecHPhMethzAN67ghAq7lHADPej6v3LCjtg09i2g
 Zh7V+WtNm2yGB8tY9TNQ=
X-Google-Smtp-Source: AGHT+IF9tv09IHY1Dtd/gux/3WdriNkp73rDIraFbbJHxmiGO7LqGFPk3xvhDNeLnF8XAAC80ofxAQ==
X-Received: by 2002:a17:907:3cca:b0:af9:6666:4acb with SMTP id
 a640c23a62f3a-af9dec7d888mr414102466b.10.1754931360777; 
 Mon, 11 Aug 2025 09:56:00 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:55:59 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:27 +0300
Message-ID: <20250811165531.1533913-8-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931361; x=1755536161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LU3i+Fz7DybGZrmeApdElGiO6eIycw2bknsGju0wvHc=;
 b=OTEgCoW1afxWtG9vsqL8r33W/EyB5oksvDkoNW1B2zlZAIxQ/HADIVCWat1dwQ7Lvc
 hPxmI3i7QWbkdzSEFhEOGJtZLDTr+nS7N7aC6uBq2EmLYR6m2nvIRzDFsAy2P8pnUAMm
 y9WceJdbN+kXI8r7z19ejV50L6jSFmWbP+Q9Ekx3fIRgvIhBQuKcA88LxFSvZb6EJDUg
 kIbFrQxIqBlcZFZ4EtMjJh+Z6E/2Amzdyr3aLgFRrtzG5x6eF4q0/b5S1Swsaj/Xbzu0
 v/KM5IDg4dh+ui8KzEyrdgc1kD3KBqML/tBnKmv4TOF4Pkt7tKd240kWHPxSkJt5cUng
 1fIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OTEgCoW1
Subject: [Buildroot] [PATCH v3 07/11] configs/ls1043a-rdb: bump BSP tag to
 lf-6.12.20-2.0.0
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

Update the kernel, U-Boot, ATF tags, as well as documentation, used by
the LS1028A-RDB to the latest Linux Factory release.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: patch is new

 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1043a-rdb/patches/linux/linux.hash      |  2 +-
 .../ls1043a-rdb/patches/uboot/uboot.hash      |  2 +-
 board/freescale/ls1043a-rdb/readme.txt        | 23 ++++++++++---------
 configs/ls1043a-rdb_defconfig                 |  6 ++---
 5 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 41c7ad4068a4..c05084df7660 100644
--- a/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2751fcd3eb9080c34531f68ca2e1f571a60f4220853df53a5ebed9835abf8c13  atf-lf-6.12.3-1.0.0.tar.gz
+sha256  738f029c6bfcdac5649e2c252970b1f44c1ce7fee9fe4657a25edc666375ffa8  atf-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/patches/linux/linux.hash b/board/freescale/ls1043a-rdb/patches/linux/linux.hash
index 43dbe074c2ec..3aea05469cc0 100644
--- a/board/freescale/ls1043a-rdb/patches/linux/linux.hash
+++ b/board/freescale/ls1043a-rdb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  9e2fff1014f1b196be8149c63a6054e40b1b36b222e53db3f445c96c856066e0  linux-lf-6.12.3-1.0.0.tar.gz
+sha256  c98177e85ace6400b06301101af3065e90463920c3e166da4ed22deffe960fb8  linux-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash b/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
index 5e36d9348789..1072686160f5 100644
--- a/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  8708fc95844d020f79b87f954f29073ae9b230de3e41117e7fb379294da946ac  u-boot-lf-6.12.3-1.0.0.tar.gz
+sha256  a39f7db3ffd2b7263ea5d02b0631decac1c89f7c1b96b77ba8e302f3641a3eb3  u-boot-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/readme.txt b/board/freescale/ls1043a-rdb/readme.txt
index 1b6f25904ae1..b106c9647146 100644
--- a/board/freescale/ls1043a-rdb/readme.txt
+++ b/board/freescale/ls1043a-rdb/readme.txt
@@ -10,23 +10,24 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
 
 Layerscape platforms are officially supported by NXP under the Layerscape
 Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
-common with i.MX), currently tag lf-6.6.36-2.1.0, two releases behind the
-latest lf-6.12.3-1.0.0.  In Buildroot, the latest Linux Factory release tag
-is used, which may be considered pre-release software, as it may contain
-features which are not yet documented, and it generally undergoes less testing.
+common with i.MX), but has a slower release cadence than LF. The currently used
+tag is lf-6.12.20-2.0.0, which is in line with the latest LF tag. Generally, in
+Buildroot, the latest Linux Factory release tag is always used, which may be
+considered pre-release software, as it may contain features which are not yet
+documented, and it generally undergoes less testing.
 
 For the software Layerscape Debian Linux SDK User Guide, see:
   - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
   - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
 
 The components from NXP are:
-  - rcw, lf-6.12.3-1.0.0
-  - atf (fork), lf-6.12.3-1.0.0
-  - uboot (fork), lf-6.12.3-1.0.0
-  - qoriq-fm-ucode (blob), lf-6.12.3-1.0.0
-  - linux (fork), lf-6.12.3-1.0.0
-  - fmlib, lf-6.12.3-1.0.0
-  - fmc, lf-6.12.3-1.0.0
+  - rcw, lf-6.12.20-2.0.0
+  - atf (fork), lf-6.12.20-2.0.0
+  - uboot (fork), lf-6.12.20-2.0.0
+  - qoriq-fm-ucode (blob), lf-6.12.20-2.0.0
+  - linux (fork), lf-6.12.20-2.0.0
+  - fmlib, lf-6.12.20-2.0.0
+  - fmc, lf-6.12.20-2.0.0
 
 Build
 =====
diff --git a/configs/ls1043a-rdb_defconfig b/configs/ls1043a-rdb_defconfig
index e5a8a00c871d..c7f46d1c378e 100644
--- a/configs/ls1043a-rdb_defconfig
+++ b/configs/ls1043a-rdb_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1043a-rdb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.3-1.0.0)/linux-lf-6.12.3-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.20-2.0.0)/linux-lf-6.12.20-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.3-1.0.0)/atf-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.20-2.0.0)/atf-lf-6.12.20-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1043ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.3-1.0.0)/u-boot-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.20-2.0.0)/u-boot-lf-6.12.20-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1043ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
