From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 23 Jul 2007 04:29:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070723112941.2BCB1A65E4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-23 04:29:38 -0700 (Mon, 23 Jul 2007)
New Revision: 19216

Log:
- the external-toolchain.mk is not parallel-safe, so ignore it.
- first step of minor adjustments to allow for a toplevel 'make -j128' (regardless of BR2_JLEVEL)


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-23 11:00:59 UTC (rev 19215)
+++ trunk/buildroot/Makefile	2007-07-23 11:29:38 UTC (rev 19216)
@@ -155,11 +155,13 @@
 #
 ##############################################################
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGETS:=uclibc-configured binutils gcc uclibc-target-utils
+BASE_TARGETS:=uclibc-configured binutils gcc uclibc-target-utils
 else
-TARGETS:=uclibc
+BASE_TARGETS:=uclibc
 endif
+TARGETS:=
 
+
 PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
 #"))
 TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
@@ -167,7 +169,6 @@
 BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
 #"))
 
-
 include toolchain/Makefile.in
 include package/Makefile.in
 
@@ -186,10 +187,17 @@
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+# avoid pulling in external toolchain which is broken for toplvl parallel builds
+include $(filter-out $(wildcard toolchain/external-toolchain/*),$(wildcard toolchain/*/*.mk))
+else
 include toolchain/*/*.mk
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX),y)
 TARGETS+=linux26-modules
 endif
+
 include package/*/*.mk
 
 # target stuff is last so it can override anything else
@@ -199,6 +207,9 @@
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 
+# all targets depend on the crosscompiler and it's prerequisites
+$(TARGETS): $(BASE_TARGETS)
+
 world: $(DL_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) \
 	$(BINARIES_DIR) $(STAGING_DIR) $(TARGET_DIR) bsp $(TARGETS)
 dirs: $(DL_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) $(STAGING_DIR)
