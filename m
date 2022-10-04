Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE21C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 09:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F5D460F0F;
	Tue,  4 Oct 2022 09:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F5D460F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X6foTfuzV4O0; Tue,  4 Oct 2022 09:25:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 618D960EF2;
	Tue,  4 Oct 2022 09:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 618D960EF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B31BE1BF27C
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 09:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D022410C2
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 09:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D022410C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LOrrICGaG4w for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 09:25:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DF354090E
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DF354090E
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 09:25:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id 13so27563634ejn.3
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 02:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=2Rt+7LOXnvz3l8L0JzfnDH0l8vCS8HAikrtQbXr39QI=;
 b=MNffWai1r4COalcLWWUi9xQs9IZrAmh77fvzbXSOUX4vtT+A85viMdJ2frdo6agLDo
 yj4DGS6fmhSi1pSBJg+1WowKEcjMcNexSn7uIkhh38T5mKeFTDRdK6OeroYGbgg08ULJ
 d1NQWtQXz7N4KhDOHV07dx4XdMA6c0b0GfLqOJ5bx6k/eRKCqEaBHZ2M/XbAGzk+NUXG
 t4zJdo82zdS2afcuJxVv1gxxeZ1Z2Ac27hJJKAzAH4gyybToDL68/plR0iajNCWlTk4O
 UshAagoiz6/PghP02/o/MXcfFnZqsumT8VCg8t2khDES3mpPDfPcRpMQNQzpy9OwC+LT
 YUvw==
X-Gm-Message-State: ACrzQf00gYfma2ZYeVnsK9+d7QnRIucVBW7z3B7pWIo/3MkaMtqhJ01i
 dRoCCdunlBWrX5lJ+tgKUYHhI2g8SMmTxA==
X-Google-Smtp-Source: AMsMyM6lzlTvkLyHn43GEpzZGmReSx6xZvqIE9JIwBtZIiRS9LnCpiom1V5bmUvY62erM/uHZFlMbw==
X-Received: by 2002:a17:906:ef8c:b0:77c:8f77:330 with SMTP id
 ze12-20020a170906ef8c00b0077c8f770330mr18416389ejb.604.1664875535175; 
 Tue, 04 Oct 2022 02:25:35 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a17090618a900b0077b2b0563f4sm6841652ejf.173.2022.10.04.02.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 02:25:34 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 11:25:32 +0200
Message-Id: <20221004092532.12501-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=2Rt+7LOXnvz3l8L0JzfnDH0l8vCS8HAikrtQbXr39QI=;
 b=RUCM0hADGjg9rIIUAE6ls0ujNDD1pOOOK1qGIl0YHwPT9ZAX+SROILjQ6qyDxkbMPt
 1qP+BhjlDYFmBKUfIKQN8sfvSSJd7uuepHYVuBF91bRRkalvXKGYBOrOGdscjvSfuoTp
 wwgo7dzw44NLCpZ9PKIxxJVyHa0aaI6f8NsuY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RUCM0hAD
Subject: [Buildroot] [PATCH] configs/lichee_rv_dock: new defconfig
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
 .../overlay_dock/etc/network/interfaces       |  7 +++
 .../overlay_dock/etc/wpa_supplicant.conf      |  8 +++
 ...t-building-u-boot.toc1-for-lichee-rv.patch | 54 +++++++++++++++++++
 board/lichee_rv/readme.txt                    | 23 ++++++++
 configs/lichee_rv_dock_defconfig              | 37 +++++++++++++
 5 files changed, 129 insertions(+)
 create mode 100644 board/lichee_rv/overlay_dock/etc/network/interfaces
 create mode 100644 board/lichee_rv/overlay_dock/etc/wpa_supplicant.conf
 create mode 100644 board/lichee_rv/patches_rv_dock/uboot/0002-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
 create mode 100644 configs/lichee_rv_dock_defconfig

diff --git a/board/lichee_rv/overlay_dock/etc/network/interfaces b/board/lichee_rv/overlay_dock/etc/network/interfaces
new file mode 100644
index 0000000000..62153aabd1
--- /dev/null
+++ b/board/lichee_rv/overlay_dock/etc/network/interfaces
@@ -0,0 +1,7 @@
+auto lo
+iface lo inet loopback
+
+auto wlan0
+iface wlan0 inet dhcp
+pre-up modprobe 8723ds
+wpa-conf /etc/wpa_supplicant.conf
diff --git a/board/lichee_rv/overlay_dock/etc/wpa_supplicant.conf b/board/lichee_rv/overlay_dock/etc/wpa_supplicant.conf
new file mode 100644
index 0000000000..b43292b0a7
--- /dev/null
+++ b/board/lichee_rv/overlay_dock/etc/wpa_supplicant.conf
@@ -0,0 +1,8 @@
+ap_scan=1
+
+network={
+        ssid="YOURSSID"
+        scan_ssid=1
+        key_mgmt=WPA-PSK
+        psk="YOURPASSWD"
+}
diff --git a/board/lichee_rv/patches_rv_dock/uboot/0002-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch b/board/lichee_rv/patches_rv_dock/uboot/0002-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
new file mode 100644
index 0000000000..396d928b85
--- /dev/null
+++ b/board/lichee_rv/patches_rv_dock/uboot/0002-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
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
diff --git a/board/lichee_rv/readme.txt b/board/lichee_rv/readme.txt
index 008be3a3bc..0baf874745 100644
--- a/board/lichee_rv/readme.txt
+++ b/board/lichee_rv/readme.txt
@@ -12,6 +12,29 @@ How to build
 $ make lichee_rv_defconfig
 $ make
 
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
+Edit board/lichee_rv/overlay_dock/etc/wpa_supplicant.conf
+
+* Replace YOURSSID with your AP ssid
+* Replace YOURPASSWD with your AP password
+
 How to write the SD card
 ========================
 
diff --git a/configs/lichee_rv_dock_defconfig b/configs/lichee_rv_dock_defconfig
new file mode 100644
index 0000000000..ba11ac867b
--- /dev/null
+++ b/configs/lichee_rv_dock_defconfig
@@ -0,0 +1,37 @@
+BR2_riscv=y
+BR2_GLOBAL_PATCH_DIR="board/lichee_rv/patches_rv_dock"
+BR2_ROOTFS_OVERLAY="board/nezha/overlay board/lichee_rv/overlay_dock"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/lichee_rv/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,f4bce410a6b47606557cb0d291572afc4c240c85)/linux-f4bce410a6b47606557cb0d291572afc4c240c85.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-lichee-rv-dock"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_RTL8723DS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,4bcaf9aa1dbc69ccb68998c7d462ef895163d493)/opensbi-4bcaf9aa1dbc69ccb68998c7d462ef895163d493.tar.gz"
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_SUN20I_D1_SPL=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,7446a47204fd8923b99ced0091667979c4fd27fa)/uboot-7446a47204fd8923b99ced0091667979c4fd27fa.tar.gz"
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
