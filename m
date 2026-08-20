Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897EDC5DF95
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43A2181758;
	Fri, 21 Aug 2026 15:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ccy4rumv54zT; Fri, 21 Aug 2026 15:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325149;
	bh=FjU7B3K2Mdc4lv5eC+3DisaSAw0CSq8f2aabEvZechk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=paTY96tP9dx0CASYjQSnyW8bDscINIyxY4/MgooBH2/SSaQVyyhb9MN8WkBfXRpaf
	 GnHwpDkj5sRh0/Hi+WU6jn6UCk/nqqflnEvoL5OaT4I0H7DKqhOxt9YB48kt0INAKr
	 P0pUzGjTAU1FECeOygEWOFaBJaOej29i71CFOO/iv5g6S4NuWo2mQSzN6yLsmfz6o0
	 9DG71K6gP/rHlCdPDMrdWMp6rUqPMg+GRkUupn+sA4/IRAmyVklxSmCfGu/FzoAWXf
	 h8XoEvD5nEbO06SP58AoBTAqHdYre0gvieUKzXrn6qDflI0iRm6sJD+jkXoAggCDCq
	 nX8vaeGFWqXQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C9E81EEB;
	Fri, 21 Aug 2026 15:12:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99D8C2BAA
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A16160666
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lqc0qXen9RV for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAF6760884
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DEF58E17F; Fri, 21 Aug 2026 15:10:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 15:03:12 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 5137a02a8a23fd95c1622373b66b3085f909ae56
X-Git-Newrev: 08f74f598b0a4187ad5178b7d6ef709ae858401a
X-Patchwork-Hint: ignore
Message-Id: <20260821151018.1DEF58E17F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/uclibc: Fix SSP
 support for RISCV32
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08f74f598b0a4187ad5178b7d6ef709ae858401a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Add patch pending upstream to fix SSP for RISCV32.

Fixes:
  https://autobuild.buildroot.org/results/1b6/1b6f2161b11390b6545bddbc39b444401c718ebb/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Tested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3c4b5e31df0a8fcbc45c88cb9d0ca4546254d7a7)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../uclibc/0001-Fix-SSP-support-for-riscv32.patch  | 174 +++++++++++++++++++++
 1 file changed, 174 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
