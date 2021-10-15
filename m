Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99F7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:48:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547DF60FF2
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 547DF60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 282A740605;
	Fri, 15 Oct 2021 20:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDaqfhDRtLJ8; Fri, 15 Oct 2021 20:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 161F2405F2;
	Fri, 15 Oct 2021 20:48:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 685061C1135
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF34E407FC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HiTa6eEvuzku for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:47:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34A2540806
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:47:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BA5F695C14; Fri, 15 Oct 2021 20:44:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 21:34:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e11b068d6a4d98cb6ae440c528ab5e124fb974cc
X-Git-Newrev: 883f9fc754b074d801244b8f56daed7fbef678ed
X-Patchwork-Hint: ignore
Message-Id: <20211015204457.BA5F695C14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: add support to build 32bit edk2
 when using x86_64 architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=883f9fc754b074d801244b8f56daed7fbef678ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add BR2_TARGET_EDK2_PLATFORM_OVMF_I386 for x86_64 architecture.
Update the management of EDK2_ARCH to follow the edk2 platform type in
place of BR2 architecture.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/edk2/Config.in |  2 +-
 boot/edk2/edk2.mk   | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 8e548cfc67..df723122ee 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -25,7 +25,7 @@ choice
 
 config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
 	bool "i386"
-	depends on BR2_i386
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  Platform configuration for a generic i386 target.
 	  This platform will boot from flash address 0x0.
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index ab3cdad464..2b12de53cb 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -14,14 +14,6 @@ EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
 EDK2_INSTALL_TARGET = NO
 EDK2_INSTALL_IMAGES = YES
 
-ifeq ($(BR2_i386),y)
-EDK2_ARCH = IA32
-else ifeq ($(BR2_x86_64),y)
-EDK2_ARCH = X64
-else ifeq ($(BR2_aarch64),y)
-EDK2_ARCH = AARCH64
-endif
-
 ifeq ($(BR2_ENABLE_DEBUG),y)
 EDK2_BUILD_TYPE = DEBUG
 else
@@ -58,33 +50,39 @@ EDK2_BUILD_PACKAGES = $(@D)/Build/Buildroot
 EDK2_PACKAGES_PATH = $(@D):$(EDK2_BUILD_PACKAGES):$(STAGING_DIR)/usr/share/edk2-platforms
 
 ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_I386),y)
+EDK2_ARCH = IA32
 EDK2_DEPENDENCIES += host-nasm
 EDK2_PACKAGE_NAME = OvmfPkg
 EDK2_PLATFORM_NAME = OvmfPkgIa32
 EDK2_BUILD_DIR = OvmfIa32
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_X64),y)
+EDK2_ARCH = X64
 EDK2_DEPENDENCIES += host-nasm
 EDK2_PACKAGE_NAME = OvmfPkg
 EDK2_PLATFORM_NAME = OvmfPkgX64
 EDK2_BUILD_DIR = OvmfX64
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU),y)
+EDK2_ARCH = AARCH64
 EDK2_PACKAGE_NAME = ArmVirtPkg
 EDK2_PLATFORM_NAME = ArmVirtQemu
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL),y)
+EDK2_ARCH = AARCH64
 EDK2_PACKAGE_NAME = ArmVirtPkg
 EDK2_PLATFORM_NAME = ArmVirtQemuKernel
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64),y)
+EDK2_ARCH = AARCH64
 EDK2_PACKAGE_NAME = Platform/ARM/VExpressPkg
 EDK2_PLATFORM_NAME = ArmVExpress-FVP-AArch64
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX),y)
+EDK2_ARCH = AARCH64
 EDK2_DEPENDENCIES += host-dtc arm-trusted-firmware
 EDK2_PACKAGE_NAME = Platform/Socionext/DeveloperBox
 EDK2_PLATFORM_NAME = DeveloperBox
@@ -103,6 +101,7 @@ define EDK2_PRE_BUILD_SOCIONEXT_DEVELOPERBOX
 endef
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN),y)
+EDK2_ARCH = AARCH64
 EDK2_DEPENDENCIES += host-dtc arm-trusted-firmware
 EDK2_PACKAGE_NAME = Platform/SolidRun/Armada80x0McBin
 EDK2_PLATFORM_NAME = Armada80x0McBin
@@ -111,6 +110,7 @@ EDK2_BUILD_ENV += DTC_PREFIX=$(HOST_DIR)/bin/
 EDK2_BUILD_OPTS += -D INCLUDE_TFTP_COMMAND
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA),y)
+EDK2_ARCH = AARCH64
 EDK2_DEPENDENCIES += arm-trusted-firmware
 EDK2_PACKAGE_NAME = Platform/Qemu/SbsaQemu
 EDK2_PLATFORM_NAME = SbsaQemu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
