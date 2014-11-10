From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 10 Nov 2014 12:59:06 +0300
Subject: [Buildroot] [PATCH 1/4] rt-tests: rename patch to the new convention
In-Reply-To: <1415613549-2886-1-git-send-email-abrodkin@synopsys.com>
References: <1415613549-2886-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1415613549-2886-2-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As a preparation to the introduction of an additional patch to rt-tests,
let's rename the existing patch to the new naming convention.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rt-tests/01-fix-build-system.patch       |  43 ++++++++++
 package/rt-tests/02-uclibc.patch                 | 103 +++++++++++++++++++++++
 package/rt-tests/rt-tests-fix-build-system.patch |  43 ----------
 package/rt-tests/rt-tests-uclibc.patch           | 103 -----------------------
 4 files changed, 146 insertions(+), 146 deletions(-)
 create mode 100644 package/rt-tests/01-fix-build-system.patch
 create mode 100644 package/rt-tests/02-uclibc.patch
 delete mode 100644 package/rt-tests/rt-tests-fix-build-system.patch
 delete mode 100644 package/rt-tests/rt-tests-uclibc.patch

diff --git a/package/rt-tests/01-fix-build-system.patch b/package/rt-tests/01-fix-build-system.patch
new file mode 100644
index 0000000..9d6aa05
--- /dev/null
+++ b/package/rt-tests/01-fix-build-system.patch
@@ -0,0 +1,43 @@
+Fix various minor issues with rt-tests build system
+
+The issues fixed are :
+
+ * Remove the automatic NUMA detection from the host
+   architecture. This is broken when doing cross-compilation. One can
+   still set NUMA=1 if NUMA support is desired.
+
+ * Expand the CFLAGS provided through the environment instead of
+   overriding it.
+
+ * Provide a HASPYTHON variable to tell whether the target system has
+   Python or not. Otherwise, the build system simply tests whether
+   Python is available on the host. The PYLIB variable is also changed
+   so that it can be overriden from the environment, in order to
+   provide the correct Python module location for the target.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: rt-tests/Makefile
+===================================================================
+--- rt-tests.orig/Makefile
++++ rt-tests/Makefile
+@@ -14,15 +14,11 @@
+ mandir	?= $(prefix)/share/man
+ srcdir	?= $(prefix)/src
+ 
+-machinetype = $(shell uname -m | \
+-    sed -e 's/i.86/i386/' -e 's/mips.*/mips/' -e 's/ppc.*/powerpc/')
+-ifneq ($(filter x86_64 i386 ia64 mips powerpc,$(machinetype)),)
+-NUMA 	:= 1
+-endif
+-
+-CFLAGS = -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
++override CFLAGS += -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
+ 
+-PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
++ifeq ($(HASPYTHON),1)
++PYLIB ?= $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
++endif
+ 
+ ifndef DEBUG
+ 	CFLAGS	+= -O2
diff --git a/package/rt-tests/02-uclibc.patch b/package/rt-tests/02-uclibc.patch
new file mode 100644
index 0000000..b8e1ac5
--- /dev/null
+++ b/package/rt-tests/02-uclibc.patch
@@ -0,0 +1,103 @@
+[PATCH] fix build with uClibc
+
+Fix two build issues with (modern) uClibc:
+- uClibc has clock_nanosleep() if built with UCLIBC_HAS_ADVANCED_REALTIME,
+  conflicting with emulation function
+- uClibc doesn't provide utmpx.h if not built with UCLIBC_HAS_UTMPX, which
+  is included in several files (but not needed).
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/backfire/sendme.c         |    1 -
+ src/cyclictest/cyclictest.c   |    3 ++-
+ src/pmqtest/pmqtest.c         |    1 -
+ src/ptsematest/ptsematest.c   |    1 -
+ src/sigwaittest/sigwaittest.c |    2 --
+ src/svsematest/svsematest.c   |    1 -
+ 6 files changed, 2 insertions(+), 7 deletions(-)
+
+Index: rt-tests-0.83/src/backfire/sendme.c
+===================================================================
+--- rt-tests-0.83.orig/src/backfire/sendme.c
++++ rt-tests-0.83/src/backfire/sendme.c
+@@ -32,7 +32,6 @@
+ #include "rt-utils.h"
+ #include "rt-get_cpu.h"
+ 
+-#include <utmpx.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+Index: rt-tests-0.83/src/cyclictest/cyclictest.c
+===================================================================
+--- rt-tests-0.83.orig/src/cyclictest/cyclictest.c
++++ rt-tests-0.83/src/cyclictest/cyclictest.c
+@@ -23,6 +23,7 @@
+ #include <string.h>
+ #include <time.h>
+ #include <errno.h>
++#include <features.h>
+ #include <limits.h>
+ #include <linux/unistd.h>
+ 
+@@ -53,7 +54,7 @@
+ #define gettid() syscall(__NR_gettid)
+ #define sigev_notify_thread_id _sigev_un._tid
+ 
+-#ifdef __UCLIBC__
++#if defined(__UCLIBC__) && !defined(__UCLIBC_HAS_ADVANCED_REALTIME__)
+ #define MAKE_PROCESS_CPUCLOCK(pid, clock) \
+ 	((~(clockid_t) (pid) << 3) | (clockid_t) (clock))
+ #define CPUCLOCK_SCHED          2
+Index: rt-tests-0.83/src/pmqtest/pmqtest.c
+===================================================================
+--- rt-tests-0.83.orig/src/pmqtest/pmqtest.c
++++ rt-tests-0.83/src/pmqtest/pmqtest.c
+@@ -33,7 +33,6 @@
+ #include <sys/time.h>
+ #include <sys/mman.h>
+ #include <linux/unistd.h>
+-#include <utmpx.h>
+ #include <mqueue.h>
+ #include "rt-utils.h"
+ #include "rt-get_cpu.h"
+Index: rt-tests-0.83/src/ptsematest/ptsematest.c
+===================================================================
+--- rt-tests-0.83.orig/src/ptsematest/ptsematest.c
++++ rt-tests-0.83/src/ptsematest/ptsematest.c
+@@ -33,7 +33,6 @@
+ #include <sys/time.h>
+ #include <sys/mman.h>
+ #include <linux/unistd.h>
+-#include <utmpx.h>
+ #include "rt-utils.h"
+ #include "rt-get_cpu.h"
+ 
+Index: rt-tests-0.83/src/sigwaittest/sigwaittest.c
+===================================================================
+--- rt-tests-0.83.orig/src/sigwaittest/sigwaittest.c
++++ rt-tests-0.83/src/sigwaittest/sigwaittest.c
+@@ -31,11 +31,9 @@
+ #include <signal.h>
+ #include <string.h>
+ #include <time.h>
+-#include <utmpx.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <linux/unistd.h>
+-#include <utmpx.h>
+ #include "rt-utils.h"
+ #include "rt-get_cpu.h"
+ 
+Index: rt-tests-0.83/src/svsematest/svsematest.c
+===================================================================
+--- rt-tests-0.83.orig/src/svsematest/svsematest.c
++++ rt-tests-0.83/src/svsematest/svsematest.c
+@@ -31,7 +31,6 @@
+ #include <sched.h>
+ #include <string.h>
+ #include <time.h>
+-#include <utmpx.h>
+ 
+ #include <linux/unistd.h>
+ 
diff --git a/package/rt-tests/rt-tests-fix-build-system.patch b/package/rt-tests/rt-tests-fix-build-system.patch
deleted file mode 100644
index 9d6aa05..0000000
--- a/package/rt-tests/rt-tests-fix-build-system.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Fix various minor issues with rt-tests build system
-
-The issues fixed are :
-
- * Remove the automatic NUMA detection from the host
-   architecture. This is broken when doing cross-compilation. One can
-   still set NUMA=1 if NUMA support is desired.
-
- * Expand the CFLAGS provided through the environment instead of
-   overriding it.
-
- * Provide a HASPYTHON variable to tell whether the target system has
-   Python or not. Otherwise, the build system simply tests whether
-   Python is available on the host. The PYLIB variable is also changed
-   so that it can be overriden from the environment, in order to
-   provide the correct Python module location for the target.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: rt-tests/Makefile
-===================================================================
---- rt-tests.orig/Makefile
-+++ rt-tests/Makefile
-@@ -14,15 +14,11 @@
- mandir	?= $(prefix)/share/man
- srcdir	?= $(prefix)/src
- 
--machinetype = $(shell uname -m | \
--    sed -e 's/i.86/i386/' -e 's/mips.*/mips/' -e 's/ppc.*/powerpc/')
--ifneq ($(filter x86_64 i386 ia64 mips powerpc,$(machinetype)),)
--NUMA 	:= 1
--endif
--
--CFLAGS = -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
-+override CFLAGS += -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
- 
--PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
-+ifeq ($(HASPYTHON),1)
-+PYLIB ?= $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
-+endif
- 
- ifndef DEBUG
- 	CFLAGS	+= -O2
diff --git a/package/rt-tests/rt-tests-uclibc.patch b/package/rt-tests/rt-tests-uclibc.patch
deleted file mode 100644
index b8e1ac5..0000000
--- a/package/rt-tests/rt-tests-uclibc.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-[PATCH] fix build with uClibc
-
-Fix two build issues with (modern) uClibc:
-- uClibc has clock_nanosleep() if built with UCLIBC_HAS_ADVANCED_REALTIME,
-  conflicting with emulation function
-- uClibc doesn't provide utmpx.h if not built with UCLIBC_HAS_UTMPX, which
-  is included in several files (but not needed).
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/backfire/sendme.c         |    1 -
- src/cyclictest/cyclictest.c   |    3 ++-
- src/pmqtest/pmqtest.c         |    1 -
- src/ptsematest/ptsematest.c   |    1 -
- src/sigwaittest/sigwaittest.c |    2 --
- src/svsematest/svsematest.c   |    1 -
- 6 files changed, 2 insertions(+), 7 deletions(-)
-
-Index: rt-tests-0.83/src/backfire/sendme.c
-===================================================================
---- rt-tests-0.83.orig/src/backfire/sendme.c
-+++ rt-tests-0.83/src/backfire/sendme.c
-@@ -32,7 +32,6 @@
- #include "rt-utils.h"
- #include "rt-get_cpu.h"
- 
--#include <utmpx.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/time.h>
-Index: rt-tests-0.83/src/cyclictest/cyclictest.c
-===================================================================
---- rt-tests-0.83.orig/src/cyclictest/cyclictest.c
-+++ rt-tests-0.83/src/cyclictest/cyclictest.c
-@@ -23,6 +23,7 @@
- #include <string.h>
- #include <time.h>
- #include <errno.h>
-+#include <features.h>
- #include <limits.h>
- #include <linux/unistd.h>
- 
-@@ -53,7 +54,7 @@
- #define gettid() syscall(__NR_gettid)
- #define sigev_notify_thread_id _sigev_un._tid
- 
--#ifdef __UCLIBC__
-+#if defined(__UCLIBC__) && !defined(__UCLIBC_HAS_ADVANCED_REALTIME__)
- #define MAKE_PROCESS_CPUCLOCK(pid, clock) \
- 	((~(clockid_t) (pid) << 3) | (clockid_t) (clock))
- #define CPUCLOCK_SCHED          2
-Index: rt-tests-0.83/src/pmqtest/pmqtest.c
-===================================================================
---- rt-tests-0.83.orig/src/pmqtest/pmqtest.c
-+++ rt-tests-0.83/src/pmqtest/pmqtest.c
-@@ -33,7 +33,6 @@
- #include <sys/time.h>
- #include <sys/mman.h>
- #include <linux/unistd.h>
--#include <utmpx.h>
- #include <mqueue.h>
- #include "rt-utils.h"
- #include "rt-get_cpu.h"
-Index: rt-tests-0.83/src/ptsematest/ptsematest.c
-===================================================================
---- rt-tests-0.83.orig/src/ptsematest/ptsematest.c
-+++ rt-tests-0.83/src/ptsematest/ptsematest.c
-@@ -33,7 +33,6 @@
- #include <sys/time.h>
- #include <sys/mman.h>
- #include <linux/unistd.h>
--#include <utmpx.h>
- #include "rt-utils.h"
- #include "rt-get_cpu.h"
- 
-Index: rt-tests-0.83/src/sigwaittest/sigwaittest.c
-===================================================================
---- rt-tests-0.83.orig/src/sigwaittest/sigwaittest.c
-+++ rt-tests-0.83/src/sigwaittest/sigwaittest.c
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
-Index: rt-tests-0.83/src/svsematest/svsematest.c
-===================================================================
---- rt-tests-0.83.orig/src/svsematest/svsematest.c
-+++ rt-tests-0.83/src/svsematest/svsematest.c
-@@ -31,7 +31,6 @@
- #include <sched.h>
- #include <string.h>
- #include <time.h>
--#include <utmpx.h>
- 
- #include <linux/unistd.h>
- 
-- 
1.9.3
