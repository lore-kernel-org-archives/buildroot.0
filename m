Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3420FC5DF94
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 07:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A908780CD3;
	Tue, 25 Aug 2026 07:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dJQmimcxfGv; Tue, 25 Aug 2026 07:00:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787641255;
	bh=iuaEgsCQq95BQWsdiJ9a1gnQi29kfjYAtABV4a+dahg=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r8tShwPtfZwn1o+plKvgpN1m846Ltxtc9F7kM6eF7I+RDM2DFUfkBZrjlA2CY4v9Y
	 NBrVoiKRUxplXskhu/maRkutjVvab/pkuolVRdZsT8jI0gEAoeH8BT3WugqEtz97hW
	 kxaRQUL82mwFoBdJ818lWbAsdzu6/+8s2NX5O+OINcbMni6ern1kAZesPxN6R0u1CZ
	 2ms5Kp4UEaBMsleMdjCzGOUvm+g3qVv9lG2hBnwTPevVEmDdhHxF1WUMozPMy0nUrE
	 vZCi2mDJvYzw76cmo5vxm36ZwhrtUgtvlkGasng9Cit4iWLUmYE+D3TM6mdD4RPWP3
	 xPJZSFBdGIVoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A33D80CBF;
	Tue, 25 Aug 2026 07:00:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DE2435E
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4405A60674
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRX82Lok2HpE for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 07:00:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20FA160667
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1787641247; bh=m8sbl7n9HsyOInDQ+2VW7V2NrMS/ZrNXABtVqIMT4oY=;
 h=Date:From:To:Subject:From;
 b=YPfH57gEZtIwhA7Yb9B3SKgTRA1LOOSbnM52Tfz1GbrmGDTk6TsjGdCYIYOQtRdu8
 NeF3Y0G/N8aR8eOcCPvM5A7DZoYs6aX5Fgemr2g2GTb863Y26AIxPnGZ+7pM+/iQQo
 IirwtXYhMenkzbzCyv0gnNgAVIr35BJjN25rTKSgzAsrdkVGizhNCDvEcjteqjBScT
 oTVslA4Y3NYHI9oTSk9q0Vvq4qViDnDKJGLO8g2v5YHcA2dzYADVIyPvlwdoppxb8E
 Ugk7V7z4zPmluo1ROgFYFOLYHotTUxBEzf/6b0pg9lCVNhtccj1ETuF3CVmqlmvYLc
 qPaYf2Cb98Osg==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0334D31E0CF9; Tue, 25 Aug 2026 09:00:46 +0200 (CEST)
Date: Tue, 25 Aug 2026 09:00:46 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ao09nrk6sTpYtRUY@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/uclibc: fix m68000 toolchain builds
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

Add a patch from Upstream to fix building of a m68000
toolchain.

Fixes:
 - https://autobuild.buildroot.net/results/4cc/4cc0de3d33339bd50792ca224f10dfd18a636b00/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...nel-helper-on-every-core-without-CAS.patch | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch

diff --git a/package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch b/package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch
new file mode 100644
index 0000000000..3ac756f4c7
--- /dev/null
+++ b/package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch
@@ -0,0 +1,116 @@
+From 5222fefffa0270c2f2d50961a4b75ef7f5605c29 Mon Sep 17 00:00:00 2001
+From: ramin <lordrasmus@gmail.com>
+Date: Mon, 24 Aug 2026 13:06:02 +0200
+Subject: [PATCH] m68k: use the kernel helper on every core without CAS, not
+ just ColdFire
+
+The atomic header split the world into ColdFire and "the rest", assuming the
+rest was 68020 and up. That holds for the MMU port, but not for the 68000 and
+68010, which have no atomic read-modify-write instruction either. Building for
+one of them stops at the first cas:
+
+  Error: invalid instruction for this architecture; needs 68020 or higher
+         (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040],
+          68060 [68ec060]) -- statement `cas.l %d0,%d1,(%a1)' ignored
+
+Reported by Waldemar Brodkorb from a Buildroot autobuilder failure; Buildroot
+supports m68000 and has at least one user on it.
+
+Decide by the presence of CAS instead. The instruction came with the 68020, so
+the test is the list of the 68020-and-up cores: gcc defines a separate macro
+per core and does not imply __mc68020__ on the later ones, and __mc68000__ is
+no help because it is defined on every m68k, the 68040 and ColdFire included.
+
+Nothing else changes: the kernel's atomic_cmpxchg_32 is syscall 335 "common"
+in arch/m68k/kernel/syscalls/syscall.tbl and has an implementation for the MMU
+as well as the noMMU port, so the branch the old cores now take is the one
+ColdFire has been using all along - including its documented limit that the
+8- and 16-bit variants stay non-atomic, since the helper is 32-bit only.
+
+Checked with a cross gcc over -m68000, -m68010, -m68020, -m68030, -m68040,
+-m68060, -mcpu=5206 and -mcpu=5208: the three old cores and both ColdFires
+select the helper, the four others select cas, and each branch assembles for
+the cores that select it.
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/5222fefffa0270c2f2d50961a4b75ef7f5605c29
+Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libc/sysdeps/linux/m68k/bits/atomic.h | 32 ++++++++++++++++++---------
+ 1 file changed, 22 insertions(+), 10 deletions(-)
+
+diff --git a/libc/sysdeps/linux/m68k/bits/atomic.h b/libc/sysdeps/linux/m68k/bits/atomic.h
+index cf7fd5f65..6acec1ed8 100644
+--- a/libc/sysdeps/linux/m68k/bits/atomic.h
++++ b/libc/sysdeps/linux/m68k/bits/atomic.h
+@@ -3,13 +3,15 @@
+ 
+    Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
+ 
+-   m68k (68020 and up, which is everything the MMU Linux port runs on) has
+-   the CAS instruction.  We implement the compare-and-exchange primitive
+-   with cas.b/cas.w/cas.l; include/atomic.h derives every higher-level
+-   operation from it.
++   The CAS instruction arrived with the 68020.  Where it exists we implement
++   the compare-and-exchange primitive with cas.b/cas.w/cas.l and let
++   include/atomic.h derive every higher-level operation from it.
+ 
+-   ColdFire has no CAS at all, so there we use the kernel's
+-   atomic_cmpxchg_32 helper, which exists for exactly this reason.
++   ColdFire, 68000 and 68010 have no atomic read-modify-write instruction at
++   all.  There we use the kernel's atomic_cmpxchg_32 helper, which exists for
++   exactly this reason and is available on every m68k (syscall 335, "common"
++   in arch/m68k/kernel/syscalls/syscall.tbl, with an implementation for both
++   the MMU and the noMMU port).
+ 
+    Without this file m68k fell back to the generic non-atomic
+    bits/atomic.h, whose "atomic" compare-and-exchange is a plain
+@@ -22,7 +24,17 @@
+ #define _M68K_BITS_ATOMIC_H	1
+ 
+ #include <stdint.h>
+-#ifdef __mcoldfire__
++
++/* CAS came with the 68020.  gcc sets a separate macro per core and does not
++   imply __mc68020__ on the later ones, hence the list; __mc68000__ is no help
++   here, it is defined on every m68k, the 68040 and ColdFire included.
++   Everything without CAS - ColdFire, 68000, 68010 - uses the kernel helper.  */
++#if defined __mc68020__ || defined __mc68030__ \
++    || defined __mc68040__ || defined __mc68060__
++# define __M68K_HAVE_CAS	1
++#endif
++
++#ifndef __M68K_HAVE_CAS
+ # include <sys/syscall.h>
+ #endif
+ 
+@@ -58,7 +70,7 @@ typedef uintmax_t uatomic_max_t;
+ #define atomic_read_barrier()	atomic_full_barrier ()
+ #define atomic_write_barrier()	atomic_full_barrier ()
+ 
+-#ifndef __mcoldfire__
++#ifdef __M68K_HAVE_CAS
+ 
+ /* cas Dc,Du,<ea>: compare <ea> with Dc; if equal store Du, else load <ea>
+    into Dc.  Either way Dc ends up holding the original *MEM, which is the
+@@ -87,7 +99,7 @@ typedef uintmax_t uatomic_max_t;
+ 		       : "memory");					\
+      __ret; })
+ 
+-#else /* __mcoldfire__ */
++#else /* !__M68K_HAVE_CAS */
+ 
+ /* d0 = syscall number, d1 = newval, d2 = oldval, a0 = mem; the helper
+    returns the previous value.  The swap happens inside the syscall, so
+@@ -116,7 +128,7 @@ typedef uintmax_t uatomic_max_t;
+ #define __arch_compare_and_exchange_val_16_acq(mem, newval, oldval) \
+   __arch_compare_and_exchange_val_8_acq (mem, newval, oldval)
+ 
+-#endif /* __mcoldfire__ */
++#endif /* __M68K_HAVE_CAS */
+ 
+ /* m68k has no 64-bit CAS; NPTL and include/atomic.h only use int- and
+    pointer-sized objects, so the bysize dispatch never reaches this.  */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
