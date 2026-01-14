Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A58D39016
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84F4060D6F;
	Wed, 14 Jan 2026 19:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7bkVb-JjbHi; Wed, 14 Jan 2026 19:56:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20A6A60C16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420563;
	bh=3XMVduh9yMiepKhus0V7TgjS/XRwujenIJF8djBnZuI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L/RzDSzZFjCj2xVvUP2zw0dTzOEoPOjTjQJ2INdl9+0lq/HG4mfVfhkIOUdOsS9BI
	 h0cYkglTQnILqtvkVMIAvBbHAay6r4shDf37q18bRcvXUgl60Jgn63EIiqk8wMsXxI
	 l0BByWYb04qi7G6x3GEN7/RtClx/UrzPHa2s7rprDsCqD4tQNMzz54W0e6Yq3QyUS/
	 iG9FRR7Ev4UT+iEZ19HZx4yRHVOZtxe5+D8oG0en9soSuG6cDHLtdRx27H3cHtwwRX
	 zr+h+p9i26SWYFJOmZEuITc6zHFBtlgpQeku4n6MTQYYslyhtMrPCfq3vx6L+R4+tF
	 FJaOl+qQletBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20A6A60C16;
	Wed, 14 Jan 2026 19:56:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FBA81C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 716BB81180
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFfwXdkEg5-Q for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D1AE8117E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D1AE8117E
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D1AE8117E
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:58 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6yBvKnf2clBZg6yBv3IPW; Wed, 14 Jan 2026 20:55:56 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:55:51 +0100
Message-ID: <20260114195554.3979278-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
References: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFNpgAh27HonSyGlllFqCMwpvViZLiqnWMBx+35OnhxeMcpB9hr1LfHxmltLBMZOUdUsODwyhX1CVJ7Og4L2qlw+tUBZriQbjuML9Dq6O4ZPU1jKijF9
 QCyBQjHW3zZr8Z2Wv4ZTl9cGvecRgX7qSfT2Uo15CqBKUrC8pQSoF3WPEMujpzj1oWGjwPM/nM3aOjBgdf3ML5ZLoJRanjYxKR6vZDjxHpD4uwseTUHtt6I/
 IgFz0boyqFQQDKQO6+bp1X++nNntPjgagUWFlqDdUhFlqasUspEVdm/INRaVfcuF9ct+1rZAt7wlyCr7kvxEEQuuRtQlA//dyWfm6A/c84XKzwpL7n0ZwqJm
 2enh0aXEnHA6JnY3VyCqMAmPwjgbKtH54VYXrtSwWd88t9ao9TgaIAUD/2YO1vXAtcOkOT0j0dOYqBoz0lAHuQFdihn+/uVuVm/kJXGt5SSCFO+4hBVPAUxQ
 LfyzRLEq/inlVlwW2LBkiEw5uZzTfAY7xJyIfxmBNlY2Zx7I/PJxn5hlYRMbGwhZoc1BsXEgApjv75cq
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420556; bh=zN5KQoOxAokqKE2d52gK6ne5bUKNFFN1pbnprsmMvw0=;
 h=From:To:Subject:Date:MIME-Version;
 b=F9l0R+IZkIJeCsgbw3OTfooMDjW+J+4NvfciW+/SAqm71PdTXGjWjpTWzEzUNIxHs
 KLTRozmJa+WmU+kmYnH2MIc2qkBEC33ztrpmpJlqSDPi/E6I3szt//Q7Fkopd9Ve0v
 qsD444i5RDl6fPTnaVIw5NsW6eFrM0hSJWkOLz3RkKpAIXqFsBK72I8OeqPS750oLx
 KjE7C7PMRz9kUYawffe64MPyQYSZw5onFG3kJjFUoMeW5CNwPFoH4wr4j3UIgcxMYk
 PCY37+ET++p9rmX9wAk73OQaHlETY4NNBRb+Ov5uu9d9tmVclEXfjpCL5Z8ddZOk+9
 8uJFrvA5ceGQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=F9l0R+IZ
Subject: [Buildroot] [PATCH 15/17] configs/olimex_a20_olinuxino_micro: bump
 Linux to 6.18.5 and U-Boot to 2026.01
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch:
* bumps Linux kernel to version 6.18.5
* bumps U-Boot to version 2026.01
* forces check hashes
* switches to extlinux

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/olimex/a20_olinuxino/boot.cmd            |  5 -----
 board/olimex/a20_olinuxino/genimage.cfg        | 17 -----------------
 .../patches/linux-headers/linux-headers.hash   |  1 -
 .../a20_olinuxino/patches/linux/linux.hash     |  2 --
 .../a20_olinuxino/patches/uboot/uboot.hash     |  2 --
 board/olimex/a20_olinuxino/post-build.sh       |  3 ---
 configs/olimex_a20_olinuxino_micro_defconfig   | 18 +++++++++---------
 7 files changed, 9 insertions(+), 39 deletions(-)
 delete mode 100644 board/olimex/a20_olinuxino/boot.cmd
 delete mode 100644 board/olimex/a20_olinuxino/genimage.cfg
 delete mode 120000 board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash
 delete mode 100644 board/olimex/a20_olinuxino/patches/linux/linux.hash
 delete mode 100644 board/olimex/a20_olinuxino/patches/uboot/uboot.hash
 delete mode 100755 board/olimex/a20_olinuxino/post-build.sh

diff --git a/board/olimex/a20_olinuxino/boot.cmd b/board/olimex/a20_olinuxino/boot.cmd
deleted file mode 100644
index 44d9239a94..0000000000
--- a/board/olimex/a20_olinuxino/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
-ext4load mmc 0 0x49000000 /boot/${fdtfile}
-ext4load mmc 0 0x46000000 /boot/zImage
-env set fdt_high ffffffff
-bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a20_olinuxino/genimage.cfg b/board/olimex/a20_olinuxino/genimage.cfg
deleted file mode 100644
index b48e12a831..0000000000
--- a/board/olimex/a20_olinuxino/genimage.cfg
+++ /dev/null
@@ -1,17 +0,0 @@
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1016K # 1MB - 8KB
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 512M
-	}
-}
diff --git a/board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
deleted file mode 100644
index 9dd49776b0..0000000000
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256  7a8879167b89c4bae077d6f39c4f2130769f05dbdad2aad914adab9afb7d7f9a  linux-6.18.3.tar.xz
diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
deleted file mode 100644
index 60971ee74f..0000000000
--- a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/olimex/a20_olinuxino/post-build.sh b/board/olimex/a20_olinuxino/post-build.sh
deleted file mode 100755
index d3f612f811..0000000000
--- a/board/olimex/a20_olinuxino/post-build.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index a1d23952d7..2eec0fcaeb 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -1,20 +1,22 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/olimex/axx-common/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/axx-common/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/axx-common/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-micro"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-olinuxino-micro"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -22,14 +24,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino_MICRO"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
