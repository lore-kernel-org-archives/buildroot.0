Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEAAC433FE
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 09:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62699418F8;
	Fri,  4 Nov 2022 09:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62699418F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zTVN18-cJX10; Fri,  4 Nov 2022 09:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 670F4418A6;
	Fri,  4 Nov 2022 09:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 670F4418A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE14B1BF2F0
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 09:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8E3540489
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 09:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8E3540489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GA8PxHPZs77m for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 09:17:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33E8C40124
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33E8C40124
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 09:17:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z14so6174083wrn.7
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 02:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otz3HW+ZQfZhROy1reDGgJUtZOomqa3+wnwrwlhshi0=;
 b=bYT2WuDE37oxXWtRv4cPg+SfZd3a3U1cHp7YfaLomNydhTNwapC0fccmOiqhCA800O
 eIpzuLt779S98/AnPwz+gw39/wCBo5jP/1eNEhUgxIaxnXR9Cl9Qte+TDMrhMD5Mot9X
 s2cC95EYXw4LXrVOUna5xWToC4FqCNerif1RotmP1ui8cLJav1cUoR3iy7z0jEITU11j
 eKuHT0uVGn6UDW2DAAX/gLMcIu2tVJxlgXZdSJiZTY/x1TcX9D6L7XNczBnPTzUSEGf+
 5NAi7K35RtIaYBYkRG2WRLqycHCJVZFNNFpT2V6mkg8GIPDlUftD/uccnLRtpjI2DxM4
 o4tQ==
X-Gm-Message-State: ACrzQf3MWMpPJrqPnZOBFbSXnztm89KqpiwvzCtFTa4ibZRe01dtL4tx
 uYg+MGkloFU1EXS7JinnoZDJM8Yfhd/6fw==
X-Google-Smtp-Source: AMsMyM5uGfD+sZ46fpzoPvk1BaXBrDJKIaf5S+HOBy2QA7rKzofzm9iN7muiWoVA0k8J48tANsXRRA==
X-Received: by 2002:a5d:4ac8:0:b0:236:781a:8d2d with SMTP id
 y8-20020a5d4ac8000000b00236781a8d2dmr22243038wrs.715.1667553455033; 
 Fri, 04 Nov 2022 02:17:35 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 by13-20020a056000098d00b002383edcde09sm3012137wrb.59.2022.11.04.02.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 02:17:34 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 10:17:27 +0100
Message-Id: <20221104091727.690022-4-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104091727.690022-1-angelo@amarulasolutions.com>
References: <20221104091727.690022-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=otz3HW+ZQfZhROy1reDGgJUtZOomqa3+wnwrwlhshi0=;
 b=PfXHoHsP/Wunk39X+kiR3uhdBDtrN3nVCKEMjtqM68SbFf36z5KVYaEr1ZHQYoG9n5
 RaVAxQLzyliSkW7Fd1EsB25YNWZGR6GnHsXQNdNJ+YeV8ur93B+9pq0H0uFXyHtcZ4JY
 JcadTBVeILYuELFWCHQQoYc4X5cwTB2JTXL48=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PfXHoHsP
Subject: [Buildroot] [PATCH v3 3/3] configs/lichee_rv_dock: new defconfig
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Lichee RV Dock is a RISC-V Linux development kits with high integration,
small size and affordable price designed for opensource developer.

https://wiki.sipeed.com/hardware/en/lichee/RV/Dock.html

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v3:
* Use kernel config fragment to enable RTL8723DS-BT driver
* Use mdev to let the system load device drivers modules at boot
  (rtl8723ds wifi and bluetooth)

 board/sipeed/lichee_rv_dock/genimage.cfg      | 37 +++++++++++++
 board/sipeed/lichee_rv_dock/linux.fragment    |  7 +++
 .../overlay/etc/network/interfaces            |  6 +++
 .../overlay/etc/wpa_supplicant.conf           |  8 +++
 ...t-building-u-boot.toc1-for-lichee-rv.patch | 54 +++++++++++++++++++
 ...-d1-lichee-rv-dock-add-bluetooth-bin.patch | 33 ++++++++++++
 board/sipeed/lichee_rv_dock/readme.txt        | 45 ++++++++++++++++
 configs/sipeed_lichee_rv_dock_defconfig       | 42 +++++++++++++++
 8 files changed, 232 insertions(+)
 create mode 100644 board/sipeed/lichee_rv_dock/genimage.cfg
 create mode 100644 board/sipeed/lichee_rv_dock/linux.fragment
 create mode 100644 board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
 create mode 100644 board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf
 create mode 100644 board/sipeed/lichee_rv_dock/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
 create mode 100644 board/sipeed/lichee_rv_dock/patches/uboot/0002-RISCV-dts-sun20i-d1-lichee-rv-dock-add-bluetooth-bin.patch
 create mode 100644 board/sipeed/lichee_rv_dock/readme.txt
 create mode 100644 configs/sipeed_lichee_rv_dock_defconfig

diff --git a/board/sipeed/lichee_rv_dock/genimage.cfg b/board/sipeed/lichee_rv_dock/genimage.cfg
new file mode 100644
index 0000000000..016acc3611
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/genimage.cfg
@@ -0,0 +1,37 @@
+# Minimal SD card image for the sipeed Lichee RV dock
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot0-1 {
+		in-partition-table = "no"
+		image = "boot0_sdcard_sun20iw1p1.bin"
+		offset = 8K
+	}
+
+	partition boot0-2 {
+		in-partition-table = "no"
+		image = "boot0_sdcard_sun20iw1p1.bin"
+		offset = 128K
+	}
+
+	partition u-boot-1 {
+		in-partition-table = "no"
+		image = "u-boot.toc1"
+		offset = 12M
+	}
+
+	partition u-boot-2 {
+		in-partition-table = "no"
+		image = "u-boot.toc1"
+		offset = 16400K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		bootable = "true"
+		offset = 18M
+	}
+}
diff --git a/board/sipeed/lichee_rv_dock/linux.fragment b/board/sipeed/lichee_rv_dock/linux.fragment
new file mode 100644
index 0000000000..10016889ab
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/linux.fragment
@@ -0,0 +1,7 @@
+CONFIG_BT=y
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_SERDEV=y
+CONFIG_BT_HCIUART_3WIRE=y
+CONFIG_BT_HCIUART_RTL=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
diff --git a/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces b/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
new file mode 100644
index 0000000000..89e7d74aff
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
@@ -0,0 +1,6 @@
+auto lo
+iface lo inet loopback
+
+auto wlan0
+iface wlan0 inet dhcp
+wpa-conf /etc/wpa_supplicant.conf
diff --git a/board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf b/board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf
new file mode 100644
index 0000000000..b43292b0a7
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf
@@ -0,0 +1,8 @@
+ap_scan=1
+
+network={
+        ssid="YOURSSID"
+        scan_ssid=1
+        key_mgmt=WPA-PSK
+        psk="YOURPASSWD"
+}
diff --git a/board/sipeed/lichee_rv_dock/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch b/board/sipeed/lichee_rv_dock/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
new file mode 100644
index 0000000000..396d928b85
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
@@ -0,0 +1,54 @@
+From 4a923e0e4ef6d2b41cb89d658e269adada847573 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Thu, 4 Nov 2021 22:32:04 +0100
+Subject: [PATCH] Makefile: HACK: Support building u-boot.toc1 for nezda board
+
+For easier integration into Buildroot.  The boot0 / toc1 logic is WIP until
+U-Boot gains SPL support for the D1, so add a hack to make it easier to
+integrate in Buildroot as-is.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Makefile  | 9 +++++++++
+ nezha.cfg | 9 +++++++++
+ 2 files changed, 18 insertions(+)
+ create mode 100644 nezha.cfg
+
+diff --git a/Makefile b/Makefile
+index f911f70344..259d93bf80 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1084,6 +1084,15 @@ endif
+ .binman_stamp: FORCE
+ 	@touch $@
+ 
++fw_dynamic.bin: $(OPENSBI)
++	$(call if_changed,copy)
++
++MKIMAGEFLAGS_u-boot.toc1 = -T sunxi_toc1
++u-boot.toc1: lichee-rv-dock.cfg fw_dynamic.bin inputs
++	$(call if_changed,mkimage)
++
++all: u-boot.toc1
++
+ ifeq ($(CONFIG_DEPRECATED),y)
+ 	$(warning "You have deprecated configuration options enabled in your .config! Please check your configuration.")
+ endif
+diff --git a/lichee-rv-dock.cfg b/lichee-rv-dock.cfg
+new file mode 100644
+index 0000000000..2d23b9b388
+--- /dev/null
++++ b/lichee-rv-dock.cfg
+@@ -0,0 +1,9 @@
++[opensbi]
++file = fw_dynamic.bin
++addr = 0x40000000
++[dtb]
++file = arch/riscv/dts/sun20i-d1-lichee-rv-dock.dtb
++addr = 0x44000000
++[u-boot]
++file = u-boot-nodtb.bin
++addr = 0x4a000000
+-- 
+2.20.1
+
diff --git a/board/sipeed/lichee_rv_dock/patches/uboot/0002-RISCV-dts-sun20i-d1-lichee-rv-dock-add-bluetooth-bin.patch b/board/sipeed/lichee_rv_dock/patches/uboot/0002-RISCV-dts-sun20i-d1-lichee-rv-dock-add-bluetooth-bin.patch
new file mode 100644
index 0000000000..091afeacdc
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/patches/uboot/0002-RISCV-dts-sun20i-d1-lichee-rv-dock-add-bluetooth-bin.patch
@@ -0,0 +1,33 @@
+From add5f78e04e22f12da309f11122c1a9133b09d0b Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Thu, 13 Oct 2022 22:37:29 +0200
+Subject: [PATCH] RISCV: dts: sun20i: d1: lichee-rv-dock: add bluetooth binding
+
+UART1 is attached to a rtl8723ds bluetooth module
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+---
+ arch/riscv/dts/sun20i-d1-lichee-rv-dock.dts | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/arch/riscv/dts/sun20i-d1-lichee-rv-dock.dts b/arch/riscv/dts/sun20i-d1-lichee-rv-dock.dts
+index 0b0f356e2e..c27e682c5e 100644
+--- a/arch/riscv/dts/sun20i-d1-lichee-rv-dock.dts
++++ b/arch/riscv/dts/sun20i-d1-lichee-rv-dock.dts
+@@ -158,6 +158,13 @@
+ 	pinctrl-0 = <&uart1_pg6_pins>, <&uart1_pg8_rts_cts_pins>;
+ 	pinctrl-names = "default";
+ 	status = "okay";
++
++	bluetooth {
++		compatible = "realtek,rtl8723ds-bt";
++		device-wake-gpios = <&gpio 6 15 GPIO_ACTIVE_HIGH>; /* PG16 */
++		enable-gpios = <&gpio 6 18 GPIO_ACTIVE_HIGH>; /* PG18 */
++		host-wake-gpios = <&gpio 6 17 GPIO_ACTIVE_HIGH>; /* PG17 */
++	};
+ };
+ 
+ &usbphy {
+-- 
+2.25.1
+
diff --git a/board/sipeed/lichee_rv_dock/readme.txt b/board/sipeed/lichee_rv_dock/readme.txt
new file mode 100644
index 0000000000..34478cafcc
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/readme.txt
@@ -0,0 +1,45 @@
+Lichee RV dock
+===============
+
+Lichee RV Dock is a RISC-V Linux development kits with high integration, small
+size and affordable price designed for opensource developer. It's equipped with
+HDMI interface and it supports many screen by its screen convert board. It's
+also equipped with many peripherals, including a UAB-A port, 2.4G Wifi-BT module,
+an analog microphone and a speaker jack interface.
+
+How to build
+============
+
+$ make lichee_rv_dock_defconfig
+$ make
+
+Wifi
+==========
+
+Edit board/lichee_rv/overlay_dock/etc/wpa_supplicant.conf or
+/etc/wpa_supplicant.conf once connected to the board:
+
+* Replace YOURSSID with your AP ssid
+* Replace YOURPASSWD with your AP password
+
+Bluetooth
+==========
+
+To make the device discoverable and pairable, once connected to the board:
+
+* bluetoothctl power on
+* bluetoothctl discoverable yes
+* bluetoothctl pairable yes
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
+
+Connect a TTL UART to the debug connector, insert the microSD card and
+plug in a USB-C cable to the PWR connector to boot the system.
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
new file mode 100644
index 0000000000..4c3fe7b757
--- /dev/null
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -0,0 +1,42 @@
+BR2_riscv=y
+BR2_GLOBAL_PATCH_DIR="board/sipeed/lichee_rv_dock/patches"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_OVERLAY="board/nezha/overlay board/sipeed/lichee_rv_dock/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv_dock/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,fe178cf0153d98b71cb01a46c8cc050826a17e77)/linux-fe178cf0153d98b71cb01a46c8cc050826a17e77.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-lichee-rv-dock"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/lichee_rv_dock/linux.fragment"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_RTL8723DS=y
+BR2_PACKAGE_RTL8723DS_BT=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-e6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_SUN20I_D1_SPL=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,d1-2022-05-26)/uboot-d1-2022-05-26.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lichee_rv"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.toc1"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
