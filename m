From: Brian Beattie <beattie@beattie-home.net>
Date: Wed, 13 Aug 2008 12:43:56 -0700
Subject: [Buildroot] [PATCH] Add package help targets help-all
Message-ID: <1218656636.6490.15.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will add the target "help-all" which depends on
$(HELP_TARGETS) which is set in the previous two patches I sent.  If
this patch is accepted I can do patches for other packages.

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto

------------------------------- patch
----------------------------------Index: Makefile
===================================================================
--- Makefile	(revision 23076)
+++ Makefile	(working copy)
@@ -26,6 +26,7 @@
 CONFIG_DEFCONFIG=.defconfig
 CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
+HELP_TARGETS:=help
 
 noconfig_targets:=menuconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release tags \
@@ -251,6 +252,7 @@
 
 ifeq ($(BR2_PACKAGE_LINUX),y)
 TARGETS+=linux26-modules
+HELP_TARGETS+=linux26-help
 endif
 
 include package/*/*.mk
@@ -507,9 +509,14 @@
 	@echo '  source-check           - check all packages for valid
download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo
+	@echo '  help-all               - list package help'
+	@echo
 	@echo 'See docs/README and docs/buildroot.html for further details'
 	@echo
 
+help-all:	$(HELP_TARGETS)
+
 .PHONY: dummy subdirs release distclean clean config oldconfig \
-	menuconfig tags check test depend defconfig help
+	menuconfig tags check test depend defconfig help \
+	help-all $(HELP_TARGETS)
 
