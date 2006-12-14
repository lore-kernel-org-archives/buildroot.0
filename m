From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 21:40:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20061214054006.2A4B748579@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 21:40:06 -0800 (Wed, 13 Dec 2006)
New Revision: 16917

Log:
iptables seems to not be safe for 'make -jN' for any N>1


Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2006-12-14 02:50:58 UTC (rev 16916)
+++ trunk/buildroot/package/iptables/iptables.mk	2006-12-14 05:40:06 UTC (rev 16917)
@@ -26,13 +26,13 @@
 
 $(IPTABLES_BUILD_DIR)/iptables: $(IPTABLES_BUILD_DIR)/.configured
 	$(TARGET_CONFIGURE_OPTS) \
-	$(MAKE) -C $(IPTABLES_BUILD_DIR) \
+	$(MAKE1) -C $(IPTABLES_BUILD_DIR) \
 		KERNEL_DIR=$(LINUX_DIR) PREFIX=/usr \
 		CC=$(TARGET_CC) COPT_FLAGS="$(TARGET_CFLAGS)"
 
 $(TARGET_DIR)/usr/sbin/iptables: $(IPTABLES_BUILD_DIR)/iptables
 	$(TARGET_CONFIGURE_OPTS) \
-	$(MAKE) -C $(IPTABLES_BUILD_DIR) \
+	$(MAKE1) -C $(IPTABLES_BUILD_DIR) \
 		KERNEL_DIR=$(LINUX_DIR) PREFIX=/usr \
 		CC=$(TARGET_CC) COPT_FLAGS="$(TARGET_CFLAGS)" \
 		DESTDIR=$(TARGET_DIR) install
@@ -45,8 +45,8 @@
 iptables-source: $(DL_DIR)/$(IPTABLES_SOURCE)
 
 iptables-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(IPTABLES_BUILD_DIR) uninstall
-	-$(MAKE) -C $(IPTABLES_BUILD_DIR) clean
+	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(IPTABLES_BUILD_DIR) uninstall
+	-$(MAKE1) -C $(IPTABLES_BUILD_DIR) clean
 
 iptables-dirclean:
 	rm -rf $(IPTABLES_BUILD_DIR)
