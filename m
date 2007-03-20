From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 20 Mar 2007 10:21:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/makedevs
Message-ID: <20070320172135.6471A4809F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-20 10:21:35 -0700 (Tue, 20 Mar 2007)
New Revision: 18182

Log:
- make it work with MacOSX. Closes #1252


Modified:
   trunk/buildroot/target/makedevs/makedevs.c


Changeset:
Modified: trunk/buildroot/target/makedevs/makedevs.c
===================================================================
--- trunk/buildroot/target/makedevs/makedevs.c	2007-03-20 16:52:44 UTC (rev 18181)
+++ trunk/buildroot/target/makedevs/makedevs.c	2007-03-20 17:21:35 UTC (rev 18182)
@@ -31,9 +31,10 @@
 #include <stdarg.h>
 #include <sys/stat.h>
 #include <sys/types.h>
+#ifndef __APPLE__
 #include <sys/sysmacros.h>     /* major() and minor() */
+#endif
 
-
 const char *bb_applet_name;
 
 void bb_verror_msg(const char *s, va_list p)
@@ -146,7 +147,7 @@
 		if (mkdir(path, 0777) < 0) {
 			/* If we failed for any other reason than the directory
 			 * already exists, output a diagnostic and return -1.*/
-			if (errno != EEXIST
+			if ((errno != EEXIST && errno != EISDIR)
 					|| !(flags & FILEUTILS_RECUR)
 					|| (stat(path, &st) < 0 || !S_ISDIR(st.st_mode))) {
 				fail_msg = "create";
