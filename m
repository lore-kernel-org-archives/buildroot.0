From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 17 Feb 2016 10:51:04 -0800
Subject: [Buildroot] [PATCH v2] Update libaio to 0.3.110
Message-ID: <1455735064-10038-1-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update libaio from 0.3.108 to 0.3.110. This adds AArch64 support.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 package/libaio/0001-arches.patch | 322 ++++++++++++++++-----------------------
 package/libaio/Config.in         |   2 +-
 package/libaio/libaio.hash       |   4 +-
 package/libaio/libaio.mk         |   2 +-
 4 files changed, 135 insertions(+), 195 deletions(-)

diff --git a/package/libaio/0001-arches.patch b/package/libaio/0001-arches.patch
index c85568c..d1c7f66 100644
--- a/package/libaio/0001-arches.patch
+++ b/package/libaio/0001-arches.patch
@@ -1,62 +1,15 @@
 Patch borrowed from OpenEmbedded, available at
-recipes/libaio/libaio-0.3.106/00_arches.patch in their source
-tree. The patch has been adapted to remove the ARM-related
-definitions, since they have been merged in later versions of libaio.
+/meta/recipes-extended/libaio/libaio/00_arches.patch in their source
+tree.
 
-The patch adds various architecture specific definitions (syscall
-number and macros) for m68k, MIPS, PA/RISC and Sparc. Amongst these,
-Buildroot mostly only cares about MIPS, but it was just easier to take
-the whole OpenEmbedded patch.
+Upstream-Status: Inappropriate [embedded specific]
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/libaio.h         |   24 +++++
- src/syscall-m68k.h   |   78 +++++++++++++++++
- src/syscall-mips.h   |  223 +++++++++++++++++++++++++++++++++++++++++++++++++++
- src/syscall-parisc.h |  146 +++++++++++++++++++++++++++++++++
- src/syscall-sparc.h  |  130 +++++++++++++++++++++++++++++
- src/syscall.h        |    8 +
- 7 files changed, 725 insertions(+)
+from openembedded, added by Qing He <qing.he@intel.com>
 
-Index: libaio-0.3.109/src/libaio.h
-===================================================================
---- libaio-0.3.109.orig/src/libaio.h
-+++ libaio-0.3.109/src/libaio.h
-@@ -83,6 +83,30 @@
- #define PADDEDptr(x, y)	x; unsigned y
- #define PADDEDul(x, y)	unsigned long x; unsigned y
- #  endif
-+#elif defined(__m68k__) /* big endian, 32 bits */
-+#define PADDED(x, y)	unsigned y; x
-+#define PADDEDptr(x, y)	unsigned y; x
-+#define PADDEDul(x, y)	unsigned y; unsigned long x
-+#elif defined(__sparc__) /* big endian, 32 bits */
-+#define PADDED(x, y)	unsigned y; x
-+#define PADDEDptr(x, y)	unsigned y; x
-+#define PADDEDul(x, y)	unsigned y; unsigned long x
-+#elif defined(__hppa__) /* big endian, 32 bits */
-+#define PADDED(x, y)	unsigned y; x
-+#define PADDEDptr(x, y)	unsigned y; x
-+#define PADDEDul(x, y)	unsigned y; unsigned long x
-+#elif defined(__mips__)
-+#  if defined (__MIPSEB__) /* big endian, 32 bits */
-+#define PADDED(x, y)	unsigned y; x
-+#define PADDEDptr(x, y)	unsigned y; x
-+#define PADDEDul(x, y)	unsigned y; unsigned long x
-+#  elif defined(__MIPSEL__) /* little endian, 32 bits */
-+#define PADDED(x, y)	x; unsigned y
-+#define PADDEDptr(x, y)	x; unsigned y
-+#define PADDEDul(x, y)	unsigned long x; unsigned y
-+#  else
-+#    error "neither mipseb nor mipsel?"
-+#  endif
- #else
- #error	endian?
- #endif
-Index: libaio-0.3.109/src/syscall-m68k.h
+Index: libaio-0.3.110/src/syscall-m68k.h
 ===================================================================
 --- /dev/null
-+++ libaio-0.3.109/src/syscall-m68k.h
++++ libaio-0.3.110/src/syscall-m68k.h
 @@ -0,0 +1,78 @@
 +#define __NR_io_setup		241
 +#define __NR_io_destroy		242
@@ -136,10 +89,27 @@ Index: libaio-0.3.109/src/syscall-m68k.h
 +return (type) __res; \
 +}
 +
-Index: libaio-0.3.109/src/syscall-mips.h
+Index: libaio-0.3.110/src/syscall.h
+===================================================================
+--- libaio-0.3.110.orig/src/syscall.h
++++ libaio-0.3.110/src/syscall.h
+@@ -28,6 +28,12 @@
+ #include "syscall-sparc.h"
+ #elif defined(__aarch64__)
+ #include "syscall-arm64.h"
++#elif defined(__m68k__)
++#include "syscall-m68k.h"
++#elif defined(__hppa__)
++#include "syscall-parisc.h"
++#elif defined(__mips__)
++#include "syscall-mips.h"
+ #else
+ #warning "using generic syscall method"
+ #include "syscall-generic.h"
+Index: libaio-0.3.110/src/syscall-mips.h
 ===================================================================
 --- /dev/null
-+++ libaio-0.3.109/src/syscall-mips.h
++++ libaio-0.3.110/src/syscall-mips.h
 @@ -0,0 +1,223 @@
 +/*
 + * This file is subject to the terms and conditions of the GNU General Public
@@ -364,10 +334,10 @@ Index: libaio-0.3.109/src/syscall-mips.h
 +
 +#endif /* (_MIPS_SIM == _MIPS_SIM_NABI32) || (_MIPS_SIM == _MIPS_SIM_ABI64) */
 +
-Index: libaio-0.3.109/src/syscall-parisc.h
+Index: libaio-0.3.110/src/syscall-parisc.h
 ===================================================================
 --- /dev/null
-+++ libaio-0.3.109/src/syscall-parisc.h
++++ libaio-0.3.110/src/syscall-parisc.h
 @@ -0,0 +1,146 @@
 +/*
 + * Linux system call numbers.
@@ -515,157 +485,127 @@ Index: libaio-0.3.109/src/syscall-parisc.h
 +    return K_INLINE_SYSCALL(sname, 5, arg1, arg2, arg3, arg4, arg5);	\
 +}
 +
-Index: libaio-0.3.109/src/syscall-sparc.h
+Index: libaio-0.3.110/src/syscall-arm.h
 ===================================================================
---- /dev/null
-+++ libaio-0.3.109/src/syscall-sparc.h
-@@ -0,0 +1,130 @@
-+/* $Id: unistd.h,v 1.74 2002/02/08 03:57:18 davem Exp $ */
-+
+--- libaio-0.3.110.orig/src/syscall-arm.h
++++ libaio-0.3.110/src/syscall-arm.h
+@@ -114,3 +114,119 @@ type fname(type1 arg1, type2 arg2, type3
+   return (type) __res_r0;						\
+ }
+ 
 +/*
-+ * System calls under the Sparc.
++ *  linux/include/asm-arm/unistd.h
 + *
-+ * Don't be scared by the ugly clobbers, it is the only way I can
-+ * think of right now to force the arguments into fixed registers
-+ * before the trap into the system call with gcc 'asm' statements.
++ *  Copyright (C) 2001-2005 Russell King
 + *
-+ * Copyright (C) 1995 David S. Miller (davem at caip.rutgers.edu)
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
 + *
-+ * SunOS compatibility based upon preliminary work which is:
-+ *
-+ * Copyright (C) 1995 Adrian M. Rodriguez (adrian at remus.rutgers.edu)
++ * Please forward _all_ changes to this file to rmk at arm.linux.org.uk,
++ * no matter what the change is.  Thanks!
 + */
 +
++#define __NR_OABI_SYSCALL_BASE	0x900000
 +
-+#define __NR_io_setup		268
-+#define __NR_io_destroy		269
-+#define __NR_io_submit		270
-+#define __NR_io_cancel		271
-+#define __NR_io_getevents	272
++#if defined(__thumb__) || defined(__ARM_EABI__)
++#define __NR_SYSCALL_BASE	0
++#else
++#define __NR_SYSCALL_BASE	__NR_OABI_SYSCALL_BASE
++#endif
 +
++#define __NR_io_setup			(__NR_SYSCALL_BASE+243)
++#define __NR_io_destroy			(__NR_SYSCALL_BASE+244)
++#define __NR_io_getevents		(__NR_SYSCALL_BASE+245)
++#define __NR_io_submit			(__NR_SYSCALL_BASE+246)
++#define __NR_io_cancel			(__NR_SYSCALL_BASE+247)
 +
-+#define io_syscall1(type,fname,sname,type1,arg1) \
-+type fname(type1 arg1) \
-+{ \
-+long __res; \
-+register long __g1 __asm__ ("g1") = __NR_##sname; \
-+register long __o0 __asm__ ("o0") = (long)(arg1); \
-+__asm__ __volatile__ ("t 0x10\n\t" \
-+		      "bcc 1f\n\t" \
-+		      "mov %%o0, %0\n\t" \
-+		      "sub %%g0, %%o0, %0\n\t" \
-+		      "1:\n\t" \
-+		      : "=r" (__res), "=&r" (__o0) \
-+		      : "1" (__o0), "r" (__g1) \
-+		      : "cc"); \
-+if (__res < -255 || __res >= 0) \
-+	return (type) __res; \
-+return -1; \
++#define __sys2(x) #x
++#define __sys1(x) __sys2(x)
++
++#if defined(__thumb__) || defined(__ARM_EABI__)
++#define __SYS_REG(name) register long __sysreg __asm__("r7") = __NR_##name;
++#define __SYS_REG_LIST(regs...) "r" (__sysreg) , ##regs
++#define __syscall(name) "swi\t0"
++#else
++#define __SYS_REG(name)
++#define __SYS_REG_LIST(regs...) regs
++#define __syscall(name) "swi\t" __sys1(__NR_##name) ""
++#endif
++
++#define io_syscall1(type,fname,sname,type1,arg1)			\
++type fname(type1 arg1) {						\
++  __SYS_REG(sname)							\
++  register long __r0 __asm__("r0") = (long)arg1;			\
++  register long __res_r0 __asm__("r0");					\
++  __asm__ __volatile__ (						\
++  __syscall(sname)							\
++	: "=r" (__res_r0)						\
++	: __SYS_REG_LIST( "0" (__r0) )					\
++	: "memory" );							\
++  return (type) __res_r0;						\
 +}
 +
-+#define io_syscall2(type,fname,sname,type1,arg1,type2,arg2) \
-+type fname(type1 arg1,type2 arg2) \
-+{ \
-+long __res; \
-+register long __g1 __asm__ ("g1") = __NR_##sname; \
-+register long __o0 __asm__ ("o0") = (long)(arg1); \
-+register long __o1 __asm__ ("o1") = (long)(arg2); \
-+__asm__ __volatile__ ("t 0x10\n\t" \
-+		      "bcc 1f\n\t" \
-+		      "mov %%o0, %0\n\t" \
-+		      "sub %%g0, %%o0, %0\n\t" \
-+		      "1:\n\t" \
-+		      : "=r" (__res), "=&r" (__o0) \
-+		      : "1" (__o0), "r" (__o1), "r" (__g1) \
-+		      : "cc"); \
-+if (__res < -255 || __res >= 0) \
-+	return (type) __res; \
-+return -1; \
++#define io_syscall2(type,fname,sname,type1,arg1,type2,arg2)		\
++type fname(type1 arg1,type2 arg2) {					\
++  __SYS_REG(sname)							\
++  register long __r0 __asm__("r0") = (long)arg1;			\
++  register long __r1 __asm__("r1") = (long)arg2;			\
++  register long __res_r0 __asm__("r0");					\
++  __asm__ __volatile__ (						\
++  __syscall(sname)							\
++	: "=r" (__res_r0)						\
++	: __SYS_REG_LIST( "0" (__r0), "r" (__r1) )			\
++	: "memory" );							\
++  return (type) __res_r0;						\
 +}
 +
-+#define io_syscall3(type,fname,sname,type1,arg1,type2,arg2,type3,arg3) \
-+type fname(type1 arg1,type2 arg2,type3 arg3) \
-+{ \
-+long __res; \
-+register long __g1 __asm__ ("g1") = __NR_##sname; \
-+register long __o0 __asm__ ("o0") = (long)(arg1); \
-+register long __o1 __asm__ ("o1") = (long)(arg2); \
-+register long __o2 __asm__ ("o2") = (long)(arg3); \
-+__asm__ __volatile__ ("t 0x10\n\t" \
-+		      "bcc 1f\n\t" \
-+		      "mov %%o0, %0\n\t" \
-+		      "sub %%g0, %%o0, %0\n\t" \
-+		      "1:\n\t" \
-+		      : "=r" (__res), "=&r" (__o0) \
-+		      : "1" (__o0), "r" (__o1), "r" (__o2), "r" (__g1) \
-+		      : "cc"); \
-+if (__res < -255 || __res>=0) \
-+	return (type) __res; \
-+return -1; \
++#define io_syscall3(type,fname,sname,type1,arg1,type2,arg2,type3,arg3)	\
++type fname(type1 arg1,type2 arg2,type3 arg3) {				\
++  __SYS_REG(sname)							\
++  register long __r0 __asm__("r0") = (long)arg1;			\
++  register long __r1 __asm__("r1") = (long)arg2;			\
++  register long __r2 __asm__("r2") = (long)arg3;			\
++  register long __res_r0 __asm__("r0");					\
++  __asm__ __volatile__ (						\
++  __syscall(sname)							\
++	: "=r" (__res_r0)						\
++	: __SYS_REG_LIST( "0" (__r0), "r" (__r1), "r" (__r2) )		\
++	: "memory" );							\
++  return (type) __res_r0;						\
 +}
 +
-+#define io_syscall4(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4) \
-+type fname(type1 arg1, type2 arg2, type3 arg3, type4 arg4) \
-+{ \
-+long __res; \
-+register long __g1 __asm__ ("g1") = __NR_##sname; \
-+register long __o0 __asm__ ("o0") = (long)(arg1); \
-+register long __o1 __asm__ ("o1") = (long)(arg2); \
-+register long __o2 __asm__ ("o2") = (long)(arg3); \
-+register long __o3 __asm__ ("o3") = (long)(arg4); \
-+__asm__ __volatile__ ("t 0x10\n\t" \
-+		      "bcc 1f\n\t" \
-+		      "mov %%o0, %0\n\t" \
-+		      "sub %%g0, %%o0, %0\n\t" \
-+		      "1:\n\t" \
-+		      : "=r" (__res), "=&r" (__o0) \
-+		      : "1" (__o0), "r" (__o1), "r" (__o2), "r" (__o3), "r" (__g1) \
-+		      : "cc"); \
-+if (__res < -255 || __res>=0) \
-+	return (type) __res; \
-+return -1; \
++#define io_syscall4(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4)\
++type fname(type1 arg1, type2 arg2, type3 arg3, type4 arg4) {		\
++  __SYS_REG(sname)							\
++  register long __r0 __asm__("r0") = (long)arg1;			\
++  register long __r1 __asm__("r1") = (long)arg2;			\
++  register long __r2 __asm__("r2") = (long)arg3;			\
++  register long __r3 __asm__("r3") = (long)arg4;			\
++  register long __res_r0 __asm__("r0");					\
++  __asm__ __volatile__ (						\
++  __syscall(sname)							\
++	: "=r" (__res_r0)						\
++	: __SYS_REG_LIST( "0" (__r0), "r" (__r1), "r" (__r2), "r" (__r3) ) \
++	: "memory" );							\
++  return (type) __res_r0;						\
 +}
 +
-+#define io_syscall5(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4, \
-+	  type5,arg5) \
-+type fname(type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5) \
-+{ \
-+long __res; \
-+register long __g1 __asm__ ("g1") = __NR_##sname; \
-+register long __o0 __asm__ ("o0") = (long)(arg1); \
-+register long __o1 __asm__ ("o1") = (long)(arg2); \
-+register long __o2 __asm__ ("o2") = (long)(arg3); \
-+register long __o3 __asm__ ("o3") = (long)(arg4); \
-+register long __o4 __asm__ ("o4") = (long)(arg5); \
-+__asm__ __volatile__ ("t 0x10\n\t" \
-+		      "bcc 1f\n\t" \
-+		      "mov %%o0, %0\n\t" \
-+		      "sub %%g0, %%o0, %0\n\t" \
-+		      "1:\n\t" \
-+		      : "=r" (__res), "=&r" (__o0) \
-+		      : "1" (__o0), "r" (__o1), "r" (__o2), "r" (__o3), "r" (__o4), "r" (__g1) \
-+		      : "cc"); \
-+if (__res < -255 || __res>=0) \
-+	return (type) __res; \
-+return -1; \
++#define io_syscall5(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4,type5,arg5)	\
++type fname(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5) {\
++  __SYS_REG(sname)							\
++  register long __r0 __asm__("r0") = (long)arg1;			\
++  register long __r1 __asm__("r1") = (long)arg2;			\
++  register long __r2 __asm__("r2") = (long)arg3;			\
++  register long __r3 __asm__("r3") = (long)arg4;			\
++  register long __r4 __asm__("r4") = (long)arg5;			\
++  register long __res_r0 __asm__("r0");					\
++  __asm__ __volatile__ (						\
++  __syscall(sname)							\
++	: "=r" (__res_r0)						\
++	: __SYS_REG_LIST( "0" (__r0), "r" (__r1), "r" (__r2),		\
++			  "r" (__r3), "r" (__r4) )			\
++	: "memory" );							\
++  return (type) __res_r0;						\
 +}
 +
-Index: libaio-0.3.109/src/syscall.h
-===================================================================
---- libaio-0.3.109.orig/src/syscall.h
-+++ libaio-0.3.109/src/syscall.h
-@@ -24,6 +24,14 @@
- #include "syscall-alpha.h"
- #elif defined(__arm__)
- #include "syscall-arm.h"
-+#elif defined(__m68k__)
-+#include "syscall-m68k.h"
-+#elif defined(__sparc__)
-+#include "syscall-sparc.h"
-+#elif defined(__hppa__)
-+#include "syscall-parisc.h"
-+#elif defined(__mips__)
-+#include "syscall-mips.h"
- #else
- #error "add syscall-arch.h"
- #endif
diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index cc44cb6..63db829 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_m68k || BR2_mips || BR2_mipsel || BR2_powerpc || \
-		BR2_sparc || BR2_x86_64
+		BR2_sparc || BR2_x86_64 || BR2_aarch64
 
 config BR2_PACKAGE_LIBAIO
 	bool "libaio"
diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
index deb16e8..7aa8961 100644
--- a/package/libaio/libaio.hash
+++ b/package/libaio/libaio.hash
@@ -1,2 +1,2 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/liba/libaio/libaio_0.3.109-3.dsc
-sha256	bf4a457253cbaab215aea75cb6e18dc8d95bbd507e9920661ff9bdd288c8778d	libaio_0.3.109.orig.tar.gz
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/liba/libaio/libaio_0.3.110-1.dsc
+sha256	e019028e631725729376250e32b473012f7cb68e1f7275bfc1bbcdd0f8745f7e	libaio_0.3.110.orig.tar.gz
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 53ad7eb..9b28f05 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAIO_VERSION = 0.3.109
+LIBAIO_VERSION = 0.3.110
 LIBAIO_SOURCE = libaio_$(LIBAIO_VERSION).orig.tar.gz
 LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/liba/libaio
 LIBAIO_INSTALL_STAGING = YES
-- 
2.5.0
