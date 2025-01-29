Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D443C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 06:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C993760782;
	Wed, 29 Jan 2025 06:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHwcrMItdYNd; Wed, 29 Jan 2025 06:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F7CE607AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F7CE607AF;
	Wed, 29 Jan 2025 06:31:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BCFE1942
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 06:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95A9041241
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 06:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxPTgyUNyVZ3 for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 06:31:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0BE741246
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0BE741246
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0BE741246
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 06:31:44 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2f42992f608so9043540a91.0
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 22:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738132304; x=1738737104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rhsGdSM8oz1UumdmeHpcThRzYWysJsZH6O5qkC8YhhU=;
 b=R3eX+TRFzNTr/ABV9XCF5c2gypTHr/v0JSEi5rqEhphD/3r8EEcnvJYFDHG+c4L6vu
 xb1yx1tHJ4Peu3SwIfa7EJMo8ZJPnLU1FktYZHBGqUIB5MNWVR8toreYB8EhsfinSwN5
 qt7+zVAYYNLnA15fMuXUpYUa6lTJx5UelYcDjgMZvglAwiEVU8SpJQM76sndlgkmb7Vm
 avjOr24NyJszJt4qj5cFpo0QMhK1V/8yqlO9bWqa0PHhNyHU/vVnJ81Z66gV4/f3qybl
 E4h66PSnDpEEH1pZzNwCqCPfR+TafYxX89KyjHe35PDpr3qZ+IBa/nyiI2DZQ/WOzDkB
 weuw==
X-Gm-Message-State: AOJu0YxQJoqQdp9QlOWGmhLwlrtalV2+TytpE1+QIm7zfwOeEY8NFgID
 8O/SrLXegt73LAjvzlRau/tf2bQaNXCE2Hd3Hp7Ovp02+yD9fVt2aLJeV7S9
X-Gm-Gg: ASbGncsM+pB7IOtQ7xxeAjo7tgPL8TMmFp9ADXWAUrh54/LZ9F9WzHUAJadxEH2ldT3
 Dlo8Ee4KVbpPu5hlA5wNd7WJWKKPztJXiTr3wFZF651CESEX36kiGTWXxYrGyexEq3UqMbzvhcp
 KPMlgfVuQRuMS5qBEy0GiiRozPWE9GMMiK9IiRsSOojAOSlBY3O4F+uBpzC0XmSt2VemcEixWp/
 ra49fa7P+eYD0NUcPVBMsIE6uOZiKyhDPSJAeI6K5xa/OVsFDTancc+6uMMO4iRYqet7AvaJSg8
 TyHfDHjVg7dA4qG942T7L5VAM9Ac7Myt/Cd60DE2Q/J2x/qGTmVVURpgJln9Mx8iJLDFDb922ZA
 =
X-Google-Smtp-Source: AGHT+IHcQ0MKuoFZAI6uYr4lCcnM2hTak18XfNsgu7yWYrOGj4L42E7svAAOgYqfu2J9NSX8vASCWw==
X-Received: by 2002:a17:90b:56c4:b0:2ee:d186:fe48 with SMTP id
 98e67ed59e1d1-2f83ac73abamr2695603a91.28.1738132303709; 
 Tue, 28 Jan 2025 22:31:43 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f830a3b23esm850752a91.1.2025.01.28.22.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 22:31:43 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue, 28 Jan 2025 22:31:12 -0800
Message-Id: <20250129063112.4139-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738132304; x=1738737104; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rhsGdSM8oz1UumdmeHpcThRzYWysJsZH6O5qkC8YhhU=;
 b=j0ROswmTZkInPM2w+ItNZjCyN6KBz/1iRTYjPGHkbJW0pzCw0AnC+IJ0ku4FvzBK7z
 Bas5MpE2w8uQKUAD0o27E6G93T1BR2FZfepqm5RF5sbin9W2mw58MDN+Z2JAZcrWxFOM
 oYwLpuuuWxKJh43y0pGW/eIviAdNiAR1Mjm6oq4eu7zTuANokdLejGoIypN84EL6qcfr
 QF0943dAt0fISFLcGHLlCP1en6p2Ka5iZcuDK+vlJgGkSXGsXD/L/HkB+/0WpjTTeEjS
 IXUYtvsjUlDpeTrDLSh3UwA472LZ1Q33E07CvxBd1Nv+/cNhfRzdWGxjIHbumUfCs6so
 /9/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j0ROswmT
Subject: [Buildroot] [PATCH 1/1] configs/ls1046a-rdb: new defconfig
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
Content-Type: multipart/mixed; boundary="===============0045032992235768790=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0045032992235768790==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

This is a reference design board for the NXP LS1046A SoC.

The config is heavily based on the ls1046a-frwy_defconfig.

see https://www.nxp.com/design/design-center/development-boards-and-designs/LS1046A-RDB

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 DEVELOPERS                                    |  4 +
 board/freescale/ls1046a-rdb/genimage.cfg      | 29 +++++++
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../ls1046a-rdb/patches/linux/linux.hash      |  2 +
 .../ls1046a-rdb/patches/uboot/uboot.hash      |  2 +
 board/freescale/ls1046a-rdb/readme.txt        | 84 +++++++++++++++++++
 .../boot/extlinux/extlinux.conf               |  4 +
 configs/ls1046a-rdb_defconfig                 | 43 ++++++++++
 9 files changed, 171 insertions(+)
 create mode 100644 board/freescale/ls1046a-rdb/genimage.cfg
 create mode 100644 board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/ls1046a-rdb/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/ls1046a-rdb/patches/linux/linux.hash
 create mode 100644 board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
 create mode 100644 board/freescale/ls1046a-rdb/readme.txt
 create mode 100644 board/freescale/ls1046a-rdb/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 configs/ls1046a-rdb_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 31815b1272..a03f55fcde 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -72,6 +72,10 @@ N:	Adrien Gallouët <adrien@gallouet.fr>
 F:	package/bird/
 F:	package/glorytun/
 
+N:	Akhilesh Nema <nemaakhilesh@gmail.com>
+F:	board/freescale/ls1046a-rdb/
+F:	configs/ls1046a-rdb_defconfig
+
 N:	Alejandro González <alejandro.gonzalez.correo@gmail.com>
 F:	package/qprint/
 F:	package/watchdog/
diff --git a/board/freescale/ls1046a-rdb/genimage.cfg b/board/freescale/ls1046a-rdb/genimage.cfg
new file mode 100644
index 0000000000..63cca042b2
--- /dev/null
+++ b/board/freescale/ls1046a-rdb/genimage.cfg
@@ -0,0 +1,29 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition fsbl {
+		offset = 4K
+		in-partition-table = "no"
+		image = "bl2_sd.pbl"
+	}
+
+	partition ssbl {
+		offset = 1M
+		in-partition-table = "no"
+		image = "fip.bin"
+	}
+
+	partition fman {
+		offset = 9M
+		in-partition-table = "no"
+		image = "fsl_fman_ucode_ls1046_r1.0_106_4_18.bin"
+	}
+
+	partition rootfs {
+		offset = 16M
+		partition-type = 0x83
+		bootable = "true"
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..344a6299d8
--- /dev/null
+++ b/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f03dad74e5c3df8059554def03e9298b6fbd4ffdd3e940a18b7e84a60b12a37a  atf-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/patches/linux-headers/linux-headers.hash b/board/freescale/ls1046a-rdb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/ls1046a-rdb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/ls1046a-rdb/patches/linux/linux.hash b/board/freescale/ls1046a-rdb/patches/linux/linux.hash
new file mode 100644
index 0000000000..fa38fb1f75
--- /dev/null
+++ b/board/freescale/ls1046a-rdb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  5665b927616a7e27e69f3f8fface6dd693b01f35d42ae4f9a0f0a10be3621487  linux-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash b/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..a1e3b69376
--- /dev/null
+++ b/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  00fc7bd053de19d02c990b3aa214a27c6103f4306e756f3f6d4afb12314556e4  u-boot-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/readme.txt b/board/freescale/ls1046a-rdb/readme.txt
new file mode 100644
index 0000000000..d50a65a0ef
--- /dev/null
+++ b/board/freescale/ls1046a-rdb/readme.txt
@@ -0,0 +1,84 @@
+***************
+NXP LS1046A-RDB
+***************
+
+This file documents the Buildroot support for the LS1046A Reference Design Board.
+
+for more details about the board and the QorIQ Layerscape SoC, see the following pages:
+  - https://www.nxp.com/design/design-center/development-boards-and-designs/LS1046A-RDB
+  - https://www.nxp.com/products/LS1046A
+ 
+for the NXP LDP (Linux Distribution POC), see
+  - https://www.nxp.com/design/design-center/software/embedded-software/linux-software-and-development-tools/layerscape-linux-distribution-poc:LAYERSCAPE-SDK
+
+the components provided by NXP are:
+  - rcw, lf-6.6.52-2.2.0
+  - atf (fork), lf-6.6.52-2.2.0
+  - uboot (fork), lf-6.6.52-2.2.0
+  - qoriq-fm-ucode (blob), lf-6.6.52-2.2.0
+  - linux (fork), lf-6.6.52-2.2.0
+
+Build
+=====
+
+First, configure Buildroot for the LS1046A-RDB board:
+
+  make ls1046a-rdb_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl2_sd.pbl
+  - fip.bin
+  - fsl_fman_ucode_ls1046_r1.0_106_4_18.bin
+  - fsl_fman_ucode_ls1046_r1.0_108_4_9.bin
+  - fsl-ls1046a-rdb.dtb
+  - fsl-ls1046a-rdb-sdk.dtb
+  - Image
+  - PBL.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - sdcard.img
+  - u-boot.bin
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
+  dd if=output/images/sdcard.img of=/dev/sdX
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/ls1046a-rdb/genimage.cfg.
+
+Boot the LS1046A-ARDB board
+===========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the DIP switches 
+  SW3[1:8] = 01000110
+  SW4[1:8] = 00111011
+  SW5[1:8] = 00100000 (select SD Card boot option)
+- put a Micro-USB cable into the console port and connect using a terminal emulator
+  at 115200 bps, 8n1.
+- power on the board.
+
+Alternatively, SD card boot can also be selected from the uboot command prompt:
+- insert the SD card in the SD slot of the board;
+- put a Micro-USB cable into console Port and connect using a terminal emulator
+- power on the board.
+- press any key to stop at the uboot command prompt.
+- run the following uboot command
+  => cpld reset sd
diff --git a/board/freescale/ls1046a-rdb/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/ls1046a-rdb/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..bbf26e2e4f
--- /dev/null
+++ b/board/freescale/ls1046a-rdb/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label ls1046ardb-buildroot
+  kernel /boot/Image
+  devicetree /boot/fsl-ls1046a-rdb-sdk.dtb
+  append console=ttyS0,115200 root=/dev/mmcblk0p1 earlycon=uart8250,mmio,0x21c0500 rootwait
diff --git a/configs/ls1046a-rdb_defconfig b/configs/ls1046a-rdb_defconfig
new file mode 100644
index 0000000000..441d461298
--- /dev/null
+++ b/configs/ls1046a-rdb_defconfig
@@ -0,0 +1,43 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/ls1046a-rdb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="ls1046ardb"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/freescale/ls1046a-rdb/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-rdb/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.52-2.2.0)/linux-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1046a-rdb freescale/fsl-ls1046a-rdb-sdk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_QORIQ_FM_UCODE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.52-2.2.0)/atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.52-2.2.0)/u-boot-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046ardb_tfa"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_QORIQ_RCW=y
+BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1046ardb/RR_FFSSPPPH_1133_5559/rcw_1800_sdboot.rcw"
-- 
2.25.1


--===============0045032992235768790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0045032992235768790==--
