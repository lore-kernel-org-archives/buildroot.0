Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859DB10F3DF3
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 19:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19BB440793;
	Sat, 28 Mar 2026 19:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJ44WcCx28lY; Sat, 28 Mar 2026 19:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9987F407AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774725329;
	bh=7IQs5+xrxjQi2k1it5Ji6pO1ivghub3J0nCE6BQi+PY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E//ijap7xtMEzezp0dK+WClaVRbbBFpz5/9gpASQ+e79VgAhb76ZpfUwKZZ221xyF
	 Viy6e7kBwpx5vRetXLURmHEENnFck2O3B+4rCA2VAVy+XbLgnFzkrlgJZttCozKs7L
	 H+Irt7kBeKRPwD8cjQ+1F7A6vArTWonxhXl3tTpMM9Lul3oO3OzOcFtJli0/Zwo1aP
	 JlBmIpO1HFZZRQq8eU3z/ejf00ohGEJN7gUFbBBEm7u1cxWr+BmqY6XJUPRFdi2YhI
	 44cDVvHhC6T2s4ojzKqkvKQ4JbIyLYMtrS00oTCJBkD71SPjgGzkGNnhbxZblwpssg
	 YEUI/QD20aR9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9987F407AA;
	Sat, 28 Mar 2026 19:15:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F97C353
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 19:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9190B4020A
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 19:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKvBvzTYLTJN for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 19:15:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B74FD40105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B74FD40105
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B74FD40105
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 19:15:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ba3.dip0.t-ipconnect.de [91.58.11.163])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF1AFA4C2018;
 Sat, 28 Mar 2026 20:15:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58888)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w6Z7x-000000002yW-0kBX;
 Sat, 28 Mar 2026 19:15:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Mar 2026 20:15:21 +0100
Message-ID: <20260328191521.138176-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774725322;
 bh=Ca76WvK+oNxTjihD/iIZimrsw2o8BXUwFjEVu3CN7FY=;
 h=From:To:Cc:Subject:Date:From;
 b=FF6V/iN9+2Nxs7/ohJpNwdlpAkEzGzR/biz4q1zBSgWOuB/CL0q4CQonJrTRXYMHa
 ldU/VR7KgOP7nB9svS41cAGUblPTiuLU7keotNrJEaNHN8HXzlihVoYe3K7bqJlHUm
 AjBZOar6KeuK8A6bfmyL8tK2OETpaeoNMOapwKa7VyY8jekXQV/mXRtB0NmDxb8mdE
 WkB7xvZTdZtvXPeJ8oOQJwNTAuluvDRdhM46QYA2a7C+2jqoGygBsYKgl1hjRjL3Qp
 1sBOva8uaMCVN0uzYC+Txa7ZVFrbidUuqnosJOIZV4BvqaqGZmU5Vpe/JmDaUntY7r
 PtNBEHmKc7/9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=FF6V/iN9
Subject: [Buildroot] [PATCH v2 1/1] package/gnu-efi: bump version to 4.0.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/ncroxon/gnu-efi/releases/tag/4.0.1
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.2
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.3
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.4

Removed patch due to upstream commit
https://github.com/ncroxon/gnu-efi/commit/f3ececb9eba2ad3104b6d39bd33e579091fce888
which contains a different fix.

Added patch to fix build errors with syslinux:
build/syslinux-6.03/com32/lib/exit.c:57:(.text+0x19):
 undefined reference to `longjmp'
build/syslinux-6.03/com32/lib/sys/module/exec.c:206:(.text+0xdc):
 undefined reference to `setjmp'

LICENSE was claried and new license files were in:
https://github.com/ncroxon/gnu-efi/commit/71d5d1746ba50378e0e2d563f7d132c421b7b4f8

licenses/LICENSE.efilib: was updated in:
https://github.com/ncroxon/gnu-efi/commit/71b05279b196beea0c8ee4398c7dd0c7963d78ab

This commit reflects those changes by updating _LICENSE_FILES and
adding the new license hashes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed syslinux build, updated licenses (Julien)

 .checkpackageignore                           |   1 -
 ...n-t-override-ARCH-when-cross-compili.patch |  32 ---
 ...tjmp-longjmp-ABI-break-in-ncroxon-77.patch | 250 ++++++++++++++++++
 package/gnu-efi/gnu-efi.hash                  |  10 +-
 package/gnu-efi/gnu-efi.mk                    |  17 +-
 5 files changed, 271 insertions(+), 39 deletions(-)
 delete mode 100644 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
 create mode 100644 package/gnu-efi/0001-Revert-setjmp-longjmp-ABI-break-in-ncroxon-77.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 243077da82..e034ea96bf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -400,7 +400,6 @@ package/gerbera/S99gerbera lib_sysv.Indent
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch lib_patch.Upstream
 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch lib_patch.Upstream
-package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch lib_patch.Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_patch.Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch lib_patch.Upstream
 package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
diff --git a/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch b/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
deleted file mode 100644
index cbba80b00a..0000000000
--- a/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 893a75202407e8ff3d75b217813a5df87da7c807 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 20 Jan 2019 21:07:11 +0100
-Subject: [PATCH] Make.defaults: don't override ARCH when cross-compiling
-
-Don't override the user-provided ARCH when cross-compiling otherwise
-ARCH won't be correct for armv5, aarch64 and x86_64
-
-Fixes:
- - http://autobuild.buildroot.org/results/2dfc0e10da25a8382a43557420d7dc3444c02dbb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Make.defaults | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Make.defaults b/Make.defaults
-index 1347aca..bb21874 100755
---- a/Make.defaults
-+++ b/Make.defaults
-@@ -99,7 +99,7 @@ ARCH          ?= $(shell $(HOSTCC) -dumpmachine | cut -f1 -d- | sed -e s,i[34567
- 
- # Get ARCH from the compiler if cross compiling 
- ifneq ($(CROSS_COMPILE),)
--  override ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv[67].*,arm,' )
-+  ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv[67].*,arm,' )
- endif
- 
- # FreeBSD (and possibly others) reports amd64 instead of x86_64
--- 
-2.47.1
-
diff --git a/package/gnu-efi/0001-Revert-setjmp-longjmp-ABI-break-in-ncroxon-77.patch b/package/gnu-efi/0001-Revert-setjmp-longjmp-ABI-break-in-ncroxon-77.patch
new file mode 100644
index 0000000000..fe2bd60686
--- /dev/null
+++ b/package/gnu-efi/0001-Revert-setjmp-longjmp-ABI-break-in-ncroxon-77.patch
@@ -0,0 +1,250 @@
+From 2e3092703698657703e0af9d463c289d78c3c195 Mon Sep 17 00:00:00 2001
+From: lzcunt <lzcunt@rawr.fun>
+Date: Tue, 9 Dec 2025 15:37:03 +0300
+Subject: [PATCH] Revert setjmp/longjmp ABI break in #77
+
+aa27c28 introduced an ABI break in a minor version which broke syslinux.
+syslinux externs the setjmp/longjmp implementation of GNU-EFI, therefore
+depends on the symbol name.
+
+Let's alias base_setjmp and base_longjmp to setjmp and longjmp
+respectively so syslinux builds again.
+
+Signed-off-by: lzcunt <lzcunt@rawr.fun>
+
+Upstream: https://github.com/ncroxon/gnu-efi/pull/77#ref-commit-2e30927
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/aarch64/setjmp.S     |  6 ++++++
+ lib/arm/setjmp.S         |  6 ++++++
+ lib/ia32/setjmp.S        | 14 +++++++++++---
+ lib/ia64/setjmp.S        |  6 ++++++
+ lib/loongarch64/setjmp.S |  7 ++++++-
+ lib/mips64el/setjmp.S    |  6 ++++++
+ lib/riscv64/setjmp.S     |  6 ++++++
+ lib/x86_64/setjmp.S      |  8 ++++++++
+ 8 files changed, 55 insertions(+), 4 deletions(-)
+
+diff --git a/lib/aarch64/setjmp.S b/lib/aarch64/setjmp.S
+index a83eb88e..27acce71 100644
+--- a/lib/aarch64/setjmp.S
++++ b/lib/aarch64/setjmp.S
+@@ -33,6 +33,9 @@ BASIS,
+ #define REG_PAIR(REG1, REG2, OFFS)      stp REG1, REG2, [x0, OFFS]
+ #define REG_ONE(REG1, OFFS)             str REG1, [x0, OFFS]
+ 
++	.globl	setjmp
++	.type	setjmp, @function
++setjmp:
+ 	.globl	base_setjmp
+ 	.type	base_setjmp, @function
+ base_setjmp:
+@@ -48,6 +51,9 @@ base_setjmp:
+ #define REG_PAIR(REG1, REG2, OFFS)      ldp REG1, REG2, [x0, OFFS]
+ #define REG_ONE(REG1, OFFS)             ldr REG1, [x0, OFFS]
+ 
++	.globl	longjmp
++	.type	longjmp, @function
++longjmp:
+ 	.globl	base_longjmp
+ 	.type	base_longjmp, @function
+ base_longjmp:
+diff --git a/lib/arm/setjmp.S b/lib/arm/setjmp.S
+index 2f0b9543..8fe3a439 100644
+--- a/lib/arm/setjmp.S
++++ b/lib/arm/setjmp.S
+@@ -11,6 +11,9 @@
+  */
+ 	.text
+ 	.arm
++	.globl	setjmp
++	.type	setjmp, %function
++setjmp:
+ 	.globl	base_setjmp
+ 	.type	base_setjmp, %function
+ base_setjmp:
+@@ -19,6 +22,9 @@ base_setjmp:
+ 	eor	r0, r0, r0
+ 	bx	lr
+ 
++	.globl	longjmp
++	.type	longjmp, %function
++longjmp:
+ 	.globl	base_longjmp
+ 	.type	base_longjmp, %function
+ base_longjmp:
+diff --git a/lib/ia32/setjmp.S b/lib/ia32/setjmp.S
+index b59e7391..2708d1a7 100644
+--- a/lib/ia32/setjmp.S
++++ b/lib/ia32/setjmp.S
+@@ -13,12 +13,16 @@ BASIS,
+  * IMPLIED.
+  */
+ 	.text
++	.globl	setjmp
+ 	.globl	base_setjmp
+ #ifndef __MINGW32__
+-	.type base_setjmp, @function
++	.type	setjmp, @function
++	.type	base_setjmp, @function
+ #else
+-	.def base_setjmp; .scl 2; .type 32; .endef
++	.def	setjmp; .scl 2; .type 32; .endef
++	.def	base_setjmp; .scl 2; .type 32; .endef
+ #endif
++setjmp:
+ base_setjmp:
+ 	pop	%ecx
+ 	movl	(%esp), %edx
+@@ -30,12 +34,16 @@ base_setjmp:
+ 	xorl	%eax, %eax
+ 	jmp	*%ecx
+ 
++	.globl	longjmp
+ 	.globl	base_longjmp
+ #ifndef __MINGW32__
++	.type	longjmp, @function
+ 	.type	base_longjmp, @function
+ #else
+-	.def base_longjmp; .scl 2; .type 32; .endef
++	.def	longjmp; .scl 2; .type 32; .endef
++	.def	base_longjmp; .scl 2; .type 32; .endef
+ #endif
++longjmp:
+ base_longjmp:
+ 	pop	%eax
+ 	pop	%edx
+diff --git a/lib/ia64/setjmp.S b/lib/ia64/setjmp.S
+index 3ab9a153..26d35530 100644
+--- a/lib/ia64/setjmp.S
++++ b/lib/ia64/setjmp.S
+@@ -13,6 +13,9 @@ BASIS,
+  * IMPLIED.
+  */
+ 	.text
++	.globl	setjmp
++	.type	setjmp, @function
++setjmp:
+ 	.globl	base_setjmp
+ 	.type	base_setjmp, @function
+ base_setjmp:
+@@ -96,6 +99,9 @@ base_setjmp:
+ 	br.ret.sptk	b0
+ 	;;
+ 
++	.globl	longjmp
++	.type	longjmp, @function
++longjmp:
+ 	.globl	base_longjmp
+ 	.type	base_longjmp, @function
+ 	.regstk 2, 0, 0, 0
+diff --git a/lib/loongarch64/setjmp.S b/lib/loongarch64/setjmp.S
+index 42f411e0..9f043593 100644
+--- a/lib/loongarch64/setjmp.S
++++ b/lib/loongarch64/setjmp.S
+@@ -20,7 +20,9 @@
+ 	.text
+ 	.p2align 3
+ 
+-
++	.globl	setjmp
++	.type	setjmp, @function
++setjmp:
+ 	.globl	base_setjmp
+ 	.type	base_setjmp, @function
+ base_setjmp:
+@@ -40,6 +42,9 @@ base_setjmp:
+ 	move $a0, $zero
+ 	jr   $ra
+ 
++	.globl	longjmp
++	.type	longjmp, @function
++longjmp:
+ 	.globl	base_longjmp
+ 	.type	base_longjmp, @function
+ base_longjmp:
+diff --git a/lib/mips64el/setjmp.S b/lib/mips64el/setjmp.S
+index c07e239d..5bbbed5f 100644
+--- a/lib/mips64el/setjmp.S
++++ b/lib/mips64el/setjmp.S
+@@ -18,6 +18,9 @@ BASIS,
+ 	.text
+ 	.p2align 3
+ 
++	.globl	setjmp
++	.type	setjmp, @function
++setjmp:
+ 	.globl	base_setjmp
+ 	.type	base_setjmp, @function
+ base_setjmp:
+@@ -54,6 +57,9 @@ base_setjmp:
+ 	move	$v0, $zero
+ 	jr	$ra
+ 
++	.globl	longjmp
++	.type	longjmp, @function
++longjmp:
+ 	.globl	base_longjmp
+ 	.type	base_longjmp, @function
+ base_longjmp:
+diff --git a/lib/riscv64/setjmp.S b/lib/riscv64/setjmp.S
+index 2f96e18d..f9552b55 100644
+--- a/lib/riscv64/setjmp.S
++++ b/lib/riscv64/setjmp.S
+@@ -39,6 +39,9 @@
+ #define REG_ONE(R, P) sd R, P(a0)
+ #define FREG_ONE(R, P) fsd R, P(a0)
+ 
++	.globl	setjmp
++	.type	setjmp, @function
++setjmp:
+ 	.globl base_setjmp
+ 	.type base_setjmp, @function
+ 
+@@ -56,6 +59,9 @@ base_setjmp:
+ #define REG_ONE(R, P) ld R, P(a0)
+ #define FREG_ONE(R, P) fld R, P(a0)
+ 
++	.globl	longjmp
++	.type	lobgjmp, @function
++longjmp:
+ 	.globl base_longjmp
+ 	.type base_longjmp, @function
+ 
+diff --git a/lib/x86_64/setjmp.S b/lib/x86_64/setjmp.S
+index 719b0219..bf320c83 100644
+--- a/lib/x86_64/setjmp.S
++++ b/lib/x86_64/setjmp.S
+@@ -1,10 +1,14 @@
+ 	.text
++	.globl	setjmp
+ 	.globl	base_setjmp
+ #ifndef __MINGW32__
++	.type	setjmp, @function
+ 	.type base_setjmp, @function
+ #else
+ 	.def base_setjmp; .scl 2; .type 32; .endef
++	.def setjmp; .scl 2; .type 32; .endef
+ #endif
++setjmp:
+ base_setjmp:
+ 	pop	%rsi
+ 	movq	%rbx,0x00(%rdi)
+@@ -19,12 +23,16 @@ base_setjmp:
+ 	xor	%rax,%rax
+ 	ret
+ 
++	.globl	longjmp
+ 	.globl	base_longjmp
+ #ifndef __MINGW32__
++	.type	longjmp, @function
+ 	.type	base_longjmp, @function
+ #else
++	.def longjmp; .scl 2; .type 32; .endef
+ 	.def base_longjmp; .scl 2; .type 32; .endef
+ #endif
++longjmp:
+ base_longjmp:
+ 	movl	%esi, %eax
+ 	movq	0x00(%rdi), %rbx
diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 5a2f47cfae..74487834cd 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,5 +1,9 @@
 # Locally computed
-sha256  a2e5dfd25e7fc0cd2027d75dc2517b4c74d94f801ff4784eca557ac1b9835899  gnu-efi-4.0.0.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
-sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  licenses/LICENSE.efilib
+sha256  40b61e842a4efcbf80f3e53b2f220c044e8cfe46eb4dd6396c83b751240b1c0d  gnu-efi-4.0.4.tar.gz
+sha256  e2b4e4a370f19dfdb3c84256ccb1d545ee98329faa20adbb5a06797119c3cd55  LICENSE
+sha256  01852478a0585ed9955de5d674f417ced8ef8934c300f124ab66a8cf251c46d8  licenses/LICENSE.BSD-3-Clause
 sha256  7aa278b6f1a2125d0a0c596fa537caca5a41e7b03f7d2dd0489905f65ffdb984  licenses/LICENSE.edk2
+sha256  146958d2c66a609a6ea72f73017ca626023e0cb3ecbfd9f55722f493427253e7  licenses/LICENSE.efilib
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/LICENSE.GPL-2.0-or-later
+sha256  4796125347fa98a7f3f056117fff04191712538ab9d9ab797075daad808bb538  licenses/LICENSE.GPL-3.0-or-later
+sha256  c0e22e2ea9fe4e12448ab248194a3d53703a13f67a4bb7a412715cb05cd1b274  licenses/LICENSE.LGPL-3.0-or-later
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 268e5350cf..f615df91bc 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,11 +4,22 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 4.0.0
+GNU_EFI_VERSION = 4.0.4
 GNU_EFI_SITE = $(call github,ncroxon,gnu-efi,$(GNU_EFI_VERSION))
 GNU_EFI_INSTALL_STAGING = YES
-GNU_EFI_LICENSE = BSD-3-Clause and/or GPL-2.0+ (gnuefi), BSD-3-Clause (efilib), BSD-2-Clause-Patent (EDK2 routines)
-GNU_EFI_LICENSE_FILES = LICENSE licenses/LICENSE.edk2 licenses/LICENSE.efilib
+
+GNU_EFI_LICENSE = \
+	BSD-3-Clause and/or GPL-2.0+ (gnuefi), \
+	BSD-3-Clause (efilib), \
+	BSD-2-Clause-Patent (EDK2 routines)
+GNU_EFI_LICENSE_FILES = \
+	LICENSE \
+	licenses/LICENSE.BSD-3-Clause \
+	licenses/LICENSE.edk2 \
+	licenses/LICENSE.efilib \
+	licenses/LICENSE.GPL-2.0-or-later \
+	licenses/LICENSE.GPL-3.0-or-later \
+	licenses/LICENSE.LGPL-3.0-or-later
 
 # gnu-efi is a set of library and header files used to build
 # standalone EFI applications such as bootloaders. There is no point
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
