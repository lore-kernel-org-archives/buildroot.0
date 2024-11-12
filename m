Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D029D32D9A
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 12:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B64056078B;
	Tue, 12 Nov 2024 12:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3ydrX9WVKvg; Tue, 12 Nov 2024 12:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB3E76079E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB3E76079E;
	Tue, 12 Nov 2024 12:33:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E26DDB1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C4F64051C
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s43_bnYenb2T for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 12:33:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BA72404DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BA72404DD
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BA72404DD
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:33:05 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7206304f93aso4998813b3a.0
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 04:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731414784; x=1732019584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LCmrbnlQkFRmykLRAqZ4M165eN4ijsf8WTi+RmcYL0M=;
 b=vyPRYEkFRQ4ig9i+LdFgBKMF9s+T24b4qZwMwGEg3vHzdb9y+Fxlj7UP2SXhaIx3iM
 EvDGYChOpHVSZLmin+UmbMwNktC/VYe+wA4EIc01Bn/rA5Nj4P9iZ2Tk17pvJfQgwEzx
 5pjTK2YOpRxm7e5zU64mJQ4BcJqVNhcJ4etD4LagjpryKItOtf5z8wXbZKuHpyblCd7e
 TAxlYqGKoL+ocIV30HCAERr49S5YEcwZQXN/Hdb1bu7/rXzFqE0B+qZ00mgq9uvFLrBM
 u+JHmAVc/fh4+0AjGnJKE0sWexcAMmnckZuevORM+zGUP6BgbTRRyu1yJMY/JmIi9qm3
 2xKg==
X-Gm-Message-State: AOJu0Yy3uRUGyoIFAdD+ryPBqK4o7dDFUGeTAqfMb39V8oghKAroXGOg
 y7nFpdxtWT+blTxDEPRXkXgKJkvTUtaz4w/kT/yM3oDNbr1le6lWSVs8XQ==
X-Google-Smtp-Source: AGHT+IFZ8K6gLvGOSWpkGVX2vmcx3khk0Rptli5Hkk/sVILJRkfqy5JUHNg+2101MqlkNjMutOqlWQ==
X-Received: by 2002:a05:6a00:2d9c:b0:71d:fe19:83ee with SMTP id
 d2e1a72fcca58-724132a62f4mr24009910b3a.10.1731414783499; 
 Tue, 12 Nov 2024 04:33:03 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724079a3d38sm11404738b3a.122.2024.11.12.04.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 04:33:02 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Tue, 12 Nov 2024 20:32:56 +0800
Message-ID: <20241112123257.6532-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108155434.1924823-2-fancp2007@gmail.com>
References: <20241108155434.1924823-2-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731414784; x=1732019584; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LCmrbnlQkFRmykLRAqZ4M165eN4ijsf8WTi+RmcYL0M=;
 b=MCWVTFNbO/OtIrBcbaS5/pdhpCPcIWwnUu5WDPrPOQ0WhrroV9hY8InnpJBWrKCE8x
 hQ4pMdw6zVGAzNcYu0MVs84uO6Gn6Ke5/feG27p59BnPkgu44IyR1JwQ7upXNZc7m2uf
 7/CRJZjFIt9ubKXi7OnPyzVJPl0mji5HbDTNMAfRIbvc6h4ApmkJ8FUqeFn8ow7w/189
 HQOXR9iSPvLdhC4yiQ0NSDHBH2PF5b/bV0wtx5rbhQwOgkVXJOFqYWdpKBzGhqF8NWur
 tSQEbhQ+YHlssQWrspcQH5rdDM6PwZ/5DhlNS9/NkLljWLzBRTnM/+g1k7OF5FNwgYqb
 0I7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MCWVTFNb
Subject: [Buildroot] [PATCH v2 2/2] configs/cubieboard2: switch to use
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
index 526572e6d1..dab19abca5 100644
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
index 287f67596b..6f63cf5b61 100644
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
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.7"
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
