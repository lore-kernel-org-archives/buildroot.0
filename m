From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 Jan 2012 09:15:17 +0100
Subject: [Buildroot] [git commit] rt-tests: fix build issues on uClibc
Message-ID: <20120103081557.AAC7B8FFCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5528286147492aafa8740c09db63290042b79cb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rt-tests/rt-tests-uclibc.patch |  103 ++++++++++++++++++++++++++++++++
 1 files changed, 103 insertions(+), 0 deletions(-)

diff --git a/package/rt-tests/rt-tests-uclibc.patch b/package/rt-tests/rt-tests-uclibc.patch
new file mode 100644
index 0000000..b8e1ac5
--- /dev/null
+++ b/package/rt-tests/rt-tests-uclibc.patch
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
