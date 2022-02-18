Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2163C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 03:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E66B4031F;
	Fri, 18 Feb 2022 03:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57rh_Z-mcF9z; Fri, 18 Feb 2022 03:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB38740286;
	Fri, 18 Feb 2022 03:51:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E43E1BF9B4
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 03:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C3A184037
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 03:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SxjW_mQEmnlE for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 03:51:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F73884014
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 03:51:47 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bu29so3070575lfb.0
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 19:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gw7aARTAexHq3oDKa8WGvutMg1bOsqotI3ec01+J8TY=;
 b=cOIiK6ZvUMB/+zmhg8xKqDUzeHZGE1xkdrbvidEOnFhBki7uKIazPU1+Yc73EO/uQ4
 rBS8rLxKRKv0KT0rJt9jTnN+S1g3EVeySvzDnYYi37l+35kVi7OzLg+YvtzpNP7HpJ4c
 HACbqjxHwEgIpb158XvpRV4aFI5nJfVQ16Ol8pdqh0KTGXnz8BYdzippn2h8fKV9ZG4q
 nm/b9kbP4s4YaZBuIC2otAzMWOp3fkjwWs94y/dwPURjueg9Ikxj0v4owqxY8W35n0Cx
 ABqhUCKQ/q7QgWfM3JUkrG0AqjLTAKW5FcQ0BTI/wDgU9T++Ib8VJcYBknGiK51RQ9rJ
 1ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gw7aARTAexHq3oDKa8WGvutMg1bOsqotI3ec01+J8TY=;
 b=u2vsvtjqHJd+NlzA2Lcmsw3oWRxGZEdE4XABa7TxL7FBpGuKes0K0JK9nqC+5Ln5oC
 gP9j878nl6AL0Rrw9KY8HIncHv5U2eI+rJXvn4fQDaNFd7Gi3VvQ9LTQfo0XjHW1cxgj
 TpiCRtgIY5ycGYp2auJqfIwORRBEuPMKOqaHh4Z51JVj1ux46VXw2tj/XY4xkAM/9sOA
 kCw9tMbtK+2yKD9uWdtOkroUy0l6kbjOL7Ii9PK+ovD0Tjk7MUOUE2newYs9eFBeOzno
 SHU4NoBW5Dnf677o6A4SfaQYMPzjjYLrXnAcl8TweQcRwhY9VeXgDCfjcC54GR1hSD8b
 qmKw==
X-Gm-Message-State: AOAM530P7vl5LC6FRAHmCmEOSwOviLojdocb0FaleVuipSwaTXCAi7cy
 Vzf2wTCNKz9aXBmU6dbCY4OFPv3R4J4=
X-Google-Smtp-Source: ABdhPJz+8kBrLZ97f8Tb3jU4Y16NK3nma/DDqv4hUUNpqlOu8Jrnrj0CLApDx3r7Va4ePfb++y8Uuw==
X-Received: by 2002:a05:6512:4004:b0:443:7f72:6eff with SMTP id
 br4-20020a056512400400b004437f726effmr4029829lfb.175.1645156305820; 
 Thu, 17 Feb 2022 19:51:45 -0800 (PST)
Received: from hellfire.local ([178.155.5.22])
 by smtp.gmail.com with ESMTPSA id b25sm179836lje.52.2022.02.17.19.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 19:51:45 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 06:51:41 +0300
Message-Id: <20220218035141.6914-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] configs/orangepi_pc_defconfig: switch to
 extlinux
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
* Switch to common orangepi scenario for multiple boards (board/orangepi/common) to create an SD image.
* Exclude FAT partition, it is no longer needed for U-Boot.
* Switch SD image from MBR to GPT for partition-uuid to work.
* Switch to extlinux, this is convenient for debugging.

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
V1->V2:
* improved commit log
---
 board/orangepi/orangepi-pc/boot.cmd     |  8 ------
 board/orangepi/orangepi-pc/genimage.cfg | 37 -------------------------
 configs/orangepi_pc_defconfig           |  9 ++----
 3 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 board/orangepi/orangepi-pc/boot.cmd
 delete mode 100644 board/orangepi/orangepi-pc/genimage.cfg

diff --git a/board/orangepi/orangepi-pc/boot.cmd b/board/orangepi/orangepi-pc/boot.cmd
deleted file mode 100644
index 9da625c803..0000000000
--- a/board/orangepi/orangepi-pc/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-pc/genimage.cfg b/board/orangepi/orangepi-pc/genimage.cfg
deleted file mode 100644
index 14e326cc56..0000000000
--- a/board/orangepi/orangepi-pc/genimage.cfg
+++ /dev/null
@@ -1,37 +0,0 @@
-# Minimal SD card image for the OrangePi PC
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-orangepi-pc.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 10M
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
-		size = 512M
-	}
-}
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 44ea9b95c4..fd0f64e0e6 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -5,8 +5,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
@@ -14,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
@@ -27,9 +29,4 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
