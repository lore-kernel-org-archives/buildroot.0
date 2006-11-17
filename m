From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 03:37:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20061117113747.D0CA6485F9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 03:37:47 -0800 (Fri, 17 Nov 2006)
New Revision: 16553

Log:
- newer busyboxen want CROSS_COMPILE rather than the old CROSS.


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2006-11-17 11:28:00 UTC (rev 16552)
+++ trunk/buildroot/package/busybox/busybox.mk	2006-11-17 11:37:47 UTC (rev 16553)
@@ -47,16 +47,19 @@
 	$(SED) "s/^.*CONFIG_LFS.*/CONFIG_LFS=n/;" $(BUSYBOX_DIR)/.config
 	$(SED) "s/^.*FDISK_SUPPORT_LARGE_DISKS.*/FDISK_SUPPORT_LARGE_DISKS=n/;" $(BUSYBOX_DIR)/.config
 endif
-	yes "" | $(MAKE) CC=$(TARGET_CC) CROSS="$(TARGET_CROSS)" -C $(BUSYBOX_DIR) oldconfig
+	yes "" | $(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+		CROSS="$(TARGET_CROSS)" -C $(BUSYBOX_DIR) oldconfig
 	touch $(BUSYBOX_DIR)/.configured
 
 $(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
+	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR)
 
 $(TARGET_DIR)/bin/busybox: $(BUSYBOX_DIR)/busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS),y)
-	$(MAKE) CC=$(TARGET_CC) CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
+	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR) install
 else
 	install -D -m 0755 $(BUSYBOX_DIR)/busybox $(TARGET_DIR)/bin/busybox
