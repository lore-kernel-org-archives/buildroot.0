Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84722C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 17:08:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 051B861A07
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 17:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 051B861A07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C815740735;
	Thu, 21 Oct 2021 17:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCpVjYSSkmBP; Thu, 21 Oct 2021 17:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9D2240743;
	Thu, 21 Oct 2021 17:08:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62B2C1BF429
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 17:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F8B48356C
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 17:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DABkZENY32E8 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 17:08:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id D984B83A8F
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 17:08:07 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dbXym55AWnxSqdbXymAQaR; Thu, 21 Oct 2021 19:08:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634836086; bh=VYTEbWBkMEv5dJEQJLLKKQtbVZhmmg6hBI3bDAiNBQ0=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZnwrGz7YVfE+Q+0IKYz+kef2OrsFJx5c0u4rVwFQKwMpRR9FHszIfTOLF+Q13eQQB
 eftazDk79/6+ha8oU+zjRBW8OviroeBTASOfqaboSC6c2irDpMJWE0IOt4WofypRJx
 Ma4eeP3g0CmC8WK5nj7EygRsssryo+FtJNXeBnuWWub7ucha2eJrfJGzYv3QyfTkeH
 AMZXaPTVELOWXicOQqSpOEAp19qg1x/hv7iJpNlrD6f/0R7FNnDY/oyCQCoaT2Z7+z
 7KK+IUpw6dwTE6f/MF/iNSDqa57YwULUU7XFVQA0RetQzqRSCQLNwiMASDKmxZ8DzU
 MDm6YubPLoJmg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 19:08:04 +0200
Message-Id: <20211021170804.37638-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CB281AC4-7CA2-4C41-9175-CF752DB29CE7@benettiengineering.com>
References: <CB281AC4-7CA2-4C41-9175-CF752DB29CE7@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAgX9hQAiPH0gbRH0bZzxZsMWiUvxwURHQFs0fn+Zh9KZuxOZKn1NJ8FdCvJz40OYmkG3Uwar6hlfkjhprK+iuNW7yyDAb6ytR22921Vf1cOHELMHzPX
 cYog9n5N9gA4ZNogmSS1HLcYbhst+QDzpGncmbCY/uQQt/uZfHodzkKhHCHhFD/rfDvWzFxUGQxkiXLzMbuV09c/OMRGgVhszG+/5azdKXI6LKe3Rvn8UrAg
 tLKk/cHLf6x0ES0eEsLqkk8p5npnmRkO/8ufYUjMnHjzMi2bxbUjW3dLBzrTayAFnAJH0x424lSWWmNl5Xpemg==
Subject: [Buildroot] [PATCH v2] configs/amarula_vyasa_rk3288: bump to Linux
 kernel 5.14.13 and u-boot 2021.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bumps to linux 5.14.13, linux-headers 5.14 and u-boot version
2021.10 and drop local uboot patch where CONFIG_SYS_BOOTM_LEN was set to
16MB because on u-boot 2021.10 it's now set to 64MB as default to make
room for Linux images.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* use latest stable Linux version 5.14.13 instead of 5.14
---
 ...Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch | 35 -------------------
 configs/amarula_vyasa_rk3288_defconfig        |  9 +++--
 2 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch

diff --git a/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch b/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
deleted file mode 100644
index 64a147c09e..0000000000
--- a/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8ee2b03039cccf64402a72dea2185d7fe1972729 Mon Sep 17 00:00:00 2001
-From: Shyam Saini <shyam.saini@amarulasolutions.com>
-Date: Mon, 15 Apr 2019 16:16:16 +0530
-Subject: [PATCH] include: configs: Increase CONFIG_SYS_BOOTM_LEN to 16MB
-
-The default value of CONFIG_SYS_BOOTM_LEN is 0x800000 i.e, 8MB which
-causes board reset because of larger uImage size.
-
-Error log snippet:
-   Booting using the fdt blob at 0x1f00000
-   Loading Kernel Image ... Image too large: increase CONFIG_SYS_BOOTM_LEN
-Must RESET board to recover
-resetting ...
-
-Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
----
- include/configs/rk3288_common.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/configs/rk3288_common.h b/include/configs/rk3288_common.h
-index 72a54bc0ab..eab7cf4d86 100644
---- a/include/configs/rk3288_common.h
-+++ b/include/configs/rk3288_common.h
-@@ -9,6 +9,8 @@
- #include <asm/arch/hardware.h>
- #include "rockchip-common.h"
- 
-+#define CONFIG_SYS_BOOTM_LEN (16 << 20) /* 16MB */
-+
- #define CONFIG_SKIP_LOWLEVEL_INIT_ONLY
- #define CONFIG_SYS_MALLOC_LEN		(32 << 20)
- #define CONFIG_SYS_CBSIZE		1024
--- 
-2.11.0
-
diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 3b12da077c..916a639387 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -3,14 +3,14 @@ BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
@@ -22,7 +22,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
@@ -44,4 +44,3 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/vyasa/genimage.cfg"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/vyasa/post-build.sh"
-BR2_GLOBAL_PATCH_DIR="board/amarula/vyasa/patches/"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
