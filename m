Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D41C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:46:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D621861994
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D621861994
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA3784461;
	Sun,  3 Oct 2021 12:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qH5aMhV30Dxe; Sun,  3 Oct 2021 12:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDAA2848D1;
	Sun,  3 Oct 2021 12:46:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2B641BF963
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0104402A2
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dM8BjlE1GuCz for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 12:45:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB98E400F1
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 12:45:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B2FEB8DBB9; Sun,  3 Oct 2021 12:43:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 14:38:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6d7cbb8e047f86bdf626fec90f10e8590b7adf7
X-Git-Newrev: e827bfd0dddab16e95cd5d1edfc780d96477be37
X-Patchwork-Hint: ignore
Message-Id: <20211003124320.B2FEB8DBB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: allow building for i386
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

commit: https://git.buildroot.net/buildroot/commit/?id=e827bfd0dddab16e95cd5d1edfc780d96477be37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support the build the firmware for QEMU i386 pc machine

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[yann.morin.1998@free.fr:
  - do not make it available for BR2_x86_64
  - introduce BR2_TARGET_EDK2_ARCH_SUPPORTS
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/edk2/Config.in | 18 +++++++++++++++++-
 boot/edk2/edk2.mk   | 12 ++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 150806899f..8e548cfc67 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -1,6 +1,12 @@
+config BR2_TARGET_EDK2_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_x86_64
+
 config BR2_TARGET_EDK2
 	bool "EDK2"
-	depends on BR2_x86_64 || BR2_aarch64
+	depends on BR2_TARGET_EDK2_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_EDK2_PLATFORMS
 	help
@@ -13,9 +19,18 @@ if BR2_TARGET_EDK2
 
 choice
 	prompt "Platform"
+	default BR2_TARGET_EDK2_PLATFORM_OVMF_I386 if BR2_i386
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_X64 if BR2_x86_64
 	default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU if BR2_aarch64
 
+config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
+	bool "i386"
+	depends on BR2_i386
+	help
+	  Platform configuration for a generic i386 target.
+	  This platform will boot from flash address 0x0.
+	  It should therefore be used as the first bootloader.
+
 config BR2_TARGET_EDK2_PLATFORM_OVMF_X64
 	bool "x86-64"
 	depends on BR2_x86_64
@@ -94,6 +109,7 @@ endchoice
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
