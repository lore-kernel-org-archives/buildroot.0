From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 20:07:03 +0100
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump version to
 20210121
Message-ID: <20210122184901.700597FF0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84968aa4954b308ed67adde305e0fc5c801edc9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add --disable-metadata configure option. Buildroot by default disable
packages' doc generation.  Also generating LTP metadata documentation
would require have host package, which could be complicated since the
LTP build system is autoconf but not automake based.

Drop cacheflush01 patch (from this release) and rebase musl workaround
patch.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-cacheflush01-Rewrite-into-new-API.patch   | 225 ---------------------
 ...Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch |  53 +++--
 package/ltp-testsuite/ltp-testsuite.hash           |   4 +-
 package/ltp-testsuite/ltp-testsuite.mk             |   6 +-
 4 files changed, 32 insertions(+), 256 deletions(-)

diff --git a/package/ltp-testsuite/0001-cacheflush01-Rewrite-into-new-API.patch b/package/ltp-testsuite/0001-cacheflush01-Rewrite-into-new-API.patch
deleted file mode 100644
index f9815624b9..0000000000
--- a/package/ltp-testsuite/0001-cacheflush01-Rewrite-into-new-API.patch
+++ /dev/null
@@ -1,225 +0,0 @@
-From 48edd768850825a4d01e5e5e737122333fc55cdf Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Fri, 2 Oct 2020 21:29:58 +0200
-Subject: [PATCH] cacheflush01: Rewrite into new API
-
-This syscall is currently (v5.9) supported on these architectures:
-arc, csky, mips, m68k, nds32, sh
-
-constants are missing for m68k, not sure if the testcase is valid for it.
-Untested.
-
-Test for __LTP__NR_INVALID_SYSCALL saves adding autotools check for
-<asm/cachectl.h>.
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
-[ upstream status: https://patchwork.ozlabs.org/project/ltp/patch/20201002202416.28972-1-petr.vorel at gmail.com/ ]
- .../kernel/syscalls/cacheflush/cacheflush01.c | 173 ++++--------------
- 1 file changed, 40 insertions(+), 133 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/cacheflush/cacheflush01.c b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
-index 29cf2014a..6ad8b953a 100644
---- a/testcases/kernel/syscalls/cacheflush/cacheflush01.c
-+++ b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
-@@ -1,157 +1,64 @@
--/******************************************************************************/
--/* Copyright (c) Maxin John <maxin.john@gmail.com>, 2009                      */
--/* LKML Reference: http://lkml.org/lkml/2009/4/9/203                          */
--/* This program is free software;  you can redistribute it and/or modify      */
--/* it under the terms of the GNU General Public License as published by       */
--/* the Free Software Foundation; either version 2 of the License, or          */
--/* (at your option) any later version.                                        */
--/*                                                                            */
--/* This program is distributed in the hope that it will be useful,            */
--/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
--/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
--/* the GNU General Public License for more details.                           */
--/*                                                                            */
--/* You should have received a copy of the GNU General Public License          */
--/* along with this program;  if not, write to the Free Software               */
--/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
--/*                                                                            */
--/******************************************************************************/
--/******************************************************************************/
--/*                                                                            */
--/* File:        cacheflush01.c                                                */
--/*                                                                            */
--/* Description: The cacheflush_check() syscall                     	      */
--/*		Tests EINVAL error of cacheflush system call.		      */
--/* 		Its expected behaviour is cacheflush() should return -EINVAL  */
--/*		when cache parameter is not one of ICACHE, DCACHE, or BCACHE. */
--/*                                                                            */
--/* Usage:  <for command-line>                                                 */
--/* cacheflush01 [-c n] [-e][-i n] [-I x] [-p x] [-t]                          */
--/*      where,  -c n : Run n copies concurrently.                             */
--/*              -e   : Turn on errno logging.                                 */
--/*              -i n : Execute test n times.                                  */
--/*              -I x : Execute test for x seconds.                            */
--/*              -P x : Pause for x seconds between iterations.                */
--/*              -t   : Turn on syscall timing.                                */
--/*                                                                            */
--/* Total Tests: 1                                                             */
--/*                                                                            */
--/* Test Name:   cacheflush01                                                  */
--/******************************************************************************/
-+// SPDX-License-Identifier: GPL-2.0-or-later
- 
--#include <unistd.h>
--#include <stdio.h>
--#include <stdlib.h>
--#include <errno.h>
--
--#include "test.h"
-+#include "tst_test.h"
- #include "lapi/syscalls.h"
- 
- #if __NR_cacheflush != __LTP__NR_INVALID_SYSCALL
-+
- #include <asm/cachectl.h>
--#else
-+
-+/*
-+ * m68k does not have these constants
-+ */
-+
- #ifndef   ICACHE
--#define   ICACHE   (1<<0)	/* flush instruction cache        */
-+# define   ICACHE   (1<<0)
- #endif
-+
- #ifndef   DCACHE
--#define   DCACHE   (1<<1)	/* writeback and flush data cache */
-+# define   DCACHE   (1<<1)
- #endif
-+
- #ifndef   BCACHE
--#define   BCACHE   (ICACHE|DCACHE)	/* flush both caches              */
--#endif
-+# define   BCACHE   (ICACHE|DCACHE)
- #endif
- 
--char *TCID = "cacheflush01";
--int TST_TOTAL = 1;
-+#define CACHE_DESC(x) .cache = x, .desc = #x
- 
--/* Extern Global Functions */
--/******************************************************************************/
--/*                                                                            */
--/* Function:    cleanup                                                       */
--/*                                                                            */
--/* Description: Performs all one time clean up for this test on successful    */
--/*              completion,  premature exit or  failure. Closes all temporary */
--/*              files, removes all temporary directories exits the test with  */
--/*              appropriate return code by calling tst_exit() function.       */
--/*                                                                            */
--/* Input:       None.                                                         */
--/*                                                                            */
--/* Output:      None.                                                         */
--/*                                                                            */
--/* Return:      On failure - Exits calling tst_exit(). Non '0' return code.   */
--/*              On success - Exits calling tst_exit(). With '0' return code.  */
--/*                                                                            */
--/******************************************************************************/
--void cleanup(void)
--{
-+static struct test_case_t {
-+	int cache;
-+	const char *desc;
-+} test_cases[] = {
-+	{ CACHE_DESC(ICACHE) },
-+	{ CACHE_DESC(DCACHE) },
-+	{ CACHE_DESC(BCACHE) },
-+};
- 
--	tst_rmdir();
--}
-+static char *addr;
- 
--/* Local  Functions */
--/******************************************************************************/
--/*                                                                            */
--/* Function:    setup                                                         */
--/*                                                                            */
--/* Description: Performs all one time setup for this test. This function is   */
--/*              typically used to capture signals, create temporary dirs      */
--/*              and temporary files that may be used in the course of this    */
--/*              test.                                                         */
--/*                                                                            */
--/* Input:       None.                                                         */
--/*                                                                            */
--/* Output:      None.                                                         */
--/*                                                                            */
--/* Return:      On failure - Exits by calling cleanup().                      */
--/*              On success - returns 0.                                       */
--/*                                                                            */
--/******************************************************************************/
--void setup(void)
-+static void setup(void)
- {
--	/* Capture signals if any */
--	/* Create temporary directories */
--	TEST_PAUSE;
--	tst_tmpdir();
-+	addr = SAFE_MALLOC(getpagesize());
- }
- 
--int main(int ac, char **av)
-+static void test_cacheflush(unsigned int i)
- {
-+	struct test_case_t *tc = &test_cases[i];
- 
--	char *addr = NULL;
--
--	tst_parse_opts(ac, av, NULL, NULL);
--
--	setup();
--
--	tst_count = 0;
--	/* Create some user address range */
--	addr = malloc(getpagesize());
--	if (addr == NULL) {
--		tst_brkm(TFAIL | TTERRNO, cleanup, "malloc failed");
--	}
--
--	/* Invokes cacheflush() with proper parameters */
--	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), ICACHE));
--	if (TEST_RETURN == 0) {
--		tst_resm(TPASS, "passed with no errno");
--	} else {
--		tst_resm(TFAIL, "failed with unexpected errno");
--	}
--
--	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), DCACHE));
--	if (TEST_RETURN == 0) {
--		tst_resm(TPASS, "passed with no errno");
-+	TEST(tst_syscall(__NR_cacheflush, addr, getpagesize(), tc->cache));
-+	if (TST_RET == 0) {
-+		tst_res(TPASS, "%s passed", tc->desc);
- 	} else {
--		tst_resm(TFAIL, "failed with unexpected errno");
-+		tst_res(TFAIL | TTERRNO, "%s failed", tc->desc);
- 	}
-+}
- 
--	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), BCACHE));
--	if (TEST_RETURN == 0) {
--		tst_resm(TPASS, "passed with no errno");
--	} else {
--		tst_resm(TFAIL, "failed with unexpected errno");
--	}
-+static struct tst_test test = {
-+	.setup = setup,
-+	.test = test_cacheflush,
-+	.tcnt = ARRAY_SIZE(test_cases),
-+};
- 
--	cleanup();
--	tst_exit();
--}
-+#else
-+	TST_TEST_TCONF("system doesn't support cacheflush()");
-+#endif
--- 
-2.28.0
-
diff --git a/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch b/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
index 29a986cbab..2893026c03 100644
--- a/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
+++ b/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
@@ -78,7 +78,7 @@ index 000000000..d0e0e93d7
 +
 +#endif /* SYSINFO_H__ */
 diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
-index 053c3bcf9..61ea2076d 100644
+index ee3df4142..3cb1623f9 100644
 --- a/include/tst_safe_macros.h
 +++ b/include/tst_safe_macros.h
 @@ -12,7 +12,7 @@
@@ -91,7 +91,7 @@ index 053c3bcf9..61ea2076d 100644
  #include <libgen.h>
  #include <signal.h>
 diff --git a/lib/safe_macros.c b/lib/safe_macros.c
-index 4f48d7529..d8ee03dae 100644
+index a5b6bc504..20d01d304 100644
 --- a/lib/safe_macros.c
 +++ b/lib/safe_macros.c
 @@ -11,7 +11,6 @@
@@ -107,33 +107,33 @@ index 4f48d7529..d8ee03dae 100644
  #include "test.h"
  #include "safe_macros.h"
 +#include "lapi/sysinfo.h"
-
+ 
  char *safe_basename(const char *file, const int lineno,
  		    void (*cleanup_fn) (void), char *path)
 diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
-index f134d90c9..647db951e 100644
+index dd09db490..085392365 100644
 --- a/lib/tst_memutils.c
 +++ b/lib/tst_memutils.c
 @@ -5,11 +5,11 @@
-
+ 
  #include <unistd.h>
  #include <limits.h>
 -#include <sys/sysinfo.h>
  #include <stdlib.h>
-
+ 
  #define TST_NO_DEFAULT_MAIN
  #include "tst_test.h"
 +#include "lapi/sysinfo.h"
-
+ 
  #define BLOCKSIZE (16 * 1024 * 1024)
-
+ 
 diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
-index f08d3943f..9b4d856f8 100644
+index 9676ea4b5..33b2ac822 100644
 --- a/testcases/kernel/mem/mtest01/mtest01.c
 +++ b/testcases/kernel/mem/mtest01/mtest01.c
 @@ -20,7 +20,6 @@
   */
-
+ 
  #include <sys/types.h>
 -#include <sys/sysinfo.h>
  #include <sys/wait.h>
@@ -141,26 +141,25 @@ index f08d3943f..9b4d856f8 100644
  #include <signal.h>
 @@ -29,6 +28,7 @@
  #include <unistd.h>
-
+ 
  #include "lapi/abisize.h"
 +#include "lapi/sysinfo.h"
  #include "tst_test.h"
-
+ 
  #define FIVE_HUNDRED_MB         (500ULL*1024*1024)
 diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
-index f76f3f6aa..b2613670b 100644
+index 962554163..aa4d3bc91 100644
 --- a/testcases/kernel/syscalls/madvise/madvise06.c
 +++ b/testcases/kernel/syscalls/madvise/madvise06.c
-@@ -24,8 +24,8 @@
+@@ -41,7 +41,7 @@
  #include <errno.h>
  #include <stdio.h>
  #include <sys/mount.h>
 -#include <sys/sysinfo.h>
- #include "tst_test.h"
 +#include "lapi/sysinfo.h"
-
+ #include "tst_test.h"
+ 
  #define CHUNK_SZ (400*1024*1024L)
- #define CHUNK_PAGES (CHUNK_SZ / pg_sz)
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo01.c b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
 index 2ea44a2be..a95066bf5 100644
 --- a/testcases/kernel/syscalls/sysinfo/sysinfo01.c
@@ -170,10 +169,10 @@ index 2ea44a2be..a95066bf5 100644
  #include <sys/stat.h>
  #include <sys/signal.h>
 -#include <sys/sysinfo.h>
-
+ 
  #include "test.h"
 +#include "lapi/sysinfo.h"
-
+ 
  void setup();
  void cleanup();
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo02.c b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
@@ -186,27 +185,27 @@ index 678b8f1d3..5ce65d20e 100644
  #include <sys/signal.h>
 -#include <sys/sysinfo.h>
  #include <stdint.h>
-
+ 
  #include "test.h"
 +#include "lapi/sysinfo.h"
-
+ 
  #define INVALID_ADDRESS ((uintptr_t)-1)
-
+ 
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
 index af7cb6421..3b61a05b1 100644
 --- a/testcases/kernel/syscalls/sysinfo/sysinfo03.c
 +++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
 @@ -13,9 +13,9 @@
-
+ 
   */
-
+ 
 -#include <sys/sysinfo.h>
  #include "lapi/namespaces_constants.h"
  #include "lapi/posix_clocks.h"
 +#include "lapi/sysinfo.h"
  #include "tst_test.h"
-
+ 
  static int offsets[] = {
---
-2.28.0
+-- 
+2.30.0
 
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 9dce0405df..f0b2c89704 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20200930/ltp-full-20200930.tar.xz.sha1
-sha1 f380c7afe71e03eabb1de668c0399267042cb0f7  ltp-full-20200930.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20210121/ltp-full-20210121.tar.xz.sha1
+sha1 ac9c1c711aed4319c5fbd0b665d36f75236a4ec2  ltp-full-20210121.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index a9a3173c4b..577fdf1131 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20200930
+LTP_TESTSUITE_VERSION = 20210121
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
+
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
 LTP_TESTSUITE_CONF_OPTS += \
-	--with-realtime-testsuite --with-open-posix-testsuite
+	--with-realtime-testsuite --with-open-posix-testsuite \
+	--disable-metadata
 
 ifeq ($(BR2_LINUX_KERNEL),y)
 LTP_TESTSUITE_DEPENDENCIES += linux
