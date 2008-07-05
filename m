From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  5 Jul 2008 02:22:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080705092238.AB5163C65B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-05 02:22:38 -0700 (Sat, 05 Jul 2008)
New Revision: 22652

Log:
Add configuration possibility for host Gnome Lib installation

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-07-05 09:18:54 UTC (rev 22651)
+++ trunk/buildroot/Config.in	2008-07-05 09:22:38 UTC (rev 22652)
@@ -78,6 +78,17 @@
 
 	  The default is $(BASE_DIR)/dl
 
+config BR2_HOST_GLIB
+	string "Location of host Gnome library"
+	default "/usr"
+	help
+	  Directory where Gnome is installed on the host
+	  Gnome applications is installed in $(BR2_HOST_LIB)/bin 
+	  This is needed to build libgtk etc.
+	  The default is /usr
+	  It can be overridden by the BUILDROOT_HOST_GLIB
+	  shell variable
+
 source	"target/device/Config.in.mirrors"
 
 config BR2_STAGING_DIR

Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-07-05 09:18:54 UTC (rev 22651)
+++ trunk/buildroot/Makefile	2008-07-05 09:22:38 UTC (rev 22652)
@@ -36,7 +36,7 @@
 ifneq ($(BUILDROOT_LOCAL),)
 BR2_LOCAL:=$(BUILDROOT_LOCAL)
 else
-BR2_LOCAL:=$(TOPDIR)/local
+BR2_LOCAL:=$(TOPDIR)local
 endif
 
 # $(shell find . -name *_defconfig |sed 's/.*\///')
@@ -57,6 +57,12 @@
 endif
 LOCAL:=$(BR2_LOCAL)
 
+ifneq ($(BUILDROOT_HOST_GLIB),)
+HOST_GLIB:=$(BUILDROOT_HOST_GLIB)
+else
+HOST_GLIB:=$(BR2_HOST_GLIB)
+endif
+
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifdef V
@@ -511,4 +517,8 @@
 
 .PHONY: dummy subdirs release distclean clean config oldconfig \
 	menuconfig tags check test depend defconfig help
-	
+
+status:
+	@echo LOCAL=$(LOCAL)
+	@echo BR2_DL_DIR=$(BR2_DL_DIR)
+	@echo HOST_GLIB=$(HOST_GLIB)
