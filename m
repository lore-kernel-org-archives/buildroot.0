From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Tue, 17 Jul 2007 06:28:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070717132832.D118AA6AAC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-17 06:28:31 -0700 (Tue, 17 Jul 2007)
New Revision: 19134

Log:
Add 'linux26-modules' target to allow external drivers to be built with the kernel. Also, remove 'boot' directory before creating INITRAMFS.


Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-07-17 12:19:56 UTC (rev 19133)
+++ trunk/buildroot/target/linux/Makefile.in	2007-07-17 13:28:31 UTC (rev 19134)
@@ -136,7 +136,7 @@
 	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_DIR)/System.map $(TARGET_DIR)/boot/
 	touch -c $@
 
-$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.depend_done
+linux26-modules $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.depend_done
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
@@ -144,6 +144,7 @@
 		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
+	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/source
 	touch -c $@
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
