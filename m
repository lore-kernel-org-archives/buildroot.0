Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65F0C83F09
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 23:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 237B780B77;
	Tue,  8 Jul 2025 23:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbZ8SjOjIDEg; Tue,  8 Jul 2025 23:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5798E80B2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5798E80B2B;
	Tue,  8 Jul 2025 23:47:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1A3E12E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 23:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4D2E60645
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 23:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOxmQC_ch2YX for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 23:47:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06ADB606F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06ADB606F2
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06ADB606F2
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 23:47:41 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7d5bf3300e0so503396185a.0
 for <buildroot@buildroot.org>; Tue, 08 Jul 2025 16:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752018460; x=1752623260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YKKaY2AMWsDOiUGSMTH35oI+bgzNGB2+khwg4z0Gmb4=;
 b=JIgYJwBYJDgRiitEi6q+crY/7jnPyebhkUJv4VnzU2kVzG0eJzVAr+lS+AAGD4L2tJ
 qplEZo37TTck4mLZRHHa3eE2mmuV0D6lRE7RXA87e45cDDQGkKrqWhJ5yqTfa9zr/PPJ
 mdDrJpRWCaYLUJNyvAOfhFumEVdfHBrPkYJo91Kh96CtAy9hYm1kDfKgYv8ltgFU7XUd
 XWL+882CMX1pPgeQquHi09Pe/2t+hPJRBp3qPhhMHBT4p1XWVBKuxO6yyHg2DKkNkf2O
 Yt7YAG4uInAh4ueqLrzWlnPqD9Xfr7NfbhYxljJrGCOqBHJYSzeLa+HArtDmNFYLjuvm
 kUKw==
X-Gm-Message-State: AOJu0YyBDNYdFjsytHwH+7aLu5wunaCO3O15akGSmm60fqVMDypSAsrp
 2zHh51P5NEVvT8zN1fA0NQI9WCN54gArfoEu+9V6bN72WcWLBEVPY5Os+KJii0D7
X-Gm-Gg: ASbGncturJSkjjM7HPijITURvN2FjeyYzy6aDzcf4J1LOid8vWLnSsKvPEOd5pzO3Lc
 +Re/w1Yxj2bd8mwrBily3G46HnJ+yBdMzrX0GktLp+Z4EQYrl4uSc0BvwLZnZHACciseDWxc5nC
 KisnyvSHVLp+it46G7TLOcLBmSMpllj+kW9wGHsyZtNdRYTGgY0w1wfuMUakEpGQIupUQGANSzj
 uSiYBIUg3a9y11klax3f5/PSggy1x3I2wc20TOnPLMBRN6MNhsM4Fkiq5WaNBAOuXdt/I58stPw
 LH45gRU+aEmH9HZjivWotIvOFW4k3NJMhXCIZEz8+gQTGKTUjgDeIp49E3muaHPJeURtP7Ei9Iw
 Lc3OrWVRd5Dj9d3EKPiFYcUbRYxvAwkPt4PzT+RyOV9R+xY11k12TQLcj
X-Google-Smtp-Source: AGHT+IEEPmlt6/ABWD24TOWpywn3YC35X9i46+78+MJ2ryjXijyhSsvjdzOm1AgkmHGcoK7qDFAU2g==
X-Received: by 2002:a05:620a:1a09:b0:7d3:9288:5c1a with SMTP id
 af79cd13be357-7db81f1268bmr93249385a.46.1752018460407; 
 Tue, 08 Jul 2025 16:47:40 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-215-125.bstnma.fios.verizon.net.
 [108.26.215.125]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d5dbd9422csm855533985a.15.2025.07.08.16.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 16:47:40 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>, stephane.viau@oss.nxp.com,
 festevam@gmail.com, maeva.manuel@oss.nxp.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  8 Jul 2025 19:47:39 -0400
Message-ID: <20250708234739.2969797-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752018460; x=1752623260; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YKKaY2AMWsDOiUGSMTH35oI+bgzNGB2+khwg4z0Gmb4=;
 b=l8WIMuivSI+UI+vpm38Cc98c7R36OhG2WgQAwFUV+bp4xcpxBNQs6n8XjUls5bNymW
 igO/i/lgiNkIiKSlYA+aJFaAe/hdJpuFm6uocEHgSkxwCSq3rI2cSf16dNBoZ/zcBBUP
 AkiHIX5bsNiAioM5MOdrQZhsMCDjNF1OAKXRgk+7ZzmhrE9lPmerJh0GLf/o0mePiRd9
 96CsDrgW0sx60XPIeVP6gtBkahhVRQJdVFBl4PWxgujAQ+VWZ+U2JboW1FQcIq6T6lRs
 QVtV6zhphQblRpoc18MZpALcjhc1bUvNhBHqpDBhICdmHW81fK+sNvp35G84JOGCQWg9
 DvFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l8WIMuiv
Subject: [Buildroot] [PATCH] configs/imxrt1050-evk: Switch to use
 extlinux.conf
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to extlinux instead of built in U-Boot script.
Drop custom U-Boot fragment and genimage config.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 board/freescale/imxrt1050evk/genimage.cfg       | 17 -----------------
 .../rootfs_overlay/boot/extlinux/extlinux.conf  |  4 ++++
 board/freescale/imxrt1050evk/uboot.fragment     |  2 --
 configs/imxrt1050-evk_defconfig                 |  5 +++--
 4 files changed, 7 insertions(+), 21 deletions(-)
 create mode 100644 board/freescale/imxrt1050evk/rootfs_overlay/boot/extlinux/extlinux.conf
 delete mode 100644 board/freescale/imxrt1050evk/uboot.fragment

diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
index 64fc8452f8..3a4c4fb792 100644
--- a/board/freescale/imxrt1050evk/genimage.cfg
+++ b/board/freescale/imxrt1050evk/genimage.cfg
@@ -1,14 +1,3 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"imxrt1050-evk.dtb",
-		}
-	}
-
-	size = 8M
-}
-
 image sdcard.img {
 	hdimage {
 	}
@@ -27,12 +16,6 @@ image sdcard.img {
 		size = 512K
 	}
 
-	partition boot {
-		partition-type = 0xc
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
diff --git a/board/freescale/imxrt1050evk/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/imxrt1050evk/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..1818d2702d
--- /dev/null
+++ b/board/freescale/imxrt1050evk/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label buildroot
+	kernel /boot/zImage
+	devicetree /boot/imxrt1050-evk.dtb
+	append console=ttyLP0 root=/dev/mmcblk0p1 rootwait rw
diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
deleted file mode 100644
index dd45ca4c29..0000000000
--- a/board/freescale/imxrt1050evk/uboot.fragment
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_USE_BOOTCOMMAND=y
-CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 zImage;bootz 0x80000000 - 0x80800000"
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 8a515a9260..8bff623602 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_m7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
+BR2_ROOTFS_OVERLAY="board/freescale/imxrt1050evk/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
 BR2_LINUX_KERNEL=y
@@ -9,15 +10,15 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7"
 BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imxrt1050-evk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
