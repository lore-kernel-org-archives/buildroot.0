From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu, 30 Oct 2008 07:56:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081030145658.823DB3C725@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-30 07:56:58 -0700 (Thu, 30 Oct 2008)
New Revision: 23861

Log:
linux: skip installing modules if modules are disabled in kernel config

This patch will check if CONFIG_MODULES is set in the kernel .config, if not
yes then it will skip installing the modules.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-10-30 14:22:11 UTC (rev 23860)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-10-30 14:56:58 UTC (rev 23861)
@@ -394,13 +394,19 @@
 $(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed: $(LINUX26_DIR)/.configured
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
-		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
-		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
-	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build
-	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source
-	$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX26_VERSION_PROBED)
+	# Make Linux depend on modules only if enabled in the .config.
+	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then	\
+		echo "*** Installing Linux kernel modules" ;				\
+		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules;		\
+		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR)				\
+			DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26		\
+			INSTALL_MOD_PATH=$(TARGET_DIR) modules_install;			\
+		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build;	\
+		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source;	\
+		$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX26_VERSION_PROBED); \
+	else										\
+		echo "*** Skipping installing modules since it is not enabled" ;	\
+	fi
 	touch $@
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
