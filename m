From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Mar 2020 22:03:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtommath: fix build with latest
 moarvm on ARM
Message-ID: <20200326210343.126931-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream to enable mp_set_double on more architectures to fix the
following build failure on moarvm with some ARM architectures:

linking moar
./libmoar.so: undefined reference to `mp_set_double'

Fixes:
 - http://autobuild.buildroot.org/results/59d6b651498f3523d4a990eddc03c7d5043425ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...bn_mp_set_double-c-on-more-platforms.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch

diff --git a/package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch b/package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch
new file mode 100644
index 0000000000..c25002ba70
--- /dev/null
+++ b/package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch
@@ -0,0 +1,44 @@
+From 4e90f3185aea9160c28f3eaec5625b67fc0f67db Mon Sep 17 00:00:00 2001
+From: Daniel Green <ddgreen@gmail.com>
+Date: Sun, 9 Feb 2020 11:06:53 -0500
+Subject: [PATCH] Build+test bn_mp_set_double.c on more platforms
+
+Not all platforms/environments/architectures that support enough of
+IEEE 754 for the purposes of mp_set_double() actually support enough
+to legitimately define __STDC_IEC_559__, so only relying on that is
+too strict. Fixes https://github.com/libtom/libtommath/issues/159
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and backported) from:
+https://github.com/libtom/libtommath/commit/4e90f3185aea9160c28f3eaec5625b67fc0f67db]
+---
+ demo/test.c     | 2 +-
+ bn_mp_set_double.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/demo/test.c b/demo/test.c
+index 998f14b3..f719709d 100644
+--- a/demo/test.c
++++ b/demo/test.c
+@@ -522,7 +522,7 @@ static int test_mp_invmod(void)
+ 
+ }
+ 
+-#if defined(__STDC_IEC_559__) || defined(__GCC_IEC_559)
++#if defined(__STDC_IEC_559__) || defined(__GCC_IEC_559) || defined(__x86_64__) || defined(_M_X64) || defined(_M_AMD64) || defined(__i386__) || defined(_M_X86) || defined(__aarch64__) || defined(__arm__)
+ static int test_mp_set_double(void)
+ {
+    int i;
+diff --git a/mp_set_double.c b/mp_set_double.c
+index 78550c8f..cdc644d9 100644
+--- a/bn_mp_set_double.c
++++ b/bn_mp_set_double.c
+@@ -3,7 +3,7 @@
+ /* LibTomMath, multiple-precision integer library -- Tom St Denis */
+ /* SPDX-License-Identifier: Unlicense */
+ 
+-#if defined(__STDC_IEC_559__) || defined(__GCC_IEC_559)
++#if defined(__STDC_IEC_559__) || defined(__GCC_IEC_559) || defined(__x86_64__) || defined(_M_X64) || defined(_M_AMD64) || defined(__i386__) || defined(_M_X86) || defined(__aarch64__) || defined(__arm__)
+ mp_err mp_set_double(mp_int *a, double b)
+ {
+    uint64_t frac;
-- 
2.25.1
