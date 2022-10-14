Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F61C433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 07:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 039FA40FF6;
	Fri, 14 Oct 2022 07:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 039FA40FF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fg-x-d2D14jM; Fri, 14 Oct 2022 07:00:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC1F64100C;
	Fri, 14 Oct 2022 07:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC1F64100C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 915A91BF860
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D3A040C57
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D3A040C57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nf-UJuAcbhuI for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 06:59:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC3D8400F1
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC3D8400F1
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 06:59:10 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z97so5599779ede.8
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 23:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vHMnU3SPbK/ZXilMh6K76jdvchXFqBN7vd9tXLbUVY=;
 b=hFsGIhoeHRTPIRGVhP546HNJBO24IG7goycOBK7IdVuNogzGJAU9hToPN4vuGWt8cG
 rHIuHRe2r83Epb2s/VDgBEUXPuBjwJ50Fhk1lRUe1oIr+urRddqFXyqT2+YsqoM2Hpf1
 hQ/6wWLYp5FVr88xgEDurm0GZF7goV0UQxFhnZMV4YbjSvJyz7lKexsHO08F7Q2AhJ6W
 1mFDgQLfHaf7TnFpRPCNDNNZgFWjw+7yi9tgQEz7iy8jLuy2l1TEEyz3E2nJwopZcaa/
 oA9oP75qjtRU2MYQkBE7GIERy2OnFtk33afGwYJpu7Y+7jvRssYAYtrx7pocSzPg5xkV
 idBA==
X-Gm-Message-State: ACrzQf1AbcjTYXr9Zw0LnYAWK9j3U60StsBs65GzA+3wChw/eBV2O/no
 Ufeptz44DUxI5dFIeVqh1Q9+NSs4QW/dtw==
X-Google-Smtp-Source: AMsMyM60Vzh5CXL6cW6Rk+Kepv/HPLhFmV7KFLUtiSUKukfwqoQPfTa+jldPqtTYiON2HVZCNKADKA==
X-Received: by 2002:a05:6402:b3c:b0:458:f680:6ab8 with SMTP id
 bo28-20020a0564020b3c00b00458f6806ab8mr3101992edb.267.1665730750064; 
 Thu, 13 Oct 2022 23:59:10 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 u13-20020aa7d54d000000b00458478a4295sm1285550edr.9.2022.10.13.23.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 23:59:09 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 08:59:00 +0200
Message-Id: <20221014065900.3311604-6-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014065900.3311604-1-angelo@amarulasolutions.com>
References: <20221014065900.3311604-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vHMnU3SPbK/ZXilMh6K76jdvchXFqBN7vd9tXLbUVY=;
 b=qMW4d4So5Gto0Gx095AusoAq3mFqAdMN4jZe3F39prXxhz3FkLKuKsTk7yqB2kbi1e
 Kglfg3GTqOGVW6sl/StEt5LzuujEeFOxEpYVEosQjpAT+N+g95+ZSb0Uw3JeH2FeSdhz
 G0O6Fay1XtIDuhWT4ubtDma8y5kme1zG4ud/8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qMW4d4So
Subject: [Buildroot] [PATCH v2 5/5] configs/lichee_rv_dock: new defconfig
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
 board/sipeed/lichee_rv_dock/genimage.cfg      | 37 +++++++++++++
 .../overlay/etc/network/interfaces            |  7 +++
 .../overlay/etc/wpa_supplicant.conf           |  8 +++
 ...t-building-u-boot.toc1-for-lichee-rv.patch | 54 +++++++++++++++++++
 ...-d1-lichee-rv-dock-add-bluetooth-bin.patch | 33 ++++++++++++
 board/sipeed/lichee_rv_dock/readme.txt        | 45 ++++++++++++++++
 configs/sipeed_lichee_rv_dock_defconfig       | 40 ++++++++++++++
 7 files changed, 224 insertions(+)
 create mode 100644 board/sipeed/lichee_rv_dock/genimage.cfg
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
diff --git a/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces b/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
new file mode 100644
index 0000000000..62153aabd1
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
@@ -0,0 +1,7 @@
+auto lo
+iface lo inet loopback
+
+auto wlan0
+iface wlan0 inet dhcp
+pre-up modprobe 8723ds
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
index 0000000000..6da3ae24e4
--- /dev/null
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -0,0 +1,40 @@
+BR2_riscv=y
+BR2_GLOBAL_PATCH_DIR="board/sipeed/lichee_rv_dock/patches"
+BR2_ROOTFS_OVERLAY="board/nezha/overlay board/sipeed/lichee_rv_dock/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv_dock/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,fe178cf0153d98b71cb01a46c8cc050826a17e77)/linux-fe178cf0153d98b71cb01a46c8cc050826a17e77.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-lichee-rv-dock"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=y
+BR2_PACKAGE_RTL8723DS=y
+BR2_PACKAGE_RTL8723DS_BT=y
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
