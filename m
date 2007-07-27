From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 27 Jul 2007 07:57:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070727145735.97CA9A4939@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-27 07:57:34 -0700 (Fri, 27 Jul 2007)
New Revision: 19280

Log:
- fix directory dependencies
- BASE_TARGET depends on dirs


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-27 14:43:36 UTC (rev 19279)
+++ trunk/buildroot/Makefile	2007-07-27 14:57:34 UTC (rev 19280)
@@ -210,14 +210,17 @@
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS): $(BASE_TARGETS)
 
-world: $(DL_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) \
-	$(BINARIES_DIR) $(STAGING_DIR) $(TARGET_DIR) bsp $(TARGETS)
-dirs: $(DL_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) $(STAGING_DIR)
+dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+	$(BINARIES_DIR) $(PROJECT_BUILD_DIR)
+$(BASE_TARGETS): dirs
+world: dirs target-host-info $(TARGETS)
 
-.PHONY: all world dirs clean dirclean distclean source bsp $(TARGETS) \
+
+.PHONY: all world dirs clean dirclean distclean source target-host-info \
+	$(BASE_TARGETS) $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
-	$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR) \
-	$(PROJECT_BUILD_DIR) $(BINARIES_DIR)
+	$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+	$(BINARIES_DIR) $(PROJECT_BUILD_DIR)
 
 #############################################################
 #
@@ -225,8 +228,8 @@
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) \
-	$(PROJECT_BUILD_DIR) $(BINARIES_DIR) :
+$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) \
+	$(PROJECT_BUILD_DIR) $(BINARIES_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -242,7 +245,7 @@
 endif
 	@mkdir -p $(STAGING_DIR)/usr/include
 
-$(TARGET_DIR):
+$(TARGET_DIR): $(STAGING_DIR)
 	mkdir -p $(TARGET_DIR)
 	if [ -d "$(TARGET_SKELETON)" ] ; then \
 		cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
@@ -251,7 +254,7 @@
 	-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
 	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
 
-bsp:	$(TARGET_DIR)/etc/issue	$(TARGET_DIR)/etc/hostname
+target-host-info: dirs $(TARGET_DIR)/etc/issue $(TARGET_DIR)/etc/hostname
 
 $(TARGET_DIR)/etc/issue:	$(TARGET_DIR) .config
 	echo ""			>  $(TARGET_DIR)/etc/issue
