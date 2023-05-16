Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFDBC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 11:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1BC241174;
	Tue, 16 May 2023 11:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BC241174
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dFuhofGVrwD; Tue, 16 May 2023 11:05:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97B85409A6;
	Tue, 16 May 2023 11:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97B85409A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 443C01BF3AA
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 11:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 298B641606
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 11:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 298B641606
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOjKIV69G_aU for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 11:05:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E382415AE
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E382415AE
 for <buildroot@buildroot.org>; Tue, 16 May 2023 11:05:29 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3078aa0b152so7559215f8f.3
 for <buildroot@buildroot.org>; Tue, 16 May 2023 04:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684235126; x=1686827126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfxqAaCS2FshlAYRhUXoGfIdCyJ+clsIzzQeVWUKSTs=;
 b=YsyFtjYGtQyKBUT1xDPTrx8+CiEpXqhZIKR/VLM9qK9NEkUnaJP8be3iHzxWvyxbrU
 l86LTF/No273dTd38r+gXxdt+ETCrFpmMU7LR1l4vmhtUViQF2o4uk6TT2P3K18SZMFL
 mbyaQr5z0d07OWhuGBTAKEL5sWdkM4K1FU6U8O9xE0/gPZ5Uaf7tObqj7dgV9bSdBRmS
 IDsN2OnmWf+Rv0SFRxjvtixsoS8r+2rQ/xUxCrPW3wLdxx6nZbXShFwZNg6JQhVUAI5P
 QJHSXN3/MjIfwxOE3JMyxKpXQ4RKUzeAKATqf+JfcUy1qKFbYtdbSB27CqoWjPSDnQK0
 sYKA==
X-Gm-Message-State: AC+VfDxXVn6ZY/iPN7RJTBkhEjJNl5yFvyWrsNP/eRtlOJTVo2E17urn
 gujM0KtJtK5PW8M3wPwW679K8Pw2+LFvxW/I0VE=
X-Google-Smtp-Source: ACHHUZ515k0XWC5ZtCeBrQdTMrh6fBJoyjsCRsYUUHBq12wrQqUuDz87+kiqsdM8MDbML2Bua7M9fw==
X-Received: by 2002:a05:6000:192:b0:2f2:7a7e:6ac with SMTP id
 p18-20020a056000019200b002f27a7e06acmr23625172wrx.48.1684235126187; 
 Tue, 16 May 2023 04:05:26 -0700 (PDT)
Received: from localhost.localdomain
 ([2a04:cec0:c02a:37d4:6b9b:10d4:310a:f5c4])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a5d46ce000000b00304aba2cfcbsm2363908wrs.7.2023.05.16.04.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 04:05:24 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 13:04:28 +0200
Message-Id: <20230516110429.1052749-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516110429.1052749-1-sebastian.weyer@smile.fr>
References: <20230516110429.1052749-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1684235126; x=1686827126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfxqAaCS2FshlAYRhUXoGfIdCyJ+clsIzzQeVWUKSTs=;
 b=zMuQCaX+2Ip7ixBT77EejDllywBbhetP9bFJEepkShi/FiHUF9NFLvhVtQDJBzefDT
 k/mYRq7EhTcJ4urPcU7rHmVbrP72ducrjLqwqQi0ybtHHdlANeS1QkpyT4sCimsI5c+U
 VuQIQ2SUcIMvk827EnQ97TGD3e62vzj0/goFhXz+9MkO08TiWh/7+ieiGwYdhkzSq7S5
 3V3enHczewbONTINL4i4hrPV6cjYDmbL0WqNVr+HhVlJJaitN/SIqDWPBPdn3X8raJPe
 lrNziz811jTumx2JMQw2KcMiK3ZAebKQCGQOD5jRqfDPDrgrr5XrViq7NWc3Vko2ILkE
 xpFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=zMuQCaX+
Subject: [Buildroot] [PATCH 2/2] configs/khadas_vim3_defconfig: new defconfig
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
index 0000000000..af1d6aa699
--- /dev/null
+++ b/board/khadas/vim3/post-image.sh
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+GENIMAGE_CFG="'${BOARD_DIR}'/genimage.cfg"
+GENIMAGE_TMP="'${BUILD_DIR}'/genimage.tmp"
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
