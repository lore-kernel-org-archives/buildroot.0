From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 23:58:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080705065855.034353C66C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 23:58:53 -0700 (Fri, 04 Jul 2008)
New Revision: 22645

Log:
Add version number to log

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-07-05 06:54:35 UTC (rev 22644)
+++ trunk/buildroot/Makefile	2008-07-05 06:58:53 UTC (rev 22645)
@@ -475,9 +475,18 @@
 
 prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
 
-log:
-	$(MAKE) > $(PROJECT).log 2>&1 
+.lognr:
+	@echo "0" > .lognr
 
+log:	.lognr
+	@expr `cat .lognr` + 1 > .lognr	
+	@echo Creating $(PROJECT)-`cat .lognr`.log
+	@$(MAKE) > $(PROJECT)-`cat .lognr`.log 2>&1 
+
+tail:
+	grep "\.tar\."  $(PROJECT)-`cat .lognr`.log
+	tail --lines=25 $(PROJECT)-`cat .lognr`.log
+
 cross: $(BASE_TARGETS)
 
 help:
