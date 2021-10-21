Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60ADC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 17:07:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32E5A61A09
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 17:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32E5A61A09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F252240733;
	Thu, 21 Oct 2021 17:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id neFhTwbSMrHu; Thu, 21 Oct 2021 17:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDC7540735;
	Thu, 21 Oct 2021 17:07:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44E331BF429
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 17:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D26C83D2C
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 17:07:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzxlglyFZkkV for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 17:07:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87F8783592
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 17:07:29 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dbXLm817krIRldbXLmXNHq; Thu, 21 Oct 2021 19:07:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634836047; bh=tvD3/CXrIBWWBlAHAGNIAxm+PM5BU9ZVZEAfGxPsdIc=;
 h=From:To:Subject:Date:MIME-Version;
 b=gx/mahTf81Mb00z+p91PTsS29hxz3RTSqix0vYH8Akgosn2GTGZzaU2ztOyv4AhYB
 dE/MSo2f6Va8mGEiRwhaSfNmkpC8a1dnlTkahboTdIuDjFTLaPKH5QOUiLpxF4Xhsf
 i/lB7Edpm68zHJeUAxXQ+JEdSaR48C7hSAyzTksD10628QXuRUg0xitC47RMFAqxfb
 PFzM+fx1NP1xhCmIUs56Gj9QnWTCQSz5H6Y55hGi36JKPuJ8aKi1OkhggK/U61rdlh
 06tAzee5SuY53e2WxaSXj0zo4GO1lEvSZncaUoVvRjw+nXcC5gfPvpujmk0LOxu6xA
 Diu+v7BIAkejQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 19:07:26 +0200
Message-Id: <20211021170726.37557-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <09658CF6-9EBF-487E-8FC3-EC67305CFFD1@benettiengineering.com>
References: <09658CF6-9EBF-487E-8FC3-EC67305CFFD1@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKQts5r4QlfEya6swARv8551/m8GN16bBsR9GI/L+zEvTqPBQPErGLv7iUbJJBMWgslFi14NCiChgH3JGLGgT14s39Zs4DG/gZrQG7cHlFhLqokCzZw2
 f/zvg4oKV6G7CdLsoEBvfzUDXFvSFiLasrBtkYwtiWxs8pGWb2ZkZ844y75E80D2z9OmmR2Q7QQgd/06BzKNaJUKf79ZpoNSIrQtHXhfzT50QbkbtGth5cPr
 tEdPu7pSwmkoMwGwRUInxcF3BUHUCmE3CEBC9Ps07+wZXJqEOGddhspw/xfA+twKiiQRqMNqqNqfTSCxfYIYzQ==
Subject: [Buildroot] [PATCH v2] configs/asus_tinker_rk3288: bump to Linux
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
 configs/asus_tinker_rk3288_defconfig          |  9 +++--
 2 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 board/asus/tinker/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch

diff --git a/board/asus/tinker/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch b/board/asus/tinker/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
deleted file mode 100644
index 64a147c09e..0000000000
--- a/board/asus/tinker/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
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
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index e95a19a757..609d061b61 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -3,14 +3,14 @@ BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -22,7 +22,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
@@ -43,4 +43,3 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/asus/tinker/genimage.cfg"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/asus/tinker/post-build.sh"
-BR2_GLOBAL_PATCH_DIR="board/asus/tinker/patches/"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
