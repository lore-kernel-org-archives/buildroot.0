From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:36 -0000
Subject: [Buildroot] [git commit] libaio: bump to 0.3.111
Message-ID: <20180907111544.524B47FCAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a3f78c9191595f7ea9fab49360dfc18a743d28b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, libaio contained some architecture specific code to do the
syscalls. In fact, it contained a generic variant of the code called
syscall-generic.h, but it was showing a warning when it was used, as
if it was "not safe". Consequently, in Buildroot, we had chosen to
support libaio only on a the subset of architectures that were
explicitly handled by libaio.

However, between 0.3.110 and 0.3.111, libaio upstream entirely dropped
the architecture-specific code:

  https://pagure.io/libaio/c/97fd3fc0195500e616e34047cba4846164c411d9?branch=master

Consequently, in this patch, we:

 - Bump libaio to 0.3.111.

 - Switch to the new upstream at https://pagure.io/libaio/.

 - Drop the 0001-arches.patch patch, which was adding support for
   MIPS, since we no longer need architecture-specific code.

 - Update the remaining patches, and Git-format one of them which
   wasn't Git-formatted.

 - Drop the BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS option and all its uses.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/blktrace/Config.in                         |   2 -
 package/cryptsetup/Config.in                       |   2 -
 package/dmraid/Config.in                           |   2 -
 package/docker-engine/Config.in                    |   1 -
 package/gadgetfs-test/Config.in                    |   1 -
 package/libaio/0001-arches.patch                   | 249 ---------------------
 ...-add-ENABLE_SHARED-boolean-to-allow-stat.patch} |   4 +-
 ...akefile-add-missing-DESTDIR-variable-use.patch} |  22 +-
 package/libaio/Config.in                           |  10 +-
 package/libaio/libaio.hash                         |   4 +-
 package/libaio/libaio.mk                           |   5 +-
 package/libiio/Config.in                           |   1 -
 package/luksmeta/Config.in                         |   2 -
 package/mysql/Config.in                            |   2 -
 package/udisks/Config.in                           |   3 -
 package/xen/Config.in                              |   2 -
 16 files changed, 23 insertions(+), 289 deletions(-)

diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index dedfa03f03..d40c968243 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_BLKTRACE
 	bool "blktrace"
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	depends on BR2_USE_MMU # system()
 	select BR2_PACKAGE_LIBAIO
@@ -13,5 +12,4 @@ config BR2_PACKAGE_BLKTRACE
 
 comment "blktrace needs a toolchain w/ NPTL"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 831435628c..14b897a8a8 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_CRYPTSETUP
 	bool "cryptsetup"
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
@@ -19,6 +18,5 @@ config BR2_PACKAGE_CRYPTSETUP
 
 comment "cryptsetup needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index ffa75a7084..aa98c853a1 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
@@ -15,5 +14,4 @@ config BR2_PACKAGE_DMRAID
 
 comment "dmraid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 1f417d1c53..8feb11b48c 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -44,7 +44,6 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
 
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	bool "devicemapper filesystem driver"
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
index 9a603066e7..ca14c91b41 100644
--- a/package/gadgetfs-test/Config.in
+++ b/package/gadgetfs-test/Config.in
@@ -8,7 +8,6 @@ if BR2_PACKAGE_GADGETFS_TEST
 
 config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
 	bool "use asynchronous i/o"
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBAIO
 	help
 	  Select this to have gadgetfs-test do asynchronous I/O using
diff --git a/package/libaio/0001-arches.patch b/package/libaio/0001-arches.patch
deleted file mode 100644
index 4b77f57768..0000000000
--- a/package/libaio/0001-arches.patch
+++ /dev/null
@@ -1,249 +0,0 @@
-Patch borrowed from OpenEmbedded, available at
-/meta/recipes-extended/libaio/libaio/00_arches.patch in their source
-tree. This patch has been modified to only add the MIPS definitions.
-
-The patch adds MIPS specific definitions (syscall number and macros).
-
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
-
-Index: libaio-0.3.110/src/syscall.h
-===================================================================
---- libaio-0.3.110.orig/src/syscall.h
-+++ libaio-0.3.110/src/syscall.h
-@@ -28,6 +28,8 @@
- #include "syscall-sparc.h"
- #elif defined(__aarch64__)
- #include "syscall-arm64.h"
-+#elif defined(__mips__)
-+#include "syscall-mips.h"
- #else
- #warning "using generic syscall method"
- #include "syscall-generic.h"
-Index: libaio-0.3.110/src/syscall-mips.h
-===================================================================
---- /dev/null
-+++ libaio-0.3.110/src/syscall-mips.h
-@@ -0,0 +1,223 @@
-+/*
-+ * This file is subject to the terms and conditions of the GNU General Public
-+ * License.  See the file "COPYING" in the main directory of this archive
-+ * for more details.
-+ *
-+ * Copyright (C) 1995, 96, 97, 98, 99, 2000 by Ralf Baechle
-+ * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
-+ *
-+ * Changed system calls macros _syscall5 - _syscall7 to push args 5 to 7 onto
-+ * the stack. Robin Farine for ACN S.A, Copyright (C) 1996 by ACN S.A
-+ */
-+
-+#ifndef _MIPS_SIM_ABI32
-+#define _MIPS_SIM_ABI32			1
-+#define _MIPS_SIM_NABI32		2
-+#define _MIPS_SIM_ABI64			3
-+#endif
-+
-+#if _MIPS_SIM == _MIPS_SIM_ABI32
-+
-+/*
-+ * Linux o32 style syscalls are in the range from 4000 to 4999.
-+ */
-+#define __NR_Linux			4000
-+#define __NR_io_setup			(__NR_Linux + 241)
-+#define __NR_io_destroy			(__NR_Linux + 242)
-+#define __NR_io_getevents		(__NR_Linux + 243)
-+#define __NR_io_submit			(__NR_Linux + 244)
-+#define __NR_io_cancel			(__NR_Linux + 245)
-+
-+#endif /* _MIPS_SIM == _MIPS_SIM_ABI32 */
-+
-+#if _MIPS_SIM == _MIPS_SIM_ABI64
-+
-+/*
-+ * Linux 64-bit syscalls are in the range from 5000 to 5999.
-+ */
-+#define __NR_Linux			5000
-+#define __NR_io_setup			(__NR_Linux + 200)
-+#define __NR_io_destroy			(__NR_Linux + 201)
-+#define __NR_io_getevents		(__NR_Linux + 202)
-+#define __NR_io_submit			(__NR_Linux + 203)
-+#define __NR_io_cancel			(__NR_Linux + 204)
-+#endif /* _MIPS_SIM == _MIPS_SIM_ABI64 */
-+
-+#if _MIPS_SIM == _MIPS_SIM_NABI32
-+
-+/*
-+ * Linux N32 syscalls are in the range from 6000 to 6999.
-+ */
-+#define __NR_Linux			6000
-+#define __NR_io_setup			(__NR_Linux + 200)
-+#define __NR_io_destroy			(__NR_Linux + 201)
-+#define __NR_io_getevents		(__NR_Linux + 202)
-+#define __NR_io_submit			(__NR_Linux + 203)
-+#define __NR_io_cancel			(__NR_Linux + 204)
-+#endif /* _MIPS_SIM == _MIPS_SIM_NABI32 */
-+
-+#define io_syscall1(type,fname,sname,atype,a) \
-+type fname(atype a) \
-+{ \
-+	register unsigned long __a0 asm("$4") = (unsigned long) a; \
-+	register unsigned long __a3 asm("$7"); \
-+	unsigned long __v0; \
-+	\
-+	__asm__ volatile ( \
-+	".set\tnoreorder\n\t" \
-+	"li\t$2, %3\t\t\t# " #fname "\n\t" \
-+	"syscall\n\t" \
-+	"move\t%0, $2\n\t" \
-+	".set\treorder" \
-+	: "=&r" (__v0), "=r" (__a3) \
-+	: "r" (__a0), "i" (__NR_##sname) \
-+	: "$2", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", \
-+	  "memory"); \
-+	\
-+	if (__a3 == 0) \
-+		return (type) __v0; \
-+	return (type) -1; \
-+}
-+
-+#define io_syscall2(type,fname,sname,atype,a,btype,b) \
-+type fname(atype a, btype b) \
-+{ \
-+	register unsigned long __a0 asm("$4") = (unsigned long) a; \
-+	register unsigned long __a1 asm("$5") = (unsigned long) b; \
-+	register unsigned long __a3 asm("$7"); \
-+	unsigned long __v0; \
-+	\
-+	__asm__ volatile ( \
-+	".set\tnoreorder\n\t" \
-+	"li\t$2, %4\t\t\t# " #fname "\n\t" \
-+	"syscall\n\t" \
-+	"move\t%0, $2\n\t" \
-+	".set\treorder" \
-+	: "=&r" (__v0), "=r" (__a3) \
-+	: "r" (__a0), "r" (__a1), "i" (__NR_##sname) \
-+	: "$2", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", \
-+	  "memory"); \
-+	\
-+	if (__a3 == 0) \
-+		return (type) __v0; \
-+	return (type) -1; \
-+}
-+
-+#define io_syscall3(type,fname,sname,atype,a,btype,b,ctype,c) \
-+type fname(atype a, btype b, ctype c) \
-+{ \
-+	register unsigned long __a0 asm("$4") = (unsigned long) a; \
-+	register unsigned long __a1 asm("$5") = (unsigned long) b; \
-+	register unsigned long __a2 asm("$6") = (unsigned long) c; \
-+	register unsigned long __a3 asm("$7"); \
-+	unsigned long __v0; \
-+	\
-+	__asm__ volatile ( \
-+	".set\tnoreorder\n\t" \
-+	"li\t$2, %5\t\t\t# " #fname "\n\t" \
-+	"syscall\n\t" \
-+	"move\t%0, $2\n\t" \
-+	".set\treorder" \
-+	: "=&r" (__v0), "=r" (__a3) \
-+	: "r" (__a0), "r" (__a1), "r" (__a2), "i" (__NR_##sname) \
-+	: "$2", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", \
-+	  "memory"); \
-+	\
-+	if (__a3 == 0) \
-+		return (type) __v0; \
-+	return (type) -1; \
-+}
-+
-+#define io_syscall4(type,fname,sname,atype,a,btype,b,ctype,c,dtype,d) \
-+type fname(atype a, btype b, ctype c, dtype d) \
-+{ \
-+	register unsigned long __a0 asm("$4") = (unsigned long) a; \
-+	register unsigned long __a1 asm("$5") = (unsigned long) b; \
-+	register unsigned long __a2 asm("$6") = (unsigned long) c; \
-+	register unsigned long __a3 asm("$7") = (unsigned long) d; \
-+	unsigned long __v0; \
-+	\
-+	__asm__ volatile ( \
-+	".set\tnoreorder\n\t" \
-+	"li\t$2, %5\t\t\t# " #fname "\n\t" \
-+	"syscall\n\t" \
-+	"move\t%0, $2\n\t" \
-+	".set\treorder" \
-+	: "=&r" (__v0), "+r" (__a3) \
-+	: "r" (__a0), "r" (__a1), "r" (__a2), "i" (__NR_##sname) \
-+	: "$2", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", \
-+	  "memory"); \
-+	\
-+	if (__a3 == 0) \
-+		return (type) __v0; \
-+	return (type) -1; \
-+}
-+
-+#if (_MIPS_SIM == _MIPS_SIM_ABI32)
-+
-+/*
-+ * Using those means your brain needs more than an oil change ;-)
-+ */
-+
-+#define io_syscall5(type,fname,sname,atype,a,btype,b,ctype,c,dtype,d,etype,e) \
-+type fname(atype a, btype b, ctype c, dtype d, etype e) \
-+{ \
-+	register unsigned long __a0 asm("$4") = (unsigned long) a; \
-+	register unsigned long __a1 asm("$5") = (unsigned long) b; \
-+	register unsigned long __a2 asm("$6") = (unsigned long) c; \
-+	register unsigned long __a3 asm("$7") = (unsigned long) d; \
-+	unsigned long __v0; \
-+	\
-+	__asm__ volatile ( \
-+	".set\tnoreorder\n\t" \
-+	"lw\t$2, %6\n\t" \
-+	"subu\t$29, 32\n\t" \
-+	"sw\t$2, 16($29)\n\t" \
-+	"li\t$2, %5\t\t\t# " #fname "\n\t" \
-+	"syscall\n\t" \
-+	"move\t%0, $2\n\t" \
-+	"addiu\t$29, 32\n\t" \
-+	".set\treorder" \
-+	: "=&r" (__v0), "+r" (__a3) \
-+	: "r" (__a0), "r" (__a1), "r" (__a2), "i" (__NR_##sname), \
-+	  "m" ((unsigned long)e) \
-+	: "$2", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", \
-+	  "memory"); \
-+	\
-+	if (__a3 == 0) \
-+		return (type) __v0; \
-+	return (type) -1; \
-+}
-+
-+#endif /* (_MIPS_SIM == _MIPS_SIM_ABI32) */
-+
-+#if (_MIPS_SIM == _MIPS_SIM_NABI32) || (_MIPS_SIM == _MIPS_SIM_ABI64)
-+
-+#define io_syscall5(type,fname,sname,atype,a,btype,b,ctype,c,dtype,d,etype,e) \
-+type fname (atype a,btype b,ctype c,dtype d,etype e) \
-+{ \
-+	register unsigned long __a0 asm("$4") = (unsigned long) a; \
-+	register unsigned long __a1 asm("$5") = (unsigned long) b; \
-+	register unsigned long __a2 asm("$6") = (unsigned long) c; \
-+	register unsigned long __a3 asm("$7") = (unsigned long) d; \
-+	register unsigned long __a4 asm("$8") = (unsigned long) e; \
-+	unsigned long __v0; \
-+	\
-+	__asm__ volatile ( \
-+	".set\tnoreorder\n\t" \
-+	"li\t$2, %6\t\t\t# " #fname "\n\t" \
-+	"syscall\n\t" \
-+	"move\t%0, $2\n\t" \
-+	".set\treorder" \
-+	: "=&r" (__v0), "+r" (__a3) \
-+	: "r" (__a0), "r" (__a1), "r" (__a2), "r" (__a4), "i" (__NR_##sname) \
-+	: "$2", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", \
-+	  "memory"); \
-+	\
-+	if (__a3 == 0) \
-+		return (type) __v0; \
-+	return (type) -1; \
-+}
-+
-+#endif /* (_MIPS_SIM == _MIPS_SIM_NABI32) || (_MIPS_SIM == _MIPS_SIM_ABI64) */
-+
diff --git a/package/libaio/0002-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch b/package/libaio/0001-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
similarity index 95%
rename from package/libaio/0002-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
rename to package/libaio/0001-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
index 50703c3f53..9c876bdc5c 100644
--- a/package/libaio/0002-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
+++ b/package/libaio/0001-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
@@ -1,4 +1,4 @@
-From 14dee5707716629b1bc8d06b93cdfe9ea1a3b813 Mon Sep 17 00:00:00 2001
+From 4dc04ef55710f7f5c1e55ebb5cba8e22a126404e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Mon, 29 Aug 2016 22:14:26 +0200
 Subject: [PATCH] src/Makefile: add ENABLE_SHARED boolean to allow static-only
@@ -52,5 +52,5 @@ index eadb336..cfab240 100644
  $(libaio_objs): libaio.h
  
 -- 
-2.7.4
+2.14.4
 
diff --git a/package/libaio/0003-destdir.patch b/package/libaio/0002-Makefile-add-missing-DESTDIR-variable-use.patch
similarity index 56%
rename from package/libaio/0003-destdir.patch
rename to package/libaio/0002-Makefile-add-missing-DESTDIR-variable-use.patch
index 583a2afa86..49b9892ea4 100644
--- a/package/libaio/0003-destdir.patch
+++ b/package/libaio/0002-Makefile-add-missing-DESTDIR-variable-use.patch
@@ -1,19 +1,24 @@
+From 517d9fbe63fbd7e72445dce1cb3f3d8457d838cb Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 14 Aug 2018 23:17:25 +0200
+Subject: [PATCH] Makefile: add missing DESTDIR variable use
+
 Patch borrowed from OpenEmbedded, available at
 recipes/libaio/libaio-0.3.106/destdir.patch in their source tree.
 
 It just adds support for the traditional DESTDIR variable to install
 the library in a different sysroot than the normal /.
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
- Makefile |    2 +-
+ Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: libaio-0.3.109/Makefile
-===================================================================
---- libaio-0.3.109.orig/Makefile
-+++ libaio-0.3.109/Makefile
-@@ -23,7 +23,7 @@
+diff --git a/Makefile b/Makefile
+index e9dbdb0..c1fb831 100644
+--- a/Makefile
++++ b/Makefile
+@@ -14,7 +14,7 @@ all:
  	@$(MAKE) -C src
  
  install:
@@ -22,3 +27,6 @@ Index: libaio-0.3.109/Makefile
  
  check:
  	@$(MAKE) -C harness check
+-- 
+2.14.4
+
diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index ea21a36f55..eed843f44b 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -1,12 +1,6 @@
-config BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
-	bool
-	default y if BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
-		BR2_m68k || BR2_mips || BR2_mipsel || BR2_powerpc || \
-		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || \
-		BR2_x86_64
-
 config BR2_PACKAGE_LIBAIO
 	bool "libaio"
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	help
 	  Library for doing asynchronous I/O
+
+	  https://pagure.io/libaio/
diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
index 5917e2f783..17dd1ff706 100644
--- a/package/libaio/libaio.hash
+++ b/package/libaio/libaio.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/liba/libaio/libaio_0.3.110-1.dsc
-sha256	e019028e631725729376250e32b473012f7cb68e1f7275bfc1bbcdd0f8745f7e	libaio_0.3.110.orig.tar.gz
+# From https://releases.pagure.org/libaio/CHECKSUMS
+sha256	62cf871ad8fd09eb3418f00aca7a7d449299b8e1de31c65f28bf6a2ef1fa502a	libaio-0.3.111.tar.gz
 
 # Hash for license file:
 sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 76e6937cc2..adb4d1c4b1 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBAIO_VERSION = 0.3.110
-LIBAIO_SOURCE = libaio_$(LIBAIO_VERSION).orig.tar.gz
-LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/liba/libaio
+LIBAIO_VERSION = 0.3.111
+LIBAIO_SITE = https://releases.pagure.org/libaio
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPL-2.1+
 LIBAIO_LICENSE_FILES = COPYING
diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index b58ac7fdb3..06f48fae0a 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -60,7 +60,6 @@ config BR2_PACKAGE_LIBIIO_IIOD
 config BR2_PACKAGE_LIBIIO_IIOD_USBD
 	bool "USB support in the IIO Daemon (FunctionFS)"
 	depends on BR2_PACKAGE_LIBIIO_IIOD
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # usb_functionfs_descs_head_v2
 	select BR2_PACKAGE_LIBAIO
 	help
diff --git a/package/luksmeta/Config.in b/package/luksmeta/Config.in
index 373d5f7517..ddc9b6f3bf 100644
--- a/package/luksmeta/Config.in
+++ b/package/luksmeta/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUKSMETA
 	bool "luksmeta"
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # cryptsetup -> lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
 	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
@@ -14,6 +13,5 @@ config BR2_PACKAGE_LUKSMETA
 
 comment "luksmeta needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 2abf5daecb..ccc014e272 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -16,7 +16,6 @@ choice
 
 config BR2_PACKAGE_MARIADB
 	bool "mariadb"
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBXML2
@@ -32,7 +31,6 @@ config BR2_PACKAGE_MARIADB
 	  http://www.mariadb.org/
 
 comment "mariadb needs a toolchain w/ dynamic library"
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ORACLE_MYSQL
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 2329fb2784..c1e5538fb5 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # polkit, lvm2
 	depends on BR2_USE_MMU # lvm2
@@ -39,11 +38,9 @@ endif
 
 comment "udisks needs udev /dev management"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV
 
 comment "udisks needs a glibc toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/xen/Config.in b/package/xen/Config.in
index 819af37e46..57ab40eba8 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -20,7 +20,6 @@ config BR2_PACKAGE_XEN_HYPERVISOR
 config BR2_PACKAGE_XEN_TOOLS
 	bool "Xen tools"
 	depends on !BR2_STATIC_LIBS # dtc (libfdt)
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DTC
@@ -37,7 +36,6 @@ config BR2_PACKAGE_XEN_TOOLS
 	  The Xen tools can be accessed by the xl command.
 
 comment "xen tools need a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
 
