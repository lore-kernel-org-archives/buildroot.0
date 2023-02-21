Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126CBC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABF854030D;
	Sun, 12 Mar 2023 21:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF854030D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqPOMEtRWpI8; Sun, 12 Mar 2023 21:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C33CA4174D;
	Sun, 12 Mar 2023 21:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C33CA4174D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE6061BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C279560D58
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C279560D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7aVTjb6JbSyN for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09A3460BC9
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09A3460BC9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 081CC87006; Sun, 12 Mar 2023 21:46:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 22:34:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fd1f8a892a89d1b6d27b8e9884d645f71192813
X-Git-Newrev: 48d9042e5d2e0bc8bd0efc3a2516b156c4b89190
X-Patchwork-Hint: ignore
Message-Id: <20230312214623.081CC87006@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: allow using
 Barebox as BL33
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

commit: https://git.buildroot.net/buildroot/commit/?id=48d9042e5d2e0bc8bd0efc3a2516b156c4b89190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 2022.04.0, Barebox now supports a generic image built
for platforms, to be used as BL33 to generate FIP images. This patch
makes it available as a choice of BL33 to be used with ATF and is
based on the similar work put into U-Boot as BL33.

Signed-off-by: Casey Reeves <casey@xogium.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in               | 21 +++++++++++++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  6 ++++++
 2 files changed, 27 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index a9b9bbcc5a..cb54c6c9d8 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -129,6 +129,27 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
 endchoice
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
+	bool "Use Barebox as BL33"
+	depends on BR2_TARGET_BAREBOX
+	help
+	  This option allows to embed the Barebox generic BL33 image in
+	  the ARM Trusted Firmware. It ensures that the Barebox package
+	  gets built before ATF, and that the appropriate BL33
+	  variable pointing to the generic bl33 image is passed
+	  when building ATF.
+
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE
+	string "Barebox BL33 image name"
+	default "*-generic-bl33.img"
+	help
+	  Name of the Barebox BL33 image to include in ATF, it must
+	  have been installed to BINARIES_DIR by the Barebox package.
+
+endif
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	bool "Use U-Boot as BL33"
 	depends on BR2_TARGET_UBOOT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 1164c81410..648f62ed85 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -105,6 +105,12 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += AARCH32_SP=optee
 endif
 endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33),y)
+ARM_TRUSTED_FIRMWARE_BAREBOX_BIN = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE))
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_BAREBOX_BIN)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += barebox
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33),y)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += edk2
 # Since the flash device name vary between platforms, we use the variable
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
