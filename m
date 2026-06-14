Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A0ECD98C5
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 13:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB0660EA3;
	Sun, 14 Jun 2026 13:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfReADZBeWpc; Sun, 14 Jun 2026 13:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E57A60BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781443770;
	bh=uLxX2vj0jfTHlKYIEzpLtGojXTSyO28aMdm/9tuz4Go=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DUaYCdRp+HsKGb9bW+gMl1lDpKccK0c1iX50aiSVWwRga5d8/iGgqu4SKGSOupXdA
	 LSf7Ey1+Mv1TQbi/1SaAjTzC0oQtpVJJpuTeHFZnJxYOzKaArVS4rjCcGWYH8UcWM9
	 AZkbA153vR9qnStP7Q4MTjbQ3B0uHsNIcx2GAhNGB1cFUBk7GyWSQ/wNnSXB6NmUIM
	 aqfOWWnh6I5Z8yPFTU+uxoRQ+H43wvP1CzwjnbYxf3Eo79Jj0cjuRx1iLc6gEBhAjL
	 9w+ku2EQAtWLGJpI3hE8zLHaB06Ph8CZ9pvuxziC5oTkNa512OSwwcGLVA6pssQS/V
	 lhULvZa0Mpc0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E57A60BC0;
	Sun, 14 Jun 2026 13:29:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED004169
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 13:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE87260BC0
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 13:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLBEGX-ypURA for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 13:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F19760BBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F19760BBF
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F19760BBF
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 13:29:27 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5C9B931E0505; Sun, 14 Jun 2026 15:29:24 +0200 (CEST)
Date: Sun, 14 Jun 2026 15:29:24 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ai6stJaA2hWFBHDW@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1781443764; bh=jGkf2WbwoQPfoDG8T4Lr7dXtItaJZ1MApDStOoAhWwM=;
 h=Date:From:To:Subject:From;
 b=c7xlZ3wDfp4L/TVZlUx+e+7w0U87c7kAT9kAmhQ5zydl0a0HVzmXUw+qJcEB5OzJ5
 9vrecOytZ8A9BA/4G2BHAxVFCdWVjjebNdUvUg54yAD+wDe1ym/3z5fdP6U8Oze3OK
 bHAvfv4x64hRMnH1Jrvl/5hlsBSBY3akbGqNndsaUQfdOVUQQgHvCFHE6/5eTIcufL
 WGg30t1N1Xqp+pRvyCYBaP6oEnfOTVZz/mPTrs0Y/7Gj34ngcXLlkoKUxod2OXeL5W
 iURtJ/PeGZwYCnKAHkBm51H5RG4/BM8owhPvRx8SzCUzrEoI1FQ9Y6Ga6HmKTRuZGe
 nO6UwhjVxfXSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/uclibc: fix for noMMU targets using
 FLAT binaries
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

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...-PAGE_SHIFT-fallback-for-binfmt_flat.patch | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 package/uclibc/0001-pagesize-restore-PAGE_SHIFT-fallback-for-binfmt_flat.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
