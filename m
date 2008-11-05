From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed,  5 Nov 2008 03:39:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20081105113946.B11D0F8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-11-05 03:39:46 -0800 (Wed, 05 Nov 2008)
New Revision: 23935

Log:
Build $(PROJECT_BUILD_DIR)/autotools-stamps with normal Makefile rules

This patch will add a rule to top level Makefile to depend on the
$(PROJECT_BUILD_DIR)/autotools-stamps as a required directory. Hence it will be
generated if missing in stead of made when the $(PROJECT_BUILD_DIR)/.root rule
is triggered.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-11-05 11:36:22 UTC (rev 23934)
+++ trunk/buildroot/Makefile	2008-11-05 11:39:46 UTC (rev 23935)
@@ -276,8 +276,8 @@
 	cp -dpRf $(CONFIG)/buildroot-config $@
 
 dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(BR2_DEPENDS_DIR) \
-	$(BINARIES_DIR) $(PROJECT_BUILD_DIR)
+	$(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
+	$(PROJECT_BUILD_DIR)/autotools-stamps
 
 $(BASE_TARGETS): dirs
 
@@ -288,8 +288,8 @@
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(BR2_DEPENDS_DIR) \
-	$(BINARIES_DIR) $(PROJECT_BUILD_DIR)
+	$(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
+	$(PROJECT_BUILD_DIR)/autotools-stamps
 
 #############################################################
 #
@@ -297,8 +297,8 @@
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) \
-	$(PROJECT_BUILD_DIR) $(BINARIES_DIR):
+$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) \
+	$(PROJECT_BUILD_DIR)/autotools-stamps $(BINARIES_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -318,7 +318,6 @@
 
 $(PROJECT_BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
-	mkdir -p $(PROJECT_BUILD_DIR)/autotools-stamps
 	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
 		if [ -d "$(TARGET_SKELETON)" ]; then \
 			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
