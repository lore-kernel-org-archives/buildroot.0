From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon,  8 Sep 2008 19:06:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/procps
Message-ID: <20080909020653.2F0063C2B9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-08 19:06:52 -0700 (Mon, 08 Sep 2008)
New Revision: 23360

Log:
Support building without WCHAR support


Added:
   trunk/buildroot/package/procps/procps-wchar.patch

Modified:
   trunk/buildroot/package/procps/Config.in


Changeset:
Modified: trunk/buildroot/package/procps/Config.in
===================================================================
--- trunk/buildroot/package/procps/Config.in	2008-09-08 07:26:12 UTC (rev 23359)
+++ trunk/buildroot/package/procps/Config.in	2008-09-09 02:06:52 UTC (rev 23360)
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PROCPS
 	bool "procps"
 	select BR2_PACKAGE_NCURSES
-	depends on BR2_USE_WCHAR
 	help
 	  Standard informational utilities and process-handling tools.
 	  Provides things like kill, ps, uptime, free, top, etc...

Added: trunk/buildroot/package/procps/procps-wchar.patch
===================================================================
--- trunk/buildroot/package/procps/procps-wchar.patch	                        (rev 0)
+++ trunk/buildroot/package/procps/procps-wchar.patch	2008-09-09 02:06:52 UTC (rev 23360)
@@ -0,0 +1,29 @@
+--- procps-3.2.7/proc/escape.c	2005-01-06 07:50:26.000000000 +1100
++++ procps-3.2.7.fixed/proc/escape.c	2008-09-09 11:55:57.000000000 +1000
+@@ -15,7 +15,7 @@
+ #include "escape.h"
+ #include "readproc.h"
+ 
+-#if (__GNU_LIBRARY__ >= 6)
++#if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_WCHAR__))
+ # include <wchar.h>
+ # include <wctype.h>
+ # include <stdlib.h>  /* MB_CUR_MAX */
+@@ -23,7 +23,7 @@
+ # include <langinfo.h>
+ #endif
+ 
+-#if (__GNU_LIBRARY__ >= 6)
++#if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_WCHAR__))
+ static int escape_str_utf8(char *restrict dst, const char *restrict src, int bufsize, int *maxcells){
+   int my_cells = 0;
+   int my_bytes = 0;
+@@ -123,7 +123,7 @@
+   "********************************"
+   "********************************";
+   
+-#if (__GNU_LIBRARY__ >= 6)
++#if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_WCHAR__))
+   static int utf_init=0;
+   
+   if(utf_init==0){
