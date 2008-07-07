From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  7 Jul 2008 10:48:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080707174828.59C853C2C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-07 10:48:27 -0700 (Mon, 07 Jul 2008)
New Revision: 22673

Log:
Remove some debug messages

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-07-07 12:04:19 UTC (rev 22672)
+++ trunk/buildroot/Makefile	2008-07-07 17:48:27 UTC (rev 22673)
@@ -460,7 +460,7 @@
 #
 #############################################################
 clean:
-	rm -f .config .config.old .config.cmd .tmpconfig.h
+	rm -f .config .config.old .config.cmd .tmpconfig.h .lognr.*
 	-$(MAKE) -C $(CONFIG) clean
 
 distclean: clean
@@ -479,18 +479,14 @@
 
 prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
 
-.lognr:
+.lognr.$(PROJECT):
 	@echo "0" > .lognr
 
-log:	.lognr
+log:	.lognr.$(PROJECT)
 	@expr `cat .lognr` + 1 > .lognr	
-	@echo Creating $(PROJECT)-`cat .lognr`.log
-	@$(MAKE) > $(PROJECT)-`cat .lognr`.log 2>&1 
+	@echo Creating $(PROJECT)-`cat .lognr.$(PROJECT)`.log
+	@$(MAKE) > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1 
 
-tail:
-	grep "\.tar\."  $(PROJECT)-`cat .lognr`.log
-	tail --lines=25 $(PROJECT)-`cat .lognr`.log
-
 cross: $(BASE_TARGETS)
 
 help:
@@ -516,8 +512,3 @@
 .PHONY: dummy subdirs release distclean clean config oldconfig \
 	menuconfig tags check test depend defconfig help
 
-status:
-	@echo LOCAL=$(LOCAL)
-	@echo BR2_DL_DIR=$(BR2_DL_DIR)
-	@echo HOST_GLIB=$(HOST_GLIB)
-	@echo HOST_GLIB_BIN=$(HOST_GLIB_BIN)
