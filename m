From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 04:18:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/AMD/DBAu1500
Message-ID: <20061213121809.1290548566@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 04:18:08 -0800 (Wed, 13 Dec 2006)
New Revision: 16889

Log:
make this target current


Added:
   trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk

Removed:
   trunk/buildroot/target/device/AMD/DBAu1500/kernel-patches/
   trunk/buildroot/target/device/AMD/DBAu1500/linux.mk


Changeset:
Deleted: trunk/buildroot/target/device/AMD/DBAu1500/linux.mk
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/linux.mk	2006-12-13 11:59:53 UTC (rev 16888)
+++ trunk/buildroot/target/device/AMD/DBAu1500/linux.mk	2006-12-13 12:18:08 UTC (rev 16889)
@@ -1,128 +0,0 @@
-#############################################################
-#
-# Linux kernel targets
-#
-# Note:  If you have any patches to apply, create the directory
-# sources/kernel-patches and put your patches in there and number
-# them in the order you wish to apply them...  i.e.
-#
-#   sources/kernel-patches/001-my-special-stuff.bz2
-#   sources/kernel-patches/003-gcc-Os.bz2
-#   sources/kernel-patches/004_no-warnings.bz2
-#   sources/kernel-patches/030-lowlatency-mini.bz2
-#   sources/kernel-patches/031-lowlatency-fixes-5.bz2
-#   sources/kernel-patches/099-shutup.bz2
-#   etc...
-#
-# these patches will all be applied by the patch-kernel.sh
-# script (which will also abort the build if it finds rejects)
-#  -Erik
-#
-#############################################################
-ifneq ($(filter $(TARGETS),linux),)
-
-# Base version of Linux kernel that we need to download
-DOWNLOAD_LINUX_VERSION=2.6.16
-# Version of Linux kernel AFTER applying all patches
-LINUX_VERSION=2.6.16.20-erik
-
-
-# File name for the Linux kernel binary
-LINUX_KERNEL=linux-kernel-$(LINUX_VERSION)-$(ARCH).srec
-
-
-# Linux kernel configuration file
-LINUX_KCONFIG=$(ALCHEMY_DBAU1500_PATH)/linux.config
-
-# kernel patches
-LINUX_PATCH_DIR=target/device/AMD/DBAu1500/kernel-patches/
-
-
-
-
-LINUX_FORMAT=vmlinux
-LINUX_KARCH:=$(shell echo $(ARCH) | sed -e 's/i[3-9]86/i386/' \
-	-e 's/mipsel/mips/' \
-	-e 's/powerpc/ppc/' \
-	-e 's/sh[234]/sh/' \
-	)
-LINUX_BINLOC=$(LINUX_FORMAT)
-LINUX_DIR=$(BUILD_DIR)/linux-$(LINUX_VERSION)
-LINUX_SOURCE=linux-$(DOWNLOAD_LINUX_VERSION).tar.bz2
-LINUX_CAT:=$(BZCAT)
-LINUX_SITE=http://www.kernel.org/pub/linux/kernel/v2.6
-# Used by pcmcia-cs and others
-LINUX_SOURCE_DIR=$(LINUX_DIR)
-
-
-$(DL_DIR)/$(LINUX_SOURCE):
-	-mkdir -p $(DL_DIR)
-	$(WGET) -P $(DL_DIR) $(LINUX_SITE)/$(LINUX_SOURCE)
-
-$(LINUX_DIR)/.unpacked: $(DL_DIR)/$(LINUX_SOURCE)
-	-mkdir -p $(TOOL_BUILD_DIR)
-	-(cd $(TOOL_BUILD_DIR); ln -snf $(LINUX_DIR) linux)
-	$(LINUX_CAT) $(DL_DIR)/$(LINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-ifneq ($(DOWNLOAD_LINUX_VERSION),$(LINUX_VERSION))
-	# Rename the dir from the downloaded version to the AFTER patch version
-	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX_VERSION) $(BUILD_DIR)/linux-$(LINUX_VERSION)
-endif
-	toolchain/patch-kernel.sh $(LINUX_DIR) $(LINUX_PATCH_DIR)
-	touch $(LINUX_DIR)/.unpacked
-
-$(LINUX_KCONFIG):
-	@if [ ! -f "$(LINUX_KCONFIG)" ] ; then \
-		echo ""; \
-		echo "You should create a .config for your kernel"; \
-		echo "and install it as $(LINUX_KCONFIG)"; \
-		echo ""; \
-		sleep 5; \
-	fi;
-
-$(LINUX_DIR)/.configured $(BUILD_DIR)/linux/.configured:  $(LINUX_DIR)/.unpacked  $(LINUX_KCONFIG)
-	$(SED) "s,^ARCH.*,ARCH=$(LINUX_KARCH),g;" $(LINUX_DIR)/Makefile
-	$(SED) "s,^CROSS_COMPILE.*,CROSS_COMPILE=$(KERNEL_CROSS),g;" $(LINUX_DIR)/Makefile
-	-cp $(LINUX_KCONFIG) $(LINUX_DIR)/.config
-ifeq ($(strip $(BR2_mips)),y)
-	$(SED) "s,CONFIG_CPU_LITTLE_ENDIAN=y,# CONFIG_CPU_LITTLE_ENDIAN is not set\n# CONFIG_BINFMT_IRIX is not set," $(LINUX_DIR)/.config
-endif
-	$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX_DIR) oldconfig include/linux/version.h
-	touch $(LINUX_DIR)/.configured
-
-$(LINUX_DIR)/.depend_done:  $(LINUX_DIR)/.configured
-	$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX_DIR) dep
-	touch $(LINUX_DIR)/.depend_done
-
-$(LINUX_DIR)/$(LINUX_BINLOC): $(LINUX_DIR)/.depend_done
-	$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX_DIR) $(LINUX_FORMAT)
-	$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX_DIR) modules
-
-$(LINUX_KERNEL): $(LINUX_DIR)/$(LINUX_BINLOC)
-	$(KERNEL_CROSS)objcopy -O srec $(LINUX_DIR)/$(LINUX_BINLOC) $(LINUX_KERNEL)
-	touch -c $(LINUX_KERNEL)
-
-$(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep: $(LINUX_KERNEL) cross-depmod
-	rm -rf $(TARGET_DIR)/lib/modules
-	rm -f $(TARGET_DIR)/sbin/cardmgr
-	$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX_DIR) \
-		DEPMOD=$(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-depmod \
-		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
-
-$(STAGING_DIR)/include/linux/version.h: $(LINUX_DIR)/.configured
-	mkdir -p $(STAGING_DIR)/include
-	tar -ch -C $(LINUX_DIR)/include -f - linux | tar -xf - -C $(STAGING_DIR)/include/
-	tar -ch -C $(LINUX_DIR)/include -f - asm | tar -xf - -C $(STAGING_DIR)/include/
-
-linux: $(STAGING_DIR)/include/linux/version.h $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
-
-linux-source: $(DL_DIR)/$(LINUX_SOURCE)
-
-# This has been renamed so we do _NOT_ by default run this on 'make clean'
-linuxclean: clean
-	rm -f $(LINUX_KERNEL)
-	-$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX_DIR) clean
-
-linux-dirclean:
-	rm -rf $(LINUX_DIR)
-
-endif

Added: trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2006-12-13 11:59:53 UTC (rev 16888)
+++ trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2006-12-13 12:18:08 UTC (rev 16889)
@@ -0,0 +1,107 @@
+#############################################################
+#
+# Linux kernel 2.6 target
+#
+#############################################################
+ifneq ($(filter $(TARGETS),linux26),)
+
+
+# Version of Linux to download and then apply patches to
+DOWNLOAD_LINUX26_VERSION=2.6.19.1
+# Version of Linux after applying any patches
+LINUX26_VERSION=2.6.19.1
+
+
+
+LINUX26_SOURCE=linux-$(DOWNLOAD_LINUX26_VERSION).tar.bz2
+LINUX26_SITE=http://ftp.kernel.org/pub/linux/kernel/v2.6
+
+LINUX26_FORMAT=vmlinux
+LINUX26_BINLOC=$(LINUX26_FORMAT)
+
+# Linux kernel configuration file
+LINUX26_KCONFIG=$(ALCHEMY_DBAU1500_PATH)/linux26.config
+
+# File name for the Linux kernel binary
+LINUX26_KERNEL=linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH).srec
+
+# Version of Linux AFTER patches
+LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
+
+# kernel patches
+LINUX26_PATCH_DIR=target/device/AMD/DBAu1500/kernel-patches/
+
+LINUX26_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS) ARCH=$(KERNEL_ARCH) \
+	PATH=$(TARGET_PATH) INSTALL_MOD_PATH=$(TARGET_DIR) \
+	CROSS_COMPILE=$(KERNEL_CROSS)
+
+
+
+
+$(DL_DIR)/$(LINUX26_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
+
+$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
+	rm -rf $(LINUX26_DIR)
+	bzcat $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) -xvf -
+ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
+	# Rename the dir from the downloaded version to the AFTER patch version
+	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(BUILD_DIR)/linux-$(LINUX26_VERSION)
+endif
+	touch $(LINUX26_DIR)/.unpacked
+
+$(LINUX26_KCONFIG):
+	@if [ ! -f "$(LINUX26_KCONFIG)" ] ; then \
+		echo ""; \
+		echo "You should create a .config for your kernel"; \
+		echo "and install it as $(LINUX26_KCONFIG)"; \
+		echo ""; \
+		sleep 5; \
+	fi;
+
+$(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
+	#toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
+	touch $(LINUX26_DIR)/.patched
+
+$(LINUX26_DIR)/.configured:  $(LINUX26_DIR)/.patched  $(LINUX26_KCONFIG)
+	-cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
+	touch $(LINUX26_DIR)/.configured
+
+linux26-menuconfig: $(LINUX26_DIR)/.patched
+	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
+	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
+
+$(LINUX26_DIR)/.depend_done:  $(LINUX26_DIR)/.configured
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
+	touch $(LINUX26_DIR)/.depend_done
+
+$(LINUX26_KERNEL): $(LINUX26_DIR)/.depend_done
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(LINUX26_FORMAT) bzImage
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
+	$(KERNEL_CROSS)objcopy -O srec $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
+	touch -c $(LINUX26_KERNEL)
+
+$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_KERNEL)
+	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
+	rm -f $(TARGET_DIR)/sbin/cardmgr
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
+		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
+		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
+	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
+	touch -c $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
+
+linux26: cross-depmod26 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
+
+linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
+
+# This has been renamed so we do _NOT_ by default run this on 'make clean'
+linux26clean:
+	rm -f $(LINUX26_KERNEL)
+	-$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX26_DIR) clean
+
+linux26-dirclean:
+	rm -rf $(LINUX26_DIR)
+
+endif
