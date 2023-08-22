Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96560EC8737
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FCE983934;
	Thu,  7 Sep 2023 15:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FCE983934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rym7Lw-kD-ke; Thu,  7 Sep 2023 15:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8453683AAF;
	Thu,  7 Sep 2023 15:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8453683AAF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16C0A1BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65B39612AE
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65B39612AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9jZglp4Oze0 for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 913FA612A3
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 913FA612A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E95A86A21; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 12:01:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6134872d2878f46f8f2800c81baf917281bc79b0
X-Git-Newrev: 52ce606c05ee3ac869f8087292bc3dbb0d25b79b
X-Patchwork-Hint: ignore
Message-Id: <20230907145131.8E95A86A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add support for building the
 TI K3 DM into U-Boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=52ce606c05ee3ac869f8087292bc3dbb0d25b79b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Certain TI K3 devices such as AM62x and AM62Ax require a Device Manager
(DM) firmnware to be made available to the U-Boot build, which will get
packaged into the "tispl.bin" image tree blob during A53 SPL build.
Without that DM firmware U-Boot will not be functional. To support this,
add a config option called BR2_TARGET_UBOOT_NEEDS_TI_K3_DM to enable
this feature, and another option BR2_TARGET_UBOOT_TI_K3_DM_SOC to allow
setting the name of the SOC which needs to match the corresponding
folder name in the ti-linux-firmware Git repository.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 19 +++++++++++++++++++
 boot/uboot/uboot.mk  |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8b726eaa57..21f19db890 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -240,6 +240,25 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
 	  U-Boot, and that the TEE variable pointing to OPTEE's
 	  tee.elf, is passed during the Buildroot build.
 
+config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
+	bool "U-Boot needs TI K3 Device Manager (DM)"
+	# We use the SoC selection defined for the ti-k3-image-gen
+	# package
+	depends on BR2_TARGET_TI_K3_IMAGE_GEN
+	depends on BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX || BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+	help
+	  Some TI K3 devices need the Device Manager (DM) firmware to
+	  be available for the U-Boot build.
+
+if BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
+
+config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
+	string
+	default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
+	default "am62xx"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+
+endif
+
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
 	depends on BR2_TARGET_OPENSBI
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9f81c0b842..dda606a880 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -186,6 +186,12 @@ UBOOT_DEPENDENCIES += optee-os
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
+UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
+UBOOT_DEPENDENCIES += ti-k3-boot-firmware
+UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
 UBOOT_DEPENDENCIES += opensbi
 UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
