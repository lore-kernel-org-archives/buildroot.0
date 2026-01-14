Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BA8D39014
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97C4860BCE;
	Wed, 14 Jan 2026 19:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3zvDmUyGJCq; Wed, 14 Jan 2026 19:55:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9649460BD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420507;
	bh=QG0ksc6nK8gsV6kOURJNo6T7Ib7gYtzNgDFumZfhz/M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pLJ1fZvH4e6cDog47DMWINCpig56GZwk3jWky4KQe+JmcPYlQQ5KkTlC0HZbWES+0
	 J7E4yTOtsGlLFnLM7pOC1nn4WpLQnROtrMPxYeh48yjJ9LNDiq1kKKz9VBkqWfKap3
	 lusDpQPLBH5yvZU6rp8G1Fw8W1TGfKgy4HdqpU6fTUvaMnv/T+kOHYc3gFe9oOXpDj
	 S9q+qJJ/TepEsroEQUCJnfcz0XZHhNMevJmWJ+DeTbyF1nHIu/Optr/lsxzqv6n/Ta
	 JjRI8hDBzd5+WZ3hu/pPlrziQyFhCMrGqsHZViLD45U8VJ7i7j1KwK9AKG4zfZd5cO
	 aFKsmM95FkIBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9649460BD5;
	Wed, 14 Jan 2026 19:55:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13D131C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B53F360BBC
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADk-p8ivsxyc for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EB3660BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EB3660BBD
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EB3660BBD
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xBvzgbO; Wed, 14 Jan 2026 20:54:54 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:37 +0100
Message-ID: <20260114195451.3978704-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJacIROexPyfd38isowX6aXNKKQfPU1F5zwwhT72rw5Vf6bqzR1lJYwWSgh3QW6OcHZF/PetYjMmIJQpmNP+wJ5DgHy11BW2c+RRQTchFJkdGl8vA0iY
 2Fv9UB3Wrp0tw6zGshqOroHBixazkS5HCzHXa457j0KMvEGlxdtH9iEC7GNVv0Syl00rPMzlaZ6gIp4bKgqPB+zmh/p1AmUWz5I3hSD4xgscEjNCyt34Yc4f
 mtNbQCIdFU9NJ/nDUlXN0f/r4L+guZMCJQDm9ry04fVV7/WLkz5vrctonRxCgAaCp/SnRI01pyXW4ruoHlr8wIwMdJ1ARIVOt/uXv+tLS5YZsU+P/Fx7f1sZ
 Ua5AObSGFwSiH7hNfwWtZBCK7pcRC+TL+kmyutS6MhE75BUrmI4h7vHEsAJdStnFfs5JZn+lylUQI1s/COTrh6o2y/fh26iM0iMMYuPE5OSZMZ1cF3GrkIl5
 98ph4LsKd/rcBiTnb8irMAMiSdO2xam4448M8OPLFsK9LJveZlauQLRSLY5Qkft5AMILaQpl5MawuEar
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420494; bh=umTVt2l6TZn5mI9ps0BJ0YY/LQBqM5aOLV9SOE/ySXw=;
 h=From:To:Subject:Date:MIME-Version;
 b=OUjFP8TY741nlApX02RiyUqg6uLSWq8C/6aiyaA/iw1TbNBDDsK6smaAM8bYjJWcB
 kzQyzO3qFrSkIKF68nipzPQBvhvWuD0H/baCKhF+rSKB9hGpXgWHoOSXZd0rqLOSDr
 RuYY7DM2Y7805amy1m370SNZULVPu0/86Gj6rWlbfxTSaJxeFgkPK7cHdQG7MzkCi2
 vcz3wfN8dGnhWo2MG7QnDJ/kqmDPIO4BV7OHUR4ZQ4k7G0C3SbGUX5e225ctBOcSrU
 4NMtl4ekT5LtmtxXM/k3LKkXPPNyUFW7ZdA4ShcYRxalxuqTwsX4ZRUghcnF7qIbqU
 8tpvgFOMN6UzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OUjFP8TY
Subject: [Buildroot] [PATCH 04/17] configs/bananapi_m2_berry: bump Linux to
 6.18.5 and U-Boot to 2026.01
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

bananapi berry sq

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/bananapi/bananapi-m2-berry/extlinux.conf    |  4 ----
 board/bananapi/bananapi-m2-berry/post-build.sh    |  6 ------
 .../{bananapi-m2-berry => common}/genimage.cfg    |  0
 .../patches/linux-headers/linux-headers.hash      |  1 +
 board/bananapi/common/patches/linux/linux.hash    |  2 ++
 board/bananapi/common/patches/uboot/uboot.hash    |  2 ++
 .../rootfs_overlay/boot/extlinux/extlinux.conf    |  4 ++++
 configs/bananapi_m2_berry_defconfig               | 15 +++++++++------
 8 files changed, 18 insertions(+), 16 deletions(-)
 delete mode 100644 board/bananapi/bananapi-m2-berry/extlinux.conf
 delete mode 100755 board/bananapi/bananapi-m2-berry/post-build.sh
 rename board/bananapi/{bananapi-m2-berry => common}/genimage.cfg (100%)
 create mode 120000 board/bananapi/common/patches/linux-headers/linux-headers.hash
 create mode 100644 board/bananapi/common/patches/linux/linux.hash
 create mode 100644 board/bananapi/common/patches/uboot/uboot.hash
 create mode 100644 board/bananapi/common/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/board/bananapi/bananapi-m2-berry/extlinux.conf b/board/bananapi/bananapi-m2-berry/extlinux.conf
deleted file mode 100644
index 1f1b4f5cf3..0000000000
--- a/board/bananapi/bananapi-m2-berry/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label Bananapi M2 Berry linux
-  kernel /boot/zImage
-  devicetree /boot/sun8i-v40-bananapi-m2-berry.dtb
-  append console=ttyS0,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/board/bananapi/bananapi-m2-berry/post-build.sh b/board/bananapi/bananapi-m2-berry/post-build.sh
deleted file mode 100755
index 21a2b0d8e7..0000000000
--- a/board/bananapi/bananapi-m2-berry/post-build.sh
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname "$0")"
-
-install -m 644 -D "${BOARD_DIR}"/extlinux.conf \
-	"${TARGET_DIR}"/boot/extlinux/extlinux.conf
diff --git a/board/bananapi/bananapi-m2-berry/genimage.cfg b/board/bananapi/common/genimage.cfg
similarity index 100%
rename from board/bananapi/bananapi-m2-berry/genimage.cfg
rename to board/bananapi/common/genimage.cfg
diff --git a/board/bananapi/common/patches/linux-headers/linux-headers.hash b/board/bananapi/common/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/bananapi/common/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/bananapi/common/patches/linux/linux.hash b/board/bananapi/common/patches/linux/linux.hash
new file mode 100644
index 0000000000..16cc0b3e4a
--- /dev/null
+++ b/board/bananapi/common/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
diff --git a/board/bananapi/common/patches/uboot/uboot.hash b/board/bananapi/common/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..60971ee74f
--- /dev/null
+++ b/board/bananapi/common/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/bananapi/common/rootfs_overlay/boot/extlinux/extlinux.conf b/board/bananapi/common/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..f1ea24acdd
--- /dev/null
+++ b/board/bananapi/common/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label Bananapi M2
+    kernel /boot/zImage
+    fdtdir /boot
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
index 200257ac0d..14a583cc30 100644
--- a/configs/bananapi_m2_berry_defconfig
+++ b/configs/bananapi_m2_berry_defconfig
@@ -1,16 +1,18 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_TOOLCHAIN_EXTERNAL=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/bananapi/common/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Berry"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/bananapi/bananapi-m2-berry/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/bananapi/common/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-berry/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/common/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.57"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v40-bananapi-m2-berry"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-v40-bananapi-m2-berry"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -18,11 +20,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
