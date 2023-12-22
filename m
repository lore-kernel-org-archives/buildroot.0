Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B0DC41535
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 10:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE640403A2;
	Fri, 22 Dec 2023 10:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE640403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dANYeiJcToSS; Fri, 22 Dec 2023 10:57:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8C63438F9;
	Fri, 22 Dec 2023 10:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8C63438F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF8241BF321
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 10:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF6F7438F9
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 10:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF6F7438F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fxtyfxf4FsjM for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 10:57:31 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 191D9403A2
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 10:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 191D9403A2
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0189B13F8B9;
 Fri, 22 Dec 2023 11:57:23 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 22 Dec 2023 11:56:55 +0100
Message-ID: <20231222105655.444328-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20230902193000.1457685-1-ju.o@free.fr>
References: <20230902193000.1457685-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703242647;
 bh=GLIXdDbCMAr1O4ZD2Q3DN15+AmvRCM9o5Ul0A1PwFFs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MdJfDPUpd6JC15qvM/6sRMIXZHrFZ20kx5RkmYDThsBdDmImHj6LRe+osbHoOsF//
 oU+yfKchAlUx9cjSzm6OuTcsdXVhFl+rvozzx9nN8MYa/LRNOo09EzwdOPtP0azoKU
 XW6w2OIFEtnHC+NMzA4F9lHGPfkNkGtWWcOq51PIF4y9vp63/E5NrBh4jYt6B8B43F
 v0C2IGnLvX5KbvW/4ot4/Qsa7njRVaDTjX9RCbRbED0xKyFJEesQu57TepIKCGK8Iw
 PKgTipHFbl31TMK2djt/7UJ94mW2YTMisXcDoHsNpyQqAjHLiuCoUA9FHSNsoBboUj
 WFPb/CXSUT/Vw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MdJfDPUp
Subject: [Buildroot] [PATCH v2 1/1] boot/edk2: add support for RISC-V 64bit
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Change v1 -> v2:
- Fix 2 typos in the commit log, as reported by Thomas in [2]

Even if Thomas said a v2 was not necessary, I'm resending anyway.
Since this patch was sent few months back, I successfully
rechecked this patch on top of master branch at commit e59346f with
the commands from the commit log.

Also, the recent release of Grub 2.12 in [3] includes many fixes to
allow a full RV64 EFI Linux Kernel boot. This patch will be
necessary to do so. This new grub release is the reason of this v2.

[2] https://lists.buildroot.org/pipermail/buildroot/2023-September/674103.html
[3] https://git.savannah.gnu.org/cgit/grub.git/tree/NEWS?h=grub-2.12
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
