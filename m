From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  5 Dec 2006 04:57:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
Message-ID: <20061205125742.22AEF4857D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-05 04:57:41 -0800 (Tue, 05 Dec 2006)
New Revision: 16784

Log:
- set PREFIX and SHAREDIR proper


Modified:
   trunk/buildroot/package/pciutils/pciutils.mk


Changeset:
Modified: trunk/buildroot/package/pciutils/pciutils.mk
===================================================================
--- trunk/buildroot/package/pciutils/pciutils.mk	2006-12-05 05:23:56 UTC (rev 16783)
+++ trunk/buildroot/package/pciutils/pciutils.mk	2006-12-05 12:57:41 UTC (rev 16784)
@@ -29,7 +29,9 @@
 	touch $(PCIUTILS_DIR)/.unpacked
 
 $(PCIUTILS_DIR)/.compiled: $(PCIUTILS_DIR)/.unpacked
-	$(MAKE1) CC=$(TARGET_CC) OPT="$(TARGET_CFLAGS)" -C $(PCIUTILS_DIR)
+	$(MAKE1) CC=$(TARGET_CC) OPT="$(TARGET_CFLAGS)" -C $(PCIUTILS_DIR) \
+		SHAREDIR="/usr/share/misc" \
+		PREFIX=/usr
 	touch $(PCIUTILS_DIR)/.compiled
 
 $(TARGET_DIR)/sbin/lspci: $(PCIUTILS_DIR)/.compiled
@@ -38,7 +40,7 @@
 $(TARGET_DIR)/sbin/setpci: $(PCIUTILS_DIR)/.compiled
 	install -c $(PCIUTILS_DIR)/setpci $(TARGET_DIR)/sbin/setpci
 
-$(TARGET_DIR)/usr/share/misc/pci.ids: $(PCIUTILS_DIR)/.compiled
+$(TARGET_DIR)/usr/share/misc/pci.ids: $(PCIUTILS_DIR)/.unpacked
 	install -Dc $(PCIUTILS_DIR)/pci.ids $(TARGET_DIR)/usr/share/misc/pci.ids
 
 pciutils: uclibc $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/usr/share/misc/pci.ids
