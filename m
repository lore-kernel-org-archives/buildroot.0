From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 11:29:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20090129112950.173847741D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-29 11:29:49 +0000 (Thu, 29 Jan 2009)
New Revision: 25119

Log:
busybox: rebuild if .config changed

As reported on irc - Fixes busybox-menuconfig

Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2009-01-29 11:27:20 UTC (rev 25118)
+++ trunk/buildroot/package/busybox/busybox.mk	2009-01-29 11:29:49 UTC (rev 25119)
@@ -42,7 +42,7 @@
 endif
 	touch $@
 
-$(BUSYBOX_DIR)/.configured: $(BUSYBOX_DIR)/.unpacked $(BUSYBOX_CONFIG_FILE)
+$(BUSYBOX_DIR)/.config: $(BUSYBOX_DIR)/.unpacked $(BUSYBOX_CONFIG_FILE)
 	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_DIR)/.config
 	$(SED) s,^CONFIG_PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
 		$(BUSYBOX_DIR)/.config
@@ -97,7 +97,7 @@
 	touch $@
 
 
-$(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.configured
+$(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.config
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
@@ -129,9 +129,9 @@
 
 busybox-unpacked: host-sed $(PROJECT_BUILD_DIR) $(BUSYBOX_DIR)/.unpacked
 
-busybox-config: host-sed $(PROJECT_BUILD_DIR) $(BUSYBOX_DIR)/.configured
+busybox-config: host-sed $(PROJECT_BUILD_DIR) $(BUSYBOX_DIR)/.config
 
-busybox-menuconfig: host-sed $(PROJECT_BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.configured
+busybox-menuconfig: host-sed $(PROJECT_BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.config
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_DIR) menuconfig
 
 busybox-update:
