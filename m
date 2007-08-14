From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 14 Aug 2007 00:45:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  project
Message-ID: <20070814074502.4C0CDA681C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-14 00:45:01 -0700 (Tue, 14 Aug 2007)
New Revision: 19502

Log:
Move project related info from main Makefile to project dir

Added:
   trunk/buildroot/project/Makefile.in
   trunk/buildroot/project/project.mk

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-14 07:24:45 UTC (rev 19501)
+++ trunk/buildroot/Makefile	2007-08-14 07:45:01 UTC (rev 19502)
@@ -162,14 +162,7 @@
 endif
 TARGETS:=
 
-
-PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
-#"))
-TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
-#"))
-BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
-#"))
-
+include project/Makefile.in
 include toolchain/Makefile.in
 include package/Makefile.in
 
@@ -185,6 +178,8 @@
 # In this section, we need .config
 include .config.cmd
 
+include project/*.mk
+
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
@@ -213,11 +208,13 @@
 
 dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(BINARIES_DIR) $(PROJECT_BUILD_DIR)
+
 $(BASE_TARGETS): dirs
+
 world: dependencies dirs target-host-info $(BASE_TARGETS) $(TARGETS)
 
 
-.PHONY: all world dirs clean dirclean distclean source target-host-info \
+.PHONY: all world dirs clean dirclean distclean source \
 	$(BASE_TARGETS) $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
@@ -258,18 +255,7 @@
 	fi;
 	touch	$@
 
-target-host-info: $(TARGET_DIR)/etc/issue $(TARGET_DIR)/etc/hostname
 
-$(TARGET_DIR)/etc/issue:	.config
-	mkdir -p $(TARGET_DIR)/etc
-	echo ""			>  $(TARGET_DIR)/etc/issue
-	echo "" 		>> $(TARGET_DIR)/etc/issue
-	echo "$(BANNER)"	>> $(TARGET_DIR)/etc/issue
-
-$(TARGET_DIR)/etc/hostname:	.config
-	mkdir -p $(TARGET_DIR)/etc
-	echo "$(TARGET_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
-
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 _source-check: 

Added: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	                        (rev 0)
+++ trunk/buildroot/project/Makefile.in	2007-08-14 07:45:01 UTC (rev 19502)
@@ -0,0 +1,6 @@
+PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
+#"))
+TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
+#"))
+BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
+#"))

Added: trunk/buildroot/project/project.mk
===================================================================
--- trunk/buildroot/project/project.mk	                        (rev 0)
+++ trunk/buildroot/project/project.mk	2007-08-14 07:45:01 UTC (rev 19502)
@@ -0,0 +1,14 @@
+
+.PHONY:	target-host-info
+
+target-host-info: $(TARGET_DIR)/etc/issue $(TARGET_DIR)/etc/hostname
+
+$(TARGET_DIR)/etc/issue:	.config
+	mkdir -p $(TARGET_DIR)/etc
+	echo ""			>  $(TARGET_DIR)/etc/issue
+	echo "" 		>> $(TARGET_DIR)/etc/issue
+	echo "$(BANNER)"	>> $(TARGET_DIR)/etc/issue
+
+$(TARGET_DIR)/etc/hostname:	.config
+	mkdir -p $(TARGET_DIR)/etc
+	echo "$(TARGET_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
