Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BEDC001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 22:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19A6F4026C;
	Mon,  7 Aug 2023 22:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19A6F4026C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfdXxvejTmJ5; Mon,  7 Aug 2023 22:03:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8950D409A0;
	Mon,  7 Aug 2023 22:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8950D409A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1E321BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB3D481374
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB3D481374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZxAhU7vpj4z for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 22:03:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B59E8136F
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 22:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B59E8136F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8495C847B6; Mon,  7 Aug 2023 22:03:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 00:03:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef57da23b9950a8820c64c268672265f233cfb00
X-Git-Newrev: a1ce9474e40f731f327035d8c0962abb16f00ff7
X-Patchwork-Hint: ignore
Message-Id: <20230807220335.8495C847B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_m68k: add Linux kernel patch
 to fix build with binutils >= 2.41
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1ce9474e40f731f327035d8c0962abb16f00ff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The m68k Linux kernel build is broken with binutils >= 2.41 with:

arch/m68k/fpsp040/skeleton.S: Assembler messages:
arch/m68k/fpsp040/skeleton.S:502: Error: junk at end of line, first unrecognized character is `#'
arch/m68k/fpsp040/skeleton.S:508: Error: junk at end of line, first unrecognized character is `#'

This commit adds a backport from the upstream Linux kernel which fixes
this issue. Many thanks to Romain Naour for the issue investigation
and the identification of the kernel commit fixing this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-m68k-Fix-invalid-.section-syntax.patch    | 97 ++++++++++++++++++++++
 .../0001-m68k-Fix-invalid-.section-syntax.patch    | 97 ++++++++++++++++++++++
 configs/qemu_m68k_mcf5208_defconfig                |  1 +
 configs/qemu_m68k_q800_defconfig                   |  1 +
 4 files changed, 196 insertions(+)

diff --git a/board/qemu/m68k-mcf5208/0001-m68k-Fix-invalid-.section-syntax.patch b/board/qemu/m68k-mcf5208/0001-m68k-Fix-invalid-.section-syntax.patch
new file mode 100644
index 0000000000..1f1ed75ae0
--- /dev/null
+++ b/board/qemu/m68k-mcf5208/0001-m68k-Fix-invalid-.section-syntax.patch
@@ -0,0 +1,97 @@
+From 0bb6b7477f5dcfafbdd76eea9c7aa7a5f78d7613 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <benh@debian.org>
+Date: Fri, 16 Jun 2023 17:36:10 +0200
+Subject: [PATCH] m68k: Fix invalid .section syntax
+
+gas supports several different forms for .section for ELF targets,
+including:
+    .section NAME [, "FLAGS"[, @TYPE[,FLAG_SPECIFIC_ARGUMENTS]]]
+and:
+    .section "NAME"[, #FLAGS...]
+
+In several places we use a mix of these two forms:
+    .section NAME, #FLAGS...
+
+A current development snapshot of binutils (2.40.50.20230611) treats
+this mixed syntax as an error.
+
+Change to consistently use:
+    .section NAME, "FLAGS"
+as is used elsewhere in the kernel.
+
+Link: https://buildd.debian.org/status/fetch.php?pkg=linux&arch=m68k&ver=6.4%7Erc6-1%7Eexp1&stamp=1686907300&raw=1
+Signed-off-by: Ben Hutchings <benh@debian.org>
+Tested-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
+Link: https://lore.kernel.org/r/ZIyBaueWT9jnTwRC@decadent.org.uk
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=922a9bd138101e3e5718f0f4d40dba68ef89bb43
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ arch/m68k/fpsp040/skeleton.S       | 4 ++--
+ arch/m68k/ifpsp060/os.S            | 4 ++--
+ arch/m68k/kernel/relocate_kernel.S | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/arch/m68k/fpsp040/skeleton.S b/arch/m68k/fpsp040/skeleton.S
+index 439395aa6fb4..081922c72daa 100644
+--- a/arch/m68k/fpsp040/skeleton.S
++++ b/arch/m68k/fpsp040/skeleton.S
+@@ -499,13 +499,13 @@ in_ea:
+ 	dbf	%d0,morein
+ 	rts
+ 
+-	.section .fixup,#alloc,#execinstr
++	.section .fixup,"ax"
+ 	.even
+ 1:
+ 	jbsr	fpsp040_die
+ 	jbra	.Lnotkern
+ 
+-	.section __ex_table,#alloc
++	.section __ex_table,"a"
+ 	.align	4
+ 
+ 	.long	in_ea,1b
+diff --git a/arch/m68k/ifpsp060/os.S b/arch/m68k/ifpsp060/os.S
+index 7a0d6e428066..89e2ec224ab6 100644
+--- a/arch/m68k/ifpsp060/os.S
++++ b/arch/m68k/ifpsp060/os.S
+@@ -379,11 +379,11 @@ _060_real_access:
+ 
+ 
+ | Execption handling for movs access to illegal memory
+-	.section .fixup,#alloc,#execinstr
++	.section .fixup,"ax"
+ 	.even
+ 1:	moveq		#-1,%d1
+ 	rts
+-.section __ex_table,#alloc
++.section __ex_table,"a"
+ 	.align 4
+ 	.long	dmrbuae,1b
+ 	.long	dmrwuae,1b
+diff --git a/arch/m68k/kernel/relocate_kernel.S b/arch/m68k/kernel/relocate_kernel.S
+index ab0f1e7d4653..f7667079e08e 100644
+--- a/arch/m68k/kernel/relocate_kernel.S
++++ b/arch/m68k/kernel/relocate_kernel.S
+@@ -26,7 +26,7 @@ ENTRY(relocate_new_kernel)
+ 	lea %pc@(.Lcopy),%a4
+ 2:	addl #0x00000000,%a4		/* virt_to_phys() */
+ 
+-	.section ".m68k_fixup","aw"
++	.section .m68k_fixup,"aw"
+ 	.long M68K_FIXUP_MEMOFFSET, 2b+2
+ 	.previous
+ 
+@@ -49,7 +49,7 @@ ENTRY(relocate_new_kernel)
+ 	lea %pc@(.Lcont040),%a4
+ 5:	addl #0x00000000,%a4		/* virt_to_phys() */
+ 
+-	.section ".m68k_fixup","aw"
++	.section .m68k_fixup,"aw"
+ 	.long M68K_FIXUP_MEMOFFSET, 5b+2
+ 	.previous
+ 
+-- 
+2.41.0
+
diff --git a/board/qemu/m68k-q800/0001-m68k-Fix-invalid-.section-syntax.patch b/board/qemu/m68k-q800/0001-m68k-Fix-invalid-.section-syntax.patch
new file mode 100644
index 0000000000..1f1ed75ae0
--- /dev/null
+++ b/board/qemu/m68k-q800/0001-m68k-Fix-invalid-.section-syntax.patch
@@ -0,0 +1,97 @@
+From 0bb6b7477f5dcfafbdd76eea9c7aa7a5f78d7613 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <benh@debian.org>
+Date: Fri, 16 Jun 2023 17:36:10 +0200
+Subject: [PATCH] m68k: Fix invalid .section syntax
+
+gas supports several different forms for .section for ELF targets,
+including:
+    .section NAME [, "FLAGS"[, @TYPE[,FLAG_SPECIFIC_ARGUMENTS]]]
+and:
+    .section "NAME"[, #FLAGS...]
+
+In several places we use a mix of these two forms:
+    .section NAME, #FLAGS...
+
+A current development snapshot of binutils (2.40.50.20230611) treats
+this mixed syntax as an error.
+
+Change to consistently use:
+    .section NAME, "FLAGS"
+as is used elsewhere in the kernel.
+
+Link: https://buildd.debian.org/status/fetch.php?pkg=linux&arch=m68k&ver=6.4%7Erc6-1%7Eexp1&stamp=1686907300&raw=1
+Signed-off-by: Ben Hutchings <benh@debian.org>
+Tested-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
+Link: https://lore.kernel.org/r/ZIyBaueWT9jnTwRC@decadent.org.uk
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=922a9bd138101e3e5718f0f4d40dba68ef89bb43
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ arch/m68k/fpsp040/skeleton.S       | 4 ++--
+ arch/m68k/ifpsp060/os.S            | 4 ++--
+ arch/m68k/kernel/relocate_kernel.S | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/arch/m68k/fpsp040/skeleton.S b/arch/m68k/fpsp040/skeleton.S
+index 439395aa6fb4..081922c72daa 100644
+--- a/arch/m68k/fpsp040/skeleton.S
++++ b/arch/m68k/fpsp040/skeleton.S
+@@ -499,13 +499,13 @@ in_ea:
+ 	dbf	%d0,morein
+ 	rts
+ 
+-	.section .fixup,#alloc,#execinstr
++	.section .fixup,"ax"
+ 	.even
+ 1:
+ 	jbsr	fpsp040_die
+ 	jbra	.Lnotkern
+ 
+-	.section __ex_table,#alloc
++	.section __ex_table,"a"
+ 	.align	4
+ 
+ 	.long	in_ea,1b
+diff --git a/arch/m68k/ifpsp060/os.S b/arch/m68k/ifpsp060/os.S
+index 7a0d6e428066..89e2ec224ab6 100644
+--- a/arch/m68k/ifpsp060/os.S
++++ b/arch/m68k/ifpsp060/os.S
+@@ -379,11 +379,11 @@ _060_real_access:
+ 
+ 
+ | Execption handling for movs access to illegal memory
+-	.section .fixup,#alloc,#execinstr
++	.section .fixup,"ax"
+ 	.even
+ 1:	moveq		#-1,%d1
+ 	rts
+-.section __ex_table,#alloc
++.section __ex_table,"a"
+ 	.align 4
+ 	.long	dmrbuae,1b
+ 	.long	dmrwuae,1b
+diff --git a/arch/m68k/kernel/relocate_kernel.S b/arch/m68k/kernel/relocate_kernel.S
+index ab0f1e7d4653..f7667079e08e 100644
+--- a/arch/m68k/kernel/relocate_kernel.S
++++ b/arch/m68k/kernel/relocate_kernel.S
+@@ -26,7 +26,7 @@ ENTRY(relocate_new_kernel)
+ 	lea %pc@(.Lcopy),%a4
+ 2:	addl #0x00000000,%a4		/* virt_to_phys() */
+ 
+-	.section ".m68k_fixup","aw"
++	.section .m68k_fixup,"aw"
+ 	.long M68K_FIXUP_MEMOFFSET, 2b+2
+ 	.previous
+ 
+@@ -49,7 +49,7 @@ ENTRY(relocate_new_kernel)
+ 	lea %pc@(.Lcont040),%a4
+ 5:	addl #0x00000000,%a4		/* virt_to_phys() */
+ 
+-	.section ".m68k_fixup","aw"
++	.section .m68k_fixup,"aw"
+ 	.long M68K_FIXUP_MEMOFFSET, 5b+2
+ 	.previous
+ 
+-- 
+2.41.0
+
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index bf62136345..d6dd8bd1b7 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
+BR2_LINUX_KERNEL_PATCH="board/qemu/m68k-mcf5208/0001-m68k-Fix-invalid-.section-syntax.patch"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index 50b61a8007..a6444103c9 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
+BR2_LINUX_KERNEL_PATCH="board/qemu/m68k-q800/0001-m68k-Fix-invalid-.section-syntax.patch"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
