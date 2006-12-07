From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu,  7 Dec 2006 08:31:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20061207163121.959B3485D3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-07 08:31:21 -0800 (Thu, 07 Dec 2006)
New Revision: 16799

Log:
- pass the target (kernel-) arch in.


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2006-12-07 12:25:17 UTC (rev 16798)
+++ trunk/buildroot/package/busybox/busybox.mk	2006-12-07 16:31:21 UTC (rev 16799)
@@ -18,7 +18,7 @@
 BUSYBOX_UNZIP=$(BZCAT)
 
 BUSYBOX_CONFIG_FILE=$(subst ",, $(strip $(BR2_PACKAGE_BUSYBOX_CONFIG)))
-#"
+#")
 
 $(DL_DIR)/$(BUSYBOX_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(BUSYBOX_SITE)/$(BUSYBOX_SOURCE)
@@ -59,12 +59,14 @@
 $(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
+		ARCH=$(KERNEL_ARCH) \
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR)
 
 $(TARGET_DIR)/bin/busybox: $(BUSYBOX_DIR)/busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS),y)
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
+		ARCH=$(KERNEL_ARCH) \
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR) install
 else
 	install -D -m 0755 $(BUSYBOX_DIR)/busybox $(TARGET_DIR)/bin/busybox
