Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3137DC10F1B
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 23:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 937A760FE0;
	Tue, 13 Dec 2022 23:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 937A760FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uujb5JT5CSeY; Tue, 13 Dec 2022 23:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B482C60E3C;
	Tue, 13 Dec 2022 23:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B482C60E3C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 630EE1BF356
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 23:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E4D181F04
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 23:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E4D181F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pS46ESWAjx1O for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 23:22:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA19081EFC
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA19081EFC
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 23:22:07 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id n20so40613860ejh.0
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 15:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ky7cQq5s6rbyr//qwE1hiW2wpnSp8QWeDufv7HBL59I=;
 b=S2HF0w8lznt3qXwmwf/G6n11lWtfltLmrAgI52M1cjkLXj7RuTG7bIaWhteMkDNyAP
 /DMlNlJL5XlAVFv7IIcnsbI6/Y0pY7fq3zETeqLp7bc3os0poLgiv4oENjU58c3ghPv2
 k8nkH9eN4nGSy0LxsdX2yMfq3kNVspHP+vQPR7xpjpoa9c5SPQUay942SRoFw8hLCbHO
 uFUPFPLhuksxms3Z5cQNpScQ1s+NG/wGuawT55NV729lPY8Wp1MfuL3pAaOUogSQSwSC
 xkb88QvZ6hsQ1ZqdTbfpuQHtYM3nTLNcFzdcTSlEBQaVENHOe/MqeyhZvRVRDt8ZlBHN
 s8fw==
X-Gm-Message-State: ANoB5pmeIhNwKuonCLeHgqNw56/bKt0oCItCuul2GXGjd/t9dBD3Kojy
 7vED+LF8Hb+jsRhxSba+ENSTWmK7T3SLw8ePMa0=
X-Google-Smtp-Source: AA0mqf4oZKUTC2sZ2rudK7Aoy/Z5+a7LNWS64/YynoS8YKZk9kW5i/qW3CsOdhB4vFFq8BfQ1Yoawg==
X-Received: by 2002:a17:906:1146:b0:78d:f455:311d with SMTP id
 i6-20020a170906114600b0078df455311dmr16999070eja.69.1670973725540; 
 Tue, 13 Dec 2022 15:22:05 -0800 (PST)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 fd5-20020a1709072a0500b00779cde476e4sm5107645ejc.62.2022.12.13.15.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 15:22:04 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 00:21:58 +0100
Message-Id: <20221213232159.855265-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213232159.855265-1-angelo@amarulasolutions.com>
References: <20221213232159.855265-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ky7cQq5s6rbyr//qwE1hiW2wpnSp8QWeDufv7HBL59I=;
 b=HA6xOnuVfi7kfx6ALdy8Pm2gz2fv5JOvdNpHgc7goYnsAHSD8erJazxeLgLZn1cmKd
 n7si0DvREDCFOyYvQ7hul/CtCU9TmO8lBFQW5lJ1xBhtttRCc4niz9T2oCQXqsC8wv3t
 6O7CjPpJmOjjelaJ9bU7ZTfe/m8s7jDTdSaKI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=HA6xOnuV
Subject: [Buildroot] [PATCH v4 2/3] configs/lichee_rv: new defconfig
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

Lichee RV - Nezha CM is a compute module with modular design, equipped
with Allwinner D1 chip (based on T-Head XuanTie C906 core), 512MB DDR3
RAM.
Board support is based on the nezha defconfig already available in
buildroot.

https://wiki.sipeed.com/hardware/en/lichee/RV/RV.html
https://linux-sunxi.org/Sipeed_Lichee_RV

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v4:
* bump to latest kernel/uboot/opensbi as for the nezha defconfig

 board/sipeed/lichee_rv/genimage.cfg           | 19 +++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |  4 +++
 board/sipeed/lichee_rv/readme.txt             | 26 +++++++++++++++
 configs/sipeed_lichee_rv_defconfig            | 33 +++++++++++++++++++
 4 files changed, 82 insertions(+)
 create mode 100644 board/sipeed/lichee_rv/genimage.cfg
 create mode 100644 board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/sipeed/lichee_rv/readme.txt
 create mode 100644 configs/sipeed_lichee_rv_defconfig

diff --git a/board/sipeed/lichee_rv/genimage.cfg b/board/sipeed/lichee_rv/genimage.cfg
new file mode 100644
index 0000000000..d5df41203d
--- /dev/null
+++ b/board/sipeed/lichee_rv/genimage.cfg
@@ -0,0 +1,19 @@
+# Minimal SD card image for the sipeed Lichee RV
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
diff --git a/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf b/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..91b2298628
--- /dev/null
+++ b/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /boot/Image
+  # use devicetree from u-boot
+  append console=ttyS0,115200 root=/dev/mmcblk0p1 ro rootwait
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
index 0000000000..f9782f870b
--- /dev/null
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -0,0 +1,33 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-lichee-rv"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
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
