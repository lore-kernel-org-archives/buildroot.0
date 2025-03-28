Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E73C36014
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 19:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4129785992;
	Fri, 28 Mar 2025 19:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHaD6hSm3leU; Fri, 28 Mar 2025 19:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F08618598F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F08618598F;
	Fri, 28 Mar 2025 19:57:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60FD812A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46317858A6
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGcZVw7eMmoq for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 19:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1232F850BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1232F850BF
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1232F850BF
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so1468614f8f.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 12:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743191866; x=1743796666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6XTaPeoOFNAESPj8/uzHz9wkQOugkzv14L6mAgykyBs=;
 b=Cz8b3LCFh3JG0ydLpEGduM+L1oqpa1KFsOF6Sr4uoBaE/JBnBkHU1RYFf5ueQkHrwc
 RjktyuUJp3MbQ9LP8E1bjT2m+y24la3VgsRNNztztBiOePyekuYDLXzfaV/fTPU6V47g
 XWFoqyQA+82Qn79C8gGzxPsMRfV3MD9B8vTDrKEb2wdlGNG+rGLAvQDuWBfK+Xnpeys6
 DbU8iUCrVBXmI3sgiR5+b1X2r1DjrgAUm48Z1KZx8cyf2UC1x15h26S4xolnn+Kd5A9M
 OoafaSYvq8epFBcevwksAXIpYEKEw4xkuy5LnAqsfUh4peQ2lzzUwi51P0SOhIp6umyk
 I2Vw==
X-Gm-Message-State: AOJu0YwPL1tMGtKZ+diXjtMFYliP4AjshhzBAziN4fS87ZQqLXy9Unxj
 dUWDSRct110ikoIVVykToMe2fw1M8Z/RSwcgetpxQXvNYdLA+ZLo+CGiVQ==
X-Gm-Gg: ASbGncvPLTdJvpjMTVBZak/CA6XFt/s4i1+ALruJvnZiuFIQrohmHnuAZBCD+j2gILG
 ANUwUHpc7ljZG04gLQ4EHmWtLTTxmk26YLDKnBlQaamTKlVLprMA93S+0zBUK0bPPZS17iBZaED
 rOUcUWYZcja80Mli7MqE007t1UpOA2CqgXVb/uMUeh5bBlyf8zwFTuyyUY9VNmIKrF7NP71dVE6
 GU2qG0m63/8F4wdfT3WeL3tnlQYWWT/3yVRUwcXXyw2qa/VVHJlKQDq93U+BXpdOx5zf1RGfrWX
 CjMMkU+YhJQ8/Tq479Rn3GU2sXK6Ai8S6pkmq7f15zBu92GtY5XjIPkrF5S8xpCUKHK4Vp6u97Q
 Hay0eSBU86hw0F5UdrE7mgr5xQbh8mU+SsQiWGig=
X-Google-Smtp-Source: AGHT+IGpLjr2vWkZP5hsLqnWb4WbMrTMtNgMiMefR4baSo51hcBap4ShRY53ljPn92MbD91FEXVoGg==
X-Received: by 2002:a05:6000:2183:b0:39c:1257:c7a3 with SMTP id
 ffacd0b85a97d-39c1257c7damr204592f8f.59.1743191865892; 
 Fri, 28 Mar 2025 12:57:45 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e0dcsm3552272f8f.64.2025.03.28.12.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 12:57:45 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>, ju.o@free.fr,
 Francois Dugast <francois.dugast.foss@gmail.com>
Date: Fri, 28 Mar 2025 20:57:40 +0100
Message-Id: <20250328195741.3921731-4-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328195741.3921731-1-francois.dugast.foss@gmail.com>
References: <20250328195741.3921731-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743191866; x=1743796666; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6XTaPeoOFNAESPj8/uzHz9wkQOugkzv14L6mAgykyBs=;
 b=LxQk8cM6exCJFGyHgzedfbFCq/WoAglTcQoJ3fWNk5lmWvYUiIYEe6B8c5W5MWAS8R
 +1KV41brK0nGu2dvIeon4J7zxMD76KlL45Dh5HRJAksoH76FhJDWByFWfHQHgOhIUUIm
 S8EWMO5eQjgAGKG6Nz2mzn6buu6MRVhSW7khNhR77CRXBbLKWerqeU+6uSR3J+PmQFD0
 7RGh3+enNiT7uS7i70jV6MbBQ2Wu+F08+dalO+8L6GDS7FaAiH2dbwti6D2pmRx+Z096
 zWLISpx7psemyrSS7Jqi88REtPoEnAoRv5b259Wn+Zja9FZQ7Hg75ipGBpKFXr06TY7Y
 t6Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LxQk8cM6
Subject: [Buildroot] [PATCH 3/4] configs/hifive_unmatched: new board
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

This patch adds support for the HiFive Unmatched board. This includes
building the firmware, kernel and rootFS for the HiFive Unmatched.

The configuration is similar to the one for the HiFive Unleashed, this
is why most of it is shared in board/sifive/common.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 board/sifive/hifive-unmatched/boot.cmd        |   4 +
 .../patches/linux-headers/linux-headers.hash  |   2 +
 .../hifive-unmatched/patches/linux/linux.hash |   2 +
 .../patches/opensbi/opensbi.hash              |   2 +
 board/sifive/hifive-unmatched/readme.txt      | 100 ++++++++++++++++++
 configs/hifive_unmatched_defconfig            |  46 ++++++++
 6 files changed, 156 insertions(+)
 create mode 100644 board/sifive/hifive-unmatched/boot.cmd
 create mode 100644 board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash
 create mode 100644 board/sifive/hifive-unmatched/patches/linux/linux.hash
 create mode 100644 board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash
 create mode 100644 board/sifive/hifive-unmatched/readme.txt
 create mode 100644 configs/hifive_unmatched_defconfig

diff --git a/board/sifive/hifive-unmatched/boot.cmd b/board/sifive/hifive-unmatched/boot.cmd
new file mode 100644
index 0000000000..3f7b1d9ce3
--- /dev/null
+++ b/board/sifive/hifive-unmatched/boot.cmd
@@ -0,0 +1,4 @@
+setenv bootargs earlycon=sbi root=/dev/mmcblk0p3 rootwait
+load mmc 0:3 ${kernel_addr_r} boot/Image
+load mmc 0:3 ${fdt_addr_r} boot/hifive-unmatched-a00.dtb
+booti ${kernel_addr_r} - ${fdt_addr_r}
diff --git a/board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash b/board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..2c68ef093b
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  230e89b07b0ab82e74f07ecc1bee3105dca81d0ef4a97f900929c407249b6ac7  linux-6.12.20.tar.xz
diff --git a/board/sifive/hifive-unmatched/patches/linux/linux.hash b/board/sifive/hifive-unmatched/patches/linux/linux.hash
new file mode 100644
index 0000000000..2c68ef093b
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  230e89b07b0ab82e74f07ecc1bee3105dca81d0ef4a97f900929c407249b6ac7  linux-6.12.20.tar.xz
diff --git a/board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash b/board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..1408f547b8
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  8fcbce598a73acc2c7f7d5607d46b9d5107d3ecbede8f68f42631dcfc25ef2b2  opensbi-1.2.tar.gz
diff --git a/board/sifive/hifive-unmatched/readme.txt b/board/sifive/hifive-unmatched/readme.txt
new file mode 100644
index 0000000000..0a4ebcd2f1
--- /dev/null
+++ b/board/sifive/hifive-unmatched/readme.txt
@@ -0,0 +1,100 @@
+SiFive HiFive Unmatched
+=======================
+
+This file describes how to use the pre-defined Buildroot
+configuration for the SiFive HiFive Unmatched board.
+
+Further information about the HiFive Unmatched board can be found
+at https://www.sifive.com/boards/hifive-unmatched
+
+Building
+========
+
+Configure Buildroot using the default board configuration:
+
+  $ make hifive_unmatched_defconfig
+
+Customise the build as necessary:
+
+  $ make menuconfig
+
+Start the build:
+
+  $ make
+
+Result of the build
+===================
+
+Once the build has finished you will have the following files:
+
+    output/images/
+    +-- boot.scr
+    +-- fw_dynamic.bin
+    +-- fw_dynamic.elf
+    +-- fw_jump.bin
+    +-- fw_jump.elf
+    +-- hifive-unmatched-a00.dtb
+    +-- Image
+    +-- rootfs.cpio
+    +-- rootfs.ext2
+    +-- rootfs.ext4
+    +-- rootfs.tar
+    +-- sdcard.img
+    +-- u-boot.bin
+    +-- u-boot.itb
+    +-- u-boot-spl.bin
+
+
+Creating a bootable SD card with genimage
+=========================================
+
+By default Buildroot builds a SD card image for you. All you need to do
+is dd the image to your SD card, which can be done with the following
+command on your development host:
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdb bs=4096
+
+The above example command assumes the SD card is accessed via a USB card
+reader and shows up as /dev/sdb on the host. Adjust it accordingly per
+your actual setup.
+
+Booting the SD card on the board
+================================
+
+Make sure that the all DIP switches are set to the off position for
+default boot mode (MSEL mode = 1011), insert the SD card and power
+up the board.
+
+Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).
+
+See the 'SiFive HiFive Unmatched Getting Started Guide' for
+more details (https://www.sifive.com/documentation).
+
+You will get a warning reported by fdisk when you examine the SD card.
+This is because the genimage_sdcard.cfg file doesn't specify the SD card
+size (as people will naturally have different sized cards), so the
+secondary GPT header is placed after the rootfs rather than at the end
+of the disk where it is expected to be.
+
+You will see something like this at boot time:
+
+[    0.989458] mmc0: host does not support reading read-only switch, assuming write-enable
+[    0.996772] mmc0: new SDHC card on SPI
+[    1.001634] mmcblk0: mmc0:0000 SD8GB 7.28 GiB
+[    1.038079] GPT:Primary header thinks Alt. header is not at the end of the disk.
+[    1.044759] GPT:52389 != 15264767
+[    1.048051] GPT:Alternate GPT header not at the end of the disk.
+[    1.054015] GPT:52389 != 15264767
+[    1.057323] GPT: Use GNU Parted to correct GPT errors.
+[    1.062479]  mmcblk0: p1 p2 p3
+
+
+Testing under QEMU
+==================
+
+The SD card image can be tested using QEMU:
+
+$ qemu-system-riscv64 -M sifive_u,msel=11 -smp 5 -m 8G \
+    -display none -serial stdio -nic user \
+    -bios output/images/u-boot-spl.bin \
+    -drive file=output/images/sdcard.img,if=sd
diff --git a/configs/hifive_unmatched_defconfig b/configs/hifive_unmatched_defconfig
new file mode 100644
index 0000000000..0e1f5c0aa5
--- /dev/null
+++ b/configs/hifive_unmatched_defconfig
@@ -0,0 +1,46 @@
+BR2_riscv=y
+BR2_riscv_custom=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/sifive/hifive-unmatched/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.20"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unmatched-a00"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_unmatched"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/sifive/hifive-unmatched/boot.cmd"
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
