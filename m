Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71264C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 07:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8C2840168;
	Tue, 19 Jul 2022 07:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8C2840168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id df1zZbBFqb0p; Tue, 19 Jul 2022 07:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2F0B40189;
	Tue, 19 Jul 2022 07:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F0B40189
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DF051BF355
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 07:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D3E24152A
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 07:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3E24152A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLxBZrA3gyIF for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 07:40:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF462410E9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF462410E9
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 07:40:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 7F2C41C000B;
 Tue, 19 Jul 2022 07:40:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 09:40:39 +0200
Message-Id: <20220719074042.2214649-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719074042.2214649-1-thomas.petazzoni@bootlin.com>
References: <20220719074042.2214649-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658216447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MdLLicHBaMKrXS/v7FCP1xUASdFNHu9pDz5GICobi8c=;
 b=o4WXDdjGpRApo6cXDoiLL+mvFu8cNJnXyAkSCVFSuokwEG5F35F+iaQGr17C2ykpYJSyS/
 60iV+EswZt2JHLW5osoDkM53fhFibZZkyPFzMDI0rCcCAlCdmAi8Sz5cMc+rXZF9d1p0zL
 +SCTxrVhrt1PE/TIz/Eoa0+HcKtrHpFcvmgQG9q4zTmsnkSPm/BKphJvE+PPtoFbLB9p/V
 61Xu81CCBusTkjmwzaQRMb33o5HR1OC1ChyucjaDwI9UN6kN0TApl+MHqfCZmK3xvgt3XC
 Td31I77bTnIXsHJq9UNJ91QrzYrb+V14caBbSJ+adchhYt+TKYRBKp9z4Xgbgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o4WXDdjG
Subject: [Buildroot] [PATCH 1/4] boot/ovmf-bin: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package allows to easily grab and install pre-compiled UEFI
firmware files suitable for testing in Qemu. They are going to be used
by the Grub test cases.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                  |  1 +
 boot/Config.in              |  1 +
 boot/ovmf-bin/Config.in     | 15 +++++++++++++
 boot/ovmf-bin/ovmf-bin.hash |  3 +++
 boot/ovmf-bin/ovmf-bin.mk   | 45 +++++++++++++++++++++++++++++++++++++
 5 files changed, 65 insertions(+)
 create mode 100644 boot/ovmf-bin/Config.in
 create mode 100644 boot/ovmf-bin/ovmf-bin.hash
 create mode 100644 boot/ovmf-bin/ovmf-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c3c24ff7a..34effa6005 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2796,6 +2796,7 @@ F:	boot/beaglev-secondboot/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
 F:	boot/gummiboot/
+F:	boot/ovmf-bin/
 F:	configs/beaglev_defconfig
 F:	configs/stm32mp157c_dk2_defconfig
 F:	package/android-tools/
diff --git a/boot/Config.in b/boot/Config.in
index 40472ae07d..470bb4361f 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -18,6 +18,7 @@ source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
+source "boot/ovmf-bin/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/sun20i-d1-spl/Config.in"
diff --git a/boot/ovmf-bin/Config.in b/boot/ovmf-bin/Config.in
new file mode 100644
index 0000000000..921e7e82fc
--- /dev/null
+++ b/boot/ovmf-bin/Config.in
@@ -0,0 +1,15 @@
+config BR2_TARGET_OVMF_BIN_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_x86_64
+
+config BR2_TARGET_OVMF_BIN
+	bool "ovmf-bin"
+	depends on BR2_TARGET_OVMF_BIN_ARCH_SUPPORTS
+	help
+	  This package downloads and installs pre-compiled versions of
+	  EDK2, called OVMF, that target Qemu.
+
+	  https://retrage.github.io/edk2-nightly/
diff --git a/boot/ovmf-bin/ovmf-bin.hash b/boot/ovmf-bin/ovmf-bin.hash
new file mode 100644
index 0000000000..6b8ddb58f7
--- /dev/null
+++ b/boot/ovmf-bin/ovmf-bin.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  00bed311df18cdfcf344d1334501efc88767e2f1896bd28692896ab5996e0801  ovmf-bin-cb6914fad57eb57164d1cd3f23b7c09797793d5d.tar.gz
+sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/ovmf-bin/ovmf-bin.mk b/boot/ovmf-bin/ovmf-bin.mk
new file mode 100644
index 0000000000..591190d63b
--- /dev/null
+++ b/boot/ovmf-bin/ovmf-bin.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# ovmf-bin
+#
+################################################################################
+
+OVMF_BIN_VERSION = cb6914fad57eb57164d1cd3f23b7c09797793d5d
+OVMF_BIN_SITE = $(call github,retrage,edk2-nightly,$(OVMF_BIN_VERSION))
+OVMF_BIN_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/tianocore/edk2/edk2-stable202205/License.txt
+# The license at
+# https://github.com/retrage/edk2-nightly/blob/master/LICENSE is
+# BSD-3-Clause, but this license is only the one for the build
+# infrastructure used to produce the nightly EDK2 builds. The actual
+# license of the EDK2 binaries is
+# https://github.com/tianocore/edk2/blob/master/License.txt, which is
+# BSD-2-Clause-Patent.
+OVMF_BIN_LICENSE = BSD-2-Clause-Patent
+OVMF_BIN_LICENSE_FILES = License.txt
+
+OVMF_BIN_INSTALL_IMAGES = YES
+OVMF_BIN_INSTALL_TARGET = NO
+
+define OVMF_BIN_INSTALL_LICENSE_FILE
+	cp $(OVMF_BIN_DL_DIR)/License.txt $(@D)
+endef
+
+OVMF_BIN_POST_EXTRACT_HOOKS += OVMF_BIN_INSTALL_LICENSE_FILE
+
+ifeq ($(BR2_arm),y)
+OVMF_BIN_FILES = RELEASEARM_QEMU_EFI.fd RELEASEARM_QEMU_VARS.fd
+else ifeq ($(BR2_aarch64),y)
+OVMF_BIN_FILES = RELEASEAARCH64_QEMU_EFI.fd RELEASEAARCH64_QEMU_VARS.fd
+else ifeq ($(BR2_i386),y)
+OVMF_BIN_FILES = RELEASEIa32_OVMF.fd RELEASEIa32_OVMF_CODE.fd RELEASEIa32_OVMF_VARS.fd
+else ifeq ($(BR2_x86_64),y)
+OVMF_BIN_FILES = RELEASEX64_OVMF.fd RELEASEX64_OVMF_CODE.fd RELEASEX64_OVMF_VARS.fd
+endif
+
+define OVMF_BIN_INSTALL_IMAGES_CMDS
+	$(foreach f,$(OVMF_BIN_FILES),\
+		$(INSTALL) -D -m 0644 $(@D)/bin/$(f) $(BINARIES_DIR)/$(f)
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
