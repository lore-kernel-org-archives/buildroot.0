From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 10:56:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package project
Message-ID: <20070821175648.CE549A610A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 10:56:47 -0700 (Tue, 21 Aug 2007)
New Revision: 19624

Log:
- our dependencies are project specific. First (untested) attempt to take this fact into account.
  Will need to try to copy eventual pre-existing project-specific deps back
  to package/config in order not to mess up the corresponding timestamps (to avoid superfluous rebuilds)..


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/project/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-21 17:14:56 UTC (rev 19623)
+++ trunk/buildroot/Makefile	2007-08-21 17:56:47 UTC (rev 19624)
@@ -150,8 +150,6 @@
 endif
 PREFERRED_LIB_FLAGS:=--enable-static --enable-shared
 
-BR2_DEPENDS_DIR=$(BASE_DIR)/package/config/buildroot-config/
-
 ##############################################################
 #
 # The list of stuff to build for the target toolchain
@@ -165,7 +163,11 @@
 endif
 TARGETS:=
 
+# setup uor pathes
 include project/Makefile.in
+
+BR2_DEPENDS_DIR=$(PROJECT_BUILD_DIR)/buildroot-config
+
 include toolchain/Makefile.in
 include package/Makefile.in
 
@@ -211,7 +213,12 @@
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS): $(BASE_TARGETS)
 
+$(BR2_DEPENDS_DIR): .config
+	rm -rf $@
+	cp -dpRf $(CONFIG)/buildroot-config $@
+
 dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+	$(BR2_DEPENDS_DIR) \
 	$(BINARIES_DIR) $(PROJECT_BUILD_DIR)
 
 $(BASE_TARGETS): dirs
@@ -223,6 +230,7 @@
 	$(BASE_TARGETS) $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+	$(BR2_DEPENDS_DIR) \
 	$(BINARIES_DIR) $(PROJECT_BUILD_DIR)
 
 #############################################################
@@ -260,7 +268,7 @@
 	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
 	touch $@
 
-$(TARGET_DIR):	$(PROJECT_BUILD_DIR)/.root
+$(TARGET_DIR): $(PROJECT_BUILD_DIR)/.root
 
 erase-fakeroots:
 	rm -f $(PROJECT_BUILD_DIR)/.fakeroot*
@@ -310,11 +318,13 @@
 export HOSTCFLAGS
 
 $(CONFIG)/conf:
+	@mkdir -p $(CONFIG)/buildroot-config
 	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) conf
 	- at if [ ! -f .config ] ; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
 	fi
 $(CONFIG)/mconf:
+	@mkdir -p $(CONFIG)/buildroot-config
 	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) conf mconf
 	- at if [ ! -f .config ] ; then \
 		cp $(CONFIG_DEFCONFIG) .config; \

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-08-21 17:14:56 UTC (rev 19623)
+++ trunk/buildroot/package/Makefile.in	2007-08-21 17:56:47 UTC (rev 19624)
@@ -9,21 +9,7 @@
 MAKE1:=$(HOSTMAKE) MAKE="$(firstword $(HOSTMAKE)) -j1"
 MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 
-# Strip off the annoying quoting
-ARCH:=$(strip $(subst ",, $(BR2_ARCH)))
-#"))
-WGET:=$(strip $(subst ",, $(BR2_WGET))) $(SPIDER)
-#"))
-SVN:=$(strip $(subst ",, $(BR2_SVN)))
-#"))
-ZCAT:=$(strip $(subst ",, $(BR2_ZCAT)))
-#"))
-BZCAT:=$(strip $(subst ",, $(BR2_BZCAT)))
-#"))
-TAR_OPTIONS=$(subst ",, $(BR2_TAR_OPTIONS)) -xf
-#")
 
-
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
 	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
@@ -72,34 +58,6 @@
 #########################################################################
 
 
-BASE_DIR:=$(shell pwd)
-
-TOPDIR_PREFIX:=$(strip $(subst ",, $(BR2_TOPDIR_PREFIX)))_
-#"))
-TOPDIR_SUFFIX:=_$(strip $(subst ",, $(BR2_TOPDIR_SUFFIX)))
-#"))
-ifeq ($(TOPDIR_PREFIX),_)
-TOPDIR_PREFIX:=
-endif
-ifeq ($(TOPDIR_SUFFIX),_)
-TOPDIR_SUFFIX:=
-endif
-
-DL_DIR=$(strip $(subst ",, $(BR2_DL_DIR)))
-#"))
-ifeq ($(DL_DIR),)
-DL_DIR:=$(BASE_DIR)/dl
-endif
-#PATCH_DIR=$(BASE_DIR)/sources/patches
-
-# All non-configurable packages should be built in BUILD_DIR
-BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
-
-GNU_TARGET_SUFFIX:=-$(strip $(subst ",, $(BR2_GNU_TARGET_SUFFIX)))
-#"))
-
-STAGING_DIR:=$(strip $(subst ",, $(BR2_STAGING_DIR)))
-#"))
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 

Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2007-08-21 17:14:56 UTC (rev 19623)
+++ trunk/buildroot/project/Makefile.in	2007-08-21 17:56:47 UTC (rev 19624)
@@ -5,6 +5,50 @@
 BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
 #"))
 
+
+# Strip off the annoying quoting
+ARCH:=$(strip $(subst ",, $(BR2_ARCH)))
+#"))
+WGET:=$(strip $(subst ",, $(BR2_WGET))) $(SPIDER)
+#"))
+SVN:=$(strip $(subst ",, $(BR2_SVN)))
+#"))
+ZCAT:=$(strip $(subst ",, $(BR2_ZCAT)))
+#"))
+BZCAT:=$(strip $(subst ",, $(BR2_BZCAT)))
+#"))
+TAR_OPTIONS=$(subst ",, $(BR2_TAR_OPTIONS)) -xf
+#")
+
+
+BASE_DIR:=$(shell pwd)
+
+TOPDIR_PREFIX:=$(strip $(subst ",, $(BR2_TOPDIR_PREFIX)))_
+#"))
+TOPDIR_SUFFIX:=_$(strip $(subst ",, $(BR2_TOPDIR_SUFFIX)))
+#"))
+ifeq ($(TOPDIR_PREFIX),_)
+TOPDIR_PREFIX:=
+endif
+ifeq ($(TOPDIR_SUFFIX),_)
+TOPDIR_SUFFIX:=
+endif
+
+DL_DIR=$(strip $(subst ",, $(BR2_DL_DIR)))
+#"))
+ifeq ($(DL_DIR),)
+DL_DIR:=$(BASE_DIR)/dl
+endif
+
+# All non-configurable packages should be built in BUILD_DIR
+BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
+
+GNU_TARGET_SUFFIX:=-$(strip $(subst ",, $(BR2_GNU_TARGET_SUFFIX)))
+#"))
+
+STAGING_DIR:=$(strip $(subst ",, $(BR2_STAGING_DIR)))
+#"))
+
 # All configurable packages (like Busybox,Linux etc) should be built
 # in PROJECT_BUILD_DIR
 PROJECT_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)project_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(PROJECT)
