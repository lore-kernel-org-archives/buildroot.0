Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53F6C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74067811C6;
	Fri, 14 Aug 2026 13:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrsGOjf4nTxr; Fri, 14 Aug 2026 13:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A6B78126A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713595;
	bh=fj9EiKyllBchdmdA9S79UjM1wSuNwWIFxX/2a0pD01Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IxXM55cxy6XE5opEzQHS3ldDJbJocXX1dpsWFWI3l5dVkq39f/eXGt06PLZVWIirs
	 J4EwB+OwgclNd88syO0LumcTzju0ecF6T4B/7j4NvkMg/nGS8ZEG8/J8zJkLwln7RM
	 grcZCgO7lpFJ7cN8BBPdag2gMhUuNnmKg9cw1dANyz404z3V/DDtOrnjaqZNcJy3ka
	 0v445ez3myzdIhf/kYBWYjBvUmnA51lldwF3A+ITh0ZyZlOt4ndlB1FCkCDyCmLfZN
	 Z6sk5xiDvmcU79DHqC3jDWlCCUAYMUkrGJE6NIIQPZQ4MUElwe371eHApxBeDsgRAI
	 8iTG5EnutpPTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A6B78126A;
	Fri, 14 Aug 2026 13:19:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D9523F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8EF440C36
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6QOB5xs0ZVe for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D411C40C34
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D411C40C34
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8AB08D66A; Fri, 14 Aug 2026 13:18:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 10:28:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 46aa6a905e1810b3436d7d581e87fffa630a4532
X-Git-Newrev: 0e71eaf8ffaf82b11a310f17d68b2df929733b33
X-Patchwork-Hint: ignore
Message-Id: <20260814131855.D8AB08D66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: fix for
 noMMU targets using FLAT binaries
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e71eaf8ffaf82b11a310f17d68b2df929733b33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 35d3927e85645d0dbfe608bd5954bfa6704200e8)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...store-PAGE_SHIFT-fallback-for-binfmt_flat.patch | 169 +++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/package/uclibc/0001-pagesize-restore-PAGE_SHIFT-fallback-for-binfmt_flat.patch b/package/uclibc/0001-pagesize-restore-PAGE_SHIFT-fallback-for-binfmt_flat.patch
new file mode 100644
index 0000000000..fdfd286042
--- /dev/null
+++ b/package/uclibc/0001-pagesize-restore-PAGE_SHIFT-fallback-for-binfmt_flat.patch
@@ -0,0 +1,169 @@
+From 7730f0d05a51cd89a7123bd696e4638c3c035d7b Mon Sep 17 00:00:00 2001
+From: Ramin Moussavi <ramin.moussavi@yacoub.de>
+Date: Fri, 29 May 2026 19:47:34 +0200
+Subject: [PATCH] pagesize: restore PAGE_SHIFT fallback for binfmt_flat (no
+ auxv)
+
+binfmt_flat builds the initial process stack from only argc/argv/envp;
+it does not place an auxiliary vector. Commit 487af1498 ("drop
+__pagesize, make _dl_pagesize the single source of truth") assumed
+AT_PAGESZ is always supplied by the kernel and changed the _dl_pagesize
+fallback from PAGE_SIZE to 0. On noMMU/FLAT targets that leaves
+_dl_pagesize == 0, so every mmap-based malloc rounds its length to 0,
+mmap() fails with EINVAL and the first allocation aborts -- busybox dies
+with "init: out of memory" before it can run anything.
+
+Restore the fallback that arc/nds32 bits/uClibc_page.h have always
+documented ("_dl_pagesize = auxvt[AT_PAGESZ].a_un.a_val ? : PAGE_SIZE"),
+expressed as (1UL << PAGE_SHIFT) so it keeps working now that PAGE_SIZE
+is no longer defined in <bits/uClibc_page.h>:
+
+  - Seed _dl_pagesize with (1UL << PAGE_SHIFT) at its definition in the
+    two translation units that own the symbol: the dynamic linker
+    (ldso.c, used by ld.so) and the static-libc support (dl-support.c).
+  - Override it from AT_PAGESZ only when that entry is actually present
+    (a_type == AT_PAGESZ) and non-zero, instead of unconditionally
+    resetting it to 0.
+
+libdl.c (!SHARED) previously also defined _dl_pagesize. That was
+harmless while dl-support.c's definition was tentative (the two merged),
+but giving both a non-zero initializer makes them two strong .data
+definitions, which collide as "multiple definition of `_dl_pagesize'"
+when a static link pulls both objects out of libc.a (e.g. NPTL builds
+that drag in libdl). Drop the redundant libdl.c definition: dl-support.c
+is always co-linked from libc.a and provides the symbol.
+
+For FLAT, skip the aux-vector scan in __uClibc_main() altogether: there
+is nothing valid past the envp NULL, so _dl_aux_init() is not called and
+_dl_auxv_start stays NULL. Guard getauxval()'s slow-path loop against
+that NULL so a lookup of an uncached (>= AUX_MAX_AT_ID) tag returns
+ENOENT instead of dereferencing NULL.
+
+Verified on riscv32 noMMU/FLAT (gcc 15.2.0, linux 6.18.33): busybox
+boots as init and the testsuite runs (was "init: out of memory"
+before). Dynamic + NPTL links are unaffected -- x86_64 NPTL static
+busybox links cleanly and ld-uClibc loads the testsuite.
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/7730f0d05a51cd89a7123bd696e4638c3c035d7b
+Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ ldso/ldso/ldso.c                    | 7 ++++---
+ ldso/libdl/libdl.c                  | 2 +-
+ libc/misc/auxvt/getauxval.c         | 3 ++-
+ libc/misc/elf/dl-support.c          | 7 ++++---
+ libc/misc/internals/__uClibc_main.c | 7 +++++--
+ 5 files changed, 16 insertions(+), 10 deletions(-)
+
+diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
+index 9c00e4a61..55f7d7e45 100755
+--- a/ldso/ldso/ldso.c
++++ b/ldso/ldso/ldso.c
+@@ -52,7 +52,7 @@ char *_dl_library_path         = NULL;	/* Where we look for libraries */
+ char *_dl_preload              = NULL;	/* Things to be loaded before the libs */
+ #endif
+ int _dl_errno                  = 0;	/* We can't use the real errno in ldso */
+-size_t _dl_pagesize            = 0;	/* Store the page size for use later */
++size_t _dl_pagesize            = (1UL << PAGE_SHIFT);	/* fallback; overridden from AT_PAGESZ if present */
+ struct r_debug *_dl_debug_addr = NULL;	/* Used to communicate with the gdb debugger */
+ void *(*_dl_malloc_function) (size_t size) = NULL;
+ void (*_dl_free_function) (void *p) = NULL;
+@@ -460,8 +460,9 @@ void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
+ 
+ 	_dl_memset(app_tpnt, 0, sizeof(*app_tpnt));
+ 
+-	/* Store the page size for later use */
+-	_dl_pagesize = (_dl_auxvt[AT_PAGESZ].a_un.a_val) ? (size_t) _dl_auxvt[AT_PAGESZ].a_un.a_val : 0;
++	/* Override the fallback only if AT_PAGESZ is present and non-zero */
++	if (_dl_auxvt[AT_PAGESZ].a_type == AT_PAGESZ && _dl_auxvt[AT_PAGESZ].a_un.a_val)
++		_dl_pagesize = (size_t) _dl_auxvt[AT_PAGESZ].a_un.a_val;
+ 	/* Make it so _dl_malloc can use the page of memory we have already
+ 	 * allocated.  We shouldn't need to grab any more memory.  This must
+ 	 * be first since things like _dl_dprintf() use _dl_malloc()...
+diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
+index b78d6d9a3..f28801d7b 100644
+--- a/ldso/libdl/libdl.c
++++ b/ldso/libdl/libdl.c
+@@ -109,7 +109,7 @@ void (*_dl_free_function) (void *p);
+ char *_dl_library_path         = NULL;         /* Where we look for libraries */
+ #endif
+ int _dl_errno                  = 0;         /* We can't use the real errno in ldso */
+-size_t _dl_pagesize            = 0; /* Store the page size for use later */
++/* _dl_pagesize is provided by dl-support.c (always co-linked from libc.a) */
+ /* This global variable is also to communicate with debuggers such as gdb. */
+ struct r_debug *_dl_debug_addr = NULL;
+ 
+diff --git a/libc/misc/auxvt/getauxval.c b/libc/misc/auxvt/getauxval.c
+index 7610b7e5c..4af637071 100755
+--- a/libc/misc/auxvt/getauxval.c
++++ b/libc/misc/auxvt/getauxval.c
+@@ -33,7 +33,8 @@ unsigned long int __getauxval (unsigned long int __type)
+ 	}
+ 
+ 	// Otherwise we have to iterate the auxiliary vector.
+-	for (ElfW(auxv_t) *entry = _dl_auxv_start; entry->a_type != AT_NULL; entry++)
++	// _dl_auxv_start is NULL when there is no aux vector (e.g. FLAT).
++	for (ElfW(auxv_t) *entry = _dl_auxv_start; entry && entry->a_type != AT_NULL; entry++)
+ 		if (entry->a_type == __type)
+ 			return entry->a_un.a_val;
+ 
+diff --git a/libc/misc/elf/dl-support.c b/libc/misc/elf/dl-support.c
+index 738f0ed3a..7ad57c090 100644
+--- a/libc/misc/elf/dl-support.c
++++ b/libc/misc/elf/dl-support.c
+@@ -30,7 +30,7 @@ void (*_dl_init_static_tls) (struct link_map *) = &_dl_nothread_init_static_tls;
+ 
+ ElfW(Phdr) *_dl_phdr;
+ size_t _dl_phnum;
+-size_t _dl_pagesize;
++size_t _dl_pagesize = (1UL << PAGE_SHIFT);	/* fallback; overridden from AT_PAGESZ if present */
+ 
+ ElfW(auxv_t) _dl_auxvt[AUX_MAX_AT_ID];
+ ElfW(auxv_t) *_dl_auxv_start;
+@@ -52,8 +52,9 @@ void internal_function _dl_aux_init (ElfW(auxv_t) *av)
+    /* Get the number of program headers from the aux vect */
+    _dl_phnum = (size_t) _dl_auxvt[AT_PHNUM].a_un.a_val;
+ 
+-   /* Get the pagesize from the aux vect */
+-   _dl_pagesize = (_dl_auxvt[AT_PAGESZ].a_un.a_val) ? (size_t) _dl_auxvt[AT_PAGESZ].a_un.a_val : 0;
++   /* Override the fallback only if AT_PAGESZ is present and non-zero */
++   if (_dl_auxvt[AT_PAGESZ].a_type == AT_PAGESZ && _dl_auxvt[AT_PAGESZ].a_un.a_val)
++      _dl_pagesize = (size_t) _dl_auxvt[AT_PAGESZ].a_un.a_val;
+ }
+ 
+ #if defined(USE_TLS) && USE_TLS
+diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
+index 35cb73fcc..549606505 100644
+--- a/libc/misc/internals/__uClibc_main.c
++++ b/libc/misc/internals/__uClibc_main.c
+@@ -369,7 +369,7 @@ void __uClibc_main(int (*main)(int, char **, char **), int argc,
+ 		    char **argv, void (*app_init)(void), void (*app_fini)(void),
+ 		    void (*rtld_fini)(void), void *stack_end attribute_unused)
+ {
+-#ifndef SHARED
++#if !defined(SHARED) && !defined(__UCLIBC_FORMAT_FLAT__)
+     unsigned long *aux_dat;
+ #endif
+ 
+@@ -395,7 +395,9 @@ void __uClibc_main(int (*main)(int, char **, char **), int argc,
+     }
+ 
+ #ifndef SHARED
+-    /* Pull stuff from the ELF header when possible */
++# ifndef __UCLIBC_FORMAT_FLAT__
++    /* Pull stuff from the ELF header when possible. binfmt_flat passes no
++       aux vector, so skip this for FLAT. */
+     aux_dat = (unsigned long*)__environ;
+     while (*aux_dat) {
+ 	aux_dat++;
+@@ -404,6 +406,7 @@ void __uClibc_main(int (*main)(int, char **, char **), int argc,
+     /* Get the program headers (_dl_phdr) from the aux vector
+        It will be used into __libc_setup_tls. */
+     _dl_aux_init ((ElfW(auxv_t) *)aux_dat);
++# endif
+ #endif
+ 
+     /* We need to initialize uClibc.  If we are dynamically linked this
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
