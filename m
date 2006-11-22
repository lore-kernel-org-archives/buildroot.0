From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 15:03:57 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microwin
Message-ID: <20061122230357.9067A485D7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 15:03:57 -0800 (Wed, 22 Nov 2006)
New Revision: 16639

Log:
- make microwindows do something. Closes #527
  Not that it would compile or anything, but at least it's different than before..


Modified:
   trunk/buildroot/package/microwin/microwin.mk


Changeset:
Modified: trunk/buildroot/package/microwin/microwin.mk
===================================================================
--- trunk/buildroot/package/microwin/microwin.mk	2006-11-22 22:18:52 UTC (rev 16638)
+++ trunk/buildroot/package/microwin/microwin.mk	2006-11-22 23:03:57 UTC (rev 16639)
@@ -13,6 +13,7 @@
 MICROWIN_CAT:=$(ZCAT)
 MICROWIN_BINARY:=$(MICROWIN_DIR)/src/bin/nano-X
 MICROWIN_TARGET_BINARY:=$(TARGET_DIR)/usr/bin/nano-X
+MICROWIN_VERSION=$(subst $(MICROWIN_DIR)/microwindows-,,$(wildcard $(MICROWIN_DIR)/microwindows-*))
 
 MICROWIN_CONFIG:=$(MICROWIN_DIR)/src/Configs/config.uclibc
 
@@ -22,10 +23,16 @@
 microwin-source: $(DL_DIR)/$(MICROWIN_SOURCE)
 
 $(MICROWIN_DIR)/.unpacked: $(DL_DIR)/$(MICROWIN_SOURCE)
-	$(MICROWIN_CAT) $(DL_DIR)/$(MICROWIN_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	[ -d $(MICROWIN_DIR) ] || mkdir $(MICROWIN_DIR)
+	$(MICROWIN_CAT) $(DL_DIR)/$(MICROWIN_SOURCE) | tar -C $(MICROWIN_DIR) $(TAR_OPTIONS) -
 	touch $(MICROWIN_DIR)/.unpacked
 
-$(MICROWIN_DIR)/.configured: $(MICROWIN_DIR)/.unpacked
+$(MICROWIN_DIR)/.prepared: $(MICROWIN_DIR)/.unpacked
+	mv $(MICROWIN_DIR)/microwindows-$(MICROWIN_VERSION)/* $(MICROWIN_DIR)
+	toolchain/patch-kernel.sh $(UEMACS_DIR) package/uemacs/ microwindows-$(MICROWIN_VERSION)\*.patch
+	touch $(MICROWIN_DIR)/.prepared
+
+$(MICROWIN_DIR)/.configured: $(MICROWIN_DIR)/.prepared
 	(cd $(MICROWIN_DIR); \
 	);
 	touch $(MICROWIN_DIR)/.configured
@@ -49,6 +56,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-#ifeq ($(strip $(BR2_PACKAGE_MICROWIN)),y)
-#TARGETS+=microwin
-#endif
+ifeq ($(strip $(BR2_PACKAGE_MICROWIN)),y)
+TARGETS+=microwin
+endif
