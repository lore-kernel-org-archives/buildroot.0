From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 15 May 2020 16:53:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump to version
 20200515
Message-ID: <20200515145344.13370-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update list of tests incompatible with musl.
Removed patch backported from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...64-unsafe-syscalls-before-using-them.patch | 123 ------------------
 package/ltp-testsuite/ltp-testsuite.hash      |   4 +-
 package/ltp-testsuite/ltp-testsuite.mk        |  10 +-
 3 files changed, 3 insertions(+), 134 deletions(-)
 delete mode 100644 package/ltp-testsuite/0001-syscalls-Check-for-time64-unsafe-syscalls-before-using-them.patch

diff --git a/package/ltp-testsuite/0001-syscalls-Check-for-time64-unsafe-syscalls-before-using-them.patch b/package/ltp-testsuite/0001-syscalls-Check-for-time64-unsafe-syscalls-before-using-them.patch
deleted file mode 100644
index e447dd5182..0000000000
--- a/package/ltp-testsuite/0001-syscalls-Check-for-time64-unsafe-syscalls-before-using-them.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 5b57ae2913e2d2d167cbd3822784b4c4ba336812 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 Feb 2020 22:52:04 -0800
-Subject: [PATCH] syscalls: Check for time64 unsafe syscalls before using them
-
-musl is using 64bit time_t now on 32bit architectures and these syscalls
-no longer exist, therefore its better to check for them being available
-before using them
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/linux-test-project/ltp/commit/5b57ae2913e2d2d167cbd3822784b4c4ba336812]
----
- lib/tst_clocks.c                                 | 16 ++++++----------
- .../syscalls/gettimeofday/gettimeofday01.c       |  6 ++----
- .../syscalls/gettimeofday/gettimeofday02.c       |  8 +++-----
- 3 files changed, 11 insertions(+), 19 deletions(-)
-
-diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
-index 5195da38f3..fa2f1cb842 100644
---- a/lib/tst_clocks.c
-+++ b/lib/tst_clocks.c
-@@ -3,28 +3,24 @@
-  * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
-  */
- 
--/*
-- * clock_gettime() and clock_getres() functions
-- */
--
--#define _GNU_SOURCE
--#include <unistd.h>
- #include <time.h>
--#include <sys/syscall.h>
- 
-+#define TST_NO_DEFAULT_MAIN
-+#include "tst_test.h"
- #include "tst_clocks.h"
-+#include "lapi/syscalls.h"
- 
- int tst_clock_getres(clockid_t clk_id, struct timespec *res)
- {
--	return syscall(SYS_clock_getres, clk_id, res);
-+	return tst_syscall(__NR_clock_getres, clk_id, res);
- }
- 
- int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
- {
--	return syscall(SYS_clock_gettime, clk_id, ts);
-+	return tst_syscall(__NR_clock_gettime, clk_id, ts);
- }
- 
- int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
- {
--	return syscall(SYS_clock_settime, clk_id, ts);
-+	return tst_syscall(__NR_clock_settime, clk_id, ts);
- }
-diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
-index 583d8f7b9b..08ea1673ad 100644
---- a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
-+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
-@@ -38,10 +38,8 @@
- #include <sys/time.h>
- #include <errno.h>
- #include "test.h"
--#include <sys/syscall.h>
- #include <unistd.h>
--
--#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
-+#include "lapi/syscalls.h"
- 
- char *TCID = "gettimeofday01";
- int TST_TOTAL = 1;
-@@ -63,7 +61,7 @@ int main(int ac, char **av)
- 	for (lc = 0; TEST_LOOPING(lc); lc++) {
- 		tst_count = 0;
- 
--		TEST(gettimeofday((void *)-1, (void *)-1));
-+		TEST(ltp_syscall(__NR_gettimeofday, (void *)-1, (void *)-1));
- 
- 		/* gettimeofday returns an int, so we need to turn the long
- 		 * TEST_RETURN into an int to test with */
-diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
-index 1d60f448e8..5170ad2f78 100644
---- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
-+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
-@@ -16,14 +16,12 @@
- #include <stdint.h>
- #include <sys/time.h>
- #include <stdlib.h>
--#include <sys/syscall.h>
- #include <unistd.h>
- #include <time.h>
- #include <errno.h>
- 
- #include "tst_test.h"
--
--#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
-+#include "lapi/syscalls.h"
- 
- static volatile sig_atomic_t done;
- static char *str_rtime;
-@@ -48,13 +46,13 @@ static void verify_gettimeofday(void)
- 
- 	alarm(rtime);
- 
--	if (gettimeofday(&tv1, NULL)) {
-+	if (tst_syscall(__NR_gettimeofday, &tv1, NULL)) {
- 		tst_res(TBROK | TERRNO, "gettimeofday() failed");
- 		return;
- 	}
- 
- 	while (!done) {
--		if (gettimeofday(&tv2, NULL)) {
-+		if (tst_syscall(__NR_gettimeofday, &tv2, NULL)) {
- 			tst_res(TBROK | TERRNO, "gettimeofday() failed");
- 			return;
- 		}
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 4f373c0ce4..eb349e2929 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20200120/ltp-full-20200120.tar.xz.sha1
-sha1 8f622383907e2e64e60b69fd305fecb34311d6b6  ltp-full-20200120.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20200515/ltp-full-20200515.tar.xz.sha1
+sha1 7b3932b46295328c64d6f235bc54fa68806b9ede  ltp-full-20200515.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 88b2e88293..4cee77bcd0 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20200120
+LTP_TESTSUITE_VERSION = 20200515
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
@@ -69,23 +69,15 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
 	testcases/misc/math/float/float_bessel.c
 else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
-	testcases/kernel/pty/pty01.c \
-	testcases/kernel/pty/pty02.c \
-	testcases/kernel/pty/ptem01.c \
 	testcases/kernel/sched/process_stress/process.c \
-	testcases/kernel/syscalls/accept4/accept4_01.c \
 	testcases/kernel/syscalls/confstr/confstr01.c \
 	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
 	testcases/kernel/syscalls/getcontext/getcontext01.c \
 	testcases/kernel/syscalls/getdents/getdents01.c \
 	testcases/kernel/syscalls/getdents/getdents02.c \
-	testcases/kernel/syscalls/ioctl/ioctl01.c \
-	testcases/kernel/syscalls/ioctl/ioctl02.c \
 	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
-	testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c \
 	testcases/kernel/syscalls/timer_create/timer_create01.c \
 	testcases/kernel/syscalls/timer_create/timer_create03.c \
-	testcases/misc/crash/crash01.c \
 	utils/benchmark/ebizzy-0.3
 endif
 
-- 
2.26.2
