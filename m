Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B41E94626
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC0DF60ABF;
	Tue, 10 Feb 2026 00:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6KjDokJw1JQ; Tue, 10 Feb 2026 00:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D87AC60ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682071;
	bh=H5LsNXnDL672z3wyh5+XbOfeRBxQvCyDOXNoe7+TeL0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WLT+/vuAFToFpTYpvgpm9BhmBkup2oUcBrRTGAYBC+g7ZSwb5gv5Y7QTHbVbD4WYv
	 W03z1Ino46ESFDStdv6Or7DINXTLHkVgJdT9DN7gDyp/Tl2R7dsAcN6x2X+ZWAEdTd
	 RMQj6rg0ZpptVLstvJIGH/mS03vPtAEU3b3TBLvCR2xFk/MTh/JjTJXx8vyRfmAXvT
	 AP3DIumczZtGIwCM0ZtbLzhgGDwXfZ9kSoHCh1WvtKuwFIBvgIGR3SoLE5y4L6ETcw
	 K2ZaACJLg4UHj3we38uUrxqeoGmsU79YiQswiOtGtwDdqdr6z1neRpOIMJ6dU370ED
	 CsUg/3VHalXTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87AC60ACB;
	Tue, 10 Feb 2026 00:07:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ECCD23D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCEEF60ACB
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqF4v9Q1QQuu for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:07:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C4D960ACA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C4D960ACA
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C4D960ACA
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:46 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbI7vTZGv5gYjpbI8vmsgS; Tue, 10 Feb 2026 01:07:45 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:07:29 +0100
Message-ID: <20260210000739.3810940-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBtf0e1gav9S9A8FedqnhBd3yaiw9mKo6rJyVByk31MXhnexwb3XJBAzuCvCCRVf3IIu9vKC3zzlh11duY0gO1MQv9Fo97JO/T1aAs4VprYeP4jZBXMm
 OTzOBtQtt+SZTZtFWSYDSX626Qz8olY5iBdX5miO2QvcscWx5BNc+ncznNBFD+4E8gqPlQsp1B1LWrym2nEO1dTqsO2I3qD5CTYr5AgW8LsPh9TFBq/6f6Dq
 XfPdLu4A+Lvckl/KaTiAFcqmBmlfhN5wE/XYkp8qw6fVmRflUGvAg1E34H0/36QZRRLg2RtFvGciH0EgLalkz4xg/4ifrk+6JH15iWP4vidXDCyJOmY9ErFS
 ZhWhR/5NkB0/m7wx8sFv1N1T7RxFyCazXbX0m67JtkKg1dJk3uTJ2gEpgWblsHViTLG6i5Y9YKClmcKDUO9l/Ldn2m2DLo9TKVsNp+FcMlvEOTOh39iDfqGA
 N3JNfBam2ehheYj2N3FOuRuqLAuHALgbyBFqct3S8DhTiNcKEIVQEDdgmDRKBBfe4IYm6ObvOp4h993C+GVNo7bJSzZRaexDdozzUhEozYCKWOTLSQdfdxIT
 Gqg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682065; bh=2VatOysnePDK9kOqDKC9FlCbWzfwHHI7rjiKyMoGlfw=;
 h=From:To:Subject:Date:MIME-Version;
 b=HPhLCXHTe8V24USFkyP+qMuTPw9dF+rUwBpqmorEL+NjZRkP2WWSJLP0yJBrRB2CQ
 TjHu5afIzm59xhr97sAzdfN7Kbjh9T3knW0p+anwqOZESmJvY6uFCEt6JHouQtlcZ2
 gOiG6rA0DVZ5gmpmQhKNZq+AZoPHVnIQSuURGCBAzNOQp+rUSaHxOtNQ/rusZWCda9
 mc2+X/kEgMay8BOLtGj65A0N9Wv8l6TKmH9CKdfSZhCbuiL/THOKUVBTOAzi+Mb67T
 DMeHEZsoH/VORnxfucymwOlPrSDmaco/u1PFBAdrYh9POvfEFaara9eED0W3GQHmSk
 KI7dZ6BFxgYyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=HPhLCXHT
Subject: [Buildroot] [PATCH v2 03/13] configs/bananapi_m2_berry: bump Linux
 to 6.18.8 and U-Boot to 2026.01
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .checkpackageignore                                   |  1 -
 .../patches/linux-headers/linux-headers.hash          |  1 +
 .../bananapi-m2-berry/patches/linux/linux.hash        |  2 ++
 .../bananapi-m2-berry/patches/uboot/uboot.hash        |  2 ++
 configs/bananapi_m2_berry_defconfig                   | 11 +++++++----
 5 files changed, 12 insertions(+), 5 deletions(-)
 create mode 120000 board/bananapi/bananapi-m2-berry/patches/linux-headers/linux-headers.hash
 create mode 100644 board/bananapi/bananapi-m2-berry/patches/linux/linux.hash
 create mode 100644 board/bananapi/bananapi-m2-berry/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 62e3998a66..38cd0b2711 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -90,7 +90,6 @@ configs/atmel_sama5d4_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/avenger96_defconfig lib_defconfig.ForceCheckHash
 configs/avnet_rzboard_v2l_defconfig lib_defconfig.ForceCheckHash
-configs/bananapi_m2_berry_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_ultra_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_zero_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/bananapi/bananapi-m2-berry/patches/linux-headers/linux-headers.hash b/board/bananapi/bananapi-m2-berry/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/bananapi/bananapi-m2-berry/patches/linux/linux.hash b/board/bananapi/bananapi-m2-berry/patches/linux/linux.hash
new file mode 100644
index 0000000000..b1a0042a91
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/bananapi/bananapi-m2-berry/patches/uboot/uboot.hash b/board/bananapi/bananapi-m2-berry/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
index 200257ac0d..35909fbb99 100644
--- a/configs/bananapi_m2_berry_defconfig
+++ b/configs/bananapi_m2_berry_defconfig
@@ -1,16 +1,18 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_TOOLCHAIN_EXTERNAL=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/bananapi/bananapi-m2-berry/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Berry"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bananapi/bananapi-m2-berry/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-berry/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.57"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v40-bananapi-m2-berry"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-v40-bananapi-m2-berry"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -18,11 +20,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
