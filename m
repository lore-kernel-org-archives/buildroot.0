From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 18 Dec 2006 07:23:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20061218152355.8D9264858D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-18 07:23:54 -0800 (Mon, 18 Dec 2006)
New Revision: 16993

Log:
- pass the correct kernel headers in and improve the -clean target.


Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2006-12-18 14:20:01 UTC (rev 16992)
+++ trunk/buildroot/package/iptables/iptables.mk	2006-12-18 15:23:54 UTC (rev 16993)
@@ -27,13 +27,13 @@
 $(IPTABLES_BUILD_DIR)/iptables: $(IPTABLES_BUILD_DIR)/.configured
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE1) -C $(IPTABLES_BUILD_DIR) \
-		KERNEL_DIR=$(LINUX_DIR) PREFIX=/usr \
+		KERNEL_DIR=$(LINUX_HEADERS_DIR) PREFIX=/usr \
 		CC=$(TARGET_CC) COPT_FLAGS="$(TARGET_CFLAGS)"
 
 $(TARGET_DIR)/usr/sbin/iptables: $(IPTABLES_BUILD_DIR)/iptables
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE1) -C $(IPTABLES_BUILD_DIR) \
-		KERNEL_DIR=$(LINUX_DIR) PREFIX=/usr \
+		KERNEL_DIR=$(LINUX_HEADERS_DIR) PREFIX=/usr \
 		CC=$(TARGET_CC) COPT_FLAGS="$(TARGET_CFLAGS)" \
 		DESTDIR=$(TARGET_DIR) install
 	$(STRIP) $(TARGET_DIR)/usr/sbin/iptables*
@@ -45,8 +45,8 @@
 iptables-source: $(DL_DIR)/$(IPTABLES_SOURCE)
 
 iptables-clean:
-	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(IPTABLES_BUILD_DIR) uninstall
 	-$(MAKE1) -C $(IPTABLES_BUILD_DIR) clean
+	rm -rf $(TARGET_DIR)/usr/sbin/iptables* $(TARGET_DIR)/usr/lib/iptables
 
 iptables-dirclean:
 	rm -rf $(IPTABLES_BUILD_DIR)
