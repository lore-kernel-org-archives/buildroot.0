From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 Jul 2008 07:11:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/which
Message-ID: <20080722141101.B80943C7A0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-22 07:11:01 -0700 (Tue, 22 Jul 2008)
New Revision: 22916

Log:
which: convert to Makefile.autotools.in format

Modified:
   trunk/buildroot/package/which/which.mk


Changeset:
Modified: trunk/buildroot/package/which/which.mk
===================================================================
--- trunk/buildroot/package/which/which.mk	2008-07-22 13:59:42 UTC (rev 22915)
+++ trunk/buildroot/package/which/which.mk	2008-07-22 14:11:01 UTC (rev 22916)
@@ -6,54 +6,14 @@
 WHICH_VERSION:=2.19
 WHICH_SOURCE:=which-$(WHICH_VERSION).tar.gz
 WHICH_SITE:=http://www.xs4all.nl/~carlo17/which/
-WHICH_DIR:=$(BUILD_DIR)/which-$(WHICH_VERSION)
-WHICH_CAT:=$(ZCAT)
-WHICH_BINARY:=which
-WHICH_TARGET_BINARY:=usr/bin/which
+WHICH_AUTORECONF:=NO
+WHICH_INSTALL_STAGING:=NO
+WHICH_INSTALL_TARGET:=YES
 
-$(DL_DIR)/$(WHICH_SOURCE):
-	$(WGET) -P $(DL_DIR) $(WHICH_SITE)/$(WHICH_SOURCE)
+WHICH_DEPENDENCIES:=uclibc
 
-which-source: $(DL_DIR)/$(WHICH_SOURCE)
+$(eval $(call AUTOTARGETS,package,which))
 
-$(WHICH_DIR)/.unpacked: $(DL_DIR)/$(WHICH_SOURCE)
-	$(WHICH_CAT) $(DL_DIR)/$(WHICH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(WHICH_DIR)
+$(WHICH_HOOK_POST_INSTALL): $(WHICH_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/which
 	touch $@
-
-$(WHICH_DIR)/.configured: $(WHICH_DIR)/.unpacked
-	(cd $(WHICH_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-	)
-	touch $@
-
-$(WHICH_DIR)/$(WHICH_BINARY): $(WHICH_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(WHICH_DIR)
-
-$(TARGET_DIR)/$(WHICH_TARGET_BINARY): $(WHICH_DIR)/$(WHICH_BINARY)
-	install -D $^ $@
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-which: uclibc $(TARGET_DIR)/$(WHICH_TARGET_BINARY)
-
-which-clean:
-	rm -f $(TARGET_DIR)/$(WHICH_TARGET_BINARY)
-	-$(MAKE) -C $(WHICH_DIR) clean
-
-which-dirclean:
-	rm -rf $(WHICH_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_WHICH)),y)
-TARGETS+=which
-endif
