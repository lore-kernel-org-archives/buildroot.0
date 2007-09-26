From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 26 Sep 2007 15:12:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/busybox
	target/linux
Message-ID: <20070926221252.25B1DA5D36@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-26 15:12:51 -0700 (Wed, 26 Sep 2007)
New Revision: 20047

Log:
Add more management to linux and buysbox packages

Modified:
   trunk/buildroot/package/busybox/busybox.mk
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-09-26 22:11:25 UTC (rev 20046)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-09-26 22:12:51 UTC (rev 20047)
@@ -28,8 +28,6 @@
 $(DL_DIR)/$(BUSYBOX_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(BUSYBOX_SITE)/$(BUSYBOX_SOURCE)
 
-busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE)
-
 $(BUSYBOX_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
 	$(BUSYBOX_UNZIP) $(DL_DIR)/$(BUSYBOX_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
 ifeq ($(BR2_PACKAGE_SYSKLOGD),y)
@@ -127,8 +125,16 @@
 
 busybox: uclibc $(TARGET_DIR)/bin/busybox
 
+busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE)
+
+busybox-unpacked: $(BUSYBOX_DIR)/.unpacked
+
+busybox-config: $(BUSYBOX_DIR)/.configured
+
 busybox-menuconfig: host-sed $(PROJECT_BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.configured
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_DIR) menuconfig
+
+busybox-update:
 	cp -f $(BUSYBOX_DIR)/.config $(BUSYBOX_CONFIG_FILE)
 
 busybox-clean:

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-26 22:11:25 UTC (rev 20046)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-26 22:12:51 UTC (rev 20047)
@@ -209,6 +209,11 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
+linux26-xconfig: $(LINUX26_DIR)/.patched host-sed
+	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig
+	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
+
 linux26: $(LINUX26_KERNEL)
 
 $(LINUX26_DIR)/.modules_installed: $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
@@ -218,8 +223,10 @@
 
 linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
 
-linux26-patched: $(LINUX26_DIR)/.patched
+linux26-unpacked: $(LINUX26_DIR)/.patched
 
+linux26-config:	$(LINUX26_DIR)/.configured
+
 # This has been renamed so we do _NOT_ by default run this on 'make clean'
 linux26clean:
 	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
