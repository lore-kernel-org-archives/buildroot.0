Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21010C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 23:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88039417D3;
	Tue, 13 Dec 2022 23:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88039417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wv111DOy5jVx; Tue, 13 Dec 2022 23:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF0D417CC;
	Tue, 13 Dec 2022 23:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DF0D417CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B55A21BF356
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 23:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 908C960E3C
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 23:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 908C960E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYfIkhmQzPaA for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 23:22:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F2E60B5E
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30F2E60B5E
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 23:22:09 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id vv4so40589095ejc.2
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 15:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PStAldrzdh4oI8pBDfkT4Deim169Yqus2wj6Sicv3Ug=;
 b=FMswAwYRQgZsmRC9/aBlWNKYQkzLy91QfORtkm+ba9AGin8Ag4uxCzkfLKxeimQO4z
 JLJBWB08cxMNlDscHsDfpIv4J5Zff51McaPOFbmetHQlPoEq23XxfhszI+9aeCNcZSY9
 IbgT5LSXqN/OUOdOwrXD8GX6XXArLjUrmOnHpIaSFnZ8cTKGhM6x2wR8vukhIw5awicl
 /aHSI/d2fUzBLD/xduRK7Hn62dDxjR2W8y5JLXPEsFUR4FKz70igcVuxwYTF5uRB5T+6
 zS9X19kWwnv/g1Z+vJNTjlVKUCochm4eoEXto99adPlDtRP58s6AStiSS5eDVHK8yBNK
 8Jvw==
X-Gm-Message-State: ANoB5pm5YxzQ7ob9EhREqE/1zL8oULj9Axm4aNq12Sb8onbSvl2AgssD
 s4uy27Ci1g8sMYXm0C+a99t+4aHWpcS9SZjRAkU=
X-Google-Smtp-Source: AA0mqf6JEbC7mi//RYNr6TWA+1yUb3y6CQej7cmJ3wk4KiMMUXYlWLCKYzgbeST05d+HZn1rEj4BLA==
X-Received: by 2002:a17:906:4ad1:b0:7c0:d0ba:e81f with SMTP id
 u17-20020a1709064ad100b007c0d0bae81fmr20671257ejt.1.1670973727047; 
 Tue, 13 Dec 2022 15:22:07 -0800 (PST)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 fd5-20020a1709072a0500b00779cde476e4sm5107645ejc.62.2022.12.13.15.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 15:22:06 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 00:21:59 +0100
Message-Id: <20221213232159.855265-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213232159.855265-1-angelo@amarulasolutions.com>
References: <20221213232159.855265-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PStAldrzdh4oI8pBDfkT4Deim169Yqus2wj6Sicv3Ug=;
 b=hqaNljSJ00ytN4tfsFLiiuromusSxplS2zdAvyo5v/QLLBg/Iz2PrSL+P5JPK0Z1PT
 viNTdFoj83gmRIZFyOeWhhKakr62guQta4yzsjVSQjxCtTtMmmG7uKGH+95dB5AB53c+
 fMH+j98IaCQvO8SIQlNG4fIi6mLS7kAbzGji0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hqaNljSJ
Subject: [Buildroot] [PATCH v4 3/3] configs/lichee_rv_dock: new defconfig
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
Cc: indrek.kruusa@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Lichee RV Dock is a RISC-V Linux development kits with high integration,
small size and affordable price designed for opensource developer.

https://wiki.sipeed.com/hardware/en/lichee/RV/Dock.html

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v4:
* Bump to the latest kernel/uboot/opensbi as per nezha defconfig
v3:
* Use kernel config fragment to enable RTL8723DS-BT driver
* Use mdev to let the system load device drivers modules at boot
  (rtl8723ds wifi and bluetooth)

 board/sipeed/lichee_rv_dock/genimage.cfg      | 19 ++++++++
 board/sipeed/lichee_rv_dock/linux.fragment    |  7 +++
 .../overlay/etc/network/interfaces            |  6 +++
 .../overlay/etc/wpa_supplicant.conf           |  8 ++++
 board/sipeed/lichee_rv_dock/readme.txt        | 45 +++++++++++++++++++
 configs/sipeed_lichee_rv_dock_defconfig       | 41 +++++++++++++++++
 6 files changed, 126 insertions(+)
 create mode 100644 board/sipeed/lichee_rv_dock/genimage.cfg
 create mode 100644 board/sipeed/lichee_rv_dock/linux.fragment
 create mode 100644 board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
 create mode 100644 board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf
 create mode 100644 board/sipeed/lichee_rv_dock/readme.txt
 create mode 100644 configs/sipeed_lichee_rv_dock_defconfig

diff --git a/board/sipeed/lichee_rv_dock/genimage.cfg b/board/sipeed/lichee_rv_dock/genimage.cfg
new file mode 100644
index 0000000000..38078f0ae3
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/genimage.cfg
@@ -0,0 +1,19 @@
+# Minimal SD card image for the sipeed Lichee RV dock
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		bootable = "true"
+		offset = 1M
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
index 0000000000..7c8c6788fa
--- /dev/null
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -0,0 +1,41 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay board/sipeed/lichee_rv_dock/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv_dock/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
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
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.1"
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lichee_rv_dock"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
