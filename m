From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 17:12:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dialog
Message-ID: <20070813001249.D1437A6858@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 17:12:49 -0700 (Sun, 12 Aug 2007)
New Revision: 19481

Log:
Bump version of dialog, make it build

Modified:
   trunk/buildroot/package/dialog/dialog.mk


Changeset:
Modified: trunk/buildroot/package/dialog/dialog.mk
===================================================================
--- trunk/buildroot/package/dialog/dialog.mk	2007-08-12 23:38:26 UTC (rev 19480)
+++ trunk/buildroot/package/dialog/dialog.mk	2007-08-13 00:12:49 UTC (rev 19481)
@@ -3,26 +3,18 @@
 # dialog
 #
 #############################################################
-###testing: DIALOG_VERSION:=1.0-20050116-1
-DIALOG_VERSION:=1.0-20060221
-DIALOG_SOURCE:=dialog_$(DIALOG_VERSION).orig.tar.gz
-DIALOG_SITE:=http://ftp.debian.org/debian/pool/main/d/dialog
+DIALOG_VERSION:=1.1-20070704
+DIALOG_SOURCE:=dialog-$(DIALOG_VERSION).tgz
+DIALOG_SITE:=ftp://invisible-island.net/dialog
 DIALOG_DIR:=$(BUILD_DIR)/dialog-$(DIALOG_VERSION)
-# http://ftp.debian.org/debian/pool/main/d/dialog/dialog_1.0-20050306-1.diff.gz
-DIALOG_PATCH1:=dialog_$(DIALOG_VERSION)-3.diff.gz
-DIALOG_PATCH1_URL:=$(DIALOG_SITE)
 DIALOG_BINARY:=dialog
 DIALOG_TARGET_BINARY:=usr/bin/dialog
 
 $(DL_DIR)/$(DIALOG_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DIALOG_SITE)/$(DIALOG_SOURCE)
 
-$(DL_DIR)/$(DIALOG_PATCH1):
-	$(WGET) -P $(DL_DIR) $(DIALOG_PATCH1_URL)/$(DIALOG_PATCH1)
-
 $(DIALOG_DIR)/.source: $(DL_DIR)/$(DIALOG_SOURCE) $(DL_DIR)/$(DIALOG_PATCH1)
 	$(ZCAT) $(DL_DIR)/$(DIALOG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(ZCAT) $(DL_DIR)/$(DIALOG_PATCH1) | patch -p1 -d $(DIALOG_DIR)
 	touch $@
 
 $(DIALOG_DIR)/.configured: $(DIALOG_DIR)/.source
@@ -39,7 +31,7 @@
 	touch $@
 
 $(DIALOG_DIR)/$(DIALOG_BINARY): $(DIALOG_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(DIALOG_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(DIALOG_DIR)
 
 $(TARGET_DIR)/$(DIALOG_TARGET_BINARY): $(DIALOG_DIR)/$(DIALOG_BINARY)
 	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(DIALOG_DIR) install
