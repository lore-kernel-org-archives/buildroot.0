Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96E1FD8FE1
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 17:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DFBF4062C;
	Thu, 26 Feb 2026 17:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkgKiKo9dGnf; Thu, 26 Feb 2026 17:35:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 907DB40733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772127337;
	bh=a7N1GXLcaf5LNazXWIYTtb0lmGaOc+XcBu/5YYgUIqQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BIKdqpn1OVXyvJP9MRQSPH/1jepT+X+lblYzu/1Z7Q6QzqaeufNAMGunOfe8Y806/
	 ZZ76z8cB/jv0vzyYB4hkFtoBrMQkzoyNWuOvh8/28P3DQUgdpur7abwrZplv8zuDjw
	 gAzi4JZ84WQ9epwI1bn6Koccl9mglWpATZFUOFGrcShRh04o23PU4zvflBcw/MsWRC
	 RMUI3qmYVnwrLIFiYFM4JKwJ61SsybqldajnRH9W48lGPnn48LDAnjBZdvAqGTyWPZ
	 pMLG2QkXxa09mVB4GXSzdBv7tQAMUQTJ1JQPh7EXucp5iYff6J3hUmg2Y6VQeIQxrw
	 HTHYRU+IP1H1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 907DB40733;
	Thu, 26 Feb 2026 17:35:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3326204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 17:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C68060625
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 17:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAnBVUH45zXo for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 17:35:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 70DFD605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70DFD605E6
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70DFD605E6
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 17:35:28 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id vfGnv0V60clBZvfGnvE8Oq; Thu, 26 Feb 2026 18:35:26 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 26 Feb 2026 18:35:24 +0100
Message-ID: <20260226173524.2702621-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJprrlYWl8JpZqh64pKWicg7wRHoYfExIcj/IaMuE+2jHexHoCywOZD8M6jbGfW2gQ/meT7to0bdQVJOiJ3vdb24BXu91NE3eLGvx16Pp15kkJ1zYeey
 mMqp/d2AQKnECLFtCCaejK9sFsfMGbwc/h/XAuMLrU8a/aMQjlBUXxGtPjvy0Phvv1CRB+wIJKnhCG4DIAT2E2TeI9Hw1H9udHStXwQa5PReW3PQxddLv/kv
 iv+RPRY/ebu2w2V+GkoLX4bNQXpqkkBEK4z5sfCTdM17180q75m1xyVoKaEe22sE2TBqTmt/OVxK+Vk3fILf+8W8kApUMSA8biO/+XgSwXsVWvDQKDWnucbL
 R9VvMcSu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1772127326; bh=wlxRY1BV7E8ZI+IGAQiB1nB4f2NyNjyd0bxsKLDnlNI=;
 h=From:To:Subject:Date:MIME-Version;
 b=n6eqZ1NfF4NcQTzXn6cXhPGS4S8k1mlOg01S6cu6l0Hdebn/XUpPE8Yc5mokRBkXJ
 yXKrhmEfjdQLNJAF7IcKbnrcHuUN400VrXzCHWZMa/bZunVwG4HP23sHO3vfo60DRp
 jgqOdZ4VmdKvYe8+RaMUOu/jy6rik3jkg2HXb3dwEMhNdlRmUfw9vNiBK7gnvzvHCr
 J0bg9x+OvHbwJ8yFlOkRC9k+5U0CFC0BOu6V7gbAhKkK6b3p6K2II30gexW6Elff5G
 M+9tmtIOC+n7B+M21Jf69TObjnIIeF8WIPzpJruAB7bptBYRYlStUUS5tCXlliweHj
 Kv4PuU5APgEvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=n6eqZ1Nf
Subject: [Buildroot] [PATCH] configs/imx6ullevk: bump Linux to 6.18.8 and
 U-Boot to 2026.01
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

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes
* create a board/freescale/imx6ull-evk folder dedicated to upstream Linux
  and U-Boot to ease maintainance.
* clean up both imx6ullevk and imx6ull-evk readme.txt files

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .checkpackageignore                           |  1 -
 .../freescale/imx6ull-evk/linux_sdma.fragment |  1 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../imx6ull-evk/patches/linux/linux.hash      |  2 +
 .../imx6ull-evk/patches/uboot/uboot.hash      |  2 +
 board/freescale/imx6ull-evk/readme.txt        | 64 +++++++++++++++++++
 board/freescale/imx6ullevk/readme.txt         | 13 +---
 configs/imx6ullevk_defconfig                  |  9 ++-
 8 files changed, 79 insertions(+), 14 deletions(-)
 create mode 100644 board/freescale/imx6ull-evk/linux_sdma.fragment
 create mode 120000 board/freescale/imx6ull-evk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx6ull-evk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx6ull-evk/patches/uboot/uboot.hash
 create mode 100644 board/freescale/imx6ull-evk/readme.txt

diff --git a/.checkpackageignore b/.checkpackageignore
index 695e0d50c6..8bee044234 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -103,7 +103,6 @@ configs/imx6-sabresd_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/imx6slevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6sx-sdb_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulevk_defconfig lib_defconfig.ForceCheckHash
-configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx6ull-evk/linux_sdma.fragment b/board/freescale/imx6ull-evk/linux_sdma.fragment
new file mode 100644
index 0000000000..6f1c8b4313
--- /dev/null
+++ b/board/freescale/imx6ull-evk/linux_sdma.fragment
@@ -0,0 +1 @@
+CONFIG_IMX_SDMA=m
diff --git a/board/freescale/imx6ull-evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx6ull-evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx6ull-evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx6ull-evk/patches/linux/linux.hash b/board/freescale/imx6ull-evk/patches/linux/linux.hash
new file mode 100644
index 0000000000..b1a0042a91
--- /dev/null
+++ b/board/freescale/imx6ull-evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/freescale/imx6ull-evk/patches/uboot/uboot.hash b/board/freescale/imx6ull-evk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/freescale/imx6ull-evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/freescale/imx6ull-evk/readme.txt b/board/freescale/imx6ull-evk/readme.txt
new file mode 100644
index 0000000000..6b0ed25d06
--- /dev/null
+++ b/board/freescale/imx6ull-evk/readme.txt
@@ -0,0 +1,64 @@
+****************************
+Freescale i.MX6ULL EVK board
+****************************
+
+This file documents the Buildroot support for the Freescale i.MX6ULL EVK board
+using Upstream U-Boot and Linux.
+
+Build
+=====
+
+First, configure Buildroot for your i.MX6ULL EVK board:
+
+In order to do so issue:
+
+  make imx6ullevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - boot.vfat
+  - imx6ull-14x14-evk.dtb
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot.bin
+  - u-boot-dtb.imx
+  - zImage
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=./output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template.
+
+Boot the i.MX6ULL EVK board
+===========================
+
+To boot your newly created system (refer to the i.MX 6ULL EVK Quick Start Guide [1] for guidance):
+- insert the SD card in the micro SD slot of the board;
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+References
+==========
+[1] https://www.nxp.com/files-static/32bit/doc/brochure/IMX6ULLQSG.pdf
diff --git a/board/freescale/imx6ullevk/readme.txt b/board/freescale/imx6ullevk/readme.txt
index dc7c5f3678..80db3a46ca 100644
--- a/board/freescale/imx6ullevk/readme.txt
+++ b/board/freescale/imx6ullevk/readme.txt
@@ -2,25 +2,18 @@
 Freescale i.MX6ULL EVK board
 ****************************
 
-This file documents the Buildroot support for the Freescale i.MX6ULL EVK board.
+This file documents the Buildroot support for the Freescale i.MX6ULL EVK board
+using Vendor U-Boot and Linux.
 
 Build
 =====
 
 First, configure Buildroot for your i.MX6ULL EVK board:
 
-In order to do so there are two supported options:
+In order to do so issue:
 
   make freescale_imx6ullevk_defconfig
 
-if you plan to use NXP provided U-Boot and kernel.
-
-or
-
-  make imx6ullevk_defconfig
-
-if you plan to use mainline U-Boot and mainline kernel.
-
 Build all components:
 
   make
diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index 38ea8f6940..5d802e6614 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -1,13 +1,15 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6ull-evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ull-14x14-evk"
@@ -20,9 +22,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
