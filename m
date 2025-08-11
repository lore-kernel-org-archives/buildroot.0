Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A89ACA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CB9183F31;
	Mon, 11 Aug 2025 16:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcboE-H5Y95t; Mon, 11 Aug 2025 16:56:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE97583F16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE97583F16;
	Mon, 11 Aug 2025 16:56:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 181FF154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09EDE40A50
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIvcBDHNtoCw for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D62A94012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D62A94012B
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D62A94012B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:01 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-615877015daso747713a12.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931359; x=1755536159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0qUh61kUgD5fvGGTQs/8hLzQlioB+F7VVJJ9UcXEok=;
 b=X5ZxHWbPPhyA1dhUGbQLzcHJ35n5DawPdBsEqbJBqXUZA+Na0EaxW5XJFCUZGVjtN/
 4V/jBQ+qNFw3RDmNHD8wrjHicQ6Nh3CYocAt96tpMOX5TpOUkqX50T+hDtTkIu8wdU+2
 ni4bZ7RsBhOvZQm5IrXpEiPtNGRmPGI5AORhTbyu/3JxpM9HPcK8uD9wCCQznvthr+JV
 DNptuAKW+7te3aGT3dhIgg5Jr/9BWclXQ72fVe4uDUeaub1ypo1Rl33MFLrXCVjpb+R0
 fWokgkYiPsRWUDHRhey/QOr8TQYNPSxkMrhXYySwnL5T6dtNCIt/WqFqVR62rcYpYkXt
 g7fA==
X-Gm-Message-State: AOJu0Yw8XMqASlEjjhOr9+IVirfA12Lc5nZD9aCHm+elEGfE0XowbtOx
 biGiWy5UPl2scXmuxp8gA3x/gb8HXyqj4vEYMww1yOzQdkpgUGgXVVlTiKAWxg==
X-Gm-Gg: ASbGnct1+Vu7B+xd54iskwVsY5KZZtOWgZMv2ODOww6upfHHJYQAn2LznQKbxfX/Gwa
 wy7J+gLnsjm6XIJlAx3Ok7q0rVq6ZZy+vgmn9+bN9aUmQuhA24BxTfH7cgekQi79AW9u4pvdatj
 d/tcmRXo8h4rERm0TFlLe07h+22N6C4IzRr9UgchHa5JJ7VOBwf20HXyvQ9/6eguN0+Sy2ktdyk
 ZOgqKdiS/FO+iQ95rD9hH+Qb9T/ktkVoUG1Ny5/hklOqxpU0pP6NaTLC6vTImMXa9oysK5/LWXD
 zm5jiIe05w3yKFqSpjasazD8G8IHUF69rP95cLAiw8xB0RxI+otC7AGwV/TfDiNh2ll5afdPT0w
 w1LVO3ztkY+PeAhuYtgI=
X-Google-Smtp-Source: AGHT+IFwWo23xcjMFGdsul0FvSLnQc1hnOgjR+OjTS56zPmB6IDxHXoW1VqbKfzb+YsOBU/dHRnJ1A==
X-Received: by 2002:a05:6402:210a:b0:617:b5bf:f03f with SMTP id
 4fb4d7f45d1cf-61805a8e07fmr3914934a12.4.1754931359174; 
 Mon, 11 Aug 2025 09:55:59 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:55:54 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:26 +0300
Message-ID: <20250811165531.1533913-7-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931359; x=1755536159; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x0qUh61kUgD5fvGGTQs/8hLzQlioB+F7VVJJ9UcXEok=;
 b=ccvskMzhniDH9Uk79emtuO5vOPTxfPENBm+/NCaBFuCRlfO/Z0nZ22oW+gx7AjvPiP
 qMZWf8B6oWWXUPhXjTMqx9HOlx1cAD5EtD13n8cAFNX31aDUDk+l2ukIIbJ+TA6FEB+I
 RQDZBY38QXpQTRCUIf1Dgm78jXr3VjPCSnrxKwP4YjymGV+2YCJF8PLqFbCad7Xv/1H4
 vLIGnU4V6izeArqpAnKOiquDnNKyjC2fJcqSdY+wJowKm9KiuUDF3vwHNgFNt9dCRsF3
 vs4N4513c/caFplEFyyXzZ+I9q4IFYBv/ciDTGe5lhfhEb+jCTY2vEbf2k+kU+wFCgha
 2wMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ccvskMzh
Subject: [Buildroot] [PATCH v3 06/11] configs/ls1028ardb: bump BSP tag to
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

 .../arm-trusted-firmware.hash                   |  2 +-
 .../ls1028ardb/patches/linux/linux.hash         |  2 +-
 .../ls1028ardb/patches/uboot/uboot.hash         |  2 +-
 board/freescale/ls1028ardb/readme.txt           | 17 +++++++++--------
 configs/ls1028ardb_defconfig                    |  6 +++---
 5 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 41c7ad4068a4..c05084df7660 100644
--- a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2751fcd3eb9080c34531f68ca2e1f571a60f4220853df53a5ebed9835abf8c13  atf-lf-6.12.3-1.0.0.tar.gz
+sha256  738f029c6bfcdac5649e2c252970b1f44c1ce7fee9fe4657a25edc666375ffa8  atf-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/linux/linux.hash b/board/freescale/ls1028ardb/patches/linux/linux.hash
index 43dbe074c2ec..3aea05469cc0 100644
--- a/board/freescale/ls1028ardb/patches/linux/linux.hash
+++ b/board/freescale/ls1028ardb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  9e2fff1014f1b196be8149c63a6054e40b1b36b222e53db3f445c96c856066e0  linux-lf-6.12.3-1.0.0.tar.gz
+sha256  c98177e85ace6400b06301101af3065e90463920c3e166da4ed22deffe960fb8  linux-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/uboot/uboot.hash b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
index 5e36d9348789..1072686160f5 100644
--- a/board/freescale/ls1028ardb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  8708fc95844d020f79b87f954f29073ae9b230de3e41117e7fb379294da946ac  u-boot-lf-6.12.3-1.0.0.tar.gz
+sha256  a39f7db3ffd2b7263ea5d02b0631decac1c89f7c1b96b77ba8e302f3641a3eb3  u-boot-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index 8be720a80390..28b8fdff3ad2 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -10,21 +10,22 @@ For more details about the board and the QorIQ Layerscape SoC, see the following
 
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
+  - rcw, lf-6.12.20-2.0.0
+  - atf (fork), lf-6.12.20-2.0.0
+  - uboot (fork), lf-6.12.20-2.0.0
   - cadence-dp-firmware (blob), 8.16
-  - linux (fork), lf-6.12.3-1.0.0
+  - linux (fork), lf-6.12.20-2.0.0
 
 Build
 =====
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index aaba73faa885..971cdff94057 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.3-1.0.0)/linux-lf-6.12.3-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.20-2.0.0)/linux-lf-6.12.20-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -26,7 +26,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.3-1.0.0)/atf-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.20-2.0.0)/atf-lf-6.12.20-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -36,7 +36,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.3-1.0.0)/u-boot-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.20-2.0.0)/u-boot-lf-6.12.20-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1028ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
