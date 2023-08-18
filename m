Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBECEE4992
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 22:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E458A4187D;
	Fri, 18 Aug 2023 22:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E458A4187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IU7Q3y7LRBSo; Fri, 18 Aug 2023 22:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B037405C6;
	Fri, 18 Aug 2023 22:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B037405C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69DB41BF301
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 22:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50EBB4096A
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 22:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50EBB4096A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcLY52aQ7oyO for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 22:12:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5AB140963
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 22:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5AB140963
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 931EF85DCA; Fri, 18 Aug 2023 22:12:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 23:45:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eea0c9f0c989d59cd9c8700d5c95182d638c9816
X-Git-Newrev: cbd91e89e43d600172c62fd1cbd33aa74d0a851a
X-Patchwork-Hint: ignore
Message-Id: <20230818221229.931EF85DCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/Config.in.riscv: allow
 extensions for generic
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbd91e89e43d600172c62fd1cbd33aa74d0a851a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The generic extension set 'G' is realy a base with the minimal set of
extensions needed to be comfortable (but not required) to run a
linux-bassed system. Similarly, we consider the custom to be about the
custom set of features (not about a custom core implementing such a
set).

As such, we allow that a core with the G set can have futher extensions
without requiring it to be configured as a custom set.

We drop the intermediate symbols with the prompts, and move the prompts
to the previously hidden symbols, and add a prompt for the I set.

This alows one to clearly see what the generic set is about, without
having to delve into the help and hunt the list of selected symbol.

Note however that the G set implies Zicsr and Zifencei, but we have no
prompt for thos two, because in Buildroot, we assume that they are
mandatory and always present, like the I set (which they previously were
part of).

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
[yann.morin.1998@free.fr:
  - drop the intermediate symbols
  - move prompt to previously hidden symbols
  - add symbol for I
  - update defconfigs
  - reword the commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.riscv                      | 46 ++++++-------------------------
 configs/andes_ae350_45_defconfig          |  8 +++---
 configs/beaglev_defconfig                 | 10 +++----
 configs/canaan_kd233_defconfig            | 10 +++----
 configs/hifive_unleashed_defconfig        | 10 +++----
 configs/microchip_mpfs_icicle_defconfig   |  8 +++---
 configs/sipeed_maix_bit_defconfig         | 10 +++----
 configs/sipeed_maix_bit_sdcard_defconfig  | 10 +++----
 configs/sipeed_maix_dock_defconfig        | 10 +++----
 configs/sipeed_maix_dock_sdcard_defconfig | 10 +++----
 configs/sipeed_maix_go_defconfig          | 10 +++----
 configs/sipeed_maix_go_sdcard_defconfig   | 10 +++----
 configs/sipeed_maixduino_defconfig        | 10 +++----
 configs/sipeed_maixduino_sdcard_defconfig | 10 +++----
 14 files changed, 72 insertions(+), 100 deletions(-)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 3dfbb4165f..d62e4ebc6c 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -1,26 +1,5 @@
 # RISC-V CPU ISA extensions.
 
-config BR2_RISCV_ISA_RVI
-	bool
-
-config BR2_RISCV_ISA_RVM
-	bool
-
-config BR2_RISCV_ISA_RVA
-	bool
-
-config BR2_RISCV_ISA_RVF
-	bool
-
-config BR2_RISCV_ISA_RVD
-	bool
-
-config BR2_RISCV_ISA_RVC
-	bool
-
-config BR2_RISCV_ISA_RVV
-	bool
-
 choice
 	prompt "Target Architecture Variant"
 	default BR2_riscv_g
@@ -41,38 +20,31 @@ config BR2_riscv_custom
 
 endchoice
 
-if BR2_riscv_custom
-
 comment "Instruction Set Extensions"
 
-config BR2_RISCV_ISA_CUSTOM_RVM
+config BR2_RISCV_ISA_RVI
+	bool "Base Integer (I)"
+
+config BR2_RISCV_ISA_RVM
 	bool "Integer Multiplication and Division (M)"
-	select BR2_RISCV_ISA_RVM
 
-config BR2_RISCV_ISA_CUSTOM_RVA
+config BR2_RISCV_ISA_RVA
 	bool "Atomic Instructions (A)"
-	select BR2_RISCV_ISA_RVA
 
-config BR2_RISCV_ISA_CUSTOM_RVF
+config BR2_RISCV_ISA_RVF
 	bool "Single-precision Floating-point (F)"
-	select BR2_RISCV_ISA_RVF
 
-config BR2_RISCV_ISA_CUSTOM_RVD
+config BR2_RISCV_ISA_RVD
 	bool "Double-precision Floating-point (D)"
 	depends on BR2_RISCV_ISA_RVF
-	select BR2_RISCV_ISA_RVD
 
-config BR2_RISCV_ISA_CUSTOM_RVC
+config BR2_RISCV_ISA_RVC
 	bool "Compressed Instructions (C)"
-	select BR2_RISCV_ISA_RVC
 
-config BR2_RISCV_ISA_CUSTOM_RVV
+config BR2_RISCV_ISA_RVV
 	bool "Vector Instructions (V)"
-	select BR2_RISCV_ISA_RVV
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 
-endif
-
 choice
 	prompt "Target Architecture Size"
 	default BR2_RISCV_64
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index 998276635b..3b62c3615f 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -1,9 +1,9 @@
 BR2_riscv=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
 BR2_GLOBAL_PATCH_DIR="board/andes/ae350/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 42c732b973..c5ed687edc 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -1,10 +1,10 @@
 BR2_riscv=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVA=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglev/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
index 77b8abf531..3335195f25 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -2,11 +2,11 @@
 BR2_riscv=y
 BR2_RISCV_64=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVA=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 80c5e48f96..6b2e3a64b2 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -1,11 +1,11 @@
 # Architecture
 BR2_riscv=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVA=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 BR2_RISCV_64=y
 BR2_RISCV_ABI_LP64D=y
 
diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index b2568cae6a..3fec246938 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -1,9 +1,9 @@
 BR2_riscv=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index d73ba0266a..03ae57e1b7 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -2,11 +2,11 @@
 BR2_riscv=y
 BR2_RISCV_64=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVA=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 34769eeca8..44d5e2b688 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -2,11 +2,11 @@
 BR2_riscv=y
 BR2_RISCV_64=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVA=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index ccb563310e..045967f589 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -2,11 +2,11 @@
 BR2_riscv=y
 BR2_RISCV_64=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVA=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index 62f6a0e0b8..7164b80e82 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -2,11 +2,11 @@
 BR2_riscv=y
 BR2_RISCV_64=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVA=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index c3bcf98f81..c320d19703 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -2,11 +2,11 @@
 BR2_riscv=y
 BR2_RISCV_64=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVA=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 6c61e3aaaf..daead61c75 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -2,11 +2,11 @@
 BR2_riscv=y
 BR2_RISCV_64=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVA=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index a30596af92..ba83dd76ee 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -2,11 +2,11 @@
 BR2_riscv=y
 BR2_RISCV_64=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVA=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index da8cbe45f9..cab39d200d 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -2,11 +2,11 @@
 BR2_riscv=y
 BR2_RISCV_64=y
 BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVA=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
