Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0780EC4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 07:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD9F261229;
	Fri, 14 Oct 2022 07:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD9F261229
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGFmNNIGg9f2; Fri, 14 Oct 2022 07:00:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C6F461224;
	Fri, 14 Oct 2022 07:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C6F461224
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4F01BF20D
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43F91402D2
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43F91402D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYkQwoA_d7r0 for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 06:59:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB61542214
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB61542214
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 06:59:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id l22so5608855edj.5
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 23:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DAMHbhQR7DEz7Nas100rZRTC5QSKV2AWULIksgRQkc0=;
 b=p4eyRen3DDM5t4YUZuZvDgIf4Ra72QFDCdPiLDIXK9rGXZk6wd/Cja6XYvzXL2e8ae
 Pm9fpkciEzogo9sYSRI96CfcpVzoSDW8gCsdVX5u2+JPUZ5PC7fatRBVSrHv+Zy3e0J9
 Qo+nGIDXBnOqnaax5lNmQHJTTur1rNbKckuOEIscJvgaNZklY2UxrYdHkwBLafEAOdEu
 LT2o7lse5cqqz74laexF2HJIec1ZTaHGhaW2bjN4+2fLUu4jjuskETVuRTuxkDulE5n8
 WVb3rfk+oNLEBMjoTbl0Yw9FvtAOV3IyKufpZDt1FnRzuTEHAMAp/T7r/yargWMtK3O2
 CK0A==
X-Gm-Message-State: ACrzQf15xbuLWDuGYB8iihtEyU3RPzs1DeEBjeMdGWa7lwMnCj4TzThV
 6Ut7owQhPCvRJ/1tyjzgA3Jj+nLLmCqHLg==
X-Google-Smtp-Source: AMsMyM6LY+RtU7RwrCInLLAtmKFNvA1H3hNN/O1XpNS9ePoWcPrCQVgxStIfKuudn+lnoumAxZ0Svw==
X-Received: by 2002:a05:6402:298d:b0:451:5fc5:d423 with SMTP id
 eq13-20020a056402298d00b004515fc5d423mr3022085edb.102.1665730748564; 
 Thu, 13 Oct 2022 23:59:08 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 u13-20020aa7d54d000000b00458478a4295sm1285550edr.9.2022.10.13.23.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 23:59:08 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 08:58:59 +0200
Message-Id: <20221014065900.3311604-5-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014065900.3311604-1-angelo@amarulasolutions.com>
References: <20221014065900.3311604-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DAMHbhQR7DEz7Nas100rZRTC5QSKV2AWULIksgRQkc0=;
 b=jVb/fMZBodblRIyd8AWy6kRlUZz4YGd869XxqBuktbEOR8caongFV4FQY+Yfj3VjvW
 PvcH1cz3CKuj57BI4DDfDCjI59UCVZj0/lsYVjjFaKjCb0L5rMaeCkf3vzSgz9yIYBzy
 P1zWAG0m0/h9jwzh2gwI3bydoTAzdkr4CoUOI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jVb/fMZB
Subject: [Buildroot] [PATCH v2 4/5] configs/lichee_rv: new defconfig
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

Lichee RV - Nezha CM is a compute module with modular design, equipped
with Allwinner D1 chip (based on T-Head XuanTie C906 core), 512MB DDR3
RAM.
Board support is based on the nezha defconfig already available in
buildroot.

https://wiki.sipeed.com/hardware/en/lichee/RV/RV.html
https://linux-sunxi.org/Sipeed_Lichee_RV

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 board/sipeed/lichee_rv/genimage.cfg           | 37 +++++++++++++
 ...t-building-u-boot.toc1-for-lichee-rv.patch | 54 +++++++++++++++++++
 board/sipeed/lichee_rv/readme.txt             | 26 +++++++++
 configs/sipeed_lichee_rv_defconfig            | 34 ++++++++++++
 4 files changed, 151 insertions(+)
 create mode 100644 board/sipeed/lichee_rv/genimage.cfg
 create mode 100644 board/sipeed/lichee_rv/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
 create mode 100644 board/sipeed/lichee_rv/readme.txt
 create mode 100644 configs/sipeed_lichee_rv_defconfig

diff --git a/board/sipeed/lichee_rv/genimage.cfg b/board/sipeed/lichee_rv/genimage.cfg
new file mode 100644
index 0000000000..52603c3f70
--- /dev/null
+++ b/board/sipeed/lichee_rv/genimage.cfg
@@ -0,0 +1,37 @@
+# Minimal SD card image for the sipeed Lichee RV
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
diff --git a/board/sipeed/lichee_rv/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch b/board/sipeed/lichee_rv/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
new file mode 100644
index 0000000000..69ebe3b21d
--- /dev/null
+++ b/board/sipeed/lichee_rv/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
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
++u-boot.toc1: lichee-rv.cfg fw_dynamic.bin inputs
++	$(call if_changed,mkimage)
++
++all: u-boot.toc1
++
+ ifeq ($(CONFIG_DEPRECATED),y)
+ 	$(warning "You have deprecated configuration options enabled in your .config! Please check your configuration.")
+ endif
+diff --git a/lichee-rv.cfg b/lichee-rv.cfg
+new file mode 100644
+index 0000000000..2d23b9b388
+--- /dev/null
++++ b/lichee-rv.cfg
+@@ -0,0 +1,9 @@
++[opensbi]
++file = fw_dynamic.bin
++addr = 0x40000000
++[dtb]
++file = arch/riscv/dts/sun20i-d1-lichee-rv.dtb
++addr = 0x44000000
++[u-boot]
++file = u-boot-nodtb.bin
++addr = 0x4a000000
+-- 
+2.20.1
+
diff --git a/board/sipeed/lichee_rv/readme.txt b/board/sipeed/lichee_rv/readme.txt
new file mode 100644
index 0000000000..008be3a3bc
--- /dev/null
+++ b/board/sipeed/lichee_rv/readme.txt
@@ -0,0 +1,26 @@
+Lichee RV
+===============
+
+Lichee RV - Nezha CM is a compute module with modular design, equipped
+with Allwinner D1 chip (based on T-Head XuanTie C906 core), 512MB DDR3 RAM.
+It can boot from TF card or SD-NAND, uses two sets of M.2 b key 67 pin
+connectors to route all IO, making it convient for wide use and easy to replace.
+
+How to build
+============
+
+$ make lichee_rv_defconfig
+$ make
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
diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
new file mode 100644
index 0000000000..355d5caa70
--- /dev/null
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -0,0 +1,34 @@
+BR2_riscv=y
+BR2_GLOBAL_PATCH_DIR="board/sipeed/lichee_rv/patches"
+BR2_ROOTFS_OVERLAY="board/nezha/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,fe178cf0153d98b71cb01a46c8cc050826a17e77)/linux-fe178cf0153d98b71cb01a46c8cc050826a17e77.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-lichee-rv"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
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
