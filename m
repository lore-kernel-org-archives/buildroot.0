Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663A1C36013
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BC144F2F6;
	Fri, 28 Mar 2025 18:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2T6hxMwg_cc1; Fri, 28 Mar 2025 18:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A72D4F2E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A72D4F2E6;
	Fri, 28 Mar 2025 18:04:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE49112A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E04827088B
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFz3mSe3I4x6 for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B566C70451
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B566C70451
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B566C70451
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3912622c9c0so236819f8f.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185082; x=1743789882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DaFDrFrxRBTFRahMxV2vn7FOcmtPCdkPefEehtxn0OM=;
 b=LV9Mx9iR0yLkWx2We70ToaWCK/Kw0lqQPzIz7aeQgGPbWEwdhYzFZ5unT/SNshrGEh
 araq8bkI3NuaG8VqDu2Jh5Ok8Zd7faoUtZqAk+MrsUmzcvNZmDGWL/LkjpxEMYR0hWrp
 bvmjEqCv+NPvjwwPrbQHPsB+ho4hpLtcK2BxIkE9sbEncfSB9jFOsgLhyP8tNb7Woy+G
 prO0j00HGG/sGR/FdDgvuOMNkZRKa8BJc/A0piNeCbVUn9r9pD785eS+ku7Vn1dzLsCo
 gDk0qo8SuFvTUsjPWyKRhPMDTd/rIR2frj9524kVYnIfHj+v/95v4DiaXq76W5apliuX
 CVtg==
X-Gm-Message-State: AOJu0YwAm61ZUGat98b8/8hE1Vt8VyoOJwC7ksUH0qCzmApnafazoEYz
 4d5FsM1EoAIztDohODjGjubgmnSsg78jH4TFXq+57ZaDVLtKovEi7sYQB6ST
X-Gm-Gg: ASbGncsij2KQYLL/IX5Qy5nTmtLrQoDI6VAxqoiBElujla0yv/toz4Ez1yqf9jAgFGi
 /Ay3LWIwcpD2QQLJPyQePDQgrWVSf2vB/I4XNB3T87G+iuVH5F5R/UGD4Lubrjvs71hPpSYYPyB
 +0crFWzB7yy2iOAX/ueQX4QPf8ZqAmCFc5WfDsg2ft4+6/P3rz8SBIMMG4EV00436TeviH9APap
 GvCZ+LhilWhcr1NJlELkzhBe2mYNLaRb7u9+xDvi0BeCo6hmVMUuOu3VB18+wRg4zGdDqPoK3Pb
 w658EgkVu/rsAJyJr70WhUyhr6A3fQooHUh0X+jjM+qPAsV+
X-Google-Smtp-Source: AGHT+IE5m32xaZp173dPMTwu8JL3c2ZmY3/h70vzPwsoEWwMXc9UMHtvarYv6CenaTjsCrMrdw5Dhw==
X-Received: by 2002:a05:600c:4712:b0:439:9ec5:dfa with SMTP id
 5b1f17b1804b1-43dbc6f9e98mr1178985e9.7.1743185082154; 
 Fri, 28 Mar 2025 11:04:42 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:40 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:13 +0200
Message-ID: <20250328180427.3434693-6-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185082; x=1743789882; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DaFDrFrxRBTFRahMxV2vn7FOcmtPCdkPefEehtxn0OM=;
 b=FjSIuGIC5kzedqAadiKuh7pukr4qBpc54KXf9W9Oj1FwBQ3MU2XLbDo+Tyy9XbSpRR
 OVOkPSH9uU8QBf1LHInijfoTaDNurrU+BwB8WagGEaOj2TkXOsg+bPlHWD1ZoPHajhpA
 k36yFEEcT+LA9fLNE8cE3jHfysUwJ/t417zohk+X6BDzyxHvT4ldDg6SQPDTzVQoPYVP
 0EbG/j4oHwkKDAJUgvDQ7Pinm8Idw96x8LCJRkoKoxg2kaSa7+ccg484L+eg7r9Dh3rA
 W+dHTNHof+kYnW4Vcb3R4awBcgl7xKAsQV6CWicEF5HzATbZ+ORrswnbsBCutsr3pqWc
 i9mg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FjSIuGIC
Subject: [Buildroot] [PATCH v2 05/18] configs/ls1028ardb: update to
 lf-6.12.3-1.0.0 tag
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
the LS1028A-RDB to the latest Linux Factory release.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: update to the now newest BSP tag

 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1028ardb/patches/linux/linux.hash       |  2 +-
 .../ls1028ardb/patches/uboot/uboot.hash       |  2 +-
 board/freescale/ls1028ardb/readme.txt         | 28 ++++++++++++-------
 configs/ls1028ardb_defconfig                  |  8 +++---
 5 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index f9af28ab3cf5..41c7ad4068a4 100644
--- a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4f4dc78bfb5b7391a65ae0f83856661071f666ac2bf6a9380fddbe376a8bdaaa  atf-lf-6.6.23-2.0.0.tar.gz
+sha256  2751fcd3eb9080c34531f68ca2e1f571a60f4220853df53a5ebed9835abf8c13  atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/linux/linux.hash b/board/freescale/ls1028ardb/patches/linux/linux.hash
index e038c2286237..43dbe074c2ec 100644
--- a/board/freescale/ls1028ardb/patches/linux/linux.hash
+++ b/board/freescale/ls1028ardb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6d592722e004516309f8ce33e654f1322e4d1f0f33567acb86ca19229176fd9e  linux-lf-6.6.23-2.0.0.tar.gz
+sha256  9e2fff1014f1b196be8149c63a6054e40b1b36b222e53db3f445c96c856066e0  linux-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/uboot/uboot.hash b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
index a5ccd82b2b0d..5e36d9348789 100644
--- a/board/freescale/ls1028ardb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a2bcd7a34d4908ffbadfea731d0f0fd20f19a31cff6ff6310980e7f6743ceb24  u-boot-lf-6.6.23-2.0.0.tar.gz
+sha256  8708fc95844d020f79b87f954f29073ae9b230de3e41117e7fb379294da946ac  u-boot-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index 6633d60b9013..8be720a80390 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -4,19 +4,27 @@ NXP LS1028ARDB
 
 This file documents the Buildroot support for the LS1028A Reference Design Board.
 
-for more details about the board and the QorIQ Layerscape SoC, see the following pages:
+For more details about the board and the QorIQ Layerscape SoC, see the following pages:
   - https://www.nxp.com/design/qoriq-developer-resources/layerscape-ls1028a-reference-design-board:LS1028ARDB
   - https://www.nxp.com/LS1028A
 
-for the software NXP LSDK (Layerscape Software Development Kit), see
-  - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
-
-the components from NXP are:
-  - rcw, lf-6.6.23-2.0.0
-  - atf (fork), lf-6.6.23-2.0.0
-  - uboot (fork), lf-6.6.23-2.0.0
-  - cadence-dp-firmware (blob), LSDK 20.12
-  - linux (fork), lf-6.6.23-2.0.0
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
+  - cadence-dp-firmware (blob), 8.16
+  - linux (fork), lf-6.12.3-1.0.0
 
 Build
 =====
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index 0d1843bf5fce..5ee2911cc0f0 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1028ardb/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="ls1028a"
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.23-2.0.0)/linux-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.3-1.0.0)/linux-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.23-2.0.0)/atf-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.3-1.0.0)/atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.23-2.0.0)/u-boot-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.3-1.0.0)/u-boot-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1028ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
