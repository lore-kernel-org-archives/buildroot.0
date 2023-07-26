Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3429C001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E9CC4154E;
	Wed, 26 Jul 2023 21:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E9CC4154E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7oRHtcfBOnh; Wed, 26 Jul 2023 21:08:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9732040BDE;
	Wed, 26 Jul 2023 21:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9732040BDE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FCFC1BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 485BC40609
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 485BC40609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hWKNDFiovdx for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:08:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5077540144
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5077540144
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A935835A9; Wed, 26 Jul 2023 21:08:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 22:20:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd194540a1b8e9f70a01c6bf9c574863168e6778
X-Git-Newrev: 8771ca8a661761add3b7019cd846f8b22e9ef5bb
X-Patchwork-Hint: ignore
Message-Id: <20230726210800.3A935835A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/u-boot: fix u-boot.stm32 creation on
 newer version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8771ca8a661761add3b7019cd846f8b22e9ef5bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in commit [1] of the U-Boot project, the config.mk file has
been suppressed in order to use binman to manage FIT
generation. Therefore, the "u-boot.stm32" make target should no longer
be used with recent versions of U-Boot.

The configuration option added by this comit allows the creation of
the u-boot.stm32 image for both recent versions of U-Boot, which use
binman, and older versions.

Legacy handling would have suggested that this new option should
"default y" to preserve existing behavior, but as moving forward all
U-Boot new versions will no longer need this u-boot.stm32 target, it
probably makes sense here to not comply with this backward
compatibility rule, as an exception.

[1] 5564b4cd4d5c69 ("stm32mp: add binman support for STM32MP15x")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Tested-by: David Reaver <me@davidreaver.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in                            | 10 ++++++++++
 boot/uboot/uboot.mk                             |  2 ++
 configs/avenger96_defconfig                     |  1 +
 configs/olimex_stmp157_olinuxino_lime_defconfig |  1 +
 configs/stm32mp157a_dk1_defconfig               |  1 +
 configs/stm32mp157c_dk2_defconfig               |  1 +
 configs/stm32mp157c_odyssey_defconfig           |  1 +
 7 files changed, 17 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 085397d03d..ab0aaf2939 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -395,6 +395,16 @@ config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
 
+if BR2_TARGET_UBOOT_FORMAT_STM32
+config BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY
+	bool "Legacy build (u-boot.stm32 target)"
+	help
+	  Select this option if you use U-Boot with version older than
+	  2022.01), so that we use the old build target. Otherwise,
+	  binman application is called to create the stm32 binary
+	  format.
+endif
+
 config BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	bool "Custom (specify below)"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1a6e70a792..592e1db0b8 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -133,8 +133,10 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_STM32),y)
 UBOOT_BINS += u-boot.stm32
+ifeq ($(BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY),y)
 UBOOT_MAKE_TARGET += u-boot.stm32
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
 UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index d2c1b9013e..1f8e7a50d1 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -30,5 +30,6 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp15xx-dhcor-avenger96"
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index dc726359a0..8bd8e10ca9 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -41,6 +41,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
 
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index a487ce9891..3b8fdea993 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -40,6 +40,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"
 
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index f1f7baaa08..8b83bfe443 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -40,6 +40,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
 
diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
index 6b699830b1..15b9a63b39 100644
--- a/configs/stm32mp157c_odyssey_defconfig
+++ b/configs/stm32mp157c_odyssey_defconfig
@@ -29,6 +29,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-odyssey"
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
