Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF663C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C7FB6078A;
	Mon,  3 Jun 2024 07:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vB1zBL6Li-01; Mon,  3 Jun 2024 07:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 364C6608C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 364C6608C0;
	Mon,  3 Jun 2024 07:41:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC181BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 278DA40508
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uiDv78c1mA8 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:41:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.athaariq.my.id; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96B26404C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96B26404C6
Received: from mail.athaariq.my.id (unknown [117.53.144.211])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96B26404C6
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:41:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.athaariq.my.id (Postfix) with ESMTPSA id 69D1A483BB;
 Mon, 03 Jun 2024 07:41:13 +0000 (UTC)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 14:40:45 +0700
Message-ID: <20240603074049.28426-3-foss@athaariq.my.id>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240603074049.28426-1-foss@athaariq.my.id>
References: <20240603074049.28426-1-foss@athaariq.my.id>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
Subject: [Buildroot] [PATCH 3/3] board/raspberrypi: add support for
 Raspberry Pi 5
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the last Raspberry Pi 5 submission has no progress, I am submitting these patches anyway. The newly released Raspberry Pi 5 board shares similar software structure except it has less proprietary API. Therefore, rpi-userland and all of raspberry-centric GPIO utilities are no longer supported. Also keep in mind that RPi 5 has no native 32-bit support for both kernel and userspace binary due to Cortex-A76 processor specification. That is the reason why I did not add _64.

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
---
 board/raspberrypi/config_5.txt | 65 ++++++++++++++++++++++++++++++++++
 board/raspberrypi5             |  1 +
 configs/raspberrypi5_defconfig | 46 ++++++++++++++++++++++++
 package/raspi-gpio/Config.in   |  4 +++
 package/rpi-userland/Config.in |  3 ++
 5 files changed, 119 insertions(+)
 create mode 100644 board/raspberrypi/config_5.txt
 create mode 120000 board/raspberrypi5
 create mode 100644 configs/raspberrypi5_defconfig

diff --git a/board/raspberrypi/config_5.txt b/board/raspberrypi/config_5.txt
new file mode 100644
index 0000000000..2e470fff99
--- /dev/null
+++ b/board/raspberrypi/config_5.txt
@@ -0,0 +1,65 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+# Raspberry Pi 5 has no start.elf and fixup.dat files due to the existence of
+# Bootloader EEPROM
+
+kernel=Image
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Automatically load initramfs files, if found
+auto_initramfs=1
+
+# Uncomment some or all of these to enable the optional hardware interfaces
+#dtparam=i2c_arm=on
+#dtparam=i2s=on
+#dtparam=spi=on
+
+# Enable audio (loads snd_bcm2835)
+dtparam=audio=on
+
+# Automatically load overlays for detected cameras
+camera_auto_detect=1
+
+# Automatically load overlays for detected DSI displays
+display_auto_detect=1
+
+# Enable DRM VC4 V3D driver
+dtoverlay=vc4-kms-v3d-pi5
+max_framebuffers=2
+
+# Don't have the firmware create an initial video= setting in cmdline.txt.
+# Use the kernel's default instead.
+disable_fw_kms_setup=1
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
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtparam=krnbt=on
+
+# enable 64bits support
+arm_64bit=1
+
+# Run as fast as firmware / board allows
+arm_boost=1
+
+# Raspberry PI 5 won't use UART0 as terminal out of the box. We need to enable
+# this through config.txt
+enable_uart=1
+dtoverlay=uart0-pi5
diff --git a/board/raspberrypi5 b/board/raspberrypi5
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypi5
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
new file mode 100644
index 0000000000..733838ab2e
--- /dev/null
+++ b/configs/raspberrypi5_defconfig
@@ -0,0 +1,46 @@
+BR2_aarch64=y
+BR2_cortex_a76=y
+
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,c1432b4bae5b6582f4d32ba381459f33c34d1424)/linux-c1432b4bae5b6582f4d32ba381459f33c34d1424.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b"
+
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI5=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi5/config_5.txt"
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi5/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi5/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_KMOD_TOOLS=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_HOST_KMOD_XZ=y
diff --git a/package/raspi-gpio/Config.in b/package/raspi-gpio/Config.in
index 32a9448335..19c796e4a7 100644
--- a/package/raspi-gpio/Config.in
+++ b/package/raspi-gpio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RASPI_GPIO
 	bool "raspi-gpio"
+	depends on !BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI5
 	help
 	  Tool to help debug / hack at the BCM283x GPIO. You can dump
 	  the state of a GPIO or (all GPIOs). You can change a GPIO
@@ -9,4 +10,7 @@ config BR2_PACKAGE_RASPI_GPIO
 	  registers, ignoring anything else that may be using them
 	  (like Linux drivers).
 
+	  WARNING: Raspberry Pi 5 is NOT supported. Use libgpiod2
+	           instead.
+
 	  https://github.com/RPi-Distro/raspi-gpio
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 4219bdb9c4..a4fff821e1 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_arm || BR2_aarch64
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI5
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_HAS_LIBEGL if BR2_arm
 	select BR2_PACKAGE_HAS_LIBGLES if BR2_arm
@@ -16,6 +17,8 @@ config BR2_PACKAGE_RPI_USERLAND
 	  mmal, GLESv2, vcos, openmaxil, vchiq_arm, bcm_host, WFC,
 	  OpenVG.
 
+	  WARNING: Raspberry Pi 5 is NOT supported. Use mesa3d instead.
+
 	  https://github.com/raspberrypi/userland/
 
 if BR2_PACKAGE_RPI_USERLAND && BR2_arm
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
