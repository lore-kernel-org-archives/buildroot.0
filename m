Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CBCEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 04:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC01C41A2A;
	Fri, 11 Aug 2023 04:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC01C41A2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvCOqVEOfhWq; Fri, 11 Aug 2023 04:59:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72B2C41DA6;
	Fri, 11 Aug 2023 04:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B2C41DA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C55B21BF28A
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 04:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C33F60BCC
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 04:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C33F60BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xz30znhn4Hsm for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 04:59:31 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DC7D60AAD
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 04:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC7D60AAD
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BFAB43525336; Fri, 11 Aug 2023 06:59:26 +0200 (CEST)
Date: Fri, 11 Aug 2023 06:59:26 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNXALiTVL/2v4YXv@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691729966; bh=77hsQ9ytRyIVNNa2HE/GQPOT5fInBDZp98XUlXrLH/o=;
 h=Date:From:To:Subject:From;
 b=aXN/1ahuP0bNFaCauX3G/zAeJMwkdRABk/7GF9HVrsG53F8c+cvrG1MDsEqLrMkMu
 SOOF1SWIkwvu0G4kI/wjsjTGulWKa53PmpwhOEY5dontFgvgugwhV/kgxkGKa+XZVb
 CJ0IIAzfDYVj+cnFrQB7PUqQ3AAUiSd37JaUWaY77BvgBiHUUBDJlyjJxJeOwLk0n1
 +MfnriLPVeVB1AUKvcHYSPvCEND7VOfs36a/lwuuO+dMwUSjRdYYd6E1tCdVlr1giU
 KX9D1urBp1iVcSghtJQ3BfIPVrmKCKRnHXly/U9xHhaP3qUVnSPEgZ7bgxjBw2/3d+
 JsYKRsI0C7waA==
Subject: [Buildroot] [PATCH/next] package/glibc: enable for m68k with MMU
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For qemu-system-m68k with emulates Q800 machine we need to add a patch
for glibc to let it compile and run on m68k cpu m68040.
See here for original author of the patches and discussions about the issue:
https://sourceware.org/bugzilla/show_bug.cgi?id=30740

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...-and-runtime-issues-targeting-m68k-m.patch | 261 ++++++++++++++++++
 package/glibc/Config.in                       |   1 +
 2 files changed, 262 insertions(+)
 create mode 100644 package/glibc/0001-m68k-fix-compile-and-runtime-issues-targeting-m68k-m.patch

diff --git a/package/glibc/0001-m68k-fix-compile-and-runtime-issues-targeting-m68k-m.patch b/package/glibc/0001-m68k-fix-compile-and-runtime-issues-targeting-m68k-m.patch
new file mode 100644
index 0000000000..8ff2a8936b
--- /dev/null
+++ b/package/glibc/0001-m68k-fix-compile-and-runtime-issues-targeting-m68k-m.patch
@@ -0,0 +1,261 @@
+From c7b833c812a3e6aac9fcbceaf1e6e1700d4c994d Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 11 Aug 2023 04:33:29 +0200
+Subject: [PATCH] m68k: fix compile and runtime issues targeting m68k
+ m68040 cpu
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://sourceware.org/bugzilla/show_bug.cgi?id=30740
+---
+ sysdeps/m68k/m680x0/bits/flt-eval-method.h |  25 ---
+ sysdeps/m68k/m680x0/lshift.S               | 168 ---------------------
+ sysdeps/m68k/m680x0/m68020/wordcopy.S      |   1 -
+ sysdeps/m68k/wordcopy.c                    |  21 +++
+ 4 files changed, 21 insertions(+), 194 deletions(-)
+ delete mode 100644 sysdeps/m68k/m680x0/bits/flt-eval-method.h
+ delete mode 100644 sysdeps/m68k/m680x0/lshift.S
+ delete mode 100644 sysdeps/m68k/m680x0/m68020/wordcopy.S
+ create mode 100644 sysdeps/m68k/wordcopy.c
+
+diff --git a/sysdeps/m68k/m680x0/bits/flt-eval-method.h b/sysdeps/m68k/m680x0/bits/flt-eval-method.h
+deleted file mode 100644
+index bbee583a4f..0000000000
+--- a/sysdeps/m68k/m680x0/bits/flt-eval-method.h
++++ /dev/null
+@@ -1,25 +0,0 @@
+-/* Define __GLIBC_FLT_EVAL_METHOD.  M68K version.
+-   Copyright (C) 2016-2023 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <https://www.gnu.org/licenses/>.  */
+-
+-#ifndef _MATH_H
+-# error "Never use <bits/flt-eval-method.h> directly; include <math.h> instead."
+-#endif
+-
+-/* The m68k FPUs evaluate all values in the 96-bit floating-point
+-   format which is also available for the user as 'long double'.  */
+-#define __GLIBC_FLT_EVAL_METHOD	2
+diff --git a/sysdeps/m68k/m680x0/lshift.S b/sysdeps/m68k/m680x0/lshift.S
+deleted file mode 100644
+index 2aee10348e..0000000000
+--- a/sysdeps/m68k/m680x0/lshift.S
++++ /dev/null
+@@ -1,168 +0,0 @@
+-/* mc68020 __mpn_lshift -- Shift left a low-level natural-number integer.
+-
+-Copyright (C) 1996-2023 Free Software Foundation, Inc.
+-
+-This file is part of the GNU MP Library.
+-
+-The GNU MP Library is free software; you can redistribute it and/or modify
+-it under the terms of the GNU Lesser General Public License as published by
+-the Free Software Foundation; either version 2.1 of the License, or (at your
+-option) any later version.
+-
+-The GNU MP Library is distributed in the hope that it will be useful, but
+-WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+-or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
+-License for more details.
+-
+-You should have received a copy of the GNU Lesser General Public License
+-along with the GNU MP Library.  If not, see <https://www.gnu.org/licenses/>.  */
+-
+-/*
+-  INPUT PARAMETERS
+-  res_ptr	(sp + 4)
+-  s_ptr		(sp + 8)
+-  s_size	(sp + 16)
+-  cnt		(sp + 12)
+-*/
+-
+-#include "sysdep.h"
+-#include "asm-syntax.h"
+-
+-#define res_ptr a1
+-#define s_ptr a0
+-#define s_size d6
+-#define cnt d4
+-
+-	TEXT
+-ENTRY(__mpn_lshift)
+-
+-/* Save used registers on the stack.  */
+-	moveml	R(d2)-R(d6)/R(a2),MEM_PREDEC(sp)
+-	cfi_adjust_cfa_offset (6*4)
+-	cfi_rel_offset (R(d2), 0)
+-	cfi_rel_offset (R(d3), 4)
+-	cfi_rel_offset (R(d4), 8)
+-	cfi_rel_offset (R(d5), 12)
+-	cfi_rel_offset (R(d6), 16)
+-	cfi_rel_offset (R(a2), 20)
+-
+-/* Copy the arguments to registers.  */
+-	movel	MEM_DISP(sp,28),R(res_ptr)
+-	movel	MEM_DISP(sp,32),R(s_ptr)
+-	movel	MEM_DISP(sp,36),R(s_size)
+-	movel	MEM_DISP(sp,40),R(cnt)
+-
+-	moveql	#1,R(d5)
+-	cmpl	R(d5),R(cnt)
+-	bne	L(Lnormal)
+-	cmpl	R(s_ptr),R(res_ptr)
+-	bls	L(Lspecial)		/* jump if s_ptr >= res_ptr */
+-#if (defined (__mc68020__) || defined (__NeXT__) || defined(mc68020))
+-	lea	MEM_INDX1(s_ptr,s_size,l,4),R(a2)
+-#else /* not mc68020 */
+-	movel	R(s_size),R(d0)
+-	asll	#2,R(d0)
+-	lea	MEM_INDX(s_ptr,d0,l),R(a2)
+-#endif
+-	cmpl	R(res_ptr),R(a2)
+-	bls	L(Lspecial)		/* jump if res_ptr >= s_ptr + s_size */
+-
+-L(Lnormal:)
+-	moveql	#32,R(d5)
+-	subl	R(cnt),R(d5)
+-
+-#if (defined (__mc68020__) || defined (__NeXT__) || defined(mc68020))
+-	lea	MEM_INDX1(s_ptr,s_size,l,4),R(s_ptr)
+-	lea	MEM_INDX1(res_ptr,s_size,l,4),R(res_ptr)
+-#else /* not mc68000 */
+-	movel	R(s_size),R(d0)
+-	asll	#2,R(d0)
+-	addl	R(s_size),R(s_ptr)
+-	addl	R(s_size),R(res_ptr)
+-#endif
+-	movel	MEM_PREDEC(s_ptr),R(d2)
+-	movel	R(d2),R(d0)
+-	lsrl	R(d5),R(d0)		/* compute carry limb */
+-
+-	lsll	R(cnt),R(d2)
+-	movel	R(d2),R(d1)
+-	subql	#1,R(s_size)
+-	beq	L(Lend)
+-	lsrl	#1,R(s_size)
+-	bcs	L(L1)
+-	subql	#1,R(s_size)
+-
+-L(Loop:)
+-	movel	MEM_PREDEC(s_ptr),R(d2)
+-	movel	R(d2),R(d3)
+-	lsrl	R(d5),R(d3)
+-	orl	R(d3),R(d1)
+-	movel	R(d1),MEM_PREDEC(res_ptr)
+-	lsll	R(cnt),R(d2)
+-L(L1:)
+-	movel	MEM_PREDEC(s_ptr),R(d1)
+-	movel	R(d1),R(d3)
+-	lsrl	R(d5),R(d3)
+-	orl	R(d3),R(d2)
+-	movel	R(d2),MEM_PREDEC(res_ptr)
+-	lsll	R(cnt),R(d1)
+-
+-	dbf	R(s_size),L(Loop)
+-	subl	#0x10000,R(s_size)
+-	bcc	L(Loop)
+-
+-L(Lend:)
+-	movel	R(d1),MEM_PREDEC(res_ptr) /* store least significant limb */
+-
+-/* Restore used registers from stack frame.  */
+-	moveml	MEM_POSTINC(sp),R(d2)-R(d6)/R(a2)
+-	cfi_remember_state
+-	cfi_adjust_cfa_offset (-6*4)
+-	cfi_restore (R(d2))
+-	cfi_restore (R(d3))
+-	cfi_restore (R(d4))
+-	cfi_restore (R(d5))
+-	cfi_restore (R(d6))
+-	cfi_restore (R(a2))
+-	rts
+-
+-/* We loop from least significant end of the arrays, which is only
+-   permissible if the source and destination don't overlap, since the
+-   function is documented to work for overlapping source and destination.  */
+-
+-	cfi_restore_state
+-L(Lspecial:)
+-	clrl	R(d0)			/* initialize carry */
+-	eorw	#1,R(s_size)
+-	lsrl	#1,R(s_size)
+-	bcc	L(LL1)
+-	subql	#1,R(s_size)
+-
+-L(LLoop:)
+-	movel	MEM_POSTINC(s_ptr),R(d2)
+-	addxl	R(d2),R(d2)
+-	movel	R(d2),MEM_POSTINC(res_ptr)
+-L(LL1:)
+-	movel	MEM_POSTINC(s_ptr),R(d2)
+-	addxl	R(d2),R(d2)
+-	movel	R(d2),MEM_POSTINC(res_ptr)
+-
+-	dbf	R(s_size),L(LLoop)
+-	addxl	R(d0),R(d0)		/* save cy in lsb */
+-	subl	#0x10000,R(s_size)
+-	bcs	L(LLend)
+-	lsrl	#1,R(d0)		/* restore cy */
+-	bra	L(LLoop)
+-
+-L(LLend:)
+-/* Restore used registers from stack frame.  */
+-	moveml	MEM_POSTINC(sp),R(d2)-R(d6)/R(a2)
+-	cfi_adjust_cfa_offset (-6*4)
+-	cfi_restore (R(d2))
+-	cfi_restore (R(d3))
+-	cfi_restore (R(d4))
+-	cfi_restore (R(d5))
+-	cfi_restore (R(d6))
+-	cfi_restore (R(a2))
+-	rts
+-END(__mpn_lshift)
+diff --git a/sysdeps/m68k/m680x0/m68020/wordcopy.S b/sysdeps/m68k/m680x0/m68020/wordcopy.S
+deleted file mode 100644
+index 4fb1a4518f..0000000000
+--- a/sysdeps/m68k/m680x0/m68020/wordcopy.S
++++ /dev/null
+@@ -1 +0,0 @@
+-/* Empty, not needed.  */
+diff --git a/sysdeps/m68k/wordcopy.c b/sysdeps/m68k/wordcopy.c
+new file mode 100644
+index 0000000000..1ee1149add
+--- /dev/null
++++ b/sysdeps/m68k/wordcopy.c
+@@ -0,0 +1,21 @@
++/* Definitions for memory copy functions.  Motorola 68020 version.                                                                                                                                                 
++   Copyright (C) 2023 Free Software Foundation, Inc.                                                                                                                                                               
++   This file is part of the GNU C Library.                                                                                                                                                                         
++                                                                                                                                                                                                                   
++   The GNU C Library is free software; you can redistribute it and/or                                                                                                                                              
++   modify it under the terms of the GNU Lesser General Public                                                                                                                                                      
++   License as published by the Free Software Foundation; either                                                                                                                                                    
++   version 2.1 of the License, or (at your option) any later version.                                                                                                                                              
++                                                                                                                                                                                                                   
++   The GNU C Library is distributed in the hope that it will be useful,                                                                                                                                            
++   but WITHOUT ANY WARRANTY; without even the implied warranty of                                                                                                                                                  
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU                                                                                                                                               
++   Lesser General Public License for more details.                                                                                                                                                                 
++                                                                                                                                                                                                                   
++   You should have received a copy of the GNU Lesser General Public                                                                                                                                                
++   License along with the GNU C Library.  If not, see                                                                                                                                                              
++   <https://www.gnu.org/licenses/>.  */                                                                                                                                                                            
++                                                                                                                                                                                                                   
++#if !defined(__mc68020__) && !defined(mc68020)                                                                                                                                                                     
++#include <string/wordcopy.c>                                                                                                                                                                                       
++#endif 
+-- 
+2.39.2
+
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 71c50504ac..bfe83ab6f1 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
+	default y if BR2_m68k_m68k
 	default y if BR2_mips
 	default y if BR2_mipsel
 	default y if BR2_mips64
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
