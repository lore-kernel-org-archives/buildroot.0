Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE96D39014
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 212A360BC4;
	Wed, 14 Jan 2026 19:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhGufXd16VCj; Wed, 14 Jan 2026 19:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D79160BD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420511;
	bh=bk4wlaadSv1AadY/bKRgMsiSz0YpDRvwK4Q72/biYxo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BsQV+xSdww7pYnjydtlLOpguPAa+uB71Zo4GmIRz7GnuZFdQGJ3pp5SGR0V66rtbO
	 KWum5KEU+KDUOjg1PdUjt8whOW3Aa5ghS/k82lQup1Tle/cUTi45eKvOuZxL9Mf9WG
	 16SsYDr95PcCOfxdEuW8poObTDhJs6baLVY3TruJPx447B4Rp4xGu3qE5c2NPWwowR
	 Tyyc1lk2NgGeRLRezddNsJerf5uCRTMgKAZj7pYHEP+vEVtOXIkZm3nMQx8we1eawE
	 vYul98m0nCNEpSpK1qwGmZmjqxwHKu0/Aj8ty9+JlY5YVeIH3PeOVeEeWhwdl/ds1F
	 q4SSJMPuAUKnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D79160BD5;
	Wed, 14 Jan 2026 19:55:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F197232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96509400E6
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgzXelVYQRkZ for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.181;
 helo=smtpcmd15181.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FCCE406F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FCCE406F9
Received: from smtpcmd15181.aruba.it (smtpcmd15181.aruba.it [62.149.156.181])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FCCE406F9
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xEvzgcv; Wed, 14 Jan 2026 20:54:56 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:44 +0100
Message-ID: <20260114195451.3978704-12-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKHoUCp6ZZkzBKekZGK2lkPGSGcioO4V0UiGu4yVa0wOHbq0PdcDkErjZDGGRq1WdnPvDR7JS8tPDEEusMK0/Q0Bn25UA8TJnOk7+A8n2AaLjSvtnmj6
 ABfujzgaWvFjllI90f+l1NeQfjtk49N06SP7lv6evISi3pig8SpwaeewMxBjEv/VNuszO3yijhstNQnJdJdED6GQYa7P3f30ED+nSCiVVP0uJoO33f6Cw8l/
 YtT2/wv9Fb0+TQxD9fRp8G39ZVDijjMDmKk9hn2ubxrLzr9ZMfnrK/pTueKoEGSLVpQ2B7juQ/vNNZGpMlntz0eZMUW9vip67sVh0Xgbtw3ftuiHy4URvNKs
 5weEy08UWZAsFMLCP3xbFKE7JAmeQalrAV2WulNAE1t6h0/e0C/fP9cfTjZL1Jvke5WZSQnvRg60ztuEuL+vE1NOfq3aL/9SczB8pp1oR1sV+BIFH/skbBx9
 ZYlG3jODxzO7htXAEfBfCb+0O+UWW465Fngj08V+U5FS1JkFPP5Pwfuyzs/ChtmWLL+yBBocGlAVOHUi
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420496; bh=b9kDnxCSPMs1wGA1jzHiA1cmCSpgP/b2PCmdRjoFtcY=;
 h=From:To:Subject:Date:MIME-Version;
 b=iy4VHxVmFsNosk8GYNzuWlZtJoABT06f0HUdzXJwpGAwmjFppgjIDipCh2WLKhf0J
 rYZ2bPWoMnmDZhQsF9pBx5NNgiMrPzeBXnFPe1SjW/bOStJj8wMUKFSG2tLd9yH8aj
 LtQuqE+arqgPeDpirsrMrMQXc2B+pd/E5+RxbtRmrDtjJhpFZkhIoiGaj+ZgEuuMPa
 5EmNU+7eIghxIOD1QbQLbTF1I4FLvSkpN9HarW+eAgnHrEHkxx4PuPfvkjMBDeRAsZ
 aUVdNp3sT1s2dWS3sbqvAl1OVCqs3JKE9D8vh+mzMYIV+YPNehQxl0J+ErFtcJStdC
 wDU/1/oM/dylw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=iy4VHxVm
Subject: [Buildroot] [PATCH 11/17] configs/olimex_a13_olinuxino: bump Linux
 to 6.18.5 and U-Boot to 2026.01
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
 board/olimex/a13_olinuxino/boot.cmd      |  7 -----
 board/olimex/a13_olinuxino/genimage.cfg  | 34 ------------------------
 board/olimex/a13_olinuxino/post-build.sh |  7 -----
 configs/olimex_a13_olinuxino_defconfig   | 16 ++++++-----
 4 files changed, 9 insertions(+), 55 deletions(-)
 delete mode 100644 board/olimex/a13_olinuxino/boot.cmd
 delete mode 100644 board/olimex/a13_olinuxino/genimage.cfg
 delete mode 100755 board/olimex/a13_olinuxino/post-build.sh

diff --git a/board/olimex/a13_olinuxino/boot.cmd b/board/olimex/a13_olinuxino/boot.cmd
deleted file mode 100644
index 4dd1c7b754..0000000000
--- a/board/olimex/a13_olinuxino/boot.cmd
+++ /dev/null
@@ -1,7 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-mmc dev 0
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun5i-a13-olinuxino.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/olimex/a13_olinuxino/genimage.cfg b/board/olimex/a13_olinuxino/genimage.cfg
deleted file mode 100644
index 4eb14eb520..0000000000
--- a/board/olimex/a13_olinuxino/genimage.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun5i-a13-olinuxino.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 64M
-}
-
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
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/olimex/a13_olinuxino/post-build.sh b/board/olimex/a13_olinuxino/post-build.sh
deleted file mode 100755
index aa2a76bdde..0000000000
--- a/board/olimex/a13_olinuxino/post-build.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-MKIMAGE=$HOST_DIR/bin/mkimage
-
-$MKIMAGE -A arm -O linux -T script -C none \
-	 -d board/olimex/a13_olinuxino/boot.cmd \
-	 ${BINARIES_DIR}/boot.scr
diff --git a/configs/olimex_a13_olinuxino_defconfig b/configs/olimex_a13_olinuxino_defconfig
index 219fe19ba0..8fd01aed2e 100644
--- a/configs/olimex_a13_olinuxino_defconfig
+++ b/configs/olimex_a13_olinuxino_defconfig
@@ -1,32 +1,34 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/olimex/axx-common/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="a13-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a13_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/axx-common/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a13_olinuxino/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/axx-common/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun5i-a13-olinuxino"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun5i-a13-olinuxino"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A13-OLinuXino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
