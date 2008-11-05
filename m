From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed,  5 Nov 2008 02:41:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20081105104132.001F13C8AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-11-05 02:41:31 -0800 (Wed, 05 Nov 2008)
New Revision: 23932

Log:
Move creation of $(PROJECT_BUILD_DIR)/autotools-stamps into top level Makefile

This patch will create the autotools-stamps directory early in the build
process, thus making it possible for non Makefile.autotools.in packages to use
this directory to hold stamp files.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-11-05 08:43:04 UTC (rev 23931)
+++ trunk/buildroot/Makefile	2008-11-05 10:41:31 UTC (rev 23932)
@@ -318,6 +318,7 @@
 
 $(PROJECT_BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
+	mkdir -p $(PROJECT_BUILD_DIR)/autotools-stamps
 	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
 		if [ -d "$(TARGET_SKELETON)" ]; then \
 			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \

Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-11-05 08:43:04 UTC (rev 23931)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-11-05 10:41:31 UTC (rev 23932)
@@ -258,7 +258,6 @@
 	$(if $(BR2_HAVE_DOCUMENTATION),,for d in doc share/doc; do \
 		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
-	$(Q)mkdir -p $(@D)
 	touch $@
 
 $(BUILD_DIR)/%/.stamp_cleaned:
