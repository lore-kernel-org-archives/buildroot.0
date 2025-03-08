Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BC4C282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 06:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 077D78478F;
	Sat,  8 Mar 2025 06:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pw_HqzJzS595; Sat,  8 Mar 2025 06:13:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2E5F847A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E5F847A0;
	Sat,  8 Mar 2025 06:13:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BFAE1C9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 06:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60D348478F
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 06:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCMzwxSf6MkO for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 06:13:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=kanakshilledar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AB418478B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AB418478B
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AB418478B
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 06:13:39 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2ff67f44fcaso679830a91.3
 for <buildroot@buildroot.org>; Fri, 07 Mar 2025 22:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741414418; x=1742019218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S5lEj/E2MsjKFm965YjCfvlpbtlo51/stTSFwHQZlTY=;
 b=od4cEl2NU1jEuupRnP7uO8AlHBxWwXTt9D9BsJf5NRQPGo/fXE+wNIh8BZJ+dSw0pX
 crgOjWwQ8Kuk+CcBi5/OaulqnyzMGuRCD5YFMF4jUrsDF+VDpmKLYIwrTLpo9VXwuwAP
 uBdiE0YYzMowQhek23v30XAQ5tSdJbeU/j2ZNLTnUrozKn/FfqTE5sycFcX1pJMDQwHP
 dQtKkLG6Dzip514Y7rrHrI3agzTYymC4ypEqMiHfMGlmNBzxTqc9/UoIKH6Gz9A/KhD6
 7+VzBAnhyqhvJVc8ocdxehJd55LWTSmMIm4x5iA9AriqJSvvFmEcr0vYSLSqNs754aAJ
 Ermg==
X-Gm-Message-State: AOJu0Yy2x5pqbPmPnAKzjkKjGYhXqu8CBh663/4tb1ojN3ePe6kUgsEE
 PXdDBNAjnPeZBo6FxBETa4fUeWRx3d+joRS9RHqPs6a5Mzz1hWwRDkxcTQjx
X-Gm-Gg: ASbGncth5Nu5SYFR1GvLF1VL6HF+bxpvrAFhB+DdR/t3fxibAH17eJbOEmvCaFUwpRO
 g+o1UrzGhCJ1MjY8rGHqWfmfBEHwCZb3ttjwvsmQzGU4wrSQF1+1TlQIi8uyGcrqbq2Cuz5wkRS
 oW14i8T5p7Dbm414izT17FxTt1NHzupjNZL/S7x31BTtCqbrSOo3Xj5kP+8mzBqG1eH7wN1C62m
 +4ww4qJzHrVj9JwhxDwQ5nNvcwjpao4toQiI+YekidreJT9BheI49gDj49mTwa+h1XuCU+j16s/
 SvzqknVLZsfa3E50EPnIUxdUpBwppRUYE60Q5cEGkbAUStQNszKLbSqHsVE=
X-Google-Smtp-Source: AGHT+IH6tipTkkCJshJgifPpP1JjSkX839z3pUdxpttLFwMrKPfurXTB8DCuFkKeF5cev1/4j90DAQ==
X-Received: by 2002:a05:6a20:9f88:b0:1f5:5295:985e with SMTP id
 adf61e73a8af0-1f55841d8acmr1000840637.11.1741414418176; 
 Fri, 07 Mar 2025 22:13:38 -0800 (PST)
Received: from ga401ii.. (n235.ucndns.in. [103.183.91.235])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-73699da011asm4189922b3a.84.2025.03.07.22.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 22:13:37 -0800 (PST)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>
Date: Sat,  8 Mar 2025 11:42:46 +0530
Message-ID: <20250308061245.1774235-4-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250308061245.1774235-2-kanakshilledar@gmail.com>
References: <20250308061245.1774235-2-kanakshilledar@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741414418; x=1742019218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5lEj/E2MsjKFm965YjCfvlpbtlo51/stTSFwHQZlTY=;
 b=HtP6xhghfJbvEkalLE5fXWpPPB2ghbUjnlbVKlYAzYoOIfWCJJnkpGHx/INoywNdVq
 omkyLVUHhCoE1R19794SFGCwWH/69R8fjdFFwR2JzvRKUNQD5OUjKOXipie9y2XU0Nyl
 Q2ql1mD+noZ41pyfVMJDIBLnU7AFovtLgZfInUijvNdoJ58L/Byn75EoDLe+FX1DYcaL
 bkH7a7lb+pduzBDMHW/CFRTdIfje5quSVhe4O6UvfrxbkEj4SavTEFz6t/5nAVJ3EsR1
 vbFx65s3K09yIQaS/6ojbw2bAz+1PZJWRrv7LjDLvRsgPoW47H4mK//DywQf57MeVsOC
 i87A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HtP6xhgh
Subject: [Buildroot] [PATCH 2/2] configs/sipeed_licheepi_4a: add new board
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

Add support for the LicheePi 4A with mainline component:
 - Linux Kernel 6.12

The following components are provided by vendor:
 - U-Boot 2020.01
 - OpenSBI v0.9

Board homepage and more usable wiki:
 - https://wiki.sipeed.com/hardware/en/lichee/th1520/lpi4a/1_intro.html

th1520-boot-firmware is selected from the package sipeed-lpi4abins.
This is inspired from lone0's fork of buildroot for th1520.[1]

[1] https://github.com/lone0/buildroot-th1520
Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
 .../sipeed/licheepi_4a/extlinux/extlinux.conf |  4 ++
 board/sipeed/licheepi_4a/genimage.cfg         |  9 ++++
 board/sipeed/licheepi_4a/post-image.sh        | 25 +++++++++
 board/sipeed/licheepi_4a/readme.txt           | 54 +++++++++++++++++++
 configs/sipeed_licheepi_4a_defconfig          | 40 ++++++++++++++
 5 files changed, 132 insertions(+)
 create mode 100644 board/sipeed/licheepi_4a/extlinux/extlinux.conf
 create mode 100644 board/sipeed/licheepi_4a/genimage.cfg
 create mode 100755 board/sipeed/licheepi_4a/post-image.sh
 create mode 100644 board/sipeed/licheepi_4a/readme.txt
 create mode 100644 configs/sipeed_licheepi_4a_defconfig

diff --git a/board/sipeed/licheepi_4a/extlinux/extlinux.conf b/board/sipeed/licheepi_4a/extlinux/extlinux.conf
new file mode 100644
index 0000000000..add3954184
--- /dev/null
+++ b/board/sipeed/licheepi_4a/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /Image
+  devicetree /th1520-lichee-pi-4a.dtb
+  append console=ttyS0,115200 root=/dev/mmcblk0p4 rootfstype=ext4 rootwait rw earlycon clk_ignore_unused init=/sbin/init
diff --git a/board/sipeed/licheepi_4a/genimage.cfg b/board/sipeed/licheepi_4a/genimage.cfg
new file mode 100644
index 0000000000..7eef4465db
--- /dev/null
+++ b/board/sipeed/licheepi_4a/genimage.cfg
@@ -0,0 +1,9 @@
+image boot.ext4 {
+	ext4 {
+		use-mke2fs = true
+		label = "boot"
+	}
+
+	size = 64M
+}
+
diff --git a/board/sipeed/licheepi_4a/post-image.sh b/board/sipeed/licheepi_4a/post-image.sh
new file mode 100755
index 0000000000..93a7572ee3
--- /dev/null
+++ b/board/sipeed/licheepi_4a/post-image.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+
+set -e
+
+BOARD_DIR="$(dirname $0)"
+BOARD_NAME="$(basename ${BOARD_DIR})"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
+ROOTPATH_TMP="$(mktemp -d)"
+rm -rf "${GENIMAGE_TMP}"
+
+cp ${BINARIES_DIR}/Image ${BINARIES_DIR}/*.dtb ${BINARIES_DIR}/fw_dynamic.bin ${ROOTPATH_TMP}
+cp -a ${BINARIES_DIR}/bootbins/* ${ROOTPATH_TMP}
+cp -a ${BOARD_DIR}/extlinux ${ROOTPATH_TMP}
+
+genimage \
+	--rootpath "${ROOTPATH_TMP}"   \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/sipeed/licheepi_4a/readme.txt b/board/sipeed/licheepi_4a/readme.txt
new file mode 100644
index 0000000000..77a3a9b3bc
--- /dev/null
+++ b/board/sipeed/licheepi_4a/readme.txt
@@ -0,0 +1,54 @@
+Intro
+=====
+
+This directory contains a buildroot configuration for building a
+LicheePi 4A.
+
+How to build it
+===============
+
+Configure Buildroot
+-------------------
+
+  $ make sipeed_licheepi_4a_defconfig
+
+Build the boot and rootfs
+----------------
+
+Note: you will need to have access to the network, since Buildroot
+will download the packages' sources.
+
+You may now build your rootfs with:
+
+  $ make
+
+(This may take a while, consider getting yourself a coffee ;-) )
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    +-- boot.ext4
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- rootfs.tar
+    +-- u-boot.bin
+    +-- u-boot-with-spl.bin
+    +-- fw_dynamic.bin
+    `-- Image
+
+How to flash the board
+========================
+
+Once the build process is finished you will have to flash the
+correspoding images to the respective partitions in the eMMC.
+LicheePi 4A uses fastboot to flash the images.
+
+# fastboot flash ram u-boot-with-spl.bin
+# fastboot reboot
+# fastboot flash uboot u-boot-with-spl.bin
+# fastboot flash boot boot.ext4
+# fastboot flash root rootfs.ext2
+
diff --git a/configs/sipeed_licheepi_4a_defconfig b/configs/sipeed_licheepi_4a_defconfig
new file mode 100644
index 0000000000..14e6717e8c
--- /dev/null
+++ b/configs/sipeed_licheepi_4a_defconfig
@@ -0,0 +1,40 @@
+BR2_riscv=y
+BR2_RISCV_ISA_RVC=y
+BR2_RISCV_ISA_RVV=y
+BR2_TARGET_GENERIC_HOSTNAME="licheepi4a"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi 4A"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sipeed/licheepi_4a/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="thead/th1520-lichee-pi-4a"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW88=y
+BR2_PACKAGE_HDPARM=y
+BR2_PACKAGE_IPERF3=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_SIPEED_LPI4ABIN=y
+BR2_PACKAGE_WIRELESS_REGDB=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_GIT=y
+BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/revyos/thead-opensbi.git"
+BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="lpi4a"
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="light_lpi4a"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/revyos/thead-u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="th1520"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
