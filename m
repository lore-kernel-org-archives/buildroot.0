Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D542CC36005
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 17:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73DF240C0E;
	Sun, 23 Mar 2025 17:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OG-4nTJ-IigU; Sun, 23 Mar 2025 17:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AC4D40C1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC4D40C1A;
	Sun, 23 Mar 2025 17:28:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 245241C9
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 17:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1681960866
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 17:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHlVmFVBMJB4 for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 17:28:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11D32608EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11D32608EB
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11D32608EB
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 17:28:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso24673445e9.1
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 10:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742750899; x=1743355699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tfgk/8O7g4rCkul7vKv+U3I4YWP+Hz6JtJATtcrRn2Q=;
 b=Xi2sv9vzs76JAxpx61ckd0P5r8hVjwnISg5O0C8EIw1PrLoByiFQ+L67OAbypNV1v2
 y+aghwBBd7PR9I+Ga8Ly5Bv6fRsC4GsJ9GX4JKLn71NZIGfaOPZn3k1ijxW4NL9p8VX7
 DG0AdtlE1DhiakFygRF3rjNBQZXS5/d/XdGX9rnFghoGiWGT2H+I7aeVaiCR5+Ivs+Op
 V441hXswxKcy+vzU9K/0euANVnIovvw2sClhX+mkIUaAfpUhWl8TJa9gDcvDKdix4ziQ
 Zk9QVOsPLpSAD0EKsyYSf3T07mFPtKI3wNyoEPCUsKZhEgkGUVuayABM6rBopr2f4oVm
 916w==
X-Gm-Message-State: AOJu0YyOcmMvYRVQDLWbEi3MZaAjuAKUllXcn/NBTFv6Aht8tanjn+L2
 ehbJxYQ4D3a5H0ytdc1K1J1mjJ8bgwFcEXep71/cUP3amwPfWT2T0MYKHtF0
X-Gm-Gg: ASbGncuhdl03L+86Qu8jUqF2axWHBwCl7UZ3AKLZghw9ea5z52Z9wRMG5iUX7fVmClw
 GQrMccT5tK/8eMMQGv8rybmGlIgUDXov8VkZUJFQygzOEFqtVqvCZorDmOwBBtIvt6eRPtUc78o
 eclHRQLHumG/P3MpkFi621KhnEHC+TfD1/+lyFk8bCEGCpQEuGnsV7iuUS3F0wBsbGwG473Lv0f
 EQn6f0Xt2oNmrgLflltZX9Ckp7j/q2tcycCJNKgtKw8APPvwAf9HGdyoou91GzEIP6wlXKKjlEg
 hsxmiGKGNerFkvalRfX18BgDz2wpTWuRyNIV8GpeaTjvxp2uan9VLVHibHL93do98YOP11RqO9B
 Ii9aF74uv3wr7EF/g3ioK7KgrG8/6
X-Google-Smtp-Source: AGHT+IEG/yBJKhOFdSxBTRhBT6XE2KEctcyFKbpvoX+GMDwZQsCd1CQpxM1is72jz62FXUOMxbNoDA==
X-Received: by 2002:a5d:64a5:0:b0:391:31f2:b99e with SMTP id
 ffacd0b85a97d-3997f900bd7mr9120800f8f.2.1742750898844; 
 Sun, 23 Mar 2025 10:28:18 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39abafed528sm4875241f8f.27.2025.03.23.10.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 10:28:18 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Dugast <francois.dugast.foss@gmail.com>
Date: Sun, 23 Mar 2025 18:28:06 +0100
Message-Id: <20250323172806.558397-3-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250323172806.558397-1-francois.dugast.foss@gmail.com>
References: <20250323172806.558397-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742750899; x=1743355699; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tfgk/8O7g4rCkul7vKv+U3I4YWP+Hz6JtJATtcrRn2Q=;
 b=ld8Xu180xAQyaSwRtVS6E+ZnNfYUKFp9inQeO7eqErtyn7VohH5SxxrX3sU4LImQyJ
 wKQ9hoVl2k2JGWNaw01lU3yIqmixzgHJlyVYt2PvkC9Ni797irbS3BjIHICA5jKeCsj0
 2YnXoy9DdfYLOHub6S/eHlp9JcTk4s5HUvJJBRbh3ldIRUYlp3u+WACkhYl3tJRICPMr
 b9T7ukeUoabt3RMb0wnhv5k8xUM6Bsh1ReqXWyixEdHszbkjcg1iP15kk4P9JYibMt93
 l4lK7I4+AYylDG1Mu2mq6pDdaNQk6ne/DD77ky/dPxjMpBGZkUSN1oWEWXA/+KcQ1fEW
 nMFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ld8Xu180
Subject: [Buildroot] [PATCH 2/2] configs/hifive_unmatched: new board
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
 board/sifive/hifive-unmatched/boot.cmd   |   4 +
 board/sifive/hifive-unmatched/readme.txt | 100 +++++++++++++++++++++++
 configs/hifive_unmatched_defconfig       |  38 +++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 board/sifive/hifive-unmatched/boot.cmd
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
index 0000000000..e26aaefb57
--- /dev/null
+++ b/configs/hifive_unmatched_defconfig
@@ -0,0 +1,38 @@
+BR2_riscv=y
+BR2_riscv_custom=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
+BR2_LINUX_KERNEL=y
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
