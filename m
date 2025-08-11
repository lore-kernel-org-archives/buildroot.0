Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23721CA0ED3
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC60383F10;
	Mon, 11 Aug 2025 16:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id munlMdQ1CKH9; Mon, 11 Aug 2025 16:56:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA38683F1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA38683F1C;
	Mon, 11 Aug 2025 16:56:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27670154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E4AB40E3F
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezR8fSGq7o82 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCC2140E3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCC2140E3C
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCC2140E3C
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-af95a5989a2so59790666b.3
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931365; x=1755536165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UbBKySnvtV8tGlmymcMWPPwbAmlmsH5mIeWolr9kAUM=;
 b=tspFWx8SYyGcUXKfwL8praU9xUUg7JYXcQVbqg25H+NSc4sjbvLfpTKKRM46oZWfq4
 AZngTSgBzxVqohEvp6WnDz4f0tphIT65sAEUZ3rZ4sZQp4OFYRmk1ccTZHflxd4S/+mp
 MFyBoBaJoyPc1hMCxcPW1qjYF8idF3rgLj8ZQNeFhbo4X0f6F1jlISI8gfliUPhosbIe
 Hgp5FhV6gXrqpj5BM1NL/kZJpf0Bu3GGlKbsvGkM0lvPZu7aK+RntG/mGpmGGMAa0JyG
 dzQTc13gfwW9oD+b08sQZiBIcVYX8fLd5r8xxCw1oSfMF9j850e9CjMyv8NMSamxgoZE
 7LTA==
X-Gm-Message-State: AOJu0YwkSNajGGJMZPMlVzzl/JnYjXfFg+eEL84vfnqe9SplDfJrpa3v
 V0iiFbvE3cvUet55TYjk8QW2/j64je9PXFb3CsYV3H9lEI/ox9ny6Lsqgrjtzg==
X-Gm-Gg: ASbGncvtPktHbx8Z2S4fEc7QFE3gdGVtT8pTiOFgkK7yyoLUEn33izAlHLWPoPsN2ck
 V9C20XOHzfeFKNbNr6xe17JTfxmV8UH0WENsJW+Ckjrg4HtZHVSyCFBDQ8rB2Tn7/AiUDR3OzrK
 0d/oms/SbzTTg6RyxiaGZLEnCPNzgrUCXLBDb9Z8aEgj1Chdol0udgCagrruj9/QjhMGRdoKYIC
 0GWhEwiM8UQ3l4xQFbqC9z+3VFtUi7NA/Qj0BANwPUxwHPQnMt+tO5ZmL9O3M93jy5Az99YYwMk
 dwtyfTsmtqq6aDYZb5KoYFMMdZ0t+bZu7XRe8ld0z/T0My/ylcRPqaMFt7Fx3rJrBpNUm12mcpW
 eJlGxRLVd9hJG5H/+LPI=
X-Google-Smtp-Source: AGHT+IESoe9jGcvSJ9UeXVXAan4Y9ODhrL4hYCz4q5N6NaffpKD2npWTpBrTWHUsNJ+JVd/hVGp9Yw==
X-Received: by 2002:a17:907:9482:b0:af9:3c7f:7447 with SMTP id
 a640c23a62f3a-af9deaad890mr373337366b.2.1754931365181; 
 Mon, 11 Aug 2025 09:56:05 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:56:04 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:29 +0300
Message-ID: <20250811165531.1533913-10-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931365; x=1755536165; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UbBKySnvtV8tGlmymcMWPPwbAmlmsH5mIeWolr9kAUM=;
 b=HsxfBOmvjxcWXr3loz9LR8HMp51sNWjI88Exxt8AIOqomWrI/4knnCvp1/b36X1Tj7
 w5gSKwULylezYwYGXdvD+niWPDoiGRsqag54MSlVUy49iR4Y0s85PdRv1UlflhrFIbz5
 qUaNRo/shPkjz58q1PqTgWnmHpUCmLN7i3y0lN9WIGJihKGmCQun56ceX5Wi+thvGqsD
 QNvzJDQI6xSyo1H30QuxEw+Xh3x/V81HFTerI679TcgViOKP++XHzCWc5Hv1/PxAXiSD
 MBwHv6X92ZyHqOIeV/Klm/1KC20zlzJL5lXpmHbrid7axia8hWsxoNl9GJEZgNv8nD54
 VFTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HsxfBOmv
Subject: [Buildroot] [PATCH v3 09/11] configs/ls1046a-frwy: bump BSP tag to
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
the LS1046A-FRWY to the latest Linux Factory release.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: patch is new

 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1046a-frwy/patches/linux/linux.hash     |  2 +-
 .../ls1046a-frwy/patches/uboot/uboot.hash     |  2 +-
 board/freescale/ls1046a-frwy/readme.txt       | 23 ++++++++++---------
 configs/ls1046a-frwy_defconfig                |  6 ++---
 5 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 41c7ad4068a4..c05084df7660 100644
--- a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2751fcd3eb9080c34531f68ca2e1f571a60f4220853df53a5ebed9835abf8c13  atf-lf-6.12.3-1.0.0.tar.gz
+sha256  738f029c6bfcdac5649e2c252970b1f44c1ce7fee9fe4657a25edc666375ffa8  atf-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
index 43dbe074c2ec..3aea05469cc0 100644
--- a/board/freescale/ls1046a-frwy/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  9e2fff1014f1b196be8149c63a6054e40b1b36b222e53db3f445c96c856066e0  linux-lf-6.12.3-1.0.0.tar.gz
+sha256  c98177e85ace6400b06301101af3065e90463920c3e166da4ed22deffe960fb8  linux-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
index 5e36d9348789..1072686160f5 100644
--- a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  8708fc95844d020f79b87f954f29073ae9b230de3e41117e7fb379294da946ac  u-boot-lf-6.12.3-1.0.0.tar.gz
+sha256  a39f7db3ffd2b7263ea5d02b0631decac1c89f7c1b96b77ba8e302f3641a3eb3  u-boot-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index 8c83a4eac94d..79a2ecdecf20 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -11,23 +11,24 @@ For more details about the board and the QorIQ Layerscape SoC, see the following
 
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
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 0e6f1cd941b5..25524df623a2 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-frwy/genimage.cfg"
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
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046afrwy"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.3-1.0.0)/u-boot-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.20-2.0.0)/u-boot-lf-6.12.20-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046afrwy_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
