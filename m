From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 12 Jul 2007 06:11:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/busybox
	project target/ etc...
Message-ID: <20070712131106.1E690A4757@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-12 06:11:03 -0700 (Thu, 12 Jul 2007)
New Revision: 19070

Log:
	BSP Patch:
	=========================================================
	The purpose of the BSP patch is to allow building
	several boards inside the same buildroot tree.
	For this to work, each board has to have its
	own "$(TARGET_DIR)" and all *configurable* packages
	must be rebuilt for each board.
	They are now built in the "$(PROJECT_BUILD_DIR)"
	All non configurable packages can and should still
	be built in the "$(BUILD_DIR)".
	If a package is built for one board, then when
	you build for a second board of the same architecture
	the build becomes a simple copy of the resulting
	binaries.

	-----
	Define BR2_PROJECT which will be used as the selector
	between different boards. Note that BR2_PROJECT allow
	you to build multiple root file systems for a single 
	board, and should not be confused with BR2_BOARD_NAME
	which relates to the H/W.

	-----
	Define PROJECT_BUILD_DIR as 	"PROJECT_BUILD_DIR/$(PROJECT)"
	Define BINARIES_DIR as 		"binaries/$(PROJECT)"
	Define TARGET_DIR as		"$(PROJECT_BUILD_DIR)/root"
	(some prefix/postfix may apply)

	Resulting images are stored in	"$(BINARIES_DIR)"

	-----
	Define a few new environment variables in Makefile

	PROJECT:	Stripped BR2_PROJECT
	DATE:		Date of build in YYYY-MM-DD format
	HOSTNAME:	Stripped BR2_HOSTNAME	=> /etc/hostname
	BANNER:		Stripped BR2_BANNER	=> /etc/issue

	Linux and Busybox will be built in $(PROJECT_BUILD_DIR)
	More patches will be needed later to ensure all
	configurable packages are built in this directory.




Added:
   trunk/buildroot/project/
   trunk/buildroot/project/Config.in
   trunk/buildroot/project/config/

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/busybox/busybox.mk
   trunk/buildroot/target/cloop/cloop.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-07-12 00:59:00 UTC (rev 19069)
+++ trunk/buildroot/Config.in	2007-07-12 13:11:03 UTC (rev 19070)
@@ -6,6 +6,8 @@
 	bool
 	default y
 
+source "project/Config.in"
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386

Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-12 00:59:00 UTC (rev 19069)
+++ trunk/buildroot/Makefile	2007-07-12 13:11:03 UTC (rev 19070)
@@ -155,6 +155,12 @@
 else
 TARGETS:=uclibc
 endif
+
+PROJECT:=$(strip $(subst ",, $(BR2_PROJECT)))
+HOSTNAME:=$(strip $(subst ",, $(BR2_HOSTNAME)))
+BANNER:=$(strip $(subst ",, $(BR2_BANNER)))
+
+
 include toolchain/Makefile.in
 include package/Makefile.in
 
@@ -183,12 +189,14 @@
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 
-world: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) $(TARGETS)
-dirs: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR)
+world: $(DL_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) \
+	$(BINARIES_DIR) $(STAGING_DIR) $(TARGET_DIR) bsp $(TARGETS)
+dirs: $(DL_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) $(STAGING_DIR)
 
-.PHONY: all world dirs clean dirclean distclean source $(TARGETS) \
+.PHONY: all world dirs clean dirclean distclean source bsp $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
-	$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR)
+	$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR) \
+	$(PROJECT_BUILD_DIR) $(BINARIES_DIR)
 
 #############################################################
 #
@@ -196,7 +204,8 @@
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR):
+$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) \
+	$(PROJECT_BUILD_DIR) $(BINARIES_DIR) :
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -221,6 +230,16 @@
 	-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
 	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
 
+bsp:	$(TARGET_DIR)/etc/issue	$(TARGET_DIR)/etc/hostname
+
+$(TARGET_DIR)/etc/issue:	$(TARGET_DIR) .config
+	echo ""			>  $(TARGET_DIR)/etc/issue
+	echo "" 		>> $(TARGET_DIR)/etc/issue
+	echo "$(BANNER)"	>> $(TARGET_DIR)/etc/issue
+
+$(TARGET_DIR)/etc/hostname:	$(TARGET_DIR) .config
+	echo "$(HOSTNAME)" > $(TARGET_DIR)/etc/hostname
+
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 .config.check: dependencies
@@ -245,12 +264,13 @@
 ifeq ($(DL_DIR),$(BASE_DIR)/dl)
 	rm -rf $(DL_DIR)
 endif
-	rm -rf $(BUILD_DIR) $(LINUX_KERNEL) $(IMAGE) $(BASE_DIR)/include \
+	rm -rf $(BUILD_DIR) $(PROJECT_BUILD_DIR)  $(BINARIES_DIR) \
+	$(LINUX_KERNEL) $(IMAGE) $(BASE_DIR)/include \
 		.config.cmd
 	$(MAKE) -C $(CONFIG) clean
 
 sourceball:
-	rm -rf $(BUILD_DIR)
+	rm -rf $(BUILD_DIR) $(PROJECT_BUILD_DIR)  $(BINARIES_DIR)
 	set -e; \
 	cd ..; \
 	rm -f buildroot.tar.bz2; \

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-12 00:59:00 UTC (rev 19069)
+++ trunk/buildroot/package/Makefile.in	2007-07-12 13:11:03 UTC (rev 19070)
@@ -69,8 +69,12 @@
 endif
 #PATCH_DIR=$(BASE_DIR)/sources/patches
 BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
-TARGET_DIR:=$(BUILD_DIR)/root
 
+PROJECT_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)project_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(PROJECT)
+BINARIES_DIR:=$(BASE_DIR)/binaries/$(PROJECT)
+TARGET_DIR:=$(PROJECT_BUILD_DIR)/root
+
+
 GNU_TARGET_SUFFIX:=-$(strip $(subst ",, $(BR2_GNU_TARGET_SUFFIX)))
 #"))
 
@@ -81,7 +85,7 @@
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOL_BUILD_DIR)/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
-IMAGE:=$(BASE_DIR)/rootfs.$(ARCH)$(ARCH_FPU_SUFFIX)
+IMAGE:=$(BINARIES_DIR)/rootfs.$(ARCH)$(ARCH_FPU_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
@@ -93,7 +97,7 @@
 #"))
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
 TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
-IMAGE:=$(BASE_DIR)/rootfs.$(TOOLCHAIN_EXTERNAL_PREFIX)
+IMAGE:=$(BINARIES_DIR)/rootfs.$(TOOLCHAIN_EXTERNAL_PREFIX)
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 KERNEL_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-

Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-07-12 00:59:00 UTC (rev 19069)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-07-12 13:11:03 UTC (rev 19070)
@@ -7,13 +7,13 @@
 
 ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
 # Be aware that this changes daily....
-BUSYBOX_DIR:=$(BUILD_DIR)/busybox
+BUSYBOX_DIR:=$(PROJECT_BUILD_DIR)/busybox
 BUSYBOX_SOURCE:=busybox-snapshot.tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads/snapshots
 else
 BUSYBOX_VERSION=$(strip $(subst ",, $(BR2_BUSYBOX_VERSION)))
 #"))
-BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VERSION)
+BUSYBOX_DIR:=$(PROJECT_BUILD_DIR)/busybox-$(BUSYBOX_VERSION)
 BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
@@ -31,7 +31,7 @@
 busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE) dependencies
 
 $(BUSYBOX_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
-	$(BUSYBOX_UNZIP) $(DL_DIR)/$(BUSYBOX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(BUSYBOX_UNZIP) $(DL_DIR)/$(BUSYBOX_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
 ifeq ($(BR2_PACKAGE_SYSKLOGD),y)
 	# if we have external syslogd, force busybox to use it
 	$(SED) "/#include.*busybox\.h/a#define CONFIG_SYSLOGD" $(BUSYBOX_DIR)/init/init.c
@@ -127,7 +127,7 @@
 
 busybox: uclibc $(TARGET_DIR)/bin/busybox
 
-busybox-menuconfig: host-sed $(BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.configured
+busybox-menuconfig: host-sed $(PROJECT_BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.configured
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_DIR) menuconfig
 	cp -f $(BUSYBOX_DIR)/.config $(BUSYBOX_CONFIG_FILE)
 

Added: trunk/buildroot/project/Config.in
===================================================================
--- trunk/buildroot/project/Config.in	                        (rev 0)
+++ trunk/buildroot/project/Config.in	2007-07-12 13:11:03 UTC (rev 19070)
@@ -0,0 +1,26 @@
+menu "Project Options"
+
+config BR2_PROJECT
+	string "Project name"
+	default "uclibc"
+	help
+	  The project name is used to define subdirectories
+	  * where the Board Support Packages are built
+	    (Linux,Root fs Bootmonitor,Utilities etc.)
+	  * where the resulting binaries are stored.
+	  Older targets may still build in the build_<arch>
+	  and store binaries in the top directory.
+
+config BR2_HOSTNAME
+	string "hostname"
+	default "uclibc"
+	help
+	  The hostname string is stored in "/etc/hostname"
+
+config BR2_BANNER
+	string "banner"
+	default "Welcome to the Erik's uClibc development environment."
+	help
+	  The banner string is stored in "/etc/issue"
+
+endmenu

Modified: trunk/buildroot/target/cloop/cloop.mk
===================================================================
--- trunk/buildroot/target/cloop/cloop.mk	2007-07-12 00:59:00 UTC (rev 19069)
+++ trunk/buildroot/target/cloop/cloop.mk	2007-07-12 13:11:03 UTC (rev 19070)
@@ -15,6 +15,7 @@
 CLOOP_SOURCE=cloop_$(CLOOP_VERSION)-5.tar.gz
 CLOOP_SITE=http://developer.linuxtag.net/knoppix/sources
 
+CLOOP_TARGET:=$(IMAGE).cloop
 ### Note: not used yet! ck
 ### $(DL_DIR)/$(CLOOP_PATCH1):
 ### 	$(WGET) -P $(DL_DIR) $(CLOOP_PATCH1_URL)/$(CLOOP_PATCH1)
@@ -78,19 +79,19 @@
 	@rm -rf $(TARGET_DIR)/usr/share/man
 	@rm -rf $(TARGET_DIR)/usr/info
 	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
-	### $(CLOOP_DIR)/create_compressed_fs -q -D target/default/device_table.txt $(TARGET_DIR) $(IMAGE).cloop
-	## mkisofs -r $(TARGET_DIR) | $(CLOOP_DIR)/create_compressed_fs - 65536 > $(IMAGE).cloop
+	### $(CLOOP_DIR)/create_compressed_fs -q -D target/default/device_table.txt $(TARGET_DIR) $(CLOOP_TARGET)
+	## mkisofs -r $(TARGET_DIR) | $(CLOOP_DIR)/create_compressed_fs - 65536 > $(CLOOP_TARGET)
 	sudo /sbin/losetup -d /dev/loop1
 	sudo /sbin/losetup /dev/loop1 $(IMAGE).cramfs
 	sudo mkdir -p /mnt/compressed
 	sudo mount -o ro -t cramfs /dev/loop1 /mnt/compressed
-	mkisofs -r /mnt/compressed | $(CLOOP_DIR)/create_compressed_fs - 65536 > $(IMAGE).cloop
+	mkisofs -r /mnt/compressed | $(CLOOP_DIR)/create_compressed_fs - 65536 > $(CLOOP_TARGET)
 	- symlinks -r /mnt/compressed
 	sudo umount /mnt/compressed
 	@echo "Mounting a compressed image:"
 	@echo " sudo mkdir -p /mnt/compressed"
 	@echo " sudo /sbin/insmod cloop"
-	@echo " sudo /sbin/losetup /dev/cloop1 $(IMAGE).cloop"
+	@echo " sudo /sbin/losetup /dev/cloop1 $(CLOOP_TARGET)"
 	@echo " sudo mount -o ro -t iso9660 /dev/cloop1 /mnt/compressed"
 
 clooproot-source: cloop-source

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2007-07-12 00:59:00 UTC (rev 19069)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2007-07-12 13:11:03 UTC (rev 19070)
@@ -66,7 +66,7 @@
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 endif
 	# Use fakeroot so mkfs.jffs2 believes the previous fakery
-	echo "$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(BUILD_DIR)/root -o $(JFFS2_TARGET)" \
+	echo "$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $(JFFS2_TARGET)" \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-07-12 00:59:00 UTC (rev 19069)
+++ trunk/buildroot/target/linux/Makefile.in	2007-07-12 13:11:03 UTC (rev 19070)
@@ -58,7 +58,7 @@
 LINUX26_KERNEL=linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
 
 # Version of Linux AFTER patches
-LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
+LINUX26_DIR=$(PROJECT_BUILD_DIR)/linux-$(LINUX26_VERSION)
 
 # for packages that need it
 LINUX_VERSION:=$(LINUX_VERSION)
@@ -89,10 +89,10 @@
 
 $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
 	rm -rf $(LINUX26_DIR)
-	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
 	# Rename the dir from the downloaded version to the AFTER patch version
-	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
+	mv -f $(PROJECT_BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
 endif
 	touch $@
 
