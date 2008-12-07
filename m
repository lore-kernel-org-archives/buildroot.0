From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Dec 2008 22:55:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081207065537.0BA533C767@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-06 22:55:36 -0800 (Sat, 06 Dec 2008)
New Revision: 24300

Log:
taget/linux: handle non-modular kernels

Based on b151271 in Bernhard's tree.

Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2008-12-07 01:16:34 UTC (rev 24299)
+++ trunk/buildroot/target/linux/Makefile.in	2008-12-07 06:55:36 UTC (rev 24300)
@@ -198,13 +198,19 @@
 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.configured
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
+	@if grep -q CONFIG_MODULES=y $(LINUX26_DIR)/.config; then \
+	    set -x; \
+	    echo "Have CONFIG_MODULES"; \
+	    $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules; \
+	    $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
 		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
-		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
-	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
-	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/source
-	$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX_HEADERS_VERSION)
+		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install; \
+	    rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build \
+		$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/source; \
+	    $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX_HEADERS_VERSION); \
+	else \
+	    echo "No CONFIG_MODULES"; \
+	fi
 	touch -c $@
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
