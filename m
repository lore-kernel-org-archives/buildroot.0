From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Feb 2007 05:33:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.0.4
Message-ID: <20070209133327.D482E48615@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-09 05:33:26 -0800 (Fri, 09 Feb 2007)
New Revision: 17834

Log:
- cp the 305-libmudflap-susv3-legacy.patch for 4.0.4


Added:
   trunk/buildroot/toolchain/gcc/4.0.4/305-libmudflap-susv3-legacy.patch


Changeset:
Copied: trunk/buildroot/toolchain/gcc/4.0.4/305-libmudflap-susv3-legacy.patch (from rev 17830, trunk/buildroot/toolchain/gcc/4.2/305-libmudflap-susv3-legacy.patch)
===================================================================
--- trunk/buildroot/toolchain/gcc/4.0.4/305-libmudflap-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.0.4/305-libmudflap-susv3-legacy.patch	2007-02-09 13:33:26 UTC (rev 17834)
@@ -0,0 +1,49 @@
+Index: gcc-4.2/libmudflap/mf-hooks2.c
+===================================================================
+--- gcc-4.2/libmudflap/mf-hooks2.c	(revision 119834)
++++ gcc-4.2/libmudflap/mf-hooks2.c	(working copy)
+@@ -427,7 +427,7 @@
+ {
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
+-  bzero (s, n);
++  memset (s, 0, n);
+ }
+ 
+ 
+@@ -437,7 +437,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
+   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
+-  bcopy (src, dest, n);
++  memmove (dest, src, n);
+ }
+ 
+ 
+@@ -447,7 +447,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
+   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
+-  return bcmp (s1, s2, n);
++  return n == 0 ? 0 : memcmp (s1, s2, n);
+ }
+ 
+ 
+@@ -456,7 +456,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
+-  return index (s, c);
++  return strchr (s, c);
+ }
+ 
+ 
+@@ -465,7 +465,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
+-  return rindex (s, c);
++  return strrchr (s, c);
+ }
+ 
+ /* XXX:  stpcpy, memccpy */
