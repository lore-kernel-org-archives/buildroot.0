From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 27 Nov 2007 13:15:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/portage
Message-ID: <20071127211516.5FE5AA6AC3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-27 13:15:15 -0800 (Tue, 27 Nov 2007)
New Revision: 20552

Log:
Bump portage to 2.1.3.16

Modified:
   trunk/buildroot/package/portage/portage.mk


Changeset:
Modified: trunk/buildroot/package/portage/portage.mk
===================================================================
--- trunk/buildroot/package/portage/portage.mk	2007-11-27 09:42:33 UTC (rev 20551)
+++ trunk/buildroot/package/portage/portage.mk	2007-11-27 21:15:15 UTC (rev 20552)
@@ -3,14 +3,17 @@
 # portage
 #
 #############################################################
-PORTAGE_DOWNLOAD_VERSION:=2.1.3
-PORTAGE_PATCH_VERSION:=.9
-PORTAGE_VERSION:=$(PORTAGE_DOWNLOAD_VERSION)$(PORTAGE_PATCH_VERSION)
+PORTAGE_BASE_VERSION:=2.1.3
+PORTAGE_DOWNLOAD_VERSION:=$(PORTAGE_BASE_VERSION).16
+PORTAGE_PATCH_VERSION:=.16
+PORTAGE_PATCH_APPLY:=n
+PORTAGE_VERSION:=$(PORTAGE_BASE_VERSION)$(PORTAGE_PATCH_VERSION)
 PORTAGE_PATCH:=portage-$(PORTAGE_VERSION).patch.bz2
 
 PORTAGE_SOURCE:=portage-$(PORTAGE_DOWNLOAD_VERSION).tar.bz2
 PORTAGE_SITE:=http://gentoo.osuosl.org/distfiles
 PORTAGE_CAT:=$(BZCAT)
+PORTAGE_DOWNLOAD_DIR:=$(BUILD_DIR)/portage-$(PORTAGE_DOWNLOAD_VERSION)
 PORTAGE_DIR:=$(BUILD_DIR)/portage-$(PORTAGE_VERSION)
 PORTAGE_TARGET_DIR:=$(TARGET_DIR)/usr/lib/portage
 PORTAGE_TARGET_BINARY:=usr/bin/emerge
@@ -46,23 +49,31 @@
 
 $(DL_DIR)/$(PORTAGE_SOURCE):
 	$(WGET) -P $(DL_DIR) $(PORTAGE_SITE)/$(PORTAGE_SOURCE)
-$(DL_DIR)/$(PORTAGE_PATCH):
-	$(WGET) -P $(DL_DIR) $(PORTAGE_SITE)/$(PORTAGE_PATCH)
+
 $(DL_DIR)/$(SANDBOX_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SANDBOX_SITE)/$(SANDBOX_SOURCE)
 
 portage-source: $(DL_DIR)/$(PORTAGE_SOURCE)
 sandbox-source: $(DL_DIR)/$(SANDBOX_SOURCE)
 
-$(PORTAGE_DIR)/.unpacked: $(DL_DIR)/$(PORTAGE_SOURCE)
+$(PORTAGE_DOWNLOAD_DIR)/.unpacked: $(DL_DIR)/$(PORTAGE_SOURCE)
 	$(PORTAGE_CAT) $(DL_DIR)/$(PORTAGE_SOURCE) | tar -C $(BUILD_DIR) -xf -
+	touch $@
+
+ifeq ($(PORTAGE_PATCH_APPLY),y)
+$(DL_DIR)/$(PORTAGE_PATCH):
+	$(WGET) -P $(DL_DIR) $(PORTAGE_SITE)/$(PORTAGE_PATCH)
+
+$(PORTAGE_DIR)/.patched: $(PORTAGE_DOWNLOAD_DIR)/.unpacked $(DL_DIR)/$(PORTAGE_PATCH)
 	mv -f $(BUILD_DIR)/portage-$(PORTAGE_DOWNLOAD_VERSION) $(PORTAGE_DIR)
 	rm -f $(PORTAGE_DIR)/bin/tbz2tool
-	touch $@
-
-$(PORTAGE_DIR)/.patched: $(PORTAGE_DIR)/.unpacked $(DL_DIR)/$(PORTAGE_PATCH)
 	(cd $(PORTAGE_DIR); $(PORTAGE_CAT) $(DL_DIR)/$(PORTAGE_PATCH) | patch -p0)
 	touch $@
+else
+$(PORTAGE_DIR)/.patched: $(PORTAGE_DOWNLOAD_DIR)/.unpacked
+	rm -f $(PORTAGE_DIR)/bin/tbz2tool
+	touch $@
+endif
 
 $(SANDBOX_DIR)/.unpacked: $(DL_DIR)/$(SANDBOX_SOURCE)
 	$(SANDBOX_CAT) $(DL_DIR)/$(SANDBOX_SOURCE) | tar -C $(BUILD_DIR) -xf -
