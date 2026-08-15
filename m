Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F151C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 19:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC22E80D73;
	Sat, 15 Aug 2026 19:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1umxFS5_YxLw; Sat, 15 Aug 2026 19:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAFE180D7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786821446;
	bh=htkMyyqhlX2dHE8B1xezYlJySD715wIOLLDx+asnJiY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O6r4AKC93bRDzHOHOeJRLOHS5xL8LQegYaacXqXSs5/sNaDKC6nQ1gbNTOhM3CWOL
	 bqI6XUDSWYLLdsgjb7r9COH9rmyJHpM3IzhmNi5MywlbVu2NVR8hyLTIJsZWm3LnNO
	 MnI1CNIHG4HMr84YQjHuflAvox7uo6riFVY5JYYHr+45ZS/kQJlJ8nNHwwFVwtdNcg
	 12B95ZdVb9HabGTH+azFSG6gusYqJIE37rx0/IojiuOcyvTwRRgHewQkP0YVJ3qVay
	 5D2aMq+MkgehHGCrLCyx2TjxyovURFErjTGdbKiXxof+LNZ7oifvO7txGgE3f5o61l
	 KTwIdh5PYL1eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAFE180D7C;
	Sat, 15 Aug 2026 19:17:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF543337
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E14996062A
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9LqLNll0wAS for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 19:17:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB7CA60625
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB7CA60625
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB7CA60625
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1786821441; bh=RigURvD2mQZmSfto+j0q5P+iWd9x4p2Jb6TWmIEQrjk=;
 h=Date:From:To:Subject:From;
 b=rFcMrxSMkUHh6Qk1fiiLjR9jOt6KwY0Z+r1bPh2/XM0Y3mwnQhPRab7eiyPaoE/7G
 Wa0J8XeUa4JwnE4OVgYxdWlTXRh7Kuq4xKXQ+jc/sYE0lRDJYM/t9heG/qZFtk4Wvb
 hRSyK5+CcXacZds/PExpTb/QIQ/OFuHagZEsyGikZib8wyuAlMSd4JI1Yh2B2feFCq
 RFn/4WnbTWqceWc3KAnQEQE1UVs9ktV67yz9kGzHDUwj7uT8DIhUza4jol1HOogeUj
 SdbJrz+ilTpgCblToRvu9SPAcifOzySDCYnhOvuDBdmp2lesEKKI+WY5Wvy4PAJSuZ
 B9XGZhJ9g4rpg==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 22F4331E0B54; Sat, 15 Aug 2026 21:17:21 +0200 (CEST)
Date: Sat, 15 Aug 2026 21:17:21 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aoC7Qd8pbR8RIl0H@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/uclibc: Fix SSP support for RISCV32
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

Add patch pending upstream to fix SSP for RISCV32.

Fixes:
  https://autobuild.buildroot.org/results/1b6/1b6f2161b11390b6545bddbc39b444401c718ebb/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-Fix-SSP-support-for-riscv32.patch    | 174 ++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100644 package/uclibc/0001-Fix-SSP-support-for-riscv32.patch

diff --git a/package/uclibc/0001-Fix-SSP-support-for-riscv32.patch b/package/uclibc/0001-Fix-SSP-support-for-riscv32.patch
new file mode 100644
index 0000000000..b2e38726f5
--- /dev/null
+++ b/package/uclibc/0001-Fix-SSP-support-for-riscv32.patch
@@ -0,0 +1,174 @@
+From c6efc293a52fdde7d4876243faaaa768fe052719 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 15 Aug 2026 18:20:33 +0200
+Subject: [PATCH] Fix SSP support for riscv32
+
+On modern 32-bit architectures like RISC-V (riscv32), legacy 32-bit
+time syscalls like __NR_gettimeofday are intentionally omitted because
+RV32 implements a strict time64-only ABI to avoid the Year 2038 bug.
+
+Therefore, use AT_RANDOM from the auxiliary vector first, as glibc does,
+to obtain random data for the stack canary. If AT_RANDOM is unavailable,
+fall back to reading random data from /dev/urandom.
+
+Tested with aarch64, riscv32 and riscv32 noMMU targets.
+
+Upstream: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/WIKMWPXJYAPTVVZ2MMZINUJNPIJXBMOE/
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ extra/Configs/Config.in               | 10 -------
+ ldso/include/dl-syscall.h             | 12 --------
+ ldso/ldso/ldso.c                      |  4 ++-
+ libc/misc/internals/__uClibc_main.c   |  4 ++-
+ libc/sysdeps/linux/common/dl-osinfo.h | 40 +++++++++++++++++----------
+ 5 files changed, 32 insertions(+), 38 deletions(-)
+
+diff --git a/extra/Configs/Config.in b/extra/Configs/Config.in
+index c3aabf1b4..15a072593 100644
+--- a/extra/Configs/Config.in
++++ b/extra/Configs/Config.in
+@@ -2211,16 +2211,6 @@ config UCLIBC_HAS_SSP
+ 
+ 	  Most people will answer N.
+ 
+-config SSP_QUICK_CANARY
+-	bool "Use simple guard values without accessing /dev/urandom"
+-	depends on UCLIBC_HAS_SSP
+-	help
+-	  Use gettimeofday(2) to define the __guard without accessing
+-	  /dev/urandom.
+-	  WARNING: This makes smashing stack protector vulnerable to timing
+-	  	attacks.
+-	  Most people will answer N.
+-
+ choice
+ 	prompt "Propolice protection blocking signal"
+ 	depends on UCLIBC_HAS_SSP
+diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
+index c143b8d45..e08b2cd41 100644
+--- a/ldso/include/dl-syscall.h
++++ b/ldso/include/dl-syscall.h
+@@ -260,18 +260,6 @@ _dl_pread(int fd, void *buf, size_t count, off_t offset)
+ }
+ #endif
+ 
+-#ifdef __UCLIBC_HAS_SSP__
+-# include <sys/time.h>
+-# define __NR__dl_gettimeofday __NR_gettimeofday
+-static __always_inline _syscall2(int, _dl_gettimeofday, struct timeval *, tv,
+-# ifdef __USE_BSD
+-                        struct timezone *
+-# else
+-                        void *
+-# endif
+-						, tz)
+-#endif
+-
+ /* Some architectures always use 12 as page shift for mmap2() eventhough the
+  * real PAGE_SHIFT != 12.  Other architectures use the same value as
+  * PAGE_SHIFT...
+diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
+index 55f7d7e45..96ee3d496 100755
+--- a/ldso/ldso/ldso.c
++++ b/ldso/ldso/ldso.c
+@@ -1225,7 +1225,9 @@ of this helper program; chances are you did not intend to run this program.\n\
+ #ifdef __UCLIBC_HAS_SSP__
+ 	_dl_debug_early("Setting up SSP guards\n");
+ 	/* Set up the stack checker's canary.  */
+-	stack_chk_guard = _dl_setup_stack_chk_guard ();
++	stack_chk_guard = _dl_setup_stack_chk_guard (
++		_dl_auxvt[AT_RANDOM].a_type == AT_RANDOM ?
++		(void *)_dl_auxvt[AT_RANDOM].a_un.a_val : NULL);
+ # ifdef THREAD_SET_STACK_GUARD
+ 	THREAD_SET_STACK_GUARD (stack_chk_guard);
+ # else
+diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
+index 549606505..bbf471b17 100644
+--- a/libc/misc/internals/__uClibc_main.c
++++ b/libc/misc/internals/__uClibc_main.c
+@@ -296,7 +296,9 @@ void __uClibc_init(void)
+ #ifndef SHARED
+ # ifdef __UCLIBC_HAS_SSP__
+     /* Set up the stack checker's canary.  */
+-    stack_chk_guard = _dl_setup_stack_chk_guard();
++    stack_chk_guard = _dl_setup_stack_chk_guard(
++    _dl_auxvt[AT_RANDOM].a_type == AT_RANDOM ?
++        (void *)_dl_auxvt[AT_RANDOM].a_un.a_val : NULL);
+ #  ifdef THREAD_SET_STACK_GUARD
+     THREAD_SET_STACK_GUARD (stack_chk_guard);
+ #  else
+diff --git a/libc/sysdeps/linux/common/dl-osinfo.h b/libc/sysdeps/linux/common/dl-osinfo.h
+index 3110cb05d..0a42ea094 100644
+--- a/libc/sysdeps/linux/common/dl-osinfo.h
++++ b/libc/sysdeps/linux/common/dl-osinfo.h
+@@ -21,22 +21,42 @@
+ #  ifdef IS_IN_libc
+ #   include <fcntl.h>
+ #   include <unistd.h>
+-#   include <sys/time.h>
++#   include <string.h>
+ #   define OPEN open
+ #   define READ read
+ #   define CLOSE close
+-#   define GETTIMEOFDAY gettimeofday
++#   define MEMCPY memcpy
+ #  else
++#   include <dl-string.h>
+ #   define OPEN _dl_open
+ #   define READ _dl_read
+ #   define CLOSE _dl_close
+-#   define GETTIMEOFDAY _dl_gettimeofday
++#   define MEMCPY _dl_memcpy
+ #  endif
+ 
+-static __always_inline uintptr_t _dl_setup_stack_chk_guard(void)
++static __always_inline uintptr_t
++_dl_setup_stack_chk_guard(void *dl_random)
+ {
+ 	uintptr_t ret;
+-#  ifndef __SSP_QUICK_CANARY__
++
++	/*
++	 * Linux supplies random data through AT_RANDOM.
++	 * Use it directly when available.
++	 */
++	if (dl_random != NULL) {
++		MEMCPY(&ret, dl_random, sizeof(ret));
++
++#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
++		ret &= ~(uintptr_t)0xff;
++#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
++		ret &= ~((uintptr_t)0xff << (8 * (sizeof(ret) - 1)));
++#else
++# error "Unknown byte order"
++#endif
++
++		return ret;
++	}
++
+ 	{
+ 		int fd = OPEN("/dev/urandom", O_RDONLY, 0);
+ 		if (fd >= 0) {
+@@ -46,18 +66,10 @@ static __always_inline uintptr_t _dl_setup_stack_chk_guard(void)
+ 				return ret;
+ 		}
+ 	}
+-#  endif /* !__SSP_QUICK_CANARY__ */
+ 
+-	/* Start with the "terminator canary". */
++	/* Fallback just the "terminator canary". */
+ 	ret = 0xFF0A0D00UL;
+ 
+-	/* Everything failed? Or we are using a weakened model of the
+-	 * terminator canary */
+-	{
+-		struct timeval tv;
+-		if (GETTIMEOFDAY(&tv, NULL) != (-1))
+-			ret ^= tv.tv_usec ^ tv.tv_sec;
+-	}
+ 	return ret;
+ }
+ # endif /* libc || rtld */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
