Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C6DC67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 20:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51F1360E9C;
	Tue,  9 Apr 2024 20:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJZc_BcIDzlB; Tue,  9 Apr 2024 20:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD96D60EB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD96D60EB7;
	Tue,  9 Apr 2024 20:51:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 166821BF3A4
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 700DC40662
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPgeB_ZxXby0 for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 642564063C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 642564063C
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BDEC85E39; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 9 Apr 2024 14:12:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b460c7258797e4b335bd60d03c823489c7c4a9cb
X-Git-Newrev: 364e153e6a25ff8c0de348b0c5244ef17b3a1b57
X-Patchwork-Hint: ignore
Message-Id: <20240409205030.5BDEC85E39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: remove
 BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=364e153e6a25ff8c0de348b0c5244ef17b3a1b57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previoulsy (without binman), when a TI K3 SoC using Combined binary
with a split firmware boot method was used (am62ax or am62x) [1], the
user had to select BR2_TARGET_UBOOT_NEEDS_TI_K3_DM in the defconfig
to provide Device Manager firmware provided by ti-k3-boot-firmware.

With binman, this option is no longer necessary since
ti-k3-boot-firmware package is already in the u-boot dependency and the
path to DM and SYSFW binaries are provided by BINMAN_INDIRS.

We are going to remove ti-k3-image-gen, so binman is now mandatory on
all TI K3 SoCs.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/52ce606c05ee3ac869f8087292bc3dbb0d25b79b

Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/uboot/Config.in | 13 -------------
 boot/uboot/uboot.mk  |  4 ----
 2 files changed, 17 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 39e49d681b..8d2228dc7d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -251,19 +251,6 @@ config BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
 	  j721e) also need the Device Manager (DM) firmware to be
 	  available for the U-Boot build.
 
-if BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
-
-# TI_K3_DM_SOCNAME is only needed when ti-k3-image-gen is used for
-# TI K3 devices using the Device Manager (DM) firmware.
-# We use the SoC selection defined for the ti-k3-image-gen
-# package.
-config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
-	string
-	default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "am62xx"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-
-endif
-
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
 	depends on BR2_TARGET_OPENSBI
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 398485195e..a894654698 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -195,11 +195,7 @@ UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE),y)
-UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
-ifneq ($(UBOOT_TI_K3_DM_SOCNAME),)
-UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
-endif
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
