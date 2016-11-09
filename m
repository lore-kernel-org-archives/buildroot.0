From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 9 Nov 2016 08:05:31 +0100
Subject: [Buildroot] [PATCH] php: fix bfin compile issue
Message-ID: <20161109070531.GA7310@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/8326f24511d3b109d22a76660adc017bbcaca197

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/php/0007-avoid-bfin-gcc-segfault.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/php/0007-avoid-bfin-gcc-segfault.patch

diff --git a/package/php/0007-avoid-bfin-gcc-segfault.patch b/package/php/0007-avoid-bfin-gcc-segfault.patch
new file mode 100644
index 0000000..4dccb25
--- /dev/null
+++ b/package/php/0007-avoid-bfin-gcc-segfault.patch
@@ -0,0 +1,16 @@
+Avoid gcc segmentation fault
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur php-7.0.12.orig/Zend/zend_portability.h php-7.0.12/Zend/zend_portability.h
+--- php-7.0.12.orig/Zend/zend_portability.h	2016-10-13 16:04:17.000000000 +0200
++++ php-7.0.12/Zend/zend_portability.h	2016-11-08 02:49:39.118388999 +0100
+@@ -97,7 +97,7 @@
+ 
+ #if defined(ZEND_WIN32) && !defined(__clang__)
+ # define ZEND_ASSUME(c)	__assume(c)
+-#elif ((defined(__GNUC__) && ZEND_GCC_VERSION >= 4005) || __has_builtin(__builtin_unreachable)) && PHP_HAVE_BUILTIN_EXPECT
++#elif ((defined(__GNUC__) && ZEND_GCC_VERSION >= 4005) || __has_builtin(__builtin_unreachable)) && PHP_HAVE_BUILTIN_EXPECT && !defined(__bfin__)
+ # define ZEND_ASSUME(c)	do { \
+ 		if (__builtin_expect(!(c), 0)) __builtin_unreachable(); \
+ 	} while (0)
-- 
2.1.4
