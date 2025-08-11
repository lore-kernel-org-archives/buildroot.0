Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60607CA0EC0
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 09:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A0E441218;
	Mon, 11 Aug 2025 09:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpNxPws-C-dI; Mon, 11 Aug 2025 09:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626A541207
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 626A541207;
	Mon, 11 Aug 2025 09:28:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F40E9138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D684383D8B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjsvNex3_DNR for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 09:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59A4783D6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59A4783D6F
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:27:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49D32813E2; Mon, 11 Aug 2025 09:27:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 11:22:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c38ea1d496c69108beff7590adf1c2a521bbfe2b
X-Git-Newrev: 88d58d8ef82da6fe334e93188fdc6844a3ce9b23
X-Patchwork-Hint: ignore
Message-Id: <20250811092755.49D32813E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: add microblaze atomic support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=88d58d8ef82da6fe334e93188fdc6844a3ce9b23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds atomic test and set support for the microblaze arch.  A patch
is required to use atomic test and set with gcc 14 and 15 which has been
submitted upstream.

To test this patch with gcc 14:
$ cat > .config<<EOF
BR2_microblazeel=y
BR2_GCC_VERSION_14_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_ACPITOOL=y
EOF
$ make olddefconfig
$ make

To test this patch with gcc 15:
$ cat > .config<<EOF
BR2_microblazeel=y
BR2_GCC_VERSION_15_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_ACPITOOL=y
EOF
$ make olddefconfig
$ make

Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...icroblaze-add-atomic-test-and-set-support.patch | 286 +++++++++++++++++++++
 ...icroblaze-add-atomic-test-and-set-support.patch | 286 +++++++++++++++++++++
 package/gcc/Config.in.host                         |   6 -
 3 files changed, 572 insertions(+), 6 deletions(-)

diff --git a/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch b/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
new file mode 100644
index 0000000000..db6aefaef2
--- /dev/null
+++ b/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
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
diff --git a/package/gcc/15.1.0/0002-microblaze-add-atomic-test-and-set-support.patch b/package/gcc/15.1.0/0002-microblaze-add-atomic-test-and-set-support.patch
new file mode 100644
index 0000000000..db6aefaef2
--- /dev/null
+++ b/package/gcc/15.1.0/0002-microblaze-add-atomic-test-and-set-support.patch
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
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index dc0867fa14..f90f7c499d 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -36,9 +36,6 @@ config BR2_GCC_VERSION_14_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
-	# Severely broken on Microblaze
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
-	depends on !BR2_microblaze
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
 config BR2_GCC_VERSION_15_X
@@ -47,9 +44,6 @@ config BR2_GCC_VERSION_15_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
-	# Severely broken on Microblaze
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
-	depends on !BR2_microblaze
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 
 endchoice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
