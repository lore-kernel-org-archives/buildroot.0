From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 03:21:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot:  package/busybox
Message-ID: <20061117112125.31E9348621@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 03:21:23 -0800 (Fri, 17 Nov 2006)
New Revision: 16551

Log:
- check if busybox' Rules.mak exists.
- add target dirs to ensure that all required dirs do exist so make busybox-menuconfig works in a pristine checkout.


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2006-11-17 06:51:34 UTC (rev 16550)
+++ trunk/buildroot/Makefile	2006-11-17 11:21:23 UTC (rev 16551)
@@ -75,9 +75,10 @@
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 
-world: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) $(TARGETS)
+dirs: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR)
+world: dirs $(TARGET_DIR) $(TARGETS)
 
-.PHONY: all world clean dirclean distclean source $(TARGETS) \
+.PHONY: all world dirs clean dirclean distclean source $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR)
 

Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2006-11-17 06:51:34 UTC (rev 16550)
+++ trunk/buildroot/package/busybox/busybox.mk	2006-11-17 11:21:23 UTC (rev 16551)
@@ -23,7 +23,7 @@
 $(DL_DIR)/$(BUSYBOX_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(BUSYBOX_SITE)/$(BUSYBOX_SOURCE)
 
-busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE) $(BUILD_DIR) host-sed
+busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE) dirs host-sed
 
 $(BUSYBOX_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
 	$(BUSYBOX_UNZIP) $(DL_DIR)/$(BUSYBOX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
@@ -37,8 +37,10 @@
 
 $(BUSYBOX_DIR)/.configured: $(BUSYBOX_DIR)/.unpacked $(BUSYBOX_CONFIG_FILE)
 	cp $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_DIR)/.config
-	$(SED) "s,^CROSS.*,CROSS=$(TARGET_CROSS)\n\
-		PREFIX=$(TARGET_DIR),;" $(BUSYBOX_DIR)/Rules.mak
+	if [ -f $(BUSYBOX_DIR)/Rules.mak ]; then \
+		$(SED) "s,^CROSS.*,CROSS=$(TARGET_CROSS)\n\
+		PREFIX=$(TARGET_DIR),;" $(BUSYBOX_DIR)/Rules.mak ; \
+	fi
 ifeq ($(BR2_LARGEFILE),y)
 	$(SED) "s/^.*CONFIG_LFS.*/CONFIG_LFS=y/;" $(BUSYBOX_DIR)/.config
 else
@@ -64,7 +66,7 @@
 
 busybox: uclibc $(TARGET_DIR)/bin/busybox
 
-busybox-menuconfig: $(BUSYBOX_DIR)/.configured
+busybox-menuconfig: busybox-source $(BUSYBOX_DIR)/.configured
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_DIR) menuconfig
 
 busybox-clean:
