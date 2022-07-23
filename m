Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CA2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FDA9418D4;
	Sat, 23 Jul 2022 14:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FDA9418D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AdvLURz-OIT1; Sat, 23 Jul 2022 14:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10B4E41747;
	Sat, 23 Jul 2022 14:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B4E41747
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C44CA1BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 974C7418D4
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 974C7418D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lSP50ebSVSZA for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:39:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A2EE41735
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A2EE41735
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4ED95845D2; Sat, 23 Jul 2022 14:25:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:38:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bb647297a6c48a7a79c20f4403be0dbea811a6c
X-Git-Newrev: 9db5eb258cf492567bac33a33cb606f14045639d
X-Patchwork-Hint: ignore
Message-Id: <20220723142545.4ED95845D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elf2flt: Remove Config.in.host
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

commit: https://git.buildroot.net/buildroot/commit/?id=9db5eb258cf492567bac33a33cb606f14045639d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need to have configuration files direbtly set the
BR2_PACKAGE_HOST_ELF2FLT option. The need for the elf2flt utility is
automatically determined by gcc build in package/gcc/gcc.mk according to
the BR2_BINFMT_FLAT option.

Accordingly, we can remove the file package/elf2flt/Config.in.host to
get rid of the BR2_PACKAGE_HOST_ELF2FLT option. BR2_STRIP_strip
dependency on this option is replaced with a dependency on
BR2_BINFMT_ELF.

To stay consistent with the fact that elf2flt supports only the arm, sh,
sparc, xtensa and riscv-64 architectures, a dependency on these
architectures is added to the BR2_BINFMT_FLAT option in arch/Config.in.

Board configuration files setting the BR2_PACKAGE_HOST_ELF2FLT option
are also updated.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in                                 |  2 +-
 arch/Config.in                            |  1 +
 configs/qemu_riscv64_nommu_virt_defconfig |  1 -
 configs/qemu_xtensa_lx60_nommu_defconfig  |  1 -
 package/elf2flt/Config.in.host            | 13 -------------
 toolchain/toolchain-buildroot/Config.in   |  1 -
 6 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/Config.in b/Config.in
index 52c3c4b4c8..af9052d32b 100644
--- a/Config.in
+++ b/Config.in
@@ -432,7 +432,7 @@ config BR2_ENABLE_RUNTIME_DEBUG
 config BR2_STRIP_strip
 	bool "strip target binaries"
 	default y
-	depends on !BR2_PACKAGE_HOST_ELF2FLT
+	depends on BR2_BINFMT_ELF
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the normal 'strip' command. This allows to save
diff --git a/arch/Config.in b/arch/Config.in
index 366ce71f3a..26293d4986 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -384,6 +384,7 @@ config BR2_BINFMT_ELF
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
+	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
 	depends on !BR2_USE_MMU
 	help
 	  FLAT binary is a relatively simple and lightweight executable
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index bfee9e710a..33fad50a3c 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -6,7 +6,6 @@ BR2_RISCV_64=y
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # Toolchain
-BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
 
 # Busybox with hush
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 44fb81bd74..f107b7e73b 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -4,7 +4,6 @@ BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 
 # Toolchain
-BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
 
 # Use minimal busybox with hush and networking tools
diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
deleted file mode 100644
index 2bab0095c2..0000000000
--- a/package/elf2flt/Config.in.host
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_HOST_ELF2FLT
-	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
-	depends on !BR2_USE_MMU
-	help
-	  uCLinux uses a Binary Flat format commonly known as BFLT. It
-	  is a relatively simple and lightweight executable format
-	  based on the original a.out format.
-
-	  This option compiles the required tools and makes the required
-	  modifications on your toolchain (linker).
-
-	  https://github.com/uclinux-dev/elf2flt
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 11566c27ff..56343daee7 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -89,5 +89,4 @@ source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
 source "package/binutils/Config.in.host"
 source "package/gcc/Config.in.host"
-source "package/elf2flt/Config.in.host"
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
