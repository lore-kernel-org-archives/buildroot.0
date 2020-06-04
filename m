From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  4 Jun 2020 16:54:08 +0300
Subject: [Buildroot] [PATCH 2/2] package/rt-tests: bump to version 1.8
In-Reply-To: <7bacd6259e057a8bb62f0b7654842b43da630aec.1591278848.git.baruch@tkos.co.il>
References: <7bacd6259e057a8bb62f0b7654842b43da630aec.1591278848.git.baruch@tkos.co.il>
Message-ID: <845009b0378d6f3117f361661fe59a40540fe419.1591278848.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch #1. libnuma is now a mandatory dependency. The ostype and
machinetype variables are not used for the Linux target.

Drop patch #3. SH is not a supported target architecture anymore.

Add mandatory dependency on libnuma (numactl). Propagate numactl
architecture dependency.

Update homepage link. The kernel wiki is dead.

Drop Python build time dependency. Python is an optional run-time
dependency.

Add reference to upstream provided tarball hash.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...01-Fix-a-build-issue-with-uClibc-ng.patch} |  0
 ...or-issues-with-rt-tests-build-system.patch | 55 -------------------
 ...-number-for-sched_-gs-etattr-for-SH4.patch | 34 ------------
 package/rt-tests/Config.in                    |  5 +-
 package/rt-tests/rt-tests.hash                |  3 +-
 package/rt-tests/rt-tests.mk                  |  7 +--
 6 files changed, 8 insertions(+), 96 deletions(-)
 rename package/rt-tests/{0002-Fix-a-build-issue-with-uClibc-ng.patch => 0001-Fix-a-build-issue-with-uClibc-ng.patch} (100%)
 delete mode 100644 package/rt-tests/0001-Fix-various-minor-issues-with-rt-tests-build-system.patch
 delete mode 100644 package/rt-tests/0003-Add-syscall-number-for-sched_-gs-etattr-for-SH4.patch

diff --git a/package/rt-tests/0002-Fix-a-build-issue-with-uClibc-ng.patch b/package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch
similarity index 100%
rename from package/rt-tests/0002-Fix-a-build-issue-with-uClibc-ng.patch
rename to package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch
diff --git a/package/rt-tests/0001-Fix-various-minor-issues-with-rt-tests-build-system.patch b/package/rt-tests/0001-Fix-various-minor-issues-with-rt-tests-build-system.patch
deleted file mode 100644
index 157514a8e3e9..000000000000
--- a/package/rt-tests/0001-Fix-various-minor-issues-with-rt-tests-build-system.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From eb47c07e9d20e0b1a6cc4b0df26f24f22f024f1c Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Mon, 10 Nov 2014 11:44:55 +0300
-Subject: [PATCH] Fix various minor issues with rt-tests build system
-
-The issues fixed are :
-
- * Remove the automatic NUMA detection from the host
-   architecture. This is broken when doing cross-compilation. One can
-   still set NUMA=1 if NUMA support is desired.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-Cc: Peter Korsgaard <peter@korsgaard.com>
-[Romain:
-    rebase on v1.0
-    Remove HASPYTHON since PYLIB can be overriden from the environment]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- Makefile | 19 -------------------
- 1 file changed, 19 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index a54d82b..0946f93 100644
---- a/Makefile
-+++ b/Makefile
-@@ -38,25 +38,6 @@ else
- 	CFLAGS	+= -O0 -g
- endif
- 
--# We make some gueses on how to compile rt-tests based on the machine type
--# and the ostype. These can often be overridden.
--dumpmachine := $(shell $(CC) -dumpmachine)
--
--# The ostype is typically something like linux or android
--ostype := $(lastword $(subst -, ,$(dumpmachine)))
--
--machinetype := $(shell echo $(dumpmachine)| \
--    sed -e 's/-.*//' -e 's/i.86/i386/' -e 's/mips.*/mips/' -e 's/ppc.*/powerpc/')
--
--# The default is to assume you have libnuma installed, which is fine to do
--# even on non-numa machines. If you don't want to install the numa libs, for
--# example, they might not be available in an embedded environment, then
--# compile with
--# make NUMA=0
--ifneq ($(filter x86_64 i386 ia64 mips powerpc,$(machinetype)),)
--NUMA 	:= 1
--endif
--
- # The default is to assume that you have numa_parse_cpustring_all
- # If you have an older version of libnuma that only has numa_parse_cpustring
- # then compile with
--- 
-2.5.5
-
diff --git a/package/rt-tests/0003-Add-syscall-number-for-sched_-gs-etattr-for-SH4.patch b/package/rt-tests/0003-Add-syscall-number-for-sched_-gs-etattr-for-SH4.patch
deleted file mode 100644
index 9d606a4dfdff..000000000000
--- a/package/rt-tests/0003-Add-syscall-number-for-sched_-gs-etattr-for-SH4.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 53c7e8bc75f0f27752309ddae49e8d3b867a7681 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Mon, 15 Aug 2016 18:20:47 +0200
-Subject: [PATCH] Add syscall-number for sched_(gs)etattr() for SH4
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/include/rt-sched.h | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/include/rt-sched.h b/src/include/rt-sched.h
-index 679c4bd..83394c6 100644
---- a/src/include/rt-sched.h
-+++ b/src/include/rt-sched.h
-@@ -51,6 +51,16 @@
- #endif
- #endif
- 
-+/* SCHED_DEADLINE available on sh4 since kernel 4.8 */
-+#ifdef __SH4__
-+#ifndef __NR_sched_setattr
-+#define __NR_sched_setattr		370
-+#endif
-+#ifndef __NR_sched_getattr
-+#define __NR_sched_getattr		369
-+#endif
-+#endif
-+
- #ifdef __tilegx__
- #define __NR_sched_setattr		274
- #define __NR_sched_getattr		275
--- 
-2.5.5
-
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 23e911b9fd28..cc9b14dccb31 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_RT_TESTS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on !BR2_TOOLCHAIN_USES_MUSL # cyclictest
+	depends on BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
+	select BR2_PACKAGE_NUMACTL
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -21,7 +23,7 @@ config BR2_PACKAGE_RT_TESTS
 	  case with uClibc toolchains, since the thread implementation
 	  is configurable).
 
-	  http://rt.wiki.kernel.org
+	  https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/rt-tests
 
 comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_PACKAGE_RT_TESTS
@@ -32,3 +34,4 @@ comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 3.14, dy
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
index 7da6ed2c303c..808041580279 100644
--- a/package/rt-tests/rt-tests.hash
+++ b/package/rt-tests/rt-tests.hash
@@ -1,3 +1,4 @@
+# From https://mirrors.edge.kernel.org/pub/linux/utils/rt-tests/sha256sums.asc
+sha256 bda8f08e13d1022e7de6faf8762b4e831afc4e85f79bdf9c9101f84225b23f53  rt-tests-1.8.tar.xz
 # locally computed hash
-sha256 bcb94448324116f29c248b14a6051c7ab72a0135234e714685a2a3a3e7d531f8  rt-tests-1.6.tar.xz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index abc32f4fb22a..c17b7fe9823c 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -6,13 +6,10 @@
 
 RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
-RT_TESTS_VERSION = 1.6
+RT_TESTS_VERSION = 1.8
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-RT_TESTS_DEPENDENCIES = python3
-endif
+RT_TESTS_DEPENDENCIES = numactl
 
 define RT_TESTS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-- 
2.26.2
