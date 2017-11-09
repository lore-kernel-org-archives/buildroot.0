From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 10 Nov 2017 00:58:21 +0300
Subject: [Buildroot] [PATCH] glibc: ARC is now supported via patches
Message-ID: <20171109215821.16615-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Given ARC port is just a very few patches away from upstream
and if those are based on 2.29 everything works like a charm
let's forget about SNPS GitHub stuff and use vanilla glibc
plus patches.

This among other things solves a problem with stable fixes for glibc.
Now when Buildroot switched to the tip of glibc's stable branch instead of
applying cherry-picked patches ARC version would stay behind every time
glibc's "version" gets updated in Buildroot.

But if we just apply ARC patches then we're good with whatever commit
from upstream stable branch is taken.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/0001-longlong.h-sync-from-gcc.patch  |  133 +
 .../0002-ARC-add-definitions-to-elf-elf.h.patch    |   94 +
 package/glibc/0003-ARC-Initial-port-to-glibc.patch | 7625 ++++++++++++++++++++
 ...__start-as-entry-point-vs.-canonical-_sta.patch |  110 +
 ...eral-testsuite-failures-related-to-unwind.patch |  162 +
 package/glibc/0006-xxx-locla-chg.patch             |   31 +
 ...alloc_-set-get-_state-manually-to-abilist.patch |   26 +
 package/glibc/glibc.hash                           |    2 -
 package/glibc/glibc.mk                             |    7 -
 9 files changed, 8181 insertions(+), 9 deletions(-)
 create mode 100644 package/glibc/0001-longlong.h-sync-from-gcc.patch
 create mode 100644 package/glibc/0002-ARC-add-definitions-to-elf-elf.h.patch
 create mode 100644 package/glibc/0003-ARC-Initial-port-to-glibc.patch
 create mode 100644 package/glibc/0004-ARC-Enable-__start-as-entry-point-vs.-canonical-_sta.patch
 create mode 100644 package/glibc/0005-ARC-Fix-several-testsuite-failures-related-to-unwind.patch
 create mode 100644 package/glibc/0006-xxx-locla-chg.patch
 create mode 100644 package/glibc/0007-add-malloc_-set-get-_state-manually-to-abilist.patch

diff --git a/package/glibc/0001-longlong.h-sync-from-gcc.patch b/package/glibc/0001-longlong.h-sync-from-gcc.patch
new file mode 100644
index 0000000..7f36322
--- /dev/null
+++ b/package/glibc/0001-longlong.h-sync-from-gcc.patch
@@ -0,0 +1,133 @@
+From db64fd4cc1712190db8459332731b5d8fe3e57b6 Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <vgupta@synopsys.com>
+Date: Tue, 27 Jun 2017 20:28:04 +0300
+Subject: [PATCH 1/7] longlong.h: sync from gcc
+
+This corresponds to the version
+
+Author: law <law@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date:   Tue Jun 27 16:10:15 2017 +0000
+
+        * longlong.h: Remove ns32k support.
q+
+    git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 249696 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ stdlib/longlong.h | 65 ++++++-------------------------------------------------
+ 1 file changed, 7 insertions(+), 58 deletions(-)
+
+diff --git a/stdlib/longlong.h b/stdlib/longlong.h
+index 0ec11c5..c24568a 100644
+--- a/stdlib/longlong.h
++++ b/stdlib/longlong.h
+@@ -197,17 +197,17 @@ extern UDItype __udiv_qrnnd (UDItype *, UDItype, UDItype, UDItype);
+ 	   : "=r" ((USItype) (sh)),					\
+ 	     "=&r" ((USItype) (sl))					\
+ 	   : "%r" ((USItype) (ah)),					\
+-	     "rIJ" ((USItype) (bh)),					\
++	     "rICal" ((USItype) (bh)),					\
+ 	     "%r" ((USItype) (al)),					\
+-	     "rIJ" ((USItype) (bl)))
++	     "rICal" ((USItype) (bl)))
+ #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
+   __asm__ ("sub.f	%1, %4, %5\n\tsbc	%0, %2, %3"		\
+ 	   : "=r" ((USItype) (sh)),					\
+ 	     "=&r" ((USItype) (sl))					\
+ 	   : "r" ((USItype) (ah)),					\
+-	     "rIJ" ((USItype) (bh)),					\
++	     "rICal" ((USItype) (bh)),					\
+ 	     "r" ((USItype) (al)),					\
+-	     "rIJ" ((USItype) (bl)))
++	     "rICal" ((USItype) (bl)))
+ 
+ #define __umulsidi3(u,v) ((UDItype)(USItype)u*(USItype)v)
+ #ifdef __ARC_NORM__
+@@ -221,8 +221,8 @@ extern UDItype __udiv_qrnnd (UDItype *, UDItype, UDItype, UDItype);
+     }									\
+   while (0)
+ #define COUNT_LEADING_ZEROS_0 32
+-#endif
+-#endif
++#endif /* __ARC_NORM__ */
++#endif /* __arc__ */
+ 
+ #if defined (__arm__) && (defined (__thumb2__) || !defined (__thumb__)) \
+  && W_TYPE_SIZE == 32
+@@ -858,42 +858,6 @@ extern UDItype __umulsidi3 (USItype, USItype);
+ #endif
+ #endif /* __mips__ */
+ 
+-#if defined (__ns32000__) && W_TYPE_SIZE == 32
+-#define umul_ppmm(w1, w0, u, v) \
+-  ({union {UDItype __ll;						\
+-	   struct {USItype __l, __h;} __i;				\
+-	  } __xx;							\
+-  __asm__ ("meid %2,%0"							\
+-	   : "=g" (__xx.__ll)						\
+-	   : "%0" ((USItype) (u)),					\
+-	     "g" ((USItype) (v)));					\
+-  (w1) = __xx.__i.__h; (w0) = __xx.__i.__l;})
+-#define __umulsidi3(u, v) \
+-  ({UDItype __w;							\
+-    __asm__ ("meid %2,%0"						\
+-	     : "=g" (__w)						\
+-	     : "%0" ((USItype) (u)),					\
+-	       "g" ((USItype) (v)));					\
+-    __w; })
+-#define udiv_qrnnd(q, r, n1, n0, d) \
+-  ({union {UDItype __ll;						\
+-	   struct {USItype __l, __h;} __i;				\
+-	  } __xx;							\
+-  __xx.__i.__h = (n1); __xx.__i.__l = (n0);				\
+-  __asm__ ("deid %2,%0"							\
+-	   : "=g" (__xx.__ll)						\
+-	   : "0" (__xx.__ll),						\
+-	     "g" ((USItype) (d)));					\
+-  (r) = __xx.__i.__l; (q) = __xx.__i.__h; })
+-#define count_trailing_zeros(count,x) \
+-  do {									\
+-    __asm__ ("ffsd     %2,%0"						\
+-	    : "=r" ((USItype) (count))					\
+-	    : "0" ((USItype) 0),					\
+-	      "r" ((USItype) (x)));					\
+-  } while (0)
+-#endif /* __ns32000__ */
+-
+ /* FIXME: We should test _IBMR2 here when we add assembly support for the
+    system vendor compilers.
+    FIXME: What's needed for gcc PowerPC VxWorks?  __vxworks__ is not good
+@@ -1086,7 +1050,7 @@ extern UDItype __umulsidi3 (USItype, USItype);
+   } while (0)
+ #endif
+ 
+-#if defined(__sh__) && (!defined (__SHMEDIA__) || !__SHMEDIA__) && W_TYPE_SIZE == 32
++#if defined(__sh__) && W_TYPE_SIZE == 32
+ #ifndef __sh1__
+ #define umul_ppmm(w1, w0, u, v) \
+   __asm__ (								\
+@@ -1159,21 +1123,6 @@ extern UDItype __umulsidi3 (USItype, USItype);
+ 
+ #endif /* __sh__ */
+ 
+-#if defined (__SH5__) && defined (__SHMEDIA__) && __SHMEDIA__ && W_TYPE_SIZE == 32
+-#define __umulsidi3(u,v) ((UDItype)(USItype)u*(USItype)v)
+-#define count_leading_zeros(count, x) \
+-  do									\
+-    {									\
+-      UDItype x_ = (USItype)(x);					\
+-      SItype c_;							\
+-									\
+-      __asm__ ("nsb %1, %0" : "=r" (c_) : "r" (x_));			\
+-      (count) = c_ - 31;						\
+-    }									\
+-  while (0)
+-#define COUNT_LEADING_ZEROS_0 32
+-#endif
+-
+ #if defined (__sparc__) && !defined (__arch64__) && !defined (__sparcv9) \
+     && W_TYPE_SIZE == 32
+ #define add_ssaaaa(sh, sl, ah, al, bh, bl) \
+-- 
+2.10.2
+
diff --git a/package/glibc/0002-ARC-add-definitions-to-elf-elf.h.patch b/package/glibc/0002-ARC-add-definitions-to-elf-elf.h.patch
new file mode 100644
index 0000000..2d01e12
--- /dev/null
+++ b/package/glibc/0002-ARC-add-definitions-to-elf-elf.h.patch
@@ -0,0 +1,94 @@
+From d9d5c21626be2afbeb8ef0d6d99ae5c4c2e58ce4 Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <vgupta@synopsys.com>
+Date: Wed, 30 Mar 2016 18:22:22 +0530
+Subject: [PATCH 2/7] ARC: add definitions to elf/elf.h
+
+Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ elf/elf.h | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 68 insertions(+)
+
+diff --git a/elf/elf.h b/elf/elf.h
+index 3900b4c..8b58818 100644
+--- a/elf/elf.h
++++ b/elf/elf.h
+@@ -3757,6 +3757,74 @@ enum
+ #define R_METAG_TLS_LE_HI16	60
+ #define R_METAG_TLS_LE_LO16	61
+ 
++/* ARCompact/ARCv2 specific relocs */
++#define R_ARC_NONE		0x0
++#define R_ARC_8			0x1
++#define R_ARC_16		0x2
++#define R_ARC_24		0x3
++#define R_ARC_32		0x4
++#define R_ARC_B26		0x5
++#define R_ARC_B22_PCREL		0x6
++#define R_ARC_H30		0x7
++#define R_ARC_N8		0x8
++#define R_ARC_N16		0x9
++#define R_ARC_N24		0xA
++#define R_ARC_N32		0xB
++#define R_ARC_SDA		0xC
++#define R_ARC_SECTOFF		0xD
++#define R_ARC_S21H_PCREL	0xE
++#define R_ARC_S21W_PCREL	0xF
++#define R_ARC_S25H_PCREL	0x10
++#define R_ARC_S25W_PCREL	0x11
++#define R_ARC_SDA32		0x12
++#define R_ARC_SDA_LDST		0x13
++#define R_ARC_SDA_LDST1		0x14
++#define R_ARC_SDA_LDST2		0x15
++#define R_ARC_SDA16_LD		0x16
++#define R_ARC_SDA16_LD1		0x17
++#define R_ARC_SDA16_LD2		0x18
++#define R_ARC_S13_PCREL		0x19
++#define R_ARC_W			0x1A
++#define R_ARC_32_ME		0x1B
++#define R_ARC_N32_ME		0x1C
++#define R_ARC_SECTOFF_ME	0x1D
++#define R_ARC_SDA32_ME		0x1E
++#define R_ARC_W_ME		0x1F
++#define R_ARC_H30_ME		0x20
++#define R_ARC_SECTOFF_U8	0x21
++#define R_ARC_SECTOFF_S9	0x22
++#define R_AC_SECTOFF_U8		0x23
++#define R_AC_SECTOFF_U8_1	0x24
++#define R_AC_SECTOFF_U8_2	0x25
++#define R_AC_SECTOFF_S9		0x26
++#define R_AC_SECTOFF_S9_1	0x27
++#define R_AC_SECTOFF_S9_2	0x28
++#define R_ARC_SECTOFF_ME_1	0x29
++#define R_ARC_SECTOFF_ME_2	0x2A
++#define R_ARC_SECTOFF_1		0x2B
++#define R_ARC_SECTOFF_2		0x2C
++#define R_ARC_PC32		0x32
++#define R_ARC_GOTPC32		0x33
++#define R_ARC_PLT32		0x34
++#define R_ARC_COPY		0x35
++#define R_ARC_GLOB_DAT		0x36
++#define R_ARC_JUMP_SLOT		0x37
++#define R_ARC_RELATIVE		0x38
++#define R_ARC_GOTOFF		0x39
++#define R_ARC_GOTPC		0x3A
++#define R_ARC_GOT32		0x3B
++
++#define R_ARC_TLS_DTPMOD	0x42
++#define R_ARC_TLS_DTPOFF	0x43
++#define R_ARC_TLS_TPOFF		0x44
++#define R_ARC_TLS_GD_GOT	0x45
++#define R_ARC_TLS_GD_LD	        0x46
++#define R_ARC_TLS_GD_CALL	0x47
++#define R_ARC_TLS_IE_GOT	0x48
++#define R_ARC_TLS_DTPOFF_S9	0x4a
++#define R_ARC_TLS_LE_S9		0x4a
++#define R_ARC_TLS_LE_32		0x4b
++
+ __END_DECLS
+ 
+ #endif	/* elf.h */
+-- 
+2.10.2
+
diff --git a/package/glibc/0003-ARC-Initial-port-to-glibc.patch b/package/glibc/0003-ARC-Initial-port-to-glibc.patch
new file mode 100644
index 0000000..ba26187
--- /dev/null
+++ b/package/glibc/0003-ARC-Initial-port-to-glibc.patch
@@ -0,0 +1,7625 @@
+From daa6e1cda4326b6bde2a30c5ff4187bab84589fc Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <vgupta@synopsys.com>
+Date: Wed, 9 Sep 2015 08:37:38 -0700
+Subject: [PATCH 3/7] ARC: Initial port to glibc
+
+The starting point for the code was Nios2 port, thanks to them.
+
+Big shout out to Cupertino who spent many weeks / nights debugging
+the initial bringup of init, sh, running into pesky issues in ARC port
+of dynamic loader, syscall wrappers, binutils, gcc...
+
+Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ elf/elf.h                                          |    1 +
+ sysdeps/arc/Implies                                |    3 +
+ sysdeps/arc/Makefile                               |   25 +
+ sysdeps/arc/Versions                               |   13 +
+ sysdeps/arc/__longjmp.S                            |   50 +
+ sysdeps/arc/abort-instr.h                          |    2 +
+ sysdeps/arc/atomic-machine.h                       |   85 +
+ sysdeps/arc/backtrace.c                            |    1 +
+ sysdeps/arc/bits/endian.h                          |   12 +
+ sysdeps/arc/bits/fenv.h                            |   52 +
+ sysdeps/arc/bits/link.h                            |   52 +
+ sysdeps/arc/bits/setjmp.h                          |   33 +
+ sysdeps/arc/bsd-_setjmp.S                          |    1 +
+ sysdeps/arc/bsd-setjmp.S                           |    1 +
+ sysdeps/arc/configure                              |   17 +
+ sysdeps/arc/configure.ac                           |   13 +
+ sysdeps/arc/crti.S                                 |   77 +
+ sysdeps/arc/crtn.S                                 |   56 +
+ sysdeps/arc/dl-machine.h                           |  332 ++++
+ sysdeps/arc/dl-runtime.c                           |   21 +
+ sysdeps/arc/dl-sysdep.h                            |   25 +
+ sysdeps/arc/dl-tls.h                               |   30 +
+ sysdeps/arc/dl-trampoline.S                        |   72 +
+ sysdeps/arc/gccframe.h                             |   21 +
+ sysdeps/arc/gmp-mparam.h                           |   23 +
+ sysdeps/arc/jmpbuf-offsets.h                       |   46 +
+ sysdeps/arc/jmpbuf-unwind.h                        |   47 +
+ sysdeps/arc/ldsodefs.h                             |   43 +
+ sysdeps/arc/libc-tls.c                             |   27 +
+ sysdeps/arc/libm-test-ulps                         |  394 ++++
+ sysdeps/arc/libm-test-ulps-name                    |    1 +
+ sysdeps/arc/machine-gmon.h                         |   30 +
+ sysdeps/arc/math-tests.h                           |   28 +
+ sysdeps/arc/math_private.h                         |   33 +
+ sysdeps/arc/memusage.h                             |   23 +
+ sysdeps/arc/nptl/Makefile                          |   22 +
+ sysdeps/arc/nptl/bits/pthreadtypes-arch.h          |   70 +
+ sysdeps/arc/nptl/bits/semaphore.h                  |   32 +
+ sysdeps/arc/nptl/pthread_spin_lock.c               |   24 +
+ sysdeps/arc/nptl/pthreaddef.h                      |   32 +
+ sysdeps/arc/nptl/tcb-offsets.sym                   |   11 +
+ sysdeps/arc/nptl/tls.h                             |  151 ++
+ sysdeps/arc/preconfigure                           |    6 +
+ sysdeps/arc/s_fma.c                                |    1 +
+ sysdeps/arc/s_fmaf.c                               |    1 +
+ sysdeps/arc/setjmp.S                               |   64 +
+ sysdeps/arc/sfp-machine.h                          |   51 +
+ sysdeps/arc/sotruss-lib.c                          |   51 +
+ sysdeps/arc/stackinfo.h                            |   33 +
+ sysdeps/arc/start.S                                |   81 +
+ sysdeps/arc/sysdep.h                               |   49 +
+ sysdeps/arc/tls-macros.h                           |   29 +
+ sysdeps/arc/tst-audit.h                            |   23 +
+ sysdeps/unix/sysv/linux/aarch64/sys/ucontext.h     |    4 +-
+ sysdeps/unix/sysv/linux/arc/Implies                |    3 +
+ sysdeps/unix/sysv/linux/arc/Makefile               |    9 +
+ sysdeps/unix/sysv/linux/arc/Versions               |    6 +
+ sysdeps/unix/sysv/linux/arc/arch-fork.h            |   35 +
+ sysdeps/unix/sysv/linux/arc/bits/mman.h            |   42 +
+ sysdeps/unix/sysv/linux/arc/bits/sigaction.h       |   78 +
+ sysdeps/unix/sysv/linux/arc/c++-types.data         |   67 +
+ sysdeps/unix/sysv/linux/arc/cacheflush.c           |   29 +
+ sysdeps/unix/sysv/linux/arc/clone.S                |   97 +
+ sysdeps/unix/sysv/linux/arc/configure              |    4 +
+ sysdeps/unix/sysv/linux/arc/configure.ac           |    4 +
+ sysdeps/unix/sysv/linux/arc/kernel-features.h      |   25 +
+ sysdeps/unix/sysv/linux/arc/ld.abilist             |   10 +
+ sysdeps/unix/sysv/linux/arc/ldconfig.h             |   25 +
+ .../unix/sysv/linux/arc/libBrokenLocale.abilist    |    2 +
+ sysdeps/unix/sysv/linux/arc/libanl.abilist         |    5 +
+ sysdeps/unix/sysv/linux/arc/libc.abilist           | 2064 ++++++++++++++++++++
+ sysdeps/unix/sysv/linux/arc/libcrypt.abilist       |    8 +
+ sysdeps/unix/sysv/linux/arc/libdl.abilist          |   10 +
+ sysdeps/unix/sysv/linux/arc/libm.abilist           |  423 ++++
+ sysdeps/unix/sysv/linux/arc/libnsl.abilist         |  122 ++
+ sysdeps/unix/sysv/linux/arc/libpthread.abilist     |  218 +++
+ sysdeps/unix/sysv/linux/arc/libresolv.abilist      |   82 +
+ sysdeps/unix/sysv/linux/arc/librt.abilist          |   36 +
+ sysdeps/unix/sysv/linux/arc/libthread_db.abilist   |   41 +
+ sysdeps/unix/sysv/linux/arc/libutil.abilist        |    7 +
+ sysdeps/unix/sysv/linux/arc/localplt.data          |   35 +
+ sysdeps/unix/sysv/linux/arc/mmap_internal.h        |   26 +
+ sysdeps/unix/sysv/linux/arc/profil-counter.h       |    2 +
+ sysdeps/unix/sysv/linux/arc/pt-vfork.S             |    1 +
+ sysdeps/unix/sysv/linux/arc/shlib-versions         |    2 +
+ sysdeps/unix/sysv/linux/arc/sigaction.c            |   65 +
+ sysdeps/unix/sysv/linux/arc/sigcontextinfo.h       |   28 +
+ sysdeps/unix/sysv/linux/arc/sys/cachectl.h         |   36 +
+ sysdeps/unix/sysv/linux/arc/sys/procfs.h           |  123 ++
+ .../sysv/linux/{aarch64 => arc}/sys/ucontext.h     |   45 +-
+ sysdeps/unix/sysv/linux/arc/sys/user.h             |   32 +
+ sysdeps/unix/sysv/linux/arc/syscall.S              |   33 +
+ sysdeps/unix/sysv/linux/arc/sysdep-cancel.h        |  140 ++
+ sysdeps/unix/sysv/linux/arc/sysdep.c               |   33 +
+ sysdeps/unix/sysv/linux/arc/sysdep.h               |  253 +++
+ sysdeps/unix/sysv/linux/arc/ucontext_i.sym         |   17 +
+ sysdeps/unix/sysv/linux/arc/vfork.S                |   42 +
+ 97 files changed, 6765 insertions(+), 25 deletions(-)
+ create mode 100644 sysdeps/arc/Implies
+ create mode 100644 sysdeps/arc/Makefile
+ create mode 100644 sysdeps/arc/Versions
+ create mode 100644 sysdeps/arc/__longjmp.S
+ create mode 100644 sysdeps/arc/abort-instr.h
+ create mode 100644 sysdeps/arc/atomic-machine.h
+ create mode 100644 sysdeps/arc/backtrace.c
+ create mode 100644 sysdeps/arc/bits/endian.h
+ create mode 100644 sysdeps/arc/bits/fenv.h
+ create mode 100644 sysdeps/arc/bits/link.h
+ create mode 100644 sysdeps/arc/bits/setjmp.h
+ create mode 100644 sysdeps/arc/bsd-_setjmp.S
+ create mode 100644 sysdeps/arc/bsd-setjmp.S
+ create mode 100644 sysdeps/arc/configure
+ create mode 100644 sysdeps/arc/configure.ac
+ create mode 100644 sysdeps/arc/crti.S
+ create mode 100644 sysdeps/arc/crtn.S
+ create mode 100644 sysdeps/arc/dl-machine.h
+ create mode 100644 sysdeps/arc/dl-runtime.c
+ create mode 100644 sysdeps/arc/dl-sysdep.h
+ create mode 100644 sysdeps/arc/dl-tls.h
+ create mode 100644 sysdeps/arc/dl-trampoline.S
+ create mode 100644 sysdeps/arc/gccframe.h
+ create mode 100644 sysdeps/arc/gmp-mparam.h
+ create mode 100644 sysdeps/arc/jmpbuf-offsets.h
+ create mode 100644 sysdeps/arc/jmpbuf-unwind.h
+ create mode 100644 sysdeps/arc/ldsodefs.h
+ create mode 100644 sysdeps/arc/libc-tls.c
+ create mode 100644 sysdeps/arc/libm-test-ulps
+ create mode 100644 sysdeps/arc/libm-test-ulps-name
+ create mode 100644 sysdeps/arc/machine-gmon.h
+ create mode 100644 sysdeps/arc/math-tests.h
+ create mode 100644 sysdeps/arc/math_private.h
+ create mode 100644 sysdeps/arc/memusage.h
+ create mode 100644 sysdeps/arc/nptl/Makefile
+ create mode 100644 sysdeps/arc/nptl/bits/pthreadtypes-arch.h
+ create mode 100644 sysdeps/arc/nptl/bits/semaphore.h
+ create mode 100644 sysdeps/arc/nptl/pthread_spin_lock.c
+ create mode 100644 sysdeps/arc/nptl/pthreaddef.h
+ create mode 100644 sysdeps/arc/nptl/tcb-offsets.sym
+ create mode 100644 sysdeps/arc/nptl/tls.h
+ create mode 100644 sysdeps/arc/preconfigure
+ create mode 100644 sysdeps/arc/s_fma.c
+ create mode 100644 sysdeps/arc/s_fmaf.c
+ create mode 100644 sysdeps/arc/setjmp.S
+ create mode 100644 sysdeps/arc/sfp-machine.h
+ create mode 100644 sysdeps/arc/sotruss-lib.c
+ create mode 100644 sysdeps/arc/stackinfo.h
+ create mode 100644 sysdeps/arc/start.S
+ create mode 100644 sysdeps/arc/sysdep.h
+ create mode 100644 sysdeps/arc/tls-macros.h
+ create mode 100644 sysdeps/arc/tst-audit.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/Implies
+ create mode 100644 sysdeps/unix/sysv/linux/arc/Makefile
+ create mode 100644 sysdeps/unix/sysv/linux/arc/Versions
+ create mode 100644 sysdeps/unix/sysv/linux/arc/arch-fork.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/bits/mman.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/bits/sigaction.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/c++-types.data
+ create mode 100644 sysdeps/unix/sysv/linux/arc/cacheflush.c
+ create mode 100644 sysdeps/unix/sysv/linux/arc/clone.S
+ create mode 100644 sysdeps/unix/sysv/linux/arc/configure
+ create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
+ create mode 100644 sysdeps/unix/sysv/linux/arc/kernel-features.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/ld.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/ldconfig.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/libanl.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/libc.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/libcrypt.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/libdl.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/libm.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/libnsl.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/libpthread.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/libresolv.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/librt.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/libthread_db.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/libutil.abilist
+ create mode 100644 sysdeps/unix/sysv/linux/arc/localplt.data
+ create mode 100644 sysdeps/unix/sysv/linux/arc/mmap_internal.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/profil-counter.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/pt-vfork.S
+ create mode 100644 sysdeps/unix/sysv/linux/arc/shlib-versions
+ create mode 100644 sysdeps/unix/sysv/linux/arc/sigaction.c
+ create mode 100644 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/sys/cachectl.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/sys/procfs.h
+ copy sysdeps/unix/sysv/linux/{aarch64 => arc}/sys/ucontext.h (61%)
+ create mode 100644 sysdeps/unix/sysv/linux/arc/sys/user.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/syscall.S
+ create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.c
+ create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.h
+ create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext_i.sym
+ create mode 100644 sysdeps/unix/sysv/linux/arc/vfork.S
+
+diff --git a/elf/elf.h b/elf/elf.h
+index 8b58818..dff23c2 100644
+--- a/elf/elf.h
++++ b/elf/elf.h
+@@ -366,6 +366,7 @@ typedef struct
+ /* Old spellings/synonyms.  */
+ 
+ #define EM_ARC_A5	EM_ARC_COMPACT
++#define EM_ARCV2	EM_ARC_COMPACT2
+ 
+ /* If it is necessary to assign new unofficial EM_* values, please
+    pick large random numbers (0x8523, 0xa7f2, etc.) to minimize the
+diff --git a/sysdeps/arc/Implies b/sysdeps/arc/Implies
+new file mode 100644
+index 0000000..387a0ca
+--- /dev/null
++++ b/sysdeps/arc/Implies
+@@ -0,0 +1,3 @@
++wordsize-32
++ieee754/dbl-64
++ieee754/flt-32
+diff --git a/sysdeps/arc/Makefile b/sysdeps/arc/Makefile
+new file mode 100644
+index 0000000..73485fc
+--- /dev/null
++++ b/sysdeps/arc/Makefile
+@@ -0,0 +1,25 @@
++# ARC Makefile
++# Copyright (C) 1993-2017 Free Software Foundation, Inc.
++# This file is part of the GNU C Library.
++
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library.  If not, see
++# <http://www.gnu.org/licenses/>.
++
++# We don't support long doubles as a distinct type.  We don't need to set
++# this variable; it's here mostly for documentational purposes.
++long-double-fcts = no
++
++ifeq ($(subdir),debug)
++CFLAGS-backtrace.c += -funwind-tables
++endif
+diff --git a/sysdeps/arc/Versions b/sysdeps/arc/Versions
+new file mode 100644
+index 0000000..e84396f
+--- /dev/null
++++ b/sysdeps/arc/Versions
+@@ -0,0 +1,13 @@
++libc {
++  GLIBC_2.26 {
++    __adddf3; __addsf3; __divdf3; __divsf3; __eqdf2; __eqsf2; __extendsfdf2;
++    __fixdfdi; __fixdfsi; __fixsfdi; __fixsfsi;
++    __fixunsdfdi; __fixunsdfsi; __fixunssfdi; __fixunssfsi;
++    __floatdidf; __floatdisf; __floatsidf; __floatsisf;
++    __floatundidf; __floatundisf; __floatunsidf; __floatunsisf;
++    __gedf2; __gesf2; __gtdf2; __gtsf2; __ledf2; __lesf2; __ltdf2; __ltsf2;
++    __muldf3; __mulsf3; __nedf2; __nesf2; __negdf2; __negsf2;
++    __subdf3; __subsf3; __truncdfsf2; __unorddf2; __unordsf2;
++    __syscall_error;
++  }
++}
+diff --git a/sysdeps/arc/__longjmp.S b/sysdeps/arc/__longjmp.S
+new file mode 100644
+index 0000000..f260c65
+--- /dev/null
++++ b/sysdeps/arc/__longjmp.S
+@@ -0,0 +1,50 @@
++/* longjmp for ARC.
++   Copyright (C) 2017 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public License as
++   published by the Free Software Foundation; either version 2.1 of the
++   License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library.  If not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sysdep.h>
++#include <jmpbuf-offsets.h>
++
++;@ r0 = jump buffer from which regs will be restored
++;@ r1 = value that setjmp( ) will return due to this longjmp
++
++ENTRY(__longjmp)
++
++	ld_s r13, [r0]
++	ld_s r14, [r0,4]
++	ld   r15, [r0,8]
++	ld   r16, [r0,12]
++	ld   r17, [r0,16]
++	ld   r18, [r0,20]
++	ld   r19, [r0,24]
++	ld   r20, [r0,28]
++	ld   r21, [r0,32]
++	ld   r22, [r0,36]
++	ld   r23, [r0,40]
++	ld   r24, [r0,44]
++	ld   r25, [r0,48]
++
++	ld   blink, [r0,60]	; load it early enough to not stall the pipeline
++	ld   fp,    [r0,52]
++	ld   sp,    [r0,56]
++
++	mov.f  r0, r1	; get the setjmp return value(due to longjmp) in place
++
++	j.d    [blink]	; to caller of setjmp location, right after the call
++	mov.z  r0, 1	; can't let setjmp return 0 when it is due to longjmp
++
++END(__longjmp)
+diff --git a/sysdeps/arc/abort-instr.h b/sysdeps/arc/abort-instr.h
+new file mode 100644
+index 0000000..474098e
+--- /dev/null
++++ b/sysdeps/arc/abort-instr.h
+@@ -0,0 +1,2 @@
++/* FLAG 1 is privilege mode only instruction, hence will crash any program */
++#define ABORT_INSTRUCTION asm ("flag 1")
+diff --git a/sysdeps/arc/atomic-machine.h b/sysdeps/arc/atomic-machine.h
+new file mode 100644
+index 0000000..d4397cd
+--- /dev/null
++++ b/sysdeps/arc/atomic-machine.h
+@@ -0,0 +1,85 @@
++/* Low-level functions for atomic operations. ARC version.
++   Copyright (C) 2012-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _ARC_BITS_ATOMIC_H
++#define _ARC_BITS_ATOMIC_H 1
++
++#include <stdint.h>
++
++typedef int32_t atomic32_t;
++typedef uint32_t uatomic32_t;
++typedef int_fast32_t atomic_fast32_t;
++typedef uint_fast32_t uatomic_fast32_t;
++
++typedef intptr_t atomicptr_t;
++typedef uintptr_t uatomicptr_t;
++typedef intmax_t atomic_max_t;
++typedef uintmax_t uatomic_max_t;
++
++#define __HAVE_64B_ATOMICS 0
++#define USE_ATOMIC_COMPILER_BUILTINS 0
++#define ATOMIC_EXCHANGE_USES_CAS 1
++
++#define __arch_compare_and_exchange_val_8_acq(mem, newval, oldval)	\
++  (abort (), (__typeof (*mem)) 0)
++#define __arch_compare_and_exchange_val_16_acq(mem, newval, oldval)	\
++  (abort (), (__typeof (*mem)) 0)
++#define __arch_compare_and_exchange_val_64_acq(mem, newval, oldval)	\
++  (abort (), (__typeof (*mem)) 0)
++
++#define __arch_compare_and_exchange_bool_8_acq(mem, newval, oldval)	\
++  (abort (), 0)
++#define __arch_compare_and_exchange_bool_16_acq(mem, newval, oldval)	\
++  (abort (), 0)
++#define __arch_compare_and_exchange_bool_64_acq(mem, newval, oldval)	\
++  (abort (), 0)
++
++#define __arch_compare_and_exchange_val_32_acq(mem, newval, oldval)	\
++  ({									\
++	__typeof(*(mem)) prev;						\
++									\
++	__asm__ __volatile__(						\
++	"1:	llock   %0, [%1]	\n"				\
++	"	brne    %0, %2, 2f	\n"				\
++	"	scond   %3, [%1]	\n"				\
++	"	bnz     1b		\n"				\
++	"2:				\n"				\
++	: "=&r"(prev)							\
++	: "r"(mem), "ir"(oldval),					\
++	  "r"(newval) /* can't be "ir". scond can't take limm for "b" */\
++	: "cc", "memory");						\
++									\
++	prev;								\
++  })
++
++# define atomic_exchange_acq(mem, newvalue) \
++  ({									\
++	__typeof(*(mem)) __val = (newvalue);				\
++									\
++	__asm__ __volatile__(						\
++	"1:	ex   %0, [%1]	\n"					\
++	: "+r"(__val)							\
++	: "r"(mem)							\
++	: "memory");							\
++									\
++	__val;								\
++  })
++
++#define atomic_full_barrier()  ({ asm volatile ("dmb 3":::"memory"); })
++
++#endif /* _ARC_BITS_ATOMIC_H */
+diff --git a/sysdeps/arc/backtrace.c b/sysdeps/arc/backtrace.c
+new file mode 100644
+index 0000000..27ce597
+--- /dev/null
++++ b/sysdeps/arc/backtrace.c
+@@ -0,0 +1 @@
++#include <sysdeps/x86_64/backtrace.c>
+diff --git a/sysdeps/arc/bits/endian.h b/sysdeps/arc/bits/endian.h
+new file mode 100644
+index 0000000..88fbcf3
+--- /dev/null
++++ b/sysdeps/arc/bits/endian.h
+@@ -0,0 +1,12 @@
++/* The ARC architecture has selectable endianness.  */
++
++#ifndef _ENDIAN_H
++# error "Never use <bits/endian.h> directly; include <endian.h> instead."
++#endif
++
++#ifdef __BIG_ENDIAN__
++# define __BYTE_ORDER __BIG_ENDIAN
++#endif
++#ifdef __LITTLE_ENDIAN__
++# define __BYTE_ORDER __LITTLE_ENDIAN
++#endif
+diff --git a/sysdeps/arc/bits/fenv.h b/sysdeps/arc/bits/fenv.h
+new file mode 100644
+index 0000000..5317b62
+--- /dev/null
++++ b/sysdeps/arc/bits/fenv.h
+@@ -0,0 +1,52 @@
++/* Copyright (C) 2012-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _FENV_H
++# error "Never use <bits/fenv.h> directly; include <fenv.h> instead."
++#endif
++
++/* ARC hardware FPU does not support exceptions,
++   nor does the software floating-point support.  */
++#define FE_ALL_EXCEPT	0
++
++/* ARC supports only round-to-nearest.  The software
++   floating-point support also acts this way.  */
++enum
++  {
++    __FE_UNDEFINED = 0,
++
++    FE_TONEAREST =
++#define FE_TONEAREST	1
++      FE_TONEAREST,
++  };
++
++/* Type representing exception flags. */
++typedef unsigned int fexcept_t;
++
++/* Type representing floating-point environment.  */
++typedef unsigned int fenv_t;
++
++/* If the default argument is used we use this value.  */
++#define FE_DFL_ENV	((const fenv_t *) -1)
++
++#if __GLIBC_USE (IEC_60559_BFP_EXT)
++/* Type representing floating-point control modes.  */
++typedef unsigned int femode_t;
++
++/* Default floating-point control modes.  */
++# define FE_DFL_MODE	((const femode_t *) -1L)
++#endif
+diff --git a/sysdeps/arc/bits/link.h b/sysdeps/arc/bits/link.h
+new file mode 100644
+index 0000000..5854c90
+--- /dev/null
++++ b/sysdeps/arc/bits/link.h
+@@ -0,0 +1,52 @@
++/* Machine-specific declarations for dynamic linker interface, ARC version.
++   Copyright (C) 2009-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef	_LINK_H
++# error "Never include <bits/link.h> directly; use <link.h> instead."
++#endif
++
++/* Registers for entry into PLT on ARC.  */
++typedef struct La_arc_regs
++{
++  uint32_t lr_reg[8]; /* r0 through r7 (upto 8 args) */
++} La_arc_regs;
++
++/* Return values for calls from PLT on ARC.  */
++typedef struct La_arc_retval
++{
++  /* For ARCv2, a 64-bit integer return value can use 2 regs */
++  uint32_t lrv_reg[2];
++} La_arc_retval;
++
++__BEGIN_DECLS
++
++extern Elf32_Addr la_arc_gnu_pltenter (Elf32_Sym *__sym, unsigned int __ndx,
++					 uintptr_t *__refcook,
++					 uintptr_t *__defcook,
++					 La_arc_regs *__regs,
++					 unsigned int *__flags,
++					 const char *__symname,
++					 long int *__framesizep);
++extern unsigned int la_arc_gnu_pltexit (Elf32_Sym *__sym, unsigned int __ndx,
++					  uintptr_t *__refcook,
++					  uintptr_t *__defcook,
++					  const La_arc_regs *__inregs,
++					  La_arc_retval *__outregs,
++					  const char *symname);
++
++__END_DECLS
+diff --git a/sysdeps/arc/bits/setjmp.h b/sysdeps/arc/bits/setjmp.h
+new file mode 100644
+index 0000000..2f27c32
+--- /dev/null
++++ b/sysdeps/arc/bits/setjmp.h
+@@ -0,0 +1,33 @@
++/* Define the machine-dependent type `jmp_buf'.  ARC version.
++   Copyright (C) 1992-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _BITS_SETJMP_H
++#define _BITS_SETJMP_H 1
++
++#if !defined(_SETJMP_H) && !defined(_PTHREAD_H)
++# error "Never include <bits/setjmp.h> directly; use <setjmp.h> instead."
++#endif
++
++#ifndef __ASSEMBLER__
++
++/* Saves r13-r25 (callee-saved), fp (frame pointer), sp (stack pointer),
++ * blink (branch-n-link) */
++typedef int __jmp_buf[32];
++#endif
++
++#endif
+diff --git a/sysdeps/arc/bsd-_setjmp.S b/sysdeps/arc/bsd-_setjmp.S
+new file mode 100644
+index 0000000..4e6a2da
+--- /dev/null
++++ b/sysdeps/arc/bsd-_setjmp.S
+@@ -0,0 +1 @@
++/* _setjmp is in setjmp.S  */
+diff --git a/sysdeps/arc/bsd-setjmp.S b/sysdeps/arc/bsd-setjmp.S
+new file mode 100644
+index 0000000..1da848d
+--- /dev/null
++++ b/sysdeps/arc/bsd-setjmp.S
+@@ -0,0 +1 @@
++/* setjmp is in setjmp.S  */
+diff --git a/sysdeps/arc/configure b/sysdeps/arc/configure
+new file mode 100644
+index 0000000..2033957
+--- /dev/null
++++ b/sysdeps/arc/configure
+@@ -0,0 +1,17 @@
++# This file is generated from configure.ac by Autoconf.  DO NOT EDIT!
++ # Local configure fragment for sysdeps/arc.
++
++$as_echo "#define PI_STATIC_AND_HIDDEN 1" >>confdefs.h
++
++libc_cv_have_sdata_section=no
++
++# For ARC, historically ; was used for comments and not newline
++# Later # also got added to comment list, but ; couldn't be switched to
++# canonical newline as there's lots of code out there which will break
++libc_cv_asm_line_sep='`'
++cat >>confdefs.h <<_ACEOF
++#define ASM_LINE_SEP $libc_cv_asm_line_sep
++_ACEOF
++
++
++libc_cv_fpie=no
+diff --git a/sysdeps/arc/configure.ac b/sysdeps/arc/configure.ac
+new file mode 100644
+index 0000000..91e58ef
+--- /dev/null
++++ b/sysdeps/arc/configure.ac
+@@ -0,0 +1,13 @@
++GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
++# Local configure fragment for sysdeps/arc.
++
++AC_DEFINE(PI_STATIC_AND_HIDDEN)
++libc_cv_have_sdata_section=no
++
++# For ARC, historically ; was used for comments and not newline
++# Later # also got added to comment list, but ; couldn't be switched to
++# canonical newline as there's lots of code out there which will break
++libc_cv_asm_line_sep='`'
++AC_DEFINE_UNQUOTED(ASM_LINE_SEP, $libc_cv_asm_line_sep)
++
++libc_cv_fpie=no
+diff --git a/sysdeps/arc/crti.S b/sysdeps/arc/crti.S
+new file mode 100644
+index 0000000..6fa230b
+--- /dev/null
++++ b/sysdeps/arc/crti.S
+@@ -0,0 +1,77 @@
++/* Special .init and .fini section support for ARC.
++   Copyright (C) 2012-2017 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   In addition to the permissions in the GNU Lesser General Public
++   License, the Free Software Foundation gives you unlimited
++   permission to link the compiled version of this file with other
++   programs, and to distribute those programs without any restriction
++   coming from the use of this file. (The GNU Lesser General Public
++   License restrictions do apply in other respects; for example, they
++   cover modification of the file, and distribution when not linked
++   into another program.)
++
++   Note that people who make modified versions of this file are not
++   obligated to grant this special exception for their modified
++   versions; it is their choice whether to do so. The GNU Lesser
++   General Public License gives permission to release a modified
++   version without this exception; this exception also makes it
++   possible to release a modified version which carries forward this
++   exception.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library.  If not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <libc-symbols.h>
++#include <sysdep.h>
++
++#ifndef PREINIT_FUNCTION
++# define PREINIT_FUNCTION __gmon_start__
++#endif
++
++#ifndef PREINIT_FUNCTION_WEAK
++# define PREINIT_FUNCTION_WEAK 1
++#endif
++
++#if PREINIT_FUNCTION_WEAK
++	weak_extern (PREINIT_FUNCTION)
++#else
++	.hidden PREINIT_FUNCTION
++#endif
++
++	.section .init
++	.align 4
++	.global	_init
++	.type	 _init, at function
++_init:
++	st.a	blink, [sp,-4]
++	st.a	fp, [sp,-4]
++	mov	fp, sp
++#if PREINIT_FUNCTION_WEAK
++	ld	r0, [pcl, @PREINIT_FUNCTION at gotpc]
++	tst	r0, r0
++	jlnz	[r0]
++#else
++	bl	PREINIT_FUNCTION
++#endif
++
++	.section .fini
++	.align 4
++	.global	_fini
++	.type	 _fini, at function
++_fini:
++	st.a blink,[sp,-4]
++	st.a fp,[sp,-4]
++	mov fp,sp
++	.align 4
+diff --git a/sysdeps/arc/crtn.S b/sysdeps/arc/crtn.S
+new file mode 100644
+index 0000000..f866ef6
+--- /dev/null
++++ b/sysdeps/arc/crtn.S
+@@ -0,0 +1,56 @@
++/* Special .init and .fini section support for ARC.
++   Copyright (C) 2012-2017 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   In addition to the permissions in the GNU Lesser General Public
++   License, the Free Software Foundation gives you unlimited
++   permission to link the compiled version of this file with other
++   programs, and to distribute those programs without any restriction
++   coming from the use of this file. (The GNU Lesser General Public
++   License restrictions do apply in other respects; for example, they
++   cover modification of the file, and distribution when not linked
++   into another program.)
++
++   Note that people who make modified versions of this file are not
++   obligated to grant this special exception for their modified
++   versions; it is their choice whether to do so. The GNU Lesser
++   General Public License gives permission to release a modified
++   version without this exception; this exception also makes it
++   possible to release a modified version which carries forward this
++   exception.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library.  If not, see
++   <http://www.gnu.org/licenses/>.  */
++
++	.section .init
++	.align 4
++	.global	_init
++	.type	 _init, at function
++	; EPILOGUE
++	ld.ab fp,[sp,4]
++	ld blink,[sp,0]
++	j.d [blink]
++	add sp,sp,4
++;	.size	 _init,.-_init
++
++	.section .fini
++	.align 4
++	.global	_fini
++	.type	 _fini, at function
++	; EPILOGUE
++	ld.ab fp,[sp,4]
++	ld blink,[sp,0]
++	j.d [blink]
++	add sp,sp,4
++;	.size	 _fini,.-_fini
+diff --git a/sysdeps/arc/dl-machine.h b/sysdeps/arc/dl-machine.h
+new file mode 100644
+index 0000000..a9096b3
+--- /dev/null
++++ b/sysdeps/arc/dl-machine.h
+@@ -0,0 +1,332 @@
++/* Machine-dependent ELF dynamic relocation inline functions.  ARC version.
++   Copyright (C) 1995-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef dl_machine_h
++#define dl_machine_h
++
++#define ELF_MACHINE_NAME "arc"
++
++#include <string.h>
++#include <link.h>
++#include <dl-tls.h>
++
++/*
++ * Dynamic Linking ABI for ARCv2 ISA
++ *
++ *                      PLT
++ *        --------------------------------	<---- DT_PLTGOT
++ *        |  ld r11, [pcl, off-to-GOT[1] |  0
++ *        |                              |  4
++ * plt0   |  ld r10, [pcl, off-to-GOT[2] |  8
++ *        |                              | 12
++ *        |  j [r10]                     | 16
++ *        --------------------------------
++ *        |    Base address of GOT       | 20
++ *        --------------------------------
++ *        |  ld r12, [pcl, off-to-GOT[3] | 24
++ * plt1   |                              |
++ *        |  j.d    [r12]                | 32
++ *        |  mov    r12, pcl             | 36
++ *        --------------------------------
++ *        |                              | 40
++ *        ~                              ~
++ *        ~                              ~
++ *        |                              |
++ *        --------------------------------
++ *
++ *             .got
++ *        --------------
++ *        |    [0]     |
++ *        |    ...     |  Runtime address for data symbols
++ *        |    [n]     |
++ *        --------------
++ *
++ * 	     .got.plt
++ *        --------------
++ *        |    [0]     |  Build address of .dynamic
++ *        --------------
++ *        |    [1]     |  Module info - setup by ld.so
++ *        --------------
++ *        |    [2]     |  resolver entry point
++ *        --------------
++ *        |    [3]     |
++ *        |    ...     |  Runtime address for function symbols
++ *        |    [f]     |
++ *        --------------
++ *
++ * For ARCompact, the PLT is 12 bytes due to short instructions
++ *
++ *        --------------------------------
++ *        |  ld r12, [pcl, off-to-GOT[3] | 24   (12 bytes each)
++ * plt1   |                              |
++ *        |  j_s.d  [r12]                | 32
++ *        |  mov_s  r12, pcl             | 34
++ *        --------------------------------
++ *        |                              | 36
++ *
++ */
++
++/* Return nonzero iff ELF header is compatible with the running host.  */
++static inline int
++elf_machine_matches_host (const Elf32_Ehdr *ehdr)
++{
++  return ehdr->e_machine == EM_ARCV2;
++}
++
++/*
++ * Get build time address of .dynamic as setup in GOT[0]
++ * This is called very early in _dl_start() so it has not been relocated to
++ * runtime value
++ */
++static inline Elf32_Addr
++elf_machine_dynamic (void)
++{
++  extern const Elf32_Addr _GLOBAL_OFFSET_TABLE_[] attribute_hidden;
++  return _GLOBAL_OFFSET_TABLE_[0];
++}
++
++
++/* Return the run-time load address of the shared object.  */
++static inline Elf32_Addr
++elf_machine_load_address (void)
++{
++  Elf32_Addr build_addr, run_addr;
++
++  /* For build address, below generates
++   * ld  r0, [pcl, _GLOBAL_OFFSET_TABLE_ at pcl]
++   */
++  build_addr = elf_machine_dynamic();
++  __asm__ ("add %0, pcl, _DYNAMIC at pcl	\n" : "=r" (run_addr));
++
++  return run_addr - build_addr;
++}
++
++/* Set up the loaded object described by L so its unrelocated PLT
++   entries will jump to the on-demand fixup code in dl-runtime.c.  */
++
++static inline int __attribute__ ((always_inline))
++elf_machine_runtime_setup (struct link_map *l, int lazy, int profile)
++{
++  extern void _dl_runtime_resolve (Elf32_Word);
++
++  if (l->l_info[DT_JMPREL] && lazy)
++    {
++      /* On ARC DT_PLTGOT point to .plt whose 5th word (after the PLT header)
++       * contains the address of .got */
++      Elf32_Addr *plt_base = (Elf32_Addr *) D_PTR (l, l_info[DT_PLTGOT]);
++      Elf32_Addr *got = (Elf32_Addr *) (plt_base[5] + l->l_addr);
++
++      got[1] = (Elf32_Addr) l;	/* Identify this shared object.  */
++
++      /* This function will get called to fix up the GOT entry indicated by
++	 the offset on the stack, and then jump to the resolved address.  */
++      got[2] = (Elf32_Addr) &_dl_runtime_resolve;
++    }
++
++  return lazy;
++}
++
++/* What this code does:
++    -ldso starts execution here when kernel returns from execve()
++    -calls into generic ldso entry point _dl_start( )
++    -optionally adjusts argc for executable if exec passed as cmd
++    -calls into app main with address of finaliser */
++
++#define RTLD_START asm ("\
++.text								\n\
++.globl _start							\n\
++.type _start, @function						\n\
++_start:								\n\
++	; (1). bootstrap ld.so					\n\
++	bl.d    _dl_start                                       \n\
++	mov_s   r0, sp          ; pass ptr to aux vector tbl    \n\
++	mov r13, r0		; safekeep app elf entry point	\n\
++								\n\
++	; (2). If ldso ran with executable as arg		\n\
++	;      skip the extra args calc by dl_start()		\n\
++	ld_s    r1, [sp]       ; orig argc			\n\
++	ld      r12, [pcl, _dl_skip_args at pcl]                   \n\
++	breq	r12, 0, 1f					\n\
++								\n\
++	add2    sp, sp, r12    ; discard argv entries from stack\n\
++	sub_s   r1, r1, r12    ; adjusted argc, on stack        \n\
++	st_s    r1, [sp]                                        \n\
++	add	r2, sp, 4					\n\
++	ld	r3, [pcl, _dl_argv at gotpc]    ; ST doesn't support this addressing mode	\n\
++	st	r2, [r3]					\n\
++1:								\n\
++	; (3). call preinit stuff				\n\
++	ld	r0, [pcl, _rtld_local at pcl]			\n\
++	add	r2, sp, 4	; argv				\n\
++	add2	r3, r2, r1					\n\
++	add	r3, r3, 4	; env				\n\
++	bl	_dl_init at plt					\n\
++								\n\
++	; (4) call app elf entry point				\n\
++	add     r0, pcl, _dl_fini at pcl				\n\
++	j	[r13]						\n\
++								\n\
++	.size  _start,.-_start                                  \n\
++	.previous                                               \n\
++");
++
++/* ELF_RTYPE_CLASS_PLT iff TYPE describes relocation of a PLT entry, so
++   PLT entries should not be allowed to define the value.
++   ELF_RTYPE_CLASS_NOCOPY iff TYPE should not be allowed to resolve to one
++   of the main executable's symbols, as for a COPY reloc.  */
++#define elf_machine_type_class(type)				\
++  ((((type) == R_ARC_JUMP_SLOT					\
++     || (type) == R_ARC_TLS_DTPMOD				\
++     || (type) == R_ARC_TLS_DTPOFF				\
++     || (type) == R_ARC_TLS_TPOFF) * ELF_RTYPE_CLASS_PLT)	\
++   | (((type) == R_ARC_COPY) * ELF_RTYPE_CLASS_COPY))
++
++/* A reloc type used for ld.so cmdline arg lookups to reject PLT entries.  */
++#define ELF_MACHINE_JMP_SLOT  R_ARC_JUMP_SLOT
++
++/* ARC uses Elf32_Rela relocations.  */
++#define ELF_MACHINE_NO_REL 1
++#define ELF_MACHINE_NO_RELA 0
++
++/* Fixup a PLT entry to bounce directly to the function at VALUE.  */
++
++static inline Elf32_Addr
++elf_machine_fixup_plt (struct link_map *map, lookup_t t,
++		       const ElfW(Sym) *refsym, const ElfW(Sym) *sym,
++		       const Elf32_Rela *reloc,
++		       Elf32_Addr *reloc_addr, Elf32_Addr value)
++{
++  return *reloc_addr = value;
++}
++
++/* Return the final value of a plt relocation.  */
++static inline Elf32_Addr
++elf_machine_plt_value (struct link_map *map, const Elf32_Rela *reloc,
++                       Elf32_Addr value)
++{
++  return value;
++}
++
++/* Names of the architecture-specific auditing callback functions.  */
++#define ARCH_LA_PLTENTER arc_gnu_pltenter
++#define ARCH_LA_PLTEXIT arc_gnu_pltexit
++
++#endif /* dl_machine_h */
++
++#ifdef RESOLVE_MAP
++
++auto inline void __attribute__ ((always_inline))
++elf_machine_rela (struct link_map *map, const ElfW(Rela) *reloc,
++                  const ElfW(Sym) *sym, const struct r_found_version *version,
++                  void *const reloc_addr_arg, int skip_ifunc)
++{
++  Elf32_Addr *const reloc_addr = reloc_addr_arg;
++  const unsigned int r_type = ELF32_R_TYPE (reloc->r_info);
++
++  if (__glibc_unlikely (r_type == R_ARC_RELATIVE))
++    *reloc_addr += map->l_addr;
++  else if (__glibc_unlikely (r_type == R_ARC_NONE))
++    return;
++  else
++    {
++      const Elf32_Sym *const refsym = sym;
++      struct link_map *sym_map = RESOLVE_MAP (&sym, version, r_type);
++      Elf32_Addr value = sym == NULL ? 0 : sym_map->l_addr + sym->st_value;
++
++      switch (r_type)
++	{
++        case R_ARC_COPY:
++          if (sym == NULL)
++            /* This can happen in trace mode if an object could not be
++               found.  */
++            break;
++          if (sym->st_size > refsym->st_size
++              || (sym->st_size < refsym->st_size && GLRO(dl_verbose)))
++            {
++              const char *strtab;
++
++              strtab = (const void *) D_PTR (map, l_info[DT_STRTAB]);
++              _dl_error_printf ("\
++%s: Symbol `%s' has different size in shared object, consider re-linking\n",
++				rtld_progname ?: "<program name unknown>",
++				strtab + refsym->st_name);
++            }
++          memcpy (reloc_addr_arg, (void *) value,
++                  MIN (sym->st_size, refsym->st_size));
++          break;
++	case R_ARC_GLOB_DAT:
++	case R_ARC_JUMP_SLOT:
++            *reloc_addr = value;
++          break;
++        case R_ARC_TLS_DTPMOD:
++          /* Get the information from the link map returned by the
++             resolv function.  */
++          if (sym_map != NULL)
++            *reloc_addr = sym_map->l_tls_modid;
++          break;
++
++        case R_ARC_TLS_DTPOFF:
++          if (sym != NULL)
++            {
++              *reloc_addr = sym->st_value;
++            }
++          break;
++
++        case R_ARC_TLS_TPOFF:
++          if (sym != NULL)
++            {
++              CHECK_STATIC_TLS (map, sym_map);
++              *reloc_addr = sym_map->l_tls_offset + sym->st_value + reloc->r_addend;
++            }
++          break;
++        case R_ARC_32:
++          *reloc_addr += value + reloc->r_addend;
++          break;
++
++        case R_ARC_PC32:
++          *reloc_addr += value + reloc->r_addend - (unsigned long) reloc_addr;
++          break;
++
++	default:
++          _dl_reloc_bad_type (map, r_type, 0);
++          break;
++	}
++    }
++}
++
++auto inline void __attribute__((always_inline))
++elf_machine_rela_relative (ElfW(Addr) l_addr, const ElfW(Rela) *reloc,
++			   void *const reloc_addr_arg)
++{
++  Elf32_Addr *const reloc_addr = reloc_addr_arg;
++  *reloc_addr += l_addr; // + reloc->r_addend;
++}
++
++auto inline void __attribute__((always_inline))
++elf_machine_lazy_rel (struct link_map *map,
++		      ElfW(Addr) l_addr, const ElfW(Rela) *reloc,
++		      int skip_ifunc)
++{
++  Elf32_Addr *const reloc_addr = (void *) (l_addr + reloc->r_offset);
++  if (ELF32_R_TYPE (reloc->r_info) == R_ARC_JUMP_SLOT)
++    *reloc_addr += l_addr;
++  else
++    _dl_reloc_bad_type (map, ELF32_R_TYPE (reloc->r_info), 1);
++}
++
++#endif /* RESOLVE_MAP */
+diff --git a/sysdeps/arc/dl-runtime.c b/sysdeps/arc/dl-runtime.c
+new file mode 100644
+index 0000000..76d39fa
+--- /dev/null
++++ b/sysdeps/arc/dl-runtime.c
+@@ -0,0 +1,21 @@
++/* PLT jump into resolver passes PC of PLTn, while _dl_fixup expects the
++   address of corresponding .rela.plt entry */
++
++#ifdef __A7__
++#define ARC_PLT_SIZE	12
++#else
++#define ARC_PLT_SIZE	16
++#endif
++
++#define reloc_index					\
++({							\
++  unsigned long plt0 = D_PTR (l, l_info[DT_PLTGOT]);	\
++  unsigned long pltn = reloc_arg;			\
++  /* exclude PL0 and PLT1 */				\
++  unsigned long idx = (pltn - plt0)/ARC_PLT_SIZE - 2;	\
++  idx;							\
++})
++
++#define reloc_offset reloc_index * sizeof (PLTREL)
++
++#include <elf/dl-runtime.c>
+diff --git a/sysdeps/arc/dl-sysdep.h b/sysdeps/arc/dl-sysdep.h
+new file mode 100644
+index 0000000..dcd365e
+--- /dev/null
++++ b/sysdeps/arc/dl-sysdep.h
+@@ -0,0 +1,25 @@
++/* System-specific settings for dynamic linker code.  ARC version.
++   Copyright (C) 2009-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#include_next <dl-sysdep.h>
++
++/* _dl_argv cannot be attribute_relro, because _dl_start_user
++   might write into it after _dl_start returns.  */
++#define DL_ARGV_NOT_RELRO 1
++
++#define DL_EXTERN_PROTECTED_DATA
+diff --git a/sysdeps/arc/dl-tls.h b/sysdeps/arc/dl-tls.h
+new file mode 100644
+index 0000000..749101d
+--- /dev/null
++++ b/sysdeps/arc/dl-tls.h
+@@ -0,0 +1,30 @@
++/* Thread-local storage handling in the ELF dynamic linker.  ARC version.
++   Copyright (C) 2012-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++
++/* Type used for the representation of TLS information in the GOT.  */
++typedef struct
++{
++  unsigned long int ti_module;
++  unsigned long int ti_offset;
++} tls_index;
++
++extern void *__tls_get_addr (tls_index *ti);
++
++/* Value used for dtv entries for which the allocation is delayed.  */
++#define TLS_DTV_UNALLOCATED	((void *) -1l)
+diff --git a/sysdeps/arc/dl-trampoline.S b/sysdeps/arc/dl-trampoline.S
+new file mode 100644
+index 0000000..cf1b52e
+--- /dev/null
++++ b/sysdeps/arc/dl-trampoline.S
+@@ -0,0 +1,72 @@
++/* PLT trampolines.  ARC version.
++   Copyright (C) 2005-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sysdep.h>
++#include <libc-symbols.h>
++
++#include <sysdep.h>
++#include <sys/syscall.h>
++
++; Save the registers which resolver could possibly clobber
++; 	r0-r9: args to the function - symbol being resolved
++; 	r10-r12 are already clobbered by PLTn, PLT0 thus neednot be saved
++
++.macro	SAVE_CALLER_SAVED
++	push_s	r0
++	push_s	r1
++	push_s	r2
++	push_s	r3
++	st.a	r4, [sp, -4]
++	st.a	r5, [sp, -4]
++	st.a	r6, [sp, -4]
++	st.a	r7, [sp, -4]
++	st.a	r8, [sp, -4]
++	st.a	r9, [sp, -4]
++	push_s	blink
++.endm
++
++.macro RESTORE_CALLER_SAVED_BUT_R0
++	ld.ab	blink,[sp, 4]
++	ld.ab	r9, [sp, 4]
++	ld.ab	r8, [sp, 4]
++	ld.ab	r7, [sp, 4]
++	ld.ab	r6, [sp, 4]
++	ld.ab	r5, [sp, 4]
++	ld.ab	r4, [sp, 4]
++	pop_s   r3
++	pop_s   r2
++	pop_s   r1
++.endm
++
++; Upon entry, PLTn, which led us here, sets up the following regs
++; 	r11 = Module info (tpnt pointer as expected by resolver)
++;	r12 = PC of the PLTn itself - needed by resolver to find
++;	      corresponding .rela.plt entry
++
++ENTRY(_dl_runtime_resolve)
++	; args to func being resolved, which resolver might clobber
++	SAVE_CALLER_SAVED
++
++	mov_s 	r1, r12
++	bl.d  	_dl_fixup
++	mov   	r0, r11
++
++	RESTORE_CALLER_SAVED_BUT_R0
++	j_s.d   [r0]    ; r0 has resolved function addr
++	pop_s   r0      ; restore first arg to resolved call
++END(_dl_runtime_resolve)
+diff --git a/sysdeps/arc/gccframe.h b/sysdeps/arc/gccframe.h
+new file mode 100644
+index 0000000..e669bcf
+--- /dev/null
++++ b/sysdeps/arc/gccframe.h
+@@ -0,0 +1,21 @@
++/* Definition of object in frame unwind info.  ARC version.
++   Copyright (C) 2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#define FIRST_PSEUDO_REGISTER 40
++
++#include <sysdeps/generic/gccframe.h>
+diff --git a/sysdeps/arc/gmp-mparam.h b/sysdeps/arc/gmp-mparam.h
+new file mode 100644
+index 0000000..8b72b6b
+--- /dev/null
++++ b/sysdeps/arc/gmp-mparam.h
+@@ -0,0 +1,23 @@
++/* gmp-mparam.h -- Compiler/machine parameter header file.
++
++Copyright (C) 2017 Free Software Foundation, Inc.
++
++This file is part of the GNU MP Library.
++
++The GNU MP Library is free software; you can redistribute it and/or modify
++it under the terms of the GNU Lesser General Public License as published by
++the Free Software Foundation; either version 2.1 of the License, or (at your
++option) any later version.
++
++The GNU MP Library is distributed in the hope that it will be useful, but
++WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
++License for more details.
++
++You should have received a copy of the GNU Lesser General Public License
++along with the GNU MP Library; see the file COPYING.LIB.  If not, see
++<http://www.gnu.org/licenses/>.  */
++
++#include <sysdeps/generic/gmp-mparam.h>
++
++#define IEEE_DOUBLE_BIG_ENDIAN 0
+diff --git a/sysdeps/arc/jmpbuf-offsets.h b/sysdeps/arc/jmpbuf-offsets.h
+new file mode 100644
+index 0000000..71c482a
+--- /dev/null
++++ b/sysdeps/arc/jmpbuf-offsets.h
+@@ -0,0 +1,46 @@
++/* Private macros for accessing __jmp_buf contents.  ARC version.
++   Copyright (C) 2006-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++/* Save offsets within __jmp_buf.  */
++/* We don't use most of these symbols; they are here for documentation. */
++
++/* Callee Regs */
++#define JB_R13 0
++#define JB_R14 1
++#define JB_R15 2
++#define JB_R16 3
++#define JB_R17 4
++#define JB_R18 5
++#define JB_R19 6
++#define JB_R20 7
++#define JB_R21 8
++#define JB_R22 9
++#define JB_R23 10
++#define JB_R24 11
++#define JB_R25 12
++
++/* Frame Pointer, Stack Pointer, Branch-n-link */
++#define JB_FP  13
++#define JB_SP  14
++#define JB_BLINK  15
++
++/* We save space for some extra state to accommodate future changes.  */
++#define JB_NUM	32	/* words */
++
++/* Helper for generic ____longjmp_chk(). */
++#define JB_FRAME_ADDRESS(buf) ((void *) (unsigned long) (buf[JB_SP]))
+diff --git a/sysdeps/arc/jmpbuf-unwind.h b/sysdeps/arc/jmpbuf-unwind.h
+new file mode 100644
+index 0000000..37abb1a
+--- /dev/null
++++ b/sysdeps/arc/jmpbuf-unwind.h
+@@ -0,0 +1,47 @@
++/* Examine __jmp_buf for unwinding frames.  ARC version.
++   Copyright (C) 2005-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#include <setjmp.h>
++#include <jmpbuf-offsets.h>
++#include <stdint.h>
++#include <unwind.h>
++
++/* Test if longjmp to JMPBUF would unwind the frame
++   containing a local variable at ADDRESS.  */
++
++#define _JMPBUF_UNWINDS(jmpbuf, address, demangle) \
++  ((void *) (address) < (void *) demangle (jmpbuf[JB_SP]))
++
++#define _JMPBUF_CFA_UNWINDS_ADJ(_jmpbuf, _context, _adj) \
++  _JMPBUF_UNWINDS_ADJ (_jmpbuf, (void *) _Unwind_GetCFA (_context), _adj)
++
++static inline uintptr_t __attribute__ ((unused))
++_jmpbuf_sp (__jmp_buf jmpbuf)
++{
++  uintptr_t sp = jmpbuf[JB_SP];
++#ifdef PTR_DEMANGLE
++  PTR_DEMANGLE (sp);
++#endif
++  return sp;
++}
++
++#define _JMPBUF_UNWINDS_ADJ(_jmpbuf, _address, _adj) \
++  ((uintptr_t) (_address) - (_adj) < (uintptr_t) (_jmpbuf_sp (_jmpbuf) - (_adj)))
++
++/* We use the normal longjmp for unwinding.  */
++#define __libc_unwind_longjmp(buf, val) __libc_longjmp (buf, val)
+diff --git a/sysdeps/arc/ldsodefs.h b/sysdeps/arc/ldsodefs.h
+new file mode 100644
+index 0000000..b4df919
+--- /dev/null
++++ b/sysdeps/arc/ldsodefs.h
+@@ -0,0 +1,43 @@
++/* Run-time dynamic linker data structures for loaded ELF shared objects.
++   Copyright (C) 2000-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _ARC_LDSODEFS_H
++#define _ARC_LDSODEFS_H 1
++
++#include <elf.h>
++
++struct La_arc_regs;
++struct La_arc_retval;
++
++#define ARCH_PLTENTER_MEMBERS						\
++    ElfW(Addr) (*arc_gnu_pltenter) (ElfW(Sym) *, unsigned int,	\
++				      uintptr_t *, uintptr_t *,		\
++				      const struct La_arc_regs *,	\
++				      unsigned int *, const char *,	\
++				      long int *);
++
++#define ARCH_PLTEXIT_MEMBERS						\
++    unsigned int (*arc_gnu_pltexit) (ElfW(Sym) *, unsigned int,	\
++				       uintptr_t *, uintptr_t *,	\
++				       const struct La_arc_regs *,	\
++				       struct La_arc_retval *,	\
++				       const char *);
++
++#include_next <ldsodefs.h>
++
++#endif
+diff --git a/sysdeps/arc/libc-tls.c b/sysdeps/arc/libc-tls.c
+new file mode 100644
+index 0000000..e598424
+--- /dev/null
++++ b/sysdeps/arc/libc-tls.c
+@@ -0,0 +1,27 @@
++/* Thread-local storage handling in the ELF dynamic linker.  ARC version.
++   Copyright (C) 2005-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#include <csu/libc-tls.c>
++#include <dl-tls.h>
++
++void *
++__tls_get_addr (tls_index *ti)
++{
++  dtv_t *dtv = THREAD_DTV ();
++  return (char *) dtv[1].pointer.val + ti->ti_offset;
++}
+diff --git a/sysdeps/arc/libm-test-ulps b/sysdeps/arc/libm-test-ulps
+new file mode 100644
+index 0000000..f1a01fd
+--- /dev/null
++++ b/sysdeps/arc/libm-test-ulps
+@@ -0,0 +1,394 @@
++# Begin of automatic generation
++
++# Maximal error of functions:
++Function: "acos":
++float: 1
++ifloat: 1
++
++Function: "acosh":
++double: 2
++float: 2
++idouble: 2
++ifloat: 2
++
++Function: "asin":
++float: 1
++ifloat: 1
++
++Function: "asinh":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: "atan":
++float: 1
++ifloat: 1
++
++Function: "atan2":
++float: 1
++ifloat: 1
++
++Function: "atanh":
++double: 2
++float: 2
++idouble: 2
++ifloat: 2
++
++Function: "cabs":
++double: 1
++idouble: 1
++
++Function: Real part of "cacos":
++double: 1
++float: 2
++idouble: 1
++ifloat: 2
++
++Function: Imaginary part of "cacos":
++double: 1
++float: 2
++idouble: 1
++ifloat: 2
++
++Function: Real part of "cacosh":
++double: 1
++float: 2
++idouble: 1
++ifloat: 2
++
++Function: Imaginary part of "cacosh":
++double: 1
++float: 2
++idouble: 1
++ifloat: 2
++
++Function: "carg":
++float: 1
++ifloat: 1
++
++Function: Real part of "casin":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Imaginary part of "casin":
++double: 1
++float: 2
++idouble: 1
++ifloat: 2
++
++Function: Real part of "casinh":
++double: 1
++float: 2
++idouble: 1
++ifloat: 2
++
++Function: Imaginary part of "casinh":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Real part of "catan":
++float: 1
++ifloat: 1
++
++Function: Imaginary part of "catan":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Real part of "catanh":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Imaginary part of "catanh":
++float: 1
++ifloat: 1
++
++Function: "cbrt":
++double: 3
++float: 1
++idouble: 3
++ifloat: 1
++
++Function: Real part of "ccos":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Imaginary part of "ccos":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Real part of "ccosh":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Imaginary part of "ccosh":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Real part of "cexp":
++double: 2
++float: 1
++idouble: 2
++ifloat: 1
++
++Function: Imaginary part of "cexp":
++double: 1
++float: 2
++idouble: 1
++ifloat: 2
++
++Function: Real part of "clog":
++double: 3
++float: 3
++idouble: 3
++ifloat: 3
++
++Function: Imaginary part of "clog":
++float: 1
++ifloat: 1
++
++Function: Real part of "clog10":
++double: 3
++float: 4
++idouble: 3
++ifloat: 4
++
++Function: Imaginary part of "clog10":
++double: 2
++float: 2
++idouble: 2
++ifloat: 2
++
++Function: "cos":
++float: 1
++ifloat: 1
++
++Function: "cosh":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Real part of "cpow":
++double: 2
++float: 4
++idouble: 2
++ifloat: 4
++
++Function: Imaginary part of "cpow":
++float: 2
++ifloat: 2
++
++Function: Real part of "csin":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Real part of "csinh":
++float: 1
++ifloat: 1
++
++Function: Imaginary part of "csinh":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Real part of "csqrt":
++double: 2
++float: 2
++idouble: 2
++ifloat: 2
++
++Function: Imaginary part of "csqrt":
++double: 2
++float: 2
++idouble: 2
++ifloat: 2
++
++Function: Real part of "ctan":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: Imaginary part of "ctan":
++double: 2
++float: 1
++idouble: 2
++ifloat: 1
++
++Function: Real part of "ctanh":
++double: 2
++float: 1
++idouble: 2
++ifloat: 1
++
++Function: Imaginary part of "ctanh":
++double: 2
++float: 2
++idouble: 2
++ifloat: 2
++
++Function: "erf":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: "erfc":
++double: 3
++float: 2
++idouble: 3
++ifloat: 2
++
++Function: "exp":
++float: 1
++ifloat: 1
++
++Function: "exp10":
++double: 2
++idouble: 2
++
++Function: "exp2":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: "expm1":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: "gamma":
++double: 4
++float: 4
++idouble: 4
++ifloat: 4
++
++Function: "hypot":
++double: 1
++idouble: 1
++
++Function: "j0":
++double: 2
++float: 2
++idouble: 2
++ifloat: 2
++
++Function: "j1":
++double: 1
++float: 2
++idouble: 1
++ifloat: 2
++
++Function: "jn":
++double: 4
++float: 4
++idouble: 4
++ifloat: 4
++
++Function: "lgamma":
++double: 4
++float: 4
++idouble: 4
++ifloat: 4
++
++Function: "log":
++float: 1
++ifloat: 1
++
++Function: "log10":
++double: 2
++float: 2
++idouble: 2
++ifloat: 2
++
++Function: "log1p":
++double: 1
++float: 1
++idouble: 1
++ifloat: 1
++
++Function: "log2":
++double: 2
++float: 1
++idouble: 2
++ifloat: 1
++
++Function: "pow":
++float: 3
++ifloat: 3
++
++Function: "pow10":
++double: 2
++idouble: 2
++
++Function: "sin":
++float: 1
++ifloat: 1
++
++Function: "sincos":
++float: 1
++ifloat: 1
++
++Function: "sinh":
++double: 2
++float: 2
++idouble: 2
++ifloat: 2
++
++Function: "tan":
++float: 1
++ifloat: 1
++
++Function: "tanh":
++double: 2
++float: 2
++idouble: 2
++ifloat: 2
++
++Function: "tgamma":
++double: 5
++float: 5
++idouble: 5
++ifloat: 5
++
++Function: "y0":
++double: 2
++float: 1
++idouble: 2
++ifloat: 1
++
++Function: "y1":
++double: 3
++float: 2
++idouble: 3
++ifloat: 2
++
++Function: "yn":
++double: 3
++float: 2
++idouble: 3
++ifloat: 2
++
++# end of automatic generation
+diff --git a/sysdeps/arc/libm-test-ulps-name b/sysdeps/arc/libm-test-ulps-name
+new file mode 100644
+index 0000000..8c4fba4
+--- /dev/null
++++ b/sysdeps/arc/libm-test-ulps-name
+@@ -0,0 +1 @@
++ARC
+diff --git a/sysdeps/arc/machine-gmon.h b/sysdeps/arc/machine-gmon.h
+new file mode 100644
+index 0000000..1e19f76
+--- /dev/null
++++ b/sysdeps/arc/machine-gmon.h
+@@ -0,0 +1,30 @@
++/* Machine-dependent definitions for profiling support.  ARC version.
++   Copyright (C) 1996-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sysdep.h>
++
++#define _MCOUNT_DECL(frompc, selfpc) \
++static void __attribute_used__ __mcount_internal (u_long frompc, u_long selfpc)
++
++#define MCOUNT						\
++  asm (".globl _mcount\n\t"				\
++       ".type _mcount, at function\n\t"			\
++       "_mcount:\n\t"					\
++       "flag 1	\n\t"					\
++       ".size _mcount, . - _mcount\n\t"			\
++       );
+diff --git a/sysdeps/arc/math-tests.h b/sysdeps/arc/math-tests.h
+new file mode 100644
+index 0000000..1eddc59
+--- /dev/null
++++ b/sysdeps/arc/math-tests.h
+@@ -0,0 +1,28 @@
++/* Configuration for math tests.  ARC version.
++   Copyright (C) 2017 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++/* Current ARC soft-float does not support exceptions or rounding
++   modes.  */
++#define ROUNDING_TESTS_float(MODE)	((MODE) == FE_TONEAREST)
++#define ROUNDING_TESTS_double(MODE)	((MODE) == FE_TONEAREST)
++#define ROUNDING_TESTS_long_double(MODE)	((MODE) == FE_TONEAREST)
++#define EXCEPTION_TESTS_float	0
++#define EXCEPTION_TESTS_double	0
++#define EXCEPTION_TESTS_long_double	0
++
++#include_next <math-tests.h>
+diff --git a/sysdeps/arc/math_private.h b/sysdeps/arc/math_private.h
+new file mode 100644
+index 0000000..77416da
+--- /dev/null
++++ b/sysdeps/arc/math_private.h
+@@ -0,0 +1,33 @@
++#ifndef _MATH_PRIVATE_H
++
++/* Suppress use of exceptions here to avoid build errors if the FE_*
++   macros aren't defined. Only allow rounding modes implemented for ARC.
++
++   This does mean that some code will silently fail to report exceptions,
++   set rounding mode as expected, etc., but it allows math code to compile
++   that otherwise wouldn't (such as math/s_fma.c) and so is valuable.
++
++   We intentionally ignore the "exception" arguments of functions that
++   take an exception, since we can't even evaluate the argument
++   without causing a build failure.  The extra level of statement
++   expression wrapping avoids "statement with no effect" warnings.
++   Since the callers don't check for errors anyway, we just claim
++   success in every case.
++
++   The overrides for libc_ functions must happen before we include
++   the generic math_private.h, and the overrides for regular
++   <fenv.h> functions must happen afterwards, to avoid clashing with
++   the declarations of those functions.  */
++
++#define libc_fesetround(rnd)                   ({ 0; })
++#define libc_fetestexcept(exc)                 ({ 0; })
++#define libc_feholdexcept_setround(env, exc)   ({ (void) (env); 0; })
++#define libc_feupdateenv_test(env, exc)        ({ (void) (env); 0; })
++
++#include_next <math_private.h>
++
++#define feraiseexcept(excepts)                 ({ 0; })
++#define __feraiseexcept(excepts)               ({ 0; })
++#define feclearexcept(exc)                     ({ 0; })
++
++#endif
+diff --git a/sysdeps/arc/memusage.h b/sysdeps/arc/memusage.h
+new file mode 100644
+index 0000000..0913402
+--- /dev/null
++++ b/sysdeps/arc/memusage.h
+@@ -0,0 +1,23 @@
++/* Machine-specific definitions for memory usage profiling, ARC version.
++   Copyright (C) 2000-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#define GETSP() ({ register uintptr_t stack_ptr asm ("sp"); stack_ptr; })
++
++#define uatomic32_t unsigned int
++
++#include <sysdeps/generic/memusage.h>
+diff --git a/sysdeps/arc/nptl/Makefile b/sysdeps/arc/nptl/Makefile
+new file mode 100644
+index 0000000..69d273e
+--- /dev/null
++++ b/sysdeps/arc/nptl/Makefile
+@@ -0,0 +1,22 @@
++# NPTL makefile fragment for ARC.
++# Copyright (C) 2005-2017 Free Software Foundation, Inc.
++#
++# This file is part of the GNU C Library.
++#
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++#
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library.  If not, see
++# <http://www.gnu.org/licenses/>.
++
++ifeq ($(subdir),csu)
++gen-as-const-headers += tcb-offsets.sym
++endif
+diff --git a/sysdeps/arc/nptl/bits/pthreadtypes-arch.h b/sysdeps/arc/nptl/bits/pthreadtypes-arch.h
+new file mode 100644
+index 0000000..756a0a4
+--- /dev/null
++++ b/sysdeps/arc/nptl/bits/pthreadtypes-arch.h
+@@ -0,0 +1,70 @@
++/* Machine-specific pthread type layouts.  ARC version.
++   Copyright (C) 2012-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _BITS_PTHREADTYPES_ARCH_H
++#define _BITS_PTHREADTYPES_ARCH_H	1
++
++#include <endian.h>
++
++#define __SIZEOF_PTHREAD_ATTR_T 36
++#define __SIZEOF_PTHREAD_MUTEX_T 24
++#define __SIZEOF_PTHREAD_MUTEXATTR_T 4
++#define __SIZEOF_PTHREAD_COND_T 48
++#define __SIZEOF_PTHREAD_CONDATTR_T 4
++#define __SIZEOF_PTHREAD_RWLOCK_T 32
++#define __SIZEOF_PTHREAD_RWLOCKATTR_T 8
++#define __SIZEOF_PTHREAD_BARRIER_T 20
++#define __SIZEOF_PTHREAD_BARRIERATTR_T 4
++
++/* Data structure for mutex handling. */
++#define __PTHREAD_COMPAT_PADDING_MID
++#define __PTHREAD_COMPAT_PADDING_END
++#define __PTHREAD_MUTEX_LOCK_ELISION    0
++
++#define __LOCK_ALIGNMENT
++#define __ONCE_ALIGNMENT
++
++struct __pthread_rwlock_arch_t
++{
++  unsigned int __readers;
++  unsigned int __writers;
++  unsigned int __wrphase_futex;
++  unsigned int __writers_futex;
++  unsigned int __pad3;
++  unsigned int __pad4;
++#if __BYTE_ORDER == __BIG_ENDIAN
++  unsigned char __pad1;
++  unsigned char __pad2;
++  unsigned char __shared;
++  /* FLAGS must stay at this position in the structure to maintain
++     binary compatibility.  */
++  unsigned char __flags;
++#else
++  /* FLAGS must stay at this position in the structure to maintain
++     binary compatibility.  */
++  unsigned char __flags;
++  unsigned char __shared;
++  unsigned char __pad1;
++  unsigned char __pad2;
++#endif
++  int __cur_writer;
++};
++
++#define __PTHREAD_RWLOCK_ELISION_EXTRA 0
++
++#endif	/* bits/pthreadtypes-arch.h */
+diff --git a/sysdeps/arc/nptl/bits/semaphore.h b/sysdeps/arc/nptl/bits/semaphore.h
+new file mode 100644
+index 0000000..da13549
+--- /dev/null
++++ b/sysdeps/arc/nptl/bits/semaphore.h
+@@ -0,0 +1,32 @@
++/* Machine-specific POSIX semaphore type layouts.  ARC version.
++   Copyright (C) 2002-2017 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _SEMAPHORE_H
++# error "Never use <bits/semaphore.h> directly; include <semaphore.h> instead."
++#endif
++
++#define __SIZEOF_SEM_T	16
++
++/* Value returned if `sem_open' failed.  */
++#define SEM_FAILED      ((sem_t *) 0)
++
++typedef union
++{
++  char __size[__SIZEOF_SEM_T];
++  long int __align;
++} sem_t;
+diff --git a/sysdeps/arc/nptl/pthread_spin_lock.c b/sysdeps/arc/nptl/pthread_spin_lock.c
+new file mode 100644
+index 0000000..e1bb313
+--- /dev/null
++++ b/sysdeps/arc/nptl/pthread_spin_lock.c
+@@ -0,0 +1,24 @@
++/* pthread spin-lock implementation for ARC.
++   Copyright (C) 2005-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#define SPIN_LOCK_READS_BETWEEN_CMPXCHG 1000
++
++/* We can't use the normal "#include <nptl/pthread_spin_lock.c>" because
++   it will resolve to this very file.  Using "sysdeps/.." as reference to the
++   top level directory does the job.  */
++#include <sysdeps/../nptl/pthread_spin_lock.c>
+diff --git a/sysdeps/arc/nptl/pthreaddef.h b/sysdeps/arc/nptl/pthreaddef.h
+new file mode 100644
+index 0000000..a898eb6
+--- /dev/null
++++ b/sysdeps/arc/nptl/pthreaddef.h
+@@ -0,0 +1,32 @@
++/* pthread machine parameter definitions, ARC version.
++   Copyright (C) 2002-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++/* Default stack size.  */
++#define ARCH_STACK_DEFAULT_SIZE	(2 * 1024 * 1024)
++
++/* Required stack pointer alignment at beginning.  */
++#define STACK_ALIGN		4
++
++/* Minimal stack size after allocating thread descriptor and guard size.  */
++#define MINIMAL_REST_STACK	2048
++
++/* Alignment requirement for TCB.  */
++#define TCB_ALIGNMENT		4
++
++/* Location of current stack frame.  */
++#define CURRENT_STACK_FRAME	__builtin_frame_address (0)
+diff --git a/sysdeps/arc/nptl/tcb-offsets.sym b/sysdeps/arc/nptl/tcb-offsets.sym
+new file mode 100644
+index 0000000..56950e0
+--- /dev/null
++++ b/sysdeps/arc/nptl/tcb-offsets.sym
+@@ -0,0 +1,11 @@
++#include <sysdep.h>
++#include <tls.h>
++
++-- Derive offsets relative to the thread register.
++#define thread_offsetof(mem)	(long)(offsetof(struct pthread, mem) - sizeof(struct pthread))
++
++MULTIPLE_THREADS_OFFSET		offsetof (struct pthread, header.multiple_threads)
++TLS_PRE_TCB_SIZE		sizeof (struct pthread)
++TLS_TCB_SIZE            	sizeof(tcbhead_t)
++
++PTHREAD_TID			offsetof(struct pthread, tid)
+diff --git a/sysdeps/arc/nptl/tls.h b/sysdeps/arc/nptl/tls.h
+new file mode 100644
+index 0000000..456eeb9
+--- /dev/null
++++ b/sysdeps/arc/nptl/tls.h
+@@ -0,0 +1,151 @@
++/* Definition for thread-local data handling.  NPTL/ARC version.
++   Copyright (C) 2012-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _ARC_NPTL_TLS_H
++#define _ARC_NPTL_TLS_H	1
++
++#include <dl-sysdep.h>
++
++#ifndef __ASSEMBLER__
++# include <stdbool.h>
++# include <stddef.h>
++# include <stdint.h>
++
++#include <dl-dtv.h>
++
++/* Get system call information.  */
++# include <sysdep.h>
++
++/* The TLS blocks start right after the TCB.  */
++# define TLS_DTV_AT_TP	1
++# define TLS_TCB_AT_TP	0
++
++/* Get the thread descriptor definition.  */
++# include <nptl/descr.h>
++
++typedef struct
++{
++  dtv_t *dtv;
++  uintptr_t pointer_guard;
++} tcbhead_t;
++
++register struct pthread *__thread_self __asm__("r25");
++
++#define READ_THREAD_POINTER() ((void *) __thread_self)
++
++/* This is the size of the initial TCB.  */
++# define TLS_INIT_TCB_SIZE	sizeof (tcbhead_t)
++
++/* Alignment requirements for the initial TCB.  */
++# define TLS_INIT_TCB_ALIGN	__alignof__ (struct pthread)
++
++/* This is the size of the TCB.  */
++#ifndef TLS_TCB_SIZE
++# define TLS_TCB_SIZE		sizeof (tcbhead_t)
++#endif
++
++/* Alignment requirements for the TCB.  */
++# define TLS_TCB_ALIGN		__alignof__ (struct pthread)
++
++/* This is the size we need before TCB.  */
++# define TLS_PRE_TCB_SIZE	sizeof (struct pthread)
++
++/* Install the dtv pointer.  The pointer passed is to the element with
++   index -1 which contain the length.  */
++# define INSTALL_DTV(tcbp, dtvp) \
++  (((tcbhead_t *) (tcbp))->dtv = (dtvp) + 1)
++
++/* Install new dtv for current thread.  */
++# define INSTALL_NEW_DTV(dtv) \
++  (THREAD_DTV() = (dtv))
++
++/* Return dtv of given thread descriptor.  */
++# define GET_DTV(tcbp) \
++  (((tcbhead_t *) (tcbp))->dtv)
++
++/* Code to initially initialize the thread pointer.  */
++# define TLS_INIT_TP(tcbp)			\
++  ({                                            \
++	long result_var;			\
++	__builtin_set_thread_pointer(tcbp);     \
++	result_var = INTERNAL_SYSCALL (arc_settls, err, 1, (tcbp));	\
++	INTERNAL_SYSCALL_ERROR_P (result_var, err)			\
++	? "unknown error" : NULL;		\
++   })
++
++/* Value passed to 'clone' for initialization of the thread register.  */
++# define TLS_DEFINE_INIT_TP(tp, pd) void *tp = (pd) + 1
++
++/* Return the address of the dtv for the current thread.  */
++# define THREAD_DTV() \
++  (((tcbhead_t *) __builtin_thread_pointer ())->dtv)
++
++/* Return the thread descriptor for the current thread.  */
++# define THREAD_SELF \
++ ((struct pthread *)__builtin_thread_pointer () - 1)
++
++/* Magic for libthread_db to know how to do THREAD_SELF.  */
++# define DB_THREAD_SELF \
++  CONST_THREAD_AREA (32, sizeof (struct pthread))
++
++/* Access to data in the thread descriptor is easy.  */
++# define THREAD_GETMEM(descr, member) \
++  descr->member
++# define THREAD_GETMEM_NC(descr, member, idx) \
++  descr->member[idx]
++# define THREAD_SETMEM(descr, member, value) \
++  descr->member = (value)
++# define THREAD_SETMEM_NC(descr, member, idx, value) \
++  descr->member[idx] = (value)
++
++/* Get and set the global scope generation counter in struct pthread.  */
++#define THREAD_GSCOPE_FLAG_UNUSED 0
++#define THREAD_GSCOPE_FLAG_USED   1
++#define THREAD_GSCOPE_FLAG_WAIT   2
++#define THREAD_GSCOPE_RESET_FLAG() \
++  do									     \
++    { int __res								     \
++	= atomic_exchange_rel (&THREAD_SELF->header.gscope_flag,	     \
++			       THREAD_GSCOPE_FLAG_UNUSED);		     \
++      if (__res == THREAD_GSCOPE_FLAG_WAIT)				     \
++	lll_futex_wake (&THREAD_SELF->header.gscope_flag, 1, LLL_PRIVATE);   \
++    }									     \
++  while (0)
++#define THREAD_GSCOPE_SET_FLAG() \
++  do									     \
++    {									     \
++      THREAD_SELF->header.gscope_flag = THREAD_GSCOPE_FLAG_USED;	     \
++      atomic_write_barrier ();						     \
++    }									     \
++  while (0)
++#define THREAD_GSCOPE_WAIT() \
++  GL(dl_wait_lookup_done) ()
++
++#else
++
++# include <tcb-offsets.h>
++
++# r25 is dedicated TLS register for ARC
++.macro THREAD_SELF reg
++	# struct pthread is just ahead of TCB
++	sub     \reg, r25, TLS_PRE_TCB_SIZE
++.endm
++
++#endif /* __ASSEMBLER__ */
++
++#endif	/* tls.h */
+diff --git a/sysdeps/arc/preconfigure b/sysdeps/arc/preconfigure
+new file mode 100644
+index 0000000..8a24fcb
+--- /dev/null
++++ b/sysdeps/arc/preconfigure
+@@ -0,0 +1,6 @@
++case "$machine" in
++arc*)
++	base_machine=arc
++	machine=arc
++	;;
++esac
+diff --git a/sysdeps/arc/s_fma.c b/sysdeps/arc/s_fma.c
+new file mode 100644
+index 0000000..d9613fa
+--- /dev/null
++++ b/sysdeps/arc/s_fma.c
+@@ -0,0 +1 @@
++#include <soft-fp/fmadf4.c>
+diff --git a/sysdeps/arc/s_fmaf.c b/sysdeps/arc/s_fmaf.c
+new file mode 100644
+index 0000000..aa5c9b2
+--- /dev/null
++++ b/sysdeps/arc/s_fmaf.c
+@@ -0,0 +1 @@
++#include <soft-fp/fmasf4.c>
+diff --git a/sysdeps/arc/setjmp.S b/sysdeps/arc/setjmp.S
+new file mode 100644
+index 0000000..8c6d8f7
+--- /dev/null
++++ b/sysdeps/arc/setjmp.S
+@@ -0,0 +1,64 @@
++/* setjmp for ARC.
++   Copyright (C) 1991-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++
++#include <sysdep.h>
++
++;@ r0 = jump buffer into which regs will be saved
++ENTRY(setjmp)
++	b.d	__sigsetjmp
++	mov	r1, 1		; save signals
++END(setjmp)
++
++;@ r0 = jump buffer into which regs will be saved
++ENTRY(_setjmp)
++	b.d	__sigsetjmp
++	mov	r1, 0		; don't save signals
++END(_setjmp)
++libc_hidden_def(_setjmp)
++
++;@ r0 = jump buffer into which regs will be saved
++;@ r1 = do we need to save signals
++ENTRY(__sigsetjmp)
++
++	st_s r13, [r0]
++	st_s r14, [r0,4]
++	st   r15, [r0,8]
++	st   r16, [r0,12]
++	st   r17, [r0,16]
++	st   r18, [r0,20]
++	st   r19, [r0,24]
++	st   r20, [r0,28]
++	st   r21, [r0,32]
++	st   r22, [r0,36]
++	st   r23, [r0,40]
++	st   r24, [r0,44]
++	st   r25, [r0,48]
++	st   fp,  [r0,52]
++	st   sp,  [r0,56]
++
++	; make a note of where longjmp will return to.
++	; that will be right next to this setjmp call-site which will be
++	; contained in blink, since "C" caller of this routine will do
++	; a branch-n-link
++
++	st   blink, [r0,60]
++	b    __sigjmp_save
++
++END(__sigsetjmp)
++libc_hidden_def(__sigsetjmp)
+diff --git a/sysdeps/arc/sfp-machine.h b/sysdeps/arc/sfp-machine.h
+new file mode 100644
+index 0000000..95eefc1
+--- /dev/null
++++ b/sysdeps/arc/sfp-machine.h
+@@ -0,0 +1,51 @@
++#define _FP_W_TYPE_SIZE		32
++#define _FP_W_TYPE		unsigned long
++#define _FP_WS_TYPE		signed long
++#define _FP_I_TYPE		long
++
++#define _FP_MUL_MEAT_S(R,X,Y)				\
++  _FP_MUL_MEAT_1_wide(_FP_WFRACBITS_S,R,X,Y,umul_ppmm)
++#define _FP_MUL_MEAT_D(R,X,Y)				\
++  _FP_MUL_MEAT_2_wide(_FP_WFRACBITS_D,R,X,Y,umul_ppmm)
++#define _FP_MUL_MEAT_Q(R,X,Y)				\
++  _FP_MUL_MEAT_4_wide(_FP_WFRACBITS_Q,R,X,Y,umul_ppmm)
++
++#define _FP_MUL_MEAT_DW_S(R,X,Y)				\
++  _FP_MUL_MEAT_DW_1_wide(_FP_WFRACBITS_S,R,X,Y,umul_ppmm)
++#define _FP_MUL_MEAT_DW_D(R,X,Y)				\
++  _FP_MUL_MEAT_DW_2_wide(_FP_WFRACBITS_D,R,X,Y,umul_ppmm)
++#define _FP_MUL_MEAT_DW_Q(R,X,Y)				\
++  _FP_MUL_MEAT_DW_4_wide(_FP_WFRACBITS_Q,R,X,Y,umul_ppmm)
++
++#define _FP_DIV_MEAT_S(R,X,Y)	_FP_DIV_MEAT_1_loop(S,R,X,Y)
++#define _FP_DIV_MEAT_D(R,X,Y)	_FP_DIV_MEAT_2_udiv(D,R,X,Y)
++#define _FP_DIV_MEAT_Q(R,X,Y)	_FP_DIV_MEAT_4_udiv(Q,R,X,Y)
++
++#define _FP_NANFRAC_S		((_FP_QNANBIT_S << 1) - 1)
++#define _FP_NANFRAC_D		((_FP_QNANBIT_D << 1) - 1), -1
++#define _FP_NANFRAC_Q		((_FP_QNANBIT_Q << 1) - 1), -1, -1, -1
++#define _FP_NANSIGN_S		0
++#define _FP_NANSIGN_D		0
++#define _FP_NANSIGN_Q		0
++
++#define _FP_KEEPNANFRACP 1
++#define _FP_QNANNEGATEDP 0
++
++/* This is arbitrarily taken from the PowerPC version.  */
++#define _FP_CHOOSENAN(fs, wc, R, X, Y, OP)			\
++  do {								\
++    if ((_FP_FRAC_HIGH_RAW_##fs(X) & _FP_QNANBIT_##fs)		\
++	&& !(_FP_FRAC_HIGH_RAW_##fs(Y) & _FP_QNANBIT_##fs))	\
++      {								\
++	R##_s = Y##_s;						\
++	_FP_FRAC_COPY_##wc(R,Y);				\
++      }								\
++    else							\
++      {								\
++	R##_s = X##_s;						\
++	_FP_FRAC_COPY_##wc(R,X);				\
++      }								\
++    R##_c = FP_CLS_NAN;						\
++  } while (0)
++
++#define _FP_TININESS_AFTER_ROUNDING 0
+diff --git a/sysdeps/arc/sotruss-lib.c b/sysdeps/arc/sotruss-lib.c
+new file mode 100644
+index 0000000..24e0259
+--- /dev/null
++++ b/sysdeps/arc/sotruss-lib.c
+@@ -0,0 +1,51 @@
++/* Override generic sotruss-lib.c to define actual functions for ARC.
++   Copyright (C) 2017 Free Software Foundation, Inc.
++
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
++   <http://www.gnu.org/licenses/>.  */
++
++#define HAVE_ARCH_PLTENTER
++#define HAVE_ARCH_PLTEXIT
++
++#include <elf/sotruss-lib.c>
++
++ElfW(Addr)
++la_arc_gnu_pltenter (ElfW(Sym) *sym __attribute__ ((unused)),
++		       unsigned int ndx __attribute__ ((unused)),
++		       uintptr_t *refcook, uintptr_t *defcook,
++		       La_arc_regs *regs, unsigned int *flags,
++		       const char *symname, long int *framesizep)
++{
++  print_enter (refcook, defcook, symname,
++	       regs->lr_reg[0], regs->lr_reg[1], regs->lr_reg[2],
++	       *flags);
++
++  /* No need to copy anything, we will not need the parameters in any case.  */
++  *framesizep = 0;
++
++  return sym->st_value;
++}
++
++unsigned int
++la_arc_gnu_pltexit (ElfW(Sym) *sym, unsigned int ndx, uintptr_t *refcook,
++		      uintptr_t *defcook,
++		      const struct La_arc_regs *inregs,
++		      struct La_arc_retval *outregs, const char *symname)
++{
++  print_exit (refcook, defcook, symname, outregs->lrv_reg[0]);
++
++  return 0;
++}
+diff --git a/sysdeps/arc/stackinfo.h b/sysdeps/arc/stackinfo.h
+new file mode 100644
+index 0000000..06a24fc
+--- /dev/null
++++ b/sysdeps/arc/stackinfo.h
+@@ -0,0 +1,33 @@
++/* Stack environment definitions for ARC.
++   Copyright (C) 2012-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++/* This file contains a bit of information about the stack allocation
++   of the processor.  */
++
++#ifndef _STACKINFO_H
++#define _STACKINFO_H	1
++
++#include <elf.h>
++
++/* On ARC the stack grows down.  */
++#define _STACK_GROWS_DOWN	1
++
++/* Default to a non-executable stack.  */
++#define DEFAULT_STACK_PERMS (PF_R|PF_W)
++
++#endif	/* stackinfo.h */
+diff --git a/sysdeps/arc/start.S b/sysdeps/arc/start.S
+new file mode 100644
+index 0000000..9a0f1ed
+--- /dev/null
++++ b/sysdeps/arc/start.S
+@@ -0,0 +1,81 @@
++/* Startup code for ARC
++   Copyright (C) 1995-2017 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   In addition to the permissions in the GNU Lesser General Public
++   License, the Free Software Foundation gives you unlimited
++   permission to link the compiled version of this file with other
++   programs, and to distribute those programs without any restriction
++   coming from the use of this file. (The GNU Lesser General Public
++   License restrictions do apply in other respects; for example, they
++   cover modification of the file, and distribution when not linked
++   into another program.)
++
++   Note that people who make modified versions of this file are not
++   obligated to grant this special exception for their modified
++   versions; it is their choice whether to do so. The GNU Lesser
++   General Public License gives permission to release a modified
++   version without this exception; this exception also makes it
++   possible to release a modified version which carries forward this
++   exception.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library.  If not, see
++   <http://www.gnu.org/licenses/>.  */
++
++
++/* When we enter this piece of code, the program stack looks like this:
++        argc            argument counter (integer)
++        argv[0]         program name (pointer)
++        argv[1...N]     program args (pointers)
++        argv[argc-1]    end of args (integer)
++	NULL
++        env[0...N]      environment variables (pointers)
++        NULL
++*/
++	.text
++	.align 4
++	.global _start
++	.type _start, at function
++_start:
++	mov	fp, 0
++	ld_s	r1, [sp]	; argc
++
++	mov_s	r5, r0		; rltd_fini
++	add_s	r2, sp, 4	; argv
++	and	sp, sp, -8
++	mov	r6, sp
++
++#ifdef SHARED
++	ld	r0, [pcl, @main at gotpc]
++	ld	r3, [pcl, @__libc_csu_init at gotpc]
++	ld	r4, [pcl, @__libc_csu_fini at gotpc]
++	bl	__libc_start_main at plt
++#else
++	mov_s	r0, main
++	mov_s	r3, __libc_csu_init
++	mov	r4, __libc_csu_fini
++	bl	__libc_start_main
++#endif
++	/* __libc_start_main (main, argc, argv, init, fini, rtld_fini, stack_end) */
++
++	/* Should never get here....  */
++	flag    1
++
++/* Define a symbol for the first piece of initialized data.  */
++	.data
++	.globl __data_start
++__data_start:
++	.long 0
++	.weak data_start
++	data_start = __data_start
+diff --git a/sysdeps/arc/sysdep.h b/sysdeps/arc/sysdep.h
+new file mode 100644
+index 0000000..b9875dd
+--- /dev/null
++++ b/sysdeps/arc/sysdep.h
+@@ -0,0 +1,49 @@
++/* Assembler macros for ARC.
++   Copyright (C) 2017 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public License as
++   published by the Free Software Foundation; either version 2.1 of the
++   License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sysdeps/generic/sysdep.h>
++
++#ifdef	__ASSEMBLER__
++
++/* Syntactic details of assembler.
++ * One weirness is ; is not newline but comment
++ * Although # is also for comment
++ */
++
++#define ASM_SIZE_DIRECTIVE(name) .size name,.-name
++
++#define ENTRY(name)						\
++    .align 4					ASM_LINE_SEP	\
++    .globl C_SYMBOL_NAME(name)			ASM_LINE_SEP	\
++    .type C_SYMBOL_NAME(name),%function		ASM_LINE_SEP	\
++  C_LABEL(name)					ASM_LINE_SEP	\
++    CALL_MCOUNT
++
++#undef  END
++#define END(name)						\
++  ASM_SIZE_DIRECTIVE(name)
++
++#ifdef SHARED
++#define PLTJMP(_x)	_x##@plt
++#else
++#define PLTJMP(_x)	_x
++#endif
++
++# define CALL_MCOUNT		/* Do nothing for now.  */
++
++#endif	/* __ASSEMBLER__ */
+diff --git a/sysdeps/arc/tls-macros.h b/sysdeps/arc/tls-macros.h
+new file mode 100644
+index 0000000..51855ed
+--- /dev/null
++++ b/sysdeps/arc/tls-macros.h
+@@ -0,0 +1,29 @@
++/* Macros to support TLS testing in times of missing compiler support.  */
++
++/* For now */
++#define TLS_LD(x)	TLS_IE(x)
++
++#define TLS_GD(x)					\
++  ({ int *__result;					\
++     __asm__ ("add r0, pcl, @" #x "@tlsgd      \n"     	\
++	  ".tls_gd_ld " #x "`bl __tls_get_addr at plt \n"	\
++	  "mov %0, r0                    \n"		\
++	  : "=&r" (__result)				\
++	  ::"r0","r1","r2","r3","r4","r5","r6","r7",	\
++	    "r8","r9","r10","r11","r12");		\
++     __result; })
++
++#define TLS_LE(x)					\
++  ({ int *__result;					\
++     void *tp = __builtin_thread_pointer();		\
++     __asm__ ("add %0, %1, @" #x "@tpoff   \n"		\
++	  : "=r" (__result) : "r"(tp));	        	\
++     __result; })
++
++#define TLS_IE(x)					\
++  ({ int *__result;					\
++     void *tp = __builtin_thread_pointer();		\
++     __asm__ ("ld %0, [pcl, @" #x "@tlsie]      \n"     \
++	  "add %0, %1, %0                       \n"	\
++	  : "=&r" (__result) : "r" (tp));		\
++     __result; })
+diff --git a/sysdeps/arc/tst-audit.h b/sysdeps/arc/tst-audit.h
+new file mode 100644
+index 0000000..817276c
+--- /dev/null
++++ b/sysdeps/arc/tst-audit.h
+@@ -0,0 +1,23 @@
++/* Definitions for testing PLT entry/exit auditing.  ARC version.
++   Copyright (C) 2009-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#define pltenter la_arc_gnu_pltenter
++#define pltexit la_arc_gnu_pltexit
++#define La_regs La_arc_regs
++#define La_retval La_arc_retval
++#define int_retval lrv_reg[0]
+diff --git a/sysdeps/unix/sysv/linux/aarch64/sys/ucontext.h b/sysdeps/unix/sysv/linux/aarch64/sys/ucontext.h
+index 4f602fc..16c7acf 100644
+--- a/sysdeps/unix/sysv/linux/aarch64/sys/ucontext.h
++++ b/sysdeps/unix/sysv/linux/aarch64/sys/ucontext.h
+@@ -47,10 +47,10 @@ typedef elf_fpregset_t	fpregset_t;
+ typedef struct sigcontext mcontext_t;
+ 
+ /* Userlevel context.  */
+-typedef struct ucontext_t
++typedef struct ucontext
+   {
+     unsigned long uc_flags;
+-    struct ucontext_t *uc_link;
++    struct ucontext *uc_link;
+     stack_t uc_stack;
+     sigset_t uc_sigmask;
+     mcontext_t uc_mcontext;
+diff --git a/sysdeps/unix/sysv/linux/arc/Implies b/sysdeps/unix/sysv/linux/arc/Implies
+new file mode 100644
+index 0000000..7f739a0
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/Implies
+@@ -0,0 +1,3 @@
++arc/nptl
++unix/sysv/linux/generic/wordsize-32
++unix/sysv/linux/generic
+diff --git a/sysdeps/unix/sysv/linux/arc/Makefile b/sysdeps/unix/sysv/linux/arc/Makefile
+new file mode 100644
+index 0000000..c22425f
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/Makefile
+@@ -0,0 +1,9 @@
++ifeq ($(subdir),stdlib)
++gen-as-const-headers += ucontext_i.sym
++endif
++
++ifeq ($(subdir),misc)
++# MIPS/Tile-style cacheflush routine
++sysdep_headers += sys/cachectl.h
++sysdep_routines += cacheflush
++endif
+diff --git a/sysdeps/unix/sysv/linux/arc/Versions b/sysdeps/unix/sysv/linux/arc/Versions
+new file mode 100644
+index 0000000..61e94bb
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/Versions
+@@ -0,0 +1,6 @@
++libc {
++  GLIBC_2.26 {
++    _flush_cache;
++    cacheflush;
++  }
++}
+diff --git a/sysdeps/unix/sysv/linux/arc/arch-fork.h b/sysdeps/unix/sysv/linux/arc/arch-fork.h
+new file mode 100644
+index 0000000..ecfb914
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/arch-fork.h
+@@ -0,0 +1,35 @@
++/* ARCH_FORK definition for Linux fork implementation.  ARC version.
++   Copyright (C) 2005-2017 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sched.h>
++#include <signal.h>
++#include <sysdep.h>
++#include <tls.h>
++
++/* Argument 1 - Clone flags.
++            2 - Child stack pointer.
++	    3 - Parent tid pointer.
++	    4 - New TLS area pointer.
++	    5 - Child tid pointer. */
++
++/* clone syscall in kernel (ABI: CONFIG_CLONE_BACKWARDS) */
++
++#define ARCH_FORK() \
++  INLINE_SYSCALL (clone, 5,						\
++		  CLONE_CHILD_SETTID | CLONE_CHILD_CLEARTID | SIGCHLD,	\
++                  NULL, NULL, NULL, &THREAD_SELF->tid)
+diff --git a/sysdeps/unix/sysv/linux/arc/bits/mman.h b/sysdeps/unix/sysv/linux/arc/bits/mman.h
+new file mode 100644
+index 0000000..2bd769b
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/bits/mman.h
+@@ -0,0 +1,42 @@
++/* Definitions for POSIX memory map interface.  Linux/ARC version.
++
++   Copyright (C) 1997-2017 Free Software Foundation, Inc.
++
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
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _SYS_MMAN_H
++# error "Never use <bits/mman.h> directly; include <sys/mman.h> instead."
++#endif
++
++/* The following definitions basically come from the kernel headers.
++   But the kernel header is not namespace clean.  */
++
++/* These are Linux-specific.  */
++#ifdef __USE_MISC
++# define MAP_GROWSDOWN	0x00100		/* Stack-like segment.  */
++# define MAP_DENYWRITE	0x00800		/* ETXTBSY */
++# define MAP_EXECUTABLE	0x01000		/* Mark it as an executable.  */
++# define MAP_LOCKED	0x02000		/* Lock the mapping.  */
++# define MAP_NORESERVE	0x04000		/* Don't check for reservations.  */
++# define MAP_POPULATE	0x08000		/* Populate (prefault) pagetables.  */
++# define MAP_NONBLOCK	0x10000		/* Do not block on IO.  */
++# define MAP_STACK	0x20000		/* Allocation is for a stack.  */
++# define MAP_HUGETLB	0x40000		/* Create huge page mapping.  */
++#endif
++
++/* Include generic Linux declarations.  */
++#include <bits/mman-linux.h>
+diff --git a/sysdeps/unix/sysv/linux/arc/bits/sigaction.h b/sysdeps/unix/sysv/linux/arc/bits/sigaction.h
+new file mode 100644
+index 0000000..9795e99
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/bits/sigaction.h
+@@ -0,0 +1,78 @@
++/* The proper definitions for Linux's sigaction.
++   Copyright (C) 1993-2016 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _SIGNAL_H
++# error "Never include <bits/sigaction.h> directly; use <signal.h> instead."
++#endif
++
++/* Structure describing the action to be taken when a signal arrives.  */
++struct sigaction
++  {
++    /* Signal handler.  */
++#ifdef __USE_POSIX199309
++    union
++      {
++	/* Used if SA_SIGINFO is not set.  */
++	__sighandler_t sa_handler;
++	/* Used if SA_SIGINFO is set.  */
++	void (*sa_sigaction) (int, siginfo_t *, void *);
++      }
++    __sigaction_handler;
++# define sa_handler	__sigaction_handler.sa_handler
++# define sa_sigaction	__sigaction_handler.sa_sigaction
++#else
++    __sighandler_t sa_handler;
++#endif
++
++    /* Special flags.  */
++    unsigned long sa_flags;
++
++    /* Restore handler.  */
++    void (*sa_restorer) (void);
++
++    /* Additional set of signals to be blocked.  */
++    __sigset_t sa_mask;
++  };
++
++/* Bits in `sa_flags'.  */
++#define	SA_NOCLDSTOP  1		 /* Don't send SIGCHLD when children stop.  */
++#define SA_NOCLDWAIT  2		 /* Don't create zombie on child death.  */
++#define SA_SIGINFO    4		 /* Invoke signal-catching function with
++				    three arguments instead of one.  */
++#if defined __USE_UNIX98 || defined __USE_MISC
++# define SA_ONSTACK   0x08000000 /* Use signal stack by using `sa_restorer'. */
++#endif
++#if defined __USE_UNIX98 || defined __USE_XOPEN2K8
++# define SA_RESTART   0x10000000 /* Restart syscall on signal return.  */
++# define SA_NODEFER   0x40000000 /* Don't automatically block the signal when
++				    its handler is being executed.  */
++# define SA_RESETHAND 0x80000000 /* Reset to SIG_DFL on entry to handler.  */
++#endif
++#ifdef __USE_MISC
++# define SA_INTERRUPT 0x20000000 /* Historical no-op.  */
++
++/* Some aliases for the SA_ constants.  */
++# define SA_NOMASK    SA_NODEFER
++# define SA_ONESHOT   SA_RESETHAND
++# define SA_STACK     SA_ONSTACK
++#endif
++
++/* Values for the HOW argument to `sigprocmask'.  */
++#define	SIG_BLOCK     0		 /* Block signals.  */
++#define	SIG_UNBLOCK   1		 /* Unblock signals.  */
++#define	SIG_SETMASK   2		 /* Set the set of blocked signals.  */
+diff --git a/sysdeps/unix/sysv/linux/arc/c++-types.data b/sysdeps/unix/sysv/linux/arc/c++-types.data
+new file mode 100644
+index 0000000..303f457
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/c++-types.data
+@@ -0,0 +1,67 @@
++blkcnt64_t:x
++blkcnt_t:l
++blksize_t:i
++caddr_t:Pc
++clockid_t:i
++clock_t:l
++daddr_t:i
++dev_t:y
++fd_mask:l
++fsblkcnt64_t:y
++fsblkcnt_t:m
++fsfilcnt64_t:y
++fsfilcnt_t:m
++fsid_t:8__fsid_t
++gid_t:j
++id_t:j
++ino64_t:y
++ino_t:m
++int16_t:s
++int32_t:i
++int64_t:x
++int8_t:a
++intptr_t:i
++key_t:i
++loff_t:x
++mode_t:j
++nlink_t:j
++off64_t:x
++off_t:l
++pid_t:i
++pthread_attr_t:14pthread_attr_t
++pthread_barrier_t:17pthread_barrier_t
++pthread_barrierattr_t:21pthread_barrierattr_t
++pthread_cond_t:14pthread_cond_t
++pthread_condattr_t:18pthread_condattr_t
++pthread_key_t:j
++pthread_mutex_t:15pthread_mutex_t
++pthread_mutexattr_t:19pthread_mutexattr_t
++pthread_once_t:i
++pthread_rwlock_t:16pthread_rwlock_t
++pthread_rwlockattr_t:20pthread_rwlockattr_t
++pthread_spinlock_t:i
++pthread_t:m
++quad_t:x
++register_t:i
++rlim64_t:y
++rlim_t:m
++sigset_t:10__sigset_t
++size_t:j
++socklen_t:j
++ssize_t:i
++suseconds_t:l
++time_t:l
++u_char:h
++uid_t:j
++uint:j
++u_int:j
++u_int16_t:t
++u_int32_t:j
++u_int64_t:y
++u_int8_t:h
++ulong:m
++u_long:m
++u_quad_t:y
++useconds_t:j
++ushort:t
++u_short:t
+diff --git a/sysdeps/unix/sysv/linux/arc/cacheflush.c b/sysdeps/unix/sysv/linux/arc/cacheflush.c
+new file mode 100644
+index 0000000..1e101f7
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/cacheflush.c
+@@ -0,0 +1,29 @@
++/* cacheflush system call for ARC Linux.
++   Copyright (C) 2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sysdep.h>
++#include <stddef.h>
++#include <unistd.h>
++
++/* Flush cache(s).  */
++int
++_flush_cache (char *addr, const int nbytes, const int op)
++{
++  return INLINE_SYSCALL (cacheflush, 3, addr, nbytes, op);
++}
++weak_alias (_flush_cache, cacheflush)
+diff --git a/sysdeps/unix/sysv/linux/arc/clone.S b/sysdeps/unix/sysv/linux/arc/clone.S
+new file mode 100644
+index 0000000..cc0a106
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/clone.S
+@@ -0,0 +1,97 @@
++/* clone() implementation for ARC.
++   Copyright (C) 2008-2017 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Contributed by Andrew Jenner <andrew@codesourcery.com>, 2008.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++
++#include <sysdep.h>
++#define _ERRNO_H	1
++#include <bits/errno.h>
++#include <tcb-offsets.h>
++
++#define CLONE_SETTLS		0x00080000
++
++; int clone(int (*fn)(void *), void *child_stack,
++;           int flags, void *arg, ...
++;           /* pid_t *ptid, struct user_desc *tls, pid_t *ctid */);
++;
++; NOTE: I'm assuming that the last 3 args are NOT var-args and in case all
++;	3 are not relevant, caller will nevertheless pass those as NULL.
++;       Current (Jul 2012) upstream powerpc/clone.S assumes similarly.
++;	Our LTP (from 2007) doesn't seem to have tests to prove otherwise
++
++; clone syscall in kernel (ABI: CONFIG_CLONE_BACKWARDS)
++;
++; int sys_clone(unsigned long clone_flags,
++;		unsigned long newsp,
++;		int __user *parent_tidptr,
++;		void *tls,
++;		int __user *child_tidptr)
++
++ENTRY(__clone)
++	cmp	r0, 0		; @fn can't be NULL
++	cmp.ne	r1, 0		; @child_stack can't be NULL
++	bz	.L__sys_err
++
++	; save some of the orig args
++	; r0 containg @fn will be clobbered AFTER syscall (with ret val)
++	; rest are clobbered BEFORE syscall due to different arg ordering
++	mov	r10, r0		; @fn
++	mov	r11, r3		; @args
++	mov	r12, r2		; @clone_flags
++	mov	r9,  r5		; @tls
++
++	; adjust libc args for syscall
++
++	mov 	r0, r2		; libc @flags is 1st syscall arg
++	mov	r2, r4		; libc @ptid
++	mov	r3, r5		; libc @tls
++	mov	r4, r6		; libc @ctid
++	mov	r8, __NR_clone
++	ARC_TRAP_INSN
++
++	cmp	r0, 0		; return code : 0 new process, !0 parent
++	blt	.L__sys_err2	; < 0 (signed) error
++	jnz	[blink]		; Parent returns
++
++	; ----- child starts here ---------
++
++	; Setup TP register (since kernel doesn't do that)
++	and.f	0, r12, CLONE_SETTLS
++	mov.nz	r25, r9
++
++	; child jumps off to @fn with @arg as argument, and returns here
++	jl.d	[r10]
++	mov	r0, r11
++
++	; falls thru to _exit() with result from @fn (already in r0)
++	b	HIDDEN_JUMPTARGET(_exit)
++
++.L__sys_err:
++	mov	r0, -EINVAL
++.L__sys_err2:
++	; (1) No need to make -ve kernel error code as positive errno
++	;   __syscall_error expects the -ve error code returned by kernel
++	; (2) r0 still had orig -ve kernel error code
++	; (3) Tail call to __syscall_error so we dont have to come back
++	;     here hence instead of jmp-n-link (reg push/pop) we do jmp
++	; (4) No need to route __syscall_error via PLT, B is inherently
++	;     position independent
++	b   __syscall_error
++PSEUDO_END (__clone)
++libc_hidden_def (__clone)
++weak_alias (__clone, clone)
+diff --git a/sysdeps/unix/sysv/linux/arc/configure b/sysdeps/unix/sysv/linux/arc/configure
+new file mode 100644
+index 0000000..f74fa7c
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/configure
+@@ -0,0 +1,4 @@
++# This file is generated from configure.in by Autoconf.  DO NOT EDIT!
++ # Local configure fragment for sysdeps/unix/sysv/linux/arc.
++
++arch_minimum_kernel=3.9.0
+diff --git a/sysdeps/unix/sysv/linux/arc/configure.ac b/sysdeps/unix/sysv/linux/arc/configure.ac
+new file mode 100644
+index 0000000..a952803
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/configure.ac
+@@ -0,0 +1,4 @@
++GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
++# Local configure fragment for sysdeps/unix/sysv/linux/arc.
++
++arch_minimum_kernel=3.9.0
+diff --git a/sysdeps/unix/sysv/linux/arc/kernel-features.h b/sysdeps/unix/sysv/linux/arc/kernel-features.h
+new file mode 100644
+index 0000000..bc75189
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/kernel-features.h
+@@ -0,0 +1,25 @@
++/* Set flags signalling availability of kernel features based on given
++   kernel version number.
++
++   Copyright (C) 2009-2017 Free Software Foundation, Inc.
++
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++/* The minimum supported kernel version for ARC is 3.9,
++   guaranteeing many kernel features.  */
++
++#include_next <kernel-features.h>
+diff --git a/sysdeps/unix/sysv/linux/arc/ld.abilist b/sysdeps/unix/sysv/linux/arc/ld.abilist
+new file mode 100644
+index 0000000..f8d0631
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/ld.abilist
+@@ -0,0 +1,10 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 __libc_stack_end D 0x4
++GLIBC_2.26 __stack_chk_guard D 0x4
++GLIBC_2.26 __tls_get_addr F
++GLIBC_2.26 _dl_mcount F
++GLIBC_2.26 _r_debug D 0x14
++GLIBC_2.26 calloc F
++GLIBC_2.26 free F
++GLIBC_2.26 malloc F
++GLIBC_2.26 realloc F
+diff --git a/sysdeps/unix/sysv/linux/arc/ldconfig.h b/sysdeps/unix/sysv/linux/arc/ldconfig.h
+new file mode 100644
+index 0000000..d041329
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/ldconfig.h
+@@ -0,0 +1,25 @@
++/* dynamic linker names for ARC
++   Copyright (C) 2001-2017 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sysdeps/generic/ldconfig.h>
++
++#define SYSDEP_KNOWN_INTERPRETER_NAMES \
++  { "/lib/ld-linux.so.2", FLAG_ELF_LIBC6 },
++#define SYSDEP_KNOWN_LIBRARY_NAMES \
++  { "libc.so.6", FLAG_ELF_LIBC6 },	\
++  { "libm.so.6", FLAG_ELF_LIBC6 },
+diff --git a/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist b/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
+new file mode 100644
+index 0000000..a3bb65e
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
+@@ -0,0 +1,2 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 __ctype_get_mb_cur_max F
+diff --git a/sysdeps/unix/sysv/linux/arc/libanl.abilist b/sysdeps/unix/sysv/linux/arc/libanl.abilist
+new file mode 100644
+index 0000000..7898d86
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/libanl.abilist
+@@ -0,0 +1,5 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 gai_cancel F
++GLIBC_2.26 gai_error F
++GLIBC_2.26 gai_suspend F
++GLIBC_2.26 getaddrinfo_a F
+diff --git a/sysdeps/unix/sysv/linux/arc/libc.abilist b/sysdeps/unix/sysv/linux/arc/libc.abilist
+new file mode 100644
+index 0000000..942e9b8
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/libc.abilist
+@@ -0,0 +1,2064 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 _Exit F
++GLIBC_2.26 _IO_2_1_stderr_ D 0x98
++GLIBC_2.26 _IO_2_1_stdin_ D 0x98
++GLIBC_2.26 _IO_2_1_stdout_ D 0x98
++GLIBC_2.26 _IO_adjust_column F
++GLIBC_2.26 _IO_adjust_wcolumn F
++GLIBC_2.26 _IO_default_doallocate F
++GLIBC_2.26 _IO_default_finish F
++GLIBC_2.26 _IO_default_pbackfail F
++GLIBC_2.26 _IO_default_uflow F
++GLIBC_2.26 _IO_default_xsgetn F
++GLIBC_2.26 _IO_default_xsputn F
++GLIBC_2.26 _IO_do_write F
++GLIBC_2.26 _IO_doallocbuf F
++GLIBC_2.26 _IO_fclose F
++GLIBC_2.26 _IO_fdopen F
++GLIBC_2.26 _IO_feof F
++GLIBC_2.26 _IO_ferror F
++GLIBC_2.26 _IO_fflush F
++GLIBC_2.26 _IO_fgetpos F
++GLIBC_2.26 _IO_fgetpos64 F
++GLIBC_2.26 _IO_fgets F
++GLIBC_2.26 _IO_file_attach F
++GLIBC_2.26 _IO_file_close F
++GLIBC_2.26 _IO_file_close_it F
++GLIBC_2.26 _IO_file_doallocate F
++GLIBC_2.26 _IO_file_finish F
++GLIBC_2.26 _IO_file_fopen F
++GLIBC_2.26 _IO_file_init F
++GLIBC_2.26 _IO_file_jumps D 0x54
++GLIBC_2.26 _IO_file_open F
++GLIBC_2.26 _IO_file_overflow F
++GLIBC_2.26 _IO_file_read F
++GLIBC_2.26 _IO_file_seek F
++GLIBC_2.26 _IO_file_seekoff F
++GLIBC_2.26 _IO_file_setbuf F
++GLIBC_2.26 _IO_file_stat F
++GLIBC_2.26 _IO_file_sync F
++GLIBC_2.26 _IO_file_underflow F
++GLIBC_2.26 _IO_file_write F
++GLIBC_2.26 _IO_file_xsputn F
++GLIBC_2.26 _IO_flockfile F
++GLIBC_2.26 _IO_flush_all F
++GLIBC_2.26 _IO_flush_all_linebuffered F
++GLIBC_2.26 _IO_fopen F
++GLIBC_2.26 _IO_fprintf F
++GLIBC_2.26 _IO_fputs F
++GLIBC_2.26 _IO_fread F
++GLIBC_2.26 _IO_free_backup_area F
++GLIBC_2.26 _IO_free_wbackup_area F
++GLIBC_2.26 _IO_fsetpos F
++GLIBC_2.26 _IO_fsetpos64 F
++GLIBC_2.26 _IO_ftell F
++GLIBC_2.26 _IO_ftrylockfile F
++GLIBC_2.26 _IO_funlockfile F
++GLIBC_2.26 _IO_fwrite F
++GLIBC_2.26 _IO_getc F
++GLIBC_2.26 _IO_getline F
++GLIBC_2.26 _IO_getline_info F
++GLIBC_2.26 _IO_gets F
++GLIBC_2.26 _IO_init F
++GLIBC_2.26 _IO_init_marker F
++GLIBC_2.26 _IO_init_wmarker F
++GLIBC_2.26 _IO_iter_begin F
++GLIBC_2.26 _IO_iter_end F
++GLIBC_2.26 _IO_iter_file F
++GLIBC_2.26 _IO_iter_next F
++GLIBC_2.26 _IO_least_wmarker F
++GLIBC_2.26 _IO_link_in F
++GLIBC_2.26 _IO_list_all D 0x4
++GLIBC_2.26 _IO_list_lock F
++GLIBC_2.26 _IO_list_resetlock F
++GLIBC_2.26 _IO_list_unlock F
++GLIBC_2.26 _IO_marker_delta F
++GLIBC_2.26 _IO_marker_difference F
++GLIBC_2.26 _IO_padn F
++GLIBC_2.26 _IO_peekc_locked F
++GLIBC_2.26 _IO_popen F
++GLIBC_2.26 _IO_printf F
++GLIBC_2.26 _IO_proc_close F
++GLIBC_2.26 _IO_proc_open F
++GLIBC_2.26 _IO_putc F
++GLIBC_2.26 _IO_puts F
++GLIBC_2.26 _IO_remove_marker F
++GLIBC_2.26 _IO_seekmark F
++GLIBC_2.26 _IO_seekoff F
++GLIBC_2.26 _IO_seekpos F
++GLIBC_2.26 _IO_seekwmark F
++GLIBC_2.26 _IO_setb F
++GLIBC_2.26 _IO_setbuffer F
++GLIBC_2.26 _IO_setvbuf F
++GLIBC_2.26 _IO_sgetn F
++GLIBC_2.26 _IO_sprintf F
++GLIBC_2.26 _IO_sputbackc F
++GLIBC_2.26 _IO_sputbackwc F
++GLIBC_2.26 _IO_sscanf F
++GLIBC_2.26 _IO_str_init_readonly F
++GLIBC_2.26 _IO_str_init_static F
++GLIBC_2.26 _IO_str_overflow F
++GLIBC_2.26 _IO_str_pbackfail F
++GLIBC_2.26 _IO_str_seekoff F
++GLIBC_2.26 _IO_str_underflow F
++GLIBC_2.26 _IO_sungetc F
++GLIBC_2.26 _IO_sungetwc F
++GLIBC_2.26 _IO_switch_to_get_mode F
++GLIBC_2.26 _IO_switch_to_main_wget_area F
++GLIBC_2.26 _IO_switch_to_wbackup_area F
++GLIBC_2.26 _IO_switch_to_wget_mode F
++GLIBC_2.26 _IO_un_link F
++GLIBC_2.26 _IO_ungetc F
++GLIBC_2.26 _IO_unsave_markers F
++GLIBC_2.26 _IO_unsave_wmarkers F
++GLIBC_2.26 _IO_vfprintf F
++GLIBC_2.26 _IO_vfscanf F
++GLIBC_2.26 _IO_vsprintf F
++GLIBC_2.26 _IO_wdefault_doallocate F
++GLIBC_2.26 _IO_wdefault_finish F
++GLIBC_2.26 _IO_wdefault_pbackfail F
++GLIBC_2.26 _IO_wdefault_uflow F
++GLIBC_2.26 _IO_wdefault_xsgetn F
++GLIBC_2.26 _IO_wdefault_xsputn F
++GLIBC_2.26 _IO_wdo_write F
++GLIBC_2.26 _IO_wdoallocbuf F
++GLIBC_2.26 _IO_wfile_jumps D 0x54
++GLIBC_2.26 _IO_wfile_overflow F
++GLIBC_2.26 _IO_wfile_seekoff F
++GLIBC_2.26 _IO_wfile_sync F
++GLIBC_2.26 _IO_wfile_underflow F
++GLIBC_2.26 _IO_wfile_xsputn F
++GLIBC_2.26 _IO_wmarker_delta F
++GLIBC_2.26 _IO_wsetb F
++GLIBC_2.26 ___brk_addr D 0x4
++GLIBC_2.26 __adjtimex F
++GLIBC_2.26 __after_morecore_hook D 0x4
++GLIBC_2.26 __argz_count F
++GLIBC_2.26 __argz_next F
++GLIBC_2.26 __argz_stringify F
++GLIBC_2.26 __asprintf F
++GLIBC_2.26 __asprintf_chk F
++GLIBC_2.26 __assert F
++GLIBC_2.26 __assert_fail F
++GLIBC_2.26 __assert_perror_fail F
++GLIBC_2.26 __backtrace F
++GLIBC_2.26 __backtrace_symbols F
++GLIBC_2.26 __backtrace_symbols_fd F
++GLIBC_2.26 __bsd_getpgrp F
++GLIBC_2.26 __bzero F
++GLIBC_2.26 __check_rhosts_file D 0x4
++GLIBC_2.26 __chk_fail F
++GLIBC_2.26 __clone F
++GLIBC_2.26 __close F
++GLIBC_2.26 __cmsg_nxthdr F
++GLIBC_2.26 __confstr_chk F
++GLIBC_2.26 __connect F
++GLIBC_2.26 __ctype_b_loc F
++GLIBC_2.26 __ctype_get_mb_cur_max F
++GLIBC_2.26 __ctype_tolower_loc F
++GLIBC_2.26 __ctype_toupper_loc F
++GLIBC_2.26 __curbrk D 0x4
++GLIBC_2.26 __cxa_at_quick_exit F
++GLIBC_2.26 __cxa_atexit F
++GLIBC_2.26 __cxa_finalize F
++GLIBC_2.26 __cxa_thread_atexit_impl F
++GLIBC_2.26 __cyg_profile_func_enter F
++GLIBC_2.26 __cyg_profile_func_exit F
++GLIBC_2.26 __daylight D 0x4
++GLIBC_2.26 __dcgettext F
++GLIBC_2.26 __default_morecore F
++GLIBC_2.26 __dgettext F
++GLIBC_2.26 __dprintf_chk F
++GLIBC_2.26 __dup2 F
++GLIBC_2.26 __duplocale F
++GLIBC_2.26 __endmntent F
++GLIBC_2.26 __environ D 0x4
++GLIBC_2.26 __errno_location F
++GLIBC_2.26 __explicit_bzero_chk F
++GLIBC_2.26 __fbufsize F
++GLIBC_2.26 __fcntl F
++GLIBC_2.26 __fdelt_chk F
++GLIBC_2.26 __fdelt_warn F
++GLIBC_2.26 __ffs F
++GLIBC_2.26 __fgets_chk F
++GLIBC_2.26 __fgets_unlocked_chk F
++GLIBC_2.26 __fgetws_chk F
++GLIBC_2.26 __fgetws_unlocked_chk F
++GLIBC_2.26 __finite F
++GLIBC_2.26 __finitef F
++GLIBC_2.26 __flbf F
++GLIBC_2.26 __fork F
++GLIBC_2.26 __fpending F
++GLIBC_2.26 __fprintf_chk F
++GLIBC_2.26 __fpu_control D 0x4
++GLIBC_2.26 __fpurge F
++GLIBC_2.26 __fread_chk F
++GLIBC_2.26 __fread_unlocked_chk F
++GLIBC_2.26 __freadable F
++GLIBC_2.26 __freading F
++GLIBC_2.26 __free_hook D 0x4
++GLIBC_2.26 __freelocale F
++GLIBC_2.26 __fsetlocking F
++GLIBC_2.26 __fwprintf_chk F
++GLIBC_2.26 __fwritable F
++GLIBC_2.26 __fwriting F
++GLIBC_2.26 __fxstat F
++GLIBC_2.26 __fxstat64 F
++GLIBC_2.26 __fxstatat F
++GLIBC_2.26 __fxstatat64 F
++GLIBC_2.26 __getauxval F
++GLIBC_2.26 __getcwd_chk F
++GLIBC_2.26 __getdelim F
++GLIBC_2.26 __getdomainname_chk F
++GLIBC_2.26 __getgroups_chk F
++GLIBC_2.26 __gethostname_chk F
++GLIBC_2.26 __getlogin_r_chk F
++GLIBC_2.26 __getmntent_r F
++GLIBC_2.26 __getpagesize F
++GLIBC_2.26 __getpgid F
++GLIBC_2.26 __getpid F
++GLIBC_2.26 __gets_chk F
++GLIBC_2.26 __gettimeofday F
++GLIBC_2.26 __getwd_chk F
++GLIBC_2.26 __gmtime_r F
++GLIBC_2.26 __h_errno_location F
++GLIBC_2.26 __isalnum_l F
++GLIBC_2.26 __isalpha_l F
++GLIBC_2.26 __isascii_l F
++GLIBC_2.26 __isblank_l F
++GLIBC_2.26 __iscntrl_l F
++GLIBC_2.26 __isctype F
++GLIBC_2.26 __isdigit_l F
++GLIBC_2.26 __isgraph_l F
++GLIBC_2.26 __isinf F
++GLIBC_2.26 __isinff F
++GLIBC_2.26 __islower_l F
++GLIBC_2.26 __isnan F
++GLIBC_2.26 __isnanf F
++GLIBC_2.26 __isoc99_fscanf F
++GLIBC_2.26 __isoc99_fwscanf F
++GLIBC_2.26 __isoc99_scanf F
++GLIBC_2.26 __isoc99_sscanf F
++GLIBC_2.26 __isoc99_swscanf F
++GLIBC_2.26 __isoc99_vfscanf F
++GLIBC_2.26 __isoc99_vfwscanf F
++GLIBC_2.26 __isoc99_vscanf F
++GLIBC_2.26 __isoc99_vsscanf F
++GLIBC_2.26 __isoc99_vswscanf F
++GLIBC_2.26 __isoc99_vwscanf F
++GLIBC_2.26 __isoc99_wscanf F
++GLIBC_2.26 __isprint_l F
++GLIBC_2.26 __ispunct_l F
++GLIBC_2.26 __isspace_l F
++GLIBC_2.26 __isupper_l F
++GLIBC_2.26 __iswalnum_l F
++GLIBC_2.26 __iswalpha_l F
++GLIBC_2.26 __iswblank_l F
++GLIBC_2.26 __iswcntrl_l F
++GLIBC_2.26 __iswctype F
++GLIBC_2.26 __iswctype_l F
++GLIBC_2.26 __iswdigit_l F
++GLIBC_2.26 __iswgraph_l F
++GLIBC_2.26 __iswlower_l F
++GLIBC_2.26 __iswprint_l F
++GLIBC_2.26 __iswpunct_l F
++GLIBC_2.26 __iswspace_l F
++GLIBC_2.26 __iswupper_l F
++GLIBC_2.26 __iswxdigit_l F
++GLIBC_2.26 __isxdigit_l F
++GLIBC_2.26 __ivaliduser F
++GLIBC_2.26 __key_decryptsession_pk_LOCAL D 0x4
++GLIBC_2.26 __key_encryptsession_pk_LOCAL D 0x4
++GLIBC_2.26 __key_gendes_LOCAL D 0x4
++GLIBC_2.26 __libc_allocate_rtsig F
++GLIBC_2.26 __libc_calloc F
++GLIBC_2.26 __libc_current_sigrtmax F
++GLIBC_2.26 __libc_current_sigrtmin F
++GLIBC_2.26 __libc_free F
++GLIBC_2.26 __libc_freeres F
++GLIBC_2.26 __libc_init_first F
++GLIBC_2.26 __libc_mallinfo F
++GLIBC_2.26 __libc_malloc F
++GLIBC_2.26 __libc_mallopt F
++GLIBC_2.26 __libc_memalign F
++GLIBC_2.26 __libc_pvalloc F
++GLIBC_2.26 __libc_realloc F
++GLIBC_2.26 __libc_sa_len F
++GLIBC_2.26 __libc_start_main F
++GLIBC_2.26 __libc_valloc F
++GLIBC_2.26 __longjmp_chk F
++GLIBC_2.26 __lseek F
++GLIBC_2.26 __lxstat F
++GLIBC_2.26 __lxstat64 F
++GLIBC_2.26 __malloc_hook D 0x4
++GLIBC_2.26 __mbrlen F
++GLIBC_2.26 __mbrtowc F
++GLIBC_2.26 __mbsnrtowcs_chk F
++GLIBC_2.26 __mbsrtowcs_chk F
++GLIBC_2.26 __mbstowcs_chk F
++GLIBC_2.26 __memalign_hook D 0x4
++GLIBC_2.26 __memcpy_chk F
++GLIBC_2.26 __memmove_chk F
++GLIBC_2.26 __mempcpy F
++GLIBC_2.26 __mempcpy_chk F
++GLIBC_2.26 __memset_chk F
++GLIBC_2.26 __monstartup F
++GLIBC_2.26 __morecore D 0x4
++GLIBC_2.26 __nanosleep F
++GLIBC_2.26 __newlocale F
++GLIBC_2.26 __nl_langinfo_l F
++GLIBC_2.26 __nss_configure_lookup F
++GLIBC_2.26 __nss_database_lookup F
++GLIBC_2.26 __nss_group_lookup F
++GLIBC_2.26 __nss_hostname_digits_dots F
++GLIBC_2.26 __nss_hosts_lookup F
++GLIBC_2.26 __nss_next F
++GLIBC_2.26 __nss_passwd_lookup F
++GLIBC_2.26 __obstack_printf_chk F
++GLIBC_2.26 __obstack_vprintf_chk F
++GLIBC_2.26 __open F
++GLIBC_2.26 __open64 F
++GLIBC_2.26 __open64_2 F
++GLIBC_2.26 __open_2 F
++GLIBC_2.26 __openat64_2 F
++GLIBC_2.26 __openat_2 F
++GLIBC_2.26 __overflow F
++GLIBC_2.26 __pipe F
++GLIBC_2.26 __poll F
++GLIBC_2.26 __poll_chk F
++GLIBC_2.26 __posix_getopt F
++GLIBC_2.26 __ppoll_chk F
++GLIBC_2.26 __pread64 F
++GLIBC_2.26 __pread64_chk F
++GLIBC_2.26 __pread_chk F
++GLIBC_2.26 __printf_chk F
++GLIBC_2.26 __printf_fp F
++GLIBC_2.26 __profile_frequency F
++GLIBC_2.26 __progname D 0x4
++GLIBC_2.26 __progname_full D 0x4
++GLIBC_2.26 __ptsname_r_chk F
++GLIBC_2.26 __pwrite64 F
++GLIBC_2.26 __rawmemchr F
++GLIBC_2.26 __rcmd_errstr D 0x4
++GLIBC_2.26 __read F
++GLIBC_2.26 __read_chk F
++GLIBC_2.26 __readlink_chk F
++GLIBC_2.26 __readlinkat_chk F
++GLIBC_2.26 __realloc_hook D 0x4
++GLIBC_2.26 __realpath_chk F
++GLIBC_2.26 __recv_chk F
++GLIBC_2.26 __recvfrom_chk F
++GLIBC_2.26 __register_atfork F
++GLIBC_2.26 __res_init F
++GLIBC_2.26 __res_nclose F
++GLIBC_2.26 __res_ninit F
++GLIBC_2.26 __res_randomid F
++GLIBC_2.26 __res_state F
++GLIBC_2.26 __rpc_thread_createerr F
++GLIBC_2.26 __rpc_thread_svc_fdset F
++GLIBC_2.26 __rpc_thread_svc_max_pollfd F
++GLIBC_2.26 __rpc_thread_svc_pollfd F
++GLIBC_2.26 __sbrk F
++GLIBC_2.26 __sched_cpualloc F
++GLIBC_2.26 __sched_cpucount F
++GLIBC_2.26 __sched_cpufree F
++GLIBC_2.26 __sched_get_priority_max F
++GLIBC_2.26 __sched_get_priority_min F
++GLIBC_2.26 __sched_getparam F
++GLIBC_2.26 __sched_getscheduler F
++GLIBC_2.26 __sched_setscheduler F
++GLIBC_2.26 __sched_yield F
++GLIBC_2.26 __select F
++GLIBC_2.26 __send F
++GLIBC_2.26 __setmntent F
++GLIBC_2.26 __setpgid F
++GLIBC_2.26 __sigaction F
++GLIBC_2.26 __signbit F
++GLIBC_2.26 __signbitf F
++GLIBC_2.26 __sigpause F
++GLIBC_2.26 __sigsetjmp F
++GLIBC_2.26 __sigsuspend F
++GLIBC_2.26 __snprintf_chk F
++GLIBC_2.26 __sprintf_chk F
++GLIBC_2.26 __stack_chk_fail F
++GLIBC_2.26 __statfs F
++GLIBC_2.26 __stpcpy F
++GLIBC_2.26 __stpcpy_chk F
++GLIBC_2.26 __stpncpy F
++GLIBC_2.26 __stpncpy_chk F
++GLIBC_2.26 __strcasecmp F
++GLIBC_2.26 __strcasecmp_l F
++GLIBC_2.26 __strcasestr F
++GLIBC_2.26 __strcat_chk F
++GLIBC_2.26 __strcoll_l F
++GLIBC_2.26 __strcpy_chk F
++GLIBC_2.26 __strdup F
++GLIBC_2.26 __strerror_r F
++GLIBC_2.26 __strfmon_l F
++GLIBC_2.26 __strftime_l F
++GLIBC_2.26 __strncasecmp_l F
++GLIBC_2.26 __strncat_chk F
++GLIBC_2.26 __strncpy_chk F
++GLIBC_2.26 __strndup F
++GLIBC_2.26 __strsep_g F
++GLIBC_2.26 __strtod_internal F
++GLIBC_2.26 __strtod_l F
++GLIBC_2.26 __strtof_internal F
++GLIBC_2.26 __strtof_l F
++GLIBC_2.26 __strtok_r F
++GLIBC_2.26 __strtol_internal F
++GLIBC_2.26 __strtol_l F
++GLIBC_2.26 __strtold_internal F
++GLIBC_2.26 __strtold_l F
++GLIBC_2.26 __strtoll_internal F
++GLIBC_2.26 __strtoll_l F
++GLIBC_2.26 __strtoul_internal F
++GLIBC_2.26 __strtoul_l F
++GLIBC_2.26 __strtoull_internal F
++GLIBC_2.26 __strtoull_l F
++GLIBC_2.26 __strverscmp F
++GLIBC_2.26 __strxfrm_l F
++GLIBC_2.26 __swprintf_chk F
++GLIBC_2.26 __syscall_error F
++GLIBC_2.26 __sysconf F
++GLIBC_2.26 __syslog_chk F
++GLIBC_2.26 __sysv_signal F
++GLIBC_2.26 __timezone D 0x4
++GLIBC_2.26 __toascii_l F
++GLIBC_2.26 __tolower_l F
++GLIBC_2.26 __toupper_l F
++GLIBC_2.26 __towctrans F
++GLIBC_2.26 __towctrans_l F
++GLIBC_2.26 __towlower_l F
++GLIBC_2.26 __towupper_l F
++GLIBC_2.26 __ttyname_r_chk F
++GLIBC_2.26 __tzname D 0x8
++GLIBC_2.26 __uflow F
++GLIBC_2.26 __underflow F
++GLIBC_2.26 __uselocale F
++GLIBC_2.26 __vasprintf_chk F
++GLIBC_2.26 __vdprintf_chk F
++GLIBC_2.26 __vfork F
++GLIBC_2.26 __vfprintf_chk F
++GLIBC_2.26 __vfscanf F
++GLIBC_2.26 __vfwprintf_chk F
++GLIBC_2.26 __vprintf_chk F
++GLIBC_2.26 __vsnprintf F
++GLIBC_2.26 __vsnprintf_chk F
++GLIBC_2.26 __vsprintf_chk F
++GLIBC_2.26 __vsscanf F
++GLIBC_2.26 __vswprintf_chk F
++GLIBC_2.26 __vsyslog_chk F
++GLIBC_2.26 __vwprintf_chk F
++GLIBC_2.26 __wait F
++GLIBC_2.26 __waitpid F
++GLIBC_2.26 __wcpcpy_chk F
++GLIBC_2.26 __wcpncpy_chk F
++GLIBC_2.26 __wcrtomb_chk F
++GLIBC_2.26 __wcscasecmp_l F
++GLIBC_2.26 __wcscat_chk F
++GLIBC_2.26 __wcscoll_l F
++GLIBC_2.26 __wcscpy_chk F
++GLIBC_2.26 __wcsftime_l F
++GLIBC_2.26 __wcsncasecmp_l F
++GLIBC_2.26 __wcsncat_chk F
++GLIBC_2.26 __wcsncpy_chk F
++GLIBC_2.26 __wcsnrtombs_chk F
++GLIBC_2.26 __wcsrtombs_chk F
++GLIBC_2.26 __wcstod_internal F
++GLIBC_2.26 __wcstod_l F
++GLIBC_2.26 __wcstof_internal F
++GLIBC_2.26 __wcstof_l F
++GLIBC_2.26 __wcstol_internal F
++GLIBC_2.26 __wcstol_l F
++GLIBC_2.26 __wcstold_internal F
++GLIBC_2.26 __wcstold_l F
++GLIBC_2.26 __wcstoll_internal F
++GLIBC_2.26 __wcstoll_l F
++GLIBC_2.26 __wcstombs_chk F
++GLIBC_2.26 __wcstoul_internal F
++GLIBC_2.26 __wcstoul_l F
++GLIBC_2.26 __wcstoull_internal F
++GLIBC_2.26 __wcstoull_l F
++GLIBC_2.26 __wcsxfrm_l F
++GLIBC_2.26 __wctomb_chk F
++GLIBC_2.26 __wctrans_l F
++GLIBC_2.26 __wctype_l F
++GLIBC_2.26 __wmemcpy_chk F
++GLIBC_2.26 __wmemmove_chk F
++GLIBC_2.26 __wmempcpy_chk F
++GLIBC_2.26 __wmemset_chk F
++GLIBC_2.26 __woverflow F
++GLIBC_2.26 __wprintf_chk F
++GLIBC_2.26 __write F
++GLIBC_2.26 __wuflow F
++GLIBC_2.26 __wunderflow F
++GLIBC_2.26 __xmknod F
++GLIBC_2.26 __xmknodat F
++GLIBC_2.26 __xpg_basename F
++GLIBC_2.26 __xpg_sigpause F
++GLIBC_2.26 __xpg_strerror_r F
++GLIBC_2.26 __xstat F
++GLIBC_2.26 __xstat64 F
++GLIBC_2.26 _authenticate F
++GLIBC_2.26 _dl_mcount_wrapper F
++GLIBC_2.26 _dl_mcount_wrapper_check F
++GLIBC_2.26 _environ D 0x4
++GLIBC_2.26 _exit F
++GLIBC_2.26 _flush_cache F
++GLIBC_2.26 _flushlbf F
++GLIBC_2.26 _libc_intl_domainname D 0x5
++GLIBC_2.26 _longjmp F
++GLIBC_2.26 _mcleanup F
++GLIBC_2.26 _mcount F
++GLIBC_2.26 _nl_default_dirname D 0x12
++GLIBC_2.26 _nl_domain_bindings D 0x4
++GLIBC_2.26 _nl_msg_cat_cntr D 0x4
++GLIBC_2.26 _null_auth D 0xc
++GLIBC_2.26 _obstack_allocated_p F
++GLIBC_2.26 _obstack_begin F
++GLIBC_2.26 _obstack_begin_1 F
++GLIBC_2.26 _obstack_free F
++GLIBC_2.26 _obstack_memory_used F
++GLIBC_2.26 _obstack_newchunk F
++GLIBC_2.26 _res D 0x200
++GLIBC_2.26 _res_hconf D 0x30
++GLIBC_2.26 _rpc_dtablesize F
++GLIBC_2.26 _seterr_reply F
++GLIBC_2.26 _setjmp F
++GLIBC_2.26 _sys_errlist D 0x21c
++GLIBC_2.26 _sys_nerr D 0x4
++GLIBC_2.26 _sys_siglist D 0x104
++GLIBC_2.26 _tolower F
++GLIBC_2.26 _toupper F
++GLIBC_2.26 a64l F
++GLIBC_2.26 abort F
++GLIBC_2.26 abs F
++GLIBC_2.26 accept F
++GLIBC_2.26 accept4 F
++GLIBC_2.26 access F
++GLIBC_2.26 acct F
++GLIBC_2.26 addmntent F
++GLIBC_2.26 addseverity F
++GLIBC_2.26 adjtime F
++GLIBC_2.26 adjtimex F
++GLIBC_2.26 alarm F
++GLIBC_2.26 aligned_alloc F
++GLIBC_2.26 alphasort F
++GLIBC_2.26 alphasort64 F
++GLIBC_2.26 argp_err_exit_status D 0x4
++GLIBC_2.26 argp_error F
++GLIBC_2.26 argp_failure F
++GLIBC_2.26 argp_help F
++GLIBC_2.26 argp_parse F
++GLIBC_2.26 argp_program_bug_address D 0x4
++GLIBC_2.26 argp_program_version D 0x4
++GLIBC_2.26 argp_program_version_hook D 0x4
++GLIBC_2.26 argp_state_help F
++GLIBC_2.26 argp_usage F
++GLIBC_2.26 argz_add F
++GLIBC_2.26 argz_add_sep F
++GLIBC_2.26 argz_append F
++GLIBC_2.26 argz_count F
++GLIBC_2.26 argz_create F
++GLIBC_2.26 argz_create_sep F
++GLIBC_2.26 argz_delete F
++GLIBC_2.26 argz_extract F
++GLIBC_2.26 argz_insert F
++GLIBC_2.26 argz_next F
++GLIBC_2.26 argz_replace F
++GLIBC_2.26 argz_stringify F
++GLIBC_2.26 asctime F
++GLIBC_2.26 asctime_r F
++GLIBC_2.26 asprintf F
++GLIBC_2.26 atof F
++GLIBC_2.26 atoi F
++GLIBC_2.26 atol F
++GLIBC_2.26 atoll F
++GLIBC_2.26 authdes_create F
++GLIBC_2.26 authdes_getucred F
++GLIBC_2.26 authdes_pk_create F
++GLIBC_2.26 authnone_create F
++GLIBC_2.26 authunix_create F
++GLIBC_2.26 authunix_create_default F
++GLIBC_2.26 backtrace F
++GLIBC_2.26 backtrace_symbols F
++GLIBC_2.26 backtrace_symbols_fd F
++GLIBC_2.26 basename F
++GLIBC_2.26 bcmp F
++GLIBC_2.26 bcopy F
++GLIBC_2.26 bind F
++GLIBC_2.26 bind_textdomain_codeset F
++GLIBC_2.26 bindresvport F
++GLIBC_2.26 bindtextdomain F
++GLIBC_2.26 brk F
++GLIBC_2.26 bsd_signal F
++GLIBC_2.26 bsearch F
++GLIBC_2.26 btowc F
++GLIBC_2.26 bzero F
++GLIBC_2.26 c16rtomb F
++GLIBC_2.26 c32rtomb F
++GLIBC_2.26 cacheflush F
++GLIBC_2.26 calloc F
++GLIBC_2.26 callrpc F
++GLIBC_2.26 canonicalize_file_name F
++GLIBC_2.26 capget F
++GLIBC_2.26 capset F
++GLIBC_2.26 catclose F
++GLIBC_2.26 catgets F
++GLIBC_2.26 catopen F
++GLIBC_2.26 cbc_crypt F
++GLIBC_2.26 cfgetispeed F
++GLIBC_2.26 cfgetospeed F
++GLIBC_2.26 cfmakeraw F
++GLIBC_2.26 cfsetispeed F
++GLIBC_2.26 cfsetospeed F
++GLIBC_2.26 cfsetspeed F
++GLIBC_2.26 chdir F
++GLIBC_2.26 chflags F
++GLIBC_2.26 chmod F
++GLIBC_2.26 chown F
++GLIBC_2.26 chroot F
++GLIBC_2.26 clearenv F
++GLIBC_2.26 clearerr F
++GLIBC_2.26 clearerr_unlocked F
++GLIBC_2.26 clnt_broadcast F
++GLIBC_2.26 clnt_create F
++GLIBC_2.26 clnt_pcreateerror F
++GLIBC_2.26 clnt_perrno F
++GLIBC_2.26 clnt_perror F
++GLIBC_2.26 clnt_spcreateerror F
++GLIBC_2.26 clnt_sperrno F
++GLIBC_2.26 clnt_sperror F
++GLIBC_2.26 clntraw_create F
++GLIBC_2.26 clnttcp_create F
++GLIBC_2.26 clntudp_bufcreate F
++GLIBC_2.26 clntudp_create F
++GLIBC_2.26 clntunix_create F
++GLIBC_2.26 clock F
++GLIBC_2.26 clock_adjtime F
++GLIBC_2.26 clock_getcpuclockid F
++GLIBC_2.26 clock_getres F
++GLIBC_2.26 clock_gettime F
++GLIBC_2.26 clock_nanosleep F
++GLIBC_2.26 clock_settime F
++GLIBC_2.26 clone F
++GLIBC_2.26 close F
++GLIBC_2.26 closedir F
++GLIBC_2.26 closelog F
++GLIBC_2.26 confstr F
++GLIBC_2.26 connect F
++GLIBC_2.26 copysign F
++GLIBC_2.26 copysignf F
++GLIBC_2.26 copysignl F
++GLIBC_2.26 creat F
++GLIBC_2.26 creat64 F
++GLIBC_2.26 ctermid F
++GLIBC_2.26 ctime F
++GLIBC_2.26 ctime_r F
++GLIBC_2.26 cuserid F
++GLIBC_2.26 daemon F
++GLIBC_2.26 daylight D 0x4
++GLIBC_2.26 dcgettext F
++GLIBC_2.26 dcngettext F
++GLIBC_2.26 delete_module F
++GLIBC_2.26 des_setparity F
++GLIBC_2.26 dgettext F
++GLIBC_2.26 difftime F
++GLIBC_2.26 dirfd F
++GLIBC_2.26 dirname F
++GLIBC_2.26 div F
++GLIBC_2.26 dl_iterate_phdr F
++GLIBC_2.26 dngettext F
++GLIBC_2.26 dprintf F
++GLIBC_2.26 drand48 F
++GLIBC_2.26 drand48_r F
++GLIBC_2.26 dup F
++GLIBC_2.26 dup2 F
++GLIBC_2.26 dup3 F
++GLIBC_2.26 duplocale F
++GLIBC_2.26 dysize F
++GLIBC_2.26 eaccess F
++GLIBC_2.26 ecb_crypt F
++GLIBC_2.26 ecvt F
++GLIBC_2.26 ecvt_r F
++GLIBC_2.26 endaliasent F
++GLIBC_2.26 endfsent F
++GLIBC_2.26 endgrent F
++GLIBC_2.26 endhostent F
++GLIBC_2.26 endmntent F
++GLIBC_2.26 endnetent F
++GLIBC_2.26 endnetgrent F
++GLIBC_2.26 endprotoent F
++GLIBC_2.26 endpwent F
++GLIBC_2.26 endrpcent F
++GLIBC_2.26 endservent F
++GLIBC_2.26 endsgent F
++GLIBC_2.26 endspent F
++GLIBC_2.26 endttyent F
++GLIBC_2.26 endusershell F
++GLIBC_2.26 endutent F
++GLIBC_2.26 endutxent F
++GLIBC_2.26 environ D 0x4
++GLIBC_2.26 envz_add F
++GLIBC_2.26 envz_entry F
++GLIBC_2.26 envz_get F
++GLIBC_2.26 envz_merge F
++GLIBC_2.26 envz_remove F
++GLIBC_2.26 envz_strip F
++GLIBC_2.26 epoll_create F
++GLIBC_2.26 epoll_create1 F
++GLIBC_2.26 epoll_ctl F
++GLIBC_2.26 epoll_pwait F
++GLIBC_2.26 epoll_wait F
++GLIBC_2.26 erand48 F
++GLIBC_2.26 erand48_r F
++GLIBC_2.26 err F
++GLIBC_2.26 error F
++GLIBC_2.26 error_at_line F
++GLIBC_2.26 error_message_count D 0x4
++GLIBC_2.26 error_one_per_line D 0x4
++GLIBC_2.26 error_print_progname D 0x4
++GLIBC_2.26 errx F
++GLIBC_2.26 ether_aton F
++GLIBC_2.26 ether_aton_r F
++GLIBC_2.26 ether_hostton F
++GLIBC_2.26 ether_line F
++GLIBC_2.26 ether_ntoa F
++GLIBC_2.26 ether_ntoa_r F
++GLIBC_2.26 ether_ntohost F
++GLIBC_2.26 euidaccess F
++GLIBC_2.26 eventfd F
++GLIBC_2.26 eventfd_read F
++GLIBC_2.26 eventfd_write F
++GLIBC_2.26 execl F
++GLIBC_2.26 execle F
++GLIBC_2.26 execlp F
++GLIBC_2.26 execv F
++GLIBC_2.26 execve F
++GLIBC_2.26 execvp F
++GLIBC_2.26 execvpe F
++GLIBC_2.26 exit F
++GLIBC_2.26 explicit_bzero F
++GLIBC_2.26 faccessat F
++GLIBC_2.26 fallocate F
++GLIBC_2.26 fallocate64 F
++GLIBC_2.26 fanotify_init F
++GLIBC_2.26 fanotify_mark F
++GLIBC_2.26 fattach F
++GLIBC_2.26 fchdir F
++GLIBC_2.26 fchflags F
++GLIBC_2.26 fchmod F
++GLIBC_2.26 fchmodat F
++GLIBC_2.26 fchown F
++GLIBC_2.26 fchownat F
++GLIBC_2.26 fclose F
++GLIBC_2.26 fcloseall F
++GLIBC_2.26 fcntl F
++GLIBC_2.26 fcvt F
++GLIBC_2.26 fcvt_r F
++GLIBC_2.26 fdatasync F
++GLIBC_2.26 fdetach F
++GLIBC_2.26 fdopen F
++GLIBC_2.26 fdopendir F
++GLIBC_2.26 feof F
++GLIBC_2.26 feof_unlocked F
++GLIBC_2.26 ferror F
++GLIBC_2.26 ferror_unlocked F
++GLIBC_2.26 fexecve F
++GLIBC_2.26 fflush F
++GLIBC_2.26 fflush_unlocked F
++GLIBC_2.26 ffs F
++GLIBC_2.26 ffsl F
++GLIBC_2.26 ffsll F
++GLIBC_2.26 fgetc F
++GLIBC_2.26 fgetc_unlocked F
++GLIBC_2.26 fgetgrent F
++GLIBC_2.26 fgetgrent_r F
++GLIBC_2.26 fgetpos F
++GLIBC_2.26 fgetpos64 F
++GLIBC_2.26 fgetpwent F
++GLIBC_2.26 fgetpwent_r F
++GLIBC_2.26 fgets F
++GLIBC_2.26 fgets_unlocked F
++GLIBC_2.26 fgetsgent F
++GLIBC_2.26 fgetsgent_r F
++GLIBC_2.26 fgetspent F
++GLIBC_2.26 fgetspent_r F
++GLIBC_2.26 fgetwc F
++GLIBC_2.26 fgetwc_unlocked F
++GLIBC_2.26 fgetws F
++GLIBC_2.26 fgetws_unlocked F
++GLIBC_2.26 fgetxattr F
++GLIBC_2.26 fileno F
++GLIBC_2.26 fileno_unlocked F
++GLIBC_2.26 finite F
++GLIBC_2.26 finitef F
++GLIBC_2.26 finitel F
++GLIBC_2.26 flistxattr F
++GLIBC_2.26 flock F
++GLIBC_2.26 flockfile F
++GLIBC_2.26 fmemopen F
++GLIBC_2.26 fmtmsg F
++GLIBC_2.26 fnmatch F
++GLIBC_2.26 fopen F
++GLIBC_2.26 fopen64 F
++GLIBC_2.26 fopencookie F
++GLIBC_2.26 fork F
++GLIBC_2.26 fpathconf F
++GLIBC_2.26 fprintf F
++GLIBC_2.26 fputc F
++GLIBC_2.26 fputc_unlocked F
++GLIBC_2.26 fputs F
++GLIBC_2.26 fputs_unlocked F
++GLIBC_2.26 fputwc F
++GLIBC_2.26 fputwc_unlocked F
++GLIBC_2.26 fputws F
++GLIBC_2.26 fputws_unlocked F
++GLIBC_2.26 fread F
++GLIBC_2.26 fread_unlocked F
++GLIBC_2.26 free F
++GLIBC_2.26 freeaddrinfo F
++GLIBC_2.26 freeifaddrs F
++GLIBC_2.26 freelocale F
++GLIBC_2.26 fremovexattr F
++GLIBC_2.26 freopen F
++GLIBC_2.26 freopen64 F
++GLIBC_2.26 frexp F
++GLIBC_2.26 frexpf F
++GLIBC_2.26 frexpl F
++GLIBC_2.26 fscanf F
++GLIBC_2.26 fseek F
++GLIBC_2.26 fseeko F
++GLIBC_2.26 fseeko64 F
++GLIBC_2.26 fsetpos F
++GLIBC_2.26 fsetpos64 F
++GLIBC_2.26 fsetxattr F
++GLIBC_2.26 fstatfs F
++GLIBC_2.26 fstatfs64 F
++GLIBC_2.26 fstatvfs F
++GLIBC_2.26 fstatvfs64 F
++GLIBC_2.26 fsync F
++GLIBC_2.26 ftell F
++GLIBC_2.26 ftello F
++GLIBC_2.26 ftello64 F
++GLIBC_2.26 ftime F
++GLIBC_2.26 ftok F
++GLIBC_2.26 ftruncate F
++GLIBC_2.26 ftruncate64 F
++GLIBC_2.26 ftrylockfile F
++GLIBC_2.26 fts64_children F
++GLIBC_2.26 fts64_close F
++GLIBC_2.26 fts64_open F
++GLIBC_2.26 fts64_read F
++GLIBC_2.26 fts64_set F
++GLIBC_2.26 fts_children F
++GLIBC_2.26 fts_close F
++GLIBC_2.26 fts_open F
++GLIBC_2.26 fts_read F
++GLIBC_2.26 fts_set F
++GLIBC_2.26 ftw F
++GLIBC_2.26 ftw64 F
++GLIBC_2.26 funlockfile F
++GLIBC_2.26 futimens F
++GLIBC_2.26 futimes F
++GLIBC_2.26 futimesat F
++GLIBC_2.26 fwide F
++GLIBC_2.26 fwprintf F
++GLIBC_2.26 fwrite F
++GLIBC_2.26 fwrite_unlocked F
++GLIBC_2.26 fwscanf F
++GLIBC_2.26 gai_strerror F
++GLIBC_2.26 gcvt F
++GLIBC_2.26 get_avphys_pages F
++GLIBC_2.26 get_current_dir_name F
++GLIBC_2.26 get_myaddress F
++GLIBC_2.26 get_nprocs F
++GLIBC_2.26 get_nprocs_conf F
++GLIBC_2.26 get_phys_pages F
++GLIBC_2.26 getaddrinfo F
++GLIBC_2.26 getaliasbyname F
++GLIBC_2.26 getaliasbyname_r F
++GLIBC_2.26 getaliasent F
++GLIBC_2.26 getaliasent_r F
++GLIBC_2.26 getauxval F
++GLIBC_2.26 getc F
++GLIBC_2.26 getc_unlocked F
++GLIBC_2.26 getchar F
++GLIBC_2.26 getchar_unlocked F
++GLIBC_2.26 getcontext F
++GLIBC_2.26 getcwd F
++GLIBC_2.26 getdate F
++GLIBC_2.26 getdate_err D 0x4
++GLIBC_2.26 getdate_r F
++GLIBC_2.26 getdelim F
++GLIBC_2.26 getdirentries F
++GLIBC_2.26 getdirentries64 F
++GLIBC_2.26 getdomainname F
++GLIBC_2.26 getdtablesize F
++GLIBC_2.26 getegid F
++GLIBC_2.26 getentropy F
++GLIBC_2.26 getenv F
++GLIBC_2.26 geteuid F
++GLIBC_2.26 getfsent F
++GLIBC_2.26 getfsfile F
++GLIBC_2.26 getfsspec F
++GLIBC_2.26 getgid F
++GLIBC_2.26 getgrent F
++GLIBC_2.26 getgrent_r F
++GLIBC_2.26 getgrgid F
++GLIBC_2.26 getgrgid_r F
++GLIBC_2.26 getgrnam F
++GLIBC_2.26 getgrnam_r F
++GLIBC_2.26 getgrouplist F
++GLIBC_2.26 getgroups F
++GLIBC_2.26 gethostbyaddr F
++GLIBC_2.26 gethostbyaddr_r F
++GLIBC_2.26 gethostbyname F
++GLIBC_2.26 gethostbyname2 F
++GLIBC_2.26 gethostbyname2_r F
++GLIBC_2.26 gethostbyname_r F
++GLIBC_2.26 gethostent F
++GLIBC_2.26 gethostent_r F
++GLIBC_2.26 gethostid F
++GLIBC_2.26 gethostname F
++GLIBC_2.26 getifaddrs F
++GLIBC_2.26 getipv4sourcefilter F
++GLIBC_2.26 getitimer F
++GLIBC_2.26 getline F
++GLIBC_2.26 getloadavg F
++GLIBC_2.26 getlogin F
++GLIBC_2.26 getlogin_r F
++GLIBC_2.26 getmntent F
++GLIBC_2.26 getmntent_r F
++GLIBC_2.26 getmsg F
++GLIBC_2.26 getnameinfo F
++GLIBC_2.26 getnetbyaddr F
++GLIBC_2.26 getnetbyaddr_r F
++GLIBC_2.26 getnetbyname F
++GLIBC_2.26 getnetbyname_r F
++GLIBC_2.26 getnetent F
++GLIBC_2.26 getnetent_r F
++GLIBC_2.26 getnetgrent F
++GLIBC_2.26 getnetgrent_r F
++GLIBC_2.26 getnetname F
++GLIBC_2.26 getopt F
++GLIBC_2.26 getopt_long F
++GLIBC_2.26 getopt_long_only F
++GLIBC_2.26 getpagesize F
++GLIBC_2.26 getpass F
++GLIBC_2.26 getpeername F
++GLIBC_2.26 getpgid F
++GLIBC_2.26 getpgrp F
++GLIBC_2.26 getpid F
++GLIBC_2.26 getpmsg F
++GLIBC_2.26 getppid F
++GLIBC_2.26 getpriority F
++GLIBC_2.26 getprotobyname F
++GLIBC_2.26 getprotobyname_r F
++GLIBC_2.26 getprotobynumber F
++GLIBC_2.26 getprotobynumber_r F
++GLIBC_2.26 getprotoent F
++GLIBC_2.26 getprotoent_r F
++GLIBC_2.26 getpt F
++GLIBC_2.26 getpublickey F
++GLIBC_2.26 getpw F
++GLIBC_2.26 getpwent F
++GLIBC_2.26 getpwent_r F
++GLIBC_2.26 getpwnam F
++GLIBC_2.26 getpwnam_r F
++GLIBC_2.26 getpwuid F
++GLIBC_2.26 getpwuid_r F
++GLIBC_2.26 getrandom F
++GLIBC_2.26 getresgid F
++GLIBC_2.26 getresuid F
++GLIBC_2.26 getrlimit F
++GLIBC_2.26 getrlimit64 F
++GLIBC_2.26 getrpcbyname F
++GLIBC_2.26 getrpcbyname_r F
++GLIBC_2.26 getrpcbynumber F
++GLIBC_2.26 getrpcbynumber_r F
++GLIBC_2.26 getrpcent F
++GLIBC_2.26 getrpcent_r F
++GLIBC_2.26 getrpcport F
++GLIBC_2.26 getrusage F
++GLIBC_2.26 gets F
++GLIBC_2.26 getsecretkey F
++GLIBC_2.26 getservbyname F
++GLIBC_2.26 getservbyname_r F
++GLIBC_2.26 getservbyport F
++GLIBC_2.26 getservbyport_r F
++GLIBC_2.26 getservent F
++GLIBC_2.26 getservent_r F
++GLIBC_2.26 getsgent F
++GLIBC_2.26 getsgent_r F
++GLIBC_2.26 getsgnam F
++GLIBC_2.26 getsgnam_r F
++GLIBC_2.26 getsid F
++GLIBC_2.26 getsockname F
++GLIBC_2.26 getsockopt F
++GLIBC_2.26 getsourcefilter F
++GLIBC_2.26 getspent F
++GLIBC_2.26 getspent_r F
++GLIBC_2.26 getspnam F
++GLIBC_2.26 getspnam_r F
++GLIBC_2.26 getsubopt F
++GLIBC_2.26 gettext F
++GLIBC_2.26 gettimeofday F
++GLIBC_2.26 getttyent F
++GLIBC_2.26 getttynam F
++GLIBC_2.26 getuid F
++GLIBC_2.26 getusershell F
++GLIBC_2.26 getutent F
++GLIBC_2.26 getutent_r F
++GLIBC_2.26 getutid F
++GLIBC_2.26 getutid_r F
++GLIBC_2.26 getutline F
++GLIBC_2.26 getutline_r F
++GLIBC_2.26 getutmp F
++GLIBC_2.26 getutmpx F
++GLIBC_2.26 getutxent F
++GLIBC_2.26 getutxid F
++GLIBC_2.26 getutxline F
++GLIBC_2.26 getw F
++GLIBC_2.26 getwc F
++GLIBC_2.26 getwc_unlocked F
++GLIBC_2.26 getwchar F
++GLIBC_2.26 getwchar_unlocked F
++GLIBC_2.26 getwd F
++GLIBC_2.26 getxattr F
++GLIBC_2.26 glob F
++GLIBC_2.26 glob64 F
++GLIBC_2.26 glob_pattern_p F
++GLIBC_2.26 globfree F
++GLIBC_2.26 globfree64 F
++GLIBC_2.26 gmtime F
++GLIBC_2.26 gmtime_r F
++GLIBC_2.26 gnu_dev_major F
++GLIBC_2.26 gnu_dev_makedev F
++GLIBC_2.26 gnu_dev_minor F
++GLIBC_2.26 gnu_get_libc_release F
++GLIBC_2.26 gnu_get_libc_version F
++GLIBC_2.26 grantpt F
++GLIBC_2.26 group_member F
++GLIBC_2.26 gsignal F
++GLIBC_2.26 gtty F
++GLIBC_2.26 h_errlist D 0x14
++GLIBC_2.26 h_nerr D 0x4
++GLIBC_2.26 hasmntopt F
++GLIBC_2.26 hcreate F
++GLIBC_2.26 hcreate_r F
++GLIBC_2.26 hdestroy F
++GLIBC_2.26 hdestroy_r F
++GLIBC_2.26 herror F
++GLIBC_2.26 host2netname F
++GLIBC_2.26 hsearch F
++GLIBC_2.26 hsearch_r F
++GLIBC_2.26 hstrerror F
++GLIBC_2.26 htonl F
++GLIBC_2.26 htons F
++GLIBC_2.26 iconv F
++GLIBC_2.26 iconv_close F
++GLIBC_2.26 iconv_open F
++GLIBC_2.26 if_freenameindex F
++GLIBC_2.26 if_indextoname F
++GLIBC_2.26 if_nameindex F
++GLIBC_2.26 if_nametoindex F
++GLIBC_2.26 imaxabs F
++GLIBC_2.26 imaxdiv F
++GLIBC_2.26 in6addr_any D 0x10
++GLIBC_2.26 in6addr_loopback D 0x10
++GLIBC_2.26 index F
++GLIBC_2.26 inet6_opt_append F
++GLIBC_2.26 inet6_opt_find F
++GLIBC_2.26 inet6_opt_finish F
++GLIBC_2.26 inet6_opt_get_val F
++GLIBC_2.26 inet6_opt_init F
++GLIBC_2.26 inet6_opt_next F
++GLIBC_2.26 inet6_opt_set_val F
++GLIBC_2.26 inet6_option_alloc F
++GLIBC_2.26 inet6_option_append F
++GLIBC_2.26 inet6_option_find F
++GLIBC_2.26 inet6_option_init F
++GLIBC_2.26 inet6_option_next F
++GLIBC_2.26 inet6_option_space F
++GLIBC_2.26 inet6_rth_add F
++GLIBC_2.26 inet6_rth_getaddr F
++GLIBC_2.26 inet6_rth_init F
++GLIBC_2.26 inet6_rth_reverse F
++GLIBC_2.26 inet6_rth_segments F
++GLIBC_2.26 inet6_rth_space F
++GLIBC_2.26 inet_addr F
++GLIBC_2.26 inet_aton F
++GLIBC_2.26 inet_lnaof F
++GLIBC_2.26 inet_makeaddr F
++GLIBC_2.26 inet_netof F
++GLIBC_2.26 inet_network F
++GLIBC_2.26 inet_nsap_addr F
++GLIBC_2.26 inet_nsap_ntoa F
++GLIBC_2.26 inet_ntoa F
++GLIBC_2.26 inet_ntop F
++GLIBC_2.26 inet_pton F
++GLIBC_2.26 init_module F
++GLIBC_2.26 initgroups F
++GLIBC_2.26 initstate F
++GLIBC_2.26 initstate_r F
++GLIBC_2.26 innetgr F
++GLIBC_2.26 inotify_add_watch F
++GLIBC_2.26 inotify_init F
++GLIBC_2.26 inotify_init1 F
++GLIBC_2.26 inotify_rm_watch F
++GLIBC_2.26 insque F
++GLIBC_2.26 ioctl F
++GLIBC_2.26 iruserok F
++GLIBC_2.26 iruserok_af F
++GLIBC_2.26 isalnum F
++GLIBC_2.26 isalnum_l F
++GLIBC_2.26 isalpha F
++GLIBC_2.26 isalpha_l F
++GLIBC_2.26 isascii F
++GLIBC_2.26 isastream F
++GLIBC_2.26 isatty F
++GLIBC_2.26 isblank F
++GLIBC_2.26 isblank_l F
++GLIBC_2.26 iscntrl F
++GLIBC_2.26 iscntrl_l F
++GLIBC_2.26 isctype F
++GLIBC_2.26 isdigit F
++GLIBC_2.26 isdigit_l F
++GLIBC_2.26 isfdtype F
++GLIBC_2.26 isgraph F
++GLIBC_2.26 isgraph_l F
++GLIBC_2.26 isinf F
++GLIBC_2.26 isinff F
++GLIBC_2.26 isinfl F
++GLIBC_2.26 islower F
++GLIBC_2.26 islower_l F
++GLIBC_2.26 isnan F
++GLIBC_2.26 isnanf F
++GLIBC_2.26 isnanl F
++GLIBC_2.26 isprint F
++GLIBC_2.26 isprint_l F
++GLIBC_2.26 ispunct F
++GLIBC_2.26 ispunct_l F
++GLIBC_2.26 isspace F
++GLIBC_2.26 isspace_l F
++GLIBC_2.26 isupper F
++GLIBC_2.26 isupper_l F
++GLIBC_2.26 iswalnum F
++GLIBC_2.26 iswalnum_l F
++GLIBC_2.26 iswalpha F
++GLIBC_2.26 iswalpha_l F
++GLIBC_2.26 iswblank F
++GLIBC_2.26 iswblank_l F
++GLIBC_2.26 iswcntrl F
++GLIBC_2.26 iswcntrl_l F
++GLIBC_2.26 iswctype F
++GLIBC_2.26 iswctype_l F
++GLIBC_2.26 iswdigit F
++GLIBC_2.26 iswdigit_l F
++GLIBC_2.26 iswgraph F
++GLIBC_2.26 iswgraph_l F
++GLIBC_2.26 iswlower F
++GLIBC_2.26 iswlower_l F
++GLIBC_2.26 iswprint F
++GLIBC_2.26 iswprint_l F
++GLIBC_2.26 iswpunct F
++GLIBC_2.26 iswpunct_l F
++GLIBC_2.26 iswspace F
++GLIBC_2.26 iswspace_l F
++GLIBC_2.26 iswupper F
++GLIBC_2.26 iswupper_l F
++GLIBC_2.26 iswxdigit F
++GLIBC_2.26 iswxdigit_l F
++GLIBC_2.26 isxdigit F
++GLIBC_2.26 isxdigit_l F
++GLIBC_2.26 jrand48 F
++GLIBC_2.26 jrand48_r F
++GLIBC_2.26 key_decryptsession F
++GLIBC_2.26 key_decryptsession_pk F
++GLIBC_2.26 key_encryptsession F
++GLIBC_2.26 key_encryptsession_pk F
++GLIBC_2.26 key_gendes F
++GLIBC_2.26 key_get_conv F
++GLIBC_2.26 key_secretkey_is_set F
++GLIBC_2.26 key_setnet F
++GLIBC_2.26 key_setsecret F
++GLIBC_2.26 kill F
++GLIBC_2.26 killpg F
++GLIBC_2.26 klogctl F
++GLIBC_2.26 l64a F
++GLIBC_2.26 labs F
++GLIBC_2.26 lchmod F
++GLIBC_2.26 lchown F
++GLIBC_2.26 lckpwdf F
++GLIBC_2.26 lcong48 F
++GLIBC_2.26 lcong48_r F
++GLIBC_2.26 ldexp F
++GLIBC_2.26 ldexpf F
++GLIBC_2.26 ldexpl F
++GLIBC_2.26 ldiv F
++GLIBC_2.26 lfind F
++GLIBC_2.26 lgetxattr F
++GLIBC_2.26 link F
++GLIBC_2.26 linkat F
++GLIBC_2.26 listen F
++GLIBC_2.26 listxattr F
++GLIBC_2.26 llabs F
++GLIBC_2.26 lldiv F
++GLIBC_2.26 llistxattr F
++GLIBC_2.26 llseek F
++GLIBC_2.26 localeconv F
++GLIBC_2.26 localtime F
++GLIBC_2.26 localtime_r F
++GLIBC_2.26 lockf F
++GLIBC_2.26 lockf64 F
++GLIBC_2.26 longjmp F
++GLIBC_2.26 lrand48 F
++GLIBC_2.26 lrand48_r F
++GLIBC_2.26 lremovexattr F
++GLIBC_2.26 lsearch F
++GLIBC_2.26 lseek F
++GLIBC_2.26 lseek64 F
++GLIBC_2.26 lsetxattr F
++GLIBC_2.26 lutimes F
++GLIBC_2.26 madvise F
++GLIBC_2.26 makecontext F
++GLIBC_2.26 mallinfo F
++GLIBC_2.26 malloc F
++GLIBC_2.26 malloc_info F
++GLIBC_2.26 malloc_stats F
++GLIBC_2.26 malloc_trim F
++GLIBC_2.26 malloc_usable_size F
++GLIBC_2.26 mallopt F
++GLIBC_2.26 mallwatch D 0x4
++GLIBC_2.26 mblen F
++GLIBC_2.26 mbrlen F
++GLIBC_2.26 mbrtoc16 F
++GLIBC_2.26 mbrtoc32 F
++GLIBC_2.26 mbrtowc F
++GLIBC_2.26 mbsinit F
++GLIBC_2.26 mbsnrtowcs F
++GLIBC_2.26 mbsrtowcs F
++GLIBC_2.26 mbstowcs F
++GLIBC_2.26 mbtowc F
++GLIBC_2.26 mcheck F
++GLIBC_2.26 mcheck_check_all F
++GLIBC_2.26 mcheck_pedantic F
++GLIBC_2.26 memalign F
++GLIBC_2.26 memccpy F
++GLIBC_2.26 memchr F
++GLIBC_2.26 memcmp F
++GLIBC_2.26 memcpy F
++GLIBC_2.26 memfrob F
++GLIBC_2.26 memmem F
++GLIBC_2.26 memmove F
++GLIBC_2.26 mempcpy F
++GLIBC_2.26 memrchr F
++GLIBC_2.26 memset F
++GLIBC_2.26 mincore F
++GLIBC_2.26 mkdir F
++GLIBC_2.26 mkdirat F
++GLIBC_2.26 mkdtemp F
++GLIBC_2.26 mkfifo F
++GLIBC_2.26 mkfifoat F
++GLIBC_2.26 mkostemp F
++GLIBC_2.26 mkostemp64 F
++GLIBC_2.26 mkostemps F
++GLIBC_2.26 mkostemps64 F
++GLIBC_2.26 mkstemp F
++GLIBC_2.26 mkstemp64 F
++GLIBC_2.26 mkstemps F
++GLIBC_2.26 mkstemps64 F
++GLIBC_2.26 mktemp F
++GLIBC_2.26 mktime F
++GLIBC_2.26 mlock F
++GLIBC_2.26 mlockall F
++GLIBC_2.26 mmap F
++GLIBC_2.26 mmap64 F
++GLIBC_2.26 modf F
++GLIBC_2.26 modff F
++GLIBC_2.26 modfl F
++GLIBC_2.26 moncontrol F
++GLIBC_2.26 monstartup F
++GLIBC_2.26 mount F
++GLIBC_2.26 mprobe F
++GLIBC_2.26 mprotect F
++GLIBC_2.26 mrand48 F
++GLIBC_2.26 mrand48_r F
++GLIBC_2.26 mremap F
++GLIBC_2.26 msgctl F
++GLIBC_2.26 msgget F
++GLIBC_2.26 msgrcv F
++GLIBC_2.26 msgsnd F
++GLIBC_2.26 msync F
++GLIBC_2.26 mtrace F
++GLIBC_2.26 munlock F
++GLIBC_2.26 munlockall F
++GLIBC_2.26 munmap F
++GLIBC_2.26 muntrace F
++GLIBC_2.26 name_to_handle_at F
++GLIBC_2.26 nanosleep F
++GLIBC_2.26 netname2host F
++GLIBC_2.26 netname2user F
++GLIBC_2.26 newlocale F
++GLIBC_2.26 nfsservctl F
++GLIBC_2.26 nftw F
++GLIBC_2.26 nftw64 F
++GLIBC_2.26 ngettext F
++GLIBC_2.26 nice F
++GLIBC_2.26 nl_langinfo F
++GLIBC_2.26 nl_langinfo_l F
++GLIBC_2.26 nrand48 F
++GLIBC_2.26 nrand48_r F
++GLIBC_2.26 ntohl F
++GLIBC_2.26 ntohs F
++GLIBC_2.26 ntp_adjtime F
++GLIBC_2.26 ntp_gettime F
++GLIBC_2.26 ntp_gettimex F
++GLIBC_2.26 obstack_alloc_failed_handler D 0x4
++GLIBC_2.26 obstack_exit_failure D 0x4
++GLIBC_2.26 obstack_free F
++GLIBC_2.26 obstack_printf F
++GLIBC_2.26 obstack_vprintf F
++GLIBC_2.26 on_exit F
++GLIBC_2.26 open F
++GLIBC_2.26 open64 F
++GLIBC_2.26 open_by_handle_at F
++GLIBC_2.26 open_memstream F
++GLIBC_2.26 open_wmemstream F
++GLIBC_2.26 openat F
++GLIBC_2.26 openat64 F
++GLIBC_2.26 opendir F
++GLIBC_2.26 openlog F
++GLIBC_2.26 optarg D 0x4
++GLIBC_2.26 opterr D 0x4
++GLIBC_2.26 optind D 0x4
++GLIBC_2.26 optopt D 0x4
++GLIBC_2.26 parse_printf_format F
++GLIBC_2.26 passwd2des F
++GLIBC_2.26 pathconf F
++GLIBC_2.26 pause F
++GLIBC_2.26 pclose F
++GLIBC_2.26 perror F
++GLIBC_2.26 personality F
++GLIBC_2.26 pipe F
++GLIBC_2.26 pipe2 F
++GLIBC_2.26 pivot_root F
++GLIBC_2.26 pmap_getmaps F
++GLIBC_2.26 pmap_getport F
++GLIBC_2.26 pmap_rmtcall F
++GLIBC_2.26 pmap_set F
++GLIBC_2.26 pmap_unset F
++GLIBC_2.26 poll F
++GLIBC_2.26 popen F
++GLIBC_2.26 posix_fadvise F
++GLIBC_2.26 posix_fadvise64 F
++GLIBC_2.26 posix_fallocate F
++GLIBC_2.26 posix_fallocate64 F
++GLIBC_2.26 posix_madvise F
++GLIBC_2.26 posix_memalign F
++GLIBC_2.26 posix_openpt F
++GLIBC_2.26 posix_spawn F
++GLIBC_2.26 posix_spawn_file_actions_addclose F
++GLIBC_2.26 posix_spawn_file_actions_adddup2 F
++GLIBC_2.26 posix_spawn_file_actions_addopen F
++GLIBC_2.26 posix_spawn_file_actions_destroy F
++GLIBC_2.26 posix_spawn_file_actions_init F
++GLIBC_2.26 posix_spawnattr_destroy F
++GLIBC_2.26 posix_spawnattr_getflags F
++GLIBC_2.26 posix_spawnattr_getpgroup F
++GLIBC_2.26 posix_spawnattr_getschedparam F
++GLIBC_2.26 posix_spawnattr_getschedpolicy F
++GLIBC_2.26 posix_spawnattr_getsigdefault F
++GLIBC_2.26 posix_spawnattr_getsigmask F
++GLIBC_2.26 posix_spawnattr_init F
++GLIBC_2.26 posix_spawnattr_setflags F
++GLIBC_2.26 posix_spawnattr_setpgroup F
++GLIBC_2.26 posix_spawnattr_setschedparam F
++GLIBC_2.26 posix_spawnattr_setschedpolicy F
++GLIBC_2.26 posix_spawnattr_setsigdefault F
++GLIBC_2.26 posix_spawnattr_setsigmask F
++GLIBC_2.26 posix_spawnp F
++GLIBC_2.26 ppoll F
++GLIBC_2.26 prctl F
++GLIBC_2.26 pread F
++GLIBC_2.26 pread64 F
++GLIBC_2.26 preadv F
++GLIBC_2.26 preadv2 F
++GLIBC_2.26 preadv64 F
++GLIBC_2.26 preadv64v2 F
++GLIBC_2.26 printf F
++GLIBC_2.26 printf_size F
++GLIBC_2.26 printf_size_info F
++GLIBC_2.26 prlimit F
++GLIBC_2.26 prlimit64 F
++GLIBC_2.26 process_vm_readv F
++GLIBC_2.26 process_vm_writev F
++GLIBC_2.26 profil F
++GLIBC_2.26 program_invocation_name D 0x4
++GLIBC_2.26 program_invocation_short_name D 0x4
++GLIBC_2.26 pselect F
++GLIBC_2.26 psiginfo F
++GLIBC_2.26 psignal F
++GLIBC_2.26 pthread_attr_destroy F
++GLIBC_2.26 pthread_attr_getdetachstate F
++GLIBC_2.26 pthread_attr_getinheritsched F
++GLIBC_2.26 pthread_attr_getschedparam F
++GLIBC_2.26 pthread_attr_getschedpolicy F
++GLIBC_2.26 pthread_attr_getscope F
++GLIBC_2.26 pthread_attr_init F
++GLIBC_2.26 pthread_attr_setdetachstate F
++GLIBC_2.26 pthread_attr_setinheritsched F
++GLIBC_2.26 pthread_attr_setschedparam F
++GLIBC_2.26 pthread_attr_setschedpolicy F
++GLIBC_2.26 pthread_attr_setscope F
++GLIBC_2.26 pthread_cond_broadcast F
++GLIBC_2.26 pthread_cond_destroy F
++GLIBC_2.26 pthread_cond_init F
++GLIBC_2.26 pthread_cond_signal F
++GLIBC_2.26 pthread_cond_timedwait F
++GLIBC_2.26 pthread_cond_wait F
++GLIBC_2.26 pthread_condattr_destroy F
++GLIBC_2.26 pthread_condattr_init F
++GLIBC_2.26 pthread_equal F
++GLIBC_2.26 pthread_exit F
++GLIBC_2.26 pthread_getschedparam F
++GLIBC_2.26 pthread_mutex_destroy F
++GLIBC_2.26 pthread_mutex_init F
++GLIBC_2.26 pthread_mutex_lock F
++GLIBC_2.26 pthread_mutex_unlock F
++GLIBC_2.26 pthread_self F
++GLIBC_2.26 pthread_setcancelstate F
++GLIBC_2.26 pthread_setcanceltype F
++GLIBC_2.26 pthread_setschedparam F
++GLIBC_2.26 ptrace F
++GLIBC_2.26 ptsname F
++GLIBC_2.26 ptsname_r F
++GLIBC_2.26 putc F
++GLIBC_2.26 putc_unlocked F
++GLIBC_2.26 putchar F
++GLIBC_2.26 putchar_unlocked F
++GLIBC_2.26 putenv F
++GLIBC_2.26 putgrent F
++GLIBC_2.26 putmsg F
++GLIBC_2.26 putpmsg F
++GLIBC_2.26 putpwent F
++GLIBC_2.26 puts F
++GLIBC_2.26 putsgent F
++GLIBC_2.26 putspent F
++GLIBC_2.26 pututline F
++GLIBC_2.26 pututxline F
++GLIBC_2.26 putw F
++GLIBC_2.26 putwc F
++GLIBC_2.26 putwc_unlocked F
++GLIBC_2.26 putwchar F
++GLIBC_2.26 putwchar_unlocked F
++GLIBC_2.26 pvalloc F
++GLIBC_2.26 pwrite F
++GLIBC_2.26 pwrite64 F
++GLIBC_2.26 pwritev F
++GLIBC_2.26 pwritev2 F
++GLIBC_2.26 pwritev64 F
++GLIBC_2.26 pwritev64v2 F
++GLIBC_2.26 qecvt F
++GLIBC_2.26 qecvt_r F
++GLIBC_2.26 qfcvt F
++GLIBC_2.26 qfcvt_r F
++GLIBC_2.26 qgcvt F
++GLIBC_2.26 qsort F
++GLIBC_2.26 qsort_r F
++GLIBC_2.26 quick_exit F
++GLIBC_2.26 quotactl F
++GLIBC_2.26 raise F
++GLIBC_2.26 rand F
++GLIBC_2.26 rand_r F
++GLIBC_2.26 random F
++GLIBC_2.26 random_r F
++GLIBC_2.26 rawmemchr F
++GLIBC_2.26 rcmd F
++GLIBC_2.26 rcmd_af F
++GLIBC_2.26 re_comp F
++GLIBC_2.26 re_compile_fastmap F
++GLIBC_2.26 re_compile_pattern F
++GLIBC_2.26 re_exec F
++GLIBC_2.26 re_match F
++GLIBC_2.26 re_match_2 F
++GLIBC_2.26 re_search F
++GLIBC_2.26 re_search_2 F
++GLIBC_2.26 re_set_registers F
++GLIBC_2.26 re_set_syntax F
++GLIBC_2.26 re_syntax_options D 0x4
++GLIBC_2.26 read F
++GLIBC_2.26 readahead F
++GLIBC_2.26 readdir F
++GLIBC_2.26 readdir64 F
++GLIBC_2.26 readdir64_r F
++GLIBC_2.26 readdir_r F
++GLIBC_2.26 readlink F
++GLIBC_2.26 readlinkat F
++GLIBC_2.26 readv F
++GLIBC_2.26 realloc F
++GLIBC_2.26 reallocarray F
++GLIBC_2.26 realpath F
++GLIBC_2.26 reboot F
++GLIBC_2.26 recv F
++GLIBC_2.26 recvfrom F
++GLIBC_2.26 recvmmsg F
++GLIBC_2.26 recvmsg F
++GLIBC_2.26 regcomp F
++GLIBC_2.26 regerror F
++GLIBC_2.26 regexec F
++GLIBC_2.26 regfree F
++GLIBC_2.26 register_printf_function F
++GLIBC_2.26 register_printf_modifier F
++GLIBC_2.26 register_printf_specifier F
++GLIBC_2.26 register_printf_type F
++GLIBC_2.26 registerrpc F
++GLIBC_2.26 remap_file_pages F
++GLIBC_2.26 remove F
++GLIBC_2.26 removexattr F
++GLIBC_2.26 remque F
++GLIBC_2.26 rename F
++GLIBC_2.26 renameat F
++GLIBC_2.26 revoke F
++GLIBC_2.26 rewind F
++GLIBC_2.26 rewinddir F
++GLIBC_2.26 rexec F
++GLIBC_2.26 rexec_af F
++GLIBC_2.26 rexecoptions D 0x4
++GLIBC_2.26 rindex F
++GLIBC_2.26 rmdir F
++GLIBC_2.26 rpc_createerr D 0x10
++GLIBC_2.26 rpmatch F
++GLIBC_2.26 rresvport F
++GLIBC_2.26 rresvport_af F
++GLIBC_2.26 rtime F
++GLIBC_2.26 ruserok F
++GLIBC_2.26 ruserok_af F
++GLIBC_2.26 ruserpass F
++GLIBC_2.26 sbrk F
++GLIBC_2.26 scalbn F
++GLIBC_2.26 scalbnf F
++GLIBC_2.26 scalbnl F
++GLIBC_2.26 scandir F
++GLIBC_2.26 scandir64 F
++GLIBC_2.26 scandirat F
++GLIBC_2.26 scandirat64 F
++GLIBC_2.26 scanf F
++GLIBC_2.26 sched_get_priority_max F
++GLIBC_2.26 sched_get_priority_min F
++GLIBC_2.26 sched_getaffinity F
++GLIBC_2.26 sched_getcpu F
++GLIBC_2.26 sched_getparam F
++GLIBC_2.26 sched_getscheduler F
++GLIBC_2.26 sched_rr_get_interval F
++GLIBC_2.26 sched_setaffinity F
++GLIBC_2.26 sched_setparam F
++GLIBC_2.26 sched_setscheduler F
++GLIBC_2.26 sched_yield F
++GLIBC_2.26 secure_getenv F
++GLIBC_2.26 seed48 F
++GLIBC_2.26 seed48_r F
++GLIBC_2.26 seekdir F
++GLIBC_2.26 select F
++GLIBC_2.26 semctl F
++GLIBC_2.26 semget F
++GLIBC_2.26 semop F
++GLIBC_2.26 semtimedop F
++GLIBC_2.26 send F
++GLIBC_2.26 sendfile F
++GLIBC_2.26 sendfile64 F
++GLIBC_2.26 sendmmsg F
++GLIBC_2.26 sendmsg F
++GLIBC_2.26 sendto F
++GLIBC_2.26 setaliasent F
++GLIBC_2.26 setbuf F
++GLIBC_2.26 setbuffer F
++GLIBC_2.26 setcontext F
++GLIBC_2.26 setdomainname F
++GLIBC_2.26 setegid F
++GLIBC_2.26 setenv F
++GLIBC_2.26 seteuid F
++GLIBC_2.26 setfsent F
++GLIBC_2.26 setfsgid F
++GLIBC_2.26 setfsuid F
++GLIBC_2.26 setgid F
++GLIBC_2.26 setgrent F
++GLIBC_2.26 setgroups F
++GLIBC_2.26 sethostent F
++GLIBC_2.26 sethostid F
++GLIBC_2.26 sethostname F
++GLIBC_2.26 setipv4sourcefilter F
++GLIBC_2.26 setitimer F
++GLIBC_2.26 setjmp F
++GLIBC_2.26 setlinebuf F
++GLIBC_2.26 setlocale F
++GLIBC_2.26 setlogin F
++GLIBC_2.26 setlogmask F
++GLIBC_2.26 setmntent F
++GLIBC_2.26 setnetent F
++GLIBC_2.26 setnetgrent F
++GLIBC_2.26 setns F
++GLIBC_2.26 setpgid F
++GLIBC_2.26 setpgrp F
++GLIBC_2.26 setpriority F
++GLIBC_2.26 setprotoent F
++GLIBC_2.26 setpwent F
++GLIBC_2.26 setregid F
++GLIBC_2.26 setresgid F
++GLIBC_2.26 setresuid F
++GLIBC_2.26 setreuid F
++GLIBC_2.26 setrlimit F
++GLIBC_2.26 setrlimit64 F
++GLIBC_2.26 setrpcent F
++GLIBC_2.26 setservent F
++GLIBC_2.26 setsgent F
++GLIBC_2.26 setsid F
++GLIBC_2.26 setsockopt F
++GLIBC_2.26 setsourcefilter F
++GLIBC_2.26 setspent F
++GLIBC_2.26 setstate F
++GLIBC_2.26 setstate_r F
++GLIBC_2.26 settimeofday F
++GLIBC_2.26 setttyent F
++GLIBC_2.26 setuid F
++GLIBC_2.26 setusershell F
++GLIBC_2.26 setutent F
++GLIBC_2.26 setutxent F
++GLIBC_2.26 setvbuf F
++GLIBC_2.26 setxattr F
++GLIBC_2.26 sgetsgent F
++GLIBC_2.26 sgetsgent_r F
++GLIBC_2.26 sgetspent F
++GLIBC_2.26 sgetspent_r F
++GLIBC_2.26 shmat F
++GLIBC_2.26 shmctl F
++GLIBC_2.26 shmdt F
++GLIBC_2.26 shmget F
++GLIBC_2.26 shutdown F
++GLIBC_2.26 sigaction F
++GLIBC_2.26 sigaddset F
++GLIBC_2.26 sigaltstack F
++GLIBC_2.26 sigandset F
++GLIBC_2.26 sigblock F
++GLIBC_2.26 sigdelset F
++GLIBC_2.26 sigemptyset F
++GLIBC_2.26 sigfillset F
++GLIBC_2.26 siggetmask F
++GLIBC_2.26 sighold F
++GLIBC_2.26 sigignore F
++GLIBC_2.26 siginterrupt F
++GLIBC_2.26 sigisemptyset F
++GLIBC_2.26 sigismember F
++GLIBC_2.26 siglongjmp F
++GLIBC_2.26 signal F
++GLIBC_2.26 signalfd F
++GLIBC_2.26 sigorset F
++GLIBC_2.26 sigpause F
++GLIBC_2.26 sigpending F
++GLIBC_2.26 sigprocmask F
++GLIBC_2.26 sigqueue F
++GLIBC_2.26 sigrelse F
++GLIBC_2.26 sigreturn F
++GLIBC_2.26 sigset F
++GLIBC_2.26 sigsetmask F
++GLIBC_2.26 sigstack F
++GLIBC_2.26 sigsuspend F
++GLIBC_2.26 sigtimedwait F
++GLIBC_2.26 sigwait F
++GLIBC_2.26 sigwaitinfo F
++GLIBC_2.26 sleep F
++GLIBC_2.26 snprintf F
++GLIBC_2.26 sockatmark F
++GLIBC_2.26 socket F
++GLIBC_2.26 socketpair F
++GLIBC_2.26 splice F
++GLIBC_2.26 sprintf F
++GLIBC_2.26 sprofil F
++GLIBC_2.26 srand F
++GLIBC_2.26 srand48 F
++GLIBC_2.26 srand48_r F
++GLIBC_2.26 srandom F
++GLIBC_2.26 srandom_r F
++GLIBC_2.26 sscanf F
++GLIBC_2.26 ssignal F
++GLIBC_2.26 sstk F
++GLIBC_2.26 statfs F
++GLIBC_2.26 statfs64 F
++GLIBC_2.26 statvfs F
++GLIBC_2.26 statvfs64 F
++GLIBC_2.26 stderr D 0x4
++GLIBC_2.26 stdin D 0x4
++GLIBC_2.26 stdout D 0x4
++GLIBC_2.26 stime F
++GLIBC_2.26 stpcpy F
++GLIBC_2.26 stpncpy F
++GLIBC_2.26 strcasecmp F
++GLIBC_2.26 strcasecmp_l F
++GLIBC_2.26 strcasestr F
++GLIBC_2.26 strcat F
++GLIBC_2.26 strchr F
++GLIBC_2.26 strchrnul F
++GLIBC_2.26 strcmp F
++GLIBC_2.26 strcoll F
++GLIBC_2.26 strcoll_l F
++GLIBC_2.26 strcpy F
++GLIBC_2.26 strcspn F
++GLIBC_2.26 strdup F
++GLIBC_2.26 strerror F
++GLIBC_2.26 strerror_l F
++GLIBC_2.26 strerror_r F
++GLIBC_2.26 strfmon F
++GLIBC_2.26 strfmon_l F
++GLIBC_2.26 strfromd F
++GLIBC_2.26 strfromf F
++GLIBC_2.26 strfroml F
++GLIBC_2.26 strfry F
++GLIBC_2.26 strftime F
++GLIBC_2.26 strftime_l F
++GLIBC_2.26 strlen F
++GLIBC_2.26 strncasecmp F
++GLIBC_2.26 strncasecmp_l F
++GLIBC_2.26 strncat F
++GLIBC_2.26 strncmp F
++GLIBC_2.26 strncpy F
++GLIBC_2.26 strndup F
++GLIBC_2.26 strnlen F
++GLIBC_2.26 strpbrk F
++GLIBC_2.26 strptime F
++GLIBC_2.26 strptime_l F
++GLIBC_2.26 strrchr F
++GLIBC_2.26 strsep F
++GLIBC_2.26 strsignal F
++GLIBC_2.26 strspn F
++GLIBC_2.26 strstr F
++GLIBC_2.26 strtod F
++GLIBC_2.26 strtod_l F
++GLIBC_2.26 strtof F
++GLIBC_2.26 strtof_l F
++GLIBC_2.26 strtoimax F
++GLIBC_2.26 strtok F
++GLIBC_2.26 strtok_r F
++GLIBC_2.26 strtol F
++GLIBC_2.26 strtol_l F
++GLIBC_2.26 strtold F
++GLIBC_2.26 strtold_l F
++GLIBC_2.26 strtoll F
++GLIBC_2.26 strtoll_l F
++GLIBC_2.26 strtoq F
++GLIBC_2.26 strtoul F
++GLIBC_2.26 strtoul_l F
++GLIBC_2.26 strtoull F
++GLIBC_2.26 strtoull_l F
++GLIBC_2.26 strtoumax F
++GLIBC_2.26 strtouq F
++GLIBC_2.26 strverscmp F
++GLIBC_2.26 strxfrm F
++GLIBC_2.26 strxfrm_l F
++GLIBC_2.26 stty F
++GLIBC_2.26 svc_exit F
++GLIBC_2.26 svc_fdset D 0x80
++GLIBC_2.26 svc_getreq F
++GLIBC_2.26 svc_getreq_common F
++GLIBC_2.26 svc_getreq_poll F
++GLIBC_2.26 svc_getreqset F
++GLIBC_2.26 svc_max_pollfd D 0x4
++GLIBC_2.26 svc_pollfd D 0x4
++GLIBC_2.26 svc_register F
++GLIBC_2.26 svc_run F
++GLIBC_2.26 svc_sendreply F
++GLIBC_2.26 svc_unregister F
++GLIBC_2.26 svcauthdes_stats D 0xc
++GLIBC_2.26 svcerr_auth F
++GLIBC_2.26 svcerr_decode F
++GLIBC_2.26 svcerr_noproc F
++GLIBC_2.26 svcerr_noprog F
++GLIBC_2.26 svcerr_progvers F
++GLIBC_2.26 svcerr_systemerr F
++GLIBC_2.26 svcerr_weakauth F
++GLIBC_2.26 svcfd_create F
++GLIBC_2.26 svcraw_create F
++GLIBC_2.26 svctcp_create F
++GLIBC_2.26 svcudp_bufcreate F
++GLIBC_2.26 svcudp_create F
++GLIBC_2.26 svcudp_enablecache F
++GLIBC_2.26 svcunix_create F
++GLIBC_2.26 svcunixfd_create F
++GLIBC_2.26 swab F
++GLIBC_2.26 swapcontext F
++GLIBC_2.26 swapoff F
++GLIBC_2.26 swapon F
++GLIBC_2.26 swprintf F
++GLIBC_2.26 swscanf F
++GLIBC_2.26 symlink F
++GLIBC_2.26 symlinkat F
++GLIBC_2.26 sync F
++GLIBC_2.26 sync_file_range F
++GLIBC_2.26 syncfs F
++GLIBC_2.26 sys_errlist D 0x21c
++GLIBC_2.26 sys_nerr D 0x4
++GLIBC_2.26 sys_sigabbrev D 0x104
++GLIBC_2.26 sys_siglist D 0x104
++GLIBC_2.26 syscall F
++GLIBC_2.26 sysconf F
++GLIBC_2.26 sysctl F
++GLIBC_2.26 sysinfo F
++GLIBC_2.26 syslog F
++GLIBC_2.26 system F
++GLIBC_2.26 sysv_signal F
++GLIBC_2.26 tcdrain F
++GLIBC_2.26 tcflow F
++GLIBC_2.26 tcflush F
++GLIBC_2.26 tcgetattr F
++GLIBC_2.26 tcgetpgrp F
++GLIBC_2.26 tcgetsid F
++GLIBC_2.26 tcsendbreak F
++GLIBC_2.26 tcsetattr F
++GLIBC_2.26 tcsetpgrp F
++GLIBC_2.26 tdelete F
++GLIBC_2.26 tdestroy F
++GLIBC_2.26 tee F
++GLIBC_2.26 telldir F
++GLIBC_2.26 tempnam F
++GLIBC_2.26 textdomain F
++GLIBC_2.26 tfind F
++GLIBC_2.26 time F
++GLIBC_2.26 timegm F
++GLIBC_2.26 timelocal F
++GLIBC_2.26 timerfd_create F
++GLIBC_2.26 timerfd_gettime F
++GLIBC_2.26 timerfd_settime F
++GLIBC_2.26 times F
++GLIBC_2.26 timespec_get F
++GLIBC_2.26 timezone D 0x4
++GLIBC_2.26 tmpfile F
++GLIBC_2.26 tmpfile64 F
++GLIBC_2.26 tmpnam F
++GLIBC_2.26 tmpnam_r F
++GLIBC_2.26 toascii F
++GLIBC_2.26 tolower F
++GLIBC_2.26 tolower_l F
++GLIBC_2.26 toupper F
++GLIBC_2.26 toupper_l F
++GLIBC_2.26 towctrans F
++GLIBC_2.26 towctrans_l F
++GLIBC_2.26 towlower F
++GLIBC_2.26 towlower_l F
++GLIBC_2.26 towupper F
++GLIBC_2.26 towupper_l F
++GLIBC_2.26 tr_break F
++GLIBC_2.26 truncate F
++GLIBC_2.26 truncate64 F
++GLIBC_2.26 tsearch F
++GLIBC_2.26 ttyname F
++GLIBC_2.26 ttyname_r F
++GLIBC_2.26 ttyslot F
++GLIBC_2.26 twalk F
++GLIBC_2.26 tzname D 0x8
++GLIBC_2.26 tzset F
++GLIBC_2.26 ualarm F
++GLIBC_2.26 ulckpwdf F
++GLIBC_2.26 ulimit F
++GLIBC_2.26 umask F
++GLIBC_2.26 umount F
++GLIBC_2.26 umount2 F
++GLIBC_2.26 uname F
++GLIBC_2.26 ungetc F
++GLIBC_2.26 ungetwc F
++GLIBC_2.26 unlink F
++GLIBC_2.26 unlinkat F
++GLIBC_2.26 unlockpt F
++GLIBC_2.26 unsetenv F
++GLIBC_2.26 unshare F
++GLIBC_2.26 updwtmp F
++GLIBC_2.26 updwtmpx F
++GLIBC_2.26 uselocale F
++GLIBC_2.26 user2netname F
++GLIBC_2.26 usleep F
++GLIBC_2.26 ustat F
++GLIBC_2.26 utime F
++GLIBC_2.26 utimensat F
++GLIBC_2.26 utimes F
++GLIBC_2.26 utmpname F
++GLIBC_2.26 utmpxname F
++GLIBC_2.26 valloc F
++GLIBC_2.26 vasprintf F
++GLIBC_2.26 vdprintf F
++GLIBC_2.26 verr F
++GLIBC_2.26 verrx F
++GLIBC_2.26 versionsort F
++GLIBC_2.26 versionsort64 F
++GLIBC_2.26 vfork F
++GLIBC_2.26 vfprintf F
++GLIBC_2.26 vfscanf F
++GLIBC_2.26 vfwprintf F
++GLIBC_2.26 vfwscanf F
++GLIBC_2.26 vhangup F
++GLIBC_2.26 vlimit F
++GLIBC_2.26 vmsplice F
++GLIBC_2.26 vprintf F
++GLIBC_2.26 vscanf F
++GLIBC_2.26 vsnprintf F
++GLIBC_2.26 vsprintf F
++GLIBC_2.26 vsscanf F
++GLIBC_2.26 vswprintf F
++GLIBC_2.26 vswscanf F
++GLIBC_2.26 vsyslog F
++GLIBC_2.26 vtimes F
++GLIBC_2.26 vwarn F
++GLIBC_2.26 vwarnx F
++GLIBC_2.26 vwprintf F
++GLIBC_2.26 vwscanf F
++GLIBC_2.26 wait F
++GLIBC_2.26 wait3 F
++GLIBC_2.26 wait4 F
++GLIBC_2.26 waitid F
++GLIBC_2.26 waitpid F
++GLIBC_2.26 warn F
++GLIBC_2.26 warnx F
++GLIBC_2.26 wcpcpy F
++GLIBC_2.26 wcpncpy F
++GLIBC_2.26 wcrtomb F
++GLIBC_2.26 wcscasecmp F
++GLIBC_2.26 wcscasecmp_l F
++GLIBC_2.26 wcscat F
++GLIBC_2.26 wcschr F
++GLIBC_2.26 wcschrnul F
++GLIBC_2.26 wcscmp F
++GLIBC_2.26 wcscoll F
++GLIBC_2.26 wcscoll_l F
++GLIBC_2.26 wcscpy F
++GLIBC_2.26 wcscspn F
++GLIBC_2.26 wcsdup F
++GLIBC_2.26 wcsftime F
++GLIBC_2.26 wcsftime_l F
++GLIBC_2.26 wcslen F
++GLIBC_2.26 wcsncasecmp F
++GLIBC_2.26 wcsncasecmp_l F
++GLIBC_2.26 wcsncat F
++GLIBC_2.26 wcsncmp F
++GLIBC_2.26 wcsncpy F
++GLIBC_2.26 wcsnlen F
++GLIBC_2.26 wcsnrtombs F
++GLIBC_2.26 wcspbrk F
++GLIBC_2.26 wcsrchr F
++GLIBC_2.26 wcsrtombs F
++GLIBC_2.26 wcsspn F
++GLIBC_2.26 wcsstr F
++GLIBC_2.26 wcstod F
++GLIBC_2.26 wcstod_l F
++GLIBC_2.26 wcstof F
++GLIBC_2.26 wcstof_l F
++GLIBC_2.26 wcstoimax F
++GLIBC_2.26 wcstok F
++GLIBC_2.26 wcstol F
++GLIBC_2.26 wcstol_l F
++GLIBC_2.26 wcstold F
++GLIBC_2.26 wcstold_l F
++GLIBC_2.26 wcstoll F
++GLIBC_2.26 wcstoll_l F
++GLIBC_2.26 wcstombs F
++GLIBC_2.26 wcstoq F
++GLIBC_2.26 wcstoul F
++GLIBC_2.26 wcstoul_l F
++GLIBC_2.26 wcstoull F
++GLIBC_2.26 wcstoull_l F
++GLIBC_2.26 wcstoumax F
++GLIBC_2.26 wcstouq F
++GLIBC_2.26 wcswcs F
++GLIBC_2.26 wcswidth F
++GLIBC_2.26 wcsxfrm F
++GLIBC_2.26 wcsxfrm_l F
++GLIBC_2.26 wctob F
++GLIBC_2.26 wctomb F
++GLIBC_2.26 wctrans F
++GLIBC_2.26 wctrans_l F
++GLIBC_2.26 wctype F
++GLIBC_2.26 wctype_l F
++GLIBC_2.26 wcwidth F
++GLIBC_2.26 wmemchr F
++GLIBC_2.26 wmemcmp F
++GLIBC_2.26 wmemcpy F
++GLIBC_2.26 wmemmove F
++GLIBC_2.26 wmempcpy F
++GLIBC_2.26 wmemset F
++GLIBC_2.26 wordexp F
++GLIBC_2.26 wordfree F
++GLIBC_2.26 wprintf F
++GLIBC_2.26 write F
++GLIBC_2.26 writev F
++GLIBC_2.26 wscanf F
++GLIBC_2.26 xdecrypt F
++GLIBC_2.26 xdr_accepted_reply F
++GLIBC_2.26 xdr_array F
++GLIBC_2.26 xdr_authdes_cred F
++GLIBC_2.26 xdr_authdes_verf F
++GLIBC_2.26 xdr_authunix_parms F
++GLIBC_2.26 xdr_bool F
++GLIBC_2.26 xdr_bytes F
++GLIBC_2.26 xdr_callhdr F
++GLIBC_2.26 xdr_callmsg F
++GLIBC_2.26 xdr_char F
++GLIBC_2.26 xdr_cryptkeyarg F
++GLIBC_2.26 xdr_cryptkeyarg2 F
++GLIBC_2.26 xdr_cryptkeyres F
++GLIBC_2.26 xdr_des_block F
++GLIBC_2.26 xdr_double F
++GLIBC_2.26 xdr_enum F
++GLIBC_2.26 xdr_float F
++GLIBC_2.26 xdr_free F
++GLIBC_2.26 xdr_getcredres F
++GLIBC_2.26 xdr_hyper F
++GLIBC_2.26 xdr_int F
++GLIBC_2.26 xdr_int16_t F
++GLIBC_2.26 xdr_int32_t F
++GLIBC_2.26 xdr_int64_t F
++GLIBC_2.26 xdr_int8_t F
++GLIBC_2.26 xdr_key_netstarg F
++GLIBC_2.26 xdr_key_netstres F
++GLIBC_2.26 xdr_keybuf F
++GLIBC_2.26 xdr_keystatus F
++GLIBC_2.26 xdr_long F
++GLIBC_2.26 xdr_longlong_t F
++GLIBC_2.26 xdr_netnamestr F
++GLIBC_2.26 xdr_netobj F
++GLIBC_2.26 xdr_opaque F
++GLIBC_2.26 xdr_opaque_auth F
++GLIBC_2.26 xdr_pmap F
++GLIBC_2.26 xdr_pmaplist F
++GLIBC_2.26 xdr_pointer F
++GLIBC_2.26 xdr_quad_t F
++GLIBC_2.26 xdr_reference F
++GLIBC_2.26 xdr_rejected_reply F
++GLIBC_2.26 xdr_replymsg F
++GLIBC_2.26 xdr_rmtcall_args F
++GLIBC_2.26 xdr_rmtcallres F
++GLIBC_2.26 xdr_short F
++GLIBC_2.26 xdr_sizeof F
++GLIBC_2.26 xdr_string F
++GLIBC_2.26 xdr_u_char F
++GLIBC_2.26 xdr_u_hyper F
++GLIBC_2.26 xdr_u_int F
++GLIBC_2.26 xdr_u_long F
++GLIBC_2.26 xdr_u_longlong_t F
++GLIBC_2.26 xdr_u_quad_t F
++GLIBC_2.26 xdr_u_short F
++GLIBC_2.26 xdr_uint16_t F
++GLIBC_2.26 xdr_uint32_t F
++GLIBC_2.26 xdr_uint64_t F
++GLIBC_2.26 xdr_uint8_t F
++GLIBC_2.26 xdr_union F
++GLIBC_2.26 xdr_unixcred F
++GLIBC_2.26 xdr_vector F
++GLIBC_2.26 xdr_void F
++GLIBC_2.26 xdr_wrapstring F
++GLIBC_2.26 xdrmem_create F
++GLIBC_2.26 xdrrec_create F
++GLIBC_2.26 xdrrec_endofrecord F
++GLIBC_2.26 xdrrec_eof F
++GLIBC_2.26 xdrrec_skiprecord F
++GLIBC_2.26 xdrstdio_create F
++GLIBC_2.26 xencrypt F
++GLIBC_2.26 xprt_register F
++GLIBC_2.26 xprt_unregister F
+diff --git a/sysdeps/unix/sysv/linux/arc/libcrypt.abilist b/sysdeps/unix/sysv/linux/arc/libcrypt.abilist
+new file mode 100644
+index 0000000..f00e865
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/libcrypt.abilist
+@@ -0,0 +1,8 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 crypt F
++GLIBC_2.26 crypt_r F
++GLIBC_2.26 encrypt F
++GLIBC_2.26 encrypt_r F
++GLIBC_2.26 fcrypt F
++GLIBC_2.26 setkey F
++GLIBC_2.26 setkey_r F
+diff --git a/sysdeps/unix/sysv/linux/arc/libdl.abilist b/sysdeps/unix/sysv/linux/arc/libdl.abilist
+new file mode 100644
+index 0000000..dc8ac5b
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/libdl.abilist
+@@ -0,0 +1,10 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 dladdr F
++GLIBC_2.26 dladdr1 F
++GLIBC_2.26 dlclose F
++GLIBC_2.26 dlerror F
++GLIBC_2.26 dlinfo F
++GLIBC_2.26 dlmopen F
++GLIBC_2.26 dlopen F
++GLIBC_2.26 dlsym F
++GLIBC_2.26 dlvsym F
+diff --git a/sysdeps/unix/sysv/linux/arc/libm.abilist b/sysdeps/unix/sysv/linux/arc/libm.abilist
+new file mode 100644
+index 0000000..e17d9b7
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/libm.abilist
+@@ -0,0 +1,423 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 _LIB_VERSION D 0x4
++GLIBC_2.26 __acos_finite F
++GLIBC_2.26 __acosf_finite F
++GLIBC_2.26 __acosh_finite F
++GLIBC_2.26 __acoshf_finite F
++GLIBC_2.26 __asin_finite F
++GLIBC_2.26 __asinf_finite F
++GLIBC_2.26 __atan2_finite F
++GLIBC_2.26 __atan2f_finite F
++GLIBC_2.26 __atanh_finite F
++GLIBC_2.26 __atanhf_finite F
++GLIBC_2.26 __clog10 F
++GLIBC_2.26 __clog10f F
++GLIBC_2.26 __clog10l F
++GLIBC_2.26 __cosh_finite F
++GLIBC_2.26 __coshf_finite F
++GLIBC_2.26 __exp10_finite F
++GLIBC_2.26 __exp10f_finite F
++GLIBC_2.26 __exp2_finite F
++GLIBC_2.26 __exp2f_finite F
++GLIBC_2.26 __exp_finite F
++GLIBC_2.26 __expf_finite F
++GLIBC_2.26 __finite F
++GLIBC_2.26 __finitef F
++GLIBC_2.26 __fmod_finite F
++GLIBC_2.26 __fmodf_finite F
++GLIBC_2.26 __fpclassify F
++GLIBC_2.26 __fpclassifyf F
++GLIBC_2.26 __gamma_r_finite F
++GLIBC_2.26 __gammaf_r_finite F
++GLIBC_2.26 __hypot_finite F
++GLIBC_2.26 __hypotf_finite F
++GLIBC_2.26 __iseqsig F
++GLIBC_2.26 __iseqsigf F
++GLIBC_2.26 __issignaling F
++GLIBC_2.26 __issignalingf F
++GLIBC_2.26 __j0_finite F
++GLIBC_2.26 __j0f_finite F
++GLIBC_2.26 __j1_finite F
++GLIBC_2.26 __j1f_finite F
++GLIBC_2.26 __jn_finite F
++GLIBC_2.26 __jnf_finite F
++GLIBC_2.26 __lgamma_r_finite F
++GLIBC_2.26 __lgammaf_r_finite F
++GLIBC_2.26 __log10_finite F
++GLIBC_2.26 __log10f_finite F
++GLIBC_2.26 __log2_finite F
++GLIBC_2.26 __log2f_finite F
++GLIBC_2.26 __log_finite F
++GLIBC_2.26 __logf_finite F
++GLIBC_2.26 __pow_finite F
++GLIBC_2.26 __powf_finite F
++GLIBC_2.26 __remainder_finite F
++GLIBC_2.26 __remainderf_finite F
++GLIBC_2.26 __scalb_finite F
++GLIBC_2.26 __scalbf_finite F
++GLIBC_2.26 __signbit F
++GLIBC_2.26 __signbitf F
++GLIBC_2.26 __signgam D 0x4
++GLIBC_2.26 __sinh_finite F
++GLIBC_2.26 __sinhf_finite F
++GLIBC_2.26 __sqrt_finite F
++GLIBC_2.26 __sqrtf_finite F
++GLIBC_2.26 __y0_finite F
++GLIBC_2.26 __y0f_finite F
++GLIBC_2.26 __y1_finite F
++GLIBC_2.26 __y1f_finite F
++GLIBC_2.26 __yn_finite F
++GLIBC_2.26 __ynf_finite F
++GLIBC_2.26 acos F
++GLIBC_2.26 acosf F
++GLIBC_2.26 acosh F
++GLIBC_2.26 acoshf F
++GLIBC_2.26 acoshl F
++GLIBC_2.26 acosl F
++GLIBC_2.26 asin F
++GLIBC_2.26 asinf F
++GLIBC_2.26 asinh F
++GLIBC_2.26 asinhf F
++GLIBC_2.26 asinhl F
++GLIBC_2.26 asinl F
++GLIBC_2.26 atan F
++GLIBC_2.26 atan2 F
++GLIBC_2.26 atan2f F
++GLIBC_2.26 atan2l F
++GLIBC_2.26 atanf F
++GLIBC_2.26 atanh F
++GLIBC_2.26 atanhf F
++GLIBC_2.26 atanhl F
++GLIBC_2.26 atanl F
++GLIBC_2.26 cabs F
++GLIBC_2.26 cabsf F
++GLIBC_2.26 cabsl F
++GLIBC_2.26 cacos F
++GLIBC_2.26 cacosf F
++GLIBC_2.26 cacosh F
++GLIBC_2.26 cacoshf F
++GLIBC_2.26 cacoshl F
++GLIBC_2.26 cacosl F
++GLIBC_2.26 canonicalize F
++GLIBC_2.26 canonicalizef F
++GLIBC_2.26 canonicalizel F
++GLIBC_2.26 carg F
++GLIBC_2.26 cargf F
++GLIBC_2.26 cargl F
++GLIBC_2.26 casin F
++GLIBC_2.26 casinf F
++GLIBC_2.26 casinh F
++GLIBC_2.26 casinhf F
++GLIBC_2.26 casinhl F
++GLIBC_2.26 casinl F
++GLIBC_2.26 catan F
++GLIBC_2.26 catanf F
++GLIBC_2.26 catanh F
++GLIBC_2.26 catanhf F
++GLIBC_2.26 catanhl F
++GLIBC_2.26 catanl F
++GLIBC_2.26 cbrt F
++GLIBC_2.26 cbrtf F
++GLIBC_2.26 cbrtl F
++GLIBC_2.26 ccos F
++GLIBC_2.26 ccosf F
++GLIBC_2.26 ccosh F
++GLIBC_2.26 ccoshf F
++GLIBC_2.26 ccoshl F
++GLIBC_2.26 ccosl F
++GLIBC_2.26 ceil F
++GLIBC_2.26 ceilf F
++GLIBC_2.26 ceill F
++GLIBC_2.26 cexp F
++GLIBC_2.26 cexpf F
++GLIBC_2.26 cexpl F
++GLIBC_2.26 cimag F
++GLIBC_2.26 cimagf F
++GLIBC_2.26 cimagl F
++GLIBC_2.26 clog F
++GLIBC_2.26 clog10 F
++GLIBC_2.26 clog10f F
++GLIBC_2.26 clog10l F
++GLIBC_2.26 clogf F
++GLIBC_2.26 clogl F
++GLIBC_2.26 conj F
++GLIBC_2.26 conjf F
++GLIBC_2.26 conjl F
++GLIBC_2.26 copysign F
++GLIBC_2.26 copysignf F
++GLIBC_2.26 copysignl F
++GLIBC_2.26 cos F
++GLIBC_2.26 cosf F
++GLIBC_2.26 cosh F
++GLIBC_2.26 coshf F
++GLIBC_2.26 coshl F
++GLIBC_2.26 cosl F
++GLIBC_2.26 cpow F
++GLIBC_2.26 cpowf F
++GLIBC_2.26 cpowl F
++GLIBC_2.26 cproj F
++GLIBC_2.26 cprojf F
++GLIBC_2.26 cprojl F
++GLIBC_2.26 creal F
++GLIBC_2.26 crealf F
++GLIBC_2.26 creall F
++GLIBC_2.26 csin F
++GLIBC_2.26 csinf F
++GLIBC_2.26 csinh F
++GLIBC_2.26 csinhf F
++GLIBC_2.26 csinhl F
++GLIBC_2.26 csinl F
++GLIBC_2.26 csqrt F
++GLIBC_2.26 csqrtf F
++GLIBC_2.26 csqrtl F
++GLIBC_2.26 ctan F
++GLIBC_2.26 ctanf F
++GLIBC_2.26 ctanh F
++GLIBC_2.26 ctanhf F
++GLIBC_2.26 ctanhl F
++GLIBC_2.26 ctanl F
++GLIBC_2.26 drem F
++GLIBC_2.26 dremf F
++GLIBC_2.26 dreml F
++GLIBC_2.26 erf F
++GLIBC_2.26 erfc F
++GLIBC_2.26 erfcf F
++GLIBC_2.26 erfcl F
++GLIBC_2.26 erff F
++GLIBC_2.26 erfl F
++GLIBC_2.26 exp F
++GLIBC_2.26 exp10 F
++GLIBC_2.26 exp10f F
++GLIBC_2.26 exp10l F
++GLIBC_2.26 exp2 F
++GLIBC_2.26 exp2f F
++GLIBC_2.26 exp2l F
++GLIBC_2.26 expf F
++GLIBC_2.26 expl F
++GLIBC_2.26 expm1 F
++GLIBC_2.26 expm1f F
++GLIBC_2.26 expm1l F
++GLIBC_2.26 fabs F
++GLIBC_2.26 fabsf F
++GLIBC_2.26 fabsl F
++GLIBC_2.26 fdim F
++GLIBC_2.26 fdimf F
++GLIBC_2.26 fdiml F
++GLIBC_2.26 feclearexcept F
++GLIBC_2.26 fedisableexcept F
++GLIBC_2.26 feenableexcept F
++GLIBC_2.26 fegetenv F
++GLIBC_2.26 fegetexcept F
++GLIBC_2.26 fegetexceptflag F
++GLIBC_2.26 fegetmode F
++GLIBC_2.26 fegetround F
++GLIBC_2.26 feholdexcept F
++GLIBC_2.26 feraiseexcept F
++GLIBC_2.26 fesetenv F
++GLIBC_2.26 fesetexcept F
++GLIBC_2.26 fesetexceptflag F
++GLIBC_2.26 fesetmode F
++GLIBC_2.26 fesetround F
++GLIBC_2.26 fetestexcept F
++GLIBC_2.26 fetestexceptflag F
++GLIBC_2.26 feupdateenv F
++GLIBC_2.26 finite F
++GLIBC_2.26 finitef F
++GLIBC_2.26 finitel F
++GLIBC_2.26 floor F
++GLIBC_2.26 floorf F
++GLIBC_2.26 floorl F
++GLIBC_2.26 fma F
++GLIBC_2.26 fmaf F
++GLIBC_2.26 fmal F
++GLIBC_2.26 fmax F
++GLIBC_2.26 fmaxf F
++GLIBC_2.26 fmaxl F
++GLIBC_2.26 fmaxmag F
++GLIBC_2.26 fmaxmagf F
++GLIBC_2.26 fmaxmagl F
++GLIBC_2.26 fmin F
++GLIBC_2.26 fminf F
++GLIBC_2.26 fminl F
++GLIBC_2.26 fminmag F
++GLIBC_2.26 fminmagf F
++GLIBC_2.26 fminmagl F
++GLIBC_2.26 fmod F
++GLIBC_2.26 fmodf F
++GLIBC_2.26 fmodl F
++GLIBC_2.26 frexp F
++GLIBC_2.26 frexpf F
++GLIBC_2.26 frexpl F
++GLIBC_2.26 fromfp F
++GLIBC_2.26 fromfpf F
++GLIBC_2.26 fromfpl F
++GLIBC_2.26 fromfpx F
++GLIBC_2.26 fromfpxf F
++GLIBC_2.26 fromfpxl F
++GLIBC_2.26 gamma F
++GLIBC_2.26 gammaf F
++GLIBC_2.26 gammal F
++GLIBC_2.26 getpayload F
++GLIBC_2.26 getpayloadf F
++GLIBC_2.26 getpayloadl F
++GLIBC_2.26 hypot F
++GLIBC_2.26 hypotf F
++GLIBC_2.26 hypotl F
++GLIBC_2.26 ilogb F
++GLIBC_2.26 ilogbf F
++GLIBC_2.26 ilogbl F
++GLIBC_2.26 j0 F
++GLIBC_2.26 j0f F
++GLIBC_2.26 j0l F
++GLIBC_2.26 j1 F
++GLIBC_2.26 j1f F
++GLIBC_2.26 j1l F
++GLIBC_2.26 jn F
++GLIBC_2.26 jnf F
++GLIBC_2.26 jnl F
++GLIBC_2.26 ldexp F
++GLIBC_2.26 ldexpf F
++GLIBC_2.26 ldexpl F
++GLIBC_2.26 lgamma F
++GLIBC_2.26 lgamma_r F
++GLIBC_2.26 lgammaf F
++GLIBC_2.26 lgammaf_r F
++GLIBC_2.26 lgammal F
++GLIBC_2.26 lgammal_r F
++GLIBC_2.26 llogb F
++GLIBC_2.26 llogbf F
++GLIBC_2.26 llogbl F
++GLIBC_2.26 llrint F
++GLIBC_2.26 llrintf F
++GLIBC_2.26 llrintl F
++GLIBC_2.26 llround F
++GLIBC_2.26 llroundf F
++GLIBC_2.26 llroundl F
++GLIBC_2.26 log F
++GLIBC_2.26 log10 F
++GLIBC_2.26 log10f F
++GLIBC_2.26 log10l F
++GLIBC_2.26 log1p F
++GLIBC_2.26 log1pf F
++GLIBC_2.26 log1pl F
++GLIBC_2.26 log2 F
++GLIBC_2.26 log2f F
++GLIBC_2.26 log2l F
++GLIBC_2.26 logb F
++GLIBC_2.26 logbf F
++GLIBC_2.26 logbl F
++GLIBC_2.26 logf F
++GLIBC_2.26 logl F
++GLIBC_2.26 lrint F
++GLIBC_2.26 lrintf F
++GLIBC_2.26 lrintl F
++GLIBC_2.26 lround F
++GLIBC_2.26 lroundf F
++GLIBC_2.26 lroundl F
++GLIBC_2.26 matherr F
++GLIBC_2.26 modf F
++GLIBC_2.26 modff F
++GLIBC_2.26 modfl F
++GLIBC_2.26 nan F
++GLIBC_2.26 nanf F
++GLIBC_2.26 nanl F
++GLIBC_2.26 nearbyint F
++GLIBC_2.26 nearbyintf F
++GLIBC_2.26 nearbyintl F
++GLIBC_2.26 nextafter F
++GLIBC_2.26 nextafterf F
++GLIBC_2.26 nextafterl F
++GLIBC_2.26 nextdown F
++GLIBC_2.26 nextdownf F
++GLIBC_2.26 nextdownl F
++GLIBC_2.26 nexttoward F
++GLIBC_2.26 nexttowardf F
++GLIBC_2.26 nexttowardl F
++GLIBC_2.26 nextup F
++GLIBC_2.26 nextupf F
++GLIBC_2.26 nextupl F
++GLIBC_2.26 pow F
++GLIBC_2.26 pow10 F
++GLIBC_2.26 pow10f F
++GLIBC_2.26 pow10l F
++GLIBC_2.26 powf F
++GLIBC_2.26 powl F
++GLIBC_2.26 remainder F
++GLIBC_2.26 remainderf F
++GLIBC_2.26 remainderl F
++GLIBC_2.26 remquo F
++GLIBC_2.26 remquof F
++GLIBC_2.26 remquol F
++GLIBC_2.26 rint F
++GLIBC_2.26 rintf F
++GLIBC_2.26 rintl F
++GLIBC_2.26 round F
++GLIBC_2.26 roundeven F
++GLIBC_2.26 roundevenf F
++GLIBC_2.26 roundevenl F
++GLIBC_2.26 roundf F
++GLIBC_2.26 roundl F
++GLIBC_2.26 scalb F
++GLIBC_2.26 scalbf F
++GLIBC_2.26 scalbl F
++GLIBC_2.26 scalbln F
++GLIBC_2.26 scalblnf F
++GLIBC_2.26 scalblnl F
++GLIBC_2.26 scalbn F
++GLIBC_2.26 scalbnf F
++GLIBC_2.26 scalbnl F
++GLIBC_2.26 setpayload F
++GLIBC_2.26 setpayloadf F
++GLIBC_2.26 setpayloadl F
++GLIBC_2.26 setpayloadsig F
++GLIBC_2.26 setpayloadsigf F
++GLIBC_2.26 setpayloadsigl F
++GLIBC_2.26 signgam D 0x4
++GLIBC_2.26 significand F
++GLIBC_2.26 significandf F
++GLIBC_2.26 significandl F
++GLIBC_2.26 sin F
++GLIBC_2.26 sincos F
++GLIBC_2.26 sincosf F
++GLIBC_2.26 sincosl F
++GLIBC_2.26 sinf F
++GLIBC_2.26 sinh F
++GLIBC_2.26 sinhf F
++GLIBC_2.26 sinhl F
++GLIBC_2.26 sinl F
++GLIBC_2.26 sqrt F
++GLIBC_2.26 sqrtf F
++GLIBC_2.26 sqrtl F
++GLIBC_2.26 tan F
++GLIBC_2.26 tanf F
++GLIBC_2.26 tanh F
++GLIBC_2.26 tanhf F
++GLIBC_2.26 tanhl F
++GLIBC_2.26 tanl F
++GLIBC_2.26 tgamma F
++GLIBC_2.26 tgammaf F
++GLIBC_2.26 tgammal F
++GLIBC_2.26 totalorder F
++GLIBC_2.26 totalorderf F
++GLIBC_2.26 totalorderl F
++GLIBC_2.26 totalordermag F
++GLIBC_2.26 totalordermagf F
++GLIBC_2.26 totalordermagl F
++GLIBC_2.26 trunc F
++GLIBC_2.26 truncf F
++GLIBC_2.26 truncl F
++GLIBC_2.26 ufromfp F
++GLIBC_2.26 ufromfpf F
++GLIBC_2.26 ufromfpl F
++GLIBC_2.26 ufromfpx F
++GLIBC_2.26 ufromfpxf F
++GLIBC_2.26 ufromfpxl F
++GLIBC_2.26 y0 F
++GLIBC_2.26 y0f F
++GLIBC_2.26 y0l F
++GLIBC_2.26 y1 F
++GLIBC_2.26 y1f F
++GLIBC_2.26 y1l F
++GLIBC_2.26 yn F
++GLIBC_2.26 ynf F
++GLIBC_2.26 ynl F
+diff --git a/sysdeps/unix/sysv/linux/arc/libnsl.abilist b/sysdeps/unix/sysv/linux/arc/libnsl.abilist
+new file mode 100644
+index 0000000..315827e
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/libnsl.abilist
+@@ -0,0 +1,122 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 __free_fdresult F
++GLIBC_2.26 __nis_default_access F
++GLIBC_2.26 __nis_default_group F
++GLIBC_2.26 __nis_default_owner F
++GLIBC_2.26 __nis_default_ttl F
++GLIBC_2.26 __nis_finddirectory F
++GLIBC_2.26 __nis_hash F
++GLIBC_2.26 __nisbind_connect F
++GLIBC_2.26 __nisbind_create F
++GLIBC_2.26 __nisbind_destroy F
++GLIBC_2.26 __nisbind_next F
++GLIBC_2.26 __yp_check F
++GLIBC_2.26 nis_add F
++GLIBC_2.26 nis_add_entry F
++GLIBC_2.26 nis_addmember F
++GLIBC_2.26 nis_checkpoint F
++GLIBC_2.26 nis_clone_directory F
++GLIBC_2.26 nis_clone_object F
++GLIBC_2.26 nis_clone_result F
++GLIBC_2.26 nis_creategroup F
++GLIBC_2.26 nis_destroy_object F
++GLIBC_2.26 nis_destroygroup F
++GLIBC_2.26 nis_dir_cmp F
++GLIBC_2.26 nis_domain_of F
++GLIBC_2.26 nis_domain_of_r F
++GLIBC_2.26 nis_first_entry F
++GLIBC_2.26 nis_free_directory F
++GLIBC_2.26 nis_free_object F
++GLIBC_2.26 nis_free_request F
++GLIBC_2.26 nis_freenames F
++GLIBC_2.26 nis_freeresult F
++GLIBC_2.26 nis_freeservlist F
++GLIBC_2.26 nis_freetags F
++GLIBC_2.26 nis_getnames F
++GLIBC_2.26 nis_getservlist F
++GLIBC_2.26 nis_ismember F
++GLIBC_2.26 nis_leaf_of F
++GLIBC_2.26 nis_leaf_of_r F
++GLIBC_2.26 nis_lerror F
++GLIBC_2.26 nis_list F
++GLIBC_2.26 nis_local_directory F
++GLIBC_2.26 nis_local_group F
++GLIBC_2.26 nis_local_host F
++GLIBC_2.26 nis_local_principal F
++GLIBC_2.26 nis_lookup F
++GLIBC_2.26 nis_mkdir F
++GLIBC_2.26 nis_modify F
++GLIBC_2.26 nis_modify_entry F
++GLIBC_2.26 nis_name_of F
++GLIBC_2.26 nis_name_of_r F
++GLIBC_2.26 nis_next_entry F
++GLIBC_2.26 nis_perror F
++GLIBC_2.26 nis_ping F
++GLIBC_2.26 nis_print_directory F
++GLIBC_2.26 nis_print_entry F
++GLIBC_2.26 nis_print_group F
++GLIBC_2.26 nis_print_group_entry F
++GLIBC_2.26 nis_print_link F
++GLIBC_2.26 nis_print_object F
++GLIBC_2.26 nis_print_result F
++GLIBC_2.26 nis_print_rights F
++GLIBC_2.26 nis_print_table F
++GLIBC_2.26 nis_read_obj F
++GLIBC_2.26 nis_remove F
++GLIBC_2.26 nis_remove_entry F
++GLIBC_2.26 nis_removemember F
++GLIBC_2.26 nis_rmdir F
++GLIBC_2.26 nis_servstate F
++GLIBC_2.26 nis_sperrno F
++GLIBC_2.26 nis_sperror F
++GLIBC_2.26 nis_sperror_r F
++GLIBC_2.26 nis_stats F
++GLIBC_2.26 nis_verifygroup F
++GLIBC_2.26 nis_write_obj F
++GLIBC_2.26 readColdStartFile F
++GLIBC_2.26 writeColdStartFile F
++GLIBC_2.26 xdr_cback_data F
++GLIBC_2.26 xdr_domainname F
++GLIBC_2.26 xdr_keydat F
++GLIBC_2.26 xdr_mapname F
++GLIBC_2.26 xdr_obj_p F
++GLIBC_2.26 xdr_peername F
++GLIBC_2.26 xdr_valdat F
++GLIBC_2.26 xdr_yp_buf F
++GLIBC_2.26 xdr_ypall F
++GLIBC_2.26 xdr_ypbind_binding F
++GLIBC_2.26 xdr_ypbind_resp F
++GLIBC_2.26 xdr_ypbind_resptype F
++GLIBC_2.26 xdr_ypbind_setdom F
++GLIBC_2.26 xdr_ypdelete_args F
++GLIBC_2.26 xdr_ypmap_parms F
++GLIBC_2.26 xdr_ypmaplist F
++GLIBC_2.26 xdr_yppush_status F
++GLIBC_2.26 xdr_yppushresp_xfr F
++GLIBC_2.26 xdr_ypreq_key F
++GLIBC_2.26 xdr_ypreq_nokey F
++GLIBC_2.26 xdr_ypreq_xfr F
++GLIBC_2.26 xdr_ypresp_all F
++GLIBC_2.26 xdr_ypresp_key_val F
++GLIBC_2.26 xdr_ypresp_maplist F
++GLIBC_2.26 xdr_ypresp_master F
++GLIBC_2.26 xdr_ypresp_order F
++GLIBC_2.26 xdr_ypresp_val F
++GLIBC_2.26 xdr_ypresp_xfr F
++GLIBC_2.26 xdr_ypstat F
++GLIBC_2.26 xdr_ypupdate_args F
++GLIBC_2.26 xdr_ypxfrstat F
++GLIBC_2.26 yp_all F
++GLIBC_2.26 yp_bind F
++GLIBC_2.26 yp_first F
++GLIBC_2.26 yp_get_default_domain F
++GLIBC_2.26 yp_maplist F
++GLIBC_2.26 yp_master F
++GLIBC_2.26 yp_match F
++GLIBC_2.26 yp_next F
++GLIBC_2.26 yp_order F
++GLIBC_2.26 yp_unbind F
++GLIBC_2.26 yp_update F
++GLIBC_2.26 ypbinderr_string F
++GLIBC_2.26 yperr_string F
++GLIBC_2.26 ypprot_err F
+diff --git a/sysdeps/unix/sysv/linux/arc/libpthread.abilist b/sysdeps/unix/sysv/linux/arc/libpthread.abilist
+new file mode 100644
+index 0000000..5c06f73
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/libpthread.abilist
+@@ -0,0 +1,218 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 _IO_flockfile F
++GLIBC_2.26 _IO_ftrylockfile F
++GLIBC_2.26 _IO_funlockfile F
++GLIBC_2.26 __close F
++GLIBC_2.26 __connect F
++GLIBC_2.26 __errno_location F
++GLIBC_2.26 __fcntl F
++GLIBC_2.26 __h_errno_location F
++GLIBC_2.26 __libc_allocate_rtsig F
++GLIBC_2.26 __libc_current_sigrtmax F
++GLIBC_2.26 __libc_current_sigrtmin F
++GLIBC_2.26 __lseek F
++GLIBC_2.26 __nanosleep F
++GLIBC_2.26 __open F
++GLIBC_2.26 __open64 F
++GLIBC_2.26 __pread64 F
++GLIBC_2.26 __pthread_cleanup_routine F
++GLIBC_2.26 __pthread_getspecific F
++GLIBC_2.26 __pthread_key_create F
++GLIBC_2.26 __pthread_mutex_destroy F
++GLIBC_2.26 __pthread_mutex_init F
++GLIBC_2.26 __pthread_mutex_lock F
++GLIBC_2.26 __pthread_mutex_trylock F
++GLIBC_2.26 __pthread_mutex_unlock F
++GLIBC_2.26 __pthread_mutexattr_destroy F
++GLIBC_2.26 __pthread_mutexattr_init F
++GLIBC_2.26 __pthread_mutexattr_settype F
++GLIBC_2.26 __pthread_once F
++GLIBC_2.26 __pthread_register_cancel F
++GLIBC_2.26 __pthread_register_cancel_defer F
++GLIBC_2.26 __pthread_rwlock_destroy F
++GLIBC_2.26 __pthread_rwlock_init F
++GLIBC_2.26 __pthread_rwlock_rdlock F
++GLIBC_2.26 __pthread_rwlock_tryrdlock F
++GLIBC_2.26 __pthread_rwlock_trywrlock F
++GLIBC_2.26 __pthread_rwlock_unlock F
++GLIBC_2.26 __pthread_rwlock_wrlock F
++GLIBC_2.26 __pthread_setspecific F
++GLIBC_2.26 __pthread_unregister_cancel F
++GLIBC_2.26 __pthread_unregister_cancel_restore F
++GLIBC_2.26 __pthread_unwind_next F
++GLIBC_2.26 __pwrite64 F
++GLIBC_2.26 __read F
++GLIBC_2.26 __res_state F
++GLIBC_2.26 __send F
++GLIBC_2.26 __sigaction F
++GLIBC_2.26 __wait F
++GLIBC_2.26 __write F
++GLIBC_2.26 _pthread_cleanup_pop F
++GLIBC_2.26 _pthread_cleanup_pop_restore F
++GLIBC_2.26 _pthread_cleanup_push F
++GLIBC_2.26 _pthread_cleanup_push_defer F
++GLIBC_2.26 accept F
++GLIBC_2.26 close F
++GLIBC_2.26 connect F
++GLIBC_2.26 fcntl F
++GLIBC_2.26 flockfile F
++GLIBC_2.26 fsync F
++GLIBC_2.26 ftrylockfile F
++GLIBC_2.26 funlockfile F
++GLIBC_2.26 lseek F
++GLIBC_2.26 lseek64 F
++GLIBC_2.26 msync F
++GLIBC_2.26 nanosleep F
++GLIBC_2.26 open F
++GLIBC_2.26 open64 F
++GLIBC_2.26 pause F
++GLIBC_2.26 pread F
++GLIBC_2.26 pread64 F
++GLIBC_2.26 pthread_attr_destroy F
++GLIBC_2.26 pthread_attr_getaffinity_np F
++GLIBC_2.26 pthread_attr_getdetachstate F
++GLIBC_2.26 pthread_attr_getguardsize F
++GLIBC_2.26 pthread_attr_getinheritsched F
++GLIBC_2.26 pthread_attr_getschedparam F
++GLIBC_2.26 pthread_attr_getschedpolicy F
++GLIBC_2.26 pthread_attr_getscope F
++GLIBC_2.26 pthread_attr_getstack F
++GLIBC_2.26 pthread_attr_getstackaddr F
++GLIBC_2.26 pthread_attr_getstacksize F
++GLIBC_2.26 pthread_attr_init F
++GLIBC_2.26 pthread_attr_setaffinity_np F
++GLIBC_2.26 pthread_attr_setdetachstate F
++GLIBC_2.26 pthread_attr_setguardsize F
++GLIBC_2.26 pthread_attr_setinheritsched F
++GLIBC_2.26 pthread_attr_setschedparam F
++GLIBC_2.26 pthread_attr_setschedpolicy F
++GLIBC_2.26 pthread_attr_setscope F
++GLIBC_2.26 pthread_attr_setstack F
++GLIBC_2.26 pthread_attr_setstackaddr F
++GLIBC_2.26 pthread_attr_setstacksize F
++GLIBC_2.26 pthread_barrier_destroy F
++GLIBC_2.26 pthread_barrier_init F
++GLIBC_2.26 pthread_barrier_wait F
++GLIBC_2.26 pthread_barrierattr_destroy F
++GLIBC_2.26 pthread_barrierattr_getpshared F
++GLIBC_2.26 pthread_barrierattr_init F
++GLIBC_2.26 pthread_barrierattr_setpshared F
++GLIBC_2.26 pthread_cancel F
++GLIBC_2.26 pthread_cond_broadcast F
++GLIBC_2.26 pthread_cond_destroy F
++GLIBC_2.26 pthread_cond_init F
++GLIBC_2.26 pthread_cond_signal F
++GLIBC_2.26 pthread_cond_timedwait F
++GLIBC_2.26 pthread_cond_wait F
++GLIBC_2.26 pthread_condattr_destroy F
++GLIBC_2.26 pthread_condattr_getclock F
++GLIBC_2.26 pthread_condattr_getpshared F
++GLIBC_2.26 pthread_condattr_init F
++GLIBC_2.26 pthread_condattr_setclock F
++GLIBC_2.26 pthread_condattr_setpshared F
++GLIBC_2.26 pthread_create F
++GLIBC_2.26 pthread_detach F
++GLIBC_2.26 pthread_equal F
++GLIBC_2.26 pthread_exit F
++GLIBC_2.26 pthread_getaffinity_np F
++GLIBC_2.26 pthread_getattr_default_np F
++GLIBC_2.26 pthread_getattr_np F
++GLIBC_2.26 pthread_getconcurrency F
++GLIBC_2.26 pthread_getcpuclockid F
++GLIBC_2.26 pthread_getname_np F
++GLIBC_2.26 pthread_getschedparam F
++GLIBC_2.26 pthread_getspecific F
++GLIBC_2.26 pthread_join F
++GLIBC_2.26 pthread_key_create F
++GLIBC_2.26 pthread_key_delete F
++GLIBC_2.26 pthread_kill F
++GLIBC_2.26 pthread_kill_other_threads_np F
++GLIBC_2.26 pthread_mutex_consistent F
++GLIBC_2.26 pthread_mutex_consistent_np F
++GLIBC_2.26 pthread_mutex_destroy F
++GLIBC_2.26 pthread_mutex_getprioceiling F
++GLIBC_2.26 pthread_mutex_init F
++GLIBC_2.26 pthread_mutex_lock F
++GLIBC_2.26 pthread_mutex_setprioceiling F
++GLIBC_2.26 pthread_mutex_timedlock F
++GLIBC_2.26 pthread_mutex_trylock F
++GLIBC_2.26 pthread_mutex_unlock F
++GLIBC_2.26 pthread_mutexattr_destroy F
++GLIBC_2.26 pthread_mutexattr_getkind_np F
++GLIBC_2.26 pthread_mutexattr_getprioceiling F
++GLIBC_2.26 pthread_mutexattr_getprotocol F
++GLIBC_2.26 pthread_mutexattr_getpshared F
++GLIBC_2.26 pthread_mutexattr_getrobust F
++GLIBC_2.26 pthread_mutexattr_getrobust_np F
++GLIBC_2.26 pthread_mutexattr_gettype F
++GLIBC_2.26 pthread_mutexattr_init F
++GLIBC_2.26 pthread_mutexattr_setkind_np F
++GLIBC_2.26 pthread_mutexattr_setprioceiling F
++GLIBC_2.26 pthread_mutexattr_setprotocol F
++GLIBC_2.26 pthread_mutexattr_setpshared F
++GLIBC_2.26 pthread_mutexattr_setrobust F
++GLIBC_2.26 pthread_mutexattr_setrobust_np F
++GLIBC_2.26 pthread_mutexattr_settype F
++GLIBC_2.26 pthread_once F
++GLIBC_2.26 pthread_rwlock_destroy F
++GLIBC_2.26 pthread_rwlock_init F
++GLIBC_2.26 pthread_rwlock_rdlock F
++GLIBC_2.26 pthread_rwlock_timedrdlock F
++GLIBC_2.26 pthread_rwlock_timedwrlock F
++GLIBC_2.26 pthread_rwlock_tryrdlock F
++GLIBC_2.26 pthread_rwlock_trywrlock F
++GLIBC_2.26 pthread_rwlock_unlock F
++GLIBC_2.26 pthread_rwlock_wrlock F
++GLIBC_2.26 pthread_rwlockattr_destroy F
++GLIBC_2.26 pthread_rwlockattr_getkind_np F
++GLIBC_2.26 pthread_rwlockattr_getpshared F
++GLIBC_2.26 pthread_rwlockattr_init F
++GLIBC_2.26 pthread_rwlockattr_setkind_np F
++GLIBC_2.26 pthread_rwlockattr_setpshared F
++GLIBC_2.26 pthread_self F
++GLIBC_2.26 pthread_setaffinity_np F
++GLIBC_2.26 pthread_setattr_default_np F
++GLIBC_2.26 pthread_setcancelstate F
++GLIBC_2.26 pthread_setcanceltype F
++GLIBC_2.26 pthread_setconcurrency F
++GLIBC_2.26 pthread_setname_np F
++GLIBC_2.26 pthread_setschedparam F
++GLIBC_2.26 pthread_setschedprio F
++GLIBC_2.26 pthread_setspecific F
++GLIBC_2.26 pthread_sigmask F
++GLIBC_2.26 pthread_sigqueue F
++GLIBC_2.26 pthread_spin_destroy F
++GLIBC_2.26 pthread_spin_init F
++GLIBC_2.26 pthread_spin_lock F
++GLIBC_2.26 pthread_spin_trylock F
++GLIBC_2.26 pthread_spin_unlock F
++GLIBC_2.26 pthread_testcancel F
++GLIBC_2.26 pthread_timedjoin_np F
++GLIBC_2.26 pthread_tryjoin_np F
++GLIBC_2.26 pthread_yield F
++GLIBC_2.26 pwrite F
++GLIBC_2.26 pwrite64 F
++GLIBC_2.26 raise F
++GLIBC_2.26 read F
++GLIBC_2.26 recv F
++GLIBC_2.26 recvfrom F
++GLIBC_2.26 recvmsg F
++GLIBC_2.26 sem_close F
++GLIBC_2.26 sem_destroy F
++GLIBC_2.26 sem_getvalue F
++GLIBC_2.26 sem_init F
++GLIBC_2.26 sem_open F
++GLIBC_2.26 sem_post F
++GLIBC_2.26 sem_timedwait F
++GLIBC_2.26 sem_trywait F
++GLIBC_2.26 sem_unlink F
++GLIBC_2.26 sem_wait F
++GLIBC_2.26 send F
++GLIBC_2.26 sendmsg F
++GLIBC_2.26 sendto F
++GLIBC_2.26 sigaction F
++GLIBC_2.26 sigwait F
++GLIBC_2.26 tcdrain F
++GLIBC_2.26 wait F
++GLIBC_2.26 waitpid F
++GLIBC_2.26 write F
+diff --git a/sysdeps/unix/sysv/linux/arc/libresolv.abilist b/sysdeps/unix/sysv/linux/arc/libresolv.abilist
+new file mode 100644
+index 0000000..06e5025
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/libresolv.abilist
+@@ -0,0 +1,82 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 __b64_ntop F
++GLIBC_2.26 __b64_pton F
++GLIBC_2.26 __dn_comp F
++GLIBC_2.26 __dn_count_labels F
++GLIBC_2.26 __dn_expand F
++GLIBC_2.26 __dn_skipname F
++GLIBC_2.26 __fp_nquery F
++GLIBC_2.26 __fp_query F
++GLIBC_2.26 __fp_resstat F
++GLIBC_2.26 __hostalias F
++GLIBC_2.26 __loc_aton F
++GLIBC_2.26 __loc_ntoa F
++GLIBC_2.26 __p_cdname F
++GLIBC_2.26 __p_cdnname F
++GLIBC_2.26 __p_class F
++GLIBC_2.26 __p_class_syms D 0x54
++GLIBC_2.26 __p_fqname F
++GLIBC_2.26 __p_fqnname F
++GLIBC_2.26 __p_option F
++GLIBC_2.26 __p_query F
++GLIBC_2.26 __p_rcode F
++GLIBC_2.26 __p_secstodate F
++GLIBC_2.26 __p_time F
++GLIBC_2.26 __p_type F
++GLIBC_2.26 __p_type_syms D 0x228
++GLIBC_2.26 __putlong F
++GLIBC_2.26 __putshort F
++GLIBC_2.26 __res_close F
++GLIBC_2.26 __res_dnok F
++GLIBC_2.26 __res_hnok F
++GLIBC_2.26 __res_hostalias F
++GLIBC_2.26 __res_isourserver F
++GLIBC_2.26 __res_mailok F
++GLIBC_2.26 __res_mkquery F
++GLIBC_2.26 __res_nameinquery F
++GLIBC_2.26 __res_nmkquery F
++GLIBC_2.26 __res_nquery F
++GLIBC_2.26 __res_nquerydomain F
++GLIBC_2.26 __res_nsearch F
++GLIBC_2.26 __res_nsend F
++GLIBC_2.26 __res_ownok F
++GLIBC_2.26 __res_queriesmatch F
++GLIBC_2.26 __res_query F
++GLIBC_2.26 __res_querydomain F
++GLIBC_2.26 __res_search F
++GLIBC_2.26 __res_send F
++GLIBC_2.26 __sym_ntop F
++GLIBC_2.26 __sym_ntos F
++GLIBC_2.26 __sym_ston F
++GLIBC_2.26 _getlong F
++GLIBC_2.26 _getshort F
++GLIBC_2.26 _res_opcodes D 0x40
++GLIBC_2.26 inet_net_ntop F
++GLIBC_2.26 inet_net_pton F
++GLIBC_2.26 inet_neta F
++GLIBC_2.26 ns_datetosecs F
++GLIBC_2.26 ns_format_ttl F
++GLIBC_2.26 ns_get16 F
++GLIBC_2.26 ns_get32 F
++GLIBC_2.26 ns_initparse F
++GLIBC_2.26 ns_makecanon F
++GLIBC_2.26 ns_msg_getflag F
++GLIBC_2.26 ns_name_compress F
++GLIBC_2.26 ns_name_ntol F
++GLIBC_2.26 ns_name_ntop F
++GLIBC_2.26 ns_name_pack F
++GLIBC_2.26 ns_name_pton F
++GLIBC_2.26 ns_name_rollback F
++GLIBC_2.26 ns_name_skip F
++GLIBC_2.26 ns_name_uncompress F
++GLIBC_2.26 ns_name_unpack F
++GLIBC_2.26 ns_parse_ttl F
++GLIBC_2.26 ns_parserr F
++GLIBC_2.26 ns_put16 F
++GLIBC_2.26 ns_put32 F
++GLIBC_2.26 ns_samedomain F
++GLIBC_2.26 ns_samename F
++GLIBC_2.26 ns_skiprr F
++GLIBC_2.26 ns_sprintrr F
++GLIBC_2.26 ns_sprintrrf F
++GLIBC_2.26 ns_subdomain F
+diff --git a/sysdeps/unix/sysv/linux/arc/librt.abilist b/sysdeps/unix/sysv/linux/arc/librt.abilist
+new file mode 100644
+index 0000000..749d1f7
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/librt.abilist
+@@ -0,0 +1,36 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 __mq_open_2 F
++GLIBC_2.26 aio_cancel F
++GLIBC_2.26 aio_cancel64 F
++GLIBC_2.26 aio_error F
++GLIBC_2.26 aio_error64 F
++GLIBC_2.26 aio_fsync F
++GLIBC_2.26 aio_fsync64 F
++GLIBC_2.26 aio_init F
++GLIBC_2.26 aio_read F
++GLIBC_2.26 aio_read64 F
++GLIBC_2.26 aio_return F
++GLIBC_2.26 aio_return64 F
++GLIBC_2.26 aio_suspend F
++GLIBC_2.26 aio_suspend64 F
++GLIBC_2.26 aio_write F
++GLIBC_2.26 aio_write64 F
++GLIBC_2.26 lio_listio F
++GLIBC_2.26 lio_listio64 F
++GLIBC_2.26 mq_close F
++GLIBC_2.26 mq_getattr F
++GLIBC_2.26 mq_notify F
++GLIBC_2.26 mq_open F
++GLIBC_2.26 mq_receive F
++GLIBC_2.26 mq_send F
++GLIBC_2.26 mq_setattr F
++GLIBC_2.26 mq_timedreceive F
++GLIBC_2.26 mq_timedsend F
++GLIBC_2.26 mq_unlink F
++GLIBC_2.26 shm_open F
++GLIBC_2.26 shm_unlink F
++GLIBC_2.26 timer_create F
++GLIBC_2.26 timer_delete F
++GLIBC_2.26 timer_getoverrun F
++GLIBC_2.26 timer_gettime F
++GLIBC_2.26 timer_settime F
+diff --git a/sysdeps/unix/sysv/linux/arc/libthread_db.abilist b/sysdeps/unix/sysv/linux/arc/libthread_db.abilist
+new file mode 100644
+index 0000000..21c4b72
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/libthread_db.abilist
+@@ -0,0 +1,41 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 td_init F
++GLIBC_2.26 td_log F
++GLIBC_2.26 td_symbol_list F
++GLIBC_2.26 td_ta_clear_event F
++GLIBC_2.26 td_ta_delete F
++GLIBC_2.26 td_ta_enable_stats F
++GLIBC_2.26 td_ta_event_addr F
++GLIBC_2.26 td_ta_event_getmsg F
++GLIBC_2.26 td_ta_get_nthreads F
++GLIBC_2.26 td_ta_get_ph F
++GLIBC_2.26 td_ta_get_stats F
++GLIBC_2.26 td_ta_map_id2thr F
++GLIBC_2.26 td_ta_map_lwp2thr F
++GLIBC_2.26 td_ta_new F
++GLIBC_2.26 td_ta_reset_stats F
++GLIBC_2.26 td_ta_set_event F
++GLIBC_2.26 td_ta_setconcurrency F
++GLIBC_2.26 td_ta_thr_iter F
++GLIBC_2.26 td_ta_tsd_iter F
++GLIBC_2.26 td_thr_clear_event F
++GLIBC_2.26 td_thr_dbresume F
++GLIBC_2.26 td_thr_dbsuspend F
++GLIBC_2.26 td_thr_event_enable F
++GLIBC_2.26 td_thr_event_getmsg F
++GLIBC_2.26 td_thr_get_info F
++GLIBC_2.26 td_thr_getfpregs F
++GLIBC_2.26 td_thr_getgregs F
++GLIBC_2.26 td_thr_getxregs F
++GLIBC_2.26 td_thr_getxregsize F
++GLIBC_2.26 td_thr_set_event F
++GLIBC_2.26 td_thr_setfpregs F
++GLIBC_2.26 td_thr_setgregs F
++GLIBC_2.26 td_thr_setprio F
++GLIBC_2.26 td_thr_setsigpending F
++GLIBC_2.26 td_thr_setxregs F
++GLIBC_2.26 td_thr_sigsetmask F
++GLIBC_2.26 td_thr_tls_get_addr F
++GLIBC_2.26 td_thr_tlsbase F
++GLIBC_2.26 td_thr_tsd F
++GLIBC_2.26 td_thr_validate F
+diff --git a/sysdeps/unix/sysv/linux/arc/libutil.abilist b/sysdeps/unix/sysv/linux/arc/libutil.abilist
+new file mode 100644
+index 0000000..6e5e1c6
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/libutil.abilist
+@@ -0,0 +1,7 @@
++GLIBC_2.26 GLIBC_2.26 A
++GLIBC_2.26 forkpty F
++GLIBC_2.26 login F
++GLIBC_2.26 login_tty F
++GLIBC_2.26 logout F
++GLIBC_2.26 logwtmp F
++GLIBC_2.26 openpty F
+diff --git a/sysdeps/unix/sysv/linux/arc/localplt.data b/sysdeps/unix/sysv/linux/arc/localplt.data
+new file mode 100644
+index 0000000..ee2b948
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/localplt.data
+@@ -0,0 +1,35 @@
++libc.so: realloc
++libc.so: __eqsf2
++libc.so: __floatsisf
++libc.so: __ltdf2
++libc.so: __gedf2
++libc.so: malloc
++libc.so: __nesf2
++libc.so: memalign
++libc.so: __mulsf3
++libc.so: __floatunsisf
++libc.so: __addsf3
++libc.so: __fixsfsi
++libc.so: __subsf3
++libc.so: calloc
++libc.so: __muldf3
++libc.so: __signbit
++libc.so: free
++libc.so: __subdf3
++libc.so: __adddf3
++libc.so: __divdf3
++libc.so: __floatsidf
++libc.so: __divsf3
++libc.so: __nedf2
++libc.so: __eqdf2
++libm.so: __signbitf
++libm.so: __signbit
++libm.so: matherr
++# The dynamic loader uses __libc_memalign internally to allocate aligned
++# TLS storage. The other malloc family of functions are expected to allow
++# user symbol interposition.
++ld.so: __libc_memalign
++ld.so: malloc
++ld.so: calloc
++ld.so: realloc
++ld.so: free
+diff --git a/sysdeps/unix/sysv/linux/arc/mmap_internal.h b/sysdeps/unix/sysv/linux/arc/mmap_internal.h
+new file mode 100644
+index 0000000..e9b8a43
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/mmap_internal.h
+@@ -0,0 +1,26 @@
++/* mmap - map files or devices into memory.  Linux/ARC version.
++   Copyright (C) 2017 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef MMAP_ARC_INTERNAL_H
++#define MMAP_ARC_INTERNAL_H
++
++#define MMAP2_PAGE_UNIT 8192ULL	/* 8K page is default for ARC */
++
++#include_next <mmap_internal.h>
++
++#endif
+diff --git a/sysdeps/unix/sysv/linux/arc/profil-counter.h b/sysdeps/unix/sysv/linux/arc/profil-counter.h
+new file mode 100644
+index 0000000..8a6a0bc
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/profil-counter.h
+@@ -0,0 +1,2 @@
++/* We can use the ix86 version.  */
++#include <sysdeps/unix/sysv/linux/i386/profil-counter.h>
+diff --git a/sysdeps/unix/sysv/linux/arc/pt-vfork.S b/sysdeps/unix/sysv/linux/arc/pt-vfork.S
+new file mode 100644
+index 0000000..65cc382
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/pt-vfork.S
+@@ -0,0 +1 @@
++#include <sysdeps/unix/sysv/linux/alpha/pt-vfork.S>
+diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions b/sysdeps/unix/sysv/linux/arc/shlib-versions
+new file mode 100644
+index 0000000..a85ca37
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
+@@ -0,0 +1,2 @@
++DEFAULT                 GLIBC_2.26
++ld=ld-linux-arc.so.2
+diff --git a/sysdeps/unix/sysv/linux/arc/sigaction.c b/sysdeps/unix/sysv/linux/arc/sigaction.c
+new file mode 100644
+index 0000000..083179d
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/sigaction.c
+@@ -0,0 +1,65 @@
++/* ARC specific sigaction and signal restorer
++   Copyright (C) 1997-2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sysdep.h>
++#include <errno.h>
++#include <signal.h>
++#include <string.h>
++#include <sys/syscall.h>
++
++/*
++ * Default sigretrun stub if user doesn't specify SA_RESTORER
++ */
++static void __default_rt_sa_restorer(void)
++{
++	INTERNAL_SYSCALL_NCS(__NR_rt_sigreturn, , 0);
++}
++
++#define SA_RESTORER	0x04000000
++
++/* If @act is not NULL, change the action for @sig to @act.
++   If @oact is not NULL, put the old action for @sig in @oact.  */
++int
++__libc_sigaction (int sig, const struct sigaction *act, struct sigaction *oact)
++{
++	struct sigaction kact;
++	const struct sigaction *arg;
++
++	/*
++	 * SA_RESTORER is only relevant for act != NULL case
++	 * (!act means caller only wants to know @oact)
++	 */
++	if (act && !(act->sa_flags & SA_RESTORER)) {
++		kact.sa_restorer = __default_rt_sa_restorer;
++		kact.sa_flags = act->sa_flags | SA_RESTORER;
++
++		kact.sa_handler = act->sa_handler;
++		kact.sa_mask = act->sa_mask;
++
++		arg = &kact;
++	} else {
++		arg = act;
++	}
++
++	return INLINE_SYSCALL(rt_sigaction, 4,
++			sig, arg, oact, _NSIG / 8);
++}
++
++libc_hidden_def (__libc_sigaction)
++
++#include <nptl/sigaction.c>
+diff --git a/sysdeps/unix/sysv/linux/arc/sigcontextinfo.h b/sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
+new file mode 100644
+index 0000000..2ede6cf
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
+@@ -0,0 +1,28 @@
++/* ARC definitions for signal handling calling conventions.
++   Copyright (C) 2017 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sys/ucontext.h>
++#include "kernel-features.h"
++
++#define SIGCONTEXT int _code, struct ucontext_t *
++#define SIGCONTEXT_EXTRA_ARGS _code,
++#define GET_PC(ctx)    ((void *) (ctx)->uc_mcontext.scratch.ret)
++#define GET_FRAME(ctx) ((void *) (ctx)->uc_mcontext.scratch.fp)
++#define GET_STACK(ctx) ((void *) (ctx)->uc_mcontext.scratch.sp)
++#define CALL_SIGHANDLER(handler, signo, ctx) \
++  (handler)((signo), SIGCONTEXT_EXTRA_ARGS (ctx))
+diff --git a/sysdeps/unix/sysv/linux/arc/sys/cachectl.h b/sysdeps/unix/sysv/linux/arc/sys/cachectl.h
+new file mode 100644
+index 0000000..e5c6274
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/sys/cachectl.h
+@@ -0,0 +1,36 @@
++/* cacheflush - flush contents of instruction and/or data cache.
++   Copyright (C) 2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _SYS_CACHECTL_H
++#define _SYS_CACHECTL_H 1
++
++#include <features.h>
++
++/* Get the kernel definition for the op bits.  */
++#include <asm/cachectl.h>
++
++__BEGIN_DECLS
++
++#ifdef __USE_MISC
++extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
++#endif
++extern int _flush_cache (char *__addr, const int __nbytes, const int __op) __THROW;
++
++__END_DECLS
++
++#endif /* sys/cachectl.h */
+diff --git a/sysdeps/unix/sysv/linux/arc/sys/procfs.h b/sysdeps/unix/sysv/linux/arc/sys/procfs.h
+new file mode 100644
+index 0000000..ac174a2
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/sys/procfs.h
+@@ -0,0 +1,123 @@
++/* Core image file related definitions, ARC version.
++   Copyright (C) 1996-2017 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _SYS_PROCFS_H
++#define _SYS_PROCFS_H	1
++
++/* This is somewhat modelled after the file of the same name on SVR4
++   systems.  It provides a definition of the core file format for ELF
++   used on Linux.  It doesn't have anything to do with the /proc file
++   system, even though Linux has one.
++
++   Anyway, the whole purpose of this file is for GDB and GDB only.
++   Don't read too much into it.  Don't use it for anything other than
++   GDB unless you know what you are doing.  */
++
++#include <features.h>
++#include <sys/time.h>
++#include <sys/types.h>
++#include <sys/user.h>
++
++__BEGIN_DECLS
++
++/* Type for a general-purpose register.  */
++typedef unsigned long elf_greg_t;
++
++/* And the whole bunch of them.  We could have used `struct
++   user_regs' directly in the typedef, but tradition says that
++   the register set is an array, which does have some peculiar
++   semantics, so leave it that way.  */
++#define ELF_NGREG (sizeof (struct user_regs_struct) / sizeof(elf_greg_t))
++typedef elf_greg_t elf_gregset_t[ELF_NGREG];
++
++/* Register set for the floating-point registers.  */
++typedef struct { } elf_fpregset_t;
++
++/* Signal info.  */
++struct elf_siginfo
++  {
++    int si_signo;			/* Signal number.  */
++    int si_code;			/* Extra code.  */
++    int si_errno;			/* Errno.  */
++  };
++
++/* Definitions to generate Intel SVR4-like core files.  These mostly
++   have the same names as the SVR4 types with "elf_" tacked on the
++   front to prevent clashes with Linux definitions, and the typedef
++   forms have been avoided.  This is mostly like the SVR4 structure,
++   but more Linuxy, with things that Linux does not support and which
++   GDB doesn't really use excluded.  */
++
++struct elf_prstatus
++  {
++    struct elf_siginfo pr_info;		/* Info associated with signal.  */
++    short int pr_cursig;		/* Current signal.  */
++    unsigned long int pr_sigpend;	/* Set of pending signals.  */
++    unsigned long int pr_sighold;	/* Set of held signals.  */
++    __pid_t pr_pid;
++    __pid_t pr_ppid;
++    __pid_t pr_pgrp;
++    __pid_t pr_sid;
++    struct timeval pr_utime;		/* User time.  */
++    struct timeval pr_stime;		/* System time.  */
++    struct timeval pr_cutime;		/* Cumulative user time.  */
++    struct timeval pr_cstime;		/* Cumulative system time.  */
++    elf_gregset_t pr_reg;		/* GP registers.  */
++    int pr_fpvalid;			/* True if math copro being used.  */
++  };
++
++
++#define ELF_PRARGSZ     (80)    /* Number of chars for args.  */
++
++struct elf_prpsinfo
++  {
++    char pr_state;			/* Numeric process state.  */
++    char pr_sname;			/* Char for pr_state.  */
++    char pr_zomb;			/* Zombie.  */
++    char pr_nice;			/* Nice val.  */
++    unsigned long int pr_flag;		/* Flags.  */
++    unsigned short int pr_uid;
++    unsigned short int pr_gid;
++    int pr_pid, pr_ppid, pr_pgrp, pr_sid;
++    /* Lots missing */
++    char pr_fname[16];			/* Filename of executable.  */
++    char pr_psargs[ELF_PRARGSZ];	/* Initial part of arg list.  */
++  };
++
++/* The rest of this file provides the types for emulation of the
++   Solaris <proc_service.h> interfaces that should be implemented by
++   users of libthread_db.  */
++
++/* Addresses.  */
++typedef void *psaddr_t;
++
++/* Register sets.  Linux has different names.  */
++typedef elf_gregset_t prgregset_t;
++typedef elf_fpregset_t prfpregset_t;
++
++/* We don't have any differences between processes and threads,
++   therefore have only one PID type.  */
++typedef __pid_t lwpid_t;
++
++/* Process status and info.  In the end we do provide typedefs for them.  */
++typedef struct elf_prstatus prstatus_t;
++typedef struct elf_prpsinfo prpsinfo_t;
++
++__END_DECLS
++
++#endif	/* sys/procfs.h */
+diff --git a/sysdeps/unix/sysv/linux/aarch64/sys/ucontext.h b/sysdeps/unix/sysv/linux/arc/sys/ucontext.h
+similarity index 61%
+copy from sysdeps/unix/sysv/linux/aarch64/sys/ucontext.h
+copy to sysdeps/unix/sysv/linux/arc/sys/ucontext.h
+index 4f602fc..ea847eb 100644
+--- a/sysdeps/unix/sysv/linux/aarch64/sys/ucontext.h
++++ b/sysdeps/unix/sysv/linux/arc/sys/ucontext.h
+@@ -1,5 +1,5 @@
+-/* Copyright (C) 1998-2017 Free Software Foundation, Inc.
+-
++/* struct ucontext definition, ARC version.
++   Copyright (C) 2017 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -16,7 +16,7 @@
+    License along with the GNU C Library; if not, see
+    <http://www.gnu.org/licenses/>.  */
+ 
+-/* System V/AArch64 ABI compliant context switching support.  */
++/* System V/ARC ABI compliant context switching support.  */
+ 
+ #ifndef _SYS_UCONTEXT_H
+ #define _SYS_UCONTEXT_H	1
+@@ -24,27 +24,26 @@
+ #include <features.h>
+ 
+ #include <bits/types/sigset_t.h>
+-#include <bits/sigcontext.h>
+ #include <bits/types/stack_t.h>
+ 
+-#ifdef __USE_MISC
+-# include <sys/procfs.h>
+-
+-
+-typedef elf_greg_t greg_t;
+-
+-/* Container for all general registers.  */
+-typedef elf_gregset_t gregset_t;
+-
+-/* Structure to describe FPU registers.  */
+-typedef elf_fpregset_t	fpregset_t;
+-#endif
+-
+-/* Context to describe whole processor state.  This only describes
+-   the core registers; coprocessor registers get saved elsewhere
+-   (e.g. in uc_regspace, or somewhere unspecified on the stack
+-   during non-RT signal handlers).  */
+-typedef struct sigcontext mcontext_t;
++typedef struct
++  {
++    unsigned long pad;
++    struct {
++      unsigned long bta, lp_start, lp_end, lp_count;
++      unsigned long status32, ret, blink, fp, gp;
++      unsigned long r12, r11, r10, r9, r8, r7, r6, r5, r4, r3, r2, r1, r0;
++      unsigned long sp;
++    } scratch;
++    unsigned long pad2;
++    struct {
++      unsigned long r25, r24, r23, r22, r21, r20;
++      unsigned long r19, r18, r17, r16, r15, r14, r13;
++    } callee;
++    unsigned long efa;
++    unsigned long stop_pc;
++    unsigned long r30, r58, r59;
++  } mcontext_t;
+ 
+ /* Userlevel context.  */
+ typedef struct ucontext_t
+@@ -52,8 +51,8 @@ typedef struct ucontext_t
+     unsigned long uc_flags;
+     struct ucontext_t *uc_link;
+     stack_t uc_stack;
+-    sigset_t uc_sigmask;
+     mcontext_t uc_mcontext;
++    sigset_t uc_sigmask;
+   } ucontext_t;
+ 
+ #endif /* sys/ucontext.h */
+diff --git a/sysdeps/unix/sysv/linux/arc/sys/user.h b/sysdeps/unix/sysv/linux/arc/sys/user.h
+new file mode 100644
+index 0000000..2e00512
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/sys/user.h
+@@ -0,0 +1,32 @@
++/* ptrace register data format definitions.
++   Copyright (C) 1998-2017 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _SYS_USER_H
++#define _SYS_USER_H	1
++
++/* struct user_regs_struct is exported by kernel header
++ * However apps like strace also expect a struct user, so it's better to
++ * have a dummy implementation
++ */
++#include <asm/ptrace.h>
++
++struct user {
++	int dummy;
++};
++
++#endif  /* sys/user.h */
+diff --git a/sysdeps/unix/sysv/linux/arc/syscall.S b/sysdeps/unix/sysv/linux/arc/syscall.S
+new file mode 100644
+index 0000000..f3045b1
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/syscall.S
+@@ -0,0 +1,33 @@
++/* syscall - indirect system call.
++   Copyright (C) 2017 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sysdep.h>
++
++ENTRY (syscall)
++	mov_s	r8, r0
++	mov_s	r0, r1
++	mov_s	r1, r2
++	mov_s	r2, r3
++	mov_s	r3, r4
++	mov_s	r4, r5
++	mov_s	r5, r6
++
++	ARC_TRAP_INSN
++        brhi    r0, -1024, 0f
++	j	[blink]
++PSEUDO_END (syscall)
+diff --git a/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h b/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
+new file mode 100644
+index 0000000..8fb294a
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
+@@ -0,0 +1,140 @@
++/* Assembler macros with cancellation support, ARC version.
++   Copyright (C) 2003-2017 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sysdep.h>
++#include <tls.h>
++#ifndef __ASSEMBLER__
++# include <nptl/pthreadP.h>
++#endif
++
++#if IS_IN (libc)
++#define BR_ERRNO_SETTER	        b PLTJMP(HIDDEN_JUMPTARGET(__syscall_error))
++#else
++#define BR_ERRNO_SETTER	        b PLTJMP(__syscall_error)
++#endif
++
++#if IS_IN (libc) || IS_IN (libpthread) || IS_IN (librt)
++
++#ifdef __ASSEMBLER__
++
++# undef PSEUDO
++# define PSEUDO(name, syscall_name, nargs)				\
++   /* vanilla version */				ASM_LINE_SEP	\
++   ENTRY(name##_nocancel)				ASM_LINE_SEP	\
++      DO_CALL (__NR_##syscall_name)			ASM_LINE_SEP	\
++      jls  [blink]					ASM_LINE_SEP	\
++      BR_ERRNO_SETTER					ASM_LINE_SEP	\
++   END(name##_nocancel)					ASM_LINE_SEP	\
++   /* thread cancellation variant */			ASM_LINE_SEP	\
++   ENTRY(name)			    			ASM_LINE_SEP	\
++      SINGLE_THREAD_P					ASM_LINE_SEP	\
++      bz name##_nocancel				ASM_LINE_SEP	\
++      DOCARGS_##nargs  /* stash syscall args */		ASM_LINE_SEP	\
++      CENABLE          /* call enable_asynccancel */	ASM_LINE_SEP	\
++      mov r9, r0       /* Safe-keep mask */ 		ASM_LINE_SEP	\
++      UNDOCARGS_##nargs	/* restore syscall args */	ASM_LINE_SEP	\
++      DO_CALL (__NR_##syscall_name)			ASM_LINE_SEP	\
++      PUSH  r0         /* save syscall return value */	ASM_LINE_SEP	\
++      mov   r0, r9  /* mask for disable_asynccancel */  ASM_LINE_SEP	\
++      CDISABLE						ASM_LINE_SEP	\
++      POP  r0       /* get syscall ret value back */	ASM_LINE_SEP	\
++      POP  blink    /* UNDOCARGS left blink on stack */	ASM_LINE_SEP	\
++      cmp  r0, -1024					ASM_LINE_SEP	\
++      jls  [blink]					ASM_LINE_SEP	\
++      BR_ERRNO_SETTER					ASM_LINE_SEP	\
++   END(name)
++
++#undef	PSEUDO_END
++#define	PSEUDO_END(name)	\
++
++# if IS_IN (libpthread)
++#  define CENABLE	bl PLTJMP(__pthread_enable_asynccancel)
++#  define CDISABLE	bl PLTJMP(__pthread_disable_asynccancel)
++# elif IS_IN (libc)
++#  define CENABLE	bl PLTJMP(__libc_enable_asynccancel)
++#  define CDISABLE	bl PLTJMP(__libc_disable_asynccancel)
++# elif IS_IN (librt)
++#  define CENABLE	bl PLTJMP(__librt_enable_asynccancel)
++#  define CDISABLE	bl PLTJMP(__librt_disable_asynccancel)
++# else
++#  error Unsupported library
++# endif
++
++#undef DO_CALL
++#define DO_CALL(num)				\
++	mov r8, num		ASM_LINE_SEP	\
++	ARC_TRAP_INSN		ASM_LINE_SEP	\
++	cmp r0, -1024
++
++.macro PUSH reg
++	st.a \reg, [sp, -4]
++.endm
++
++.macro POP reg
++	ld.ab \reg, [sp, 4]
++.endm
++
++#define DOCARGS_0	PUSH blink
++/* don't pop blink at this point */
++#define UNDOCARGS_0	ld   blink, [sp]
++
++#define DOCARGS_1	DOCARGS_0  ASM_LINE_SEP	PUSH r0
++#define UNDOCARGS_1	POP  r0    ASM_LINE_SEP	UNDOCARGS_0
++
++#define DOCARGS_2	DOCARGS_1  ASM_LINE_SEP	PUSH r1
++#define UNDOCARGS_2	POP  r1    ASM_LINE_SEP	UNDOCARGS_1
++
++#define DOCARGS_3	DOCARGS_2  ASM_LINE_SEP	PUSH r2
++#define UNDOCARGS_3	POP  r2    ASM_LINE_SEP	UNDOCARGS_2
++
++#define DOCARGS_4	DOCARGS_3  ASM_LINE_SEP	PUSH r3
++#define UNDOCARGS_4	POP  r3    ASM_LINE_SEP	UNDOCARGS_3
++
++#define DOCARGS_5	DOCARGS_4  ASM_LINE_SEP	PUSH r4
++#define UNDOCARGS_5	POP  r4    ASM_LINE_SEP	UNDOCARGS_4
++
++#define DOCARGS_6	DOCARGS_5  ASM_LINE_SEP	PUSH r5
++#define UNDOCARGS_6	POP  r5    ASM_LINE_SEP	UNDOCARGS_5
++
++#define DOCARGS_7	DOCARGS_6  ASM_LINE_SEP	PUSH r6
++#define UNDOCARGS_7	POP  r6    ASM_LINE_SEP	UNDOCARGS_6
++
++#  define SINGLE_THREAD_P 					\
++    THREAD_SELF r9     				ASM_LINE_SEP	\
++    ld	   r10, [r9, MULTIPLE_THREADS_OFFSET]	ASM_LINE_SEP	\
++    cmp    r10, 0
++
++#else /* !__ASSEMBLER__ */
++
++/* TBD: Can use @__local_multiple_threads for libc/libpthread like ARM */
++#   define SINGLE_THREAD_P	\
++    __glibc_likely(THREAD_GETMEM (THREAD_SELF, header.multiple_threads) == 0)
++
++#endif	/* !__ASSEMBLER__ */
++
++#elif !defined __ASSEMBLER__
++
++# define SINGLE_THREAD_P 1
++# define NO_CANCELLATION 1
++
++#endif
++
++#ifndef __ASSEMBLER__
++# define RTLD_SINGLE_THREAD_P \
++  __glibc_likely (THREAD_GETMEM (THREAD_SELF, header.multiple_threads) == 0)
++#endif
+diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.c b/sysdeps/unix/sysv/linux/arc/sysdep.c
+new file mode 100644
+index 0000000..c5462c1
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/sysdep.c
+@@ -0,0 +1,33 @@
++/* ARC wrapper for setting errno
++   Copyright (C) 1997-2017 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sysdep.h>
++#include <errno.h>
++
++/* All syscall handler come here to avoid generated code bloat due to
++ * GOT reference  to errno_location or it's equivalent
++ */
++int __syscall_error(int err_no)
++{
++	__set_errno(-err_no);
++	return -1;
++}
++
++#if IS_IN (libc)
++hidden_def (__syscall_error)
++#endif
+diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h
+new file mode 100644
+index 0000000..8eeab3c
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/sysdep.h
+@@ -0,0 +1,253 @@
++/* Assembler macros for ARC.
++   Copyright (C) 2000-2017 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef _LINUX_ARC_SYSDEP_H
++#define _LINUX_ARC_SYSDEP_H 1
++
++#include <asm/unistd.h>
++#include <sysdeps/arc/sysdep.h>
++#include <sysdeps/unix/sysv/linux/generic/sysdep.h>
++
++/* For RTLD_PRIVATE_ERRNO.  */
++#include <dl-sysdep.h>
++
++#include <tls.h>
++
++#undef SYS_ify
++#define SYS_ify(syscall_name)   __NR_##syscall_name
++
++#ifdef __ASSEMBLER__
++
++/* This is a "normal" system call stub: if there is an error,
++   it returns -1 and sets errno.  */
++
++# undef PSEUDO
++# define PSEUDO(name, syscall_name, args)			\
++  PSEUDO_NOERRNO(name, syscall_name, args)	ASM_LINE_SEP	\
++    brhi   r0, -1024, 0f			ASM_LINE_SEP
++
++#define ret	j  [blink]
++
++# undef PSEUDO_END
++# define PSEUDO_END(name)					\
++  SYSCALL_ERROR_HANDLER				ASM_LINE_SEP	\
++  END (name)
++
++/* --------- helper for SYSCALL_NOERRNO ----------- */
++
++/* This kind of system call stub never returns an error.
++   We return the return value register to the caller unexamined.  */
++
++# undef PSEUDO_NOERRNO
++# define PSEUDO_NOERRNO(name, syscall_name, args)		\
++  .text						ASM_LINE_SEP	\
++  ENTRY (name)					ASM_LINE_SEP	\
++    DO_CALL (syscall_name, args)		ASM_LINE_SEP	\
++
++/* return the return value register unexamined
++ * r0 is both syscall return reg and function return reg, so no need to do
++ * anything
++ */
++# define ret_NOERRNO						\
++  j_s  [blink]		ASM_LINE_SEP
++
++# undef PSEUDO_END_NOERRNO
++# define PSEUDO_END_NOERRNO(name)				\
++  END (name)
++
++/* --------- helper for SYSCALL_ERRVAL ----------- */
++
++/* This kind of system call stub returns the errno code as its return
++   value, or zero for success.  We may massage the kernel's return value
++   to meet that ABI, but we never set errno here.  */
++
++# undef PSEUDO_ERRVAL
++# define PSEUDO_ERRVAL(name, syscall_name, args)		\
++  PSEUDO_NOERRNO(name, syscall_name, args)	ASM_LINE_SEP
++
++/* don't set errno, return kernel error (in errno form) or zero */
++# define ret_ERRVAL						\
++  rsub   r0, r0, 0				ASM_LINE_SEP	\
++  ret_NOERRNO
++
++# undef PSEUDO_END_ERRVAL
++# define PSEUDO_END_ERRVAL(name)				\
++  END (name)
++
++
++/* To reduce the code footprint, we confine the actual errno access
++ * to single place in __syscall_error()
++ * this takes raw kernel error value, sets errno and returns -1
++ */
++#if IS_IN (libc)
++#define CALL_ERRNO_SETTER_C	bl     PLTJMP(HIDDEN_JUMPTARGET(__syscall_error))
++#else
++#define CALL_ERRNO_SETTER_C	bl     PLTJMP(__syscall_error)
++#endif
++
++# define SYSCALL_ERROR_HANDLER					\
++0:						ASM_LINE_SEP	\
++    st.a   blink, [sp, -4]			ASM_LINE_SEP	\
++    CALL_ERRNO_SETTER_C				ASM_LINE_SEP	\
++    ld.ab  blink, [sp, 4]			ASM_LINE_SEP	\
++    j      [blink]
++
++# define DO_CALL(syscall_name, args)				\
++    mov    r8, SYS_ify (syscall_name)		ASM_LINE_SEP	\
++    ARC_TRAP_INSN				ASM_LINE_SEP
++
++#define ARC_TRAP_INSN	trap_s 0
++
++#else  /* !__ASSEMBLER__ */
++
++/* In order to get __set_errno() definition in INLINE_SYSCALL.  */
++#include <errno.h>
++
++extern int __syscall_error (int);
++
++#if IS_IN (libc)
++hidden_proto (__syscall_error)
++#define CALL_ERRNO_SETTER   "bl   __syscall_error    \n\t"
++#else
++#define CALL_ERRNO_SETTER   "bl   __syscall_error at plt    \n\t"
++#endif
++
++
++/* Define a macro which expands into the inline wrapper code for a system
++   call.  */
++#undef INLINE_SYSCALL
++#define INLINE_SYSCALL(name, nr_args, args...)				\
++({									\
++	register int __res __asm__("r0");				\
++	__res = INTERNAL_SYSCALL_NCS(__NR_##name, , nr_args, args);	\
++	if (__builtin_expect (INTERNAL_SYSCALL_ERROR_P ((__res), ), 0))	\
++	{								\
++		asm volatile ("st.a blink, [sp, -4] \n\t"         	\
++			       CALL_ERRNO_SETTER                   	\
++			      "ld.ab blink, [sp, 4] \n\t"         	\
++			      :"+r" (__res)                 		\
++			      :                                   	\
++			      :"r1","r2","r3","r4","r5","r6",		\
++			        "r7","r8","r9","r10","r11","r12");	\
++	}								\
++	__res;								\
++})
++
++#undef INTERNAL_SYSCALL_DECL
++#define INTERNAL_SYSCALL_DECL(err) do { } while (0)
++
++#undef INTERNAL_SYSCALL_ERRNO
++# define INTERNAL_SYSCALL_ERRNO(val, err)    (-(val))
++
++/* -1 to -1023 are valid errno values */
++#undef INTERNAL_SYSCALL_ERROR_P
++#define INTERNAL_SYSCALL_ERROR_P(val, err)	\
++	((unsigned int) (val) > -1024U)
++
++#define ARC_TRAP_INSN	"trap_s 0	\n\t"
++
++#undef INTERNAL_SYSCALL_RAW
++#define INTERNAL_SYSCALL_RAW(name, err, nr_args, args...)	\
++({							\
++	/* Per ABI, r0 is 1st arg and return reg */	\
++	register int __ret __asm__("r0");		\
++	register int _sys_num __asm__("r8");		\
++							\
++	LOAD_ARGS_##nr_args (name, args)		\
++							\
++        __asm__ volatile (				\
++		ARC_TRAP_INSN				\
++		: "+r" (__ret)				\
++		: "r"(_sys_num) ASM_ARGS_##nr_args	\
++		: "memory");				\
++                                                        \
++	__ret;						\
++})
++
++/* Macros for setting up inline __asm__ input regs */
++#define ASM_ARGS_0
++#define ASM_ARGS_1	ASM_ARGS_0, "r" (__ret)
++#define ASM_ARGS_2	ASM_ARGS_1, "r" (_arg2)
++#define ASM_ARGS_3	ASM_ARGS_2, "r" (_arg3)
++#define ASM_ARGS_4	ASM_ARGS_3, "r" (_arg4)
++#define ASM_ARGS_5	ASM_ARGS_4, "r" (_arg5)
++#define ASM_ARGS_6	ASM_ARGS_5, "r" (_arg6)
++#define ASM_ARGS_7	ASM_ARGS_6, "r" (_arg7)
++
++/* Macros for converting sys-call wrapper args into sys call args */
++#define LOAD_ARGS_0(nm, arg)					\
++	_sys_num = (int) (nm);
++
++#define LOAD_ARGS_1(nm, arg1) 					\
++	__ret = (int) (arg1);					\
++	LOAD_ARGS_0 (nm, arg1)
++
++/*
++ * Note that the use of _tmpX might look superflous, however it is needed
++ * to ensure that register variables are not clobbered if arg happens to be
++ * a function call itself. e.g. sched_setaffinity() calling getpid() for arg2
++ *
++ * Also this specific order of recursive calling is important to segregate
++ * the tmp args evaluation (function call case described above) and assigment
++ * of register variables
++ */
++#define LOAD_ARGS_2(nm, arg1, arg2)				\
++	int _tmp2 = (int) (arg2);				\
++	LOAD_ARGS_1 (nm, arg1)					\
++	register int _arg2 __asm__ ("r1") = _tmp2;
++
++#define LOAD_ARGS_3(nm, arg1, arg2, arg3)			\
++	int _tmp3 = (int) (arg3);				\
++	LOAD_ARGS_2 (nm, arg1, arg2)				\
++	register int _arg3 __asm__ ("r2") = _tmp3;
++
++#define LOAD_ARGS_4(nm, arg1, arg2, arg3, arg4)			\
++	int _tmp4 = (int) (arg4);				\
++	LOAD_ARGS_3 (nm, arg1, arg2, arg3)			\
++	register int _arg4 __asm__ ("r3") = _tmp4;
++
++#define LOAD_ARGS_5(nm, arg1, arg2, arg3, arg4, arg5)		\
++	int _tmp5 = (int) (arg5);				\
++	LOAD_ARGS_4 (nm, arg1, arg2, arg3, arg4)		\
++	register int _arg5 __asm__ ("r4") = _tmp5;
++
++#define LOAD_ARGS_6(nm,  arg1, arg2, arg3, arg4, arg5, arg6)	\
++	int _tmp6 = (int) (arg6);				\
++	LOAD_ARGS_5 (nm, arg1, arg2, arg3, arg4, arg5)		\
++	register int _arg6 __asm__ ("r5") = _tmp6;
++
++#define LOAD_ARGS_7(nm, arg1, arg2, arg3, arg4, arg5, arg6, arg7)\
++	int _tmp7 = (int) (arg7);				\
++	LOAD_ARGS_6 (nm, arg1, arg2, arg3, arg4, arg5, arg6)	\
++	register int _arg7 __asm__ ("r6") = _tmp7;
++
++#undef INTERNAL_SYSCALL
++#define INTERNAL_SYSCALL(name, err, nr, args...) \
++	INTERNAL_SYSCALL_RAW(SYS_ify(name), err, nr, args)
++
++#undef INTERNAL_SYSCALL_NCS
++#define INTERNAL_SYSCALL_NCS(number, err, nr, args...) \
++	INTERNAL_SYSCALL_RAW(number, err, nr, args)
++
++/* Pointer mangling not yet supported  */
++# define PTR_MANGLE(var) (void) (var)
++# define PTR_DEMANGLE(var) (void) (var)
++
++#endif /* !__ASSEMBLER__ */
++
++#endif /* linux/arc/sysdep.h */
+diff --git a/sysdeps/unix/sysv/linux/arc/ucontext_i.sym b/sysdeps/unix/sysv/linux/arc/ucontext_i.sym
+new file mode 100644
+index 0000000..5d0b6a1
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/ucontext_i.sym
+@@ -0,0 +1,17 @@
++#include <inttypes.h>
++#include <signal.h>
++#include <stddef.h>
++#include <sys/ucontext.h>
++
++SIG_BLOCK
++SIG_SETMASK
++
++-- Offsets of the fields in the ucontext_t structure.
++#define ucontext(member)	offsetof (ucontext_t, member)
++
++UCONTEXT_FLAGS			ucontext (uc_flags)
++UCONTEXT_LINK			ucontext (uc_link)
++UCONTEXT_STACK			ucontext (uc_stack)
++UCONTEXT_MCONTEXT		ucontext (uc_mcontext)
++UCONTEXT_SIGMASK		ucontext (uc_sigmask)
++UCONTEXT_SIZE			sizeof (ucontext_t)
+diff --git a/sysdeps/unix/sysv/linux/arc/vfork.S b/sysdeps/unix/sysv/linux/arc/vfork.S
+new file mode 100644
+index 0000000..7cb29f5
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/arc/vfork.S
+@@ -0,0 +1,42 @@
++/* vfork for ARC Linux.
++   Copyright (C) 2005-2015 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <sys/syscall.h>
++#include <sysdep.h>
++#include <tcb-offsets.h>
++#define _SIGNAL_H
++#include <bits/signum.h>       /* For SIGCHLD */
++
++#define CLONE_VM		0x00000100
++#define CLONE_VFORK		0x00004000
++#define CLONE_FLAGS_FOR_VFORK	(CLONE_VM|CLONE_VFORK|SIGCHLD)
++
++ENTRY(__vfork)
++	mov	r0, CLONE_FLAGS_FOR_VFORK
++	mov_s	r1, sp
++	mov	r8, __NR_clone
++	ARC_TRAP_INSN
++
++	cmp	r0, 0
++	jge	[blink]	; child continues
++
++	b   __syscall_error
++PSEUDO_END (__vfork)
++libc_hidden_def (__vfork)
++
++weak_alias (__vfork, vfork)
+-- 
+2.10.2
+
diff --git a/package/glibc/0004-ARC-Enable-__start-as-entry-point-vs.-canonical-_sta.patch b/package/glibc/0004-ARC-Enable-__start-as-entry-point-vs.-canonical-_sta.patch
new file mode 100644
index 0000000..5b152a2
--- /dev/null
+++ b/package/glibc/0004-ARC-Enable-__start-as-entry-point-vs.-canonical-_sta.patch
@@ -0,0 +1,110 @@
+From 4052ee3642ac533973191ff00748c52bc3b3251d Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <vgupta@synopsys.com>
+Date: Wed, 11 Jan 2017 16:47:27 -0800
+Subject: [PATCH 4/7] ARC: Enable __start as entry point vs. canonical _start
+
+ARC linker scripts have defined __start as entry point so to not break
+ABI for uClibc et al we allow __start for glibc as well
+
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ sysdeps/arc/dl-machine.h | 14 ++++++++++----
+ sysdeps/arc/entry.h      |  5 +++++
+ sysdeps/arc/start.S      | 14 +++++++++++---
+ 3 files changed, 26 insertions(+), 7 deletions(-)
+ create mode 100644 sysdeps/arc/entry.h
+
+diff --git a/sysdeps/arc/dl-machine.h b/sysdeps/arc/dl-machine.h
+index a9096b3..5b8cc3c 100644
+--- a/sysdeps/arc/dl-machine.h
++++ b/sysdeps/arc/dl-machine.h
+@@ -21,6 +21,12 @@
+ 
+ #define ELF_MACHINE_NAME "arc"
+ 
++#include <entry.h>
++
++#ifndef ENTRY_POINT
++#error ENTRY_POINT needs to be defined for ARC
++#endif
++
+ #include <string.h>
+ #include <link.h>
+ #include <dl-tls.h>
+@@ -149,9 +155,9 @@ elf_machine_runtime_setup (struct link_map *l, int lazy, int profile)
+ 
+ #define RTLD_START asm ("\
+ .text								\n\
+-.globl _start							\n\
+-.type _start, @function						\n\
+-_start:								\n\
++.globl __start							\n\
++.type __start, @function					\n\
++__start:							\n\
+ 	; (1). bootstrap ld.so					\n\
+ 	bl.d    _dl_start                                       \n\
+ 	mov_s   r0, sp          ; pass ptr to aux vector tbl    \n\
+@@ -181,7 +187,7 @@ _start:								\n\
+ 	add     r0, pcl, _dl_fini at pcl				\n\
+ 	j	[r13]						\n\
+ 								\n\
+-	.size  _start,.-_start                                  \n\
++	.size  __start,.-__start                                \n\
+ 	.previous                                               \n\
+ ");
+ 
+diff --git a/sysdeps/arc/entry.h b/sysdeps/arc/entry.h
+new file mode 100644
+index 0000000..adb01d9
+--- /dev/null
++++ b/sysdeps/arc/entry.h
+@@ -0,0 +1,5 @@
++#ifndef __ASSEMBLY__
++extern void __start (void) attribute_hidden;
++#endif
++
++#define ENTRY_POINT __start
+diff --git a/sysdeps/arc/start.S b/sysdeps/arc/start.S
+index 9a0f1ed..cfbfd9c 100644
+--- a/sysdeps/arc/start.S
++++ b/sysdeps/arc/start.S
+@@ -34,7 +34,14 @@
+    <http://www.gnu.org/licenses/>.  */
+ 
+ 
++#define __ASSEMBLY__ 1
++#include <entry.h>
++#ifndef ENTRY_POINT
++#error ENTRY_POINT needs to be defined for ARC
++#endif
++
+ /* When we enter this piece of code, the program stack looks like this:
++
+         argc            argument counter (integer)
+         argv[0]         program name (pointer)
+         argv[1...N]     program args (pointers)
+@@ -45,9 +52,9 @@
+ */
+ 	.text
+ 	.align 4
+-	.global _start
+-	.type _start, at function
+-_start:
++	.global __start
++	.type __start, at function
++__start:
+ 	mov	fp, 0
+ 	ld_s	r1, [sp]	; argc
+ 
+@@ -71,6 +78,7 @@ _start:
+ 
+ 	/* Should never get here....  */
+ 	flag    1
++	.size  __start,.-__start
+ 
+ /* Define a symbol for the first piece of initialized data.  */
+ 	.data
+-- 
+2.10.2
+
diff --git a/package/glibc/0005-ARC-Fix-several-testsuite-failures-related-to-unwind.patch b/package/glibc/0005-ARC-Fix-several-testsuite-failures-related-to-unwind.patch
new file mode 100644
index 0000000..f76c6e9
--- /dev/null
+++ b/package/glibc/0005-ARC-Fix-several-testsuite-failures-related-to-unwind.patch
@@ -0,0 +1,162 @@
+From db1d4d56c71181703917e8c22516ada9fbff5879 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Wed, 10 May 2017 14:40:02 +0200
+Subject: [PATCH 5/7] ARC: Fix several testsuite failures related to unwinding
+
+1. Add BLINK clobber to syscall wrappers allowing unwinding off of
+   sleeping syscalls
+   (this is arguably excessive, give it is not needed except for a
+   handful of slow syscalls such as read/write/nanosleep...)
+
+2. Rework sigreturn to undo above since we don't want BLINK spilled
+   on stack for this specific case
+
+3. Add dwarf CFI psuedo-ops to various syscall generators
+
+Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ sysdeps/arc/dl-trampoline.S                 |  9 +++++++++
+ sysdeps/arc/sysdep.h                        |  2 ++
+ sysdeps/unix/sysv/linux/arc/sigaction.c     |  7 ++++++-
+ sysdeps/unix/sysv/linux/arc/sysdep-cancel.h |  4 ++++
+ sysdeps/unix/sysv/linux/arc/sysdep.h        | 12 ++++++++----
+ 5 files changed, 29 insertions(+), 5 deletions(-)
+
+diff --git a/sysdeps/arc/dl-trampoline.S b/sysdeps/arc/dl-trampoline.S
+index cf1b52e..97f9e56 100644
+--- a/sysdeps/arc/dl-trampoline.S
++++ b/sysdeps/arc/dl-trampoline.S
+@@ -37,11 +37,16 @@
+ 	st.a	r7, [sp, -4]
+ 	st.a	r8, [sp, -4]
+ 	st.a	r9, [sp, -4]
++	cfi_adjust_cfa_offset (40)
+ 	push_s	blink
++	cfi_adjust_cfa_offset (4)
++	cfi_rel_offset (blink, 0)
+ .endm
+ 
+ .macro RESTORE_CALLER_SAVED_BUT_R0
+ 	ld.ab	blink,[sp, 4]
++	cfi_adjust_cfa_offset (-4)
++	cfi_restore (blink)
+ 	ld.ab	r9, [sp, 4]
+ 	ld.ab	r8, [sp, 4]
+ 	ld.ab	r7, [sp, 4]
+@@ -51,6 +56,7 @@
+ 	pop_s   r3
+ 	pop_s   r2
+ 	pop_s   r1
++	cfi_adjust_cfa_offset (-36)
+ .endm
+ 
+ ; Upon entry, PLTn, which led us here, sets up the following regs
+@@ -69,4 +75,7 @@ ENTRY(_dl_runtime_resolve)
+ 	RESTORE_CALLER_SAVED_BUT_R0
+ 	j_s.d   [r0]    ; r0 has resolved function addr
+ 	pop_s   r0      ; restore first arg to resolved call
++	cfi_adjust_cfa_offset (-4)
++	cfi_restore (r0)
++
+ END(_dl_runtime_resolve)
+diff --git a/sysdeps/arc/sysdep.h b/sysdeps/arc/sysdep.h
+index b9875dd..a75ff49 100644
+--- a/sysdeps/arc/sysdep.h
++++ b/sysdeps/arc/sysdep.h
+@@ -32,10 +32,12 @@
+     .globl C_SYMBOL_NAME(name)			ASM_LINE_SEP	\
+     .type C_SYMBOL_NAME(name),%function		ASM_LINE_SEP	\
+   C_LABEL(name)					ASM_LINE_SEP	\
++    cfi_startproc				ASM_LINE_SEP	\
+     CALL_MCOUNT
+ 
+ #undef  END
+ #define END(name)						\
++  cfi_endproc					ASM_LINE_SEP	\
+   ASM_SIZE_DIRECTIVE(name)
+ 
+ #ifdef SHARED
+diff --git a/sysdeps/unix/sysv/linux/arc/sigaction.c b/sysdeps/unix/sysv/linux/arc/sigaction.c
+index 083179d..1068c8e 100644
+--- a/sysdeps/unix/sysv/linux/arc/sigaction.c
++++ b/sysdeps/unix/sysv/linux/arc/sigaction.c
+@@ -27,7 +27,12 @@
+  */
+ static void __default_rt_sa_restorer(void)
+ {
+-	INTERNAL_SYSCALL_NCS(__NR_rt_sigreturn, , 0);
++	/* Don't use INTERNAL_SYSCALL_NCS as it causes blink to be spilled on stack */
++	asm volatile(
++		"mov r8, %0	\n\t"	\
++		ARC_TRAP_INSN		\
++	:
++	: "r"(__NR_rt_sigreturn));
+ }
+ 
+ #define SA_RESTORER	0x04000000
+diff --git a/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h b/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
+index 8fb294a..a047a71 100644
+--- a/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
++++ b/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
+@@ -83,10 +83,14 @@
+ 
+ .macro PUSH reg
+ 	st.a \reg, [sp, -4]
++	cfi_adjust_cfa_offset (4)
++	cfi_rel_offset (\reg, 0)
+ .endm
+ 
+ .macro POP reg
+ 	ld.ab \reg, [sp, 4]
++	cfi_adjust_cfa_offset (-4)
++	cfi_restore (\reg)
+ .endm
+ 
+ #define DOCARGS_0	PUSH blink
+diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h
+index 8eeab3c..db9baed 100644
+--- a/sysdeps/unix/sysv/linux/arc/sysdep.h
++++ b/sysdeps/unix/sysv/linux/arc/sysdep.h
+@@ -103,8 +103,12 @@
+ # define SYSCALL_ERROR_HANDLER					\
+ 0:						ASM_LINE_SEP	\
+     st.a   blink, [sp, -4]			ASM_LINE_SEP	\
++    cfi_adjust_cfa_offset (4)			ASM_LINE_SEP	\
++    cfi_rel_offset (blink, 0)			ASM_LINE_SEP	\
+     CALL_ERRNO_SETTER_C				ASM_LINE_SEP	\
+     ld.ab  blink, [sp, 4]			ASM_LINE_SEP	\
++    cfi_adjust_cfa_offset (-4)			ASM_LINE_SEP	\
++    cfi_restore (blink)				ASM_LINE_SEP	\
+     j      [blink]
+ 
+ # define DO_CALL(syscall_name, args)				\
+@@ -137,13 +141,13 @@ hidden_proto (__syscall_error)
+ 	__res = INTERNAL_SYSCALL_NCS(__NR_##name, , nr_args, args);	\
+ 	if (__builtin_expect (INTERNAL_SYSCALL_ERROR_P ((__res), ), 0))	\
+ 	{								\
+-		asm volatile ("st.a blink, [sp, -4] \n\t"         	\
++		asm volatile ( \
+ 			       CALL_ERRNO_SETTER                   	\
+-			      "ld.ab blink, [sp, 4] \n\t"         	\
+ 			      :"+r" (__res)                 		\
+ 			      :                                   	\
+ 			      :"r1","r2","r3","r4","r5","r6",		\
+-			        "r7","r8","r9","r10","r11","r12");	\
++			        "r7","r8","r9","r10","r11","r12",	\
++			        "blink");				\
+ 	}								\
+ 	__res;								\
+ })
+@@ -174,7 +178,7 @@ hidden_proto (__syscall_error)
+ 		ARC_TRAP_INSN				\
+ 		: "+r" (__ret)				\
+ 		: "r"(_sys_num) ASM_ARGS_##nr_args	\
+-		: "memory");				\
++		: "memory", "blink");				\
+                                                         \
+ 	__ret;						\
+ })
+-- 
+2.10.2
+
diff --git a/package/glibc/0006-xxx-locla-chg.patch b/package/glibc/0006-xxx-locla-chg.patch
new file mode 100644
index 0000000..295dbe9
--- /dev/null
+++ b/package/glibc/0006-xxx-locla-chg.patch
@@ -0,0 +1,31 @@
+From da2fd83aff24f3af068b88cb2d3949e635072719 Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <vgupta@synopsys.com>
+Date: Tue, 27 Jun 2017 18:56:47 +0300
+Subject: [PATCH 6/7] xxx: locla chg
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ .gitignore                                 | 1 +
+ sysdeps/unix/sysv/linux/arc/shlib-versions | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/.gitignore b/.gitignore
+index 07d4a12..2b6c8f7 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -44,3 +44,4 @@ core
+ /linuxthreads_db
+ /rtkaio
+ *.pyc
++*.swp
+diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions b/sysdeps/unix/sysv/linux/arc/shlib-versions
+index a85ca37..ac57e16 100644
+--- a/sysdeps/unix/sysv/linux/arc/shlib-versions
++++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
+@@ -1,2 +1,2 @@
+ DEFAULT                 GLIBC_2.26
+-ld=ld-linux-arc.so.2
++ld=ld-linux.so.2
+-- 
+2.10.2
+
diff --git a/package/glibc/0007-add-malloc_-set-get-_state-manually-to-abilist.patch b/package/glibc/0007-add-malloc_-set-get-_state-manually-to-abilist.patch
new file mode 100644
index 0000000..938bda4
--- /dev/null
+++ b/package/glibc/0007-add-malloc_-set-get-_state-manually-to-abilist.patch
@@ -0,0 +1,26 @@
+From 280a58f36b870f68dfc900f3948c42c928af7214 Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <vgupta@synopsys.com>
+Date: Thu, 29 Jun 2017 17:10:00 +0300
+Subject: [PATCH 7/7] add malloc_{set,get}_state manually to abilist
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ sysdeps/unix/sysv/linux/arc/libc.abilist | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sysdeps/unix/sysv/linux/arc/libc.abilist b/sysdeps/unix/sysv/linux/arc/libc.abilist
+index 942e9b8..aa23431 100644
+--- a/sysdeps/unix/sysv/linux/arc/libc.abilist
++++ b/sysdeps/unix/sysv/linux/arc/libc.abilist
+@@ -1226,6 +1226,8 @@ GLIBC_2.26 madvise F
+ GLIBC_2.26 makecontext F
+ GLIBC_2.26 mallinfo F
+ GLIBC_2.26 malloc F
++GLIBC_2.26 malloc_get_state F
++GLIBC_2.26 malloc_set_state F
+ GLIBC_2.26 malloc_info F
+ GLIBC_2.26 malloc_stats F
+ GLIBC_2.26 malloc_trim F
+-- 
+2.10.2
+
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 5910dda..716e5d3 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,4 +1,2 @@
 # Locally calculated (fetched from Github)
 sha256  f1f2566fea1518dd7244d322882242bbd654eb215fba51a7ab001b8fd2c9bcbe     glibc-glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e.tar.gz
-# Locally calculated (fetched from Github)
-sha256  5aa9adeac09727db0b8a52794186563771e74d70410e9fd86431e339953fd4bb     glibc-arc-2017.09-release.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5911dfe..6513364 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,11 +4,6 @@
 #
 ################################################################################
 
-ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2017.09-release
-GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
-GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.gz
-else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
 GLIBC_VERSION = glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e
@@ -20,8 +15,6 @@ GLIBC_VERSION = glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e
 # Then check that the mirror has been synced already (happens once a day.)
 GLIBC_SITE = https://github.com/bminor/glibc.git
 GLIBC_SITE_METHOD = git
-endif
-
 GLIBC_SRC_SUBDIR = .
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
-- 
2.10.2
