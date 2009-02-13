From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 13 Feb 2009 18:34:58 +0100
Subject: [Buildroot] Local patch
Message-ID: <1234546498.22044.20.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is a simple way of implementing the "local" function.
Adds a "local" directory with a couple of place holders
Config.in
Makefile.in
package.mk
target.mk

When you do

$ make BUILDROOT_LOCAL=<mylocal> loc

the placeholders will include files 
from the user defined directory.

$ make noloc

will remove the local stuff from the build.

With some extra work, it should be possible to  do 

$ make <yourownboard>_defconfig
and have it found in your local directory.

BR
Ulf Samuelsson


Index: Config.in
===================================================================
--- Config.in	(revision 25325)
+++ Config.in	(arbetskopia)
@@ -363,3 +363,9 @@
 source "package/Config.in"
 
 source "target/Config.in"
+
+comment "Local configuration"
+	depends on BR2_HAS_LOCAL
+
+source "local/Config.in"
+
Index: local/package.mk
===================================================================
--- local/package.mk	(revision 0)
+++ local/package.mk	(revision 0)
@@ -0,0 +1 @@
+# Placeholder for users package.mk
Index: local/Makefile.in
===================================================================
--- local/Makefile.in	(revision 0)
+++ local/Makefile.in	(revision 0)
@@ -0,0 +1 @@
+# Placeholder for users Makefile.in
Index: local/Config.in
===================================================================
--- local/Config.in	(revision 0)
+++ local/Config.in	(revision 0)
@@ -0,0 +1 @@
+# Placeholder for users Config.in"
Index: local/target.mk
===================================================================
--- local/target.mk	(revision 0)
+++ local/target.mk	(revision 0)
@@ -0,0 +1 @@
+# Placeholder for users target.mk
Index: local/Makefile.setup
===================================================================
--- local/Makefile.setup	(revision 0)
+++ local/Makefile.setup	(revision 0)
@@ -0,0 +1,21 @@
+loc:
+ifeq ($(BUILDROOT_LOCAL),)
+	@echo	"Please define BUILDROOT_LOCAL in your environment"
+else
+	@touch $(BUILDROOT_LOCAL)/Config.in
+	@touch $(BUILDROOT_LOCAL)/package.mk
+	@touch $(BUILDROOT_LOCAL)/Makefile.in
+	@touch $(BUILDROOT_LOCAL)/target.mk
+	@echo "source \"$(BUILDROOT_LOCAL)/Config.in\""	> local/Config.in
+	@echo "include $(BUILDROOT_LOCAL)/Makefile.in"	> local/Makefile.in
+	@echo "include $(BUILDROOT_LOCAL)/package.mk"	> local/package.mk
+	@echo "include $(BUILDROOT_LOCAL)/target.mk"	> local/target.mk
+	@echo "Buildroot set up to use \"$(BUILDROOT_LOCAL)\" as local
directory"
+endif
+
+noloc:
+	@echo "# Placeholder for users Config.in\""	> local/Config.in
+	@echo "# Placeholder for users Makefile.in"	> local/Makefile.in
+	@echo "# Placeholder for users package.mk"	> local/package.mk
+	@echo "# Placeholder for users target.mk"	> local/target.mk
+
Index: Makefile
===================================================================
--- Makefile	(revision 25325)
+++ Makefile	(arbetskopia)
@@ -30,7 +30,7 @@
 
 noconfig_targets:=menuconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release tags \
-	source-check help
+	source-check help loc noloc
 
 
 # Use shell variables, if defined
@@ -220,6 +220,7 @@
 
 include toolchain/Makefile.in
 include package/Makefile.in
+include local/Makefile.in
 
 #############################################################
 #
@@ -261,11 +262,13 @@
 endif
 
 include package/*/*.mk
+include local/package.mk
 
 TARGETS+=target-devfiles
 
 # target stuff is last so it can override anything else
 include target/Makefile.in
+include local/target.mk
 
 TARGETS+=erase-fakeroots
 
@@ -457,6 +460,8 @@
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -d $(CONFIG_CONFIG_IN)
 
+include local/Makefile.setup
+
 # check if download URLs are outdated
 source-check: allyesconfig
 	$(MAKE) _source-check
