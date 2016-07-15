From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 14:59:43 +0200
Subject: [Buildroot] [git commit] package/rt-tests: bump to 1.0
Message-ID: <20160715130316.1C38B8222F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57ef8d5c15226e61e2755faf98258abdc825797c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase patch 01 and 02 on v1.0
Remove upstream patches 03 and 04.

Switch to release tarball (.xz) and use BR2_KERNEL_MIRROR

Remove HASPYTHON since it has been removed from patch 01 and clear
PYLIB if PYTHON package is not selected.

Remove NPTL handling since the patch upstreamed by Alexey Brodkin
has been reverted [1]

Add hash file

[1] https://git.kernel.org/cgit/utils/rt-tests/rt-tests.git/commit/?id=6f3c1ba9e8403cff6ca12351c43bde68e0fbca25

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...s-minor-issues-with-rt-tests-build-system.patch |  55 +++++++++++
 .../0002-Fix-a-build-issue-with-uClibc-ng.patch    |  33 +++++++
 package/rt-tests/01-fix-build-system.patch         |  52 ----------
 package/rt-tests/02-uclibc.patch                   | 109 ---------------------
 package/rt-tests/03-fix-non-nptl-buil.patch        |  55 -----------
 .../04-Makefile-fix-tests-dependencies.patch       |  50 ----------
 package/rt-tests/Config.in                         |   6 +-
 package/rt-tests/rt-tests.hash                     |   2 +
 package/rt-tests/rt-tests.mk                       |  15 +--
 9 files changed, 97 insertions(+), 280 deletions(-)

diff --git a/package/rt-tests/0001-Fix-various-minor-issues-with-rt-tests-build-system.patch b/package/rt-tests/0001-Fix-various-minor-issues-with-rt-tests-build-system.patch
new file mode 100644
index 0000000..157514a
--- /dev/null
+++ b/package/rt-tests/0001-Fix-various-minor-issues-with-rt-tests-build-system.patch
@@ -0,0 +1,55 @@
+From eb47c07e9d20e0b1a6cc4b0df26f24f22f024f1c Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Mon, 10 Nov 2014 11:44:55 +0300
+Subject: [PATCH] Fix various minor issues with rt-tests build system
+
+The issues fixed are :
+
+ * Remove the automatic NUMA detection from the host
+   architecture. This is broken when doing cross-compilation. One can
+   still set NUMA=1 if NUMA support is desired.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Cc: Peter Korsgaard <peter@korsgaard.com>
+[Romain:
+    rebase on v1.0
+    Remove HASPYTHON since PYLIB can be overriden from the environment]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ Makefile | 19 -------------------
+ 1 file changed, 19 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a54d82b..0946f93 100644
+--- a/Makefile
++++ b/Makefile
+@@ -38,25 +38,6 @@ else
+ 	CFLAGS	+= -O0 -g
+ endif
+ 
+-# We make some gueses on how to compile rt-tests based on the machine type
+-# and the ostype. These can often be overridden.
+-dumpmachine := $(shell $(CC) -dumpmachine)
+-
+-# The ostype is typically something like linux or android
+-ostype := $(lastword $(subst -, ,$(dumpmachine)))
+-
+-machinetype := $(shell echo $(dumpmachine)| \
+-    sed -e 's/-.*//' -e 's/i.86/i386/' -e 's/mips.*/mips/' -e 's/ppc.*/powerpc/')
+-
+-# The default is to assume you have libnuma installed, which is fine to do
+-# even on non-numa machines. If you don't want to install the numa libs, for
+-# example, they might not be available in an embedded environment, then
+-# compile with
+-# make NUMA=0
+-ifneq ($(filter x86_64 i386 ia64 mips powerpc,$(machinetype)),)
+-NUMA 	:= 1
+-endif
+-
+ # The default is to assume that you have numa_parse_cpustring_all
+ # If you have an older version of libnuma that only has numa_parse_cpustring
+ # then compile with
+-- 
+2.5.5
+
diff --git a/package/rt-tests/0002-Fix-a-build-issue-with-uClibc-ng.patch b/package/rt-tests/0002-Fix-a-build-issue-with-uClibc-ng.patch
new file mode 100644
index 0000000..785d93c
--- /dev/null
+++ b/package/rt-tests/0002-Fix-a-build-issue-with-uClibc-ng.patch
@@ -0,0 +1,33 @@
+From 21e0c16a85c2e028a963703511d750d1751bc254 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Wed, 13 Jul 2016 23:46:38 +0200
+Subject: [PATCH] Fix a build issue with uClibc-ng
+
+uClibc-ng has clock_nanosleep() if built with UCLIBC_HAS_ADVANCED_REALTIME,
+  conflicting with emulation function.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Romain:
+    rebase on v1.0
+    remove uClibc legacy support, uClibc-ng provide utmpx.h]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/cyclictest/cyclictest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cyclictest/cyclictest.c b/src/cyclictest/cyclictest.c
+index 00e5f3d..92fa3dd 100644
+--- a/src/cyclictest/cyclictest.c
++++ b/src/cyclictest/cyclictest.c
+@@ -58,7 +58,7 @@
+ #define gettid() syscall(__NR_gettid)
+ #define sigev_notify_thread_id _sigev_un._tid
+ 
+-#ifdef __UCLIBC__
++#if defined(__UCLIBC__) && !defined(__UCLIBC_HAS_ADVANCED_REALTIME__)
+ #define MAKE_PROCESS_CPUCLOCK(pid, clock) \
+ 	((~(clockid_t) (pid) << 3) | (clockid_t) (clock))
+ #define CPUCLOCK_SCHED          2
+-- 
+2.5.5
+
diff --git a/package/rt-tests/01-fix-build-system.patch b/package/rt-tests/01-fix-build-system.patch
deleted file mode 100644
index 36af747..0000000
--- a/package/rt-tests/01-fix-build-system.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From f9a55a87af57780ea8940561d22cd6a90f461416 Mon Sep 17 00:00:00 2001
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
- * Provide a HASPYTHON variable to tell whether the target system has
-   Python or not. Otherwise, the build system simply tests whether
-   Python is available on the host. The PYLIB variable is also changed
-   so that it can be overriden from the environment, in order to
-   provide the correct Python module location for the target.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-Cc: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile | 10 +++-------
- 1 file changed, 3 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 318a5c6..645d138 100644
---- a/Makefile
-+++ b/Makefile
-@@ -14,17 +14,13 @@ bindir  ?= $(prefix)/bin
- mandir	?= $(prefix)/share/man
- srcdir	?= $(prefix)/src
- 
--machinetype = $(shell $(CC) -dumpmachine | \
--    sed -e 's/-.*//' -e 's/i.86/i386/' -e 's/mips.*/mips/' -e 's/ppc.*/powerpc/')
--ifneq ($(filter x86_64 i386 ia64 mips powerpc,$(machinetype)),)
--NUMA 	:= 1
--endif
--
- CFLAGS ?= -Wall -Wno-nonnull
- CPPFLAGS += -D_GNU_SOURCE -Isrc/include
- LDFLAGS ?=
- 
--PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
-+ifeq ($(HASPYTHON),1)
-+PYLIB ?= $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
-+endif
- 
- ifndef DEBUG
- 	CFLAGS	+= -O2
--- 
-1.9.3
-
diff --git a/package/rt-tests/02-uclibc.patch b/package/rt-tests/02-uclibc.patch
deleted file mode 100644
index 180bdf7..0000000
--- a/package/rt-tests/02-uclibc.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 713224456f4a3242496af803413f670433f27c74 Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Mon, 10 Nov 2014 11:55:27 +0300
-Subject: [PATCH] [PATCH] fix build with uClibc
-
-Fix two build issues with (modern) uClibc:
-- uClibc has clock_nanosleep() if built with UCLIBC_HAS_ADVANCED_REALTIME,
-  conflicting with emulation function
-- uClibc doesn't provide utmpx.h if not built with UCLIBC_HAS_UTMPX, which
-  is included in several files (but not needed).
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/backfire/sendme.c         | 1 -
- src/cyclictest/cyclictest.c   | 3 ++-
- src/pmqtest/pmqtest.c         | 1 -
- src/ptsematest/ptsematest.c   | 1 -
- src/sigwaittest/sigwaittest.c | 2 --
- src/svsematest/svsematest.c   | 1 -
- 6 files changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/src/backfire/sendme.c b/src/backfire/sendme.c
-index 8c169dd..b959951 100644
---- a/src/backfire/sendme.c
-+++ b/src/backfire/sendme.c
-@@ -32,7 +32,6 @@
- #include "rt-utils.h"
- #include "rt-get_cpu.h"
- 
--#include <utmpx.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/time.h>
-diff --git a/src/cyclictest/cyclictest.c b/src/cyclictest/cyclictest.c
-index 4547831..343e421 100644
---- a/src/cyclictest/cyclictest.c
-+++ b/src/cyclictest/cyclictest.c
-@@ -25,6 +25,7 @@
- #include <string.h>
- #include <time.h>
- #include <errno.h>
-+#include <features.h>
- #include <limits.h>
- #include <linux/unistd.h>
- 
-@@ -56,7 +57,7 @@
- #define gettid() syscall(__NR_gettid)
- #define sigev_notify_thread_id _sigev_un._tid
- 
--#ifdef __UCLIBC__
-+#if defined(__UCLIBC__) && !defined(__UCLIBC_HAS_ADVANCED_REALTIME__)
- #define MAKE_PROCESS_CPUCLOCK(pid, clock) \
- 	((~(clockid_t) (pid) << 3) | (clockid_t) (clock))
- #define CPUCLOCK_SCHED          2
-diff --git a/src/pmqtest/pmqtest.c b/src/pmqtest/pmqtest.c
-index 336a8eb..2e34afe 100644
---- a/src/pmqtest/pmqtest.c
-+++ b/src/pmqtest/pmqtest.c
-@@ -33,7 +33,6 @@
- #include <sys/time.h>
- #include <sys/mman.h>
- #include <linux/unistd.h>
--#include <utmpx.h>
- #include <mqueue.h>
- #include "rt-utils.h"
- #include "rt-get_cpu.h"
-diff --git a/src/ptsematest/ptsematest.c b/src/ptsematest/ptsematest.c
-index 7558a41..5358a65 100644
---- a/src/ptsematest/ptsematest.c
-+++ b/src/ptsematest/ptsematest.c
-@@ -33,7 +33,6 @@
- #include <sys/time.h>
- #include <sys/mman.h>
- #include <linux/unistd.h>
--#include <utmpx.h>
- #include "rt-utils.h"
- #include "rt-get_cpu.h"
- #include "error.h"
-diff --git a/src/sigwaittest/sigwaittest.c b/src/sigwaittest/sigwaittest.c
-index 428f5ce..85c32a2 100644
---- a/src/sigwaittest/sigwaittest.c
-+++ b/src/sigwaittest/sigwaittest.c
-@@ -31,11 +31,9 @@
- #include <signal.h>
- #include <string.h>
- #include <time.h>
--#include <utmpx.h>
- #include <sys/types.h>
- #include <sys/time.h>
- #include <linux/unistd.h>
--#include <utmpx.h>
- #include "rt-utils.h"
- #include "rt-get_cpu.h"
- 
-diff --git a/src/svsematest/svsematest.c b/src/svsematest/svsematest.c
-index c1128cc..5d02550 100644
---- a/src/svsematest/svsematest.c
-+++ b/src/svsematest/svsematest.c
-@@ -31,7 +31,6 @@
- #include <sched.h>
- #include <string.h>
- #include <time.h>
--#include <utmpx.h>
- 
- #include <linux/unistd.h>
- 
--- 
-1.9.3
-
diff --git a/package/rt-tests/03-fix-non-nptl-buil.patch b/package/rt-tests/03-fix-non-nptl-buil.patch
deleted file mode 100644
index 5c65018..0000000
--- a/package/rt-tests/03-fix-non-nptl-buil.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From c6920f97be02ca3fba9320b043acd578ce4c62d8 Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Mon, 10 Nov 2014 10:00:13 +0300
-Subject: [PATCH] Makefile: allow building selected tests with non-NPTL
- toolchain
-
-Some architectures are still stuck with non-NPTL toolchains.
-These are for example ARC, Blackfin, Xtensa etc.
-
-Still rt-tests are very good benchmarks and it would be good to enable use of
-at least selected (those that will be built) tests on those architectures.
-
-This change makes it possible to only build subset of tests that don't require
-NPTL calls.
-
-By default behavior is not modified - all tests are built, but if one wants
-to build with non-NPTL toolchain just add "HAVE_NPTL=no" in command line
-or modify "HAVE_NPTL" variable right in Makefile and execute "make".
-
-This patch was submitted upstream:
-https://www.mail-archive.com/linux-kernel at vger.kernel.org/msg762958.html
-so as soon as it is accepted with the next version bump this patch should be
-removed.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-Cc: Vineet Gupta <vgupta@synopsys.com>
-Cc: Clark Williams <clark.williams@gmail.com>
----
- Makefile | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 318a5c6..675edf7 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,8 +1,13 @@
- VERSION_STRING = 0.89
- 
--sources = cyclictest.c signaltest.c pi_stress.c rt-migrate-test.c	\
--	  ptsematest.c sigwaittest.c svsematest.c pmqtest.c sendme.c 	\
--	  pip_stress.c hackbench.c
-+HAVE_NPTL ?= yes
-+
-+ifeq ($(HAVE_NPTL),yes)
-+sources = cyclictest.c pi_stress.c pip_stress.c pmqtest.c rt-migrate-test.c
-+endif
-+
-+sources += signaltest.c ptsematest.c sigwaittest.c svsematest.c sendme.c \
-+	  hackbench.c
- 
- TARGETS = $(sources:.c=)
- 
--- 
-1.9.3
-
diff --git a/package/rt-tests/04-Makefile-fix-tests-dependencies.patch b/package/rt-tests/04-Makefile-fix-tests-dependencies.patch
deleted file mode 100644
index 0b2feb1..0000000
--- a/package/rt-tests/04-Makefile-fix-tests-dependencies.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From e464368807211978fe2dfccf081fa8dc7a35b71b Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 23 Jan 2015 07:52:21 +0200
-Subject: [PATCH] Makefile: fix tests dependencies
-
-librttest is listed in $(LIBS) so all tests must depend on librttest.a.
-Fixes build failures like:
-
-.../armv7-ctng-linux-gnueabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os -g2  -o hackbench hackbench.o -lrt -lpthread -lrttest -L.
-.../armv7-ctng-linux-gnueabihf/bin/ld: cannot find -lrttest
-collect2: error: ld returned 1 exit status
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index a3879cea8164..b9a1fed1b920 100644
---- a/Makefile
-+++ b/Makefile
-@@ -69,14 +69,14 @@ cyclictest: cyclictest.o librttest.a
- signaltest: signaltest.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
--pi_stress: pi_stress.o
-+pi_stress: pi_stress.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- hwlatdetect:  src/hwlatdetect/hwlatdetect.py
- 	chmod +x src/hwlatdetect/hwlatdetect.py
- 	ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
- 
--rt-migrate-test: rt-migrate-test.o
-+rt-migrate-test: rt-migrate-test.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- ptsematest: ptsematest.o librttest.a
-@@ -97,7 +97,7 @@ sendme: sendme.o librttest.a
- pip_stress: pip_stress.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
--hackbench: hackbench.o
-+hackbench: hackbench.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- librttest.a: rt-utils.o error.o rt-get_cpu.o
--- 
-2.1.4
-
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 96e0bad..12e084e 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	help
@@ -27,6 +27,6 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
-comment "rt-tests needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "rt-tests needs a toolchain w/ NPTL, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
new file mode 100644
index 0000000..f37af43
--- /dev/null
+++ b/package/rt-tests/rt-tests.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 aea85fd8eda8c1d96e9d32a019bfd4a1d2e0d362971d97838996f49d1af2d470  rt-tests-1.0.tar.xz
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 380bacf..19f1021 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-RT_TESTS_SITE = git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git
-RT_TESTS_VERSION = v0.89
+RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
+RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
+RT_TESTS_VERSION = 1.0
 RT_TESTS_LICENSE = GPLv2+
 RT_TESTS_LICENSE_FILES = COPYING
 
@@ -13,26 +14,18 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 RT_TESTS_DEPENDENCIES = python
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
-RT_TESTS_HAVE_NPTL=yes
-else
-RT_TESTS_HAVE_NPTL=no
-endif
-
 define RT_TESTS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
 		CC="$(TARGET_CC)" 		\
-		HAVE_NPTL=$(RT_TESTS_HAVE_NPTL)	\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		prefix=/usr
 endef
 
 define RT_TESTS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) 				\
-		HAVE_NPTL=$(RT_TESTS_HAVE_NPTL)		\
 		DESTDIR="$(TARGET_DIR)" 		\
 		prefix=/usr 				\
-		$(if $(BR2_PACKAGE_PYTHON),HASPYTHON=1 PYLIB=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/) \
+		$(if $(BR2_PACKAGE_PYTHON),PYLIB=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/,PYLIB="") \
 		install
 endef
 
