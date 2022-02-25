Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFC5C433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 07:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB36283ED9;
	Fri, 25 Feb 2022 07:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ts6Ky89Mp9zX; Fri, 25 Feb 2022 07:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D319783ED4;
	Fri, 25 Feb 2022 07:27:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEF21BF354
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29BE440395
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ykdXnMuQMAzc for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 07:26:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD58240151
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 07:26:28 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 29so6182721ljv.10
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 23:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=piTql1F2okZMcQK4fJIae2kZuuV5VqNmjAq8sNka/YY=;
 b=BGUC2N7q2aybqwxh9BtZ+KvrUsg//t5IYhLO0sMzM5r/byxFyMBn6eHO504i4Ce3J4
 VZF++0CPZR0pLyPmsXuLMM57gTyprYV5/b97WKWMBEpJPX/NiMLxp+scJ3cB4O31i1qL
 mhUv/KLun8oXjJbE57Ht1+B7Ld2zc03jz2p2OOjBzjEVntBhYniDC5BXyChfo0thIcSO
 QO5sQp8aHHW2FPDtmqlt/xTDsdLHdTfkYKZve/WzqXf11+bZdKuOfWxEDx0oC4H4T7dM
 euJGNMFwPQcODORGDy9cfX4pBChAVYT32mBchrhkKGj7LJyofoCtg05kJTavLKPdEYw3
 iioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=piTql1F2okZMcQK4fJIae2kZuuV5VqNmjAq8sNka/YY=;
 b=GWcb4Pj9OAYEbX9vi34Ea4SSoYQCmPsGtdRV78qc2mtw1nNHNRK9P0u3uBwJiUThV1
 FQTjUuZIX3uFfr93XUOeK/c6D2gRaRBUJfygG3EpcQSMwcIFnc71uPMnAU0LdbgCbLhY
 LT59RarUxpXtjAU55u3ISMnsp351flVmXbzcMIAFDz6Ain54LQHNa3A6QKHJFViIfgIs
 7MVAiQphJZgvYnKE7m8zSN/qC06tAL1XVccmsdbC4ptxrOBhyl5tBIP8dSZ1NZ/KAyJI
 5DdEo/Gw1MYkgd50fr3wfu0R8g+0gK8qEjgRnIElC1uk60ECRkCIEQeJdo5q7YUFHYmX
 ciXA==
X-Gm-Message-State: AOAM533jp440rTx+UIU3+Fry2NE+vkOqS8vGgLJFTl7qZslYuAuAQz03
 1KU1eQr3jnDPXfmtofIRBDhoohfq6As=
X-Google-Smtp-Source: ABdhPJyG0L7C/uNbOxfEFzDpNEXVwt6XFjl6uPjlszADHEmyO+yVVSqWs7APznaZHycwvImlvO/3WA==
X-Received: by 2002:a2e:155d:0:b0:246:c5c:84d4 with SMTP id
 29-20020a2e155d000000b002460c5c84d4mr4511230ljv.150.1645773986644; 
 Thu, 24 Feb 2022 23:26:26 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 z25-20020a2eb539000000b00244db8751a7sm184592ljm.67.2022.02.24.23.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 23:26:26 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 10:26:19 +0300
Message-Id: <20220225072622.3584480-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225072622.3584480-1-geomatsi@gmail.com>
References: <20220225072622.3584480-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/6] board/orangepi/orangepi-one: switch to
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to extlinux instead of U-Boot boot script. Drop custom
boot script and genimage config. Instead use common orangepi
files from board/orangepi/common.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-one/boot.cmd     |  8 -----
 board/orangepi/orangepi-one/genimage.cfg | 37 ------------------------
 configs/orangepi_one_defconfig           |  9 ++----
 3 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 board/orangepi/orangepi-one/boot.cmd
 delete mode 100644 board/orangepi/orangepi-one/genimage.cfg

diff --git a/board/orangepi/orangepi-one/boot.cmd b/board/orangepi/orangepi-one/boot.cmd
deleted file mode 100644
index ab616e6ac9..0000000000
--- a/board/orangepi/orangepi-one/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-one.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-one/genimage.cfg b/board/orangepi/orangepi-one/genimage.cfg
deleted file mode 100644
index 2a14dcdec2..0000000000
--- a/board/orangepi/orangepi-one/genimage.cfg
+++ /dev/null
@@ -1,37 +0,0 @@
-# Minimal SD card image for the OrangePi PC
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-orangepi-one.dtb",
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
diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 1a2772a307..ba128424a0 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-one"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
@@ -25,11 +26,7 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-one/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-one/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
