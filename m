Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FF3C282CD
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9298841462;
	Sun,  2 Mar 2025 21:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6eJx8sxrkhpr; Sun,  2 Mar 2025 21:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F26DD4143E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26DD4143E;
	Sun,  2 Mar 2025 21:53:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 039BF958
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1853783FB0
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HP4vGahiSmCt for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3089B83FF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3089B83FF2
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3089B83FF2
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:00 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38c62ef85daso499712f8f.3
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952378; x=1741557178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l4NlkjE+9CQWwwlNG5bcCB4Them3PAOJqpi58FZwT/I=;
 b=Du3FYigFQeO7l1uzm0V4Q5iuM1T0wFRAcVoRcJdvBD/DGUYlj8iHUCio9H0daPX0YG
 dvPMuGiJFlYV8g0QaA+rlusIkzza3Ixjv2m2CadIQ5ILDeMyAeCMfVRWM3gawuxvE9ZO
 CugPpf0qvJ1d2rn3iZycx+cvxYlwFAvkagJGydMHOIpFBIfgL7l91/NeI9NkFgjya7ww
 0bw6QcjuC/dzQasy81hYWBhXj5aU5J4QBjQBOF6683u6QDiVlLJDM0v9lml2w8kC456t
 cuLAZpLWYrDtKaoGmCGVVNR00QmkfYueHyTc3somiNzww7wgwAy15i1XFM5dCpGQvGYv
 /p7A==
X-Gm-Message-State: AOJu0Yy6Z9ZXiVUBV7W2g2SJhb/FKYMWaPCwuPVdwGCWuPuNxsXr3PUZ
 e2al7Fpe6REsD5c7nQ6w3uszBQo+j7dz7TKCQZBvJPkTrfYCuoctTHS4naFM
X-Gm-Gg: ASbGncvjbdw7gbCFpz+XrxZzSE7J5vwbuPD+wLp4nT7tHhG+jqSpO2CL58fYSoUZiAo
 kdto9CScoCnPz/jIv+YJQH5TFunUFuBA0XGDaoRgZ76wqV5tGtMOVaUfFQ7jZD8XcmxaMiOu66+
 +lo1mmmIVqSs5Odmc8L7xwjLyKFu8/d8THCQLxGrUUNCU2mf3xDlxO6hevItCAoPjVulg2a+GyR
 WLzmVLPw22LZTjzKH895Qj8LVDf+VzTV9Kw4ZJBuVkauk83qy+kYl9ghPdPNSvujbW4YCcDRhMA
 pRGhAEbDsnA9cOwMNOGT65QaeuCvLvhsDqS2VA==
X-Google-Smtp-Source: AGHT+IGvDE3AZc6nJmFXM7au6NWc8u43G9zMKPYPj3NIFth7kxPxWIJDIPnhqJRjONV/IleK6hIPgw==
X-Received: by 2002:a05:600c:a01:b0:439:9a40:aa1a with SMTP id
 5b1f17b1804b1-43ba675b15amr37397465e9.6.1740952377483; 
 Sun, 02 Mar 2025 13:52:57 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:56 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:15 +0200
Message-ID: <20250302215219.1276480-12-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952378; x=1741557178; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4NlkjE+9CQWwwlNG5bcCB4Them3PAOJqpi58FZwT/I=;
 b=U/xOcRE89SHkBiD3XrJgGO5397SWexl01gd7pQr+QeLgdL9JP2tXGAQxLqJj6SoA2M
 D2vrtI49znIYieq5BeszC9wVBPxwcrqHoHCIE7S2/cwznovLHyTL873a7kWi+qAm8r04
 HoJciG05FW3K+DIbXhcwcfte7Bg22lunrO0kSZZuIo/QL65y0N28faJ0XdexZ8pAU8mb
 ALGcYNSmJU7pptZYxMnSNQQQi9bJVfV3IlyvGQ4UZso8C53Fd3GwBE+pRYCfOTArbIIM
 0tDwuSpzE+ru88tHggN47K395w2Ag+bhqe6pf0pHgS9xixhnK/4OBser/ZXTYyh+J+tA
 ALfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U/xOcRE8
Subject: [Buildroot] [PATCH 11/15] configs/ls1046a-frwy: update to tag
 lf-6.6.52-2.2.0
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

Update the kernel, U-Boot, ATF tags, as well as documentation, used by
the LS1046A-FRWY to the latest Linux Factory release.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
- Break out LS1046A-FRWY defconfig changes out of larger "[PATCH v2 01/11]
  platform/layerscape: bump Linux Factory tag to lf-6.6.36-2.1.0" patch
- Bump to lf-6.6.52-2.2.0 instead of lf-6.6.36-2.1.0 (new tag appeared
  in between)

 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1046a-frwy/patches/linux/linux.hash     |  2 +-
 .../ls1046a-frwy/patches/uboot/uboot.hash     |  2 +-
 board/freescale/ls1046a-frwy/readme.txt       | 31 +++++++++++++------
 configs/ls1046a-frwy_defconfig                |  6 ++--
 5 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index f9af28ab3cf5..344a6299d88d 100644
--- a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4f4dc78bfb5b7391a65ae0f83856661071f666ac2bf6a9380fddbe376a8bdaaa  atf-lf-6.6.23-2.0.0.tar.gz
+sha256  f03dad74e5c3df8059554def03e9298b6fbd4ffdd3e940a18b7e84a60b12a37a  atf-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
index e038c2286237..fa38fb1f75b1 100644
--- a/board/freescale/ls1046a-frwy/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6d592722e004516309f8ce33e654f1322e4d1f0f33567acb86ca19229176fd9e  linux-lf-6.6.23-2.0.0.tar.gz
+sha256  5665b927616a7e27e69f3f8fface6dd693b01f35d42ae4f9a0f0a10be3621487  linux-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
index a5ccd82b2b0d..a1e3b693768d 100644
--- a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a2bcd7a34d4908ffbadfea731d0f0fd20f19a31cff6ff6310980e7f6743ceb24  u-boot-lf-6.6.23-2.0.0.tar.gz
+sha256  00fc7bd053de19d02c990b3aa214a27c6103f4306e756f3f6d4afb12314556e4  u-boot-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index 4d1e0e1dcd9c..8c638b4c96a8 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -4,20 +4,31 @@ NXP LS1046A-FRWY
 
 This file documents the Buildroot support for the LS1046A Freeway Board.
 
-for more details about the board and the QorIQ Layerscape SoC, see the following pages:
+For more details about the board and the QorIQ Layerscape SoC, see the following pages:
   - https://www.nxp.com/design/software/qoriq-developer-resources/ls1046a-freeway-board:FRWY-LS1046A
   - https://www.nxp.com/FRWY-LS1046A
   - https://www.nxp.com/docs/en/quick-reference-guide/FRWY-LS1046AGSG.pdf
 
-for the software NXP LSDK (Layerscape Software Development Kit), see
-  - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
-
-the components from NXP are:
-  - rcw, lf-6.6.23-2.0.0
-  - atf (fork), lf-6.6.23-2.0.0
-  - uboot (fork), lf-6.6.23-2.0.0
-  - qoriq-fm-ucode (blob), lf-6.6.23-2.0.0
-  - linux (fork), lf-6.6.23-2.0.0
+Layerscape platforms are officially supported by NXP under the Layerscape
+Debian Linux SDK (LDLSDK). This uses components from Linux Factory, currently
+tag lf-6.6.36-2.1.0, one release behind the latest lf-6.6.52-2.2.0.
+In Buildroot, the latest Linux Factory release tag is used.
+
+For the software Layerscape Debian Linux SDK User Guide, see:
+  - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
+  - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
+
+Note: the latest Linux Factory release may contain features which are not yet
+documented in the LDLSDKUG.
+
+The components from NXP are:
+  - rcw, lf-6.6.52-2.2.0
+  - atf (fork), lf-6.6.52-2.2.0
+  - uboot (fork), lf-6.6.52-2.2.0
+  - qoriq-fm-ucode (blob), lf-6.6.52-2.2.0
+  - linux (fork), lf-6.6.52-2.2.0
+  - fmlib, lf-6.6.52-2.2.0
+  - fmc, lf-6.6.52-2.2.0
 
 Build
 =====
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 2cf0f9c8bc50..52d8f0cc07bb 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-frwy/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.23-2.0.0)/linux-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.52-2.2.0)/linux-lf-6.6.52-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.23-2.0.0)/atf-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.52-2.2.0)/atf-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046afrwy"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.23-2.0.0)/u-boot-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.52-2.2.0)/u-boot-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046afrwy_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
