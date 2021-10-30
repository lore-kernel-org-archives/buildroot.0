Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2FDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:37:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2081860E8B
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2081860E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openest.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E58BB401EA;
	Sat, 30 Oct 2021 21:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LY7Z-vB1mPek; Sat, 30 Oct 2021 21:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEADA401FF;
	Sat, 30 Oct 2021 21:36:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 307921BF23C
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 202C780D35
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lsZqiBGSvTyx for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 21:36:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2500480D34
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 21:36:33 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id v17so22186947wrv.9
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 14:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6emVCS23x6BEadyXbLaVcXvhIiATtCd2s8gNYVeiP0A=;
 b=lQd4LfTdBQTbN5p3oMiFklIhXZpwWK/460SZVLIH/VO6hl9o6hEQM8C53IWAORJj5p
 IsOR6XgDPpbJMJ0lTwedNWRdtQqPBs5gH8dDQnO7JKeY3xI44l2oqtQcLEsamu+Akpet
 0q4cdhbWH9sgw5QsDwC3Vm3GP24GZNl7BsVMG2w13QZh/S0gy/e5UwgKFodMM1UceWcl
 xusiPSeeCnt8+62qNaE96w/wmDEsPTc1kZrkbZfGL4Zo+nP4bGdXYqHT9g9IheEDFJ3b
 fmbq+EetDj6yhPfvx9jrZEoGNUU0qqNnJnzbxmkiTiWFoNjdIyqOReH1i/WPSnkTG/Ee
 yJGw==
X-Gm-Message-State: AOAM5338VMjGqi/gCgKppEKUxNUoP4ZPCGrQ5P0HOB4mBj34DZi8ex5d
 L4ffDydK8zWjkioTqPmzWt6hnJcy9y4=
X-Google-Smtp-Source: ABdhPJxEB92J5cEEr+lyPeVAvZ78nVjw8YTQepT1TBC55d5Y5vxrr1WipLrXOtfbTr5xm73EG5rgzA==
X-Received: by 2002:a05:6000:18ce:: with SMTP id
 w14mr25248111wrq.230.1635629791045; 
 Sat, 30 Oct 2021 14:36:31 -0700 (PDT)
Received: from alderan.numericable.fr (249.164.25.93.rev.sfr.net.
 [93.25.164.249])
 by smtp.gmail.com with ESMTPSA id m34sm7830766wms.25.2021.10.30.14.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 14:36:30 -0700 (PDT)
From: Julien Grossholtz <julien.grossholtz@openest.io>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 23:36:00 +0200
Message-Id: <20211030213600.3445223-3-julien.grossholtz@openest.io>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030213600.3445223-1-julien.grossholtz@openest.io>
References: <20211030213600.3445223-1-julien.grossholtz@openest.io>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] board/raspberrypi: add Raspberry Pi Zero 2 W
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
Cc: Peter Seiderer <ps.report@gmx.net>, Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Raspberry-Pi Zero 2 W is an affordable single board computer. It is
a more powerful drop-in replacement for the Raspberry Pi Zero W.

The board incorporates an Raspberry-Pi RP3A0 system-in-package (SiP) with
a Broadcom BCM2710A1 and 512MB LPDDR2 SDRAM. The CPU is a quad-core 1Ghz
64-bit Arm Cortex-A53. As for other Raspberry-Pis it also provides
2.4GHz 802.11 b/g/n Wifi, Bluetooth 4.2 and BLE.

The BCM2710 cpu is similar to the Raspberry-Pi 3, it uses the same
kernel configuration as the Raspberry-Pi 3.

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
---
 board/raspberrypi/config_zero2w.txt           | 29 +++++++++++++++
 .../genimage-raspberrypizero2w.cfg            | 31 ++++++++++++++++
 board/raspberrypi/readme.txt                  |  5 +++
 board/raspberrypizero2w                       |  1 +
 configs/raspberrypizero2w_defconfig           | 36 +++++++++++++++++++
 5 files changed, 102 insertions(+)
 create mode 100644 board/raspberrypi/config_zero2w.txt
 create mode 100644 board/raspberrypi/genimage-raspberrypizero2w.cfg
 create mode 120000 board/raspberrypizero2w
 create mode 100644 configs/raspberrypizero2w_defconfig

diff --git a/board/raspberrypi/config_zero2w.txt b/board/raspberrypi/config_zero2w.txt
new file mode 100644
index 0000000000..9e6b7f5ccf
--- /dev/null
+++ b/board/raspberrypi/config_zero2w.txt
@@ -0,0 +1,29 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B ,zero W and zero 2) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
diff --git a/board/raspberrypi/genimage-raspberrypizero2w.cfg b/board/raspberrypi/genimage-raspberrypizero2w.cfg
new file mode 100644
index 0000000000..7d7987d900
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypizero2w.cfg
@@ -0,0 +1,31 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "bcm2710-rpi-zero-2.dtb",
+      "rpi-firmware/bootcode.bin",
+      "rpi-firmware/cmdline.txt",
+      "rpi-firmware/config.txt",
+      "rpi-firmware/fixup.dat",
+      "rpi-firmware/start.elf",
+      "rpi-firmware/overlays",
+      "zImage"
+    }
+  }
+  size = 32M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 98c44d80a1..8f0d3144eb 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -28,6 +28,10 @@ For model Zero (model A+ in smaller form factor):
 
   $ make raspberrypi0_defconfig
 
+For model Zero 2 W (model B3 in smaller form factor):
+
+  $ make raspberrypizero2w_defconfig
+
 For model 2 B:
 
   $ make raspberrypi2_defconfig
@@ -76,6 +80,7 @@ After building, you should obtain this tree:
     output/images/
     +-- bcm2708-rpi-b.dtb           [1]
     +-- bcm2708-rpi-b-plus.dtb      [1]
+    +-- bcm2710-rpi-zero-2.dtb      [1]
     +-- bcm2709-rpi-2-b.dtb         [1]
     +-- bcm2710-rpi-3-b.dtb         [1]
     +-- bcm2710-rpi-3-b-plus.dtb    [1]
diff --git a/board/raspberrypizero2w b/board/raspberrypizero2w
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypizero2w
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
new file mode 100644
index 0000000000..451b037fa3
--- /dev/null
+++ b/configs/raspberrypizero2w_defconfig
@@ -0,0 +1,36 @@
+BR2_arm=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-zero-2"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypizero2w/config_zero2w.txt"
+
+# MicroSD images generation tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w/post-image.sh"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
