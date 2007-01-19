From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 10:33:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microcom
Message-ID: <20070119183341.6848F48591@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 10:33:40 -0800 (Fri, 19 Jan 2007)
New Revision: 17385

Log:
- make sure to pass the target cflags in


Modified:
   trunk/buildroot/package/microcom/microcom.mk


Changeset:
Modified: trunk/buildroot/package/microcom/microcom.mk
===================================================================
--- trunk/buildroot/package/microcom/microcom.mk	2007-01-19 18:00:49 UTC (rev 17384)
+++ trunk/buildroot/package/microcom/microcom.mk	2007-01-19 18:33:40 UTC (rev 17385)
@@ -37,20 +37,22 @@
 $(MICROCOM_DIR)/.unpacked: $(DL_DIR)/$(MICROCOM_SOURCE)
 	mkdir -p $(MICROCOM_DIR)
 	$(ZCAT) $(DL_DIR)/$(MICROCOM_SOURCE) | tar -C $(MICROCOM_DIR) $(TAR_OPTIONS) -
-	touch $(MICROCOM_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(MICROCOM_DIR) package/microcom/ \*.patch
+	touch $@
 
 $(MICROCOM_DIR)/.configured: $(MICROCOM_DIR)/.unpacked
-	$(SED) 's~gcc~${TARGET_CC}~' $(MICROCOM_DIR)/Makefile
-	touch $(MICROCOM_DIR)/.configured
+	$(SED) 's~gcc~$$(CC)~' -e 's~-O~$$(CFLAGS)~' $(MICROCOM_DIR)/Makefile
+	touch $@
 
 $(MICROCOM_DIR)/microcom: $(MICROCOM_DIR)/.configured
-	$(MAKE) -C $(MICROCOM_DIR)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(MICROCOM_DIR)
 
 $(TARGET_DIR)/usr/bin/microcom: $(MICROCOM_DIR)/microcom
 	install -c $(MICROCOM_DIR)/microcom $(TARGET_DIR)/usr/bin/microcom
 
 microcom-clean: 
-	rm $(MICROCOM_DIR)/*.o
+	rm -f $(MICROCOM_DIR)/*.o $(MICROCOM_DIR)/microcom \
+		$(TARGET_DIR)/usr/bin/microcom
 
 microcom-dirclean: 
 	rm -rf $(MICROCOM_DIR) 
