From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 20 Mar 2016 18:55:25 +0100
Subject: [Buildroot] [PATCH] package/multicat: fix HAVE_CLOCK_NANOSLEEP with
	uClibc
Message-ID: <1458496525-8360-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

multicat uses clock_nanosleep() conditionally if HAVE_CLOCK_NANOSLEEP is
defined. Unfortunatly, multicat does not use autoconf to check if
clock_nanosleep() is really available, but defines it if __APPLE__ is not
defined.

With uClibc clock_nanosleep() is not available if the C library is configured
without NPTL support (sets __UCLIBC_HAS_THREADS_NATIVE__) or
__UCLIBC_HAS_ADVANCED_REALTIME__ is not set.

Fixes:
http://autobuild.buildroot.net/results/84f/84f8302ee94e6e6849f6b26cb697c2f9986bafe5/
http://autobuild.buildroot.net/results/9e0/9e07a98e87755c992254295c46edb0dace967a21/
http://autobuild.buildroot.net/results/4b0/4b07d276d7c09f2fc2d63c8c37c92519cfe36dbc/
http://autobuild.buildroot.net/results/84f/84f8302ee94e6e6849f6b26cb697c2f9986bafe5/
and many more.

Upstream status: Pending
https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000129.html

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...0003-Fix-have-clock-nanosleep-with-uclibc.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/multicat/0003-Fix-have-clock-nanosleep-with-uclibc.patch

diff --git a/package/multicat/0003-Fix-have-clock-nanosleep-with-uclibc.patch b/package/multicat/0003-Fix-have-clock-nanosleep-with-uclibc.patch
new file mode 100644
index 0000000..8eed1d9
--- /dev/null
+++ b/package/multicat/0003-Fix-have-clock-nanosleep-with-uclibc.patch
@@ -0,0 +1,24 @@
+uClibc may be configured without support for clock_nanosleep(). The function is
+only available with uClibc if the C library is build with NPTL support (sets
+__UCLIBC_HAS_THREADS_NATIVE__) and __UCLIBC_HAS_ADVANCED_REALTIME__ set.
+
+Upstream status: Pending
+https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000129.html
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+diff -purN multicat-2.1.orig/util.h multicat-2.1/util.h
+--- multicat-2.1.orig/util.h	2015-07-15 22:47:39.000000000 +0200
++++ multicat-2.1/util.h	2016-03-20 18:13:51.899780405 +0100
+@@ -26,7 +26,10 @@
+ 
+ #ifdef __APPLE__
+ #define POLLRDHUP 0
+-#else
++/* uClibc may not have clock_nanosleep() available */
++#elif !defined (__UCLIBC__) || \
++       defined (__UCLIBC__) && defined (__UCLIBC_HAS_THREADS_NATIVE__) \
++                            && defined (__UCLIBC_HAS_ADVANCED_REALTIME__)
+ #define HAVE_CLOCK_NANOSLEEP
+ #endif
+ 
-- 
2.7.4
