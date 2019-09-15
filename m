From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Sep 2019 13:32:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/findutils: bump to version 4.7
Message-ID: <20190915113246.16724-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patches (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ntlist-include-sysmacros-h-for-glibc.patch |  81 ----------
 ...adjust-to-glibc-2-28-libio-h-removal.patch | 152 ------------------
 package/findutils/findutils.hash              |   5 +-
 package/findutils/findutils.mk                |   5 +-
 4 files changed, 6 insertions(+), 237 deletions(-)
 delete mode 100644 package/findutils/0001-mountlist-include-sysmacros-h-for-glibc.patch
 delete mode 100644 package/findutils/0002-fflush-adjust-to-glibc-2-28-libio-h-removal.patch

diff --git a/package/findutils/0001-mountlist-include-sysmacros-h-for-glibc.patch b/package/findutils/0001-mountlist-include-sysmacros-h-for-glibc.patch
deleted file mode 100644
index ebb4d38a5d..0000000000
--- a/package/findutils/0001-mountlist-include-sysmacros-h-for-glibc.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 4da63c5881f60f71999a943612da9112232b9161 Mon Sep 17 00:00:00 2001
-From: Eric Blake <eblake@redhat.com>
-Date: Wed, 14 Sep 2016 19:21:42 -0500
-Subject: [PATCH] mountlist: include sysmacros.h for glibc
-
-On Fedora rawhide (glibc 2.25), './gnulib-tool --test mountlist'
-reports:
-../../gllib/mountlist.c: In function 'read_file_system_list':
-../../gllib/mountlist.c:534:13: warning: '__makedev_from_sys_types' is deprecated:
-  In the GNU C Library, `makedev' is defined by <sys/sysmacros.h>.
-  For historical compatibility, it is currently defined by
-  <sys/types.h> as well, but we plan to remove this soon.
-  To use `makedev', include <sys/sysmacros.h> directly.
-  If you did not intend to use a system-defined macro `makedev',
-  you should #undef it after including <sys/types.h>.
-  [-Wdeprecated-declarations]
-             me->me_dev = makedev (devmaj, devmin);
-             ^~
-In file included from /usr/include/features.h:397:0,
-                 from /usr/include/sys/types.h:25,
-                 from ./sys/types.h:28,
-                 from ../../gllib/mountlist.h:23,
-                 from ../../gllib/mountlist.c:20:
-/usr/include/sys/sysmacros.h:89:1: note: declared here
- __SYSMACROS_DEFINE_MAKEDEV (__SYSMACROS_FST_IMPL_TEMPL)
- ^
-
-Fix it by including the right headers.  We also need a fix to
-autoconf's AC_HEADER_MAJOR, but that's a separate patch.
-
-* m4/mountlist.m4 (gl_PREREQ_MOUTLIST_EXTRA): Include
-AC_HEADER_MAJOR.
-* lib/mountlist.c (includes): Use correct headers.
-
-Signed-off-by: Eric Blake <eblake@redhat.com>
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Backported on version 4.6 after being retrieved from
-http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=patch;h=4da63c58]
----
- gl/lib/mountlist.c | 6 ++++++
- m4/mountlist.m4 | 3 ++-
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/gl/lib/mountlist.c b/lib/mountlist.c
-index bb4e4ee..cf4020e 100644
---- a/gl/lib/mountlist.c
-+++ b/gl/lib/mountlist.c
-@@ -37,6 +37,12 @@
- # include <sys/param.h>
- #endif
- 
-+#if MAJOR_IN_MKDEV
-+# include <sys/mkdev.h>
-+#elif MAJOR_IN_SYSMACROS
-+# include <sys/sysmacros.h>
-+#endif
-+
- #if defined MOUNTED_GETFSSTAT   /* OSF_1 and Darwin1.3.x */
- # if HAVE_SYS_UCRED_H
- #  include <grp.h> /* needed on OSF V4.0 for definition of NGROUPS,
-diff --git a/m4/mountlist.m4 b/m4/mountlist.m4
-index 2e2ca37..b6724fa 100644
---- a/gl/m4/mountlist.m4
-+++ b/gl/m4/mountlist.m4
-@@ -1,4 +1,4 @@
--# serial 11
-+# serial 12
- dnl Copyright (C) 2002-2006, 2009-2015 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
-@@ -15,5 +15,6 @@ AC_DEFUN([gl_PREREQ_MOUNTLIST_EXTRA],
- [
-   dnl Note gl_LIST_MOUNTED_FILE_SYSTEMS checks for mntent.h, not sys/mntent.h.
-   AC_CHECK_HEADERS([sys/mntent.h])
-+  AC_HEADER_MAJOR()dnl for use of makedev ()
-   gl_FSTYPENAME
- ])
--- 
-1.9.1
-
diff --git a/package/findutils/0002-fflush-adjust-to-glibc-2-28-libio-h-removal.patch b/package/findutils/0002-fflush-adjust-to-glibc-2-28-libio-h-removal.patch
deleted file mode 100644
index 3144f5e326..0000000000
--- a/package/findutils/0002-fflush-adjust-to-glibc-2-28-libio-h-removal.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From 4af4a4a71827c0bc5e0ec67af23edef4f15cee8e Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 5 Mar 2018 10:56:29 -0800
-Subject: [PATCH] fflush: adjust to glibc 2.28 libio.h removal
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Daniel P. Berrang?? in:
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
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Backported in version 4.6 after being retrieved from
-http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=patch;h=4af4a4a7]
----
- gl/lib/fflush.c     |  6 +++---
- gl/lib/fpurge.c     |  2 +-
- gl/lib/freadahead.c |  2 +-
- gl/lib/freading.c   |  2 +-
- gl/lib/fseeko.c     |  4 ++--
- gl/lib/stdio-impl.h |  6 ++++++
- 6 files changed, 14 insertions(+), 8 deletions(-)
-
-diff --git a/gl/lib/fflush.c b/gl/lib/fflush.c
-index 983ade0..a6edfa1 100644
---- a/gl/lib/fflush.c
-+++ b/gl/lib/fflush.c
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
-diff --git a/gl/lib/fpurge.c b/gl/lib/fpurge.c
-index b1d417c..3aedcc3 100644
---- a/gl/lib/fpurge.c
-+++ b/gl/lib/fpurge.c
-@@ -62,7 +62,7 @@ fpurge (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_IO_read_end = fp->_IO_read_ptr;
-   fp->_IO_write_ptr = fp->_IO_write_base;
-   /* Avoid memory leak when there is an active ungetc buffer.  */
-diff --git a/gl/lib/freadahead.c b/gl/lib/freadahead.c
-index c2ecb5b..23ec76e 100644
---- a/gl/lib/freadahead.c
-+++ b/gl/lib/freadahead.c
-@@ -30,7 +30,7 @@ extern size_t __sreadahead (FILE *);
- size_t
- freadahead (FILE *fp)
- {
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_write_ptr > fp->_IO_write_base)
-     return 0;
-   return (fp->_IO_read_end - fp->_IO_read_ptr)
-diff --git a/gl/lib/freading.c b/gl/lib/freading.c
-index 73c28ac..c24d0c8 100644
---- a/gl/lib/freading.c
-+++ b/gl/lib/freading.c
-@@ -31,7 +31,7 @@ freading (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   return ((fp->_flags & _IO_NO_WRITES) != 0
-           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
-               && fp->_IO_read_base != NULL));
-diff --git a/gl/lib/fseeko.c b/gl/lib/fseeko.c
-index 0101ab5..193f4e8 100644
---- a/gl/lib/fseeko.c
-+++ b/gl/lib/fseeko.c
-@@ -47,7 +47,7 @@ fseeko (FILE *fp, off_t offset, int whence)
- #endif
- 
-   /* These tests are based on fpurge.c.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_read_end == fp->_IO_read_ptr
-       && fp->_IO_write_ptr == fp->_IO_write_base
-       && fp->_IO_save_base == NULL)
-@@ -123,7 +123,7 @@ fseeko (FILE *fp, off_t offset, int whence)
-           return -1;
-         }
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-       fp->_flags &= ~_IO_EOF_SEEN;
-       fp->_offset = pos;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-diff --git a/gl/lib/stdio-impl.h b/gl/lib/stdio-impl.h
-index 78d896e..05c5752 100644
---- a/gl/lib/stdio-impl.h
-+++ b/gl/lib/stdio-impl.h
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
- 
--- 
-1.9.1
-
diff --git a/package/findutils/findutils.hash b/package/findutils/findutils.hash
index d5c5519304..392c62d254 100644
--- a/package/findutils/findutils.hash
+++ b/package/findutils/findutils.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d	findutils-4.6.0.tar.gz
+sha256	c5fefbdf9858f7e4feb86f036e1247a54c79fc2d8e4b7064d5aaa1f47dfa789a	findutils-4.7.0.tar.xz
+
+# Hash for license file
+sha256	3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986	COPYING
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index b0a2ea8c5f..13d8271e18 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-FINDUTILS_VERSION = 4.6.0
+FINDUTILS_VERSION = 4.7.0
+FINDUTILS_SOURCE = findutils-$(FINDUTILS_VERSION).tar.xz
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPL-3.0+
 FINDUTILS_LICENSE_FILES = COPYING
@@ -12,7 +13,5 @@ FINDUTILS_CONF_ENV = \
 	gl_cv_func_stdin=yes \
 	ac_cv_func_working_mktime=yes \
 	gl_cv_func_wcwidth_works=yes
-# 0001-mountlist-include-sysmacros-h-for-glibc.patch
-FINDUTILS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.23.0.rc1
