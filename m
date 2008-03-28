From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 28 Mar 2008 00:31:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080328073129.4BFF33C313@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-28 00:31:28 -0700 (Fri, 28 Mar 2008)
New Revision: 21527

Log:
Use BUSYBOX_LOCAL shell variable, if defined

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-28 02:54:42 UTC (rev 21526)
+++ trunk/buildroot/Makefile	2008-03-28 07:31:28 UTC (rev 21527)
@@ -31,25 +31,30 @@
 	defconfig allyesconfig allnoconfig release tags \
 	source-check help
 
-# $(shell find . -name *_defconfig |sed 's/.*\///')
 
-# Pull in the user's configuration file
-ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
-ifeq ($(BOARD),)
--include $(TOPDIR).config
-else
--include $(TOPDIR)/local/$(BOARD)/$(BOARD).config
-endif
-endif
+# Use shell variables, if defined
 ifneq ($(BUILDROOT_DL_DIR),)
 BR2_DL_DIR:=$(BUILDROOT_DL_DIR)
 endif
+
 ifneq ($(BUILDROOT_LOCAL),)
 LOCAL:=$(BUILDROOT_LOCAL)
 else
-LOCAL:=local
+LOCAL:=$(TOPDIR)/local
 endif
 
+# $(shell find . -name *_defconfig |sed 's/.*\///')
+# Pull in the user's configuration file
+ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
+ifeq ($(BOARD),)
+# if "make BOARD=xyz" command
+-include $(TOPDIR).config
+else
+# if "make" command
+-include $(LOCAL)/$(BOARD)/$(BOARD).config
+endif
+endif
+
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifdef V
