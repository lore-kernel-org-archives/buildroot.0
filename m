Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B196FC28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 618B484B4D;
	Fri, 28 Mar 2025 18:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39QBB4AuW6EQ; Fri, 28 Mar 2025 18:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA9528595E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA9528595E;
	Fri, 28 Mar 2025 18:04:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F37512A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D576A4F2E6
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ua9y4hyRCc31 for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A191E4F317
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A191E4F317
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A191E4F317
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:52 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39973c72e8cso266019f8f.0
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185090; x=1743789890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQd6dTQHVE/lXYL6kA9TVQrpHNbdqX8Tb/OrsIkxdg8=;
 b=M9yOrgZizkERZ8c7oKQJpw9GIwfX+WR7MiIkx6eiL/ii+4BoCgD+hUmX4SLrQuYMQE
 BMatXSv/3aI5Hd6tKFHfiNeiNcj68dHQ4vs0sgDGk3taehBV/7uHiUG56C17IZ7J5wPk
 8/F6J0X1vizRitGodI5H2/X7yPR18GmDX1YxSdwAtDWLJVWhm68XlPRPYY6NnQ64AxLn
 845n1PuGBvjDofVhC+stOHXx3GP0n1KHnaT8lPC5vU23e1HWhNl6ETYjM2MdNVekA3mX
 t0313pU2+yNv104DiFvEv03rG0YSmFcwTiGWVjuzUiZBLreIKoTdjXE8Zf3FDRUrmw+h
 m1Iw==
X-Gm-Message-State: AOJu0YyFEYkMzyeMNG7fw+JW/XZSZFCVuBLC43fDefjv1yUcLBQaPdOI
 9W0RcyPmfap4U9y3PXVaWj+nfDYSJWo2GahmewCiD7RN/xRuiy5fdoowhS+3
X-Gm-Gg: ASbGnct+Zgixl95j246FSGyNW6DyJPlKLEmQmQdsnuu/wOR7CfY8qul4CYsoGlXGAPe
 gVbSnNCmu0j/309Ub1cmPkVuMAGsaJW4v3UPnAyCKcNp3HH4DmgW3Kwd2StGcBNodQeGWfaW/o7
 6r+eCI0ZYCR53xadRtHxZXKP7eap59FbxVWCFUUp4/9htS5aMhFX0uGJvtR41tPmvDs1+GvIEZ6
 h67U7R039eJW4GWoumuqEE9h8Atv2A6CfJeLzx4ak59HKazZRxsB+80zKl7BiZbw8x8gX1E59EI
 vPkQd2APdDZ84wLC9LkSjRq3XWwZIpDya9/Wow==
X-Google-Smtp-Source: AGHT+IF4cutItFw3siraXrTEI8cdXc4XUFqk143tq6II8RsS+9znsUFClcyrvhLJvmtJr6H2Mt/7GA==
X-Received: by 2002:a5d:5885:0:b0:39c:1258:17d6 with SMTP id
 ffacd0b85a97d-39c125818afmr1013f8f.15.1743185085297; 
 Fri, 28 Mar 2025 11:04:45 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:44 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:15 +0200
Message-ID: <20250328180427.3434693-8-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185090; x=1743789890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQd6dTQHVE/lXYL6kA9TVQrpHNbdqX8Tb/OrsIkxdg8=;
 b=ktNE4WfPCcT18bX+z9GTRim2Ccuy8TnSsuEX3Ig+HcTPRjE5YMPwnNgWk/vtQTXCQ3
 UV3an0/n3RmVAO85ILQzxCBAhcMb4IG70jfPlNHFdcFeBhJ7uueccJEjhwd5GcBCzkPv
 U38TkY0fPQcS06Ei82kwGXmHdsFSUSaBP+8LNV5Mai/yLha09vnzR2XeEWblgWKnvlK1
 MsBle9wkGK7s+FGmAAb/QY6/iTcVdnNWXgnmzvrjtNcIS5K7gytP+gIznZteIruCaPcH
 KCE0FZoGNhVa9ehUI8e8uNZQopW0RB9HRCfezthQ9Vjpb8QChi8RLiLdWpwbrm269r8I
 2v0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ktNE4WfP
Subject: [Buildroot] [PATCH v2 07/18] configs/ls1046a-rdb: bump BSP tag to
 lf-6.12.3-1.0.0
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest Linux Factory tag is lf-6.12.3-1.0.0 (Q1 2025), update to
that.

The LS1046A-RDB board is currently supported by NXP through a BSP
called LDLSDK. That isn't what we use, so update the documentation to
reflect that for awareness, and provide a link.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: patch is new

 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1046a-rdb/patches/linux/linux.hash      |  2 +-
 .../ls1046a-rdb/patches/uboot/uboot.hash      |  2 +-
 board/freescale/ls1046a-rdb/readme.txt        | 28 +++++++++++++------
 configs/ls1046a-rdb_defconfig                 |  8 +++---
 5 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 344a6299d88d..41c7ad4068a4 100644
--- a/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f03dad74e5c3df8059554def03e9298b6fbd4ffdd3e940a18b7e84a60b12a37a  atf-lf-6.6.52-2.2.0.tar.gz
+sha256  2751fcd3eb9080c34531f68ca2e1f571a60f4220853df53a5ebed9835abf8c13  atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/patches/linux/linux.hash b/board/freescale/ls1046a-rdb/patches/linux/linux.hash
index fa38fb1f75b1..43dbe074c2ec 100644
--- a/board/freescale/ls1046a-rdb/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-rdb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  5665b927616a7e27e69f3f8fface6dd693b01f35d42ae4f9a0f0a10be3621487  linux-lf-6.6.52-2.2.0.tar.gz
+sha256  9e2fff1014f1b196be8149c63a6054e40b1b36b222e53db3f445c96c856066e0  linux-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash b/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
index a1e3b693768d..5e36d9348789 100644
--- a/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  00fc7bd053de19d02c990b3aa214a27c6103f4306e756f3f6d4afb12314556e4  u-boot-lf-6.6.52-2.2.0.tar.gz
+sha256  8708fc95844d020f79b87f954f29073ae9b230de3e41117e7fb379294da946ac  u-boot-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/readme.txt b/board/freescale/ls1046a-rdb/readme.txt
index 1dc419d3b15d..72005b20d93b 100644
--- a/board/freescale/ls1046a-rdb/readme.txt
+++ b/board/freescale/ls1046a-rdb/readme.txt
@@ -8,15 +8,25 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
   - https://www.nxp.com/design/design-center/development-boards-and-designs/LS1046A-RDB
   - https://www.nxp.com/products/LS1046A
 
-for the NXP LDP (Linux Distribution POC), see
-  - https://www.nxp.com/design/design-center/software/embedded-software/linux-software-and-development-tools/layerscape-linux-distribution-poc:LAYERSCAPE-SDK
-
-the components provided by NXP are:
-  - rcw, lf-6.6.52-2.2.0
-  - atf (fork), lf-6.6.52-2.2.0
-  - uboot (fork), lf-6.6.52-2.2.0
-  - qoriq-fm-ucode (blob), lf-6.6.52-2.2.0
-  - linux (fork), lf-6.6.52-2.2.0
+Layerscape platforms are officially supported by NXP under the Layerscape
+Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
+common with i.MX), currently tag lf-6.6.36-2.1.0, two releases behind the
+latest lf-6.12.3-1.0.0.  In Buildroot, the latest Linux Factory release tag
+is used, which may be considered pre-release software, as it may contain
+features which are not yet documented, and it generally undergoes less testing.
+
+For the software Layerscape Debian Linux SDK User Guide, see:
+  - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
+  - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
+
+The components from NXP are:
+  - rcw, lf-6.12.3-1.0.0
+  - atf (fork), lf-6.12.3-1.0.0
+  - uboot (fork), lf-6.12.3-1.0.0
+  - qoriq-fm-ucode (blob), lf-6.12.3-1.0.0
+  - linux (fork), lf-6.12.3-1.0.0
+  - fmlib, lf-6.12.3-1.0.0
+  - fmc, lf-6.12.3-1.0.0
 
 Build
 =====
diff --git a/configs/ls1046a-rdb_defconfig b/configs/ls1046a-rdb_defconfig
index dd03d59993ef..1528dfdd8152 100644
--- a/configs/ls1046a-rdb_defconfig
+++ b/configs/ls1046a-rdb_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1046a-rdb/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="ls1046ardb"
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-rdb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.52-2.2.0)/linux-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.3-1.0.0)/linux-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.52-2.2.0)/atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.3-1.0.0)/atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.52-2.2.0)/u-boot-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.3-1.0.0)/u-boot-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
