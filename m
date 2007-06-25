From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 03:56:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070625105613.13C50A45FD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 03:56:13 -0700 (Mon, 25 Jun 2007)
New Revision: 18923

Log:
- Search for defconfigs in target, not entire tree
  This patch changes the way the top level Makefile searches for a
  <board>_defconfig file, it will only look in the target/ directory and its sub
  directories.

  The patch also enables loading a defconfig even if there already is a .config.
  (Hans-Christian Egtvedt)


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-06-25 10:55:35 UTC (rev 18922)
+++ trunk/buildroot/Makefile	2007-06-25 10:56:13 UTC (rev 18923)
@@ -245,10 +245,6 @@
 defconfig: $(CONFIG)/conf
 	@$(CONFIG)/conf -d $(CONFIG_CONFIG_IN)
 
-%_defconfig: $(CONFIG)/conf
-	cp $(shell find . -name $@) .config
-	@$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
-
 # check if download URLs are outdated 
 source-check: allyesconfig
 	$(MAKE) _source-check
@@ -267,6 +263,11 @@
 
 endif # ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)
 
+%_defconfig: $(CONFIG)/conf
+	cp $(shell find ./target/ -name $@) .config
+	@$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
+
+
 .PHONY: dummy subdirs release distclean clean config oldconfig \
 	menuconfig tags check test depend defconfig
 
