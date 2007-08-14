From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 14 Aug 2007 00:24:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070814072447.93654A65F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-14 00:24:45 -0700 (Tue, 14 Aug 2007)
New Revision: 19501

Log:
Avoid continuous rebuilds of TARGET_DIR and /etc/* project files

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-14 07:07:13 UTC (rev 19500)
+++ trunk/buildroot/Makefile	2007-08-14 07:24:45 UTC (rev 19501)
@@ -230,7 +230,7 @@
 #
 #############################################################
 $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) \
-	$(PROJECT_BUILD_DIR) $(BINARIES_DIR):
+	$(PROJECT_BUILD_DIR) $(BINARIES_DIR) $(TARGET_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -246,23 +246,28 @@
 endif
 	@mkdir -p $(STAGING_DIR)/usr/include
 
-$(TARGET_DIR): $(STAGING_DIR)
-	mkdir -p $(TARGET_DIR)
-	if [ -d "$(TARGET_SKELETON)" ] ; then \
-		cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
+$(PROJECT_BUILD_DIR)/.root:	 $(TARGET_DIR)
+	if ! [ -d "$(TARGET_DIR)/bin" ] ; then \
+		@echo "Rebuilding TARGET_DIR" ; \
+		if [ -d "$(TARGET_SKELETON)" ] ; then \
+			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
+		fi; \
+		touch $(STAGING_DIR)/.fakeroot.00000 ; \
+		-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf ; \
+		-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf ; \
 	fi;
-	touch $(STAGING_DIR)/.fakeroot.00000
-	-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
-	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
+	touch	$@
 
-target-host-info: dirs $(TARGET_DIR)/etc/issue $(TARGET_DIR)/etc/hostname
+target-host-info: $(TARGET_DIR)/etc/issue $(TARGET_DIR)/etc/hostname
 
-$(TARGET_DIR)/etc/issue:	$(TARGET_DIR) .config
+$(TARGET_DIR)/etc/issue:	.config
+	mkdir -p $(TARGET_DIR)/etc
 	echo ""			>  $(TARGET_DIR)/etc/issue
 	echo "" 		>> $(TARGET_DIR)/etc/issue
 	echo "$(BANNER)"	>> $(TARGET_DIR)/etc/issue
 
-$(TARGET_DIR)/etc/hostname:	$(TARGET_DIR) .config
+$(TARGET_DIR)/etc/hostname:	.config
+	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
