Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FC4C001B5
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 08:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D740F80F02;
	Tue, 31 Oct 2023 08:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D740F80F02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFPKqbR5j80h; Tue, 31 Oct 2023 08:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6FA080FA7;
	Tue, 31 Oct 2023 08:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6FA080FA7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6ECC21BF329
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 08:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47CE161188
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 08:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47CE161188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YM2kk3d5VSHB for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 08:49:48 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F1186117B
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 08:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F1186117B
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-28041176e77so1605833a91.0
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 01:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698742187; x=1699346987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FZm8mTTi90y5f7pqp+iQSU5mpgrVMCMCKrZfW0+cZ5k=;
 b=PYI02oo3UWGsD9K1lsOPC9B2TnZf9cRR9uCvN92IO38SK1xhtvWsap7i7WfNR+u5W7
 a2teQapx07M4mAwBeuZpTkvGn5AOuv8jd7+QD/7vtVNP6/ZcxzrH6rglP9HE0JmM0UrA
 qyPWERUzKK0I4mqS70xFlx67mIEhhx9tSRqP0x76v5EsMAyaVdZMh8NEpkog+gAJI3c8
 Q81x2Kfm/jTxA42ZZ0V0kCYXS5lx949/SSNe6rdsl54ge5tGDLK053lIvKfEzl60zObn
 5HsYqylUJUeKVd9KzwOttW1Nh6VotpkY38psG/G8hbiUFg1v4hM+vjLwZq8rV4yBIkQW
 Hy6g==
X-Gm-Message-State: AOJu0YwOWwpUI7peflp9MdgLY0yQm2+60Vyr6JNlA7r2ZDQBhK92Ravo
 c2s4BMmvtElnsx7V0CyjP6a2w+U0o7g=
X-Google-Smtp-Source: AGHT+IHbtnKxtkFr3tE2M9Al/pZ2JDcLl4Q2vH0QSYUQr2J3XDSFqdrwG3NBtSmhzEqFpkLcnMefgQ==
X-Received: by 2002:a17:90b:111:b0:27d:61ff:3d3b with SMTP id
 p17-20020a17090b011100b0027d61ff3d3bmr9005140pjz.38.1698742186886; 
 Tue, 31 Oct 2023 01:49:46 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 23-20020a17090a031700b0028095e2edb8sm779875pje.5.2023.10.31.01.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 01:49:46 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 16:49:35 +0800
Message-Id: <20231031084936.2397858-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698742187; x=1699346987; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FZm8mTTi90y5f7pqp+iQSU5mpgrVMCMCKrZfW0+cZ5k=;
 b=SmUy9paRLC4csw9AKR/klnS853+vjubSSA9GhFinpNW/oOLuWZqrPNNLpTgLa9+aUz
 gKC1NqNs70O595T0bzjllaBQdMhy7DkeLWg6Yv4nyL8cc6yZMl4NMVRSgfb6Cw9AsGN9
 IoUWrsMd1obkJgWq+Y2LkdI32xGI8ZBMh9DtRYiw5d0o4mdq0EqLrIFQAvMXP1zOt7Md
 AS5hiK5NMp5C2V+yJsBvCZ4jAeYtzVHYJo50tWfUvrpWXvH6ltCwsQbjTEQQlBaR3075
 74G1ovE85/A7Ko+7LVjgT9tzDddNU2+ew0BwpMcYr9PqyLhvJsG8fwaiAfjsYMYhe0NM
 Nl9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SmUy9paR
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
 board/friendlyarm/nanopi-neo2/extlinux.conf   |  4 ++
 board/friendlyarm/nanopi-neo2/genimage.cfg    | 40 ++++++++++++++++
 board/friendlyarm/nanopi-neo2/post-build.sh   |  8 ++++
 board/friendlyarm/nanopi-neo2/readme.txt      | 34 +++++++++++++
 .../nanopi-neo2/uboot/fit_spl.fragment        |  1 +
 .../nanopi-neo2/uboot/fit_spl_atf_its.patch   | 48 +++++++++++++++++++
 configs/friendlyarm_nanopi_neo2_defconfig     | 48 +++++++++++++++++++
 7 files changed, 183 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-neo2/extlinux.conf
 create mode 100644 board/friendlyarm/nanopi-neo2/genimage.cfg
 create mode 100755 board/friendlyarm/nanopi-neo2/post-build.sh
 create mode 100644 board/friendlyarm/nanopi-neo2/readme.txt
 create mode 100644 board/friendlyarm/nanopi-neo2/uboot/fit_spl.fragment
 create mode 100644 board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch
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
index 0000000000..0ee47013f1
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+# Parse BINARIES_DIR variable from arguments while missing in environment variable
+[ -n "${BINARIES_DIR}" ] || BINARIES_DIR="$1"
+
+install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux/extlinux.conf"
diff --git a/board/friendlyarm/nanopi-neo2/readme.txt b/board/friendlyarm/nanopi-neo2/readme.txt
new file mode 100644
index 0000000000..50795a1cfb
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
+  $ sudo sync
+
+Insert the micro SDcard in your Nanopi NEO2 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/board/friendlyarm/nanopi-neo2/uboot/fit_spl.fragment b/board/friendlyarm/nanopi-neo2/uboot/fit_spl.fragment
new file mode 100644
index 0000000000..50447d0dff
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/uboot/fit_spl.fragment
@@ -0,0 +1 @@
+CONFIG_SPL_FIT_SOURCE="board/friendlyarm/nanopi-neo2/fit_spl_atf.its"
diff --git a/board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch b/board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch
new file mode 100644
index 0000000000..b2edd9fb37
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch
@@ -0,0 +1,48 @@
+diff --git a/board/friendlyarm/nanopi-neo2/fit_spl_atf.its b/board/friendlyarm/nanopi-neo2/fit_spl_atf.its
+new file mode 100644
+index 0000000000..7447d23988
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
diff --git a/configs/friendlyarm_nanopi_neo2_defconfig b/configs/friendlyarm_nanopi_neo2_defconfig
new file mode 100644
index 0000000000..a88bf8957c
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
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_PATCH="board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch"
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
