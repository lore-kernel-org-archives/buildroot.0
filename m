Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA264E7716E
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 03:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 618B681B69;
	Fri,  6 Dec 2024 03:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8WW3G9RROQF; Fri,  6 Dec 2024 03:04:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5508B81B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5508B81B6D;
	Fri,  6 Dec 2024 03:04:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CC7A1DDA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDE8A41315
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9ko1Z1ouyH1 for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 03:04:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B48DE407ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B48DE407ED
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B48DE407ED
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:04:35 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2ee786b3277so1380270a91.1
 for <buildroot@buildroot.org>; Thu, 05 Dec 2024 19:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733454274; x=1734059074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZS0HEKbRIBtjGUVzFVlsQQ+uY2mIKkpc+I2MKyilNI=;
 b=DA8p5f3LM7BgctPQYdEZ5nsgr3eVe4gki1/UcdlCpq5+r67v8mXWkqR8zZumhyp+Rm
 AgdNeJkrhH/LVehe2piUey9hMVB0sZSZQYPREf+IYwF4iWAFVDtEeKg9XD//8Ug/c+vo
 ikO6kM9bEkRQjKLcfRkw6wgHcOHDZ8W82KoRo8mHkbyIaf4LHz9Vmv8v+/bOFu/Ix8q6
 3aDAvLHZznhrwz961o+pLyAuG7OYCatTpR3wjbS79tEA90CzkA8MY2qO1dYGgo29+5I7
 78nQwXSfWvKo2jMBWiw/WnEuXCRFekhLj0bZTapgwAcpEJ7ySxdWTJROrNjCyKpngJBB
 8PUg==
X-Gm-Message-State: AOJu0YyDHyr+suL5NFPulKL6f64NKxgWkya4U2JLFSzIwz+RP1wmwBdS
 2IQpJzNqsMhumg8VohxvTszY3whI+OwwndMsoy/6uP/2Tbdl4V27ogsc7A==
X-Gm-Gg: ASbGnctduFinlN6IdMRrO0/+CVBxyy6/PLFXAVh/ul2ZoT6mFrs0Gur2V8YaThkGS/q
 Ez1vbrTw00JIMaey6hVFl3XkLAeMxb8Cl0uEaMc9N0vtFUBZ8XFmKzO4jxlqBH4Ht4y7j97aVVP
 STqu76lrg2eIRonNKKHpG27WWEClQ0y5BzGKy5snqLBc43LGC6pyiqIGZRWOFcdQdh/KjVT9Qm/
 y6zPQL8Pzj3bW3XI4Hjzj9jges4aTyBzVKJdOlgFyFJFb8=
X-Google-Smtp-Source: AGHT+IE01yxK/5+zJM2BXHroh3pWVrqARfC+gjt4CBVjUL74Hnib18CyUYErNGPQyeQC5XpT4uUU1Q==
X-Received: by 2002:a17:90b:4f4c:b0:2ee:5bc9:75b5 with SMTP id
 98e67ed59e1d1-2ef696546efmr2138031a91.4.1733454274435; 
 Thu, 05 Dec 2024 19:04:34 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef2700c122sm4041634a91.15.2024.12.05.19.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 19:04:34 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Fri,  6 Dec 2024 11:04:18 +0800
Message-ID: <20241206030420.246832-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206030420.246832-1-fancp2007@gmail.com>
References: <20241206030420.246832-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733454274; x=1734059074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XZS0HEKbRIBtjGUVzFVlsQQ+uY2mIKkpc+I2MKyilNI=;
 b=Y7Nt23PsuKCuY0zFDmNf2+jWKs8PL4HNVyV+hfh7ftIG0vd0F9BAeYvxc+PwJ78Q3S
 nITPxSdfEayeUQvyGvXkLcY9e5YvGAlx1oLnLH8KuvPI11RleVjoZv3YUbhwc2pIiPNi
 UTDb3zxQaoKOEZP7BPlrt6HqA7amAGh5HEkdYs/u5go1kTkLNmuu/cSBk4K9r9Mkacw0
 aTcne7Goz9AGlqJkWFsVtvTQDHXNtAJ4jqMeuSkMAj8S83CKGWcs069nMVytklCghbhO
 S2oY71D6Jpt6dmGgKDd4h80rU/iaZuBvWWRP3RzrExZepg4O9S4d27ER7Bo/0DNzadlF
 IRng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y7Nt23Ps
Subject: [Buildroot] [PATCH v3 2/2] configs/cubieboard2: switch to use
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
Changes v1 -> v2:
  - drop unnecessary line in the extlinux.conf file
  - use lowercase label, kernel, devicetree and append keywords
---
 .checkpackageignore                           |  1 -
 board/cubietech/cubieboard2/boot.cmd          |  5 -----
 board/cubietech/cubieboard2/genimage.cfg      | 22 -------------------
 board/cubietech/cubieboard2/post-image.sh     | 16 --------------
 .../boot/extlinux/extlinux.conf               |  4 ++++
 configs/cubieboard2_defconfig                 | 13 ++++-------
 6 files changed, 8 insertions(+), 53 deletions(-)
 delete mode 100644 board/cubietech/cubieboard2/boot.cmd
 delete mode 100755 board/cubietech/cubieboard2/post-image.sh
 create mode 100644 board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/.checkpackageignore b/.checkpackageignore
index 7fe1944ae6..8b6e2576c5 100644
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
index 0000000000..14c873e167
--- /dev/null
+++ b/board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label cubieboard-buildroot
+  kernel /boot/zImage
+  devicetree /boot/sun7i-a20-cubieboard2.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 42344eaf9e..9c0e51b37d 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -4,16 +4,16 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
+BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard2/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
@@ -26,9 +26,4 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
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
