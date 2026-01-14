Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55CED39017
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B81C340B08;
	Wed, 14 Jan 2026 19:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_sHodtTHAw4; Wed, 14 Jan 2026 19:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A8AC40AE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420506;
	bh=3R3DpOeGvVcJ99LHmLFXapwko03deU7TzNaBvW8gM08=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NE0eieosnB1d9PGXwmgLEFOJVMPFcp48gnWNygHeyvEKKsyv7Ie/TJLWn8usYnK2j
	 EEJ16fbn3i2PoOafs+tzhnTQKNTLEmPVYg2M4i7kyE2kXdhzcmE3xNhnTLRganVKkX
	 PcmuOL/0WOOmROTJfsmt97NyB5UfMhLFqL3qVpKyOlMY0HSXYC/WEL1QGqtctZJXcE
	 23pHwiBvo1/KtKkAq60clT0iH1/oyENDX9+dcwWmUxcxfkZKElUpHqp6GncO/GBxAf
	 E/xqQ7JrLkweOLpPtrOsZrvBs75zsvVr0K5P9K2DuI6DP7YYpNgJh9EQN9eNu2SdiR
	 Bp3n9g+VHLFkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A8AC40AE5;
	Wed, 14 Jan 2026 19:55:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3487232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88B3140AE4
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QqTUx-58p5K for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F04D40AE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F04D40AE5
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F04D40AE5
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:56 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xCvzgbb; Wed, 14 Jan 2026 20:54:54 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:38 +0100
Message-ID: <20260114195451.3978704-6-giulio.benetti@benettiengineering.com>
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
 t=1768420494; bh=OHHL6/EbTYbZxGap3hcyMDks5aQt4tv0haFr9EBnDx4=;
 h=From:To:Subject:Date:MIME-Version;
 b=Aj8VuvySy5YwdlZMMzEHTmXxv4g00qUSjRa2qd9KY5yu2uZDbKIJ71zk5C+8YQJzj
 vswLGDlIst7NUtqZhP7binclqpm1r6NEZYSHxTZWm2XlkoDrGHtdeJQuk/LvxGXrlA
 BmtYzZ4HXSYRidqtwwlozFpIQwQT8PZ0jkbtcjhwM5c2guoTkQWpYloMN5UL+hCI0u
 udW5BU56Uus7TU8t/wzLGkO32oBGW+d8OBpfgQlQRF7PRSKx6pLUEJXoE4VaL0jguD
 41+8vpuoxDZV5R0bDkhcwuqWN+aeEYXfMXOU0umfVXX23d/Zs4AKnph2KSbh343+k/
 qms0Uza+kA64A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Aj8VuvyS
Subject: [Buildroot] [PATCH 05/17] configs/bananapi_m2_ultra: bump Linux to
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

m2 ultra sq

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/bananapi/bananapi-m2-ultra/extlinux.conf |  4 ----
 board/bananapi/bananapi-m2-ultra/genimage.cfg  |  1 -
 board/bananapi/bananapi-m2-ultra/post-build.sh |  1 -
 configs/bananapi_m2_ultra_defconfig            | 14 ++++++++------
 4 files changed, 8 insertions(+), 12 deletions(-)
 delete mode 100644 board/bananapi/bananapi-m2-ultra/extlinux.conf
 delete mode 120000 board/bananapi/bananapi-m2-ultra/genimage.cfg
 delete mode 120000 board/bananapi/bananapi-m2-ultra/post-build.sh

diff --git a/board/bananapi/bananapi-m2-ultra/extlinux.conf b/board/bananapi/bananapi-m2-ultra/extlinux.conf
deleted file mode 100644
index f5f35c1d8f..0000000000
--- a/board/bananapi/bananapi-m2-ultra/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label Bananapi M2 Ultra linux
-  kernel /boot/zImage
-  devicetree /boot/sun8i-r40-bananapi-m2-ultra.dtb
-  append console=ttyS0,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/board/bananapi/bananapi-m2-ultra/genimage.cfg b/board/bananapi/bananapi-m2-ultra/genimage.cfg
deleted file mode 120000
index aa6832894c..0000000000
--- a/board/bananapi/bananapi-m2-ultra/genimage.cfg
+++ /dev/null
@@ -1 +0,0 @@
-../bananapi-m2-berry/genimage.cfg
\ No newline at end of file
diff --git a/board/bananapi/bananapi-m2-ultra/post-build.sh b/board/bananapi/bananapi-m2-ultra/post-build.sh
deleted file mode 120000
index 01ca59fa50..0000000000
--- a/board/bananapi/bananapi-m2-ultra/post-build.sh
+++ /dev/null
@@ -1 +0,0 @@
-../bananapi-m2-berry/post-build.sh
\ No newline at end of file
diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
index b67a9d3f5d..364a23b0d4 100644
--- a/configs/bananapi_m2_ultra_defconfig
+++ b/configs/bananapi_m2_ultra_defconfig
@@ -1,16 +1,17 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Ultra"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/bananapi/bananapi-m2-ultra/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/bananapi/common/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-ultra/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/common/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.57"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-r40-bananapi-m2-ultra"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-r40-bananapi-m2-ultra"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -18,11 +19,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
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
