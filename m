From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2020 22:02:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix build with
 musl 1.2.0
In-Reply-To: <20200422090246.353974-1-fontaine.fabrice@gmail.com>
References: <20200422090246.353974-1-fontaine.fabrice@gmail.com>
Message-ID: <20200422200241.GF5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-04-22 11:02 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/57e8d2a53f99dc804d66482f71653957fd1a6e47
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...64-unsafe-syscalls-before-using-them.patch | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 package/ltp-testsuite/0001-syscalls-Check-for-time64-unsafe-syscalls-before-using-them.patch
> 
> diff --git a/package/ltp-testsuite/0001-syscalls-Check-for-time64-unsafe-syscalls-before-using-them.patch b/package/ltp-testsuite/0001-syscalls-Check-for-time64-unsafe-syscalls-before-using-them.patch
> new file mode 100644
> index 0000000000..e447dd5182
> --- /dev/null
> +++ b/package/ltp-testsuite/0001-syscalls-Check-for-time64-unsafe-syscalls-before-using-them.patch
> @@ -0,0 +1,123 @@
> +From 5b57ae2913e2d2d167cbd3822784b4c4ba336812 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 19 Feb 2020 22:52:04 -0800
> +Subject: [PATCH] syscalls: Check for time64 unsafe syscalls before using them
> +
> +musl is using 64bit time_t now on 32bit architectures and these syscalls
> +no longer exist, therefore its better to check for them being available
> +before using them
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> +Reviewed-by: Petr Vorel <pvorel@suse.cz>
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/linux-test-project/ltp/commit/5b57ae2913e2d2d167cbd3822784b4c4ba336812]
> +---
> + lib/tst_clocks.c                                 | 16 ++++++----------
> + .../syscalls/gettimeofday/gettimeofday01.c       |  6 ++----
> + .../syscalls/gettimeofday/gettimeofday02.c       |  8 +++-----
> + 3 files changed, 11 insertions(+), 19 deletions(-)
> +
> +diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
> +index 5195da38f3..fa2f1cb842 100644
> +--- a/lib/tst_clocks.c
> ++++ b/lib/tst_clocks.c
> +@@ -3,28 +3,24 @@
> +  * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
> +  */
> + 
> +-/*
> +- * clock_gettime() and clock_getres() functions
> +- */
> +-
> +-#define _GNU_SOURCE
> +-#include <unistd.h>
> + #include <time.h>
> +-#include <sys/syscall.h>
> + 
> ++#define TST_NO_DEFAULT_MAIN
> ++#include "tst_test.h"
> + #include "tst_clocks.h"
> ++#include "lapi/syscalls.h"
> + 
> + int tst_clock_getres(clockid_t clk_id, struct timespec *res)
> + {
> +-	return syscall(SYS_clock_getres, clk_id, res);
> ++	return tst_syscall(__NR_clock_getres, clk_id, res);
> + }
> + 
> + int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
> + {
> +-	return syscall(SYS_clock_gettime, clk_id, ts);
> ++	return tst_syscall(__NR_clock_gettime, clk_id, ts);
> + }
> + 
> + int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
> + {
> +-	return syscall(SYS_clock_settime, clk_id, ts);
> ++	return tst_syscall(__NR_clock_settime, clk_id, ts);
> + }
> +diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> +index 583d8f7b9b..08ea1673ad 100644
> +--- a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> ++++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> +@@ -38,10 +38,8 @@
> + #include <sys/time.h>
> + #include <errno.h>
> + #include "test.h"
> +-#include <sys/syscall.h>
> + #include <unistd.h>
> +-
> +-#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
> ++#include "lapi/syscalls.h"
> + 
> + char *TCID = "gettimeofday01";
> + int TST_TOTAL = 1;
> +@@ -63,7 +61,7 @@ int main(int ac, char **av)
> + 	for (lc = 0; TEST_LOOPING(lc); lc++) {
> + 		tst_count = 0;
> + 
> +-		TEST(gettimeofday((void *)-1, (void *)-1));
> ++		TEST(ltp_syscall(__NR_gettimeofday, (void *)-1, (void *)-1));
> + 
> + 		/* gettimeofday returns an int, so we need to turn the long
> + 		 * TEST_RETURN into an int to test with */
> +diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> +index 1d60f448e8..5170ad2f78 100644
> +--- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> ++++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> +@@ -16,14 +16,12 @@
> + #include <stdint.h>
> + #include <sys/time.h>
> + #include <stdlib.h>
> +-#include <sys/syscall.h>
> + #include <unistd.h>
> + #include <time.h>
> + #include <errno.h>
> + 
> + #include "tst_test.h"
> +-
> +-#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
> ++#include "lapi/syscalls.h"
> + 
> + static volatile sig_atomic_t done;
> + static char *str_rtime;
> +@@ -48,13 +46,13 @@ static void verify_gettimeofday(void)
> + 
> + 	alarm(rtime);
> + 
> +-	if (gettimeofday(&tv1, NULL)) {
> ++	if (tst_syscall(__NR_gettimeofday, &tv1, NULL)) {
> + 		tst_res(TBROK | TERRNO, "gettimeofday() failed");
> + 		return;
> + 	}
> + 
> + 	while (!done) {
> +-		if (gettimeofday(&tv2, NULL)) {
> ++		if (tst_syscall(__NR_gettimeofday, &tv2, NULL)) {
> + 			tst_res(TBROK | TERRNO, "gettimeofday() failed");
> + 			return;
> + 		}
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
