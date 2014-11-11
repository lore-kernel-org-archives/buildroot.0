From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 15:41:12 +0100
Subject: [Buildroot] [git commit] rt-tests: bump version to 0.89
Message-ID: <20141111144147.6778DB40EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59ad1942772fac90deecaed0b77fce739a4d0d73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this change we're moving to the latest version of rt-tests.

Existing patches were updated so they apply on sources without errors and
warnings.

In "01-fix-build-system.patch" CFLAGS substitution was removed because
now external CFLAGS are accepted:
http://git.kernel.org/cgit/linux/kernel/git/clrkwllms/rt-tests.git/commit/?id=dfcef6e557b7980a33aa30b45bde196ed1780eb1

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rt-tests/01-fix-build-system.patch |   35 ++++++++-----
 package/rt-tests/02-uclibc.patch           |   76 +++++++++++++++-------------
 package/rt-tests/rt-tests.mk               |    2 +-
 3 files changed, 64 insertions(+), 49 deletions(-)

diff --git a/package/rt-tests/01-fix-build-system.patch b/package/rt-tests/01-fix-build-system.patch
index 9d6aa05..36af747 100644
--- a/package/rt-tests/01-fix-build-system.patch
+++ b/package/rt-tests/01-fix-build-system.patch
@@ -1,4 +1,7 @@
-Fix various minor issues with rt-tests build system
+From f9a55a87af57780ea8940561d22cd6a90f461416 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Mon, 10 Nov 2014 11:44:55 +0300
+Subject: [PATCH] Fix various minor issues with rt-tests build system
 
 The issues fixed are :
 
@@ -6,9 +9,6 @@ The issues fixed are :
    architecture. This is broken when doing cross-compilation. One can
    still set NUMA=1 if NUMA support is desired.
 
- * Expand the CFLAGS provided through the environment instead of
-   overriding it.
-
  * Provide a HASPYTHON variable to tell whether the target system has
    Python or not. Otherwise, the build system simply tests whether
    Python is available on the host. The PYLIB variable is also changed
@@ -16,23 +16,29 @@ The issues fixed are :
    provide the correct Python module location for the target.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Cc: Peter Korsgaard <peter@korsgaard.com>
+---
+ Makefile | 10 +++-------
+ 1 file changed, 3 insertions(+), 7 deletions(-)
 
-Index: rt-tests/Makefile
-===================================================================
---- rt-tests.orig/Makefile
-+++ rt-tests/Makefile
-@@ -14,15 +14,11 @@
+diff --git a/Makefile b/Makefile
+index 318a5c6..645d138 100644
+--- a/Makefile
++++ b/Makefile
+@@ -14,17 +14,13 @@ bindir  ?= $(prefix)/bin
  mandir	?= $(prefix)/share/man
  srcdir	?= $(prefix)/src
  
--machinetype = $(shell uname -m | \
--    sed -e 's/i.86/i386/' -e 's/mips.*/mips/' -e 's/ppc.*/powerpc/')
+-machinetype = $(shell $(CC) -dumpmachine | \
+-    sed -e 's/-.*//' -e 's/i.86/i386/' -e 's/mips.*/mips/' -e 's/ppc.*/powerpc/')
 -ifneq ($(filter x86_64 i386 ia64 mips powerpc,$(machinetype)),)
 -NUMA 	:= 1
 -endif
 -
--CFLAGS = -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
-+override CFLAGS += -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
+ CFLAGS ?= -Wall -Wno-nonnull
+ CPPFLAGS += -D_GNU_SOURCE -Isrc/include
+ LDFLAGS ?=
  
 -PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
 +ifeq ($(HASPYTHON),1)
@@ -41,3 +47,6 @@ Index: rt-tests/Makefile
  
  ifndef DEBUG
  	CFLAGS	+= -O2
+-- 
+1.9.3
+
diff --git a/package/rt-tests/02-uclibc.patch b/package/rt-tests/02-uclibc.patch
index b8e1ac5..180bdf7 100644
--- a/package/rt-tests/02-uclibc.patch
+++ b/package/rt-tests/02-uclibc.patch
@@ -1,4 +1,7 @@
-[PATCH] fix build with uClibc
+From 713224456f4a3242496af803413f670433f27c74 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Mon, 10 Nov 2014 11:55:27 +0300
+Subject: [PATCH] [PATCH] fix build with uClibc
 
 Fix two build issues with (modern) uClibc:
 - uClibc has clock_nanosleep() if built with UCLIBC_HAS_ADVANCED_REALTIME,
@@ -6,20 +9,20 @@ Fix two build issues with (modern) uClibc:
 - uClibc doesn't provide utmpx.h if not built with UCLIBC_HAS_UTMPX, which
   is included in several files (but not needed).
 
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
- src/backfire/sendme.c         |    1 -
- src/cyclictest/cyclictest.c   |    3 ++-
- src/pmqtest/pmqtest.c         |    1 -
- src/ptsematest/ptsematest.c   |    1 -
- src/sigwaittest/sigwaittest.c |    2 --
- src/svsematest/svsematest.c   |    1 -
+ src/backfire/sendme.c         | 1 -
+ src/cyclictest/cyclictest.c   | 3 ++-
+ src/pmqtest/pmqtest.c         | 1 -
+ src/ptsematest/ptsematest.c   | 1 -
+ src/sigwaittest/sigwaittest.c | 2 --
+ src/svsematest/svsematest.c   | 1 -
  6 files changed, 2 insertions(+), 7 deletions(-)
 
-Index: rt-tests-0.83/src/backfire/sendme.c
-===================================================================
---- rt-tests-0.83.orig/src/backfire/sendme.c
-+++ rt-tests-0.83/src/backfire/sendme.c
+diff --git a/src/backfire/sendme.c b/src/backfire/sendme.c
+index 8c169dd..b959951 100644
+--- a/src/backfire/sendme.c
++++ b/src/backfire/sendme.c
 @@ -32,7 +32,6 @@
  #include "rt-utils.h"
  #include "rt-get_cpu.h"
@@ -28,11 +31,11 @@ Index: rt-tests-0.83/src/backfire/sendme.c
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <sys/time.h>
-Index: rt-tests-0.83/src/cyclictest/cyclictest.c
-===================================================================
---- rt-tests-0.83.orig/src/cyclictest/cyclictest.c
-+++ rt-tests-0.83/src/cyclictest/cyclictest.c
-@@ -23,6 +23,7 @@
+diff --git a/src/cyclictest/cyclictest.c b/src/cyclictest/cyclictest.c
+index 4547831..343e421 100644
+--- a/src/cyclictest/cyclictest.c
++++ b/src/cyclictest/cyclictest.c
+@@ -25,6 +25,7 @@
  #include <string.h>
  #include <time.h>
  #include <errno.h>
@@ -40,7 +43,7 @@ Index: rt-tests-0.83/src/cyclictest/cyclictest.c
  #include <limits.h>
  #include <linux/unistd.h>
  
-@@ -53,7 +54,7 @@
+@@ -56,7 +57,7 @@
  #define gettid() syscall(__NR_gettid)
  #define sigev_notify_thread_id _sigev_un._tid
  
@@ -49,10 +52,10 @@ Index: rt-tests-0.83/src/cyclictest/cyclictest.c
  #define MAKE_PROCESS_CPUCLOCK(pid, clock) \
  	((~(clockid_t) (pid) << 3) | (clockid_t) (clock))
  #define CPUCLOCK_SCHED          2
-Index: rt-tests-0.83/src/pmqtest/pmqtest.c
-===================================================================
---- rt-tests-0.83.orig/src/pmqtest/pmqtest.c
-+++ rt-tests-0.83/src/pmqtest/pmqtest.c
+diff --git a/src/pmqtest/pmqtest.c b/src/pmqtest/pmqtest.c
+index 336a8eb..2e34afe 100644
+--- a/src/pmqtest/pmqtest.c
++++ b/src/pmqtest/pmqtest.c
 @@ -33,7 +33,6 @@
  #include <sys/time.h>
  #include <sys/mman.h>
@@ -61,10 +64,10 @@ Index: rt-tests-0.83/src/pmqtest/pmqtest.c
  #include <mqueue.h>
  #include "rt-utils.h"
  #include "rt-get_cpu.h"
-Index: rt-tests-0.83/src/ptsematest/ptsematest.c
-===================================================================
---- rt-tests-0.83.orig/src/ptsematest/ptsematest.c
-+++ rt-tests-0.83/src/ptsematest/ptsematest.c
+diff --git a/src/ptsematest/ptsematest.c b/src/ptsematest/ptsematest.c
+index 7558a41..5358a65 100644
+--- a/src/ptsematest/ptsematest.c
++++ b/src/ptsematest/ptsematest.c
 @@ -33,7 +33,6 @@
  #include <sys/time.h>
  #include <sys/mman.h>
@@ -72,11 +75,11 @@ Index: rt-tests-0.83/src/ptsematest/ptsematest.c
 -#include <utmpx.h>
  #include "rt-utils.h"
  #include "rt-get_cpu.h"
- 
-Index: rt-tests-0.83/src/sigwaittest/sigwaittest.c
-===================================================================
---- rt-tests-0.83.orig/src/sigwaittest/sigwaittest.c
-+++ rt-tests-0.83/src/sigwaittest/sigwaittest.c
+ #include "error.h"
+diff --git a/src/sigwaittest/sigwaittest.c b/src/sigwaittest/sigwaittest.c
+index 428f5ce..85c32a2 100644
+--- a/src/sigwaittest/sigwaittest.c
++++ b/src/sigwaittest/sigwaittest.c
 @@ -31,11 +31,9 @@
  #include <signal.h>
  #include <string.h>
@@ -89,10 +92,10 @@ Index: rt-tests-0.83/src/sigwaittest/sigwaittest.c
  #include "rt-utils.h"
  #include "rt-get_cpu.h"
  
-Index: rt-tests-0.83/src/svsematest/svsematest.c
-===================================================================
---- rt-tests-0.83.orig/src/svsematest/svsematest.c
-+++ rt-tests-0.83/src/svsematest/svsematest.c
+diff --git a/src/svsematest/svsematest.c b/src/svsematest/svsematest.c
+index c1128cc..5d02550 100644
+--- a/src/svsematest/svsematest.c
++++ b/src/svsematest/svsematest.c
 @@ -31,7 +31,6 @@
  #include <sched.h>
  #include <string.h>
@@ -101,3 +104,6 @@ Index: rt-tests-0.83/src/svsematest/svsematest.c
  
  #include <linux/unistd.h>
  
+-- 
+1.9.3
+
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index caa4d35..e0c7748 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RT_TESTS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git
-RT_TESTS_VERSION = v0.83
+RT_TESTS_VERSION = v0.89
 RT_TESTS_LICENSE = GPLv2+
 RT_TESTS_LICENSE_FILES = COPYING
 
