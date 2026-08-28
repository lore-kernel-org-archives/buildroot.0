Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C31C61DD9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EB4660861;
	Fri, 28 Aug 2026 14:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fo4BoTnkgwd9; Fri, 28 Aug 2026 14:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927054;
	bh=mIqqLZpWoo1fUkpJj8pJulqIQpXKraYXclWToOlaLO4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z/TUXz4ibSuF9X14zlJXcHYHCMdiVYYbJ7SlXgwVz2lG206pZEDmt84hIlqbU/2QO
	 BaN2cgYOVhlK5dUhrePfPBAkhelBRLL+IW4R2qowFmiMmRjMBOFv9E7Mk8wIBC3d8/
	 QF75XxnshFv4tj2xMiYvSoiq7eip0T0tirEeXXD91hF0YiDhdhY1wLd3BqV8qKiuxF
	 s2nkCd+k0MCbW4Jx1OckFQnsJLd45YymCgMDKZhh8WFIgOotfcocQ7UgPCxUxU/x8G
	 t7L9XH9qXHjD+GJHhhuKXDHy/sIabduoOvRXtQsQplvDyb3aKFz+sa8KCfmbFFqfO/
	 eQQ0noj+/Scvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CCDF6085B;
	Fri, 28 Aug 2026 14:24:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D50ED28
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8347960705
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGU3SMjqus13 for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4FC46073A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D39439215F; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5b3425a850a4e4daf74ab86e23dc36cb419ce4ff
X-Git-Newrev: 367133ac70752cb9b8079f50ad237abe39504628
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.D39439215F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gcc-bare-metal:
 decouple from gcc package
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/367133ac70752cb9b8079f50ad237abe39504628
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Decoupling gcc-bare-metal from gcc allows to bump the version of one or the
other package without breaking the other one.

To do this, we replace existing symlinks from gcc-bare-metal to gcc with
copies of the patches and hashes for GCC 14.3.0 (as they were in tree before
the bump to 14.4.0) into gcc-bare-metal.

Fixes: https://autobuild.buildroot.net/results/0dc/0dc8a8c224594ac685f86f9442295c4b6a58d662/build-end.log

(alternative to commit d40c1725b2010c4daf568dc8e04ffaafd47bcd2f)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...disable-split-stack-for-non-thread-builds.patch |  26 ++
 ...r-also-undef-_TIME_BITS-in-sanitizer_proc.patch |  53 ++++
 ...icroblaze-add-atomic-test-and-set-support.patch | 286 +++++++++++++++++++++
 ...ibcody-Make-it-buildable-by-C-11-to-C-26.patch} |  16 +-
 ...sstream-and-memory-include-above-safe-cty.patch |  78 ++++++
 package/gcc-bare-metal/14.3.0                      |   1 -
 package/gcc-bare-metal/gcc-bare-metal.hash         |  10 +-
 7 files changed, 459 insertions(+), 11 deletions(-)

diff --git a/package/gcc-bare-metal/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc-bare-metal/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..e801085dad
--- /dev/null
+++ b/package/gcc-bare-metal/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 4f67134e0b1404fef4ea72342be8fab4c37ca8c8 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
diff --git a/package/gcc-bare-metal/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc-bare-metal/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
new file mode 100644
index 0000000000..b9dfcd0d01
--- /dev/null
+++ b/package/gcc-bare-metal/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
@@ -0,0 +1,53 @@
+From 71de45698f60f8feabc0e91336f1e2fb387902df Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 18 Jul 2024 23:13:41 +0200
+Subject: [PATCH] libsanitizer: also undef _TIME_BITS in
+ sanitizer_procmaps_solaris.cpp
+
+Upstream commit
+https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
+of LLVM added a #undef _TIME_BITS in
+libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp to
+fix the build on 32-bit Linux platforms that have enabled 64-bit
+time_t using _TIME_BITS=64.
+
+Indeed, _TIME_BITS=64 can only be used when _FILE_OFFSET_BITS=64, but
+sanitizer_platform_limits_posix.cpp undefines _FILE_OFFSET_BITS before
+including any header file. To fix this, the upstream fix was to also
+undef _TIME_BITS.
+
+This commit simply does the same in sanitizer_procmaps_solaris.cpp,
+which also gets compiled under Linux (despite what the file name
+says). In practice on Linux hosts (where _TIME_BITS=64 matters),
+sanitizer_procmaps_solaris.cpp will expand to nothing, as pretty much
+the rest of the file is inside a #ifdef SANITIZER_SOLARIS...#endif. So
+the #undef _FILE_OFFSET_BITS and #undef _TIME_BITS are only here
+before including sanitizer_platform.h, which will set the
+SANITIZER_LINUX/SANITIZER_SOLARIS define depending on the platform.
+
+Fixes:
+
+armeb-buildroot-linux-gnueabi/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+
+Upstream: https://gcc.gnu.org/pipermail/gcc-patches/2024-July/657811.html
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+index eeb49e2afe3..1b23fd4d512 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+@@ -11,6 +11,7 @@
+ 
+ // Before Solaris 11.4, <procfs.h> doesn't work in a largefile environment.
+ #undef _FILE_OFFSET_BITS
++#undef _TIME_BITS
+ #include "sanitizer_platform.h"
+ #if SANITIZER_SOLARIS
+ #  include <fcntl.h>
+-- 
+2.45.2
+
diff --git a/package/gcc-bare-metal/0003-microblaze-add-atomic-test-and-set-support.patch b/package/gcc-bare-metal/0003-microblaze-add-atomic-test-and-set-support.patch
new file mode 100644
index 0000000000..db6aefaef2
--- /dev/null
+++ b/package/gcc-bare-metal/0003-microblaze-add-atomic-test-and-set-support.patch
@@ -0,0 +1,286 @@
+From cd01b277c4a9e03c83427290228e4b289a169431 Mon Sep 17 00:00:00 2001
+From: Gopi Kumar Bulusu <gopi@sankhya.com>
+Date: Thu, 10 Jul 2025 12:44:44 +0530
+Subject: [PATCH] MicroBlaze : Enhance support for atomics. Fix PR118280
+
+Atomic support enhanced to fix existing atomic_compare_and_swapsi pattern
+to handle side effects; new patterns atomic_fetch_op and atomic_test_and_set
+added. As MicroBlaze has no QImode test/set instruction, use shift magic
+to implement atomic_test_and_set. This fixes PR118280.
+
+Files Changed
+
+* gcc/config/microblaze/iterators.md: New
+* microblaze-protos.h/microblaze.cc : Add microblaze_subword_address
+* gcc/config/microblaze/microblaze.md: constants: Add UNSPECV_CAS_BOOL,
+  UNSPECV_CAS_MEM, UNSPECV_CAS_VAL, UNSPECV_ATOMIC_FETCH_OP
+  type: add atomic
+* gcc/config/microblaze/sync.md: Add atomic_fetch_<atomic_optab>si
+  atomic_test_and_set
+
+Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
+Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193
+
+Signed-off-by: Kirk Meyer <kirk.meyer@sencore.com>
+Signed-off-by: David Holsgrove <david.holsgrove@xilinx.com>
+Signed-off-by: Gopi Kumar Bulusu <gopi@sankhya.com>
+---
+ gcc/config/microblaze/iterators.md        |  25 +++++
+ gcc/config/microblaze/microblaze-protos.h |   1 +
+ gcc/config/microblaze/microblaze.cc       |  28 ++++++
+ gcc/config/microblaze/microblaze.h        |   2 +-
+ gcc/config/microblaze/microblaze.md       |   7 +-
+ gcc/config/microblaze/sync.md             | 107 ++++++++++++++++++----
+ 6 files changed, 150 insertions(+), 20 deletions(-)
+ create mode 100644 gcc/config/microblaze/iterators.md
+
+diff --git a/gcc/config/microblaze/iterators.md b/gcc/config/microblaze/iterators.md
+new file mode 100644
+index 00000000000..2ffc2422a0a
+--- /dev/null
++++ b/gcc/config/microblaze/iterators.md
+@@ -0,0 +1,25 @@ 
++;; Iterator definitions for GCC MicroBlaze machine description files.
++;; Copyright (C) 2012-2024 Free Software Foundation, Inc.
++;;
++;; This file is part of GCC.
++;;
++;; GCC is free software; you can redistribute it and/or modify
++;; it under the terms of the GNU General Public License as published by
++;; the Free Software Foundation; either version 3, or (at your option)
++;; any later version.
++;;
++;; GCC is distributed in the hope that it will be useful,
++;; but WITHOUT ANY WARRANTY; without even the implied warranty of
++;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++;; GNU General Public License for more details.
++;;
++;; You should have received a copy of the GNU General Public License
++;; along with GCC; see the file COPYING3.  If not see
++;; <http://www.gnu.org/licenses/>.
++
++; atomics code iterator
++(define_code_iterator any_atomic [plus ior xor and])
++
++; atomics code attribute
++(define_code_attr atomic_optab
++  [(plus "add") (ior "or") (xor "xor") (and "and")])
+diff --git a/gcc/config/microblaze/microblaze-protos.h b/gcc/config/microblaze/microblaze-protos.h
+index 90b79cfe716..1cee0b3096c 100644
+--- a/gcc/config/microblaze/microblaze-protos.h
++++ b/gcc/config/microblaze/microblaze-protos.h
+@@ -62,6 +62,7 @@  extern int symbol_mentioned_p (rtx);
+ extern int label_mentioned_p (rtx);
+ extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
+ extern void microblaze_eh_return (rtx op0);
++extern void microblaze_subword_address (rtx, rtx *, rtx *);
+ #endif  /* RTX_CODE */
+ 
+ /* Declare functions in microblaze-c.cc.  */
+diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
+index 2ab5ada4ec9..80d10ab60e0 100644
+--- a/gcc/config/microblaze/microblaze.cc
++++ b/gcc/config/microblaze/microblaze.cc
+@@ -1299,6 +1299,34 @@  microblaze_expand_block_move (rtx dest, rtx src, rtx length, rtx align_rtx)
+   return false;
+ }
+ 
++/* Compute memory address *aligned_mem and corresponding shift value (*shift)
++   from a QImode memory reference MEM */
++void
++microblaze_subword_address (rtx mem, rtx *aligned_mem, rtx *shift)
++{
++  /* Align the memory address to a word.  */
++  rtx addr = force_reg (Pmode, XEXP (mem, 0));
++
++  rtx addr_mask = gen_int_mode (-4, Pmode);
++
++  rtx aligned_addr = gen_reg_rtx (Pmode);
++
++  emit_move_insn (aligned_addr,  gen_rtx_AND (Pmode, addr, addr_mask));
++
++  *aligned_mem = change_address (mem, SImode, aligned_addr);
++
++  /* Calculate the shift amount.  */
++  emit_move_insn (*shift, gen_rtx_AND (SImode, addr, gen_int_mode (3, SImode)));
++
++  if (TARGET_LITTLE_ENDIAN == 0) {
++    emit_move_insn (*shift,
++		    gen_rtx_MINUS (SImode, gen_int_mode (3, SImode), *shift));
++  }
++
++  emit_move_insn (*shift, gen_rtx_ASHIFT (SImode, *shift,
++					  gen_int_mode (3, SImode)));
++}
++
+ static bool
+ microblaze_rtx_costs (rtx x, machine_mode mode, int outer_code ATTRIBUTE_UNUSED,
+ 		      int opno ATTRIBUTE_UNUSED, int *total,
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2390542434b..b2e9ccde363 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -57,7 +57,7 @@  extern enum pipeline_type microblaze_pipe;
+ 
+ /* Default target_flags if no switches are specified  */
+ #define TARGET_DEFAULT      (MASK_SOFT_MUL | MASK_SOFT_DIV | MASK_SOFT_FLOAT \
+-                             | TARGET_ENDIAN_DEFAULT)
++			      | TARGET_ENDIAN_DEFAULT)
+ 
+ /* Do we have CLZ?  */
+ #define TARGET_HAS_CLZ      (TARGET_PATTERN_COMPARE && microblaze_has_clz)
+diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
+index 45c48a71e8d..270df8da0c5 100644
+--- a/gcc/config/microblaze/microblaze.md
++++ b/gcc/config/microblaze/microblaze.md
+@@ -21,6 +21,7 @@ 
+ 
+ (include "constraints.md")
+ (include "predicates.md")
++(include "iterators.md")
+ 
+ ;;----------------------------------------------------
+ ;; Constants
+@@ -43,6 +44,10 @@ 
+   (UNSPEC_TLS           106)    ;; jump table
+   (UNSPEC_SET_TEXT      107)    ;; set text start
+   (UNSPEC_TEXT          108)    ;; data text relative
++  (UNSPECV_CAS_BOOL     201)    ;; compare and swap (bool)
++  (UNSPECV_CAS_VAL      202)    ;; compare and swap (val)
++  (UNSPECV_CAS_MEM      203)    ;; compare and swap (mem)
++  (UNSPECV_ATOMIC_FETCH_OP     204)    ;; atomic fetch op
+ ])
+ 
+ (define_c_enum "unspec" [
+@@ -79,7 +84,7 @@ 
+ ;; bshift 	Shift operations
+ 
+ (define_attr "type"
+-  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap"
++  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap,atomic"
+   (const_string "unknown"))
+ 
+ ;; Main data type used by the insn
+diff --git a/gcc/config/microblaze/sync.md b/gcc/config/microblaze/sync.md
+index db7b11e5379..6478ab6dcac 100644
+--- a/gcc/config/microblaze/sync.md
++++ b/gcc/config/microblaze/sync.md
+@@ -18,26 +18,97 @@ 
+ ;; <http://www.gnu.org/licenses/>.
+ 
+ (define_insn "atomic_compare_and_swapsi"
+-  [(match_operand:SI 0 "register_operand" "=&d")	;; bool output
+-   (match_operand:SI 1 "register_operand" "=&d")	;; val output
+-   (match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
+-   (match_operand:SI 3 "register_operand" "d")		;; expected value
+-   (match_operand:SI 4 "register_operand" "d")		;; desired value
+-   (match_operand:SI 5 "const_int_operand" "")		;; is_weak
+-   (match_operand:SI 6 "const_int_operand" "")		;; mod_s
+-   (match_operand:SI 7 "const_int_operand" "")		;; mod_f
++  [(set (match_operand:SI 0 "register_operand" "=&d")		;; bool output
++        (unspec_volatile:SI
++          [(match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
++           (match_operand:SI 3 "register_operand" "d")		;; expected value
++           (match_operand:SI 4 "register_operand" "d")]		;; desired value
++          UNSPECV_CAS_BOOL))
++   (set (match_operand:SI 1 "register_operand" "=&d")		;; val output
++        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_VAL))
++   (set (match_dup 2)
++        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_MEM))
++   (match_operand:SI 5 "const_int_operand" "")			;; is_weak
++   (match_operand:SI 6 "const_int_operand" "")			;; mod_s
++   (match_operand:SI 7 "const_int_operand" "")			;; mod_f
+    (clobber (match_scratch:SI 8 "=&d"))]
+   ""
+   {
+-    output_asm_insn ("addc \tr0,r0,r0", operands);
+-    output_asm_insn ("lwx  \t%1,%y2,r0", operands);
+-    output_asm_insn ("addic\t%8,r0,0", operands);
+-    output_asm_insn ("bnei \t%8,.-8", operands);
+-    output_asm_insn ("cmp  \t%0,%1,%3", operands);
+-    output_asm_insn ("bnei \t%0,.+16", operands);
+-    output_asm_insn ("swx  \t%4,%y2,r0", operands);
+-    output_asm_insn ("addic\t%8,r0,0", operands);
+-    output_asm_insn ("bnei \t%8,.-28", operands);
+-    return "";
++    return "add  \t%0,r0,r0\n\t"
++      "lwx  \t%1,%y2,r0\n\t"
++      "addic\t%8,r0,0\n\t"
++      "bnei \t%8,.-8\n\t"
++      "cmp  \t%8,%1,%3\n\t"
++      "bnei \t%8,.+20\n\t"
++      "swx  \t%4,%y2,r0\n\t"
++      "addic\t%8,r0,0\n\t"
++      "bnei \t%8,.-28\n\t"
++      "addi \t%0,r0,1";
+   }
++  [(set_attr "type"	"atomic")
++  (set_attr "mode"	"SI")
++  (set_attr "length"	"40")]
+ )
++
++;;
++;;
++;;
++;;
++(define_insn "atomic_fetch_<atomic_optab>si"
++  [(set (match_operand:SI 0 "register_operand" "=&d")
++	(match_operand:SI 1 "memory_operand" "+Q"))
++   (set (match_dup 1)
++	(unspec_volatile:SI
++	  [(any_atomic:SI (match_dup 1)
++		   (match_operand:SI 2 "register_operand" "d"))
++	   (match_operand:SI 3 "const_int_operand")] ;; model
++	 UNSPECV_ATOMIC_FETCH_OP))
++   (clobber (match_scratch:SI 4 "=&d"))]	  ;; tmp_1
++  ""
++  {
++    return 
++      "lwx  \t%0,%y1,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-8\n\t"
++      "<atomic_optab>\t%4,%0,%2\n\t"
++      "swx  \t%4,%y1,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-24";
++  }
++  [(set_attr "type"	"atomic")
++  (set_attr "mode"	"SI")
++  (set_attr "length"	"28")])
++
++;;
++;; MicroBlaze only supports lx/sx instructions for word mode only
++;;
++;; Use shift|mask magic to implement atomic_test_and_set using lwx/swx
++;;
++(define_expand "atomic_test_and_set"
++  [(match_operand:QI 0 "register_operand" "")    ;; bool output
++   (match_operand:QI 1 "memory_operand" "m")    ;; memory
++   (match_operand:SI 2 "const_int_operand" "")]  ;; model
++  ""
++{
++  rtx old = gen_reg_rtx (SImode);
++  rtx mem = operands[1];
++  rtx model = operands[2];
++  rtx set = gen_reg_rtx (SImode);
++  rtx aligned_mem = gen_reg_rtx (SImode);
++  rtx shift = gen_reg_rtx (SImode);
++
++  microblaze_subword_address (mem, &aligned_mem, &shift);
++
++  emit_move_insn (set, GEN_INT (1));
++  rtx shifted_set = gen_reg_rtx (SImode);
++
++  emit_move_insn (shifted_set, gen_rtx_ASHIFT (SImode, set, shift));
++
++  emit_insn (gen_atomic_fetch_orsi (old, aligned_mem, shifted_set, model));
++
++  emit_move_insn (old, gen_rtx_ASHIFTRT (SImode, old, shift));
++
++  emit_move_insn (operands[0], gen_lowpart (QImode, old));
++
++  DONE;
++})
+-- 
+2.43.5
+
diff --git a/package/gcc-bare-metal/0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/package/gcc-bare-metal/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
similarity index 96%
rename from package/gcc-bare-metal/0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch
rename to package/gcc-bare-metal/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
index 7d6116a9c5..f9f983b464 100644
--- a/package/gcc-bare-metal/0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch
+++ b/package/gcc-bare-metal/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
@@ -1,4 +1,4 @@
-From 1f0224e8ddb3d3d0bf4c7a11769b193a4df5cc37 Mon Sep 17 00:00:00 2001
+From daa3e1ead791bc58208043cfc4595ba1a78cdd34 Mon Sep 17 00:00:00 2001
 From: Jakub Jelinek <jakub@redhat.com>
 Date: Fri, 21 Nov 2025 16:25:58 +0100
 Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
@@ -25,10 +25,8 @@ the u8 literals everywhere are worth it either.
 	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
 
 (cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
-
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=1f0224e8ddb3d3d0bf4c7a11769b193a4df5cc37
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=daa3e1ead791bc58208043cfc4595ba1a78cdd34
 ---
  libcody/client.cc | 36 +++++++++++++++++++-----------------
  libcody/cody.hh   | 22 ++++++++++++++++++++++
@@ -36,7 +34,7 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  3 files changed, 55 insertions(+), 31 deletions(-)
 
 diff --git a/libcody/client.cc b/libcody/client.cc
-index ae69d190cb77..147fecdbe500 100644
+index ae69d190cb7..147fecdbe50 100644
 --- a/libcody/client.cc
 +++ b/libcody/client.cc
 @@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
@@ -145,7 +143,7 @@ index ae69d190cb77..147fecdbe500 100644
        else
  	return Packet (Client::PC_ERROR, u8"");
 diff --git a/libcody/cody.hh b/libcody/cody.hh
-index 789ce9e70b75..93bce93aa94d 100644
+index 789ce9e70b7..93bce93aa94 100644
 --- a/libcody/cody.hh
 +++ b/libcody/cody.hh
 @@ -47,12 +47,21 @@ namespace Detail  {
@@ -198,7 +196,7 @@ index 789ce9e70b75..93bce93aa94d 100644
      : vector (std::move (v)), cat (VECTOR), code (c)
    {
 diff --git a/libcody/server.cc b/libcody/server.cc
-index e2fa069bb933..c18469fae843 100644
+index e2fa069bb93..c18469fae84 100644
 --- a/libcody/server.cc
 +++ b/libcody/server.cc
 @@ -36,12 +36,12 @@ static RequestPair
@@ -259,5 +257,5 @@ index e2fa069bb933..c18469fae843 100644
    if (version == ~0u)
      return nullptr;
 -- 
-2.43.7
+2.54.0
 
diff --git a/package/gcc-bare-metal/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch b/package/gcc-bare-metal/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
new file mode 100644
index 0000000000..e48dd91c18
--- /dev/null
+++ b/package/gcc-bare-metal/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
@@ -0,0 +1,78 @@
+From 046776dac7cc74bdbab36f450af80644a045858a Mon Sep 17 00:00:00 2001
+From: Andrew Pinski <quic_apinski@quicinc.com>
+Date: Mon, 25 Nov 2024 14:03:27 -0800
+Subject: [PATCH] build: Move sstream and memory include above safe-ctype.h
+ [PR124830]
+
+This picks r15-5661-gf6e00226a4ca6 to older branches, also moving
+the <memory> include to fix build issues with a C++20 host compiler.
+
+sstream in some versions of libstdc++ include locale which might not have been
+included yet. safe-ctype.h defines the toupper, tolower, etc. as macros so the
+c++ header files needed to be included before hand as comment in system.h says:
+/* Include C++ standard headers before "safe-ctype.h" to avoid GCC
+   poisoning the ctype macros through safe-ctype.h */
+
+I don't understand how it was working before when memory was included after
+safe-ctype.h rather than before. But this makes sstream consistent with the
+other C++ headers.
+
+gcc/ChangeLog:
+
+	PR target/117771
+	PR c/124830
+	* system.h: Move the include of sstream and memory above safe-ctype.h.
+
+Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+Upstream: https://gcc.gnu.org/git?p=gcc.git;a=commit;h=046776dac7cc74bdbab36f450af80644a045858a
+---
+ gcc/system.h | 21 +++++++++------------
+ 1 file changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/gcc/system.h b/gcc/system.h
+index b18482c7190..da331f105ba 100644
+--- a/gcc/system.h
++++ b/gcc/system.h
+@@ -222,6 +222,15 @@ extern int fprintf_unlocked (FILE *, const char *, ...);
+ #ifdef INCLUDE_FUNCTIONAL
+ # include <functional>
+ #endif
++#ifdef INCLUDE_SSTREAM
++# include <sstream>
++#endif
++/* Some of the headers included by <memory> can use "abort" within a
++   namespace, e.g. "_VSTD::abort();", which fails after we use the
++   preprocessor to redefine "abort" as "fancy_abort" below.  */
++#ifdef INCLUDE_MEMORY
++# include <memory>
++#endif
+ # include <cstring>
+ # include <initializer_list>
+ # include <new>
+@@ -758,22 +767,10 @@ private:
+ #define LIKELY(x) (__builtin_expect ((x), 1))
+ #define UNLIKELY(x) (__builtin_expect ((x), 0))
+ 
+-/* Some of the headers included by <memory> can use "abort" within a
+-   namespace, e.g. "_VSTD::abort();", which fails after we use the
+-   preprocessor to redefine "abort" as "fancy_abort" below.  */
+-
+-#ifdef INCLUDE_MEMORY
+-# include <memory>
+-#endif
+-
+ #ifdef INCLUDE_MUTEX
+ # include <mutex>
+ #endif
+ 
+-#ifdef INCLUDE_SSTREAM
+-# include <sstream>
+-#endif
+-
+ #ifdef INCLUDE_MALLOC_H
+ #if defined(HAVE_MALLINFO) || defined(HAVE_MALLINFO2)
+ #include <malloc.h>
+-- 
+2.54.0
+
diff --git a/package/gcc-bare-metal/14.3.0 b/package/gcc-bare-metal/14.3.0
deleted file mode 120000
index 429ecf8646..0000000000
--- a/package/gcc-bare-metal/14.3.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/14.3.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
deleted file mode 120000
index d417b0dc77..0000000000
--- a/package/gcc-bare-metal/gcc-bare-metal.hash
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/gcc.hash
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
new file mode 100644
index 0000000000..d6db148430
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -0,0 +1,9 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
+sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  9d6b43ce4d8de0c878bf16b54d8e7a10d9bd42b75178153e3af6a815bdc90f74  COPYING.RUNTIME
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
