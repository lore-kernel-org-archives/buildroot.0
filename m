Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015E6C77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 15:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 940FD41E5F;
	Tue, 16 May 2023 15:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 940FD41E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JK1THves37om; Tue, 16 May 2023 15:53:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28E9941E4B;
	Tue, 16 May 2023 15:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28E9941E4B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B04E1BF3AA
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 15:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5434F6163E
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 15:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5434F6163E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCIgQuic7TLO for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 15:53:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD0D16163D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD0D16163D
 for <buildroot@buildroot.org>; Tue, 16 May 2023 15:53:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f42769a0c1so98638905e9.2
 for <buildroot@buildroot.org>; Tue, 16 May 2023 08:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684252415; x=1686844415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5smg/Q5tmXzlX06wSS9XwFnL74Ay9RmKYBdi4adEWgE=;
 b=QZBo1M3z4sXSuUCV0UTvwteS1Lgyz5WEUX+DkuGMs6W54bvp/L4WYxrYVcQ7cwrcCp
 E94PUhkgs/ACD8lXczCx542h+FW7HcOEcoP9vx5gF5u15Xl7bjv0XGXPjd8Midl78zNK
 QtwEbc4rbnpr8+M5hDwf7UkXheR6EAqFbOygDWGnl5WYXlrj13YHmhpqSPZSWItR0g5s
 T+BllRC2hMWQigwsH6Kdk1SpCd8wV5EOKOeLWwor1QDJFSNNXJJiUTZe7iMbl4RklOLi
 QupZ2lyFuDan9uizQn0Kog/GnEvqhdAnwtRtdgZM5w9qTi26zl4pFl5mGx9fL5xB2N1i
 5rFA==
X-Gm-Message-State: AC+VfDyA1iNzajzQZxe1uG3UDCXtcSWJsccbzFi/DZg7zj9iAQn+Oah/
 cNAVlQiIbCglUpi+pKqxAptqJvM3ldVUfancvTY=
X-Google-Smtp-Source: ACHHUZ4cu9HAU2wdoTwvNr+OC4QQ21jx1LMAmCNa3C8SCLgnoBEl15al4hP48gg3mZIRfD7RJvn9JA==
X-Received: by 2002:a05:600c:21c1:b0:3f4:21ff:b91f with SMTP id
 x1-20020a05600c21c100b003f421ffb91fmr22067536wmj.28.1684252415280; 
 Tue, 16 May 2023 08:53:35 -0700 (PDT)
Received: from P-NAN-LIMA.. ([2a04:cec0:1026:f768:f6ad:f1ca:511:b07f])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a7bca59000000b003f17eaae2c9sm2817178wml.1.2023.05.16.08.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 08:53:34 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 17:53:10 +0200
Message-Id: <20230516155310.1341998-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516155310.1341998-1-sebastian.weyer@smile.fr>
References: <20230516155310.1341998-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1684252415; x=1686844415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5smg/Q5tmXzlX06wSS9XwFnL74Ay9RmKYBdi4adEWgE=;
 b=ICgXOC6pJ8h/7sKW+SA8zk6XDQeNfbrUSveEId4j1FLj9JeetIQmWiGhtTzhoMs3+B
 KODxzfVLrvmawRNCzSVGFGDTzGgeD/YbGIHGfpHIF06CqIsLbORg1pLab0569zur8Yam
 YKJb4dq+5oRlfQwCp+7JhSxfy7qdm12WdcG6BQH9wE2gvkA8qod1dS+igr7NkUfVvpLx
 KcRRM8sRxPKYChdtsQMGDn4DqDRuja1WZTXsh9ByhmvstAL5q3ffP2k0j4JEN39J+Jhc
 iYKBka3AP6q1gC0NFILiK0Grbk/cdMGMhmjXtuHKUnL/boy77mnFipItfz2UxkMOg4aE
 CgXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=ICgXOC6p
Subject: [Buildroot] [PATCH v2 2/2] configs/khadas_vim3_defconfig: new
 defconfig
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add defconfig for the Khadas VIM3 board which uses a A311D SoC with a 4x
ARM Cortex-A73 + 2x ARM Cortex-A53 big.LITTLE architecture.

This defconfig includes the Linux mainline kernel version 6.3 as well as
mainline uboot version 2023.04 with an in-tree .dts and uboot-defconfig.
It also includes the host-tool amlogic-boot-fip which is necessary for
signing the bootloader. This host tool is used in the post-image.sh script
in order to generate the signed binary.

This binary is then flashed to the final sdcard.img after it is
generated using genimage. It is done in this way because the bootloader
image needs to be flashed in 2 steps. First the first 444 bytes need to
be flashed to the beginning of the sdcard.img, then we need to skip 68 bytes
in the source and the destination and then write the remaining
bootloader image to the sdcard.img.
Ref: http://docs.khadas.com/products/sbc/vim3/development/create-bootable-tf-card

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
v2: when fixing warnings using shellcheck I added erroneous quotes in
some paths in post-image.sh, leading to the error of not being able to
find genimage.cfg.
---
 board/khadas/vim3/extlinux.conf |  4 ++
 board/khadas/vim3/genimage.cfg  | 33 +++++++++++++++
 board/khadas/vim3/post-build.sh |  5 +++
 board/khadas/vim3/post-image.sh | 38 +++++++++++++++++
 board/khadas/vim3/readme.txt    | 72 +++++++++++++++++++++++++++++++++
 configs/khadas_vim3_defconfig   | 44 ++++++++++++++++++++
 6 files changed, 196 insertions(+)
 create mode 100644 board/khadas/vim3/extlinux.conf
 create mode 100644 board/khadas/vim3/genimage.cfg
 create mode 100755 board/khadas/vim3/post-build.sh
 create mode 100755 board/khadas/vim3/post-image.sh
 create mode 100644 board/khadas/vim3/readme.txt
 create mode 100644 configs/khadas_vim3_defconfig

diff --git a/board/khadas/vim3/extlinux.conf b/board/khadas/vim3/extlinux.conf
new file mode 100644
index 0000000000..fede99b502
--- /dev/null
+++ b/board/khadas/vim3/extlinux.conf
@@ -0,0 +1,4 @@
+default buildroot
+label buildroot
+   kernel /Image
+append root=/dev/mmcblk0p2 rootwait console=ttyAML0,115200
diff --git a/board/khadas/vim3/genimage.cfg b/board/khadas/vim3/genimage.cfg
new file mode 100644
index 0000000000..79d7f9ca07
--- /dev/null
+++ b/board/khadas/vim3/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"meson-g12b-a311d-khadas-vim3.dtb",
+			"extlinux"
+		}
+
+		label = "boot"
+	}
+
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image="boot.vfat"
+		size = 64M
+		offset = 2M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 128M
+		offset = 0
+	}
+}
diff --git a/board/khadas/vim3/post-build.sh b/board/khadas/vim3/post-build.sh
new file mode 100755
index 0000000000..8dae08a47c
--- /dev/null
+++ b/board/khadas/vim3/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux/extlinux.conf
diff --git a/board/khadas/vim3/post-image.sh b/board/khadas/vim3/post-image.sh
new file mode 100755
index 0000000000..053e20faae
--- /dev/null
+++ b/board/khadas/vim3/post-image.sh
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
+ROOTPATH_TMP="$(mktemp -d)"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+	--rootpath "${ROOTPATH_TMP}"   \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+AMLOGIC_DIR=${BINARIES_DIR}/amlogic-boot-fip
+FIP_DIR=${BINARIES_DIR}/fip
+
+if ! [ -d "${FIP_DIR}" ]
+then
+	mkdir "${FIP_DIR}"
+fi
+
+(cd "${AMLOGIC_DIR}" && \
+	./build-fip.sh khadas-vim3 \
+	"${BINARIES_DIR}"/u-boot.bin \
+	"${FIP_DIR}")
+
+dd if="${FIP_DIR}"/u-boot.bin.sd.bin \
+   of="${BINARIES_DIR}"/sdcard.img \
+   conv=fsync,notrunc bs=1 count=444
+
+dd if="${FIP_DIR}"/u-boot.bin.sd.bin \
+   of="${BINARIES_DIR}"/sdcard.img \
+   conv=fsync,notrunc bs=512 skip=1 seek=1
diff --git a/board/khadas/vim3/readme.txt b/board/khadas/vim3/readme.txt
new file mode 100644
index 0000000000..4d1d78d80c
--- /dev/null
+++ b/board/khadas/vim3/readme.txt
@@ -0,0 +1,72 @@
+Khadas VIM3
+
+Description
+===========
+
+This configuration builds a complete image for the Khadas VIM3 to be flashed
+on an SD-card.
+
+How to build it
+===============
+
+Select the default configuration for the target:
+$ make khadas_vim3_defconfig
+
+Optional: modify the configuration:
+$ make menuconfig
+
+Build:
+$ make
+
+Result of the build
+===================
+output/images/
++-- amlogic-boot-fip
++   +-- build-all-fip.sh
++   +-- build-fip.sh
++   +-- g12a.inc
++   `-- khadas-vim3
++       +-- acs.bin
++       +-- acs_tool.py
++       +-- aml_ddr.fw
++       +-- aml_encrypt_g12b
++       +-- bl2.bin
++       +-- bl301.bin
++       +-- bl30.bin
++       +-- bl31.bin
++       +-- bl31.img
++       +-- blx_fix.sh
++       +-- ddr3_1d.fw
++       +-- ddr4_1d.fw
++       +-- ddr4_2d.fw
++       +-- diag_lpddr4.fw
++       +-- lpddr3_1d.fw
++       +-- lpddr4_1d.fw
++       +-- lpddr4_2d.fw
++       +-- Makefile
++       `-- piei.fw
++-- boot.vfat
++-- extlinux
++   `-- extlinux.conf
++-- fip
++   +-- u-boot.bin
++   +-- u-boot.bin.sd.bin
++   +-- u-boot.bin.usb.bl2
++   `-- u-boot.bin.usb.tpl
++-- Image
++-- meson-g12b-a311d-khadas-vim3.dtb
++-- rootfs.ext2
++-- rootfs.ext4 -> rootfs.ext2
++-- rootfs.tar
++-- sdcard.img
+`-- u-boot.bin
+
+The post-image script uses the files in the amlogic-boot-fip folder to sign
+the bootloader image before integrating it into the sdcard image.
+
+To copy the image file to the sdcard use dd:
+$ dd if=output/images/sdcard.img of=/dev/sdX
+
+Tested hardware
+===============
+Khadas vim3 (rev. 14)
diff --git a/configs/khadas_vim3_defconfig b/configs/khadas_vim3_defconfig
new file mode 100644
index 0000000000..82cf323875
--- /dev/null
+++ b/configs/khadas_vim3_defconfig
@@ -0,0 +1,44 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a73_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/khadas/vim3/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/khadas/vim3/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/khadas/vim3/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-g12b-a311d-khadas-vim3"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="khadas-vim3"
+
+# Required tool to sign the bootloader image
+BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP=y
+BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE="khadas-vim3"
+
+# Required tools to create the SD image
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Supporting host tools to build FIT image
+# BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+# BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
