Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E42C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 01:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B93F8813FA;
	Wed,  1 Nov 2023 01:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B93F8813FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Za4lG_BytI1l; Wed,  1 Nov 2023 01:35:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2517C81444;
	Wed,  1 Nov 2023 01:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2517C81444
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 660481BF976
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 01:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47AC54049F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 01:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47AC54049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhEORCn4-0gQ for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 01:35:04 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2771640491
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 01:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2771640491
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cbf47fa563so49816895ad.2
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 18:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698802502; x=1699407302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QAQk4qQDtOjG+D1P6oL37DA9x7CzPUe52+qLN2dkPAo=;
 b=PYvvr++uB7hti0gHMTRYNnfNYMvkuUaeOdfDXuQmpOx1veyczlL7TPUu1FAgkUhl3a
 1N2JfULG42YbJkJ8Gd8/LUtWbVC0SzIA/l+9hbZ6oSzhpIT+FNesgJJ/LVX5MuBhKzfv
 H30NWXxrYQsMQxK/e6R3pjxGEXuPZlaugugPbE2wiifIrTkmQS4+eVOcrM217g7dzjAh
 MnoYpb+Tv29vwwamkAW7YTxGMNMBrMsQpwEyQPGqmG0qWUFf8O9MgtAM6v9X9q1KxdWC
 lOiGkrwnLnvDeu2du5zwaj/YekQHhfc7h29O1ALDnaKtHzN8MMPszw3izkUa3orq2LJ4
 xljQ==
X-Gm-Message-State: AOJu0Yxmxw1SXfHiY3jtHi2cTQdpyAwrD1Py66pIJJAO1w8gfaWMDqi6
 nZNeXmmlJEYfJBeFL3RPUKKVpud0i74=
X-Google-Smtp-Source: AGHT+IFYKpZkg+PT+faPhXb4M5gSyeNGzzOaV0WHG26b8jxfO/UMhajONBwQ7JAu3UDIK3/yvwSTPw==
X-Received: by 2002:a17:902:ccca:b0:1bd:c7e2:462 with SMTP id
 z10-20020a170902ccca00b001bdc7e20462mr14690533ple.11.1698802502529; 
 Tue, 31 Oct 2023 18:35:02 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 jk6-20020a170903330600b001c61901ed2esm182523plb.219.2023.10.31.18.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 18:35:02 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 09:34:56 +0800
Message-Id: <20231101013457.13495-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031084936.2397858-1-fancp2007@gmail.com>
References: <20231031084936.2397858-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698802502; x=1699407302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QAQk4qQDtOjG+D1P6oL37DA9x7CzPUe52+qLN2dkPAo=;
 b=nh7dOJqQjkcvLIGimGvpgF786yarVA/Bsm6SSi2WDZCsddTvbH+zdceKVcTtjZuxks
 pMRhsJ+/nKmOypUwy6HRxIIi6Tq6reGniKLEA1L7COXpS4wr4SFf9AWC+/uCnka0ekVO
 /mVVC6sZoNg1GoGPIpwfv+1y4c7SaUc8adFmrU5YAorXRw6Pue5epIzGBbzWVi7hIbHD
 SORqfRVAkJoYAFiLnPnbYih4UpLek2zE20Go9wI3EvzpqfeJKn5pHJGPL+iuz/Nqr/Ae
 rVrVsJR67KNT/uM3FrKY93Tbz3bNycRFVufTqp881slroAauHWSe2OZDx3IIK6ZaNVTz
 cjXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nh7dOJqQ
Subject: [Buildroot] [PATCH] configs/friendlyarm_nanopi_neo2_defconfig: new
 board
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
---
 board/friendlyarm/nanopi-neo2/extlinux.conf   |  4 ++
 board/friendlyarm/nanopi-neo2/genimage.cfg    | 40 ++++++++++++
 board/friendlyarm/nanopi-neo2/post-build.sh   |  8 +++
 board/friendlyarm/nanopi-neo2/readme.txt      | 34 ++++++++++
 ...fitImage-source-file-for-NanoPi-NEO2.patch | 62 +++++++++++++++++++
 .../nanopi-neo2/uboot/fit_spl.fragment        |  1 +
 configs/friendlyarm_nanopi_neo2_defconfig     | 50 +++++++++++++++
 7 files changed, 199 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-neo2/extlinux.conf
 create mode 100644 board/friendlyarm/nanopi-neo2/genimage.cfg
 create mode 100755 board/friendlyarm/nanopi-neo2/post-build.sh
 create mode 100644 board/friendlyarm/nanopi-neo2/readme.txt
 create mode 100644 board/friendlyarm/nanopi-neo2/uboot/0001-ARM-Add-default-fitImage-source-file-for-NanoPi-NEO2.patch
 create mode 100644 board/friendlyarm/nanopi-neo2/uboot/fit_spl.fragment
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
index 0000000000..607547442a
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/readme.txt
@@ -0,0 +1,34 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Nanopi NEO2. With the current configuration
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
+Insert the micro SDcard in your Nanopi NEO2 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/board/friendlyarm/nanopi-neo2/uboot/0001-ARM-Add-default-fitImage-source-file-for-NanoPi-NEO2.patch b/board/friendlyarm/nanopi-neo2/uboot/0001-ARM-Add-default-fitImage-source-file-for-NanoPi-NEO2.patch
new file mode 100644
index 0000000000..c4396c506a
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/uboot/0001-ARM-Add-default-fitImage-source-file-for-NanoPi-NEO2.patch
@@ -0,0 +1,62 @@
+From a58df11b8676009ef951de3cfba0e1495f1cd551 Mon Sep 17 00:00:00 2001
+From: Scott Fan <fancp2007@gmail.com>
+Date: Wed, 1 Nov 2023 09:03:44 +0800
+Subject: [PATCH] ARM: Add default fitImage source file for NanoPi NEO2 board
+
+Signed-off-by: Scott Fan <fancp2007@gmail.com>
+---
+ board/friendlyarm/nanopi-neo2/fit_spl_atf.its | 42 +++++++++++++++++++
+ 1 file changed, 42 insertions(+)
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
+-- 
+2.25.1
+
diff --git a/board/friendlyarm/nanopi-neo2/uboot/fit_spl.fragment b/board/friendlyarm/nanopi-neo2/uboot/fit_spl.fragment
new file mode 100644
index 0000000000..50447d0dff
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/uboot/fit_spl.fragment
@@ -0,0 +1 @@
+CONFIG_SPL_FIT_SOURCE="board/friendlyarm/nanopi-neo2/fit_spl_atf.its"
diff --git a/configs/friendlyarm_nanopi_neo2_defconfig b/configs/friendlyarm_nanopi_neo2_defconfig
new file mode 100644
index 0000000000..b9cd8547ef
--- /dev/null
+++ b/configs/friendlyarm_nanopi_neo2_defconfig
@@ -0,0 +1,50 @@
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
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=v2.7
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
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/friendlyarm/nanopi-neo2/uboot/fit_spl.fragment"
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
