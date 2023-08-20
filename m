Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8AFEE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80CFD415AE;
	Sun, 20 Aug 2023 21:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80CFD415AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kc8DO1LVHM_k; Sun, 20 Aug 2023 21:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76D95415F1;
	Sun, 20 Aug 2023 21:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76D95415F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B95091BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90E9A60EE5
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90E9A60EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5a2iCr8sfub for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0887B60EC6
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0887B60EC6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC19385EF1; Sun, 20 Aug 2023 21:40:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:38:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdd80863cf81a5b9034903ee1954d41a7ebbd1e7
X-Git-Newrev: ef4eea32261ed3f21af119936a080cb2fc8897fa
X-Patchwork-Hint: ignore
Message-Id: <20230820214027.EC19385EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sipeed_maix_{bit,
 dock}_sdcard_defconfig: fix build with binutils >= 2.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef4eea32261ed3f21af119936a080cb2fc8897fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream patch fixing the build with binutils >= 2.38
for riscv's for Zicsr and Zifencei.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060608
https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060605

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-riscv-Fix-build-against-binutils-2.38.patch | 58 ++++++++++++++++++++++
 configs/sipeed_maix_bit_sdcard_defconfig           |  1 +
 configs/sipeed_maix_dock_sdcard_defconfig          |  1 +
 3 files changed, 60 insertions(+)

diff --git a/board/canaan/k210-soc/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch b/board/canaan/k210-soc/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch
new file mode 100644
index 0000000000..52b496f054
--- /dev/null
+++ b/board/canaan/k210-soc/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch
@@ -0,0 +1,58 @@
+From 0cf11f3c0478f4286adcfb09bf9137f8b00212e3 Mon Sep 17 00:00:00 2001
+From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
+Date: Mon, 3 Oct 2022 18:07:54 +0200
+Subject: [PATCH] riscv: Fix build against binutils 2.38
+
+The following description is copied from the equivalent patch for the
+Linux Kernel proposed by Aurelien Jarno:
+
+>From version 2.38, binutils default to ISA spec version 20191213. This
+means that the csr read/write (csrr*/csrw*) instructions and fence.i
+instruction has separated from the `I` extension, become two standalone
+extensions: Zicsr and Zifencei. As the kernel uses those instruction,
+this causes the following build failure:
+
+arch/riscv/cpu/mtrap.S: Assembler messages:
+arch/riscv/cpu/mtrap.S:65: Error: unrecognized opcode `csrr a0,scause'
+arch/riscv/cpu/mtrap.S:66: Error: unrecognized opcode `csrr a1,sepc'
+arch/riscv/cpu/mtrap.S:67: Error: unrecognized opcode `csrr a2,stval'
+arch/riscv/cpu/mtrap.S:70: Error: unrecognized opcode `csrw sepc,a0'
+
+Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
+Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
+Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
+Tested-by: Heiko Stuebner <heiko@sntech.de>
+Tested-by: Christian Stewart <christian@paral.in>
+Reviewed-by: Rick Chen <rick@andestech.com>
+(cherry picked from commit 1dde977518f13824b847e23275001191139bc384)
+Upstream: https://gitlab.com/u-boot/u-boot/-/commit/1dde977518f13824b847e23275001191139bc384
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ arch/riscv/Makefile | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
+index 0b80eb8d864..53d1194ffb6 100644
+--- a/arch/riscv/Makefile
++++ b/arch/riscv/Makefile
+@@ -24,7 +24,16 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
+ 	CMODEL = medany
+ endif
+ 
+-ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_C) -mabi=$(ABI) \
++RISCV_MARCH = $(ARCH_BASE)$(ARCH_A)$(ARCH_C)
++
++# Newer binutils versions default to ISA spec version 20191213 which moves some
++# instructions from the I extension to the Zicsr and Zifencei extensions.
++toolchain-need-zicsr-zifencei := $(call cc-option-yn, -mabi=$(ABI) -march=$(RISCV_MARCH)_zicsr_zifencei)
++ifeq ($(toolchain-need-zicsr-zifencei),y)
++	RISCV_MARCH := $(RISCV_MARCH)_zicsr_zifencei
++endif
++
++ARCH_FLAGS = -march=$(RISCV_MARCH) -mabi=$(ABI) \
+ 	     -mcmodel=$(CMODEL)
+ 
+ PLATFORM_CPPFLAGS	+= $(ARCH_FLAGS)
+-- 
+2.41.0
+
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 34769eeca8..0cfff26337 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -17,6 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index 62f6a0e0b8..db075360cc 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -17,6 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
