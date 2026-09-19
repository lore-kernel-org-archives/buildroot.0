Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9745FC982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 19:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB4C40CE8;
	Sat, 19 Sep 2026 19:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smfeVNMLFEaH; Sat, 19 Sep 2026 19:13:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1C1CB40CCA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789845225;
	b=ij8cl4atM69J0/xiy+PbcMTE9S36Clo5x9fQkhyMh+oe2WxdY+eotZVOmyWH7QIARrb0
	 YsLkGVDmGrySI1RbvDvNq7eJPI11flFrRKQxX6+z49o/n/gGjHn1bb45rdwuvN0Nk4kJU
	 Rhv3Hjjoy/To1H5hW8Ts0kefzz9toDPIeXJBOyXfCXLeIPM9H2DklypZPCQj3wbNZMrmC
	 6wrlZIlGddgt5/ow0iK9rp+KfJP7MA6C2dOWT4K+mxyH2ThCOYZkdBoDarTq9BKXB0pO/
	 cze/HYU2TibyKdKEnjAysl58QkXpVrqKTBi4my9auVHBOoHDlu/av1eXuFqYQR6ZMfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789845225;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yLxm0RiThvSifppOI2gnEuV9tqkVs3aO/Oe4N9QwpAs=;
	b=eb/zHdBn3C/tnoT6w2a3qeECXJ3kFhHwbqveIaOekS+Zmifrc7Bt5u532ZopGu3dWJEt
	 nrQH355FmEE3boBNP+gCekgT6Ot6bozWMSxM7Mk4qCEqTs+kNR58mQiQlVT/lmxLYruct
	 6HWIpa12z4649gKS5ZpQK9AWrmzwCbMYlKC8XgnyW8fOvfniPDepplsLrBRbCOZ3+PxFb
	 tLXzhFheKJQDMJiAHT4aV5D/E/jh9/YUjk0GH+ua3oX41zh/luPgQTJNdpJATg9UDlCIv
	 uKOgVO0cwM+GBiGTzoAUv28NBmVB4B2/+zAYCOfZ0LVUZTivoHy+K9SezOd/vE3Ow2Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789845225;
	bh=yLxm0RiThvSifppOI2gnEuV9tqkVs3aO/Oe4N9QwpAs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Uzy3a0yYzEw2M+GY50pWylQ24/P5CyYM5+WmzlYBE+at3J4W2ABJC7JbJoJcAWnhk
	 13CtpbyJspj0oBP8vJhermwa/SL7hb/r3wat83sA3vfaFsfBbvO3GNEpFh8R6CRVhC
	 yVLMegbRCjoVgubpV5UOBvgr7x4r7Ozi/j2PoMYw4yudjE7dq7T6ZZ3JHokzgvY+jb
	 Vqo+pxzU/R/8DnLsb1YnWzIjeAdqLefwcfqtfcG3LpVQ02Zd8RBgaT0v+KtFFP39WE
	 1OH5WQyJ+IZX4FW75PZ/A6buaP6vygBtJbrHRSzRLiiWvf4eD5AEnN8fbInfxc7aa1
	 8l09E9hCf5AUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C1CB40CCA;
	Sat, 19 Sep 2026 19:13:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A84E5362
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A5BF4017C
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjZYVBjXSF17 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 19:13:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7AFB240179
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789845221;
 b=YJfzrtbWWYlAVIN8oLoOQWd8I+m0mW2COPaXSCZnD74ZjnCypT0oVlgkBhjpTDFFMiU+
 tnZW/WlfXUa1y4XKTCb6t25tq7rgEqCW0vwl/eotIsfam+9QW8158xc0p1ATf5vyx8oON
 Tu2r6Qno7834RVea/BjyEi7so2RRNAKtV+zLP5g9CFHWN56DUJLmKqqEEQWkWjYgCsD7i
 ZsEVnZeojPxtuzF1B+xIYFbmG+hBfhJK37zNwGjP/hK/1Kz+Qb2483O/GIuZaQv9iIemm
 sIGc6DgtPCT3CIwbSQ/Ld/TEgqBKlMhIyVBeEnujNGoxnn+6IiZz8vD+YT6Im2B0W2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789845221;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sBqa1Afp0lmfHDRaW5uXeFmNNzH+hWEBGpGhiUqw2OA=;
 b=XajJgGR06gFLOTSyMMWVLfXRStjxEsmgsSPww/8Ado6HE/eqInhPOIfYOyIuW8Y6ZeMT
 ylO7U4thh/DLkLWSfIrDPUstu5UPhKkLIHhmHdvtssQ3mfFSHubwabVDeLLyp2mpadKtU
 hLqbg4KVD1JB040cz6py0SFXiuRCiWGdEu7MQ+Il/uVEGxLiKgV2DWck8aCEhm0pnDX8v
 KwDcotM78sccJozpeUd8aP/2tZ31wPAOhrhTe0wBsIV8DYVveWTXUCgXcRN09HH/pFGXF
 mqXItmIydio+OLsOkxpn42v/ODPjPdAbdc3dTyS7ZX0IKc/eLh+kuqEdcPHUDwKctGA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AFB240179
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:13:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FEE88D6B6; Sat, 19 Sep 2026 19:12:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 21:08:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e27b1d8a47c1c9b36e7c5761299495f9a7e8c19
X-Git-Newrev: c23815ad18883fd47d0065a55e2048dce51ffd03
X-Patchwork-Hint: ignore
Message-Id: <20260919191233.6FEE88D6B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nxp-bt-wifi-firmware: bump version
 to lf-6.18.20-2.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c23815ad18883fd47d0065a55e2048dce51ffd03
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The IW610 module is also available with a USB host interface, while
the current package only supports its SDIO firmware. This commit
adds this USB support.

Bump the firmware release to lf-6.18.20-2.0.0, which
provides the FwImage_IW610_USB firmware, and add a dedicated
BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_USB option.

The new release also moves firmware files out of the nxp/ directory
and no longer provides 8801 or 8997 firmware. Update the installation
paths, make the existing IW610 option explicitly SDIO, and retain legacy
configuration handling for removed or renamed options.

This commit also updates the license hash, after an update from:
LA_OPT_NXP_Software_License v57 July 2024
to:
LA_OPT_NXP_Software_License v63 May 2025

Signed-off-by: Antoine Gennart <antoine.gennart@quimesis.be>
[Julien:
 - update license hash
 - fix _VERSION to use a tag rather than a branch
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   | 36 ++++++++++++++++++++++
 package/nxp-bt-wifi-firmware/Config.in             | 32 ++++---------------
 .../nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash |  4 +--
 .../nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk   | 16 +++++-----
 4 files changed, 51 insertions(+), 37 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6c222c0e57..565f100e57 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,42 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8801
+	bool "nxp-bt-wifi-firmware 8801 support removed"
+	select BR2_LEGACY
+	help
+	  The 8801 firmware is no longer available in the selected NXP
+	  firmware release.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997
+	bool "nxp-bt-wifi-firmware 8997 support removed"
+	select BR2_LEGACY
+	help
+	  The 8997 firmware is no longer available in the selected NXP
+	  firmware release.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_SD
+	bool "nxp-bt-wifi-firmware 8997 SD support removed"
+	select BR2_LEGACY
+	help
+	  The 8997 firmware is no longer available in the selected NXP
+	  firmware release.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_PCIE
+	bool "nxp-bt-wifi-firmware 8997 PCIe support removed"
+	select BR2_LEGACY
+	help
+	  The 8997 firmware is no longer available in the selected NXP
+	  firmware release.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610
+	bool "nxp-bt-wifi-firmware IW610 option renamed"
+	select BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_SD
+	select BR2_LEGACY
+	help
+	  The IW610 firmware option was renamed to distinguish SD and
+	  USB interfaces.
+
 config BR2_BINUTILS_VERSION_2_44_X
 	bool "binutils 2.44 has been removed"
 	select BR2_LEGACY
diff --git a/package/nxp-bt-wifi-firmware/Config.in b/package/nxp-bt-wifi-firmware/Config.in
index c707cd05cd..9fe79fa7d6 100644
--- a/package/nxp-bt-wifi-firmware/Config.in
+++ b/package/nxp-bt-wifi-firmware/Config.in
@@ -7,36 +7,11 @@ config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE
 
 if BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE
 
-config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8801
-	bool "8801 (SD)"
-	help
-	  NXP 8801 module firmware files.
-
 config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8987
 	bool "8987 (SD)"
 	help
 	  NXP 8987 module firmware files.
 
-config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997
-	bool "8997"
-	help
-	  NXP 8997 module firmware files.
-
-if BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997
-
-choice
-	prompt "8997 WiFi interface"
-
-config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_SD
-	bool "SD"
-
-config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_PCIE
-	bool "PCIe"
-
-endchoice
-
-endif
-
 config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098
 	bool "9098"
 	help
@@ -62,11 +37,16 @@ config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW416
 	help
 	  NXP IW416 module firmware files.
 
-config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_SD
 	bool "IW610 (SD)"
 	help
 	  NXP IW610 module firmware files.
 
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_USB
+	bool "IW610 (USB)"
+	help
+	  NXP IW610 module firmware files.
+
 config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW612
 	bool "IW612 (SD)"
 	help
diff --git a/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash
index 60e1be03da..dc90b5b9a9 100644
--- a/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash
+++ b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  444351eba2669772a0f62aadbff92b46adb370dcd5228f12e4f5ae2b58554951  nxp-bt-wifi-firmware-lf-6.6.52_2.2.0.tar.gz
-sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  LICENSE.txt
+sha256  e0ed4da6b52c3fca6fed3b1b7a484d11b720015946a72f04b24363e865fd4d08  nxp-bt-wifi-firmware-lf-6.18.20-2.0.0.tar.gz
+sha256  3001cf84018c5cb10d183a678f6ec8a928c797616ba06b398d7ca93c0779aaa2  LICENSE.txt
diff --git a/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk
index f0440ce32a..9b6a932fe4 100644
--- a/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk
+++ b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk
@@ -4,29 +4,27 @@
 #
 ################################################################################
 
-NXP_BT_WIFI_FIRMWARE_VERSION = lf-6.6.52_2.2.0
+NXP_BT_WIFI_FIRMWARE_VERSION = lf-6.18.20-2.0.0
 NXP_BT_WIFI_FIRMWARE_SITE = $(call github,nxp-imx,imx-firmware,$(NXP_BT_WIFI_FIRMWARE_VERSION))
 NXP_BT_WIFI_FIRMWARE_LICENSE = NXP Software License Agreement
 NXP_BT_WIFI_FIRMWARE_LICENSE_FILES = LICENSE.txt
 NXP_BT_WIFI_FIRMWARE_REDISTRIBUTE = NO
 
-NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8801) += FwImage_8801_SD
-NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8987) += FwImage_8987
-NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_SD) += FwImage_8997_SD
-NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_PCIE) += FwImage_8997
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8987) += FwImage_8987_SD
 NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098_SD) += FwImage_9098_SD
 NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098_PCIE) += FwImage_9098_PCIE
 NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW416) += FwImage_IW416_SD
-NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610) += FwImage_IW610_SD
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_SD) += FwImage_IW610_SD
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_USB) += FwImage_IW610_USB
 NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW612) += FwImage_IW612_SD
 
 define NXP_BT_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/nxp/wifi_mod_para.conf \
+	$(INSTALL) -m 0644 -D $(@D)/wifi_mod_para.conf \
 		$(TARGET_DIR)/lib/firmware/nxp/wifi_mod_para.conf
-	$(INSTALL) -m 0644 -D $(@D)/nxp/mfguart/helper_uart_3000000.bin \
+	$(INSTALL) -m 0644 -D $(@D)/mfguart/helper_uart_3000000.bin \
 		$(TARGET_DIR)/lib/firmware/nxp/helper_uart_3000000.bin
 	$(foreach f,$(NXP_BT_WIFI_FIRMWARE_FILES_y), \
-		$(INSTALL) -m 0644 -D $(@D)/nxp/$(f)/* $(TARGET_DIR)/lib/firmware/nxp/
+		$(INSTALL) -m 0644 -D $(@D)/$(f)/* $(TARGET_DIR)/lib/firmware/nxp/
 	)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
