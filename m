Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE1CE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 20:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4726A844F5;
	Wed, 11 Dec 2024 20:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PupglFw1ddO; Wed, 11 Dec 2024 20:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24B87844F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24B87844F6;
	Wed, 11 Dec 2024 20:12:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A3D6113C
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 246A561346
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzsD4Y6udjry for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 20:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B72861324
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B72861324
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B72861324
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:12:02 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso4218051e87.2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 12:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733947920; x=1734552720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n26BX+InFgS1uf22otxob8zs1IpymzmHoDkbpQGGtdA=;
 b=D2nH0EEqrahVRQIas5RANLM2tEUIMRyeo/qOCZbxKOmKjntlXYmyb60V8+DPab6bAz
 87Q8b9SjD8TsWCEEos0476CCLPfcUKb8dMe3eVKqwljkcBBNOHvTveUyIN8m0HA5kUL4
 rA/Ux5ay2CiiJyl/1wBrc6u8Jw1vlgOwley+Nylg/Pi7axzQD2IiaI4kCYkh+wvS/D1+
 SexZruF2iAEWe5lH/BJOGNtyASHeg0X9uzXY7HjxqBsJgJc0cqDA+497MdQJTS0OnlBg
 dZ3Hc/G9kSqL2or8jlSIJ/yQIF1bhiScKWl4QjDRKYc4rXh9r5atnsrqJ3MCmcigDKmt
 2y/Q==
X-Gm-Message-State: AOJu0YxMPVNlwG3zuUvTpvacvuHXbkQSiDv04//EE8UNG0bz7JedU96+
 OLaWdSLor6JsvNQyAnyRLEezAeIOnau2xGF7jci4s4XzF7OzyokIFmemfBRH
X-Gm-Gg: ASbGncu7iorTIXRfHyYZ8n36yG1OQR3b2hBpIAjEbae1aSvFSLEmN//dUmvkZLY78P9
 Vt3vFMBoK47U9lt6W4akVaFYI22JnLNRixlibDzGdWwp7PLfJ7yxdv4kILqCSIETKf9Zmj2wadw
 jK3WTP7cR/laYzJ6ApJy19AJyl/n0ijY1TMRrcj7dJRzVCDOPR4OQi+/3vAWiFIMNdqMf8XGcyZ
 zC2eYlSajxqLJMg51NU/kCdMOtyf9FG9Q01bkDd+3Qwj4qxtUsuu3awHSPSpQ==
X-Google-Smtp-Source: AGHT+IExEhnnGwPxmSyGo73UmrjyZEe2/xye5b6gGw3moUzDuqhhMrPpexfrivRAFWL8eYTfxS+rXg==
X-Received: by 2002:a05:6512:238b:b0:53e:39b7:54a3 with SMTP id
 2adb3069b0e04-5402a5daa14mr1451120e87.24.1733947920151; 
 Wed, 11 Dec 2024 12:12:00 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-53e398cbf0dsm1638165e87.213.2024.12.11.12.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 12:11:58 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 23:09:40 +0300
Message-ID: <20241211201146.4057892-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211201146.4057892-1-geomatsi@gmail.com>
References: <20241211201146.4057892-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733947920; x=1734552720; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n26BX+InFgS1uf22otxob8zs1IpymzmHoDkbpQGGtdA=;
 b=f8JD3atjaSrWmpJLxtKuBs4qTJDJU28goMRIlTPqCtClr0gn5mJhQ2o4pPEeZ+EfLW
 mzGU6mvg6qHp62LunkP1IPHa5asa3ePrkG49KuLIxKdHcuO5fjaE6FU5NUJBE8I3V1oJ
 JWDDGOlE5UGpihHmHaFkHcGnaZYn1HILBlnNIURVDMcNbINRe17PaHX0o9Ap0yvbwpld
 YxN5hhvXbF9TQnibT+QujSEV3XHPR8gGTJ0BkU8Ob1PbwmQVV8Wf59l8/IgIMRTcxhAx
 L+OBa4ZZLQpIOn79dhcMs/Oej55RFg1E5zjtq9GgdGRSylCGZ4CZkr5Cw3zqfZmIE1u2
 T+Aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f8JD3atj
Subject: [Buildroot] [PATCH 2/3] configs/orangepi_zero: bump BSP versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the new Linux LTS release 6.12.3 and to the latest U-Boot
2024.10. Tune the patch for xr819 interrupts for the new kernel.
Add hashes for Linux kernel/headers and U-Boot. Finally, add
BR2_TARGET_UBOOT_NEEDS_GNUTLS option required by new U-Boot.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../patches/linux-headers/linux-headers.hash        |  1 +
 ...-orange-pi-zero-interrupt-triggering-xr819.patch | 13 ++++++-------
 .../orangepi/orangepi-zero/patches/linux/linux.hash |  2 ++
 .../orangepi/orangepi-zero/patches/uboot/uboot.hash |  2 ++
 configs/orangepi_zero_defconfig                     |  7 ++++---
 5 files changed, 15 insertions(+), 10 deletions(-)
 create mode 120000 board/orangepi/orangepi-zero/patches/linux-headers/linux-headers.hash
 create mode 100644 board/orangepi/orangepi-zero/patches/linux/linux.hash
 create mode 100644 board/orangepi/orangepi-zero/patches/uboot/uboot.hash

diff --git a/board/orangepi/orangepi-zero/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-zero/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-zero/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
index 6a5aa0bb63..600fd0f5b3 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
@@ -1,8 +1,7 @@
-From 321faaf4b78d46a0c77782c1798856746f0619e9 Mon Sep 17 00:00:00 2001
+From 7a24ce9f5045ac6faf66a08bbb814f3a82c919b1 Mon Sep 17 00:00:00 2001
 From: Sergey Matyukevich <geomatsi@gmail.com>
 Date: Fri, 19 May 2017 23:39:48 +0300
-Subject: [PATCH] ARM: dts: orange-pi-zero: specify XR819 WiFi chip
- interrupts
+Subject: [PATCH] ARM: dts: orange-pi-zero: specify XR819 WiFi chip interrupts
 
 The orange-pi-zero board has Allwinner XR819 SDIO wifi chip. The board
 dts file provides a node enabling mmc1 controller. Together with an
@@ -17,12 +16,12 @@ Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-index b7ca916d871d..4e1a9050c6b4 100644
+index 2a45770f7b83..667038973bb7 100644
 --- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 +++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-@@ -125,6 +125,9 @@
+@@ -152,6 +152,9 @@ &mmc1 {
  	 */
- 	xr819: sdio_wifi@1 {
+ 	xr819: wifi@1 {
  		reg = <1>;
 +		compatible = "xradio,xr819";
 +		interrupt-parent = <&pio>;
@@ -31,5 +30,5 @@ index b7ca916d871d..4e1a9050c6b4 100644
  };
  
 -- 
-2.11.0
+2.47.1
 
diff --git a/board/orangepi/orangepi-zero/patches/linux/linux.hash b/board/orangepi/orangepi-zero/patches/linux/linux.hash
new file mode 100644
index 0000000000..c4a80927a8
--- /dev/null
+++ b/board/orangepi/orangepi-zero/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
diff --git a/board/orangepi/orangepi-zero/patches/uboot/uboot.hash b/board/orangepi/orangepi-zero/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/orangepi/orangepi-zero/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index b48c28102e..400937dfb1 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -34,11 +34,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
