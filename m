From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 20 Dec 2012 01:43:48 +0200
Subject: [Buildroot] [PATCH 10/12] elfutils: new package
In-Reply-To: <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
References: <y>
 <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1355960630-25089-10-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Elfutils uses nonstandard (glibc extension) mcheck.h interface which provides
mtrace() memory leak debugging function.
Disabling for uClibc.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/elfutils/elfutils-mcheck.patch |  214 ++++++++++++++++++++++++++++++++
 1 files changed, 214 insertions(+), 0 deletions(-)
 create mode 100644 package/elfutils/elfutils-mcheck.patch

diff --git a/package/elfutils/elfutils-mcheck.patch b/package/elfutils/elfutils-mcheck.patch
new file mode 100644
index 0000000..b49c36f
--- /dev/null
+++ b/package/elfutils/elfutils-mcheck.patch
@@ -0,0 +1,214 @@
+diff -Naur elfutils-0.155.org/src/nm.c elfutils-0.155/src/nm.c
+--- elfutils-0.155.org/src/nm.c	2012-12-18 01:12:37.292859311 +0200
++++ elfutils-0.155/src/nm.c	2012-12-18 01:13:08.965884787 +0200
+@@ -33,7 +33,9 @@
+ #include <libdw.h>
+ #include <libintl.h>
+ #include <locale.h>
++#ifndef	__UCLIBC__
+ #include <mcheck.h>
++#endif
+ #include <obstack.h>
+ #include <search.h>
+ #include <stdbool.h>
+diff -Naur elfutils-0.155.org/src/nm.c elfutils-0.155/src/nm.c
+--- elfutils-0.155.org/src/nm.c	2012-12-18 01:16:09.545835592 +0200
++++ elfutils-0.155/src/nm.c	2012-12-18 01:16:52.454289013 +0200
+@@ -219,8 +219,10 @@
+   int remaining;
+   int result = 0;
+ 
++#ifndef	__UCLIBC__
+   /* Make memory leak detection possible.  */
+   mtrace ();
++#endif
+ 
+   /* We use no threads here which can interfere with handling a stream.  */
+   (void) __fsetlocking (stdin, FSETLOCKING_BYCALLER);
+diff -Naur elfutils-0.155.org/src/size.c elfutils-0.155/src/size.c
+--- elfutils-0.155.org/src/size.c	2012-12-18 01:34:34.548275699 +0200
++++ elfutils-0.155/src/size.c	2012-12-18 01:35:16.606621092 +0200
+@@ -28,7 +28,9 @@
+ #include <libelf.h>
+ #include <libintl.h>
+ #include <locale.h>
++#ifndef	__UCLIBC__
+ #include <mcheck.h>
++#endif
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <stdio_ext.h>
+@@ -160,8 +162,10 @@
+   int remaining;
+   int result = 0;
+ 
++#ifndef	__UCLIBC__
+   /* Make memory leak detection possible.  */
+   mtrace ();
++#endif
+ 
+   /* We use no threads here which can interfere with handling a stream.  */
+   __fsetlocking (stdin, FSETLOCKING_BYCALLER);
+diff -Naur elfutils-0.155.org/src/strip.c elfutils-0.155/src/strip.c
+--- elfutils-0.155.org/src/strip.c	2012-12-18 01:45:44.790460034 +0200
++++ elfutils-0.155/src/strip.c	2012-12-18 01:46:32.118475178 +0200
+@@ -30,7 +30,9 @@
+ #include <libelf.h>
+ #include <libintl.h>
+ #include <locale.h>
++#ifndef	__UCLIBC__
+ #include <mcheck.h>
++#endif
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <stdio_ext.h>
+@@ -161,8 +163,10 @@
+   int remaining;
+   int result = 0;
+ 
++#ifndef	__UCLIBC__
+   /* Make memory leak detection possible.  */
+   mtrace ();
++#endif
+ 
+   /* We use no threads here which can interfere with handling a stream.  */
+   __fsetlocking (stdin, FSETLOCKING_BYCALLER);
+diff -Naur elfutils-0.155.org/src/ld.c elfutils-0.155/src/ld.c
+--- elfutils-0.155.org/src/ld.c	2012-12-18 01:57:30.383137235 +0200
++++ elfutils-0.155/src/ld.c	2012-12-18 01:58:13.428608088 +0200
+@@ -26,7 +26,9 @@
+ #include <libelf.h>
+ #include <libintl.h>
+ #include <locale.h>
++#ifndef	__UCLIBC__
+ #include <mcheck.h>
++#endif
+ #include <stdio.h>
+ #include <stdio_ext.h>
+ #include <stdlib.h>
+@@ -277,7 +279,7 @@
+   int remaining;
+   int err;
+ 
+-#ifndef NDEBUG
++#if !defined(NDEBUG) && !defined(__UCLIBC__)
+   /* Enable memory debugging.  */
+   mtrace ();
+ #endif
+--- elfutils-0.155.org/src/addr2line.c	2012-12-18 01:57:30.388137872 +0200
++++ elfutils-0.155/src/addr2line.c	2012-12-18 02:11:54.732772211 +0200
+@@ -30,7 +30,9 @@
+ #include <dwarf.h>
+ #include <libintl.h>
+ #include <locale.h>
++#ifndef	__UCLIBC__
+ #include <mcheck.h>
++#endif
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <stdio_ext.h>
+@@ -121,8 +123,10 @@
+   int remaining;
+   int result = 0;
+ 
++#ifndef	__UCLIBC__
+   /* Make memory leak detection possible.  */
+   mtrace ();
++#endif
+ 
+   /* We use no threads here which can interfere with handling a stream.  */
+   (void) __fsetlocking (stdout, FSETLOCKING_BYCALLER);
+--- elfutils-0.155.org/src/objdump.c	2012-12-18 01:57:30.390138126 +0200
++++ elfutils-0.155/src/objdump.c	2012-12-18 02:15:33.408820422 +0200
+@@ -26,7 +26,9 @@
+ #include <inttypes.h>
+ #include <libintl.h>
+ #include <locale.h>
++#ifndef	__UCLIBC__
+ #include <mcheck.h>
++#endif
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <stdio_ext.h>
+@@ -131,8 +133,10 @@
+ int
+ main (int argc, char *argv[])
+ {
++#ifndef	__UCLIBC__
+   /* Make memory leak detection possible.  */
+   mtrace ();
++#endif
+ 
+   /* We use no threads here which can interfere with handling a stream.  */
+   (void) __fsetlocking (stdin, FSETLOCKING_BYCALLER);
+--- elfutils-0.155.org/src/ranlib.c	2012-12-18 01:57:30.388137872 +0200
++++ elfutils-0.155/src/ranlib.c	2012-12-18 02:17:13.868780486 +0200
+@@ -29,7 +29,9 @@
+ #include <gelf.h>
+ #include <libintl.h>
+ #include <locale.h>
++#ifndef	__UCLIBC__
+ #include <mcheck.h>
++#endif
+ #include <obstack.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+@@ -78,8 +80,10 @@
+ int
+ main (int argc, char *argv[])
+ {
++#ifndef	__UCLIBC__
+   /* Make memory leak detection possible.  */
+   mtrace ();
++#endif
+ 
+   /* We use no threads here which can interfere with handling a stream.  */
+   (void) __fsetlocking (stdin, FSETLOCKING_BYCALLER);
+--- elfutils-0.155.org/src/ar.c	2012-12-18 01:57:30.389137999 +0200
++++ elfutils-0.155/src/ar.c	2012-12-18 02:23:02.753432773 +0200
+@@ -28,7 +28,9 @@
+ #include <libintl.h>
+ #include <limits.h>
+ #include <locale.h>
++#ifndef	__UCLIBC__
+ #include <mcheck.h>
++#endif
+ #include <search.h>
+ #include <stdbool.h>
+ #include <stdlib.h>
+@@ -141,9 +143,10 @@
+ int
+ main (int argc, char *argv[])
+ {
++#ifndef	__UCLIBC__
+   /* Make memory leak detection possible.  */
+   mtrace ();
+-
++#endif
+   /* We use no threads here which can interfere with handling a stream.  */
+   (void) __fsetlocking (stdin, FSETLOCKING_BYCALLER);
+   (void) __fsetlocking (stdout, FSETLOCKING_BYCALLER);
+--- elfutils-0.155.org/src/unstrip.c	2012-12-18 01:57:30.384137363 +0200
++++ elfutils-0.155/src/unstrip.c	2012-12-18 02:25:34.519547331 +0200
+@@ -36,7 +36,9 @@
+ #include <fnmatch.h>
+ #include <libintl.h>
+ #include <locale.h>
++#ifndef	__UCLIBC__
+ #include <mcheck.h>
++#endif
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <stdio_ext.h>
+@@ -2215,9 +2217,10 @@
+ int
+ main (int argc, char **argv)
+ {
++#ifndef	__UCLIBC__
+   /* Make memory leak detection possible.  */
+   mtrace ();
+-
++#endif
+   /* We use no threads here which can interfere with handling a stream.  */
+   __fsetlocking (stdin, FSETLOCKING_BYCALLER);
+   __fsetlocking (stdout, FSETLOCKING_BYCALLER);
-- 
1.7.7.6
