From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 01:45:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/proftpd
Message-ID: <20080618084529.3973AF8007@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-18 01:45:23 -0700 (Wed, 18 Jun 2008)
New Revision: 22407

Log:
proftp: bump version and fix compilation on 2.6.24+

Based on patch by Thiago A. Corr?\234a.


Added:
   trunk/buildroot/package/proftpd/proftpd-1.3.1-bcopy.patch
   trunk/buildroot/package/proftpd/proftpd-1.3.1-fix-kernel-header-capability-version.patch

Removed:
   trunk/buildroot/package/proftpd/proftpd-1.3.0a-bcopy.patch

Modified:
   trunk/buildroot/package/proftpd/proftpd.mk


Changeset:
Deleted: trunk/buildroot/package/proftpd/proftpd-1.3.0a-bcopy.patch
===================================================================
--- trunk/buildroot/package/proftpd/proftpd-1.3.0a-bcopy.patch	2008-06-18 08:45:12 UTC (rev 22406)
+++ trunk/buildroot/package/proftpd/proftpd-1.3.0a-bcopy.patch	2008-06-18 08:45:23 UTC (rev 22407)
@@ -1,173 +0,0 @@
-diff -urN proftpd-1.3.0a-0rig/ChangeLog proftpd-1.3.0a/ChangeLog
---- proftpd-1.3.0a-0rig/ChangeLog	2006-04-16 23:39:01.000000000 +0200
-+++ proftpd-1.3.0a/ChangeLog	2007-09-24 08:18:14.000000000 +0200
-@@ -1,3 +1,11 @@
-+2007-09-24 08:00  ulfs
-+
-+	* contrib/mod_load/mod_load.c.in
-+	* include/conf.h
-+	* lib/glibc-glob.c
-+	
-+	Replace bzero/bcopy with memset/memcpy
-+
- 2006-04-16 14:36  castaglia
- 
- 	* contrib/dist/rpm/proftpd.spec, include/version.h, NEWS: 
-diff -urN proftpd-1.3.0a-0rig/config.h.in proftpd-1.3.0a/config.h.in
---- proftpd-1.3.0a-0rig/config.h.in	2005-10-20 01:28:30.000000000 +0200
-+++ proftpd-1.3.0a/config.h.in	2007-09-24 08:24:38.000000000 +0200
-@@ -190,7 +190,7 @@
- #undef STACK_DIRECTION
- 
- /* Define if you have the ANSI C header files.  */
--#undef STDC_HEADERS
-+#define STDC_HEADERS	1
- 
- /* Define if you can safely include both <sys/time.h> and <time.h>.  */
- #undef TIME_WITH_SYS_TIME
-@@ -202,10 +202,10 @@
- #undef uid_t
- 
- /* The number of bytes in a short.  */
--#undef SIZEOF_SHORT
-+#define SIZEOF_SHORT	2
- 
- /* The number of bytes in an int.  */
--#undef SIZEOF_INT
-+#define SIZEOF_INT	4
- 
- /* The number of bytes in a long.  */
- #undef SIZEOF_LONG
-@@ -222,9 +222,6 @@
- /* The number of bytes in a time_t.  */
- #undef SIZEOF_TIME_T
- 
--/* Define if you have the bcopy function.  */
--#undef HAVE_BCOPY
--
- /* Define if you have the crypt function.  */
- #undef HAVE_CRYPT
- 
-@@ -307,7 +304,7 @@
- #undef HAVE_INET_PTON
- 
- /* Define if you have the memcpy function.  */
--#undef HAVE_MEMCPY
-+#define HAVE_MEMCPY	1
- 
- /* Define if you have the mempcpy function.  */
- #undef HAVE_MEMPCPY
-diff -urN proftpd-1.3.0a-0rig/contrib/mod_load/mod_load.c.in proftpd-1.3.0a/contrib/mod_load/mod_load.c.in
---- proftpd-1.3.0a-0rig/contrib/mod_load/mod_load.c.in	2005-01-07 00:39:59.000000000 +0100
-+++ proftpd-1.3.0a/contrib/mod_load/mod_load.c.in	2007-09-24 08:02:01.000000000 +0200
-@@ -651,7 +651,7 @@
-       for (i = 0; i < conf.config_maxclass; ++i)
-         {
-           struct class_stats stats;
--          bzero ((char *) &stats, sizeof stats);
-+          memset ((char *) &stats, 0, sizeof stats);
- 
-           desc.sd_type = CPUTYPE_CLASS;
-           desc.sd_objid = i;
-diff -urN proftpd-1.3.0a-0rig/include/conf.h proftpd-1.3.0a/include/conf.h
---- proftpd-1.3.0a-0rig/include/conf.h	2005-06-30 02:39:16.000000000 +0200
-+++ proftpd-1.3.0a/include/conf.h	2007-09-24 08:20:26.000000000 +0200
-@@ -118,10 +118,6 @@
- #  define strrchr rindex
- # endif
- char *strchr(),*strrchr();
--# ifndef HAVE_MEMCPY
--#  define memcpy(d,s,n) bcopy((s),(d),(n))
--#  define memmove(d,s,n) bcopy((s),(d),(n))
--# endif
- #endif
- 
- #ifdef HAVE_BSTRING_H
-@@ -264,13 +260,6 @@
- off_t lseek(int, off_t, int);
- #endif
- 
--/* See if we have bcopy, if not define them to use the memcpy functions */
--
--#ifndef HAVE_BCOPY
--# define bcopy(s,d,n)	memcpy((d),(s),(n))
--# define bzero(d,n)	memset((d),0,(n))
--#endif
--
- /* Solaris has __vsnprintf, but no vsnprintf */
- #if ! defined(HAVE_VSNPRINTF) && defined(HAVE___VSNPRINTF)
- # undef vsnprintf
-diff -urN proftpd-1.3.0a-0rig/lib/glibc-glob.c proftpd-1.3.0a/lib/glibc-glob.c
---- proftpd-1.3.0a-0rig/lib/glibc-glob.c	2006-03-22 23:10:34.000000000 +0100
-+++ proftpd-1.3.0a/lib/glibc-glob.c	2007-09-24 08:07:48.000000000 +0200
-@@ -215,18 +215,8 @@
- 
- #ifndef	ANSI_STRING
- 
--# ifndef bzero
--extern void bzero ();
--# endif
--# ifndef bcopy
--extern void bcopy ();
--# endif
--
--# define memcpy(d, s, n)	bcopy ((s), (d), (n))
- # define strrchr	rindex
- /* memset is only used for zero here, but let's be paranoid.  */
--# define memset(s, better_be_zero, n) \
--  ((void) ((better_be_zero) == 0 ? (bzero((s), (n)), 0) : (abort(), 0)))
- #endif	/* Not ANSI_STRING.  */
- 
- #if !defined HAVE_STRCOLL && !defined _LIBC
-diff -urN proftpd-1.3.0a-0rig/lib/libltdl/config-h.in proftpd-1.3.0a/lib/libltdl/config-h.in
---- proftpd-1.3.0a-0rig/lib/libltdl/config-h.in	2004-10-29 07:17:55.000000000 +0200
-+++ proftpd-1.3.0a/lib/libltdl/config-h.in	2007-09-24 08:25:40.000000000 +0200
-@@ -21,9 +21,6 @@
- /* Define to 1 if you have the <assert.h> header file. */
- #undef HAVE_ASSERT_H
- 
--/* Define to 1 if you have the `bcopy' function. */
--#undef HAVE_BCOPY
--
- /* Define to 1 if you have the `closedir' function. */
- #undef HAVE_CLOSEDIR
- 
-@@ -74,7 +71,7 @@
- #undef HAVE_MALLOC_H
- 
- /* Define to 1 if you have the `memcpy' function. */
--#undef HAVE_MEMCPY
-+#define HAVE_MEMCPY	1
- 
- /* Define to 1 if you have the `memmove' function. */
- #undef HAVE_MEMMOVE
-@@ -180,7 +177,7 @@
- #undef PACKAGE_VERSION
- 
- /* Define to 1 if you have the ANSI C header files. */
--#undef STDC_HEADERS
-+#define STDC_HEADERS	1
- 
- /* Define to empty if `const' does not conform to ANSI C. */
- #undef const
-diff -urN proftpd-1.3.0a-0rig/lib/libltdl/ltdl.c proftpd-1.3.0a/lib/libltdl/ltdl.c
---- proftpd-1.3.0a-0rig/lib/libltdl/ltdl.c	2004-10-29 07:17:55.000000000 +0200
-+++ proftpd-1.3.0a/lib/libltdl/ltdl.c	2007-09-24 08:13:51.000000000 +0200
-@@ -372,9 +372,6 @@
- 	  if you need that behaviour.  */
- #if ! HAVE_MEMCPY
- 
--#  if HAVE_BCOPY
--#    define memcpy(dest, src, size)	bcopy (src, dest, size)
--#  else
- #    define memcpy rpl_memcpy
- 
- static lt_ptr memcpy LT_PARAMS((lt_ptr dest, const lt_ptr src, size_t size));
-@@ -395,7 +392,6 @@
-   return dest;
- }
- 
--#  endif /* !HAVE_BCOPY */
- #endif   /* !HAVE_MEMCPY */
- 
- #if ! HAVE_MEMMOVE

Copied: trunk/buildroot/package/proftpd/proftpd-1.3.1-bcopy.patch (from rev 22406, trunk/buildroot/package/proftpd/proftpd-1.3.0a-bcopy.patch)
===================================================================
--- trunk/buildroot/package/proftpd/proftpd-1.3.1-bcopy.patch	                        (rev 0)
+++ trunk/buildroot/package/proftpd/proftpd-1.3.1-bcopy.patch	2008-06-18 08:45:23 UTC (rev 22407)
@@ -0,0 +1,173 @@
+---
+ config.h.in                    |   11 ++++-------
+ contrib/mod_load/mod_load.c.in |    2 +-
+ include/conf.h                 |   11 -----------
+ lib/glibc-glob.c               |   10 ----------
+ lib/libltdl/config-h.in        |    7 ++-----
+ lib/libltdl/ltdl.c             |    4 ----
+ 6 files changed, 7 insertions(+), 38 deletions(-)
+
+Index: proftpd-1.3.1/config.h.in
+===================================================================
+--- proftpd-1.3.1.orig/config.h.in
++++ proftpd-1.3.1/config.h.in
+@@ -202,7 +202,7 @@
+ #undef STACK_DIRECTION
+ 
+ /* Define if you have the ANSI C header files.  */
+-#undef STDC_HEADERS
++#define STDC_HEADERS	1
+ 
+ /* Define if you can safely include both <sys/time.h> and <time.h>.  */
+ #undef TIME_WITH_SYS_TIME
+@@ -214,10 +214,10 @@
+ #undef uid_t
+ 
+ /* The number of bytes in a short.  */
+-#undef SIZEOF_SHORT
++#define SIZEOF_SHORT	2
+ 
+ /* The number of bytes in an int.  */
+-#undef SIZEOF_INT
++#define SIZEOF_INT	4
+ 
+ /* The number of bytes in a long.  */
+ #undef SIZEOF_LONG
+@@ -234,9 +234,6 @@
+ /* The number of bytes in a time_t.  */
+ #undef SIZEOF_TIME_T
+ 
+-/* Define if you have the bcopy function.  */
+-#undef HAVE_BCOPY
+-
+ /* Define if you have the crypt function.  */
+ #undef HAVE_CRYPT
+ 
+@@ -319,7 +316,7 @@
+ #undef HAVE_INET_PTON
+ 
+ /* Define if you have the memcpy function.  */
+-#undef HAVE_MEMCPY
++#define HAVE_MEMCPY	1
+ 
+ /* Define if you have the mempcpy function.  */
+ #undef HAVE_MEMPCPY
+Index: proftpd-1.3.1/contrib/mod_load/mod_load.c.in
+===================================================================
+--- proftpd-1.3.1.orig/contrib/mod_load/mod_load.c.in
++++ proftpd-1.3.1/contrib/mod_load/mod_load.c.in
+@@ -651,7 +651,7 @@
+       for (i = 0; i < conf.config_maxclass; ++i)
+         {
+           struct class_stats stats;
+-          bzero ((char *) &stats, sizeof stats);
++          memset ((char *) &stats, 0, sizeof stats);
+ 
+           desc.sd_type = CPUTYPE_CLASS;
+           desc.sd_objid = i;
+Index: proftpd-1.3.1/include/conf.h
+===================================================================
+--- proftpd-1.3.1.orig/include/conf.h
++++ proftpd-1.3.1/include/conf.h
+@@ -118,10 +118,6 @@
+ #  define strrchr rindex
+ # endif
+ char *strchr(),*strrchr();
+-# ifndef HAVE_MEMCPY
+-#  define memcpy(d,s,n) bcopy((s),(d),(n))
+-#  define memmove(d,s,n) bcopy((s),(d),(n))
+-# endif
+ #endif
+ 
+ #ifdef HAVE_BSTRING_H
+@@ -278,13 +274,6 @@
+ off_t lseek(int, off_t, int);
+ #endif
+ 
+-/* See if we have bcopy, if not define them to use the memcpy functions */
+-
+-#ifndef HAVE_BCOPY
+-# define bcopy(s,d,n)	memcpy((d),(s),(n))
+-# define bzero(d,n)	memset((d),0,(n))
+-#endif
+-
+ /* Solaris has __vsnprintf, but no vsnprintf */
+ #if ! defined(HAVE_VSNPRINTF) && defined(HAVE___VSNPRINTF)
+ # undef vsnprintf
+Index: proftpd-1.3.1/lib/glibc-glob.c
+===================================================================
+--- proftpd-1.3.1.orig/lib/glibc-glob.c
++++ proftpd-1.3.1/lib/glibc-glob.c
+@@ -215,18 +215,8 @@
+ 
+ #ifndef	ANSI_STRING
+ 
+-# ifndef bzero
+-extern void bzero ();
+-# endif
+-# ifndef bcopy
+-extern void bcopy ();
+-# endif
+-
+-# define memcpy(d, s, n)	bcopy ((s), (d), (n))
+ # define strrchr	rindex
+ /* memset is only used for zero here, but let's be paranoid.  */
+-# define memset(s, better_be_zero, n) \
+-  ((void) ((better_be_zero) == 0 ? (bzero((s), (n)), 0) : (abort(), 0)))
+ #endif	/* Not ANSI_STRING.  */
+ 
+ #if !defined HAVE_STRCOLL && !defined _LIBC
+Index: proftpd-1.3.1/lib/libltdl/config-h.in
+===================================================================
+--- proftpd-1.3.1.orig/lib/libltdl/config-h.in
++++ proftpd-1.3.1/lib/libltdl/config-h.in
+@@ -21,9 +21,6 @@
+ /* Define to 1 if you have the <assert.h> header file. */
+ #undef HAVE_ASSERT_H
+ 
+-/* Define to 1 if you have the `bcopy' function. */
+-#undef HAVE_BCOPY
+-
+ /* Define to 1 if you have the `closedir' function. */
+ #undef HAVE_CLOSEDIR
+ 
+@@ -74,7 +71,7 @@
+ #undef HAVE_MALLOC_H
+ 
+ /* Define to 1 if you have the `memcpy' function. */
+-#undef HAVE_MEMCPY
++#define HAVE_MEMCPY	1
+ 
+ /* Define to 1 if you have the `memmove' function. */
+ #undef HAVE_MEMMOVE
+@@ -180,7 +177,7 @@
+ #undef PACKAGE_VERSION
+ 
+ /* Define to 1 if you have the ANSI C header files. */
+-#undef STDC_HEADERS
++#define STDC_HEADERS	1
+ 
+ /* Define to empty if `const' does not conform to ANSI C. */
+ #undef const
+Index: proftpd-1.3.1/lib/libltdl/ltdl.c
+===================================================================
+--- proftpd-1.3.1.orig/lib/libltdl/ltdl.c
++++ proftpd-1.3.1/lib/libltdl/ltdl.c
+@@ -372,9 +372,6 @@
+ 	  if you need that behaviour.  */
+ #if ! HAVE_MEMCPY
+ 
+-#  if HAVE_BCOPY
+-#    define memcpy(dest, src, size)	bcopy (src, dest, size)
+-#  else
+ #    define memcpy rpl_memcpy
+ 
+ static lt_ptr memcpy LT_PARAMS((lt_ptr dest, const lt_ptr src, size_t size));
+@@ -395,7 +392,6 @@
+   return dest;
+ }
+ 
+-#  endif /* !HAVE_BCOPY */
+ #endif   /* !HAVE_MEMCPY */
+ 
+ #if ! HAVE_MEMMOVE

Added: trunk/buildroot/package/proftpd/proftpd-1.3.1-fix-kernel-header-capability-version.patch
===================================================================
--- trunk/buildroot/package/proftpd/proftpd-1.3.1-fix-kernel-header-capability-version.patch	                        (rev 0)
+++ trunk/buildroot/package/proftpd/proftpd-1.3.1-fix-kernel-header-capability-version.patch	2008-06-18 08:45:23 UTC (rev 22407)
@@ -0,0 +1,12 @@
+--- a/lib/libcap/libcap.h	2008-04-24 19:46:29.475883739 +0200
++++ b/lib/libcap/libcap.h	2008-04-24 19:48:31.116088563 +0200
+@@ -52,7 +52,8 @@
+  */
+ 
+ #if !defined(_LINUX_CAPABILITY_VERSION) || \
+-            (_LINUX_CAPABILITY_VERSION != 0x19980330)
++           ((_LINUX_CAPABILITY_VERSION != 0x19980330) && \
++            (_LINUX_CAPABILITY_VERSION != 0x20071026))
+ 
+ # error "Kernel <linux/capability.h> does not match library"
+ # error "file "libcap.h" --> fix and recompile libcap"

Modified: trunk/buildroot/package/proftpd/proftpd.mk
===================================================================
--- trunk/buildroot/package/proftpd/proftpd.mk	2008-06-18 08:45:12 UTC (rev 22406)
+++ trunk/buildroot/package/proftpd/proftpd.mk	2008-06-18 08:45:23 UTC (rev 22407)
@@ -3,7 +3,7 @@
 # proftpd
 #
 #############################################################
-PROFTPD_VERSION:=1.3.0a
+PROFTPD_VERSION:=1.3.1
 PROFTPD_SOURCE:=proftpd-$(PROFTPD_VERSION).tar.bz2
 PROFTPD_SITE:=ftp://ftp.proftpd.org/distrib/source/
 PROFTPD_DIR:=$(BUILD_DIR)/proftpd-$(PROFTPD_VERSION)
@@ -23,6 +23,7 @@
 $(PROFTPD_DIR)/.unpacked: $(DL_DIR)/$(PROFTPD_SOURCE)
 	$(PROFTPD_CAT) $(DL_DIR)/$(PROFTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(PROFTPD_DIR)
+	toolchain/patch-kernel.sh $(PROFTPD_DIR) package/proftpd/ proftpd-$(PROFTPD_VERSION)\*.patch;
 	touch $@
 
 $(PROFTPD_DIR)/.configured: $(PROFTPD_DIR)/.unpacked
