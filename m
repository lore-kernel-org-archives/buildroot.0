From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:55:23 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/ltp-testsuite:
 Fix m68k build
Message-ID: <20201010204949.1A2B08EB59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91db7981bf0594d650374dc987617a5f1a22f122
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Backport upstream proposal for fix.

Fixes: br-m68k-68040-full failure.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 26a40149f48e1c4c6f7c04b7bc8a31254e68c302)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-cacheflush01-Rewrite-into-new-API.patch   | 225 +++++++++++++++++++++
 1 file changed, 225 insertions(+)

diff --git a/package/ltp-testsuite/0001-cacheflush01-Rewrite-into-new-API.patch b/package/ltp-testsuite/0001-cacheflush01-Rewrite-into-new-API.patch
new file mode 100644
index 0000000000..f9815624b9
--- /dev/null
+++ b/package/ltp-testsuite/0001-cacheflush01-Rewrite-into-new-API.patch
@@ -0,0 +1,225 @@
+From 48edd768850825a4d01e5e5e737122333fc55cdf Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Fri, 2 Oct 2020 21:29:58 +0200
+Subject: [PATCH] cacheflush01: Rewrite into new API
+
+This syscall is currently (v5.9) supported on these architectures:
+arc, csky, mips, m68k, nds32, sh
+
+constants are missing for m68k, not sure if the testcase is valid for it.
+Untested.
+
+Test for __LTP__NR_INVALID_SYSCALL saves adding autotools check for
+<asm/cachectl.h>.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+[ upstream status: https://patchwork.ozlabs.org/project/ltp/patch/20201002202416.28972-1-petr.vorel at gmail.com/ ]
+ .../kernel/syscalls/cacheflush/cacheflush01.c | 173 ++++--------------
+ 1 file changed, 40 insertions(+), 133 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/cacheflush/cacheflush01.c b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
+index 29cf2014a..6ad8b953a 100644
+--- a/testcases/kernel/syscalls/cacheflush/cacheflush01.c
++++ b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
+@@ -1,157 +1,64 @@
+-/******************************************************************************/
+-/* Copyright (c) Maxin John <maxin.john@gmail.com>, 2009                      */
+-/* LKML Reference: http://lkml.org/lkml/2009/4/9/203                          */
+-/* This program is free software;  you can redistribute it and/or modify      */
+-/* it under the terms of the GNU General Public License as published by       */
+-/* the Free Software Foundation; either version 2 of the License, or          */
+-/* (at your option) any later version.                                        */
+-/*                                                                            */
+-/* This program is distributed in the hope that it will be useful,            */
+-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
+-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
+-/* the GNU General Public License for more details.                           */
+-/*                                                                            */
+-/* You should have received a copy of the GNU General Public License          */
+-/* along with this program;  if not, write to the Free Software               */
+-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
+-/*                                                                            */
+-/******************************************************************************/
+-/******************************************************************************/
+-/*                                                                            */
+-/* File:        cacheflush01.c                                                */
+-/*                                                                            */
+-/* Description: The cacheflush_check() syscall                     	      */
+-/*		Tests EINVAL error of cacheflush system call.		      */
+-/* 		Its expected behaviour is cacheflush() should return -EINVAL  */
+-/*		when cache parameter is not one of ICACHE, DCACHE, or BCACHE. */
+-/*                                                                            */
+-/* Usage:  <for command-line>                                                 */
+-/* cacheflush01 [-c n] [-e][-i n] [-I x] [-p x] [-t]                          */
+-/*      where,  -c n : Run n copies concurrently.                             */
+-/*              -e   : Turn on errno logging.                                 */
+-/*              -i n : Execute test n times.                                  */
+-/*              -I x : Execute test for x seconds.                            */
+-/*              -P x : Pause for x seconds between iterations.                */
+-/*              -t   : Turn on syscall timing.                                */
+-/*                                                                            */
+-/* Total Tests: 1                                                             */
+-/*                                                                            */
+-/* Test Name:   cacheflush01                                                  */
+-/******************************************************************************/
++// SPDX-License-Identifier: GPL-2.0-or-later
+ 
+-#include <unistd.h>
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <errno.h>
+-
+-#include "test.h"
++#include "tst_test.h"
+ #include "lapi/syscalls.h"
+ 
+ #if __NR_cacheflush != __LTP__NR_INVALID_SYSCALL
++
+ #include <asm/cachectl.h>
+-#else
++
++/*
++ * m68k does not have these constants
++ */
++
+ #ifndef   ICACHE
+-#define   ICACHE   (1<<0)	/* flush instruction cache        */
++# define   ICACHE   (1<<0)
+ #endif
++
+ #ifndef   DCACHE
+-#define   DCACHE   (1<<1)	/* writeback and flush data cache */
++# define   DCACHE   (1<<1)
+ #endif
++
+ #ifndef   BCACHE
+-#define   BCACHE   (ICACHE|DCACHE)	/* flush both caches              */
+-#endif
++# define   BCACHE   (ICACHE|DCACHE)
+ #endif
+ 
+-char *TCID = "cacheflush01";
+-int TST_TOTAL = 1;
++#define CACHE_DESC(x) .cache = x, .desc = #x
+ 
+-/* Extern Global Functions */
+-/******************************************************************************/
+-/*                                                                            */
+-/* Function:    cleanup                                                       */
+-/*                                                                            */
+-/* Description: Performs all one time clean up for this test on successful    */
+-/*              completion,  premature exit or  failure. Closes all temporary */
+-/*              files, removes all temporary directories exits the test with  */
+-/*              appropriate return code by calling tst_exit() function.       */
+-/*                                                                            */
+-/* Input:       None.                                                         */
+-/*                                                                            */
+-/* Output:      None.                                                         */
+-/*                                                                            */
+-/* Return:      On failure - Exits calling tst_exit(). Non '0' return code.   */
+-/*              On success - Exits calling tst_exit(). With '0' return code.  */
+-/*                                                                            */
+-/******************************************************************************/
+-void cleanup(void)
+-{
++static struct test_case_t {
++	int cache;
++	const char *desc;
++} test_cases[] = {
++	{ CACHE_DESC(ICACHE) },
++	{ CACHE_DESC(DCACHE) },
++	{ CACHE_DESC(BCACHE) },
++};
+ 
+-	tst_rmdir();
+-}
++static char *addr;
+ 
+-/* Local  Functions */
+-/******************************************************************************/
+-/*                                                                            */
+-/* Function:    setup                                                         */
+-/*                                                                            */
+-/* Description: Performs all one time setup for this test. This function is   */
+-/*              typically used to capture signals, create temporary dirs      */
+-/*              and temporary files that may be used in the course of this    */
+-/*              test.                                                         */
+-/*                                                                            */
+-/* Input:       None.                                                         */
+-/*                                                                            */
+-/* Output:      None.                                                         */
+-/*                                                                            */
+-/* Return:      On failure - Exits by calling cleanup().                      */
+-/*              On success - returns 0.                                       */
+-/*                                                                            */
+-/******************************************************************************/
+-void setup(void)
++static void setup(void)
+ {
+-	/* Capture signals if any */
+-	/* Create temporary directories */
+-	TEST_PAUSE;
+-	tst_tmpdir();
++	addr = SAFE_MALLOC(getpagesize());
+ }
+ 
+-int main(int ac, char **av)
++static void test_cacheflush(unsigned int i)
+ {
++	struct test_case_t *tc = &test_cases[i];
+ 
+-	char *addr = NULL;
+-
+-	tst_parse_opts(ac, av, NULL, NULL);
+-
+-	setup();
+-
+-	tst_count = 0;
+-	/* Create some user address range */
+-	addr = malloc(getpagesize());
+-	if (addr == NULL) {
+-		tst_brkm(TFAIL | TTERRNO, cleanup, "malloc failed");
+-	}
+-
+-	/* Invokes cacheflush() with proper parameters */
+-	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), ICACHE));
+-	if (TEST_RETURN == 0) {
+-		tst_resm(TPASS, "passed with no errno");
+-	} else {
+-		tst_resm(TFAIL, "failed with unexpected errno");
+-	}
+-
+-	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), DCACHE));
+-	if (TEST_RETURN == 0) {
+-		tst_resm(TPASS, "passed with no errno");
++	TEST(tst_syscall(__NR_cacheflush, addr, getpagesize(), tc->cache));
++	if (TST_RET == 0) {
++		tst_res(TPASS, "%s passed", tc->desc);
+ 	} else {
+-		tst_resm(TFAIL, "failed with unexpected errno");
++		tst_res(TFAIL | TTERRNO, "%s failed", tc->desc);
+ 	}
++}
+ 
+-	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), BCACHE));
+-	if (TEST_RETURN == 0) {
+-		tst_resm(TPASS, "passed with no errno");
+-	} else {
+-		tst_resm(TFAIL, "failed with unexpected errno");
+-	}
++static struct tst_test test = {
++	.setup = setup,
++	.test = test_cacheflush,
++	.tcnt = ARRAY_SIZE(test_cases),
++};
+ 
+-	cleanup();
+-	tst_exit();
+-}
++#else
++	TST_TEST_TCONF("system doesn't support cacheflush()");
++#endif
+-- 
+2.28.0
+
