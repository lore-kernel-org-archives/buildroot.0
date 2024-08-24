Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98DAC52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 17:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58FDD606A5;
	Sat, 24 Aug 2024 17:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZxpG-EdDQ1x; Sat, 24 Aug 2024 17:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D0D2605C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D0D2605C9;
	Sat, 24 Aug 2024 17:59:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D53C21BF28A
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 17:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2F8381765
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 17:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1s2uit26Y60 for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 17:59:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C05B78175A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C05B78175A
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C05B78175A
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 17:59:01 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-39d47a9ffd5so10390785ab.2
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 10:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724522340; x=1725127140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hvxGRk45gy1J63ry+OXkArivdzuEEwLWmj2DWegfkmw=;
 b=VXM6qDX8mXjOpmHKSVYZEjua+wYpntcT5NI32WB4z3UzckvR3apx6PCtNvqLM6Rker
 xlEfGQgIqxk1tLq9X2D7mFNV57ocbICbGjjNgEyTPGwSX6/hY6b6jWhbbUqk8s5qFFj5
 aKmiDr7uB+LzBE5l49AsGF5GajhprhpdK18Y5BM7TOX7gGd7iNMaxQq9XmsjgR3ufUag
 tW42/VNF5nZmY0/ir6YE3ixykiqtkS5/vnwYsZ74WSayHW15ecp/9c3aZp022/tbO7G8
 Maf/0ibgYkez/r1MB+lFnionS3GHufx2rarqP/RYCWD6ROzIOCpagXD0YSfyhDjxGeKG
 4DKQ==
X-Gm-Message-State: AOJu0YwCV4CLRx9yA8aojbnE063AZDHAn9w+59XOOHAzvg6FL77maJrs
 o5P/0tyC1A5FZwDsJZ1N/k5E1nzWynwry1Z4REQ2hUjeQVthrJqoU3rRAg==
X-Google-Smtp-Source: AGHT+IEHH7L7E9a2O1sOjlhCqns37qoiTjmtUsnYTNtagd+0pruA9yhGrPckgfEFn/eHiCLh7qfsZQ==
X-Received: by 2002:a05:6e02:168c:b0:39d:3b1d:96b8 with SMTP id
 e9e14a558f8ab-39e3c9e9ab8mr70401975ab.28.1724522339875; 
 Sat, 24 Aug 2024 10:58:59 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44ec:77f0:fcc9:d01d])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9ad55880sm4399152a12.69.2024.08.24.10.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 10:58:58 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 14:58:21 -0300
Message-Id: <20240824175821.828808-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724522340; x=1725127140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hvxGRk45gy1J63ry+OXkArivdzuEEwLWmj2DWegfkmw=;
 b=kfZduXjZu9Rm2dT2FVLMqfsp5tXphTx02hIvNoi/awdek1hHZlISh0Qe3mKTHlizk1
 lM075vieXz3Ir9ZqOye7FCIRIDX/GzN0lv5vzcC8WtgckqgQXVlw04YWcTNbB+e9OdlM
 +MFMUn4AhuX2iur2rr0LRr+xIW5XdOUzxjK8PfG3xxOFqeoRyrnY3OwaaSq0wEx3XnBm
 Ny8ZbydAEDea9SNEHSf+hihRA7PnN1eGchsPRd/52o6x64co8ScEmbs/CXUv4LylPoB0
 t0yQq1/tX022UaZvQqdI/5PUTECjuUNESvjQzo5cvlzpEvr/q+xxfwsizQ+WK5mjvUAl
 yE8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kfZduXjZ
Subject: [Buildroot] [PATCH] configs/mx6udoo: update U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to U-Boot 2024.07 and kernel 6.10.6 versions.

As kernel 6.10 fixes the USB kernel hang, remove the original patch.

Also convert it to use extlinux.conf file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../linux/0000-udoo-disable-usbh1.patch       | 26 -------------------
 .../boot/extlinux/extlinux.conf               |  4 +++
 configs/mx6udoo_defconfig                     | 15 +++++------
 3 files changed, 10 insertions(+), 35 deletions(-)
 delete mode 100644 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch
 create mode 100644 board/udoo/mx6qdl/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch b/board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch
deleted file mode 100644
index d151a40d6e2e..000000000000
--- a/board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-[PATCH] ARM: dts: imx6qdl-udoo: Disable usbh1 to avoid kernel hang
-
-Currently the kernel hangs when USB Host1 is enabled due to the lack of
-support for controlling the USB hub clock and GPIO reset line.
-
-Peter Chen has made several attempts to fix this problem, but his series
-has not been applied yet, so better disable USB host1 for now to avoid
-the kernel hang.
-
-Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
----
-
-diff --git a/arch/arm/boot/dts/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
-index 828dd20cd27d..c9e122865312 100644
---- a/arch/arm/boot/dts/imx6qdl-udoo.dtsi
-+++ b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
-@@ -292,7 +292,8 @@ &usbh1 {
- 	pinctrl-0 = <&pinctrl_usbh>;
- 	vbus-supply = <&reg_usb_h1_vbus>;
- 	clocks = <&clks IMX6QDL_CLK_CKO>;
--	status = "okay";
-+	/* currently USB support causes a kernel hang. Disable it for now */
-+	status = "disabled";
- };
- 
- &usbotg {
diff --git a/board/udoo/mx6qdl/rootfs_overlay/boot/extlinux/extlinux.conf b/board/udoo/mx6qdl/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 000000000000..cbb284f91b4f
--- /dev/null
+++ b/board/udoo/mx6qdl/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx6qdl-udoo buildroot
+	kernel ../zImage
+	fdtdir ../
+	append root=/dev/mmcblk2p1 rootwait rw
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 5092ef0fd148..6c84a41bfdcf 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -3,27 +3,26 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_GLOBAL_PATCH_DIR="board/udoo/mx6qdl/patches"
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/udoo/mx6qdl/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.84"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.6"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-udoo imx6dl-udoo"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-udoo nxp/imx/imx6dl-udoo"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # required tools to create the SD card image
@@ -31,5 +30,3 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/udoo/common/boot.scr.txt"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
