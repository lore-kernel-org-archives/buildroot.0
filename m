From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 16 Oct 2008 14:32:41 -0600
Subject: [Buildroot] [PATCH 5/9] Refactor invocation of make for kernel
	compiles
In-Reply-To: <20081016203220.15826.26173.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
Message-ID: <20081016203240.15826.97856.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Grant Likely <grant.likely@secretlab.ca>

The same invocation of make is repeated several time in the Linux makefiles.
Refactor this code to assign all of it into a single make variable which
can be used everywhere.
---

 target/linux/Makefile.in          |   21 +++++++++++++--------
 target/linux/Makefile.in.advanced |   29 +++++++++++++++++------------
 2 files changed, 30 insertions(+), 20 deletions(-)


diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index ca6b352..6126f46 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -93,6 +93,9 @@ LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LZMA="$(LZMA)"
 
+LINUX26_MAKE = $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR)
+
+
 $(LINUX26_KCONFIG):
 	@if [ ! -f "$(LINUX26_KCONFIG)" ] ; then \
 		echo ""; \
@@ -181,25 +184,24 @@ ifeq ($(BR2_PACKAGE_BUSYBOX_INITRAMFS),y)
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
 endif
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
+	$(LINUX26_MAKE) oldconfig
 	touch $@
 
 $(LINUX26_DIR)/.depend_done: $(LINUX26_DIR)/.configured
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
+	$(LINUX26_MAKE) prepare
 	touch $@
 
 $(LINUX26_KERNEL): $(INITRAMFS_TARGET) $(BB_INITRAMFS_TARGET) \
 		$(LINUX26_DIR)/.depend_done
-	$(MAKE) $(LINUX26_MAKE_FLAGS) \
-		-C $(LINUX26_DIR) $(LINUX26_FORMAT)
+	$(LINUX26_MAKE) $(LINUX26_FORMAT)
 	cp -pf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
 	touch -c $@
 
 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.configured
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
+	$(LINUX26_MAKE) modules
+	$(LINUX26_MAKE) \
 		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
@@ -209,12 +211,12 @@ $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.config
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
 	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
+	$(LINUX26_MAKE) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
 linux26-xconfig: $(LINUX26_DIR)/.patched host-sed
 	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig
+	$(LINUX26_MAKE) xconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
 linux26: $(LINUX26_KERNEL)
@@ -240,6 +242,9 @@ linux26-force:
 # This has been renamed so we do _NOT_ by default run this on 'make clean'
 linux26clean:
 	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
+	# Note; this invocation of make is different from the rest.  Why
+	# does 'PATH' need to be assigned here?  Can this be replaced with
+	# $(LINUX26_MAKE) like all the others?
 	-$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX26_DIR) clean
 
 linux26-dirclean:
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index cfdba95..90f8e01 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -189,6 +189,8 @@ LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LZMA="$(LZMA)"
 
+LINUX26_MAKE = $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR)
+
 # =============================================================================
 # ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
 
@@ -300,10 +302,10 @@ KERNEL_EXTRA_VERSION:=$(strip $(subst ",,$(BR2_EXTRA_VERSION)))
 
 $(LINUX26_DIR)/.config:	$(LINUX26_DIR)/.patched.board
 ifeq ($(BR2_PACKAGE_LINUX_USE_DEFCONFIG),y)
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(BOARD_NAME)_defconfig
+	$(LINUX26_MAKE) $(BOARD_NAME)_defconfig
 endif
 ifeq ($(BR2_PACKAGE_LINUX_USE_XCONFIG),y)
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(KERNEL_CONFIG_METHOD)
+	$(LINUX26_MAKE) $(KERNEL_CONFIG_METHOD)
 endif
 ifeq ($(BR2_PACKAGE_LINUX_USE_KCONFIG),y)
 	# Try user defined config
@@ -322,12 +324,12 @@ ifeq ($(BR2_PACKAGE_LINUX_USE_KCONFIG),y)
 	fi
 	# Use a board config defined in the linux source.
 	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
-		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(BOARD_NAME)_defconfig || \
+		$(LINUX26_MAKE) $(BOARD_NAME)_defconfig || \
 			echo "$(BOARD_NAME)_defconfig failed..." ; \
 	fi
 	# let the user create his/her own config
 	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
-		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(KERNEL_CONFIG_METHOD) ; \
+		$(LINUX26_MAKE) $(KERNEL_CONFIG_METHOD) ; \
 	fi
 endif
 ifneq ($(strip $(subst ",,$(BR2_EXTRA_VERSION))),)
@@ -370,29 +372,29 @@ ifeq ($(BR2_PACKAGE_BUSYBOX_INITRAMFS),y)
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
 endif
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
+	$(LINUX26_MAKE) oldconfig
 	touch $@
 
 # -----------------------------------------------------------------------------
 $(LINUX26_DIR)/.depend_done: $(LINUX26_DIR)/.configured
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
+	$(LINUX26_MAKE) prepare
 	touch $@
 
 $(LINUX26_DIR)/$(LINUX26_BINLOC): $(INITRAMFS_TARGET) $(BB_INITRAMFS_TARGET) \
 		$(LINUX26_DIR)/.depend_done
-	$(MAKE) $(LINUX26_MAKE_FLAGS) \
-		-C $(LINUX26_DIR) $(LINUX26_FORMAT)
+	$(LINUX26_MAKE) $(LINUX26_FORMAT)
 
 $(LINUX26_KERNEL): $(LINUX26_DIR)/$(LINUX26_BINLOC)
 	cp -pf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
 	touch -c $@
 
 # -----------------------------------------------------------------------------
+
 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.configured
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
+	$(LINUX26_MAKE) modules
+	$(LINUX26_MAKE) \
 		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
@@ -402,12 +404,12 @@ $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.config
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
 	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
+	$(LINUX26_MAKE) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
 linux26-xconfig: $(LINUX26_DIR)/.patched host-sed
 	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig
+	$(LINUX26_MAKE) xconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
 $(TARGET_DIR)/boot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
@@ -461,6 +463,9 @@ linux26-force:
 # This has been renamed so we do _NOT_ by default run this on 'make clean'
 linux26clean:
 	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
+	# Note; this invocation of make is different from the rest.  Why
+	# does 'PATH' need to be assigned here?  Can this be replaced with
+	# $(LINUX26_MAKE) like all the others?
 	-$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX26_DIR) clean
 
 linux26-dirclean:
