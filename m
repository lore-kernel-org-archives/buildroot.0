Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6BAC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 13:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA906400CE;
	Sat, 23 Dec 2023 13:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA906400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QiRVbrwrST0j; Sat, 23 Dec 2023 13:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92A5140399;
	Sat, 23 Dec 2023 13:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92A5140399
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26B511BF41A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 13:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 003E8824CE
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 13:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 003E8824CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vn3jt9Jc9ido for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 13:36:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E64FE82446
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 13:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E64FE82446
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CECBF87CF3; Sat, 23 Dec 2023 13:36:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 14:36:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0c8c162597733282f692bb1712ef3e5ff9b30fe
X-Git-Newrev: 1b2498fa91b752f4cc3578600bc653ece734c001
X-Patchwork-Hint: ignore
Message-Id: <20231223133658.CECBF87CF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: add support for RISC-V 64bit
 architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b2498fa91b752f4cc3578600bc653ece734c001
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RISC-V 64bit qemu virt machine support has been added in edk2
version "stable202302". See [1].

Since edk2-stable202308, introduced in buildroot in commit 5c9f310
"boot/edk2: bump to version edk2-stable202308", it is now possible
to boot the edk2 UEFI shell in qemu.

This commit adds this early RISC-V support to edk2.

The RISC-V edk2 UEFI shell can be booted in Buildroot with the
following commands:

    # Build EDK2 images
    cat > .config <<EOF
    BR2_riscv=y
    BR2_RISCV_64=y
    BR2_PACKAGE_HOST_QEMU=y
    BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
    BR2_TARGET_EDK2=y
    EOF
    make olddefconfig
    make

    # edk2 image size should fit the 32MB of qemu pflash memories
    truncate -s 32M output/images/RISCV_VIRT_CODE.fd
    truncate -s 32M output/images/RISCV_VIRT_VARS.fd

    # Start qemu:
    output/host/usr/bin/qemu-system-riscv64 \
        -M virt,pflash0=pflash0,pflash1=pflash1,acpi=off \
        -nographic \
        -blockdev node-name=pflash0,driver=file,read-only=on,filename=output/images/RISCV_VIRT_CODE.fd \
        -blockdev node-name=pflash1,driver=file,filename=output/images/RISCV_VIRT_VARS.fd

Note: a Qemu version >= 8.0.0 is needed to properly start edk2. A qemu
version on the host system might not be sufficient. This is why the
Buildroot host-qemu is built in this config example.

[1] https://github.com/tianocore/edk2/releases/tag/edk2-stable202302

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/edk2/Config.in | 10 ++++++++++
 boot/edk2/edk2.mk   |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index bed503b168..4e6e7d122c 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -2,6 +2,7 @@ config BR2_TARGET_EDK2_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
 	default y if BR2_i386
+	default y if BR2_RISCV_64
 	default y if BR2_x86_64
 
 config BR2_TARGET_EDK2
@@ -20,6 +21,7 @@ if BR2_TARGET_EDK2
 choice
 	prompt "Platform"
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_I386 if BR2_i386
+	default BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV if BR2_RISCV_64
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_X64 if BR2_x86_64
 	default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU if BR2_aarch64
 
@@ -31,6 +33,14 @@ config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
 	  This platform will boot from flash address 0x0.
 	  It should therefore be used as the first bootloader.
 
+config BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV
+	bool "RISC-V"
+	depends on BR2_RISCV_64
+	help
+	  Platform configuration for RISC-V QEMU targeting the Virt
+	  machine. This platform will only boot from flash address
+	  0x0. It should therefore be used as the first bootloader.
+
 config BR2_TARGET_EDK2_PLATFORM_OVMF_X64
 	bool "x86-64"
 	depends on BR2_x86_64
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 186854a14c..efdb4d02ce 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -136,6 +136,12 @@ define EDK2_PRE_BUILD_QEMU_SBSA
 	ln -srf $(BINARIES_DIR)/{bl1.bin,fip.bin} $(EDK2_BUILD_PACKAGES)/Platform/Qemu/Sbsa/
 endef
 
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV),y)
+EDK2_ARCH = RISCV64
+EDK2_PACKAGE_NAME = OvmfPkg/RiscVVirt
+EDK2_PLATFORM_NAME = RiscVVirtQemu
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+
 endif
 
 EDK2_BASETOOLS_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
