Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5180D5C0F4
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 15:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76CBB80BD3;
	Fri,  8 Nov 2024 15:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwsU9EcB-L7K; Fri,  8 Nov 2024 15:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7521980B97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7521980B97;
	Fri,  8 Nov 2024 15:54:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 224B7C2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0209E4278D
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jr82Qs3RQoqP for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 15:54:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9F9442899
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9F9442899
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9F9442899
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:54:48 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2e2e23f2931so1866112a91.0
 for <buildroot@buildroot.org>; Fri, 08 Nov 2024 07:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731081286; x=1731686086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ktkc+IQxERA1LLQMUdkCF55wdF+M3gTieR/lgGgNbts=;
 b=TvcUXHcwCGWTNtNJilsOrjGjjjaUk8GKxzmTKyEUCRawNgsYodYSwmA8NQYySvK/E7
 OGgWS7OeVKzOu/6mxtcT1EJT8G2+qqZpqszPTwIBfZ8hv5hq4Iy8V19Z2tXlDM+GtcBa
 R5wiWrPFmJQsoCSCjbMoQFneXXvV0TZtWom3HnEjN602ofXQySJlQ+2WG3hbGrGUg3kN
 7hIMTSQUzBYyaMorlOA6mr3c5zkhUHBk3XcmN4O+UD5s1ywgCSf/sksqq870sPO0g8NF
 26jLkB7HL36xRcIMhQE0Kp4zF7zWZvfiGGn22k5xJG/cxwQwPgxIDFoAYed3xu7A6RCi
 w/PQ==
X-Gm-Message-State: AOJu0YyDH5/JLNURV2FN02oz5UJ59WrQyWMeej/E46y1JVf3KI2cCQ3b
 vk+QIkuZfJusRFPHAOArBYQtZEZ77X9dH+PPMcrWu3CN7MzhB1Wl0EtNzA==
X-Google-Smtp-Source: AGHT+IGdMevte/GZjTP8KMa/HBUyhh2HjLKNV1G7yBpUdCKEH/zMXQr/bMaVkCoVlKEGh8U2GkAJjw==
X-Received: by 2002:a17:90b:1a8c:b0:2e5:5e55:7f18 with SMTP id
 98e67ed59e1d1-2e9b177622bmr4126565a91.24.1731081286336; 
 Fri, 08 Nov 2024 07:54:46 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9a5f83fbdsm3677322a91.22.2024.11.08.07.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 07:54:45 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Fri,  8 Nov 2024 23:54:32 +0800
Message-ID: <20241108155434.1924823-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108155434.1924823-1-fancp2007@gmail.com>
References: <20241108155434.1924823-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731081286; x=1731686086; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ktkc+IQxERA1LLQMUdkCF55wdF+M3gTieR/lgGgNbts=;
 b=kmhDEyLqHgsVKwYeUwF6K4956ABFpKKB2rJ/GPCZKyafuOF4oM3VaNYookUKd/Vprq
 TTlyI+qzY88dSdGH1W11yBt7izo1VH+F+RJmyP8PiHc04PANqY7Nsws+5NAJAg9Bqa1M
 in3WVQSFeiyowoi8sMvcIUcoBHyDZM9kCTGU98B6oA7ETke3/y8zrROnAAd00c6gJ9Yh
 FfcNK2vH2BnNwIatsJ/ZZWHEQ88ZyQdBQaw3mX/L2nA3Tbl6uBA6oLRd53bskbO1bnBv
 umwDcF15caiRz3qtTpVGXiBdxdt9MmzHjGk6tEUnxazGi8+x2rNsa5yDEvTefOpsyt/N
 8wMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kmhDEyLq
Subject: [Buildroot] [PATCH 2/2] configs/cubieboard2: switch to use
 extlinux.conf
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

Switch to extlinux instead of U-Boot boot script.
Remove obsolete entry from the .checkpackageignore file.
Drop custom boot script and genimage config.
Drop unnecessary generic and host configs.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 .checkpackageignore                           |  1 -
 board/cubietech/cubieboard2/boot.cmd          |  5 -----
 board/cubietech/cubieboard2/genimage.cfg      | 22 -------------------
 board/cubietech/cubieboard2/post-image.sh     | 16 --------------
 .../boot/extlinux/extlinux.conf               |  5 +++++
 configs/cubieboard2_defconfig                 | 13 ++++-------
 6 files changed, 9 insertions(+), 53 deletions(-)
 delete mode 100644 board/cubietech/cubieboard2/boot.cmd
 delete mode 100755 board/cubietech/cubieboard2/post-image.sh
 create mode 100644 board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/.checkpackageignore b/.checkpackageignore
index ee075f4cb2..b49f432d43 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -25,7 +25,6 @@ board/chromebook/elm/sign.sh Shellcheck
 board/chromebook/mksd.sh Shellcheck
 board/chromebook/snow/sign.sh Shellcheck
 board/ci20/patches/uboot/0001-mips-Remove-default-endiannes.patch lib_patch.Upstream
-board/cubietech/cubieboard2/post-image.sh Shellcheck
 board/freescale/common/imx/imx8-bootloader-prepare.sh Shellcheck
 board/freescale/common/mxs/post-image.sh Shellcheck
 board/friendlyarm/nanopi-r2s/post-build.sh Shellcheck
diff --git a/board/cubietech/cubieboard2/boot.cmd b/board/cubietech/cubieboard2/boot.cmd
deleted file mode 100644
index a9ae0e24e6..0000000000
--- a/board/cubietech/cubieboard2/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv fdt_high ffffffff
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun7i-a20-cubieboard2.dtb
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/cubietech/cubieboard2/genimage.cfg b/board/cubietech/cubieboard2/genimage.cfg
index f8a8ec05c8..92c8677545 100644
--- a/board/cubietech/cubieboard2/genimage.cfg
+++ b/board/cubietech/cubieboard2/genimage.cfg
@@ -1,18 +1,3 @@
-# Minimal SD card image for the Cubieboard2
-# Based in the Orange Pi genimage.cfg
-
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun7i-a20-cubieboard2.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 16M
-}
-
 image sdcard.img {
 	hdimage {
 	}
@@ -24,15 +9,8 @@ image sdcard.img {
 		size = 1016K # 1MB - 8KB
 	}
 
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
-		size = 512M
 	}
 }
diff --git a/board/cubietech/cubieboard2/post-image.sh b/board/cubietech/cubieboard2/post-image.sh
deleted file mode 100755
index 9cca1b1789..0000000000
--- a/board/cubietech/cubieboard2/post-image.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                           \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf b/board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..8465f6deaf
--- /dev/null
+++ b/board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,5 @@
+DEFAULT linux
+LABEL linux
+  KERNEL /boot/zImage
+  DEVICETREE /boot/sun7i-a20-cubieboard2.dtb
+  APPEND console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 152075503e..997f61eac2 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -2,16 +2,16 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
-BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
+BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard2/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
@@ -24,9 +24,4 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard2/boot.cmd"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
