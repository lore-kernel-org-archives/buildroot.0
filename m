From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 13 May 2017 14:36:36 +0200
Subject: [Buildroot] [PATCH] package/uclibc-ng-test: disable tst-cond22 with
	glibc based toolchain
Message-ID: <20170513123636.23978-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uclibc-ng-test is broken with glibc 2.25 due to pthread_cond_t changes
introduced by [1].
Waldemar has disabled this test (tst-cond22) with glibc based toolchain
[2] but the current uclibc-ng-test package doesn't contain this patch.

So here it is.

Fixes:
[nios2] http://autobuild.buildroot.net/results/d61c8d169fc070271114a515159650f7a0f333c0
[arm] http://autobuild.buildroot.net/results/22295711046c519df44d5d976e0bfcae1f006e5a

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=ed19993b5b0d05d62cc883571519a67dae481a14
[2] https://gogs.waldemar-brodkorb.de/linux/uclibc-ng-test/commit/787e584f18afc967d91cfe1a8443df2657579ecb

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 .../uclibc-ng-test/0001-disable-for-glibc.patch    | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/uclibc-ng-test/0001-disable-for-glibc.patch

diff --git a/package/uclibc-ng-test/0001-disable-for-glibc.patch b/package/uclibc-ng-test/0001-disable-for-glibc.patch
new file mode 100644
index 0000000..13786c9
--- /dev/null
+++ b/package/uclibc-ng-test/0001-disable-for-glibc.patch
@@ -0,0 +1,40 @@
+From 787e584f18afc967d91cfe1a8443df2657579ecb Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 12 May 2017 00:44:01 +0200
+Subject: [PATCH] disable for glibc
+
+uclibc-ng-test is broken with glibc 2.25 due to pthread_cond_t changes introduced by [1].
+Disable test-cond22 for glibc based toolchain.
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=ed19993b5b0d05d62cc883571519a67dae481a14
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ test/nptl/tst-cond22.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test/nptl/tst-cond22.c b/test/nptl/tst-cond22.c
+index 3255cc0..23697dd 100644
+--- a/test/nptl/tst-cond22.c
++++ b/test/nptl/tst-cond22.c
+@@ -2,7 +2,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ 
+-#if defined(__GLIBC__) || defined(__UCLIBC__)
++#if defined(__UCLIBC__)
+ static pthread_barrier_t b;
+ static pthread_cond_t c = PTHREAD_COND_INITIALIZER;
+ static pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
+@@ -54,7 +54,7 @@ tf (void *arg)
+ static int
+ do_test (void)
+ {
+-#if defined(__GLIBC__) || defined(__UCLIBC__)
++#if defined(__UCLIBC__)
+   int status = 0;
+ 
+   if (pthread_barrier_init (&b, NULL, 2) != 0)
+-- 
+2.9.3
+
-- 
2.9.3
