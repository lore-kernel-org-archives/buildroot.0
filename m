From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Mar 2008 23:38:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080330063846.B77563C4A2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-29 23:38:46 -0700 (Sat, 29 Mar 2008)
New Revision: 21570

Log:
Ensure shell environment is handled correctly

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-30 06:29:30 UTC (rev 21569)
+++ trunk/buildroot/Makefile	2008-03-30 06:38:46 UTC (rev 21570)
@@ -33,14 +33,10 @@
 
 
 # Use shell variables, if defined
-ifneq ($(BUILDROOT_DL_DIR),)
-BR2_DL_DIR:=$(BUILDROOT_DL_DIR)
-endif
-
 ifneq ($(BUILDROOT_LOCAL),)
-LOCAL:=$(BUILDROOT_LOCAL)
+BR2_LOCAL:=$(BUILDROOT_LOCAL)
 else
-LOCAL:=$(TOPDIR)/local
+BR2_LOCAL:=$(TOPDIR)/local
 endif
 
 # $(shell find . -name *_defconfig |sed 's/.*\///')
@@ -51,10 +47,16 @@
 -include $(TOPDIR).config
 else
 # if "make" command
--include $(LOCAL)/$(BOARD)/$(BOARD).config
+-include $(BR2_LOCAL)/$(BOARD)/$(BOARD).config
 endif
 endif
 
+# Override BR2_DL_DIR if shell variable defined
+ifneq ($(BUILDROOT_DL_DIR),)
+BR2_DL_DIR:=$(BUILDROOT_DL_DIR)
+endif
+LOCAL:=$(BR2_LOCAL)
+
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifdef V
