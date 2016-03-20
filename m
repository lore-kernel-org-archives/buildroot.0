From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 21:39:39 +0100
Subject: [Buildroot] [git commit] package/multicat: fix HAVE_CLOCK_NANOSLEEP
	with uClibc
Message-ID: <20160320203957.9D471817CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46271ffa9c4f01d9886142ae27a9f533d3a7e3ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0003-Fix-have-clock-nanosleep-with-uclibc.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/multicat/0003-Fix-have-clock-nanosleep-with-uclibc.patch b/package/multicat/0003-Fix-have-clock-nanosleep-with-uclibc.patch
new file mode 100644
index 0000000..108fb0b
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
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
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
