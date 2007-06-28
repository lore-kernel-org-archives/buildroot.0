From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Jun 2007 07:07:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: at bash bison
	module-init-tools netsnmp
Message-ID: <20070628140714.714BFA4675@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-28 07:07:13 -0700 (Thu, 28 Jun 2007)
New Revision: 18965

Log:
- fix a few -clean targets.
- bash build is not parallel-safe


Modified:
   trunk/buildroot/package/at/at.mk
   trunk/buildroot/package/bash/bash.mk
   trunk/buildroot/package/bison/bison.mk
   trunk/buildroot/package/module-init-tools/module-init-tools.mk
   trunk/buildroot/package/netsnmp/netsnmp.mk


Changeset:
Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2007-06-28 14:05:29 UTC (rev 18964)
+++ trunk/buildroot/package/at/at.mk	2007-06-28 14:07:13 UTC (rev 18965)
@@ -57,7 +57,8 @@
 at: uclibc host-fakeroot $(TARGET_DIR)/$(AT_TARGET_BINARY)
 
 at-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(AT_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(AT_DIR) uninstall
+	rm -f $(TARGET_DIR)/$(AT_TARGET_BINARY) $(TARGET_DIR)/etc/init.d/S99at
 	-$(MAKE) -C $(AT_DIR) clean
 
 at-dirclean:

Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2007-06-28 14:05:29 UTC (rev 18964)
+++ trunk/buildroot/package/bash/bash.mk	2007-06-28 14:07:13 UTC (rev 18965)
@@ -59,7 +59,7 @@
 	touch $@
 
 $(BASH_DIR)/$(BASH_BINARY): $(BASH_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(BASH_DIR)
+	$(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(BASH_DIR)
 
 $(TARGET_DIR)/$(BASH_TARGET_BINARY): $(BASH_DIR)/$(BASH_BINARY)
 	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) install
@@ -79,7 +79,8 @@
 endif
 
 bash-clean:
-	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) uninstall
+	-$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) uninstall
+	rm -f $(TARGET_DIR)/$(BASH_TARGET_BINARY)
 	-$(MAKE1) -C $(BASH_DIR) clean
 
 bash-dirclean:

Modified: trunk/buildroot/package/bison/bison.mk
===================================================================
--- trunk/buildroot/package/bison/bison.mk	2007-06-28 14:05:29 UTC (rev 18964)
+++ trunk/buildroot/package/bison/bison.mk	2007-06-28 14:07:13 UTC (rev 18965)
@@ -58,7 +58,8 @@
 bison: uclibc $(TARGET_DIR)/$(BISON_TARGET_BINARY)
 
 bison-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BISON_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BISON_DIR) uninstall
+	rm -f $(TARGET_DIR)/$(BISON_TARGET_BINARY)
 	-$(MAKE) -C $(BISON_DIR) clean
 
 bison-dirclean:

Modified: trunk/buildroot/package/module-init-tools/module-init-tools.mk
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-06-28 14:05:29 UTC (rev 18964)
+++ trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-06-28 14:07:13 UTC (rev 18965)
@@ -100,7 +100,7 @@
 
 cross-depmod26: $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26
 
-cross-depmod26-source: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
+module-init-tools-source cross-depmod26-source: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
 
 cross-depmod26-clean:
 	rm -f $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26

Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2007-06-28 14:05:29 UTC (rev 18964)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2007-06-28 14:07:13 UTC (rev 18965)
@@ -103,7 +103,7 @@
 netsnmp-source: $(DL_DIR)/$(NETSNMP_SOURCE)
 
 netsnmp-clean: 
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(NETSNMP_DIR) uninstall
+	$(MAKE) PREFIX=$(TARGET_DIR) INSTALL_PREFIX=$(TARGET_DIR) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(NETSNMP_DIR) uninstall
 	$(MAKE) -C $(NETSNMP_DIR) clean
 	rm -rf $(TARGET_DIR)/etc/snmp/{snmpd{,trapd},mib2c*}.conf \
 		$(TARGET_DIR)/etc/default/snmpd \
