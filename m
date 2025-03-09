Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B30C28B25
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 13:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38DBE406F5;
	Sun,  9 Mar 2025 13:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nTGxhYAA9eB; Sun,  9 Mar 2025 13:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84DED40E07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84DED40E07;
	Sun,  9 Mar 2025 13:03:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C2D51C1
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 13:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18E144023E
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 13:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oepANQRUkB-f for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 13:03:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=kanakshilledar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 888AF400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 888AF400AC
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 888AF400AC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 13:03:05 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2f74e6c6cbcso941557a91.2
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 06:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741525384; x=1742130184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w5UOTs/wC5wuR0xzPJfYbge1f6wa4EqHXG78pXSpqtc=;
 b=seGC0zL2+Of90TVgBPm557Ba2vZ3ft8A5slG/2H2HPxwJ4GiTH3Fl0eFsuT5OicqZ/
 0FbWTuspORNtXHcTzukaeXrFHonP5HnrUsJve6xoLa6Y9uJq+0t/PobouN0awfpY3CYR
 LuqxKi5NwLHZ0t4QMhADLAHHAf9hKPTcdA6MTpqmwcOq2/xuC2uOADR00ZuMxl16SSCM
 BaZPq1Ol8WRZsPuMbUdvRHDHVg0WwU+GZI2UtZn1N5tIdNwcZUQ961OBIZApLSCLjzN3
 /JVw3DfX9DP7vM8ngEVHrDTXBpMDCLZTSaBIyxzUEE6uD3WwDcX/nhF2UBw5eS8cLdxX
 6ZKQ==
X-Gm-Message-State: AOJu0YxmJoCoKAu51ifn61SEI3WKpzvBQZMNu5XNWS2UEYJ0eE+bLVJ4
 7QGgOfjQtI63KHFwOGEFjyHFg0i4rVBS6e8x38DSf9ukauk/gf3ySRjJoCYB
X-Gm-Gg: ASbGnct4lDA3xKtTQQzwGscHxuQFvN2b7pD/gl6sqTc65SQ7NaXrISxHz2WMADlHtEA
 ckWsTt7EoZ5os6NtswIZTrd+KvKxqnv7/sgn4pNO4K2BHimlyUcZ+Tu2T+y1LzxjTW0DgrqaWVJ
 NKllsRhoK3zZcaD5No6RlJdwzvOLpqrW0a2sigVU9AhjaDAuabFK1QuWV+BEWY84XxMYd3bwUsj
 wfhNRetTvk2dva/bSveiUlo/4l+YiL0qjEaEnqOMTsQph3p9z2/1Zhtf4f8l4Uokp16zEGlwX1C
 LtbC5iZCfekN+1jDAxedNYn0BfliPJXLKG7Gx5JNJS5JUg5kNUFKOF5AhkApVsE5Hqmn7Mk=
X-Google-Smtp-Source: AGHT+IEUgYDEQq5qJGYj6pVju4M/1bnzKTwABuRSSvB0I+n/cHilXyM4TtgLyy90YHFr+38MTHU1gw==
X-Received: by 2002:a05:6a00:140d:b0:730:8526:5db2 with SMTP id
 d2e1a72fcca58-736bee60851mr2865445b3a.5.1741525384398; 
 Sun, 09 Mar 2025 06:03:04 -0700 (PDT)
Received: from ga401ii.. (j254.ucndns.in. [103.155.210.254])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-736dae80528sm43377b3a.133.2025.03.09.06.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 06:03:03 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun,  9 Mar 2025 18:32:32 +0530
Message-ID: <20250309130230.1520839-5-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309130230.1520839-2-kanakshilledar@gmail.com>
References: <20250309130230.1520839-2-kanakshilledar@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741525384; x=1742130184; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w5UOTs/wC5wuR0xzPJfYbge1f6wa4EqHXG78pXSpqtc=;
 b=WlhdW7nFdZJ9TlgF8O+uTfPtZiBbrEFKFRUf5KErt4pjklHRRoutz0jMR1NTJGLph4
 rX+Op9vPuXlGJhZlKEdsxTW48fnS50sq+iJPe/D6ShtLpOxnkpUxYFs5bqKQ/WDR601V
 XODwv0aA5KN/FLl6BLlz5O4IIel3gdPsi80WrbNWIc96rmg4Gwdm+6ETKzgUScI3hVvU
 2HjYPPm4NhlDH1yrrfntWjeJHZIKJN29f7u2DO0U94K3P+HCT8EF60BT/0htZMBOm3mb
 oj3oyUs9rWmOWt91ex865dMS0Q1XF4IEJlrZQmPsiDWjUAQQqTCJow/Yv3JMoBn7XBar
 PzmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WlhdW7nF
Subject: [Buildroot] [PATCH v2 2/2] configs/sipeed_licheepi_4a: add new board
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
---
Changes in v2:
 - removed "use-mke2fs=true" for creating ext4 and switched to default
 - fixed documentation formatting
 - added global patch dir for hash checking
 - fixed kernel version in defconfig
 - removed _BUSYBOX_SHOW_OTHERS option
 - removed HDPARM and IPERF3 package
 - added commit hashes to uboot and opensbi
 - added self to DEVELOPERS file
---

Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
 DEVELOPERS                                    |  2 +
 .../sipeed/licheepi_4a/extlinux/extlinux.conf |  4 ++
 board/sipeed/licheepi_4a/genimage.cfg         |  7 +++
 .../patches/linux-headers/linux-headers.hash  |  2 +
 .../licheepi_4a/patches/linux/linux.hash      |  2 +
 .../licheepi_4a/patches/opensbi/opensbi.hash  |  2 +
 .../licheepi_4a/patches/uboot/uboot.hash      |  2 +
 board/sipeed/licheepi_4a/post-image.sh        | 25 +++++++++
 board/sipeed/licheepi_4a/readme.txt           | 54 +++++++++++++++++++
 configs/sipeed_licheepi_4a_defconfig          | 42 +++++++++++++++
 10 files changed, 142 insertions(+)
 create mode 100644 board/sipeed/licheepi_4a/extlinux/extlinux.conf
 create mode 100644 board/sipeed/licheepi_4a/genimage.cfg
 create mode 100644 board/sipeed/licheepi_4a/patches/linux-headers/linux-headers.hash
 create mode 100644 board/sipeed/licheepi_4a/patches/linux/linux.hash
 create mode 100644 board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
 create mode 100644 board/sipeed/licheepi_4a/patches/uboot/uboot.hash
 create mode 100755 board/sipeed/licheepi_4a/post-image.sh
 create mode 100644 board/sipeed/licheepi_4a/readme.txt
 create mode 100644 configs/sipeed_licheepi_4a_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 45eed3630c..519193ad8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2055,6 +2055,8 @@ F:	package/libqb/
 F:	package/usbguard/
 
 N:	Kanak Shilledar <kanakshilledar@gmail.com>
+F:	board/sipeed/licheepi_4a/
+F:	configs/sipeed_licheepi_4a_defconfig
 F:	package/sipeed-lpi4abins/
 
 N:	Karoly Kasza <kaszak@gmail.com>
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
index 0000000000..54cef1db9b
--- /dev/null
+++ b/board/sipeed/licheepi_4a/genimage.cfg
@@ -0,0 +1,7 @@
+image boot.ext4 {
+	ext4 {
+		label = "boot"
+	}
+
+	size = 64M
+}
diff --git a/board/sipeed/licheepi_4a/patches/linux-headers/linux-headers.hash b/board/sipeed/licheepi_4a/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..b2db374438
--- /dev/null
+++ b/board/sipeed/licheepi_4a/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  beb902a5f69d9e57710112203db38111dad6d30556ea8ce389284c8077fe944d  linux-6.12.18.tar.xz
diff --git a/board/sipeed/licheepi_4a/patches/linux/linux.hash b/board/sipeed/licheepi_4a/patches/linux/linux.hash
new file mode 100644
index 0000000000..b2db374438
--- /dev/null
+++ b/board/sipeed/licheepi_4a/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  beb902a5f69d9e57710112203db38111dad6d30556ea8ce389284c8077fe944d  linux-6.12.18.tar.xz
diff --git a/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash b/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..5ced5c95cc
--- /dev/null
+++ b/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  2510c0e867b4f8c28579def9a21e97fa2e8de95b8c7d66bb8b6642202bcee3b4  opensbi-61d7484c752a5e4c464d5dc18e21d9ac67fbbefa-git4.tar.gz
diff --git a/board/sipeed/licheepi_4a/patches/uboot/uboot.hash b/board/sipeed/licheepi_4a/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b63a8d79d4
--- /dev/null
+++ b/board/sipeed/licheepi_4a/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6158b9c6faee41a1e790ad4ba2e1b3e18a122ecdb5749fa77c7495a2d1c56262  uboot-b5ee6e549a7b5ff382a14021a5d6a3c94017bddd-git4.tar.gz
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
index 0000000000..0bb33f781c
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
+-------------------------
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
+======================
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
index 0000000000..dff04450eb
--- /dev/null
+++ b/configs/sipeed_licheepi_4a_defconfig
@@ -0,0 +1,42 @@
+BR2_riscv=y
+BR2_RISCV_ISA_RVC=y
+BR2_RISCV_ISA_RVV=y
+BR2_GLOBAL_PATCH_DIR="board/sipeed/licheepi_4a/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="licheepi4a"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi 4A"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sipeed/licheepi_4a/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.18"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="thead/th1520-lichee-pi-4a"
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW88=y
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
+BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="61d7484c752a5e4c464d5dc18e21d9ac67fbbefa"
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="light_lpi4a"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/revyos/thead-u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="b5ee6e549a7b5ff382a14021a5d6a3c94017bddd"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
