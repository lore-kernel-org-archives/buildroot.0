From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 07:21:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dialog
Message-ID: <20070923142140.D1DCB30059@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 07:21:39 -0700 (Sun, 23 Sep 2007)
New Revision: 19971

Log:
Avoid repeated remake of dialog

Modified:
   trunk/buildroot/package/dialog/dialog.mk


Changeset:
Modified: trunk/buildroot/package/dialog/dialog.mk
===================================================================
--- trunk/buildroot/package/dialog/dialog.mk	2007-09-23 14:12:58 UTC (rev 19970)
+++ trunk/buildroot/package/dialog/dialog.mk	2007-09-23 14:21:39 UTC (rev 19971)
@@ -13,7 +13,7 @@
 $(DL_DIR)/$(DIALOG_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DIALOG_SITE)/$(DIALOG_SOURCE)
 
-$(DIALOG_DIR)/.source: $(DL_DIR)/$(DIALOG_SOURCE) $(DL_DIR)/$(DIALOG_PATCH1)
+$(DIALOG_DIR)/.source: $(DL_DIR)/$(DIALOG_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(DIALOG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
@@ -32,6 +32,7 @@
 
 $(DIALOG_DIR)/$(DIALOG_BINARY): $(DIALOG_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(DIALOG_DIR)
+	touch -c $@
 
 $(TARGET_DIR)/$(DIALOG_TARGET_BINARY): $(DIALOG_DIR)/$(DIALOG_BINARY)
 	$(MAKE) prefix=$(TARGET_DIR)/usr \
