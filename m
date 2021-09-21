Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11A8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:29:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F8B61131
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86F8B61131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 607314035D;
	Tue, 21 Sep 2021 13:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CY4Yx8ryTfxF; Tue, 21 Sep 2021 13:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9772840397;
	Tue, 21 Sep 2021 13:29:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF231BF2F5
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F2B083372
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OKGguF4niG_0 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:28:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46C438332A
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:28:34 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 68AEC24000D;
 Tue, 21 Sep 2021 13:28:32 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 15:28:28 +0200
Message-Id: <20210921132829.56405-6-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921132829.56405-1-kory.maincent@bootlin.com>
References: <20210921132829.56405-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/6] boot/edk2: add support to i386
 architecture
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Add support the build the firmware for QEMU i386 pc machine

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/edk2/Config.in | 12 +++++++++++-
 boot/edk2/edk2.mk   | 12 ++++++++++--
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 150806899f..9f8988bcca 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_EDK2
 	bool "EDK2"
-	depends on BR2_x86_64 || BR2_aarch64
+	depends on BR2_x86_64 || BR2_aarch64 || BR2_i386
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_EDK2_PLATFORMS
 	help
@@ -13,9 +13,18 @@ if BR2_TARGET_EDK2
 
 choice
 	prompt "Platform"
+	default BR2_TARGET_EDK2_PLATFORM_OVMF_I386 if BR2_i386
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_X64 if BR2_x86_64
 	default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU if BR2_aarch64
 
+config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
+	bool "i386"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  Platform configuration for a generic i386 target.
+	  This platform will boot from flash address 0x0.
+	  It should therefore be used as the first bootloader.
+
 config BR2_TARGET_EDK2_PLATFORM_OVMF_X64
 	bool "x86-64"
 	depends on BR2_x86_64
@@ -94,6 +103,7 @@ endchoice
 
 config BR2_TARGET_EDK2_FD_NAME
 	string
+	default "OVMF" if BR2_TARGET_EDK2_PLATFORM_OVMF_I386
 	default "OVMF" if BR2_TARGET_EDK2_PLATFORM_OVMF_X64
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index fabd0c5b45..ab3cdad464 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -14,7 +14,9 @@ EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
 EDK2_INSTALL_TARGET = NO
 EDK2_INSTALL_IMAGES = YES
 
-ifeq ($(BR2_x86_64),y)
+ifeq ($(BR2_i386),y)
+EDK2_ARCH = IA32
+else ifeq ($(BR2_x86_64),y)
 EDK2_ARCH = X64
 else ifeq ($(BR2_aarch64),y)
 EDK2_ARCH = AARCH64
@@ -55,7 +57,13 @@ EDK2_GIT_SUBMODULES = YES
 EDK2_BUILD_PACKAGES = $(@D)/Build/Buildroot
 EDK2_PACKAGES_PATH = $(@D):$(EDK2_BUILD_PACKAGES):$(STAGING_DIR)/usr/share/edk2-platforms
 
-ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_X64),y)
+ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_I386),y)
+EDK2_DEPENDENCIES += host-nasm
+EDK2_PACKAGE_NAME = OvmfPkg
+EDK2_PLATFORM_NAME = OvmfPkgIa32
+EDK2_BUILD_DIR = OvmfIa32
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_X64),y)
 EDK2_DEPENDENCIES += host-nasm
 EDK2_PACKAGE_NAME = OvmfPkg
 EDK2_PLATFORM_NAME = OvmfPkgX64
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
