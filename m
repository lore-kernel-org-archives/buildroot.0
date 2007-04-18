From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 18 Apr 2007 12:55:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mdadm
Message-ID: <20070418195515.D6DA2485AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-18 12:55:14 -0700 (Wed, 18 Apr 2007)
New Revision: 18488

Log:
- it helps to apply the patches.. ;)
- mdadm-clean tried to uninstall mdadm from the host, which may not be what was intended in the end


Modified:
   trunk/buildroot/package/mdadm/mdadm.mk


Changeset:
Modified: trunk/buildroot/package/mdadm/mdadm.mk
===================================================================
--- trunk/buildroot/package/mdadm/mdadm.mk	2007-04-18 19:54:26 UTC (rev 18487)
+++ trunk/buildroot/package/mdadm/mdadm.mk	2007-04-18 19:55:14 UTC (rev 18488)
@@ -14,23 +14,25 @@
 $(DL_DIR)/$(MDADM_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MDADM_SITE)/$(MDADM_SOURCE)
 
-$(MDADM_DIR)/.source: $(DL_DIR)/$(MDADM_SOURCE)
+$(MDADM_DIR)/.unpacked: $(DL_DIR)/$(MDADM_SOURCE)
 	$(MDADM_CAT) $(DL_DIR)/$(MDADM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(MDADM_DIR)/.source
+	toolchain/patch-kernel.sh $(MDADM_DIR) package/mdadm mdadm-$(MDADM_VERSION)\*.patch
+	touch $@
 
-$(MDADM_DIR)/$(MDADM_BINARY): $(MDADM_DIR)/.source
+$(MDADM_DIR)/$(MDADM_BINARY): $(MDADM_DIR)/.unpacked
 	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC=$(TARGET_CC) -C $(MDADM_DIR)
 
 $(TARGET_DIR)/$(MDADM_TARGET_BINARY): $(MDADM_DIR)/$(MDADM_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(MDADM_DIR) install
 	rm -Rf $(TARGET_DIR)/usr/share/man
+	$(STRIP) -s $@
 
 mdadm: uclibc $(TARGET_DIR)/$(MDADM_TARGET_BINARY)
 
 mdadm-source: $(DL_DIR)/$(MDADM_SOURCE)
 
 mdadm-clean:
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(MDADM_DIR) uninstall
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(MDADM_DIR) uninstall
 	-$(MAKE) -C $(MDADM_DIR) clean
 
 mdadm-dirclean:
