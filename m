From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 10:34:04 +0200
Subject: [Buildroot] [git commit] dc3dd: fix build with glibc 2.28
Message-ID: <20181026083328.41AF888F92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd31e85b2d9e519996cb69a0c9845015e00dbb58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnulib code in dc3dd relied on internal glibc definitions that are no
longer visible with glibc 2.28. Add a patch based on upstream gnulib to
fix the build.

Fixes:
http://autobuild.buildroot.net/results/552/552b8e44fe6585f978e2fb7a920057a868cf6689/
http://autobuild.buildroot.net/results/00d/00d2bf5a4c97bea2ace0427c0bed57e11f9a5f9a/
http://autobuild.buildroot.net/results/17a/17a9246bfb034c531ec5e27e29d38857e58db271/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dc3dd/0003-fix-for-glibc-2.28.patch | 87 +++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/package/dc3dd/0003-fix-for-glibc-2.28.patch b/package/dc3dd/0003-fix-for-glibc-2.28.patch
new file mode 100644
index 0000000000..79e52b1e6d
--- /dev/null
+++ b/package/dc3dd/0003-fix-for-glibc-2.28.patch
@@ -0,0 +1,87 @@
+Fix build with glibc 2.28
+
+glibc 2.28 hides a number of internal macros that used to be visible. gnulib
+relied on these macros. Add a patch based on upstream gnulib commit
+4af4a4a71827c0 (fflush: adjust to glibc 2.28 libio.h removal) to fix the
+build.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: gnulib commit 4af4a4a7182
+
+diff -Nuar dc3dd-7.2.641.orig/lib/freadahead.c dc3dd-7.2.641/lib/freadahead.c
+--- dc3dd-7.2.641.orig/lib/freadahead.c	2012-11-06 23:42:58.000000000 +0200
++++ dc3dd-7.2.641/lib/freadahead.c	2018-10-26 08:46:36.612492230 +0300
+@@ -24,7 +24,7 @@
+ size_t
+ freadahead (FILE *fp)
+ {
+-#if defined _IO_ferror_unlocked || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Linux libc5 */
++#if defined _IO_EOF_SEEN || defined _IO_ferror_unlocked || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Linux libc5 */
+   if (fp->_IO_write_ptr > fp->_IO_write_base)
+     return 0;
+   return (fp->_IO_read_end - fp->_IO_read_ptr)
+diff -Nuar dc3dd-7.2.641.orig/lib/freadptr.c dc3dd-7.2.641/lib/freadptr.c
+--- dc3dd-7.2.641.orig/lib/freadptr.c	2012-11-06 23:42:58.000000000 +0200
++++ dc3dd-7.2.641/lib/freadptr.c	2018-10-26 08:36:53.965310494 +0300
+@@ -29,7 +29,7 @@
+   size_t size;
+ 
+   /* Keep this code in sync with freadahead!  */
+-#if defined _IO_ferror_unlocked || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Linux libc5 */
++#if defined _IO_EOF_SEEN || defined _IO_ferror_unlocked || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Linux libc5 */
+   if (fp->_IO_write_ptr > fp->_IO_write_base)
+     return NULL;
+   size = fp->_IO_read_end - fp->_IO_read_ptr;
+diff -Nuar dc3dd-7.2.641.orig/lib/freadseek.c dc3dd-7.2.641/lib/freadseek.c
+--- dc3dd-7.2.641.orig/lib/freadseek.c	2012-11-06 23:42:58.000000000 +0200
++++ dc3dd-7.2.641/lib/freadseek.c	2018-10-26 08:49:35.387912087 +0300
+@@ -34,7 +34,7 @@
+ freadptrinc (FILE *fp, size_t increment)
+ {
+   /* Keep this code in sync with freadptr!  */
+-#if defined _IO_ferror_unlocked || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Linux libc5 */
++#if defined _IO_EOF_SEEN || defined _IO_ferror_unlocked || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Linux libc5 */
+   fp->_IO_read_ptr += increment;
+ #elif defined __sferror || defined __DragonFly__ /* FreeBSD, NetBSD, OpenBSD, DragonFly, MacOS X, Cygwin */
+   fp_->_p += increment;
+diff -Nuar dc3dd-7.2.641.orig/lib/fseeko.c dc3dd-7.2.641/lib/fseeko.c
+--- dc3dd-7.2.641.orig/lib/fseeko.c	2012-11-06 23:42:58.000000000 +0200
++++ dc3dd-7.2.641/lib/fseeko.c	2018-10-26 08:51:02.841583936 +0300
+@@ -44,7 +44,7 @@
+ #endif
+ 
+   /* These tests are based on fpurge.c.  */
+-#if defined _IO_ferror_unlocked || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Linux libc5 */
++#if defined _IO_EOF_SEEN || defined _IO_ferror_unlocked || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Linux libc5 */
+   if (fp->_IO_read_end == fp->_IO_read_ptr
+       && fp->_IO_write_ptr == fp->_IO_write_base
+       && fp->_IO_save_base == NULL)
+diff -Nuar dc3dd-7.2.641.orig/lib/fseterr.c dc3dd-7.2.641/lib/fseterr.c
+--- dc3dd-7.2.641.orig/lib/fseterr.c	2012-11-06 23:42:58.000000000 +0200
++++ dc3dd-7.2.641/lib/fseterr.c	2018-10-26 08:47:51.209919605 +0300
+@@ -29,7 +29,7 @@
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined _IO_ferror_unlocked || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Linux libc5 */
++#if defined _IO_EOF_SEEN || defined _IO_ferror_unlocked || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Linux libc5 */
+   fp->_flags |= _IO_ERR_SEEN;
+ #elif defined __sferror || defined __DragonFly__ /* FreeBSD, NetBSD, OpenBSD, DragonFly, MacOS X, Cygwin */
+   fp_->_flags |= __SERR;
+diff -Nuar dc3dd-7.2.641.orig/lib/stdio-impl.h dc3dd-7.2.641/lib/stdio-impl.h
+--- dc3dd-7.2.641.orig/lib/stdio-impl.h	2012-11-06 23:42:58.000000000 +0200
++++ dc3dd-7.2.641/lib/stdio-impl.h	2018-10-26 08:46:26.136291709 +0300
+@@ -18,6 +18,12 @@
+    the same implementation of stdio extension API, except that some fields
+    have different naming conventions, or their access requires some casts.  */
+ 
++/* Glibc 2.28 made _IO_IN_BACKUP private.  For now, work around this
++   problem by defining it ourselves.  FIXME: Do not rely on glibc
++   internals.  */
++#if !defined _IO_IN_BACKUP && defined _IO_EOF_SEEN
++# define _IO_IN_BACKUP 0x100
++#endif
+ 
+ /* BSD stdio derived implementations.  */
+ 
