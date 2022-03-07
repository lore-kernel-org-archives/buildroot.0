Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6B1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95FE841715;
	Mon,  7 Mar 2022 21:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAHBW3uFP_Fg; Mon,  7 Mar 2022 21:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9578F41710;
	Mon,  7 Mar 2022 21:15:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9A791BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A874781AF5
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=embeddedts.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eyVC9c_oPeKQ for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:15:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C44F81AF4
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:15:10 +0000 (UTC)
Received: from 1nRKhA-000A2l-Vr by out3d.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1nRKhC-000A6e-TX; Mon, 07 Mar 2022 13:15:10 -0800
Received: by emcmailer; Mon, 07 Mar 2022 13:15:10 -0800
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3d.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1nRKhA-000A2l-Vr; Mon, 07 Mar 2022 13:15:08 -0800
Received: from tsdebian.ts-local.net (_gateway [192.168.0.64])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 2CCB73D634;
 Mon,  7 Mar 2022 14:15:08 -0700 (MST)
To: buildroot@buildroot.org
Date: Mon,  7 Mar 2022 13:14:55 -0800
Message-Id: <20220307211455.9630-1-kris@embeddedTS.com>
X-Mailer: git-send-email 2.11.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (b)
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedTS.com; s=mailanyone20220121; h=Message-Id:Date:To:From;
 bh=kr9tHhHKWS8DLuM952s8rwZUjKE7VdTbtqlQUENHyFU=;
 b=Bqucflutkb5B9NFS1XP+HUqugVVzTQCOgDVSbsAimD57uvuWPc6hfPbwZokzghoJZVy5LIkaP9JKNCZMu2vbJUwfPpniFu1e8XxioxBn4ST1hlkBHWJfzAszSblkXMlmB9MDnCnJDQ9ZEiOVwANdLMqORJRkZ63tLKBth1oFgtnzpHGdklS4b4wz+Yn8JBJZojpL8vZid7NS/NxQvpnev96sZQF4/cQneXhT1aAQpCXYnZxd3v+jsZpR+svaSZie3wBuYPMPvdprhMgfc+kT/GrIVLypRMIdd2ZT5wFRORQBJUcR58+DWeMGEF+83ZganscZOm3Y0xX/ryahnry2sw==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: [Buildroot] [PATCH 1/1] fix links to Technologic Systems web
 resources
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: Kris Bahnsen <kris@embeddedTS.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mathieu Audat <mathieuaudat@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Technologic Systems has rebranded as embeddedTS with the current
domain eventually going offline. Update web/doc URLs to correct
resource locations.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
RESEND:
 - Was not subscribed to Buildroot list with this email

 board/technologic/ts4900/readme.txt  | 4 ++--
 board/technologic/ts5500/readme.txt  | 4 ++--
 board/technologic/ts7680/readme.txt  | 4 ++--
 configs/ts7680_defconfig             | 2 +-
 package/ts4900-fpga/Config.in        | 2 +-
 package/ts4900-fpga/ts4900-fpga.hash | 2 +-
 package/ts4900-fpga/ts4900-fpga.mk   | 4 ++--
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/board/technologic/ts4900/readme.txt b/board/technologic/ts4900/readme.txt
index 679454fdeb..121e639749 100644
--- a/board/technologic/ts4900/readme.txt
+++ b/board/technologic/ts4900/readme.txt
@@ -9,7 +9,7 @@ Freescale i.MX6 Single or Quad Core ARM Cortex-A9 CPU clocked at
 1GHz. The TS-4900 features Gigabit Ethernet, SATA II Port, PCI Express
 Bus, high speed USB host and device (OTG), and microSD card.
 More details on the board here:
-   http://wiki.embeddedarm.com/wiki/TS-4900
+   https://docs.embeddedTS.com/TS-4900
 
 The TS-4900 is not currently supported by mainline Linux, so a
 Technologic Systems Linux is used based on Linux 4.1.
@@ -48,5 +48,5 @@ connector etc.
 The bootloader comes pre-flashed on the board on an SPI flash. Since
 updating the bootloader is risky and not trivial, it is not included
 in the Buildroot defconfig. Refer to
-http://wiki.embeddedarm.com/wiki/TS-4900#U-Boot for details on which
+https://docs.embeddedTS.com/TS-4900#U-Boot for details on which
 U-Boot config to use and how to flash it.
diff --git a/board/technologic/ts5500/readme.txt b/board/technologic/ts5500/readme.txt
index 1e73ab3ea1..1fe384faae 100644
--- a/board/technologic/ts5500/readme.txt
+++ b/board/technologic/ts5500/readme.txt
@@ -5,7 +5,7 @@ This document explains how to set up a basic Buildroot system for the
 Technologic Systems TS-5x00 serie of x86-based Single Board Computers.
 
 TS-5x00 Single Board Computers are based on the AMD Elan520 processor. For more
-information please have a look at http://wiki.embeddedarm.com/wiki/#AMD
+information please have a look at https://docs.embeddedTS.com/Documentation_Home#AMD
 
 The kernel configuration works for any AMD Elan520-based SBCs, but the support
 is enhanced for the TS-5500 and TS-5400 models (on-board devices registration
@@ -45,7 +45,7 @@ config, the BIOS must use Logical Block Addressing (LBA). You can do it by
 choosing "Ide 0: AUTOCONFIG, LBA" under "IDE DRIVE GEOMETRY" in the "Basic CMOS
 Configuration" screen. Also, don't forget to set the 'active' (or 'bootable')
 flag on partition 1. For details about the CMOS setup, please see:
-http://wiki.embeddedarm.com/wiki/TS-5500#System_BIOS_Setup_Screens
+https://docs.embeddedts.com/TS-5500#System_BIOS_Setup_Screens
 
 Connect a terminal program to the rs232 connector marked "COM2"
 with baudrate set to 115200, insert the Compact Flash card into the socket,
diff --git a/board/technologic/ts7680/readme.txt b/board/technologic/ts7680/readme.txt
index 43d5d135e8..3f703330bf 100644
--- a/board/technologic/ts7680/readme.txt
+++ b/board/technologic/ts7680/readme.txt
@@ -8,7 +8,7 @@ The TS-7680 SBC is based on the Freescale i.MX286 ARM ARM926EJ-S
 running at 454MHz. The TS-7680 features are 10/100 Ethernet ports,
 Wi-Fi, microSD card, eMMC, NOR Flash, USB host port, CAN ports,
 relays and ADC/DAC. More details on the board here:
-https://wiki.embeddedarm.com/wiki/TS-7680
+https://docs.embeddedTS.com/TS-7680
 
 The TS-7680 uses a 4.9 Linux kernel provided by Technologic Systems.
 
@@ -46,5 +46,5 @@ the SD jumper is present and the U-Boot jumper is not.
 The bootloader comes pre-flashed on the board on an SPI flash. Since
 updating the bootloader is risky and not trivial, it is not included
 in the Buildroot defconfig. Refer to
-https://wiki.embeddedarm.com/wiki/TS-7680#U-Boot for details on
+https://docs.embeddedts.com/TS-7680#U-Boot for details on
 which U-Boot config to use and how to flash it.
diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
index 7eb57ab1c5..e4f5c1aabd 100644
--- a/configs/ts7680_defconfig
+++ b/configs/ts7680_defconfig
@@ -4,7 +4,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/technologic/ts7680/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,embeddedarm,linux-4.9.y,d03d426e6abd95a973bc669315206295713c17e8)/linux-d03d426e6abd95a973bc669315206295713c17e8.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,embeddedTS,linux-4.9.y,d03d426e6abd95a973bc669315206295713c17e8)/linux-d03d426e6abd95a973bc669315206295713c17e8.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="ts_imx28"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
diff --git a/package/ts4900-fpga/Config.in b/package/ts4900-fpga/Config.in
index 7aa94e26f2..9f704fbc8c 100644
--- a/package/ts4900-fpga/Config.in
+++ b/package/ts4900-fpga/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_TS4900_FPGA
 	  It is loaded by U-Boot during the boot sequence, the default
 	  U-boot script expects to find it in the /boot folder.
 
-	  http://wiki.embeddedarm.com/wiki/TS-4900#FPGA_Changelog
+	  https://docs.embeddedts.com/TS-4900#FPGA_Changelog
diff --git a/package/ts4900-fpga/ts4900-fpga.hash b/package/ts4900-fpga/ts4900-fpga.hash
index 2147aeb3c2..ed2941079a 100644
--- a/package/ts4900-fpga/ts4900-fpga.hash
+++ b/package/ts4900-fpga/ts4900-fpga.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-linux/fpga/ts4900-fpga-20150930.bin.md5
+# From https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga//ts4900-fpga-20150930.bin.md5
 md5 bf93c03ef914cf008287c8cd60781cc8  ts4900-fpga-20150930.bin
 
 # Locally calculated
diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
index 7bb62a3984..a3e42c0812 100644
--- a/package/ts4900-fpga/ts4900-fpga.mk
+++ b/package/ts4900-fpga/ts4900-fpga.mk
@@ -6,9 +6,9 @@
 
 TS4900_FPGA_VERSION = 20150930
 TS4900_FPGA_SOURCE = ts4900-fpga-$(TS4900_FPGA_VERSION).bin
-TS4900_FPGA_SITE = ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-linux/fpga
+TS4900_FPGA_SITE = https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga
 # No license file provided, Yocto recipe from the vendor claims MIT.
-# https://github.com/embeddedarm/meta-ts/blob/f31860f1204b64f765a5380d3b93a2cf18234f90/recipes-extras/ts4900-fpga/ts4900-fpga.bb#L6
+# https://github.com/embeddedTS/meta-ts/blob/f31860f1204b64f765a5380d3b93a2cf18234f90/recipes-extras/ts4900-fpga/ts4900-fpga.bb#L6
 
 define TS4900_FPGA_EXTRACT_CMDS
 	cp $(TS4900_FPGA_DL_DIR)/$(TS4900_FPGA_SOURCE) $(@D)
-- 
2.11.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
