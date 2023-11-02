Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7626FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 09:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22DB14337C;
	Thu,  2 Nov 2023 09:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22DB14337C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grPYA6JI_aQb; Thu,  2 Nov 2023 09:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1442432AC;
	Thu,  2 Nov 2023 09:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1442432AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3161BF28F
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7381E4F015
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7381E4F015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XmsCvFlVYSJF for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 09:02:48 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3825A4F02D
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 09:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3825A4F02D
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5bd099e3d3cso501609a12.1
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 02:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698915767; x=1699520567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aCDq1sQaaFidwNI21JGuFbXEqNly8qD8zDgq2s9CHXo=;
 b=lWXOsbRa+H/8eBWQEpELkoinGUeshPrLYLXepx3M+RsSl2ROxnDMx2sa2IYWc69EBA
 81iWnZtz6fX8ElM/O0fSLkIbzTO1Z5JNc6ZNFo4wWwR245Z/PQkOkzOSNoKCKIxVF4QY
 JmQyKmCXolXhyY+dTcvitKVJUGXt5pWODvKq1NVlHYz04OIaHyNDLFv3zdOZIOTeY1QV
 dsvu3uDmQE47R5MYd+aoSP6FqnKlgLYz4ZyCrurf52RNnGsw9ag7MxtJNN+8sGRpFhda
 cKIHPVs/GlhcYaJSkVBb6psqiPNTC/X6uh2E2tCEWWQBIH/D0XhnNI+zhu2QHMy+33mm
 EMnw==
X-Gm-Message-State: AOJu0YyqE3Qa2HuUN5Wj6iS8ntEGNlNcdyBTzeMbqlyLRGkdf6FvOqyL
 vYBaLa49g9SEGa8hQNUtaJnR7HJD42I=
X-Google-Smtp-Source: AGHT+IFro/swYfIpnhsBLZw5wsjs3iRmlOIH5/qBbPISA8V9RNlOKOUVo8JnjP4sBE7LCaUMGBshLQ==
X-Received: by 2002:a17:90a:f298:b0:280:2856:5eef with SMTP id
 fs24-20020a17090af29800b0028028565eefmr10176327pjb.22.1698915766576; 
 Thu, 02 Nov 2023 02:02:46 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 8-20020a17090a018800b0028098225450sm2237915pjc.1.2023.11.02.02.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 02:02:46 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 17:02:40 +0800
Message-Id: <20231102090241.2390530-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698915767; x=1699520567; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aCDq1sQaaFidwNI21JGuFbXEqNly8qD8zDgq2s9CHXo=;
 b=S9DatVU0I+OQlluqDiB42ivfd+Amu7m6/dYzYcd6SulUzOmiIKMRtjoNTbQW6HmLXI
 brAHXvFvOpFbaucrmErMnrQCyhQ6Bq/ktPqPvvmj8Rlo3DNeo6ZRh/3qwf5RiG/XbLm3
 W1WxO40WNXmP3C8AYAiS7Q5KJiyI/M3dl2HvKvNH2zxUn6nfsknqtmMxcntG9R6kwnb4
 6EcweEcAZ2rKR78e6BPCSAZC16C0+YaX+0jp5/yYQVnhZjw6YhXbldsokINArhP37JSK
 KE7d4ks/KsP+HAu96GqoxrqIdMOnkuWN4ObQle8ssiEAFzEBjAup4X0STqVAMbIU9bRj
 oVQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S9DatVU0
Subject: [Buildroot] [PATCH v3] configs/friendlyarm_nanopi_neo2_defconfig:
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
  - Linux 6.1.60

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

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/friendlyarm/nanopi-neo2/extlinux.conf   |  4 +
 board/friendlyarm/nanopi-neo2/genimage.cfg    | 40 ++++++++++
 board/friendlyarm/nanopi-neo2/post-build.sh   |  8 ++
 board/friendlyarm/nanopi-neo2/readme.txt      | 34 ++++++++
 ...fitImage-source-file-for-NanoPi-NEO2.patch | 77 +++++++++++++++++++
 configs/friendlyarm_nanopi_neo2_defconfig     | 49 ++++++++++++
 6 files changed, 212 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-neo2/extlinux.conf
 create mode 100644 board/friendlyarm/nanopi-neo2/genimage.cfg
 create mode 100755 board/friendlyarm/nanopi-neo2/post-build.sh
 create mode 100644 board/friendlyarm/nanopi-neo2/readme.txt
 create mode 100644 board/friendlyarm/nanopi-neo2/uboot/0001-ARM-Add-default-fitImage-source-file-for-NanoPi-NEO2.patch
 create mode 100644 configs/friendlyarm_nanopi_neo2_defconfig

diff --git a/board/friendlyarm/nanopi-neo2/extlinux.conf b/board/friendlyarm/nanopi-neo2/extlinux.conf
new file mode 100644
index 0000000000..04aea276a2
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/extlinux.conf
@@ -0,0 +1,4 @@
+label friendlyarm-nanopi-buildroot
+  kernel /Image
+  devicetree /sun50i-h5-nanopi-neo2.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
diff --git a/board/friendlyarm/nanopi-neo2/genimage.cfg b/board/friendlyarm/nanopi-neo2/genimage.cfg
new file mode 100644
index 0000000000..54465ca7fe
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/genimage.cfg
@@ -0,0 +1,40 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-h5-nanopi-neo2.dtb",
+			"extlinux"
+		}
+	}
+
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition spl {
+		in-partition-table = "no"
+		image = "sunxi-spl.bin"
+		offset = 8K
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 40K
+		size = 1M # 1MB - 40KB
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/friendlyarm/nanopi-neo2/post-build.sh b/board/friendlyarm/nanopi-neo2/post-build.sh
new file mode 100755
index 0000000000..9cb196ac8d
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+# Parse BINARIES_DIR variable from arguments while missing in environment variable
+[ -n "${BINARIES_DIR}" ] || BINARIES_DIR="$1"
+
+install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux/extlinux.conf"
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
diff --git a/board/friendlyarm/nanopi-neo2/uboot/0001-ARM-Add-default-fitImage-source-file-for-NanoPi-NEO2.patch b/board/friendlyarm/nanopi-neo2/uboot/0001-ARM-Add-default-fitImage-source-file-for-NanoPi-NEO2.patch
new file mode 100644
index 0000000000..a1a13c67c0
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/uboot/0001-ARM-Add-default-fitImage-source-file-for-NanoPi-NEO2.patch
@@ -0,0 +1,77 @@
+From e7f237e5ded90bc422ab9254ce8f7530c163cf3a Mon Sep 17 00:00:00 2001
+From: Scott Fan <fancp2007@gmail.com>
+Date: Thu, 2 Nov 2023 08:03:39 +0800
+Subject: [PATCH] ARM: Add default fitImage source file for NanoPi NEO2 board
+
+Upstream: https://github.com/u-boot/u-boot/pull/443
+
+Signed-off-by: Scott Fan <fancp2007@gmail.com>
+---
+ board/friendlyarm/nanopi-neo2/fit_spl_atf.its | 42 +++++++++++++++++++
+ configs/nanopi_neo2_defconfig                 |  1 +
+ 2 files changed, 43 insertions(+)
+ create mode 100644 board/friendlyarm/nanopi-neo2/fit_spl_atf.its
+
+diff --git a/board/friendlyarm/nanopi-neo2/fit_spl_atf.its b/board/friendlyarm/nanopi-neo2/fit_spl_atf.its
+new file mode 100644
+index 0000000000..18b5d0d681
+--- /dev/null
++++ b/board/friendlyarm/nanopi-neo2/fit_spl_atf.its
+@@ -0,0 +1,42 @@
++/dts-v1/;
++
++/ {
++    description = "Configuration to load ATF before U-Boot";
++    #address-cells = <1>;
++
++    images {
++        uboot {
++            description = "U-Boot (64-bit)";
++            data = /incbin/("u-boot-nodtb.bin");
++            type = "standalone";
++            arch = "arm64";
++            compression = "none";
++            load = <0x4a000000>;
++        };
++        atf {
++            description = "ARM Trusted Firmware";
++            data = /incbin/("bl31.bin");
++            type = "firmware";
++            arch = "arm64";
++            compression = "none";
++            load = <0x44000>;
++            entry = <0x44000>;
++        };
++        fdt_1 {
++            description = "sun50i-h5-nanopi-neo2";
++            data = /incbin/("arch/arm/dts/sun50i-h5-nanopi-neo2.dtb");
++            type = "flat_dt";
++            compression = "none";
++        };
++    };
++    configurations {
++        default = "config_1";
++
++        config_1 {
++            description = "sun50i-h5-nanopi-neo2";
++            firmware = "uboot";
++            loadables = "atf";
++            fdt = "fdt_1";
++        };
++    };
++};
+diff --git a/configs/nanopi_neo2_defconfig b/configs/nanopi_neo2_defconfig
+index 95dd56aa04..2a75fc01d8 100644
+--- a/configs/nanopi_neo2_defconfig
++++ b/configs/nanopi_neo2_defconfig
+@@ -2,6 +2,7 @@ CONFIG_ARM=y
+ CONFIG_ARCH_SUNXI=y
+ CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-nanopi-neo2"
+ CONFIG_SPL=y
++CONFIG_SPL_FIT_SOURCE="board/friendlyarm/nanopi-neo2/fit_spl_atf.its"
+ CONFIG_MACH_SUN50I_H5=y
+ CONFIG_DRAM_CLK=672
+ CONFIG_DRAM_ZQ=3881977
+-- 
+2.25.1
+
diff --git a/configs/friendlyarm_nanopi_neo2_defconfig b/configs/friendlyarm_nanopi_neo2_defconfig
new file mode 100644
index 0000000000..243e5ce66b
--- /dev/null
+++ b/configs/friendlyarm_nanopi_neo2_defconfig
@@ -0,0 +1,49 @@
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
+BR2_TARGET_UBOOT_PATCH="board/friendlyarm/nanopi-neo2/uboot"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.60"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-nanopi-neo2"
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
