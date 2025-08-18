Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82297CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 20:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 540ED6067A;
	Mon, 18 Aug 2025 20:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipTMQFYSALNH; Mon, 18 Aug 2025 20:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6861860631
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6861860631;
	Mon, 18 Aug 2025 20:36:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52022E2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43C0660631
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HcY3SZrQHHCb for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 20:36:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13E1660606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13E1660606
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13E1660606
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:36:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DB545C6B3B0
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:35:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 37517606A6;
 Mon, 18 Aug 2025 20:36:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 290DD1C22C7C1; 
 Mon, 18 Aug 2025 22:36:02 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 18 Aug 2025 22:36:00 +0200
Message-ID: <20250818203601.3220947-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755549364; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=LcWQLhr993ujc4tlKuYKxFXvyhmIfBxEuvu7THugVkk=;
 b=XfGAadDwaKsNMNq2uXhx48somkqArm8nYaKFJq4jYY0ajvSUvkFPWj+z4TSlee1B8hJBy+
 pDKCc8zzPe2SnzsfUQtHhIg+BtaEg4M6rIuXpEeURbzwlTEQR0n0x/EqJzxGj+X6PJo9H1
 KAG3+0YwAgWqfA6QawOKDPnGl+Uo2aORwQLn/9DGUAqgVTNU42+dA59GQB1ytYwg6MP5Wb
 O6dIGIK4/RaWpefyC7XXyfO8w6TD79e4vvNs0YQ6N9XiFWFcl5Q3SiHyP5BW5xegfIf55W
 CcOWFFPNTvGF1veUjwsNWnHs2hcyY481MzHXxYjryYClD/WLqDbNuMHn1ZlJQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=XfGAadDw
Subject: [Buildroot] [PATCH] configs/arcturus_ucp1020: remove defconfig,
 broken
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Michael Durrant <mdurrant@arcturusnetworks.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272373

The kernel is probably too old to build with recent gcc/binutils
versions.

This has been failing to build for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Ducp1020&kind=BUILD

and nobody bothered fixing it, so let's drop the defconfig.

Cc: Michael Durrant <mdurrant@arcturusnetworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                   |  1 -
 DEVELOPERS                            |  1 -
 board/arcturus/ppc-ucp1020/readme.txt | 74 ---------------------------
 configs/arcturus_ucp1020_defconfig    | 19 -------
 4 files changed, 95 deletions(-)
 delete mode 100644 board/arcturus/ppc-ucp1020/readme.txt
 delete mode 100644 configs/arcturus_ucp1020_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 8b21f78357..7215c61fd1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -99,7 +99,6 @@ boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_pat
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
 configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
-configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
 configs/aspeed_ast2500evb_defconfig lib_defconfig.ForceCheckHash
 configs/aspeed_ast2600evb_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index f50a92fc56..8b9e90dda6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2435,7 +2435,6 @@ F:	configs/engicam_px30_core_defconfig
 
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
-F:	configs/arcturus_ucp1020_defconfig
 F:	configs/arcturus_ucls1012a_defconfig
 
 N:	Michael Fischer <mf@go-sys.de>
diff --git a/board/arcturus/ppc-ucp1020/readme.txt b/board/arcturus/ppc-ucp1020/readme.txt
deleted file mode 100644
index 07986f50e0..0000000000
--- a/board/arcturus/ppc-ucp1020/readme.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Arcturus uCP1020 SoM
-====================
-
-This tutorial describes how to use the predefined Buildroot
-configuration for the Arcturus uCP1020 SoM platform.
-
-Additional information about this module can be found at
-<www.arcturusnetworks.com/products/ucp1020>
-
-Building
---------
-
-  make arcturus_ucp1020_defconfig
-  make
-
-Result of the build
--------------------
-
-After building, you should obtain this tree:
-
-    output/images/
-    +-- rootfs.jffs2
-    +-- rootfs.tar
-    +-- u-boot.bin
-    +-- ucp1020.dtb
-    +-- uImage
-
-Flashing
---------
-
-You'll need to program the files created by buildroot into the NOR flash.
-
-1. Program the new U-Boot binary (optional)
-    If you don't feel confident upgrading your bootloader then don't do it,
-    it's unnecessary most of the time.
-
-    B$ tftp u-boot.bin
-    B$ protect off 0xeff80000 +$filesize
-    B$ erase 0xeff80000 +$filesize
-    B$ cp.b $loadaddr 0xeff80000 $filesize
-    B$ protect on 0xeff80000 +$filesize
-
-2. Program the kernel
-
-    B$ tftp uImage
-    B$ erase 0xec140000 +$filesize
-    B$ cp.b $loadaddr 0xec140000 $filesize
-
-3. Program the DTB
-
-    B$ tftp ucp1020.dtb
-    B$ erase 0xec100000 +$filesize
-    B$ cp.b $loadaddr 0xec100000 $filesize
-
-4. Program the jffs2 root filesystem
-
-    B$ tftp rootfs.jffs2
-    B$ erase 0xec800000 0xee8fffff
-    B$ cp.b $loadaddr 0xec800000 $filesize
-
-5. Booting your new system
-
-    B$ setenv norboot 'setenv bootargs root=/dev/mtdblock1 rootfstype=jffs2 console=$consoledev,$baudrate;bootm 0xec140000 - 0xec100000'
-
-    If you want to set this boot option as default:
-
-    B$ setenv bootcmd 'run norboot'
-    B$ saveenv
-
-    ...or for a single boot:
-
-    B$ run norboot
-
-Good Luck !
diff --git a/configs/arcturus_ucp1020_defconfig b/configs/arcturus_ucp1020_defconfig
deleted file mode 100644
index 8e489f7f19..0000000000
--- a/configs/arcturus_ucp1020_defconfig
+++ /dev/null
@@ -1,19 +0,0 @@
-BR2_powerpc=y
-BR2_powerpc_8548=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
-BR2_TARGET_GENERIC_HOSTNAME="UCP1020"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Arcturus uCP1020 System on Module"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_SYSTEM_DHCP="eth0"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCP1020-kernel,v20190618)/linux-v20190618.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="ucp1020"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="ucp1020"
-BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCP1020-uboot,v20190618)/uboot-v20190618.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCP1020"
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
