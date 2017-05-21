From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 19:41:03 +0200
Subject: [Buildroot] [PATCH/next] package/bdwgc: bump version to 7.6.0
Message-ID: <20170521174103.6779-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream:

0002-Do-not-include-sigcontext.h-and-asm-sigcontext.h.patch
https://github.com/ivmai/bdwgc/commit/c887470e0e3310c81ecdb7e736bc5d2ead45db2a

0003-Revert-Move-asm-machine-dependent-files-to-src-folde.patch
https://github.com/ivmai/bdwgc/commit/5e756d4d8df2949cb3b6e51532d3016cbb276fd7

0004-configure-match-uclinux-pattern.patch
https://github.com/ivmai/bdwgc/commit/a628c90bdbf397465ac2ab2b11f14eb2e853651c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...include-sigcontext.h-and-asm-sigcontext.h.patch |  61 ---
 ...-asm-machine-dependent-files-to-src-folde.patch | 424 ---------------------
 .../0004-configure-match-uclinux-pattern.patch     |  32 --
 package/bdwgc/bdwgc.hash                           |   2 +-
 package/bdwgc/bdwgc.mk                             |   2 +-
 5 files changed, 2 insertions(+), 519 deletions(-)
 delete mode 100644 package/bdwgc/0002-Do-not-include-sigcontext.h-and-asm-sigcontext.h.patch
 delete mode 100644 package/bdwgc/0003-Revert-Move-asm-machine-dependent-files-to-src-folde.patch
 delete mode 100644 package/bdwgc/0004-configure-match-uclinux-pattern.patch

diff --git a/package/bdwgc/0002-Do-not-include-sigcontext.h-and-asm-sigcontext.h.patch b/package/bdwgc/0002-Do-not-include-sigcontext.h-and-asm-sigcontext.h.patch
deleted file mode 100644
index 40c906310..000000000
--- a/package/bdwgc/0002-Do-not-include-sigcontext.h-and-asm-sigcontext.h.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From c887470e0e3310c81ecdb7e736bc5d2ead45db2a Mon Sep 17 00:00:00 2001
-From: Ivan Maidanski <ivmai@mail.ru>
-Date: Mon, 6 Apr 2015 20:06:47 +0300
-Subject: [PATCH 1/1] Do not include sigcontext.h and asm/sigcontext.h (these
- Linux headers define sigcontext which is no longer used as replaced with
- ucontext_t in GC 7.0alpha1)
-
-* os_dep.c: Do not include linux/version.h (do not test
-LINUX_VERSION_CODE), asm/signal.h, sigcontext.h, asm/sigcontext.h
-since struct sigcontext not used in GC v7+.
-
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-Upstream-status: backport
----
- os_dep.c | 30 ------------------------------
- 1 file changed, 30 deletions(-)
-
-diff --git a/os_dep.c b/os_dep.c
-index f62d4ed..a1bafbd 100644
---- a/os_dep.c
-+++ b/os_dep.c
-@@ -16,36 +16,6 @@
- 
- #include "private/gc_priv.h"
- 
--#if defined(LINUX) && !defined(POWERPC) && !defined(NO_SIGCONTEXT_H)
--# include <linux/version.h>
--# if (LINUX_VERSION_CODE <= 0x10400)
--    /* Ugly hack to get struct sigcontext_struct definition.  Required  */
--    /* for some early 1.3.X releases.  Will hopefully go away soon.     */
--    /* in some later Linux releases, asm/sigcontext.h may have to       */
--    /* be included instead.                                             */
--#   define __KERNEL__
--#   include <asm/signal.h>
--#   undef __KERNEL__
--# else
--    /* Kernels prior to 2.1.1 defined struct sigcontext_struct instead of */
--    /* struct sigcontext.  libc6 (glibc2) uses "struct sigcontext" in     */
--    /* prototypes, so we have to include the top-level sigcontext.h to    */
--    /* make sure the former gets defined to be the latter if appropriate. */
--#   include <features.h>
--#   if 2 <= __GLIBC__
--#     if 2 == __GLIBC__ && 0 == __GLIBC_MINOR__
--        /* glibc 2.1 no longer has sigcontext.h.  But signal.h          */
--        /* has the right declaration for glibc 2.1.                     */
--#       include <sigcontext.h>
--#     endif /* 0 == __GLIBC_MINOR__ */
--#   else /* __GLIBC__ < 2 */
--      /* libc5 doesn't have <sigcontext.h>: go directly with the kernel   */
--      /* one.  Check LINUX_VERSION_CODE to see which we should reference. */
--#     include <asm/sigcontext.h>
--#   endif /* __GLIBC__ < 2 */
--# endif
--#endif /* LINUX && !POWERPC */
--
- #if !defined(OS2) && !defined(PCR) && !defined(AMIGA) && !defined(MACOS) \
-     && !defined(MSWINCE) && !defined(__CC_ARM)
- # include <sys/types.h>
--- 
-2.4.3
-
diff --git a/package/bdwgc/0003-Revert-Move-asm-machine-dependent-files-to-src-folde.patch b/package/bdwgc/0003-Revert-Move-asm-machine-dependent-files-to-src-folde.patch
deleted file mode 100644
index 03af6a399..000000000
--- a/package/bdwgc/0003-Revert-Move-asm-machine-dependent-files-to-src-folde.patch
+++ /dev/null
@@ -1,424 +0,0 @@
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-From 5e756d4d8df2949cb3b6e51532d3016cbb276fd7 Mon Sep 17 00:00:00 2001
-From: Ivan Maidanski <ivmai@mail.ru>
-Date: Fri, 27 Feb 2015 21:32:22 +0300
-Subject: [PATCH 004/135] Revert "Move asm machine-dependent files to 'src'
- folder" (partly)
-
-Asm files moved back to base folder to avoid build issues (reported
-for NetBSD and Solaris on Sparc).  Alternative way is to adjust
-configure.ac and Makefile.am properly but it requires more efforts
-(including testing).
-
-* Makefile.am (EXTRA_libgc_la_SOURCES): Remove "src/" prefix.
-* Makefile.direct (SRCS, mach_dep.o): Likewise.
-* src/ia64_save_regs_in_stack.s: Move to base folder.
-* src/sparc_mach_dep.S: Likewise.
-* src/sparc_netbsd_mach_dep.s: Likewise.
-* src/sparc_sunos4_mach_dep.s: Likewise.
-
----
- Makefile.am                   |    4 +--
- Makefile.direct               |   20 +++++++-------
- ia64_save_regs_in_stack.s     |   11 ++++++++
- sparc_mach_dep.S              |   61 +++++++++++++++++++++++++++++++++++++++++
- sparc_netbsd_mach_dep.s       |   34 +++++++++++++++++++++++
- sparc_sunos4_mach_dep.s       |   32 +++++++++++++++++++++
- src/ia64_save_regs_in_stack.s |   11 --------
- src/sparc_mach_dep.S          |   61 -----------------------------------------
- src/sparc_netbsd_mach_dep.s   |   34 -----------------------
- src/sparc_sunos4_mach_dep.s   |   32 ---------------------
- 11 files changed, 151 insertions(+), 151 deletions(-)
- create mode 100644 ia64_save_regs_in_stack.s
- create mode 100644 sparc_mach_dep.S
- create mode 100644 sparc_netbsd_mach_dep.s
- create mode 100644 sparc_sunos4_mach_dep.s
- delete mode 100644 src/ia64_save_regs_in_stack.s
- delete mode 100644 src/sparc_mach_dep.S
- delete mode 100644 src/sparc_netbsd_mach_dep.s
- delete mode 100644 src/sparc_sunos4_mach_dep.s
-
-diff --git a/Makefile.am b/Makefile.am
-index f8057db..1688be2 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -100,8 +100,8 @@ libgc_la_LIBADD = @addobjs@ $(THREADDLLIBS) $(UNWINDLIBS) $(ATOMIC_OPS_LIBS)
- libgc_la_DEPENDENCIES = @addobjs@
- libgc_la_LDFLAGS = $(extra_ldflags_libgc) -version-info 1:3:0 -no-undefined
- 
--EXTRA_libgc_la_SOURCES = src/ia64_save_regs_in_stack.s src/sparc_mach_dep.S \
--    src/sparc_netbsd_mach_dep.s src/sparc_sunos4_mach_dep.s
-+EXTRA_libgc_la_SOURCES = ia64_save_regs_in_stack.s sparc_mach_dep.S \
-+    sparc_netbsd_mach_dep.s sparc_sunos4_mach_dep.s
- 
- 
- # C++ Interface
-diff --git a/Makefile.direct b/Makefile.direct
-index d64598b..8ab80e8 100644
---- a/Makefile.direct
-+++ b/Makefile.direct
-@@ -108,8 +108,8 @@ SRCS= $(CSRCS) \
-   include/gc_config_macros.h include/private/pthread_support.h \
-   include/private/pthread_stop_world.h include/private/darwin_semaphore.h \
-   include/private/darwin_stop_world.h include/private/thread_local_alloc.h \
--  src/ia64_save_regs_in_stack.s src/sparc_mach_dep.S \
--  src/sparc_netbsd_mach_dep.s src/sparc_sunos4_mach_dep.s $(CORD_SRCS)
-+  ia64_save_regs_in_stack.s sparc_mach_dep.S \
-+  sparc_netbsd_mach_dep.s sparc_sunos4_mach_dep.s $(CORD_SRCS)
- 
- DOC_FILES= README.QUICK TODO doc/README.Mac doc/README.OS2 \
-   doc/README.amiga doc/README.cords doc/debugging.html \
-@@ -309,17 +309,17 @@ dyn_test:
- # 	gcc -shared -Wl,-soname=libgc.so.0 -o libgc.so.0 $(LIBOBJS) dyn_load.lo
- #	touch liblinuxgc.so
- 
--mach_dep.o: $(srcdir)/mach_dep.c $(srcdir)/src/sparc_mach_dep.S \
--	    $(srcdir)/src/sparc_sunos4_mach_dep.s \
--	    $(srcdir)/src/ia64_save_regs_in_stack.s \
--	    $(srcdir)/src/sparc_netbsd_mach_dep.s $(UTILS)
-+mach_dep.o: $(srcdir)/mach_dep.c $(srcdir)/sparc_mach_dep.S \
-+	    $(srcdir)/sparc_sunos4_mach_dep.s \
-+	    $(srcdir)/ia64_save_regs_in_stack.s \
-+	    $(srcdir)/sparc_netbsd_mach_dep.s $(UTILS)
- 	rm -f mach_dep.o
--	./if_mach SPARC SOLARIS $(CC) -c -o mach_dep2.o $(srcdir)/src/sparc_mach_dep.S
--	./if_mach SPARC OPENBSD $(AS) -o mach_dep2.o $(srcdir)/src/sparc_sunos4_mach_dep.s
--	./if_mach SPARC NETBSD $(AS) -o mach_dep2.o $(srcdir)/src/sparc_netbsd_mach_dep.s
-+	./if_mach SPARC SOLARIS $(CC) -c -o mach_dep2.o $(srcdir)/sparc_mach_dep.S
-+	./if_mach SPARC OPENBSD $(AS) -o mach_dep2.o $(srcdir)/sparc_sunos4_mach_dep.s
-+	./if_mach SPARC NETBSD $(AS) -o mach_dep2.o $(srcdir)/sparc_netbsd_mach_dep.s
- 	./if_mach SPARC "" $(CC) -c -o mach_dep1.o $(SPECIALCFLAGS) $(srcdir)/mach_dep.c
- 	./if_mach SPARC "" ld -r -o mach_dep.o mach_dep1.o mach_dep2.o
--	./if_mach IA64 "" as $(AS_ABI_FLAG) -o ia64_save_regs_in_stack.o $(srcdir)/src/ia64_save_regs_in_stack.s
-+	./if_mach IA64 "" as $(AS_ABI_FLAG) -o ia64_save_regs_in_stack.o $(srcdir)/ia64_save_regs_in_stack.s
- 	./if_mach IA64 "" $(CC) -c -o mach_dep1.o $(SPECIALCFLAGS) $(srcdir)/mach_dep.c
- 	./if_mach IA64 "" ld -r -o mach_dep.o mach_dep1.o ia64_save_regs_in_stack.o
- 	./if_not_there mach_dep.o $(CC) -c $(SPECIALCFLAGS) $(srcdir)/mach_dep.c
-diff --git a/ia64_save_regs_in_stack.s b/ia64_save_regs_in_stack.s
-new file mode 100644
-index 0000000..2b81edf
---- /dev/null
-+++ b/ia64_save_regs_in_stack.s
-@@ -0,0 +1,11 @@
-+        .text
-+        .align 16
-+        .global GC_save_regs_in_stack
-+        .proc GC_save_regs_in_stack
-+GC_save_regs_in_stack:
-+        .body
-+        flushrs
-+        ;;
-+        mov r8=ar.bsp
-+        br.ret.sptk.few rp
-+        .endp GC_save_regs_in_stack
-diff --git a/sparc_mach_dep.S b/sparc_mach_dep.S
-new file mode 100644
-index 0000000..d204dc4
---- /dev/null
-+++ b/sparc_mach_dep.S
-@@ -0,0 +1,61 @@
-+!	SPARCompiler 3.0 and later apparently no longer handles
-+!	asm outside functions.  So we need a separate .s file
-+!	This is only set up for SunOS 5, not SunOS 4.
-+!	Assumes this is called before the stack contents are
-+!	examined.
-+
-+	.seg 	"text"
-+	.globl	GC_save_regs_in_stack
-+GC_save_regs_in_stack:
-+#if defined(__arch64__) || defined(__sparcv9)
-+	save	%sp,-128,%sp
-+	flushw
-+	ret
-+	  restore %sp,2047+128,%o0
-+#else /* 32 bit SPARC */
-+	ta	0x3   ! ST_FLUSH_WINDOWS
-+	mov	%sp,%o0
-+	retl
-+	nop
-+#endif /* 32 bit SPARC */
-+.GC_save_regs_in_stack_end:
-+	.size GC_save_regs_in_stack,.GC_save_regs_in_stack_end-GC_save_regs_in_stack
-+
-+! GC_clear_stack_inner(arg, limit) clears stack area up to limit and
-+! returns arg.  Stack clearing is crucial on SPARC, so we supply
-+! an assembly version that s more careful.  Assumes limit is hotter
-+! than sp, and limit is 8 byte aligned.
-+	.globl	GC_clear_stack_inner
-+GC_clear_stack_inner:
-+#if defined(__arch64__) || defined(__sparcv9)
-+	mov %sp,%o2		! Save sp
-+	add %sp,2047-8,%o3	! p = sp+bias-8
-+	add %o1,-2047-192,%sp	! Move sp out of the way,
-+  				! so that traps still work.
-+  				! Includes some extra words
-+  				! so we can be sloppy below.
-+loop:
-+	stx %g0,[%o3]		! *(long *)p = 0
-+	cmp %o3,%o1
-+	bgu,pt %xcc, loop	! if (p > limit) goto loop
-+          add %o3,-8,%o3	! p -= 8 (delay slot)
-+	retl
-+    	  mov %o2,%sp		! Restore sp., delay slot
-+#else  /* 32 bit SPARC */
-+	mov	%sp,%o2		! Save sp
-+	add	%sp,-8,%o3	! p = sp-8
-+	clr	%g1		! [g0,g1] = 0
-+	add	%o1,-0x60,%sp	! Move sp out of the way,
-+				! so that traps still work.
-+				! Includes some extra words
-+				! so we can be sloppy below.
-+loop:
-+	std	%g0,[%o3]	! *(long long *)p = 0
-+	cmp	%o3,%o1
-+	bgu	loop		! if (p > limit) goto loop
-+	  add	%o3,-8,%o3	! p -= 8 (delay slot)
-+	retl
-+	  mov	%o2,%sp		! Restore sp., delay slot
-+#endif  /* 32 bit SPARC */
-+.GC_clear_stack_inner_end:
-+      	.size GC_clear_stack_inner,.GC_clear_stack_inner_end-GC_clear_stack_inner
-diff --git a/sparc_netbsd_mach_dep.s b/sparc_netbsd_mach_dep.s
-new file mode 100644
-index 0000000..14feb15
---- /dev/null
-+++ b/sparc_netbsd_mach_dep.s
-@@ -0,0 +1,34 @@
-+!	SPARCompiler 3.0 and later apparently no longer handles
-+!	asm outside functions.  So we need a separate .s file
-+!	This is only set up for SunOS 4.
-+!	Assumes this is called before the stack contents are
-+!	examined.
-+
-+#include "machine/asm.h"
-+
-+	.seg 	"text"
-+	.globl	_C_LABEL(GC_save_regs_in_stack)
-+	.globl 	_C_LABEL(GC_push_regs)
-+_C_LABEL(GC_save_regs_in_stack):
-+_C_LABEL(GC_push_regs):
-+	ta	0x3   ! ST_FLUSH_WINDOWS
-+	mov	%sp,%o0
-+	retl
-+	nop
-+
-+	.globl	_C_LABEL(GC_clear_stack_inner)
-+_C_LABEL(GC_clear_stack_inner):
-+	mov	%sp,%o2		! Save sp
-+	add	%sp,-8,%o3	! p = sp-8
-+	clr	%g1		! [g0,g1] = 0
-+	add	%o1,-0x60,%sp	! Move sp out of the way,
-+				! so that traps still work.
-+				! Includes some extra words
-+				! so we can be sloppy below.
-+loop:
-+	std	%g0,[%o3]	! *(long long *)p = 0
-+	cmp	%o3,%o1
-+	bgu	loop		! if (p > limit) goto loop
-+	add	%o3,-8,%o3	! p -= 8 (delay slot)
-+	retl
-+	mov	%o2,%sp		! Restore sp., delay slot
-diff --git a/sparc_sunos4_mach_dep.s b/sparc_sunos4_mach_dep.s
-new file mode 100644
-index 0000000..923f5ea
---- /dev/null
-+++ b/sparc_sunos4_mach_dep.s
-@@ -0,0 +1,32 @@
-+!	SPARCompiler 3.0 and later apparently no longer handles
-+!	asm outside functions.  So we need a separate .s file
-+!	This is only set up for SunOS 4.
-+!	Assumes this is called before the stack contents are
-+!	examined.
-+
-+	.seg 	"text"
-+	.globl	_GC_save_regs_in_stack
-+	.globl 	_GC_push_regs
-+_GC_save_regs_in_stack:
-+_GC_push_regs:
-+	ta	0x3   ! ST_FLUSH_WINDOWS
-+	mov	%sp,%o0
-+	retl
-+	nop
-+
-+	.globl	_GC_clear_stack_inner
-+_GC_clear_stack_inner:
-+	mov	%sp,%o2		! Save sp
-+	add	%sp,-8,%o3	! p = sp-8
-+	clr	%g1		! [g0,g1] = 0
-+	add	%o1,-0x60,%sp	! Move sp out of the way,
-+				! so that traps still work.
-+				! Includes some extra words
-+				! so we can be sloppy below.
-+loop:
-+	std	%g0,[%o3]	! *(long long *)p = 0
-+	cmp	%o3,%o1
-+	bgu	loop		! if (p > limit) goto loop
-+	  add	%o3,-8,%o3	! p -= 8 (delay slot)
-+	retl
-+	  mov	%o2,%sp		! Restore sp., delay slot
-diff --git a/src/ia64_save_regs_in_stack.s b/src/ia64_save_regs_in_stack.s
-deleted file mode 100644
-index 2b81edf..0000000
---- a/src/ia64_save_regs_in_stack.s
-+++ /dev/null
-@@ -1,11 +0,0 @@
--        .text
--        .align 16
--        .global GC_save_regs_in_stack
--        .proc GC_save_regs_in_stack
--GC_save_regs_in_stack:
--        .body
--        flushrs
--        ;;
--        mov r8=ar.bsp
--        br.ret.sptk.few rp
--        .endp GC_save_regs_in_stack
-diff --git a/src/sparc_mach_dep.S b/src/sparc_mach_dep.S
-deleted file mode 100644
-index d204dc4..0000000
---- a/src/sparc_mach_dep.S
-+++ /dev/null
-@@ -1,61 +0,0 @@
--!	SPARCompiler 3.0 and later apparently no longer handles
--!	asm outside functions.  So we need a separate .s file
--!	This is only set up for SunOS 5, not SunOS 4.
--!	Assumes this is called before the stack contents are
--!	examined.
--
--	.seg 	"text"
--	.globl	GC_save_regs_in_stack
--GC_save_regs_in_stack:
--#if defined(__arch64__) || defined(__sparcv9)
--	save	%sp,-128,%sp
--	flushw
--	ret
--	  restore %sp,2047+128,%o0
--#else /* 32 bit SPARC */
--	ta	0x3   ! ST_FLUSH_WINDOWS
--	mov	%sp,%o0
--	retl
--	nop
--#endif /* 32 bit SPARC */
--.GC_save_regs_in_stack_end:
--	.size GC_save_regs_in_stack,.GC_save_regs_in_stack_end-GC_save_regs_in_stack
--
--! GC_clear_stack_inner(arg, limit) clears stack area up to limit and
--! returns arg.  Stack clearing is crucial on SPARC, so we supply
--! an assembly version that s more careful.  Assumes limit is hotter
--! than sp, and limit is 8 byte aligned.
--	.globl	GC_clear_stack_inner
--GC_clear_stack_inner:
--#if defined(__arch64__) || defined(__sparcv9)
--	mov %sp,%o2		! Save sp
--	add %sp,2047-8,%o3	! p = sp+bias-8
--	add %o1,-2047-192,%sp	! Move sp out of the way,
--  				! so that traps still work.
--  				! Includes some extra words
--  				! so we can be sloppy below.
--loop:
--	stx %g0,[%o3]		! *(long *)p = 0
--	cmp %o3,%o1
--	bgu,pt %xcc, loop	! if (p > limit) goto loop
--          add %o3,-8,%o3	! p -= 8 (delay slot)
--	retl
--    	  mov %o2,%sp		! Restore sp., delay slot
--#else  /* 32 bit SPARC */
--	mov	%sp,%o2		! Save sp
--	add	%sp,-8,%o3	! p = sp-8
--	clr	%g1		! [g0,g1] = 0
--	add	%o1,-0x60,%sp	! Move sp out of the way,
--				! so that traps still work.
--				! Includes some extra words
--				! so we can be sloppy below.
--loop:
--	std	%g0,[%o3]	! *(long long *)p = 0
--	cmp	%o3,%o1
--	bgu	loop		! if (p > limit) goto loop
--	  add	%o3,-8,%o3	! p -= 8 (delay slot)
--	retl
--	  mov	%o2,%sp		! Restore sp., delay slot
--#endif  /* 32 bit SPARC */
--.GC_clear_stack_inner_end:
--      	.size GC_clear_stack_inner,.GC_clear_stack_inner_end-GC_clear_stack_inner
-diff --git a/src/sparc_netbsd_mach_dep.s b/src/sparc_netbsd_mach_dep.s
-deleted file mode 100644
-index 14feb15..0000000
---- a/src/sparc_netbsd_mach_dep.s
-+++ /dev/null
-@@ -1,34 +0,0 @@
--!	SPARCompiler 3.0 and later apparently no longer handles
--!	asm outside functions.  So we need a separate .s file
--!	This is only set up for SunOS 4.
--!	Assumes this is called before the stack contents are
--!	examined.
--
--#include "machine/asm.h"
--
--	.seg 	"text"
--	.globl	_C_LABEL(GC_save_regs_in_stack)
--	.globl 	_C_LABEL(GC_push_regs)
--_C_LABEL(GC_save_regs_in_stack):
--_C_LABEL(GC_push_regs):
--	ta	0x3   ! ST_FLUSH_WINDOWS
--	mov	%sp,%o0
--	retl
--	nop
--
--	.globl	_C_LABEL(GC_clear_stack_inner)
--_C_LABEL(GC_clear_stack_inner):
--	mov	%sp,%o2		! Save sp
--	add	%sp,-8,%o3	! p = sp-8
--	clr	%g1		! [g0,g1] = 0
--	add	%o1,-0x60,%sp	! Move sp out of the way,
--				! so that traps still work.
--				! Includes some extra words
--				! so we can be sloppy below.
--loop:
--	std	%g0,[%o3]	! *(long long *)p = 0
--	cmp	%o3,%o1
--	bgu	loop		! if (p > limit) goto loop
--	add	%o3,-8,%o3	! p -= 8 (delay slot)
--	retl
--	mov	%o2,%sp		! Restore sp., delay slot
-diff --git a/src/sparc_sunos4_mach_dep.s b/src/sparc_sunos4_mach_dep.s
-deleted file mode 100644
-index 923f5ea..0000000
---- a/src/sparc_sunos4_mach_dep.s
-+++ /dev/null
-@@ -1,32 +0,0 @@
--!	SPARCompiler 3.0 and later apparently no longer handles
--!	asm outside functions.  So we need a separate .s file
--!	This is only set up for SunOS 4.
--!	Assumes this is called before the stack contents are
--!	examined.
--
--	.seg 	"text"
--	.globl	_GC_save_regs_in_stack
--	.globl 	_GC_push_regs
--_GC_save_regs_in_stack:
--_GC_push_regs:
--	ta	0x3   ! ST_FLUSH_WINDOWS
--	mov	%sp,%o0
--	retl
--	nop
--
--	.globl	_GC_clear_stack_inner
--_GC_clear_stack_inner:
--	mov	%sp,%o2		! Save sp
--	add	%sp,-8,%o3	! p = sp-8
--	clr	%g1		! [g0,g1] = 0
--	add	%o1,-0x60,%sp	! Move sp out of the way,
--				! so that traps still work.
--				! Includes some extra words
--				! so we can be sloppy below.
--loop:
--	std	%g0,[%o3]	! *(long long *)p = 0
--	cmp	%o3,%o1
--	bgu	loop		! if (p > limit) goto loop
--	  add	%o3,-8,%o3	! p -= 8 (delay slot)
--	retl
--	  mov	%o2,%sp		! Restore sp., delay slot
--- 
-1.7.10.4
-
diff --git a/package/bdwgc/0004-configure-match-uclinux-pattern.patch b/package/bdwgc/0004-configure-match-uclinux-pattern.patch
deleted file mode 100644
index 78bad1c59..000000000
--- a/package/bdwgc/0004-configure-match-uclinux-pattern.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f8ecc7fb09adf34a23d324f373e667c81311fc1c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 6 Aug 2016 23:24:35 +0200
-Subject: [PATCH] configure: match uclinux pattern
-
-bdwgc does not recognize "uclinux" as a valid OS part of the target
-tuple which is used by some arm cortex-M toolchains.
-
-Fixes:
-http://autobuild.buildroot.net/results/94f/94fbc1e5afe183e5b071d1e869b2d780025389e2
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b1ce2b2..a69d101 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -186,7 +186,7 @@ case "$THREADS" in
-         AC_DEFINE(THREAD_LOCAL_ALLOC)
-         AC_MSG_WARN("Explicit GC_INIT() calls may be required.");
-         ;;
--     *-*-linux*)
-+     *-*-*linux*)
-         AC_DEFINE(GC_LINUX_THREADS)
-         AC_DEFINE(_REENTRANT)
-         ;;
--- 
-2.5.5
-
diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 44414e4ef..4b41e1d85 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	63320ad7c45460e4a40e03f5aa4c6893783f21a16416c3282b994f933312afa2	gc-7.4.2.tar.gz
+sha256 a14a28b1129be90e55cd6f71127ffc5594e1091d5d54131528c24cd0c03b7d90  gc-7.6.0.tar.gz
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 0e9054df3..e148f7223 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 7.4.2
+BDWGC_VERSION = 7.6.0
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = http://www.hboehm.info/gc/gc_source
 BDWGC_INSTALL_STAGING = YES
-- 
2.11.0
