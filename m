Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E3FC10DC3
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 00:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C9E4404B5;
	Fri,  8 Dec 2023 00:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C9E4404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgc_wC7KOf2D; Fri,  8 Dec 2023 00:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 291C240525;
	Fri,  8 Dec 2023 00:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 291C240525
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 873891BF57C
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 00:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6003A60E89
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 00:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6003A60E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CeVjqr-ZFUmP for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 00:38:01 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B62C60E7D
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 00:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B62C60E7D
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d0a7b72203so13967365ad.2
 for <buildroot@buildroot.org>; Thu, 07 Dec 2023 16:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701995880; x=1702600680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DbnTeiLRGmOYRISHd8H1S0u2bmNnwV6i8Lrb8rceo5s=;
 b=gTB4wdPvdjrfcFRaqdwsVDsWda50sq11WWYiwuhD0FyTWPMGQXJsHkMF8nPV5ODK+A
 9RByhwhnCHlvoszHheC/0LHkZQRxJx+fzkpCk7EwCI+lP06GPE4rUGnbrzfApfX1G5Jn
 zHyp9vNUpnEUAYG3WFvCdglgex+nTStQxHEI1kRTLcqpzNIxFBXh4EbuJhoU32pMdM2F
 MBTPKlhnbuDIpLfo7eJp4mxoSHG3p99thGxaORKuH3+ftNQjJtBUfqQ6P3/O5fR4At1b
 LYGaF8ULb6jLzJiJyk+VRuMNlKk0zy8AsPSXzqy2CCfuMTeMNXuo6gjKhCaj9A+eBXoJ
 GBkw==
X-Gm-Message-State: AOJu0YxlDIb5aJnysLhTbsYDTZwwM1Gb8S27cU1LkmOpVNUxLF0J8Pro
 Li8mOlMO70EcOAhSY0BnN6rqJz8dcEI=
X-Google-Smtp-Source: AGHT+IFzqvO2NitPKsRQ6Ora3dao0DiLSwcUGZbpV9Kw+jHGw7d0PzjFQTi1DL8AotIsT48PLkUwWQ==
X-Received: by 2002:a17:902:e88f:b0:1d0:6b95:9c0d with SMTP id
 w15-20020a170902e88f00b001d06b959c0dmr4548937plg.65.1701995879773; 
 Thu, 07 Dec 2023 16:37:59 -0800 (PST)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 k9-20020a170902c40900b001b9e9edbf43sm414667plk.171.2023.12.07.16.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 16:37:59 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Dec 2023 08:37:46 +0800
Message-Id: <20231208003746.9505-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231104192335.2920640-1-fancp2007@gmail.com>
References: <20231104192335.2920640-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701995880; x=1702600680; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DbnTeiLRGmOYRISHd8H1S0u2bmNnwV6i8Lrb8rceo5s=;
 b=JyNKV+RRzqHiR1F2wAOwCzRG0co7XZO4QIcWIFZGsjOF7lF1oGE0nFW0TZI5OSsCZ7
 gPkcUrsgeHI76xkQv+YQvfRsKFz1PaXQ1g1KoP8qgPp7CQkRMWxTL2+2jP+w1XjSUeiQ
 PyvpfGSzZA7JNPjXthAtdnfdHTjVHBAID8OD27K5vqojEQw6kjCUbvhv9M3N4N6o2lbU
 DP9+czb26ErPVDhgHJrEpTuKblQje5Pb8+PeivuR5oLDYh1cNyqJzeTGWLC8hS5GzbnT
 WP26LEF/LAwljEKdcLZQIQ+NmQf8hRMNnUy4E/rFMOAxa71ldjOA9XPOIRFmCn8ancQf
 DkVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JyNKV+RR
Subject: [Buildroot] [PATCH v5] configs/friendlyarm_nanopi_neo2_defconfig:
 new board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the FriendlyARM NanoPi NEO2 with mainline components:
  - U-Boot 2023.10
  - Linux 6.1.65

Board's wiki page:
  - https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO2

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - Fix issues from 'utils/docker-run make check-package'
  - Add atf custom version in the defconfig
  - No need for sudo to run sync

Changes v2 -> v3:
  - Update patch file, add the upstream tag

Changes v3 -> v4:
  - Use a single integrated image file (u-boot-sunxi-with-spl.bin)
  - Remove patch file for uboot, switch to binman
  - Merge boot partition into rootfs partition
  - Bump kernel version to 6.1.61

Changes v4 -> v5:
  - Bump kernel version to 6.1.65

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/friendlyarm/nanopi-neo2/extlinux.conf |  4 ++
 board/friendlyarm/nanopi-neo2/genimage.cfg  | 16 +++++++
 board/friendlyarm/nanopi-neo2/post-build.sh |  5 +++
 board/friendlyarm/nanopi-neo2/readme.txt    | 34 +++++++++++++++
 configs/friendlyarm_nanopi_neo2_defconfig   | 48 +++++++++++++++++++++
 5 files changed, 107 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-neo2/extlinux.conf
 create mode 100644 board/friendlyarm/nanopi-neo2/genimage.cfg
 create mode 100755 board/friendlyarm/nanopi-neo2/post-build.sh
 create mode 100644 board/friendlyarm/nanopi-neo2/readme.txt
 create mode 100644 configs/friendlyarm_nanopi_neo2_defconfig

diff --git a/board/friendlyarm/nanopi-neo2/extlinux.conf b/board/friendlyarm/nanopi-neo2/extlinux.conf
new file mode 100644
index 0000000000..482a069f74
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/extlinux.conf
@@ -0,0 +1,4 @@
+label friendlyarm-nanopi-buildroot
+  kernel /boot/Image
+  devicetree /boot/sun50i-h5-nanopi-neo2.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
diff --git a/board/friendlyarm/nanopi-neo2/genimage.cfg b/board/friendlyarm/nanopi-neo2/genimage.cfg
new file mode 100644
index 0000000000..67e4e5efdb
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/genimage.cfg
@@ -0,0 +1,16 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-tpl-spl-dtb {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 1M
+	}
+}
diff --git a/board/friendlyarm/nanopi-neo2/post-build.sh b/board/friendlyarm/nanopi-neo2/post-build.sh
new file mode 100755
index 0000000000..c7ec875068
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${TARGET_DIR}/boot/extlinux/extlinux.conf"
diff --git a/board/friendlyarm/nanopi-neo2/readme.txt b/board/friendlyarm/nanopi-neo2/readme.txt
new file mode 100644
index 0000000000..c896a57525
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/readme.txt
@@ -0,0 +1,34 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the NanoPi NEO2. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Wiki link:
+https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO2
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make friendlyarm_nanopi_neo2_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sync
+
+Insert the micro SDcard in your NanoPi NEO2 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/friendlyarm_nanopi_neo2_defconfig b/configs/friendlyarm_nanopi_neo2_defconfig
new file mode 100644
index 0000000000..a955ec323a
--- /dev/null
+++ b/configs/friendlyarm_nanopi_neo2_defconfig
@@ -0,0 +1,48 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.65"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-nanopi-neo2"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to FriendlyARM NanoPi NEO2"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo2/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo2/genimage.cfg"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
