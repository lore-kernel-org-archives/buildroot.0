From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 15:48:44 +0000 (UTC)
Subject: [Buildroot] svn commit: [25683] trunk/buildroot:  package project
Message-ID: <20090316154844.13B657643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 15:48:43 +0000 (Mon, 16 Mar 2009)
New Revision: 25683

Log:
Makefile: introduce $(HOST_DIR) for host binaries

Add HOST_DIR directory handling. HOST_DIR should be used just like
STAGING_DIR, but for host files instead of target ones.

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/project/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-03-16 15:48:35 UTC (rev 25682)
+++ trunk/buildroot/Makefile	2009-03-16 15:48:43 UTC (rev 25683)
@@ -282,7 +282,7 @@
 	cp -dpRf $(CONFIG)/buildroot-config $@
 
 dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
+	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
 	$(PROJECT_BUILD_DIR)/autotools-stamps
 
 $(BASE_TARGETS): dirs
@@ -294,7 +294,7 @@
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
+	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
 	$(PROJECT_BUILD_DIR)/autotools-stamps
 
 #############################################################
@@ -303,7 +303,7 @@
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) \
+$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(HOST_DIR) $(PROJECT_BUILD_DIR) \
 	$(PROJECT_BUILD_DIR)/autotools-stamps $(BINARIES_DIR):
 	@mkdir -p $@
 

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-03-16 15:48:35 UTC (rev 25682)
+++ trunk/buildroot/package/Makefile.in	2009-03-16 15:48:43 UTC (rev 25683)
@@ -290,7 +290,9 @@
 		ORIGINAL_AS_FOR_TARGET="$(TARGET_AS)" \
 		ORIGINAL_LD_FOR_TARGET="$(TARGET_LD)" \
 		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
-		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)"
+		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
+		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
+		PKG_CONFIG_PATH="$(HOST_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)"
 
 #######################################################################
 # settings we need to pass to configure

Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2009-03-16 15:48:35 UTC (rev 25682)
+++ trunk/buildroot/project/Makefile.in	2009-03-16 15:48:43 UTC (rev 25683)
@@ -68,6 +68,9 @@
 STAGING_DIR:=$(strip $(subst ",, $(BR2_STAGING_DIR)))
 #"))
 
+# packages compiled for the host goes here
+HOST_DIR:=$(BUILD_DIR)/host_dir
+
 # All configurable packages (like Busybox,Linux etc) should be built
 # in PROJECT_BUILD_DIR
 PROJECT_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)project_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(PROJECT)
