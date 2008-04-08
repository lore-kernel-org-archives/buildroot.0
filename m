From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon,  7 Apr 2008 21:18:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd: mtd-utils.git
Message-ID: <20080408041813.237043C2FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-04-07 21:18:11 -0700 (Mon, 07 Apr 2008)
New Revision: 21667

Log:
Remove configuration item for git commit ID, as our patches are version-specific.
Upgrade to a newer version than the previous default.
Fix parallel compile issue.
Fix issue with quoting of URL.



Removed:
   trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch

Modified:
   trunk/buildroot/package/mtd/Config.in
   trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2008-04-07 21:11:23 UTC (rev 21666)
+++ trunk/buildroot/package/mtd/Config.in	2008-04-08 04:18:11 UTC (rev 21667)
@@ -37,18 +37,6 @@
 
 endchoice
 
-config BR2_PACKAGE_MTD_UTILS_GIT_COMMIT_ID
-	string	"Commit ID to use"
-	default "e6088d987c545d60a86e1f44836ab8ba072fffd9"
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
-	help
-	  If you wish to use the mtd-utils.git tree as of a specific
-	  commit, you can enter the commit ID here (for example,
-	  e6088d987c545d60a86e1f44836ab8ba072fffd9). 
-
-	  Alternatively you can specify HEAD. Note that the current
-	  HEAD will be downloaded but won't be tracked when it changes.
-
 comment "MTD tools selection"
 	depends BR2_PACKAGE_MTD
 

Deleted: trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch	2008-04-07 21:11:23 UTC (rev 21666)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch	2008-04-08 04:18:11 UTC (rev 21667)
@@ -1,10 +0,0 @@
---- mtd-utils-e6088d987c545d60a86e1f44836ab8ba072fffd9/ubi-utils/new-utils/src/ubicrc32.c.orig	2008-03-26 16:08:13.000000000 +1100
-+++ mtd-utils-e6088d987c545d60a86e1f44836ab8ba072fffd9/ubi-utils/new-utils/src/ubicrc32.c	2008-03-26 16:08:20.000000000 +1100
-@@ -26,7 +26,6 @@
- #include <stdint.h>
- #include <stdlib.h>
- #include <getopt.h>
--#include <argp.h>
- #include <unistd.h>
- #include <mtd/ubi-header.h>
- 

Modified: trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk	2008-04-07 21:11:23 UTC (rev 21666)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk	2008-04-08 04:18:11 UTC (rev 21667)
@@ -3,8 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=$(strip $(subst ",, $(BR2_PACKAGE_MTD_UTILS_GIT_COMMIT_ID)))
-#"))
+MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
 MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
 MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION)
@@ -22,7 +21,7 @@
 SUMTOOL := $(MTD_HOST_DIR)/sumtool
 
 $(DL_DIR)/$(MTD_SOURCE):
-	$(WGET) -O $(DL_DIR)/$(MTD_SOURCE) $(MTD_URL)
+	$(WGET) -O $(DL_DIR)/$(MTD_SOURCE) "$(MTD_URL)"
 
 $(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
 	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
@@ -64,6 +63,7 @@
 #############################################################
 $(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
 	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	rm -rf $(MTD_DIR)
 	mv $(BUILD_DIR)/$(MTD_NAME) $(MTD_DIR)
 	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils.git mtd-utils-all\*.patch
 	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils.git mtd-utils-target\*.patch
@@ -108,7 +108,7 @@
 
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 	mkdir -p $(TARGET_DIR)/usr/sbin
-	$(MAKE) OPTFLAGS="-DNEED_BCOPY -Dbcmp=memcmp -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+	$(MAKE1) OPTFLAGS="-DNEED_BCOPY -Dbcmp=memcmp -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
 	       BUILDDIR=$(MTD_DIR) \
 	       CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) WITHOUT_XATTR=1 -C $(MTD_DIR)
 
