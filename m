From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 31 Jan 2007 06:21:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070131142109.099D348580@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-31 06:21:08 -0800 (Wed, 31 Jan 2007)
New Revision: 17685

Log:
- fix patch application. Use busybox-$(VER)-\*.patch for versions and busybox.\*.patch for snapshot


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-01-31 10:10:06 UTC (rev 17684)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-01-31 14:21:08 UTC (rev 17685)
@@ -58,8 +58,12 @@
 	$(SED) "/#include.*busybox\.h/a#define CONFIG_SYSLOGD" $(BUSYBOX_DIR)/init/init.c
 endif
 	# Allow busybox patches.
-	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox-$(BUSYBOX_VER)\*.patch
-	touch $(BUSYBOX_DIR)/.unpacked
+ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
+	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox.\*.patch
+else
+	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox-$(BUSYBOX_VER)-\*.patch
+endif
+	touch $@
 
 $(BUSYBOX_DIR)/.configured: $(BUSYBOX_DIR)/.unpacked $(BUSYBOX_CONFIG_FILE)
 	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_DIR)/.config
@@ -95,7 +99,7 @@
 endif
 	yes "" | $(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" -C $(BUSYBOX_DIR) oldconfig
-	touch $(BUSYBOX_DIR)/.configured
+	touch $@
 
 
 $(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.configured
