From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 15 Aug 2007 22:44:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070816054457.9CB92A4048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-15 22:44:55 -0700 (Wed, 15 Aug 2007)
New Revision: 19523

Log:
Avoid copying TARGET_SKELETON on every 'make'

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-16 05:01:43 UTC (rev 19522)
+++ trunk/buildroot/Makefile	2007-08-16 05:44:55 UTC (rev 19523)
@@ -229,7 +229,7 @@
 #
 #############################################################
 $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) \
-	$(PROJECT_BUILD_DIR) $(BINARIES_DIR) $(TARGET_DIR):
+	$(PROJECT_BUILD_DIR) $(BINARIES_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -245,9 +245,9 @@
 endif
 	@mkdir -p $(STAGING_DIR)/usr/include
 
-$(PROJECT_BUILD_DIR)/.root:	 $(TARGET_DIR)
+$(PROJECT_BUILD_DIR)/.root:
+	mkdir	$(TARGET_DIR)
 	if ! [ -d "$(TARGET_DIR)/bin" ] ; then \
-		@echo "Rebuilding TARGET_DIR" ; \
 		if [ -d "$(TARGET_SKELETON)" ] ; then \
 			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
 		fi; \
@@ -257,6 +257,8 @@
 	fi;
 	touch	$@
 
+$(TARGET_DIR):	$(PROJECT_BUILD_DIR)/.root
+
 erase-fakeroots:
 	rm -f $(STAGING_DIR)/.fakeroot*
 
