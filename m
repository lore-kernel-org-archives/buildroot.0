Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3168C43217
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 09:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C4D9418EC;
	Fri,  4 Nov 2022 09:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C4D9418EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3W7jtk8T7hR1; Fri,  4 Nov 2022 09:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D6FE418BB;
	Fri,  4 Nov 2022 09:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D6FE418BB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D91391BF2F0
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 09:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C059E8204C
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 09:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C059E8204C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lAulfhgsXexb for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 09:17:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 340328204A
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 340328204A
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 09:17:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o4so6183883wrq.6
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 02:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DAMHbhQR7DEz7Nas100rZRTC5QSKV2AWULIksgRQkc0=;
 b=t5xvrBp+jrUPTD4NdOYAxo1f8IbqjI5tE3cXHVQ8QZly+T/JNBSxbnjnPkOJriw9h6
 Y94ZZPkRAm04RFsrUFBlsWrKDVlE2Wa1ujh+VggoSiDiDQkv4NWZxYAGwXr7/d9bgIoO
 Pv/4PviHz/iQaM4eG2yE22i+fUTmpkA6Lv7EP/AyIf4Zch60ObUJWEw53otmjGGxEmoh
 oz65g2owNVbNlVmm0c6uhNuFZLZb9GseNvEgCa+5AzVIhirbWrPsTSuKz3Rdd5KU1l+c
 bM805Nt82NQtbUfQ2YkeR3GZsgljAQ0VlMFk6+gr9NHIc/FxdRJpMQb7K6VLHIsS80qZ
 uKIA==
X-Gm-Message-State: ACrzQf1X4BXd5d+nqXAnwNEoibdbaZdfj8PpQX8PjqXKHlJHVLcVuph4
 eIEZyMHXDDZrE46g39Nr1Ab1NaQwxPojOQ==
X-Google-Smtp-Source: AMsMyM7o18paQxQ60f/1abneUFGJfnjBfa2dcxSLUf4Josvswca+oXeyLri2JzqsPEby4FkJByvCQA==
X-Received: by 2002:adf:f501:0:b0:22c:cbea:240a with SMTP id
 q1-20020adff501000000b0022ccbea240amr22410286wro.78.1667553454009; 
 Fri, 04 Nov 2022 02:17:34 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 by13-20020a056000098d00b002383edcde09sm3012137wrb.59.2022.11.04.02.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 02:17:33 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 10:17:26 +0100
Message-Id: <20221104091727.690022-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104091727.690022-1-angelo@amarulasolutions.com>
References: <20221104091727.690022-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DAMHbhQR7DEz7Nas100rZRTC5QSKV2AWULIksgRQkc0=;
 b=V1YQd4gzmbj/UyY7+5smVAVhmJLvCBIByXY0v0m80epTv8wNz8jc5y27/5lWIdKGSA
 kPaJWilBA5pr1nzDlK2HPILgnKVPo87Q6RK7o1PF0J99LC+SWRmCrHKJSTxHpMIgSmcJ
 KR7NnCWa8Ch3Hbi+sryoenDxj6PDyxipOeGA8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=V1YQd4gz
Subject: [Buildroot] [PATCH v3 2/3] configs/lichee_rv: new defconfig
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
