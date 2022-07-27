Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0262EC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EBCA81AAD;
	Wed, 27 Jul 2022 09:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EBCA81AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggyMAoUPYH5w; Wed, 27 Jul 2022 09:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A6C81A81;
	Wed, 27 Jul 2022 09:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8A6C81A81
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0086C1BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCF5A81A81
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCF5A81A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zEmgje6JTZNZ for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:41:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75BDB81A5F
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75BDB81A5F
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AA9C08650D; Wed, 27 Jul 2022 09:27:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:38:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f81decf46c8ec04b87de5ee9e1c9718d66dee01
X-Git-Newrev: 874916567a6ad917ffc507270beecc45582f9519
X-Patchwork-Hint: ignore
Message-Id: <20220727092750.AA9C08650D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch: rework MMU option handling and move
 to "Target architecture" menu
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

commit: https://git.buildroot.net/buildroot/commit/?id=874916567a6ad917ffc507270beecc45582f9519
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The MMU option is currently located in the "Toolchain" menu, but it
doesn't make sense as it's really architecture related. In addition,
the selection of MMU has an impact on the choice of binary format
available, which is visible in the architecture menu.

Therefore, this commit moves the MMU option into the architecture
menu.

However, if we simply move it in arch/Config.in, it means that we
would have the following order of options:

 Target architecture
 Target architecture variant
 ABI
 MMU
 Binary format

But really, the MMU option should be right below the Target
architecture variant, and the available ABIs derived from that.

The variant and ABI are arch-specfic, and defined in the per-arch
Config.in fragments; a Kconfig option can have only one prompt defined,
even under conditions, and appears at the place in the menu where its
prompt was defined. So, there is no (easy) possibility to have a
generic option appear where we want it.

Since in fact only 2 architectures show a visible prompt for the MMU
option (RISC-V and Xtensa), we move this option in
arch/Config.in.riscv and arch/Config.in.xtensa.

Some walkthrough the commit:

 - BR2_ARCH_HAS_MMU_MANDATORY and BR2_ARCH_HAS_MMU_OPTIONAL are
   removed as they are no longer needed

 - BR2_USE_MMU becomes a hidden boolean

 - All the places where we used to select BR2_ARCH_HAS_MMU_MANDATORY
   now select BR2_USE_MMU directly.

 - Introduce BR2_RISCV_USE_MMU and BR2_XTENSA_USE_MMU.

 - All defconfigs that used "# BR2_USE_MMU is not set" are switched to
   using the new option.

All in all, this simplifies things quite a bit, and allows to have a
good option ordering in the Target architecture menu.

This commit might raise a concern in terms of backward compatibility
with existing configurations. The only configurations that will be
broken by this change are RISC-V noMMU (which was very recently
introduced) and Xtensa noMMU (which we can probably agree is not such
a widely popular configuration).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Tested-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
[yann.morin.1998@free.fr:
  - expand further why we need per-arch MMU options
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in                            | 47 +++++++++++++++----------------
 arch/Config.in.arm                        | 10 +++----
 arch/Config.in.m68k                       |  2 +-
 arch/Config.in.riscv                      | 12 ++++++--
 arch/Config.in.xtensa                     | 12 ++++++--
 configs/canaan_kd233_defconfig            |  2 +-
 configs/qemu_riscv64_nommu_virt_defconfig |  4 +--
 configs/qemu_xtensa_lx60_nommu_defconfig  |  4 +--
 configs/sipeed_maix_bit_defconfig         |  2 +-
 configs/sipeed_maix_bit_sdcard_defconfig  |  2 +-
 configs/sipeed_maix_dock_defconfig        |  2 +-
 configs/sipeed_maix_dock_sdcard_defconfig |  2 +-
 configs/sipeed_maix_go_defconfig          |  2 +-
 configs/sipeed_maix_go_sdcard_defconfig   |  2 +-
 configs/sipeed_maixduino_defconfig        |  2 +-
 configs/sipeed_maixduino_sdcard_defconfig |  2 +-
 toolchain/Config.in                       |  7 -----
 17 files changed, 59 insertions(+), 57 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 095036f1aa..1d38c7a065 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -9,10 +9,7 @@ config BR2_KERNEL_64_USERLAND_32
 config BR2_SOFT_FLOAT
 	bool
 
-config BR2_ARCH_HAS_MMU_MANDATORY
-	bool
-
-config BR2_ARCH_HAS_MMU_OPTIONAL
+config BR2_USE_MMU
 	bool
 
 choice
@@ -23,7 +20,7 @@ choice
 
 config BR2_arcle
 	bool "ARC (little endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of
 	  32-bit CPUs that can be used from deeply embedded to high
@@ -31,7 +28,7 @@ config BR2_arcle
 
 config BR2_arceb
 	bool "ARC (big endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of
 	  32-bit CPUs that can be used from deeply embedded to high
@@ -49,7 +46,7 @@ config BR2_arm
 
 config BR2_armeb
 	bool "ARM (big endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by ARM Holdings.
@@ -76,7 +73,7 @@ config BR2_aarch64_be
 config BR2_csky
 	bool "csky"
 	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	help
 	  csky is processor IP from china.
@@ -85,7 +82,7 @@ config BR2_csky
 
 config BR2_i386
 	bool "i386"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  Intel i386 architecture compatible microprocessor
 	  http://en.wikipedia.org/wiki/I386
@@ -99,7 +96,7 @@ config BR2_m68k
 
 config BR2_microblazeel
 	bool "Microblaze AXI (little endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI
 	  bus based architecture (little endian)
@@ -108,7 +105,7 @@ config BR2_microblazeel
 
 config BR2_microblazebe
 	bool "Microblaze non-AXI (big endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB
 	  bus based architecture (non-AXI, big endian)
@@ -117,7 +114,7 @@ config BR2_microblazebe
 
 config BR2_mips
 	bool "MIPS (big endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big
 	  endian.
@@ -126,7 +123,7 @@ config BR2_mips
 
 config BR2_mipsel
 	bool "MIPS (little endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little
 	  endian.
@@ -136,7 +133,7 @@ config BR2_mipsel
 config BR2_mips64
 	bool "MIPS64 (big endian)"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big
 	  endian.
@@ -146,7 +143,7 @@ config BR2_mips64
 config BR2_mips64el
 	bool "MIPS64 (little endian)"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little
 	  endian.
@@ -155,7 +152,7 @@ config BR2_mips64el
 
 config BR2_nios2
 	bool "Nios II"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  Nios II is a soft core processor from Altera Corporation.
 	  http://www.altera.com/
@@ -163,14 +160,14 @@ config BR2_nios2
 
 config BR2_or1k
 	bool "OpenRISC"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  OpenRISC is a free and open processor for embedded system.
 	  http://openrisc.io
 
 config BR2_powerpc
 	bool "PowerPC"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
 	  alliance. Big endian.
@@ -180,7 +177,7 @@ config BR2_powerpc
 config BR2_powerpc64
 	bool "PowerPC64 (big endian)"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
 	  alliance. Big endian.
@@ -190,7 +187,7 @@ config BR2_powerpc64
 config BR2_powerpc64le
 	bool "PowerPC64 (little endian)"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
 	  alliance. Little endian.
@@ -210,7 +207,7 @@ config BR2_riscv
 config BR2_s390x
 	bool "s390x"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  s390x is a big-endian architecture made by IBM.
 	  http://www.ibm.com/
@@ -218,7 +215,7 @@ config BR2_s390x
 
 config BR2_sh
 	bool "SuperH"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer
 	  (RISC) instruction set architecture (ISA) developed by
@@ -228,7 +225,7 @@ config BR2_sh
 
 config BR2_sparc
 	bool "SPARC"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC
 	  instruction set architecture (ISA) developed by Sun
@@ -239,7 +236,7 @@ config BR2_sparc
 config BR2_sparc64
 	bool "SPARC64"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC
 	  instruction set architecture (ISA) developed by Sun
@@ -250,7 +247,7 @@ config BR2_sparc64
 config BR2_x86_64
 	bool "x86_64"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 	help
 	  x86-64 is an extension of the x86 instruction set (Intel i386
 	  architecture compatible microprocessor).
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index a0a2e2f5e9..c391d6c72b 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -73,26 +73,26 @@ config BR2_ARM_CPU_HAS_THUMB2
 
 config BR2_ARM_CPU_ARMV4
 	bool
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 
 config BR2_ARM_CPU_ARMV5
 	bool
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 
 config BR2_ARM_CPU_ARMV6
 	bool
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 
 config BR2_ARM_CPU_ARMV7A
 	bool
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 
 config BR2_ARM_CPU_ARMV7M
 	bool
 
 config BR2_ARM_CPU_ARMV8A
 	bool
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 
 choice
 	prompt "Target Architecture Variant"
diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 1f7d944621..9fd22aaf1e 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -26,7 +26,7 @@ choice
 config BR2_m68k_68040
 	bool "68040"
 	select BR2_m68k_m68k
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 
 config BR2_m68k_cf5208
 	bool "5208"
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 30bdcaa80b..b5e84389e0 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -71,15 +71,23 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 
 config BR2_RISCV_64
 	bool "64-bit"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 endchoice
 
+config BR2_RISCV_USE_MMU
+	bool "MMU support"
+	default y
+	depends on BR2_RISCV_64
+	select BR2_USE_MMU
+	help
+	  Enable this option if your RISC-V core has a MMU (Memory
+	  Management Unit).
+
 choice
 	prompt "Target ABI"
 	default BR2_RISCV_ABI_ILP32D if !BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVD
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 45ad2dc487..f9d5adb4c9 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -5,11 +5,10 @@ choice
 
 config BR2_XTENSA_CUSTOM
 	bool "Custom Xtensa processor configuration"
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 config BR2_xtensa_fsf
 	bool "fsf - Default configuration"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_USE_MMU
 
 endchoice
 
@@ -41,6 +40,15 @@ config BR2_XTENSA_BIG_ENDIAN
 
 endchoice
 
+config BR2_XTENSA_USE_MMU
+	bool "MMU support"
+	default y
+	depends on BR2_XTENSA_CUSTOM
+	select BR2_USE_MMU
+	help
+	  Enable this option if your Xtensa core has a MMU (Memory
+	  Management Unit).
+
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_XTENSA_LITTLE_ENDIAN
 	default "BIG"		if BR2_xtensa_fsf || BR2_XTENSA_BIG_ENDIAN
diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
index 85b7b14fbd..278fb883bf 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -7,13 +7,13 @@ BR2_RISCV_ISA_CUSTOM_RVA=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
+# BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
 # Patches
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # Binary format
-# BR2_USE_MMU is not set
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index 33fad50a3c..691cf31748 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -1,13 +1,11 @@
 # Architecture
 BR2_riscv=y
 BR2_RISCV_64=y
+# BR2_RISCV_USE_MMU is not set
 
 # Patches
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
-# Toolchain
-# BR2_USE_MMU is not set
-
 # Busybox with hush
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index f107b7e73b..4be1b66edc 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -2,9 +2,7 @@
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
-
-# Toolchain
-# BR2_USE_MMU is not set
+# BR2_XTENSA_USE_MMU is not set
 
 # Use minimal busybox with hush and networking tools
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index dbc5af4e74..b31bc1309b 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -7,13 +7,13 @@ BR2_RISCV_ISA_CUSTOM_RVA=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
+# BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
 # Patches
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # Binary format
-# BR2_USE_MMU is not set
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 9f1c3a305f..4ad3b2e1db 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -7,13 +7,13 @@ BR2_RISCV_ISA_CUSTOM_RVA=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
+# BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
 # Patches
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # System
-# BR2_USE_MMU is not set
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index 0f30e8d38f..d071e5d380 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -7,13 +7,13 @@ BR2_RISCV_ISA_CUSTOM_RVA=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
+# BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
 # Patches
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # Binary format
-# BR2_USE_MMU is not set
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index fdbca11590..de79ff950b 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -7,13 +7,13 @@ BR2_RISCV_ISA_CUSTOM_RVA=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
+# BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
 # Patches
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # System
-# BR2_USE_MMU is not set
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index 2054e49ae2..3055379db4 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -7,13 +7,13 @@ BR2_RISCV_ISA_CUSTOM_RVA=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
+# BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
 # Patches
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # Binary format
-# BR2_USE_MMU is not set
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index a16943608c..7338b0c09d 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -7,13 +7,13 @@ BR2_RISCV_ISA_CUSTOM_RVA=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
+# BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
 # Patches
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # System
-# BR2_USE_MMU is not set
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index a581ecbea5..50c59bd4ad 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -7,13 +7,13 @@ BR2_RISCV_ISA_CUSTOM_RVA=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
+# BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
 # Patches
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # Binary format
-# BR2_USE_MMU is not set
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index 7e627e5d15..b4f1994239 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -7,13 +7,13 @@ BR2_RISCV_ISA_CUSTOM_RVA=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
+# BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
 # Patches
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # System
-# BR2_USE_MMU is not set
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
diff --git a/toolchain/Config.in b/toolchain/Config.in
index e6fabbfc74..5f79c07df0 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -315,13 +315,6 @@ config BR2_TOOLCHAIN_EXTRA_LIBS
 config BR2_TOOLCHAIN_HAS_FULL_GETTEXT
 	bool
 
-config BR2_USE_MMU
-	bool "Enable MMU support" if BR2_ARCH_HAS_MMU_OPTIONAL
-	default y if BR2_ARCH_HAS_MMU_OPTIONAL || BR2_ARCH_HAS_MMU_MANDATORY
-	help
-	  If your target has a MMU, you should say Y here.  If you
-	  are unsure, just say Y.
-
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
 	default ""
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
