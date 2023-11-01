Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E76BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 01:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A47ED8415C;
	Wed,  1 Nov 2023 01:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A47ED8415C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94wlKovF0KiZ; Wed,  1 Nov 2023 01:31:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DE17840BA;
	Wed,  1 Nov 2023 01:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DE17840BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 080F01BF976
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 01:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5515840BA
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 01:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5515840BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8uMlqrlxSGk for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 01:31:36 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C14DD840B4
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 01:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C14DD840B4
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cc131e52f1so3102445ad.0
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 18:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698802295; x=1699407095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QAQk4qQDtOjG+D1P6oL37DA9x7CzPUe52+qLN2dkPAo=;
 b=UUy+c0sHZiz6M5SUmwiRBJVVg/2PsAOX9mpBXoBBRwJ73YpY0K2722J+7N6nUu1tT/
 cPgku4+2wvWZu7L17wtpGCRGlEqXbg8+aFZavG12UmFQy+xlapys0R0HgOMs1C4yh/hv
 lT3SsaBcFVVGs+ZYzkqabgEVkGM1/h3D2uTs1zXsCxtQldw6D7BT/yi+X7FNWQJ/RrDK
 0WB7fgj7il2nxtcN+66e9u1yPF30/iXCYQYjjZ3EPhu/vx4uVQ0xBaI5wTov9nea+jbc
 YNwPd0esrCYLkKsHzAsQ9m8z8o+ZcOfQfYA1LbW+uw6CCHMxaxIPTSX/pWqIVwtK8Oi1
 NjIQ==
X-Gm-Message-State: AOJu0YwyiFe3y1GFvoo48Hk8XLtBhNZETQROVxVgw3iEYYmT6czTmpv+
 9Pr8+zYJydrPvXJgNeeWIZtJfm577b8=
X-Google-Smtp-Source: AGHT+IET+mkkFgunJljUFcW29K32/lo7gv0QJuh7FvR881Y5jcdsN96eYFsR66/2iSqIRe+AAzSyow==
X-Received: by 2002:a17:90b:1e0d:b0:27d:d9a:be8b with SMTP id
 pg13-20020a17090b1e0d00b0027d0d9abe8bmr5850236pjb.6.1698802295157; 
 Tue, 31 Oct 2023 18:31:35 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 on15-20020a17090b1d0f00b0026f39c90111sm1659427pjb.20.2023.10.31.18.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 18:31:34 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 09:31:27 +0800
Message-Id: <20231101013128.13305-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698802295; x=1699407095; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QAQk4qQDtOjG+D1P6oL37DA9x7CzPUe52+qLN2dkPAo=;
 b=SK7mBLNIpwIftgBqrqiVIasxsf6vzfBmIFjPRZh8ke8fBOmhvjqtBwBSfQMARegIZg
 ZL41C5rNJ1uUIqOO8VoWbQXC3c94vHjgjRZ1MiCF7FQ20EtGGkS8q3Qq+l4rtwTrtKh4
 Ym63V9nJxAR3wsIh5bbZbGYs0dI/ebuhedlNPERneysUW3dmi4/Igknt9T0GRw6TjRpa
 eJgMYBjPAL5UvqomiJjW8aOmbXXookRSjtDi7eHg/p+31YoyjYOvrAFktN81MsKLMs4n
 5OvtEJIz5YLLSxFZTEDYVQfFVjqajBDDwwE0YTzbGh4V32EdJNl/1zCAy2jFYtxlz2Ks
 9TGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SK7mBLNI
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
