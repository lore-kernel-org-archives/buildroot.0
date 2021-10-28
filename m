Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5542FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 06:26:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC02610D2
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 06:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFC02610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openest.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7626C400F7;
	Thu, 28 Oct 2021 06:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzPuRXbvxU-S; Thu, 28 Oct 2021 06:26:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4555440132;
	Thu, 28 Oct 2021 06:26:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 334591BF350
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 06:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2104E60689
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 06:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KnvFtGIJ3aBc for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 06:26:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A60560676
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 06:26:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id i5so494896wrb.2
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 23:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ihi49+fPq4/bb/WgIUOB1MAMijjWZZn4AuUkLzvt6Nw=;
 b=oOvBV0/rCbHWpOyqvEMv/j6hxEK1FC8uDU95da8cQqVw+IIQDZvlv+xpMxaggQKefQ
 TuOJG4LbFSVI7z/3IPAbpjoAHHekruRWQSyMCuHYdZzrVw1TnOTlrpr/UAlGAuPhPtit
 TMv8S2GcB0FBxMdtrBcuwSj51Do8kv94ZCNeovb1NMAnLDTmG8U1JoOyuJg0erAMebcu
 gdyqt+tNeK8qTdteY0Qe+qkE8KjCkPAUK61zGSs0FK+4AS37suAA9D3+YGnNlxPJPDXz
 Ly+awZd4tEHVpqC3AOVmLIcbv6NAsb+OqDwQftk0vERPB3+E/9CTOZkyOq+H6x91+6X/
 NA1g==
X-Gm-Message-State: AOAM531QLOtG1JsyzP1huqFXS6PsLmpX1rMzHN23DmaSbYqJfd+zX4lZ
 2bN8HB3mjfqaxibUT1JPYnIrZafLNk4=
X-Google-Smtp-Source: ABdhPJyJP9cSuIByUCNviI9ewtcWpKJ08OmJpXwaIVq+RujkZo2NpqjJrPUcVGq7NfTdzwMTiQDxdw==
X-Received: by 2002:a5d:4210:: with SMTP id n16mr3117528wrq.426.1635402383099; 
 Wed, 27 Oct 2021 23:26:23 -0700 (PDT)
Received: from alderan.numericable.fr (249.164.25.93.rev.sfr.net.
 [93.25.164.249])
 by smtp.gmail.com with ESMTPSA id c16sm1997400wrm.46.2021.10.27.23.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 23:26:22 -0700 (PDT)
From: Julien Grossholtz <julien.grossholtz@openest.io>
To: buildroot@buildroot.org
Date: Thu, 28 Oct 2021 08:26:17 +0200
Message-Id: <20211028062617.2772874-2-julien.grossholtz@openest.io>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028062617.2772874-1-julien.grossholtz@openest.io>
References: <20211028062617.2772874-1-julien.grossholtz@openest.io>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi: add Raspberry Pi Zero 2 W
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

The BCM2710 cpu is similar to the Raspberry-Pi 3 and the form factor is
the same as the previous Zero W. Therefore, this board support uses the
Pi 3's Linux configuration and the original Zero W device-tree.

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
---
 board/raspberrypi/config_zero2.txt            | 29 ++++++++++++++
 .../raspberrypi/genimage-raspberrypizero2.cfg | 31 +++++++++++++++
 board/raspberrypi/readme.txt                  |  5 +++
 board/raspberrypizero2                        |  1 +
 configs/raspberrypizero2_defconfig            | 38 +++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 board/raspberrypi/config_zero2.txt
 create mode 100644 board/raspberrypi/genimage-raspberrypizero2.cfg
 create mode 120000 board/raspberrypizero2
 create mode 100644 configs/raspberrypizero2_defconfig

diff --git a/board/raspberrypi/config_zero2.txt b/board/raspberrypi/config_zero2.txt
new file mode 100644
index 0000000000..9e6b7f5ccf
--- /dev/null
+++ b/board/raspberrypi/config_zero2.txt
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
diff --git a/board/raspberrypi/genimage-raspberrypizero2.cfg b/board/raspberrypi/genimage-raspberrypizero2.cfg
new file mode 100644
index 0000000000..f76256ef8a
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypizero2.cfg
@@ -0,0 +1,31 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "bcm2708-rpi-zero-w.dtb",
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
index 98c44d80a1..7d134d17fb 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -28,6 +28,10 @@ For model Zero (model A+ in smaller form factor):
 
   $ make raspberrypi0_defconfig
 
+For model Zero 2 (model B3 in smaller form factor):
+
+  $ make raspberrypizero2_defconfig
+
 For model 2 B:
 
   $ make raspberrypi2_defconfig
@@ -76,6 +80,7 @@ After building, you should obtain this tree:
     output/images/
     +-- bcm2708-rpi-b.dtb           [1]
     +-- bcm2708-rpi-b-plus.dtb      [1]
+    +-- bcm2708-rpi-zero-w.dtb      [1]
     +-- bcm2709-rpi-2-b.dtb         [1]
     +-- bcm2710-rpi-3-b.dtb         [1]
     +-- bcm2710-rpi-3-b-plus.dtb    [1]
diff --git a/board/raspberrypizero2 b/board/raspberrypizero2
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypizero2
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypizero2_defconfig b/configs/raspberrypizero2_defconfig
new file mode 100644
index 0000000000..81d92ee6b7
--- /dev/null
+++ b/configs/raspberrypizero2_defconfig
@@ -0,0 +1,38 @@
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
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+
+# The zero2 uses the same processor as the Raspberry Pi 3 with the same
+# form-factor as the zero-w
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
+
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypizero2/config_zero2.txt"
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
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2/post-image.sh"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
