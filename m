From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 22 Dec 2008 22:10:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rxvt
Message-ID: <20081222221035.A895D7688F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-22 22:10:35 +0000 (Mon, 22 Dec 2008)
New Revision: 24512

Log:
rxvt: don't use getpt()

uClibc can be (and per default is) configured to not implement the glibc
function getpt(3), so use the non-getpt rxvt configuration.

Added:
   trunk/buildroot/package/rxvt/rxvt-2.7.5-include.patch

Modified:
   trunk/buildroot/package/rxvt/rxvt.mk


Changeset:
Added: trunk/buildroot/package/rxvt/rxvt-2.7.5-include.patch
===================================================================
--- trunk/buildroot/package/rxvt/rxvt-2.7.5-include.patch	                        (rev 0)
+++ trunk/buildroot/package/rxvt/rxvt-2.7.5-include.patch	2008-12-22 22:10:35 UTC (rev 24512)
@@ -0,0 +1,17 @@
+uClibc doesn't have <sys/stropts.h>
+---
+ src/init.h |    1 -
+ 1 file changed, 1 deletion(-)
+
+Index: rxvt-2.7.5/src/init.h
+===================================================================
+--- rxvt-2.7.5.orig/src/init.h
++++ rxvt-2.7.5/src/init.h
+@@ -16,7 +16,6 @@
+ 
+ #if defined(PTYS_ARE_PTMX) && !defined(__CYGWIN32__)
+ # include <sys/resource.h>	/* for struct rlimit */
+-# include <sys/stropts.h>	/* for I_PUSH */
+ # define _NEW_TTY_CTRL		/* to get proper defines in <termios.h> */
+ #endif
+ 

Modified: trunk/buildroot/package/rxvt/rxvt.mk
===================================================================
--- trunk/buildroot/package/rxvt/rxvt.mk	2008-12-22 22:10:30 UTC (rev 24511)
+++ trunk/buildroot/package/rxvt/rxvt.mk	2008-12-22 22:10:35 UTC (rev 24512)
@@ -42,7 +42,7 @@
 	(cd $(RXVT_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		rxvt_cv_ptys=GLIBC \
+		rxvt_cv_ptys=USG \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
