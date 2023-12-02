Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F8BC4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 12:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A306607DE;
	Sat,  2 Dec 2023 12:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A306607DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j35w6Co-KZdF; Sat,  2 Dec 2023 12:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 644B360AC0;
	Sat,  2 Dec 2023 12:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 644B360AC0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C29311BF299
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BE0C42223
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BE0C42223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWRPQ6VJgvq9 for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 12:34:13 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6409A42201
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 12:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6409A42201
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50aab20e828so4145216e87.2
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 04:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701520450; x=1702125250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6a6ZGNFw/IfE4tOYYxS1JMb0u7HW0HTxKVkhoFUQseo=;
 b=mzxcUojXefJtMT7lhqgY9POqNfQTCRpVDY8FObYU8ECCbjdPSFlmlB3YWVRucoBJQt
 XAaH9393JNDf30iVuXA6KGZQhN86C0ef1CbmmgSriEyULYEhd99pIM7VecXb1EGf0X9+
 4JWhUhfO44UwN1iANrt/UpnfZf5CyVKY8U9CWBhil9dN5m1YlFXHvCIuIDbqmYCfKJCC
 nzHnObPmIEmG+UH2Gaa+bimIM2YE0IXoBIz3wkh4LgAFqEMrH/PVlV/l169jzeCzYZPt
 rts2bDqTEcr9CX0mKqi43p8/DnMB3BYHLr4Ca4lJ1I1VARjV2oH92ODfIdQvh3aHZsfy
 CR+g==
X-Gm-Message-State: AOJu0YzrDtMw5RpltDsjdkgr14m/ZDGOCXS2Of3OvWN2VP02ofjIPV3b
 xE0yWdP8m+ptqq4BA9SiCIGK3EmkWBc=
X-Google-Smtp-Source: AGHT+IEPSpy3lDqmfXB3lfcvV5zBq2Su+72o+Y4OjAdXTyEDtQOeJSEE0MHIizUyTzbVNvazlu5F7w==
X-Received: by 2002:a05:6512:3a85:b0:50b:ccc2:e213 with SMTP id
 q5-20020a0565123a8500b0050bccc2e213mr2088566lfu.17.1701520450528; 
 Sat, 02 Dec 2023 04:34:10 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 e14-20020ac2546e000000b0050bbcd68e8bsm705672lfn.47.2023.12.02.04.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:34:09 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 15:31:40 +0300
Message-ID: <20231202123400.2327151-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231202123400.2327151-1-geomatsi@gmail.com>
References: <20231202123400.2327151-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701520450; x=1702125250; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6a6ZGNFw/IfE4tOYYxS1JMb0u7HW0HTxKVkhoFUQseo=;
 b=SPI5nFjVMX9euv6xT1OfnZU5j44YWzd30HqvEChVuGuH9DRtfadr1Mhq+XDUN8bEKH
 5CqdiAyyMeOV46Z00ty8YUP52NGmkszw7iP0d8zSUq1EY0Cm3Jt9RD3IMFm5q5GEixMd
 yqxWfPO6fCIY3BJo3xZNBbr5vjDkQ4Z88dRZA9lfA09XnAjESjsvu0RiLUQn52tMgYL/
 DMVeMXEvkOiUK17lAl3X7aWcdOsnXmeomFqbegEXQp0/Nv7cyE8Otyi2z2OUWWM5jskk
 JLq7qV0oWHWlMTkNsU16d/RLztT3AbotVzL0qnQpKLqT8ZciP9Tzzz7AHrzB7N4emqzj
 Qz7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SPI5nFjV
Subject: [Buildroot] [PATCH 4/5] configs/orangepi_zero: bump BSP versions
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the new Linux LTS release 6.6.3. Swtich to the
latest U-Boot 2023.10.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 ...RM-dts-orange-pi-zero-interrupt-triggering-xr819.patch | 8 ++++----
 .../0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch      | 8 ++++----
 .../linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch | 8 ++++----
 .../linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch   | 8 ++++----
 configs/orangepi_zero_defconfig                           | 8 ++++----
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
index 16207afcb1..6a5aa0bb63 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
@@ -13,13 +13,13 @@ This commit specifies XR819 interrupt configuration for the driver.
 
 Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
 ---
- arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 3 +++
+ arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 3 +++
  1 file changed, 3 insertions(+)
 
-diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 index b7ca916d871d..4e1a9050c6b4 100644
---- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
-+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 @@ -125,6 +125,9 @@
  	 */
  	xr819: sdio_wifi@1 {
diff --git a/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
index e4c52ab911..ff0a1db223 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
@@ -10,13 +10,13 @@ For more information see:
 
 Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
 ---
- arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 16 ++++++++++++++++
+ arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 16 ++++++++++++++++
  1 file changed, 16 insertions(+)
 
-diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 index 4e1a9050c6b4..cdf19821b1f3 100644
---- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
-+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 @@ -161,3 +161,19 @@
  	/* USB VBUS is always on */
  	status = "okay";
diff --git a/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
index ae0ed9ba3b..04d43c344f 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
@@ -8,13 +8,13 @@ This patch enables spidev driver for SPI1.
 
 Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
 ---
- arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 11 +++++++++++
+ arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 11 +++++++++++
  1 file changed, 11 insertions(+)
 
-diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 index cdf19821b1f3..7242aaecb14f 100644
---- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
-+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 @@ -59,6 +59,7 @@
  		serial0 = &uart0;
  		/* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */
diff --git a/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch b/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
index 839bc16087..41c23209ce 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
@@ -7,13 +7,13 @@ Enable uart1 and uart2 on orange-pi-zero board.
 
 Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
 ---
- arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 4 ++--
+ arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 index f19ed981da9d..03acf166ab70 100644
---- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
-+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 @@ -184,13 +184,13 @@ &uart0 {
  &uart1 {
  	pinctrl-names = "default";
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index e286f0b7f1..596805bd47 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -8,16 +8,16 @@ BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_SYSTEM_DHCP="eth0"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h2-plus-orangepi-zero"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
@@ -31,7 +31,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
