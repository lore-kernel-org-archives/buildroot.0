Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C234CE94626
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91BBF40C93;
	Tue, 10 Feb 2026 00:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlnQXDez1gr8; Tue, 10 Feb 2026 00:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 091BC40D24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682082;
	bh=NgciA/e9PHB1evKJFWdfyy4akefdyLVF5EiQyDhD1a0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AWyXUpBirY8Cp/KNC+mcyae9H3DTaQ/f6OLspUmwhUktOjV9GmrxGGLv5mE3ShlZC
	 nsJMlb8/qvtYFmaL8flGvQsnX/aEBjwGDyzcJshcOOiAu90PPfmrfLQE6dOJez6A4g
	 D58qDzOu5YX1MMt0VS2twydGNU56hmvI7A2JoNCoUtLAeKNpCu7fV7qNXC3DUIyelI
	 tsJtHm0pkQjsBSX6GJ6A4jdYKghSqA9BlIE6XzmZn6mW61Wr/3cOLsv/w3M+1zK6vI
	 zoa9etTYDS6r0OM0Oue+vFb+TgDd/sUf2q6PLNbxYE2khsHY7VYxnz1UJMIqLJWcQ6
	 TvcUCM/UgNcKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 091BC40D24;
	Tue, 10 Feb 2026 00:08:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12CD71A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C3D540C4E
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkpBfzU6hjlr for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.121;
 helo=smtpcmd03121.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6AD8F40C30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AD8F40C30
Received: from smtpcmd03121.aruba.it (smtpcmd03121.aruba.it [62.149.158.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AD8F40C30
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbI7vTZGv5gYjpbIAvmshS; Tue, 10 Feb 2026 01:07:46 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:07:35 +0100
Message-ID: <20260210000739.3810940-10-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEMHzqnfwX4o+wGyNUavrHrAz7QNqxD2sgNCmUlM817Jta96G9gDhpfmzCD6GTE8XWRjkrvhP0huF4XXSWNI0k28fudFCh340C9z74XGS4iO8oCOb3lD
 VbiF8MTxxyBoZtmjLlZP4J+QfRrB8g0bW8jb4h37qlIAjI50sLAn04KFqJf2QrudKqcVswrujVZSiAhs0a/3RGSQaVTtEI8bHH0RxitvZRyiquxILlmtDcsv
 Ib2f9s0woVRWJKpveHowrBFC3dEIqofyPKEW6ZbkSqsGK5rgGUIFolbDSP77FoKBDjMB2JHttMXQMnAvQMnujmaklUuWRzrpiS+XY4MIjlNlyjk7X3i4hv60
 XorX7ty+vA5yzNyrRQYDNjT077YEV6D9yS06Br4C3pSOGA0RPhRawlfT7gEWMuuG9yWMdlMmTT2jUG0WgRYBITV5Cy8YlJLTL9tuHI/Gx43OWxmtexG+Poid
 fSXwJe1KOnJ1+2kRv5HPXOfekG/G85HweI3R5X27GUxRv8OJ2xdAtdXFM9FGxdQ7v7P/TPxscRfGxXV7FKQmGzNCsy281eJvi/6EsXzZVzERmHWEdTvMcnRJ
 R78=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682066; bh=Zg08aMkJ3dlf0cc7i8vYlDoZ1TX3j3HdoYVhV21gtUw=;
 h=From:To:Subject:Date:MIME-Version;
 b=CMUmRxcR1QHPXt+mmVNXW0ZIa6iRB7lIenaiBBTeEmNn34w/D65pvv6/6eJEE5O1N
 rSoQuAh5lw/JlZ8NdrwjSLuZiX/M/6eXJD2knaZIN6OXwODAGaE9q5x79QL3mYlf7Z
 pXwx1tPI1C04UBlpPUWOnm6Crf0Qn1Cl8NiFCjYG8ZWzkM8GpYdV93d7UK1y0RMyn3
 jyEdsRL8ej+tHDeuNkE1n8RmVCFnFXTv9EJT6eg4lgx7TxoJ5voBwmkLZ4KEIzjoQL
 kGaUBYSHkfUAXez/137LFo/ZXg/qoH7Bq6wBGLZ1cy2769N5N9pZDa9/0iTv/nMMpE
 A9i2ymWaxl7rQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CMUmRxcR
Subject: [Buildroot] [PATCH v2 09/13] configs/olimex_a13_olinuxino: bump
 Linux to 6.18.8 and U-Boot to 2026.01
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
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes
* switches to extlinux

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .checkpackageignore                            |  2 --
 board/olimex/a13_olinuxino/boot.cmd            |  7 -------
 board/olimex/a13_olinuxino/genimage.cfg        | 18 ------------------
 .../patches/linux-headers/linux-headers.hash   |  1 +
 .../a13_olinuxino/patches/linux/linux.hash     |  2 ++
 .../a13_olinuxino/patches/uboot/uboot.hash     |  2 ++
 board/olimex/a13_olinuxino/post-build.sh       |  7 -------
 .../rootfs_overlay/boot/extlinux/extlinux.conf |  4 ++++
 configs/olimex_a13_olinuxino_defconfig         | 14 ++++++++------
 9 files changed, 17 insertions(+), 40 deletions(-)
 delete mode 100644 board/olimex/a13_olinuxino/boot.cmd
 create mode 120000 board/olimex/a13_olinuxino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/a13_olinuxino/patches/linux/linux.hash
 create mode 100644 board/olimex/a13_olinuxino/patches/uboot/uboot.hash
 delete mode 100755 board/olimex/a13_olinuxino/post-build.sh
 create mode 100644 board/olimex/a13_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/.checkpackageignore b/.checkpackageignore
index 433be11ff0..9e70945f2a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -32,7 +32,6 @@ board/octavo/osd32mp1-brk/patches/uboot/0001-Add-OSD32MP1-BRK-device-tree-suppor
 board/octavo/osd32mp1-brk/patches/uboot/0002-Add-OSD32MP1-BRK-build-config.patch lib_patch.NumberedSubject lib_patch.Upstream
 board/octavo/osd32mp1-red/patches/uboot/0001-Add-OSD32MP1-RED-Device-Tree-support.patch lib_patch.NumberedSubject lib_patch.Upstream
 board/octavo/osd32mp1-red/patches/uboot/0002-configs-stm32mp15_trusted_defconfig-disable-environm.patch lib_patch.NumberedSubject lib_patch.Upstream
-board/olimex/a13_olinuxino/post-build.sh Shellcheck
 board/olimex/a20_olinuxino/post-build.sh Shellcheck
 board/olimex/a33_olinuxino/post-build.sh Shellcheck
 board/olpc/post-build.sh Shellcheck
@@ -133,7 +132,6 @@ configs/nitrogen8mm_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mn_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mp_defconfig lib_defconfig.ForceCheckHash
 configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_a13_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
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
index 4eb14eb520..92c8677545 100644
--- a/board/olimex/a13_olinuxino/genimage.cfg
+++ b/board/olimex/a13_olinuxino/genimage.cfg
@@ -1,15 +1,3 @@
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
 image sdcard.img {
 	hdimage {
 	}
@@ -21,12 +9,6 @@ image sdcard.img {
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
diff --git a/board/olimex/a13_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/a13_olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/olimex/a13_olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/a13_olinuxino/patches/linux/linux.hash b/board/olimex/a13_olinuxino/patches/linux/linux.hash
new file mode 100644
index 0000000000..b1a0042a91
--- /dev/null
+++ b/board/olimex/a13_olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/olimex/a13_olinuxino/patches/uboot/uboot.hash b/board/olimex/a13_olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/olimex/a13_olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
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
diff --git a/board/olimex/a13_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a13_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..f852b75a44
--- /dev/null
+++ b/board/olimex/a13_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label A13-Olinuxino
+    kernel /boot/zImage
+    fdtdir /boot
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/configs/olimex_a13_olinuxino_defconfig b/configs/olimex_a13_olinuxino_defconfig
index 219fe19ba0..9ec20779ce 100644
--- a/configs/olimex_a13_olinuxino_defconfig
+++ b/configs/olimex_a13_olinuxino_defconfig
@@ -1,32 +1,34 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/olimex/a13_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="a13-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a13_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/a13_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a13_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
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
