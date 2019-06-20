From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jun 2019 13:32:51 +0200
Subject: [Buildroot] [git commit] package/gzip: bump to version 1.10
Message-ID: <20190620113224.2D6418212D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bf3e78038cb1677de3975d1e5c40be0c352cc3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...lush-adjust-to-glibc-2.28-libio.h-removal.patch | 189 ---------------------
 package/gzip/gzip.hash                             |   4 +-
 package/gzip/gzip.mk                               |   2 +-
 3 files changed, 3 insertions(+), 192 deletions(-)

diff --git a/package/gzip/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch b/package/gzip/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
deleted file mode 100644
index 11d2af6d47..0000000000
--- a/package/gzip/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
+++ /dev/null
@@ -1,189 +0,0 @@
-From 1831628c0630ae96a43586b2a25ca51cbdba3e53 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <address@hidden>
-Date: Mon, 5 Mar 2018 10:56:29 -0800
-Subject: [PATCH] fflush: adjust to glibc 2.28 libio.h removal
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Daniel P. Berrange in:
-https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
-* lib/fbufmode.c (fbufmode):
-* lib/fflush.c (clear_ungetc_buffer_preserving_position)
-(disable_seek_optimization, rpl_fflush):
-* lib/fpending.c (__fpending):
-* lib/fpurge.c (fpurge):
-* lib/freadable.c (freadable):
-* lib/freadahead.c (freadahead):
-* lib/freading.c (freading):
-* lib/freadptr.c (freadptr):
-* lib/freadseek.c (freadptrinc):
-* lib/fseeko.c (fseeko):
-* lib/fseterr.c (fseterr):
-* lib/fwritable.c (fwritable):
-* lib/fwriting.c (fwriting):
-Check _IO_EOF_SEEN instead of _IO_ftrylockfile.
-* lib/stdio-impl.h (_IO_IN_BACKUP) [_IO_EOF_SEEN]:
-Define if not already defined.
----
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-
- ChangeLog        | 23 +++++++++++++++++++++++
- lib/fbufmode.c   |  2 +-
- lib/fflush.c     |  6 +++---
- lib/fpending.c   |  2 +-
- lib/fpurge.c     |  2 +-
- lib/freadable.c  |  2 +-
- lib/freadahead.c |  2 +-
- lib/freading.c   |  2 +-
- lib/freadptr.c   |  2 +-
- lib/freadseek.c  |  2 +-
- lib/fseeko.c     |  4 ++--
- lib/fseterr.c    |  2 +-
- lib/fwritable.c  |  2 +-
- lib/fwriting.c   |  2 +-
- lib/stdio-impl.h |  6 ++++++
- 15 files changed, 45 insertions(+), 16 deletions(-)
-
-Index: gzip-1.9/ChangeLog
-===================================================================
---- gzip-1.9.orig/ChangeLog
-+++ gzip-1.9/ChangeLog
-@@ -1,3 +1,26 @@
-+2018-03-05  Paul Eggert  <address@hidden>
-+
-+	fflush: adjust to glibc 2.28 libio.h removal
-+	Problem reported by Daniel P. Berrange in:
-+	https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
-+	* lib/fbufmode.c (fbufmode):
-+	* lib/fflush.c (clear_ungetc_buffer_preserving_position)
-+	(disable_seek_optimization, rpl_fflush):
-+	* lib/fpending.c (__fpending):
-+	* lib/fpurge.c (fpurge):
-+	* lib/freadable.c (freadable):
-+	* lib/freadahead.c (freadahead):
-+	* lib/freading.c (freading):
-+	* lib/freadptr.c (freadptr):
-+	* lib/freadseek.c (freadptrinc):
-+	* lib/fseeko.c (fseeko):
-+	* lib/fseterr.c (fseterr):
-+	* lib/fwritable.c (fwritable):
-+	* lib/fwriting.c (fwriting):
-+	Check _IO_EOF_SEEN instead of _IO_ftrylockfile.
-+	* lib/stdio-impl.h (_IO_IN_BACKUP) [_IO_EOF_SEEN]:
-+	Define if not already defined.
-+
- 2018-01-07  Jim Meyering  <meyering@fb.com>
-
-	version 1.9
-Index: gzip-1.9/lib/fflush.c
-===================================================================
---- gzip-1.9.orig/lib/fflush.c
-+++ gzip-1.9/lib/fflush.c
-@@ -33,7 +33,7 @@
- #undef fflush
-
-
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-
- /* Clear the stream's ungetc buffer, preserving the value of ftello (fp).  */
- static void
-@@ -72,7 +72,7 @@ clear_ungetc_buffer (FILE *fp)
-
- #endif
-
--#if ! (defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
-+#if ! (defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
-
- # if (defined __sferror || defined __DragonFly__ || defined __ANDROID__) && defined __SNPT
- /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
-@@ -148,7 +148,7 @@ rpl_fflush (FILE *stream)
-   if (stream == NULL || ! freading (stream))
-     return fflush (stream);
-
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-
-   clear_ungetc_buffer_preserving_position (stream);
-
-Index: gzip-1.9/lib/fpurge.c
-===================================================================
---- gzip-1.9.orig/lib/fpurge.c
-+++ gzip-1.9/lib/fpurge.c
-@@ -62,7 +62,7 @@ fpurge (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_IO_read_end = fp->_IO_read_ptr;
-   fp->_IO_write_ptr = fp->_IO_write_base;
-   /* Avoid memory leak when there is an active ungetc buffer.  */
-Index: gzip-1.9/lib/freading.c
-===================================================================
---- gzip-1.9.orig/lib/freading.c
-+++ gzip-1.9/lib/freading.c
-@@ -31,7 +31,7 @@ freading (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   return ((fp->_flags & _IO_NO_WRITES) != 0
-           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
-               && fp->_IO_read_base != NULL));
-Index: gzip-1.9/lib/fseeko.c
-===================================================================
---- gzip-1.9.orig/lib/fseeko.c
-+++ gzip-1.9/lib/fseeko.c
-@@ -47,7 +47,7 @@ fseeko (FILE *fp, off_t offset, int when
- #endif
-
-   /* These tests are based on fpurge.c.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_read_end == fp->_IO_read_ptr
-       && fp->_IO_write_ptr == fp->_IO_write_base
-       && fp->_IO_save_base == NULL)
-@@ -123,7 +123,7 @@ fseeko (FILE *fp, off_t offset, int when
-           return -1;
-         }
-
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-       fp->_flags &= ~_IO_EOF_SEEN;
-       fp->_offset = pos;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-Index: gzip-1.9/lib/fseterr.c
-===================================================================
---- gzip-1.9.orig/lib/fseterr.c
-+++ gzip-1.9/lib/fseterr.c
-@@ -29,7 +29,7 @@ fseterr (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_flags |= _IO_ERR_SEEN;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
-Index: gzip-1.9/lib/stdio-impl.h
-===================================================================
---- gzip-1.9.orig/lib/stdio-impl.h
-+++ gzip-1.9/lib/stdio-impl.h
-@@ -18,6 +18,12 @@
-    the same implementation of stdio extension API, except that some fields
-    have different naming conventions, or their access requires some casts.  */
-
-+/* Glibc 2.28 made _IO_IN_BACKUP private.  For now, work around this
-+   problem by defining it ourselves.  FIXME: Do not rely on glibc
-+   internals.  */
-+#if !defined _IO_IN_BACKUP && defined _IO_EOF_SEEN
-+# define _IO_IN_BACKUP 0x100
-+#endif
-
- /* BSD stdio derived implementations.  */
diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 632176c2b6..5675b3ed50 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gzip/gzip-1.9.tar.xz.sig
+# https://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256 ae506144fc198bd8f81f1f4ad19ce63d5a2d65e42333255977cf1dcf1479089a  gzip-1.9.tar.xz
+sha256 8425ccac99872d544d4310305f915f5ea81e04d0f437ef1a230dc9d1c819d7c0  gzip-1.10.tar.xz
 # Locally calculated
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 8ac6ddd6ed..17b27b497c 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.9
+GZIP_VERSION = 1.10
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
