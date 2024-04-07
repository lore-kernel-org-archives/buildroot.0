Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D73CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 20:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7C9641518;
	Sun,  7 Apr 2024 20:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msFOWphWgeAt; Sun,  7 Apr 2024 20:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00DF741528
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00DF741528;
	Sun,  7 Apr 2024 20:30:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A06B1BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DD486065D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5nhjXx5VbuK for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 20:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6478C6079B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6478C6079B
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 20:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CFD4835E5; Sun,  7 Apr 2024 20:30:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 21:52:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae1d482a3d1ebbae3f58fb6cf847d78a554d48a2
X-Git-Newrev: 182756a0328d677a215551bfb2b5b22849c2d85e
X-Patchwork-Hint: ignore
Message-Id: <20240407203020.5CFD4835E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: rename TI_K3_DM option to
 cover further TI K3 SoCs support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=182756a0328d677a215551bfb2b5b22849c2d85e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TARGET_UBOOT_NEEDS_TI_K3_DM option has been introduced initially to
support certain TI K3 devices such as AM62x and AM62Ax that require a
Device Manager (DM) firmware.

This option needs to be renamed to use a more generic name in order
to cover further TI K3 SoCs support along with the new u-boot binman
tool that will be added in followup patch. With binman enabled in
u-boot on TI K3 SoC, ti-k3-boot-firmware is needed at buildtime to
provide ti-sysfw (System Firmware) for all TI K3 SoC along with Device
Manager (DM) firmware for AM62x and AM62Ax devices.

With binman support enabled, we don't need to provide the path of the
Device Manager firmware anymore (see [2]).
We can remove DM="<DM firmware>.xer5f" from UBOOT_MAKE_OPTS.
It also means that we can also remove BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
used to define DM path.

  DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f

For now, keep BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME and DM only when
ti-k3-image-gen is used. We need to update ti_am62x_sk_defconfig
to use binman before removing them along with ti-k3-image-gen.

[1] 52ce606c05ee3ac869f8087292bc3dbb0d25b79b
[2] https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08/exports/docs/linux/Foundational_Components/U-Boot/UG-General-Info.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Config.in.legacy              |  8 ++++++++
 boot/uboot/Config.in          | 23 ++++++++++++++---------
 boot/uboot/uboot.mk           |  4 +++-
 configs/ti_am62x_sk_defconfig |  2 +-
 4 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d00196e08b..4084ffa516 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
+	bool "u-boot TI K3 DM option has been renamed."
+	select BR2_LEGACY
+	select BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
+	help
+	  The TI K3 Device Manager is already included in
+	  ti-k3-boot-firmware.
+
 config BR2_PACKAGE_FLUTTER_GALLERY
 	bool "flutter-gallery removed"
 	select BR2_LEGACY
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 39b3f2c81b..e310c09217 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -240,18 +240,23 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
 	  U-Boot, and that the TEE variable pointing to OPTEE's
 	  tee.elf, is passed during the Buildroot build.
 
-config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
-	bool "U-Boot needs TI K3 Device Manager (DM)"
-	# We use the SoC selection defined for the ti-k3-image-gen
-	# package
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX || BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+config BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
+	bool "U-Boot needs ti-k3-boot-firmware"
+	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE
 	help
-	  Some TI K3 devices need the Device Manager (DM) firmware to
-	  be available for the U-Boot build.
+	  TI K3 devices needs at least ti-sysfw (System Firmware) when
+	  built with u-boot's binman tool.
 
-if BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
+	  Some TI K3 devices using a split firmware boot flow (AM62,
+	  j721e) also need the Device Manager (DM) firmware to be
+	  available for the U-Boot build.
 
+if BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
+
+# TI_K3_DM_SOCNAME is only needed when ti-k3-image-gen is used for
+# TI K3 devices using the Device Manager (DM) firmware.
+# We use the SoC selection defined for the ti-k3-image-gen
+# package.
 config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
 	string
 	default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 491f654cec..47fb419e92 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -194,11 +194,13 @@ UBOOT_DEPENDENCIES += optee-os
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE),y)
 UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
+ifneq ($(UBOOT_TI_K3_DM_SOCNAME),)
 UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
 UBOOT_DEPENDENCIES += opensbi
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 37df7a93f7..b2814526bb 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -37,7 +37,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_TI_K3_DM=y
+BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
