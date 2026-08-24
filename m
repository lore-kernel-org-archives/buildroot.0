Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2A4C5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 10:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 059EB6060A;
	Mon, 24 Aug 2026 10:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQHowrLKK4tB; Mon, 24 Aug 2026 10:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787566743;
	bh=2Dr9EOk9aGb0P5PZt6e6gWGKfDcc0oovpuRpCjHPI5U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kFC4baO/FqUxAptfbJK1QtsXkWdS4CoKIhZkz2s60+NK3BPV6WZluROcyVg6Uk/gU
	 JI7kOOjpRCx+iXQKf0SBRaHFYbp8TyZxCHQeLW0BC7z2Rurg/x4FnYRW5HkCN+PqFX
	 Goqn5fbKx8bWZKsU24B6RZbtYsEa1rhTiUZKPiadfMwCyRSqIQQYNGoh+KvqvVHLp3
	 F68MkmKqN3p/TyUd0IASA3LWiqKudOq5m2OHqPRpuk0DjepIe2sjMFaYbP3vnFkMU0
	 T65Ez9LrN6PlZPlgB1phcH5nQXE1jYRlnIzup7W0rdUUfnOgkUocgVlE2Qiec/U2Fh
	 1Xdr0bvJ5wkgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 195E560617;
	Mon, 24 Aug 2026 10:19:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1491D42B
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 071354065D
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMsC7x-dgGfO for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 10:18:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E506C40604
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:18:58 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c214321dc32so641900866b.0
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 03:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787566736; x=1788171536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TSab9jIZe3SP0ZzhGwGH5K0TpiUNHLQ/6KKQVTaDCG0=;
 b=exVU4YfVGMEm62hm2JAjm6o+9lKwPYSOFqK75h6MWpaJ9XAUQ/4azqkIyXUE1QVome
 hBHGyBb45UtP7gBrhFs4tFkWWnmFfNjH37O/BeicWt92Pq7UcafUB8q3o3h4NURfrMIG
 dxOOrVzuDqoAY3ifZoKFG8zCnyoue0fRDWzhUhdV12ISgsd476G5Xrp71fwPrM9u0Vay
 vOTW3jMnI/vJ588Q0lljdadvf9+ltR78nJo5X0yBwWJK+OmxZXE14UQ5hi30LzALKJCO
 /8foBA3NaCcDucnAto6bOM2n7igDD2WAv/qNilBmhuYw65vSzRtIcDcrpBN3yUkWHWvv
 M2Uw==
X-Gm-Message-State: AFuF++kEIodOEtHRvHqLG3n4ScznLd8+NgDCvqNyGFkg7S+W81ogXI+V
 vn9aEnVVns6arj9CnwgJXEptxIZYd++8NgVnNSc9NTKhE39VA9Z+sK3kxEbEXiIQ+q+nzzbbFnk
 DEP8A
X-Gm-Gg: AR+sD12BOEzhQvIeZI9HQd40QSZyRr0ZKiPMhbMVWqQsDlVDPqITEqhbdON5Fkk2UNe
 Mwu9JCDRdTzpCZ90eqY7Df82pQJgaoovuF/61eoQsw5akbooevq+iwuyOxt2zfeFVi3BrX00HsK
 FMOJcHlmNCQX7dZlxFokMEZtnD/5TpD7T+xEsfxwFCREpa9laahpH2p1FaAUa16tqqYFbX17A6r
 xtFPG5UMWPAvQqG1oPbRDRJ7Zbq4cNLHrjcc+4h3YENZJbUpBphVIhOhz+fU5vDXDmXHQs7Df6X
 hQ0fO3L28kWO10ekAxvglkUpF8rAOOZJC4y9bobovZbmX2vP5C3q37BvBPs1We0KBAilYlWqO01
 tRIMDYO7qxGZL+6eBeXSjjt7MVnKxL5czfLHHVouxvGHfLDugkQV4savChcbc5w6H8M9Tgn81g1
 ogDhVk8zDmptND/Vh3ucxqAAl9p38ytSWpSbbq0m5lok/lnJ4d86EcV1L3AqbK/V75i8jl5H/2k
 C11ruZxGEoC9xS8UTGQ6ESU9AXkg0d0QbPjRzb63A==
X-Received: by 2002:a17:907:97d5:b0:c19:45df:1856 with SMTP id
 a640c23a62f3a-c246a675873mr2785915866b.17.1787566735984; 
 Mon, 24 Aug 2026 03:18:55 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249686e37bsm1139393866b.55.2026.08.24.03.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 03:18:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Neal Frager <neal.frager@amd.com>
Date: Mon, 24 Aug 2026 12:18:44 +0200
Message-ID: <20260824101844.3181476-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824101844.3181476-1-titouan.christophe@mind.be>
References: <20260824101844.3181476-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 2/2] package/gcc-bare-metal: bump
 to 14.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the announcement:
https://gcc.gnu.org/pipermail/gcc-announce/2026/000192.html

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...laze-add-atomic-test-and-set-support.patch | 286 ------------------
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 261 ----------------
 ...am-and-memory-include-above-safe-cty.patch |  78 -----
 package/gcc-bare-metal/gcc-bare-metal.hash    |   4 +-
 package/gcc-bare-metal/gcc-bare-metal.mk      |   2 +-
 5 files changed, 3 insertions(+), 628 deletions(-)
 delete mode 100644 package/gcc-bare-metal/0003-microblaze-add-atomic-test-and-set-support.patch
 delete mode 100644 package/gcc-bare-metal/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
 delete mode 100644 package/gcc-bare-metal/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch

diff --git a/package/gcc-bare-metal/0003-microblaze-add-atomic-test-and-set-support.patch b/package/gcc-bare-metal/0003-microblaze-add-atomic-test-and-set-support.patch
deleted file mode 100644
index db6aefaef2..0000000000
--- a/package/gcc-bare-metal/0003-microblaze-add-atomic-test-and-set-support.patch
+++ /dev/null
@@ -1,286 +0,0 @@
-From cd01b277c4a9e03c83427290228e4b289a169431 Mon Sep 17 00:00:00 2001
-From: Gopi Kumar Bulusu <gopi@sankhya.com>
-Date: Thu, 10 Jul 2025 12:44:44 +0530
-Subject: [PATCH] MicroBlaze : Enhance support for atomics. Fix PR118280
-
-Atomic support enhanced to fix existing atomic_compare_and_swapsi pattern
-to handle side effects; new patterns atomic_fetch_op and atomic_test_and_set
-added. As MicroBlaze has no QImode test/set instruction, use shift magic
-to implement atomic_test_and_set. This fixes PR118280.
-
-Files Changed
-
-* gcc/config/microblaze/iterators.md: New
-* microblaze-protos.h/microblaze.cc : Add microblaze_subword_address
-* gcc/config/microblaze/microblaze.md: constants: Add UNSPECV_CAS_BOOL,
-  UNSPECV_CAS_MEM, UNSPECV_CAS_VAL, UNSPECV_ATOMIC_FETCH_OP
-  type: add atomic
-* gcc/config/microblaze/sync.md: Add atomic_fetch_<atomic_optab>si
-  atomic_test_and_set
-
-Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
-Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193
-
-Signed-off-by: Kirk Meyer <kirk.meyer@sencore.com>
-Signed-off-by: David Holsgrove <david.holsgrove@xilinx.com>
-Signed-off-by: Gopi Kumar Bulusu <gopi@sankhya.com>
----
- gcc/config/microblaze/iterators.md        |  25 +++++
- gcc/config/microblaze/microblaze-protos.h |   1 +
- gcc/config/microblaze/microblaze.cc       |  28 ++++++
- gcc/config/microblaze/microblaze.h        |   2 +-
- gcc/config/microblaze/microblaze.md       |   7 +-
- gcc/config/microblaze/sync.md             | 107 ++++++++++++++++++----
- 6 files changed, 150 insertions(+), 20 deletions(-)
- create mode 100644 gcc/config/microblaze/iterators.md
-
-diff --git a/gcc/config/microblaze/iterators.md b/gcc/config/microblaze/iterators.md
-new file mode 100644
-index 00000000000..2ffc2422a0a
---- /dev/null
-+++ b/gcc/config/microblaze/iterators.md
-@@ -0,0 +1,25 @@ 
-+;; Iterator definitions for GCC MicroBlaze machine description files.
-+;; Copyright (C) 2012-2024 Free Software Foundation, Inc.
-+;;
-+;; This file is part of GCC.
-+;;
-+;; GCC is free software; you can redistribute it and/or modify
-+;; it under the terms of the GNU General Public License as published by
-+;; the Free Software Foundation; either version 3, or (at your option)
-+;; any later version.
-+;;
-+;; GCC is distributed in the hope that it will be useful,
-+;; but WITHOUT ANY WARRANTY; without even the implied warranty of
-+;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+;; GNU General Public License for more details.
-+;;
-+;; You should have received a copy of the GNU General Public License
-+;; along with GCC; see the file COPYING3.  If not see
-+;; <http://www.gnu.org/licenses/>.
-+
-+; atomics code iterator
-+(define_code_iterator any_atomic [plus ior xor and])
-+
-+; atomics code attribute
-+(define_code_attr atomic_optab
-+  [(plus "add") (ior "or") (xor "xor") (and "and")])
-diff --git a/gcc/config/microblaze/microblaze-protos.h b/gcc/config/microblaze/microblaze-protos.h
-index 90b79cfe716..1cee0b3096c 100644
---- a/gcc/config/microblaze/microblaze-protos.h
-+++ b/gcc/config/microblaze/microblaze-protos.h
-@@ -62,6 +62,7 @@  extern int symbol_mentioned_p (rtx);
- extern int label_mentioned_p (rtx);
- extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
- extern void microblaze_eh_return (rtx op0);
-+extern void microblaze_subword_address (rtx, rtx *, rtx *);
- #endif  /* RTX_CODE */
- 
- /* Declare functions in microblaze-c.cc.  */
-diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
-index 2ab5ada4ec9..80d10ab60e0 100644
---- a/gcc/config/microblaze/microblaze.cc
-+++ b/gcc/config/microblaze/microblaze.cc
-@@ -1299,6 +1299,34 @@  microblaze_expand_block_move (rtx dest, rtx src, rtx length, rtx align_rtx)
-   return false;
- }
- 
-+/* Compute memory address *aligned_mem and corresponding shift value (*shift)
-+   from a QImode memory reference MEM */
-+void
-+microblaze_subword_address (rtx mem, rtx *aligned_mem, rtx *shift)
-+{
-+  /* Align the memory address to a word.  */
-+  rtx addr = force_reg (Pmode, XEXP (mem, 0));
-+
-+  rtx addr_mask = gen_int_mode (-4, Pmode);
-+
-+  rtx aligned_addr = gen_reg_rtx (Pmode);
-+
-+  emit_move_insn (aligned_addr,  gen_rtx_AND (Pmode, addr, addr_mask));
-+
-+  *aligned_mem = change_address (mem, SImode, aligned_addr);
-+
-+  /* Calculate the shift amount.  */
-+  emit_move_insn (*shift, gen_rtx_AND (SImode, addr, gen_int_mode (3, SImode)));
-+
-+  if (TARGET_LITTLE_ENDIAN == 0) {
-+    emit_move_insn (*shift,
-+		    gen_rtx_MINUS (SImode, gen_int_mode (3, SImode), *shift));
-+  }
-+
-+  emit_move_insn (*shift, gen_rtx_ASHIFT (SImode, *shift,
-+					  gen_int_mode (3, SImode)));
-+}
-+
- static bool
- microblaze_rtx_costs (rtx x, machine_mode mode, int outer_code ATTRIBUTE_UNUSED,
- 		      int opno ATTRIBUTE_UNUSED, int *total,
-diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
-index 2390542434b..b2e9ccde363 100644
---- a/gcc/config/microblaze/microblaze.h
-+++ b/gcc/config/microblaze/microblaze.h
-@@ -57,7 +57,7 @@  extern enum pipeline_type microblaze_pipe;
- 
- /* Default target_flags if no switches are specified  */
- #define TARGET_DEFAULT      (MASK_SOFT_MUL | MASK_SOFT_DIV | MASK_SOFT_FLOAT \
--                             | TARGET_ENDIAN_DEFAULT)
-+			      | TARGET_ENDIAN_DEFAULT)
- 
- /* Do we have CLZ?  */
- #define TARGET_HAS_CLZ      (TARGET_PATTERN_COMPARE && microblaze_has_clz)
-diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
-index 45c48a71e8d..270df8da0c5 100644
---- a/gcc/config/microblaze/microblaze.md
-+++ b/gcc/config/microblaze/microblaze.md
-@@ -21,6 +21,7 @@ 
- 
- (include "constraints.md")
- (include "predicates.md")
-+(include "iterators.md")
- 
- ;;----------------------------------------------------
- ;; Constants
-@@ -43,6 +44,10 @@ 
-   (UNSPEC_TLS           106)    ;; jump table
-   (UNSPEC_SET_TEXT      107)    ;; set text start
-   (UNSPEC_TEXT          108)    ;; data text relative
-+  (UNSPECV_CAS_BOOL     201)    ;; compare and swap (bool)
-+  (UNSPECV_CAS_VAL      202)    ;; compare and swap (val)
-+  (UNSPECV_CAS_MEM      203)    ;; compare and swap (mem)
-+  (UNSPECV_ATOMIC_FETCH_OP     204)    ;; atomic fetch op
- ])
- 
- (define_c_enum "unspec" [
-@@ -79,7 +84,7 @@ 
- ;; bshift 	Shift operations
- 
- (define_attr "type"
--  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap"
-+  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap,atomic"
-   (const_string "unknown"))
- 
- ;; Main data type used by the insn
-diff --git a/gcc/config/microblaze/sync.md b/gcc/config/microblaze/sync.md
-index db7b11e5379..6478ab6dcac 100644
---- a/gcc/config/microblaze/sync.md
-+++ b/gcc/config/microblaze/sync.md
-@@ -18,26 +18,97 @@ 
- ;; <http://www.gnu.org/licenses/>.
- 
- (define_insn "atomic_compare_and_swapsi"
--  [(match_operand:SI 0 "register_operand" "=&d")	;; bool output
--   (match_operand:SI 1 "register_operand" "=&d")	;; val output
--   (match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
--   (match_operand:SI 3 "register_operand" "d")		;; expected value
--   (match_operand:SI 4 "register_operand" "d")		;; desired value
--   (match_operand:SI 5 "const_int_operand" "")		;; is_weak
--   (match_operand:SI 6 "const_int_operand" "")		;; mod_s
--   (match_operand:SI 7 "const_int_operand" "")		;; mod_f
-+  [(set (match_operand:SI 0 "register_operand" "=&d")		;; bool output
-+        (unspec_volatile:SI
-+          [(match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
-+           (match_operand:SI 3 "register_operand" "d")		;; expected value
-+           (match_operand:SI 4 "register_operand" "d")]		;; desired value
-+          UNSPECV_CAS_BOOL))
-+   (set (match_operand:SI 1 "register_operand" "=&d")		;; val output
-+        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_VAL))
-+   (set (match_dup 2)
-+        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_MEM))
-+   (match_operand:SI 5 "const_int_operand" "")			;; is_weak
-+   (match_operand:SI 6 "const_int_operand" "")			;; mod_s
-+   (match_operand:SI 7 "const_int_operand" "")			;; mod_f
-    (clobber (match_scratch:SI 8 "=&d"))]
-   ""
-   {
--    output_asm_insn ("addc \tr0,r0,r0", operands);
--    output_asm_insn ("lwx  \t%1,%y2,r0", operands);
--    output_asm_insn ("addic\t%8,r0,0", operands);
--    output_asm_insn ("bnei \t%8,.-8", operands);
--    output_asm_insn ("cmp  \t%0,%1,%3", operands);
--    output_asm_insn ("bnei \t%0,.+16", operands);
--    output_asm_insn ("swx  \t%4,%y2,r0", operands);
--    output_asm_insn ("addic\t%8,r0,0", operands);
--    output_asm_insn ("bnei \t%8,.-28", operands);
--    return "";
-+    return "add  \t%0,r0,r0\n\t"
-+      "lwx  \t%1,%y2,r0\n\t"
-+      "addic\t%8,r0,0\n\t"
-+      "bnei \t%8,.-8\n\t"
-+      "cmp  \t%8,%1,%3\n\t"
-+      "bnei \t%8,.+20\n\t"
-+      "swx  \t%4,%y2,r0\n\t"
-+      "addic\t%8,r0,0\n\t"
-+      "bnei \t%8,.-28\n\t"
-+      "addi \t%0,r0,1";
-   }
-+  [(set_attr "type"	"atomic")
-+  (set_attr "mode"	"SI")
-+  (set_attr "length"	"40")]
- )
-+
-+;;
-+;;
-+;;
-+;;
-+(define_insn "atomic_fetch_<atomic_optab>si"
-+  [(set (match_operand:SI 0 "register_operand" "=&d")
-+	(match_operand:SI 1 "memory_operand" "+Q"))
-+   (set (match_dup 1)
-+	(unspec_volatile:SI
-+	  [(any_atomic:SI (match_dup 1)
-+		   (match_operand:SI 2 "register_operand" "d"))
-+	   (match_operand:SI 3 "const_int_operand")] ;; model
-+	 UNSPECV_ATOMIC_FETCH_OP))
-+   (clobber (match_scratch:SI 4 "=&d"))]	  ;; tmp_1
-+  ""
-+  {
-+    return 
-+      "lwx  \t%0,%y1,r0\n\t"
-+      "addic\t%4,r0,0\n\t"
-+      "bnei \t%4,.-8\n\t"
-+      "<atomic_optab>\t%4,%0,%2\n\t"
-+      "swx  \t%4,%y1,r0\n\t"
-+      "addic\t%4,r0,0\n\t"
-+      "bnei \t%4,.-24";
-+  }
-+  [(set_attr "type"	"atomic")
-+  (set_attr "mode"	"SI")
-+  (set_attr "length"	"28")])
-+
-+;;
-+;; MicroBlaze only supports lx/sx instructions for word mode only
-+;;
-+;; Use shift|mask magic to implement atomic_test_and_set using lwx/swx
-+;;
-+(define_expand "atomic_test_and_set"
-+  [(match_operand:QI 0 "register_operand" "")    ;; bool output
-+   (match_operand:QI 1 "memory_operand" "m")    ;; memory
-+   (match_operand:SI 2 "const_int_operand" "")]  ;; model
-+  ""
-+{
-+  rtx old = gen_reg_rtx (SImode);
-+  rtx mem = operands[1];
-+  rtx model = operands[2];
-+  rtx set = gen_reg_rtx (SImode);
-+  rtx aligned_mem = gen_reg_rtx (SImode);
-+  rtx shift = gen_reg_rtx (SImode);
-+
-+  microblaze_subword_address (mem, &aligned_mem, &shift);
-+
-+  emit_move_insn (set, GEN_INT (1));
-+  rtx shifted_set = gen_reg_rtx (SImode);
-+
-+  emit_move_insn (shifted_set, gen_rtx_ASHIFT (SImode, set, shift));
-+
-+  emit_insn (gen_atomic_fetch_orsi (old, aligned_mem, shifted_set, model));
-+
-+  emit_move_insn (old, gen_rtx_ASHIFTRT (SImode, old, shift));
-+
-+  emit_move_insn (operands[0], gen_lowpart (QImode, old));
-+
-+  DONE;
-+})
--- 
-2.43.5
-
diff --git a/package/gcc-bare-metal/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch b/package/gcc-bare-metal/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
deleted file mode 100644
index f9f983b464..0000000000
--- a/package/gcc-bare-metal/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
+++ /dev/null
@@ -1,261 +0,0 @@
-From daa3e1ead791bc58208043cfc4595ba1a78cdd34 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Fri, 21 Nov 2025 16:25:58 +0100
-Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
-
-The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
-and c++26.
-
-I see the u8 string literals are mixed e.g. with strerror, so in
--fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
-the u8 literals everywhere are worth it either.
-
-2025-11-21  Jakub Jelinek  <jakub@redhat.com>
-
-	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
-	char in argument type.
-	(MessageBuffer::Space): Revert 2025-11-15 change.
-	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
-	with char8_t const * type of first argument.
-	(Packet::Packet): Similarly for first argument.
-	* client.cc (CommunicationError, Client::ProcessResponse,
-	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
-	IncludeTranslateResponse): Cast u8 string literals to (const char *)
-	where needed.
-	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
-
-(cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
-Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=daa3e1ead791bc58208043cfc4595ba1a78cdd34
----
- libcody/client.cc | 36 +++++++++++++++++++-----------------
- libcody/cody.hh   | 22 ++++++++++++++++++++++
- libcody/server.cc | 28 ++++++++++++++--------------
- 3 files changed, 55 insertions(+), 31 deletions(-)
-
-diff --git a/libcody/client.cc b/libcody/client.cc
-index ae69d190cb7..147fecdbe50 100644
---- a/libcody/client.cc
-+++ b/libcody/client.cc
-@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
- 
- static Packet CommunicationError (int err)
- {
--  std::string e {u8"communication error:"};
-+  std::string e {(const char *) u8"communication error:"};
-   e.append (strerror (err));
- 
-   return Packet (Client::PC_ERROR, std::move (e));
-@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
-     {
-       if (e == EINVAL)
- 	{
--	  std::string msg (u8"malformed string '");
-+	  std::string msg ((const char *) u8"malformed string '");
- 	  msg.append (words[0]);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  return Packet (Client::PC_ERROR, std::move (msg));
- 	}
-       else
--	return Packet (Client::PC_ERROR, u8"missing response");
-+	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
-     }
- 
-   Assert (!words.empty ());
--  if (words[0] == u8"ERROR")
-+  if (words[0] == (const char *) u8"ERROR")
-     return Packet (Client::PC_ERROR,
--		   words.size () == 2 ? words[1]: u8"malformed error response");
-+		   words.size () == 2 ? words[1]
-+		   : (const char *) u8"malformed error response");
- 
-   if (isLast && !read.IsAtEnd ())
-     return Packet (Client::PC_ERROR,
--		   std::string (u8"unexpected extra response"));
-+		   std::string ((const char *) u8"unexpected extra response"));
- 
-   Assert (code < Detail::RC_HWM);
-   Packet result (responseTable[code] (words));
-   result.SetRequest (code);
-   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
-     {
--      std::string msg {u8"malformed response '"};
-+      std::string msg {(const char *) u8"malformed response '"};
- 
-       read.LexedLine (msg);
--      msg.append (u8"'");
-+      msg.append ((const char *) u8"'");
-       result.GetString () = std::move (msg);
-     }
-   else if (result.GetCode () == Client::PC_CONNECT)
-@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
- 			  size_t alen, size_t ilen)
- {
-   write.BeginLine ();
--  write.AppendWord (u8"HELLO");
-+  write.AppendWord ((const char *) u8"HELLO");
-   write.AppendInteger (Version);
-   write.AppendWord (agent, true, alen);
-   write.AppendWord (ident, true, ilen);
-@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
- // HELLO $version $agent [$flags]
- Packet ConnectResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
-+  if (words[0] == (const char *) u8"HELLO"
-+      && (words.size () == 3 || words.size () == 4))
-     {
-       char *eptr;
-       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
-@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
- // PATHNAME $dir | ERROR
- Packet PathnameResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"PATHNAME" && words.size () == 2)
-+  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
-     return Packet (Client::PC_PATHNAME, std::move (words[1]));
- 
-   return Packet (Client::PC_ERROR, u8"");
-@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
- // OK or ERROR
- Packet OKResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"OK")
-+  if (words[0] == (const char *) u8"OK")
-     return Packet (Client::PC_OK);
-   else
-     return Packet (Client::PC_ERROR,
-@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
- // PATHNAME $cmifile
- Packet IncludeTranslateResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"BOOL" && words.size () == 2)
-+  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
-     {
--      if (words[1] == u8"FALSE")
--	return Packet (Client::PC_BOOL, 0);
--      else if (words[1] == u8"TRUE")
-+      if (words[1] == (const char *) u8"FALSE")
-+	return Packet (Client::PC_BOOL);
-+      else if (words[1] == (const char *) u8"TRUE")
- 	return Packet (Client::PC_BOOL, 1);
-       else
- 	return Packet (Client::PC_ERROR, u8"");
-diff --git a/libcody/cody.hh b/libcody/cody.hh
-index 789ce9e70b7..93bce93aa94 100644
---- a/libcody/cody.hh
-+++ b/libcody/cody.hh
-@@ -47,12 +47,21 @@ namespace Detail  {
- 
- // C++11 doesn't have utf8 character literals :(
- 
-+#if __cpp_char8_t >= 201811
-+template<unsigned I>
-+constexpr char S2C (char8_t const (&s)[I])
-+{
-+  static_assert (I == 2, "only single octet strings may be converted");
-+  return s[0];
-+}
-+#else
- template<unsigned I>
- constexpr char S2C (char const (&s)[I])
- {
-   static_assert (I == 2, "only single octet strings may be converted");
-   return s[0];
- }
-+#endif
- 
- /// Internal buffering class.  Used to concatenate outgoing messages
- /// and Lex incoming ones.
-@@ -123,6 +132,13 @@ public:
-       Space ();
-     Append (str, maybe_quote, len);
-   }
-+#if __cpp_char8_t >= 201811
-+  void AppendWord (char8_t const *str, bool maybe_quote = false,
-+		   size_t len = ~size_t (0))
-+  {
-+    AppendWord ((const char *) str, maybe_quote, len);
-+  }
-+#endif
-   /// Add a word as with AppendWord
-   /// @param str the string to append
-   /// @param maybe_quote string might need quoting, as for Append
-@@ -264,6 +280,12 @@ public:
-     : string (s), cat (STRING), code (c)
-   {
-   }
-+#if __cpp_char8_t >= 201811
-+  Packet (unsigned c, const char8_t *s)
-+    : string ((const char *) s), cat (STRING), code (c)
-+  {
-+  }
-+#endif
-   Packet (unsigned c, std::vector<std::string> &&v)
-     : vector (std::move (v)), cat (VECTOR), code (c)
-   {
-diff --git a/libcody/server.cc b/libcody/server.cc
-index e2fa069bb93..c18469fae84 100644
---- a/libcody/server.cc
-+++ b/libcody/server.cc
-@@ -36,12 +36,12 @@ static RequestPair
-   const requestTable[Detail::RC_HWM] =
-   {
-     // Same order as enum RequestCode
--    RequestPair {u8"HELLO", nullptr},
--    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
--    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
--    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
--    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
--    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-+    RequestPair {(const char *) u8"HELLO", nullptr},
-+    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
-+    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
-+    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
-+    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
-+    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-   };
- }
- 
-@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
- 	  std::string msg;
- 
- 	  if (err > 0)
--	    msg = u8"error processing '";
-+	    msg = (const char *) u8"error processing '";
- 	  else if (ix >= Detail::RC_HWM)
--	    msg = u8"unrecognized '";
-+	    msg = (const char *) u8"unrecognized '";
- 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
--	    msg = u8"already connected '";
-+	    msg = (const char *) u8"already connected '";
- 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
--	    msg = u8"not connected '";
-+	    msg = (const char *) u8"not connected '";
- 	  else
--	    msg = u8"malformed '";
-+	    msg = (const char *) u8"malformed '";
- 
- 	  read.LexedLine (msg);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  if (err > 0)
- 	    {
--	      msg.append (u8" ");
-+	      msg.append ((const char *) u8" ");
- 	      msg.append (strerror (err));
- 	    }
- 	  resolver->ErrorResponse (this, std::move (msg));
-@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
-     return nullptr;
- 
-   if (words.size () == 3)
--    words.emplace_back (u8"");
-+    words.emplace_back ((const char *) u8"");
-   unsigned version = ParseUnsigned (words[1]);
-   if (version == ~0u)
-     return nullptr;
--- 
-2.54.0
-
diff --git a/package/gcc-bare-metal/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch b/package/gcc-bare-metal/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
deleted file mode 100644
index e48dd91c18..0000000000
--- a/package/gcc-bare-metal/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 046776dac7cc74bdbab36f450af80644a045858a Mon Sep 17 00:00:00 2001
-From: Andrew Pinski <quic_apinski@quicinc.com>
-Date: Mon, 25 Nov 2024 14:03:27 -0800
-Subject: [PATCH] build: Move sstream and memory include above safe-ctype.h
- [PR124830]
-
-This picks r15-5661-gf6e00226a4ca6 to older branches, also moving
-the <memory> include to fix build issues with a C++20 host compiler.
-
-sstream in some versions of libstdc++ include locale which might not have been
-included yet. safe-ctype.h defines the toupper, tolower, etc. as macros so the
-c++ header files needed to be included before hand as comment in system.h says:
-/* Include C++ standard headers before "safe-ctype.h" to avoid GCC
-   poisoning the ctype macros through safe-ctype.h */
-
-I don't understand how it was working before when memory was included after
-safe-ctype.h rather than before. But this makes sstream consistent with the
-other C++ headers.
-
-gcc/ChangeLog:
-
-	PR target/117771
-	PR c/124830
-	* system.h: Move the include of sstream and memory above safe-ctype.h.
-
-Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
-Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
-Upstream: https://gcc.gnu.org/git?p=gcc.git;a=commit;h=046776dac7cc74bdbab36f450af80644a045858a
----
- gcc/system.h | 21 +++++++++------------
- 1 file changed, 9 insertions(+), 12 deletions(-)
-
-diff --git a/gcc/system.h b/gcc/system.h
-index b18482c7190..da331f105ba 100644
---- a/gcc/system.h
-+++ b/gcc/system.h
-@@ -222,6 +222,15 @@ extern int fprintf_unlocked (FILE *, const char *, ...);
- #ifdef INCLUDE_FUNCTIONAL
- # include <functional>
- #endif
-+#ifdef INCLUDE_SSTREAM
-+# include <sstream>
-+#endif
-+/* Some of the headers included by <memory> can use "abort" within a
-+   namespace, e.g. "_VSTD::abort();", which fails after we use the
-+   preprocessor to redefine "abort" as "fancy_abort" below.  */
-+#ifdef INCLUDE_MEMORY
-+# include <memory>
-+#endif
- # include <cstring>
- # include <initializer_list>
- # include <new>
-@@ -758,22 +767,10 @@ private:
- #define LIKELY(x) (__builtin_expect ((x), 1))
- #define UNLIKELY(x) (__builtin_expect ((x), 0))
- 
--/* Some of the headers included by <memory> can use "abort" within a
--   namespace, e.g. "_VSTD::abort();", which fails after we use the
--   preprocessor to redefine "abort" as "fancy_abort" below.  */
--
--#ifdef INCLUDE_MEMORY
--# include <memory>
--#endif
--
- #ifdef INCLUDE_MUTEX
- # include <mutex>
- #endif
- 
--#ifdef INCLUDE_SSTREAM
--# include <sstream>
--#endif
--
- #ifdef INCLUDE_MALLOC_H
- #if defined(HAVE_MALLINFO) || defined(HAVE_MALLINFO2)
- #include <malloc.h>
--- 
-2.54.0
-
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
index d6db148430..972ce41534 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.hash
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -1,5 +1,5 @@
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
-sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.4.0/sha512.sum
+sha512  725ed8bdd43ef1726ffe8b5e8615a13e247fac9575b7626ae013a2975d000ea213212dc414b2f2631ac4785c1c8beca85555222faf9904d3b2fa6a3807a83a15  gcc-14.4.0.tar.xz
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index a69d86057e..27c778d4ed 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCC_BARE_METAL_VERSION = 14.3.0
+GCC_BARE_METAL_VERSION = 14.4.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
