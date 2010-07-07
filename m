From: Sergii Kovalchuk <aetheriadraconis@gmail.com>
Date: Wed,  7 Jul 2010 16:35:45 +0300
Subject: [Buildroot] [PATCH]  Add custom development tree support
Message-ID: <1278509745-14318-1-git-send-email-aetheriadraconis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is useful in cases, when buildroot has to be linked against
predefined Linux kernel (already extracted/cloned and configured) and use custom
kernel headers in its toolchain. It adds the following menuconfig options:

Kernel:
	Kernel version: "Custom tree"
	Custom development tree location:
	Kernel configuration: "Using existing config file"

Toolchain:
	Kernel headers: "Development tree headers"

Signed-off-by: Sergii Kovalchuk <aetheriadraconis@gmail.com>
---
 linux/Config.in                                    |   24 ++++++++++++++++++++
 linux/linux.mk                                     |    8 ++++++
 toolchain/kernel-headers/Config.in                 |    5 ++++
 .../kernel-headers/kernel-headers-new.makefile     |   13 ++++++++++-
 4 files changed, 49 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d8a5157..cb4d500 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -16,6 +16,7 @@ if BR2_LINUX_KERNEL
 #     version as the kernel headers
 #  3. A custom stable version
 #  4. A custom tarball
+#  5. A custom development tree
 #
 choice
 	prompt "Kernel version"
@@ -47,6 +48,17 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	  This option allows to specify the http or ftp location of a
 	  specific kernel source tarball
 
+config BR2_LINUX_KERNEL_DEV_TREE
+	bool "Custom tree"
+	help
+	  This option allows to specify the location of custom kernel
+	  development tree. The kernel will be built without any extra
+	  actions, such as downloading, extracting and configuring.
+
+	  Note. This option enables additional option under toolchain
+	  kernel headers, called "Development tree headers", to use this
+	  development tree for toolchain building
+
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
@@ -58,12 +70,17 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
 	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
 
+config BR2_LINUX_KERNEL_DEV_TREE_LOCATION
+       string "Custom development tree location"
+       depends on BR2_LINUX_KERNEL_DEV_TREE
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "2.6.34" if BR2_LINUX_KERNEL_2_6_34
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	default "dev-tree" if BR2_LINUX_KERNEL_DEV_TREE
 
 #
 # Patch selection
@@ -71,6 +88,7 @@ config BR2_LINUX_KERNEL_VERSION
 
 config BR2_LINUX_KERNEL_PATCH
 	string "Custom kernel patch"
+	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION || BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	help
          The location can be an URL, a file path, or a directory. In
          the case of a directory, all files matching linux-*.patch
@@ -86,10 +104,16 @@ choice
 
 config BR2_LINUX_KERNEL_USE_DEFCONFIG
 	bool "Using a defconfig"
+	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION || BR2_LINUX_KERNEL_CUSTOM_TARBALL
 
 config BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG
 	bool "Using a custom config file"
+	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION || BR2_LINUX_KERNEL_CUSTOM_TARBALL
 
+config BR2_LINUX_KERNEL_USE_EXISTING_CONFIG
+       bool "Using existing config file"
+       depends on BR2_LINUX_KERNEL_DEV_TREE
+       
 endchoice
 
 config BR2_LINUX_KERNEL_DEFCONFIG
diff --git a/linux/linux.mk b/linux/linux.mk
index 593a1b4..56cf066 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -55,11 +55,18 @@ endif
 	touch $@
 
 # Extraction
+ifneq ($(LINUX26_VERSION),dev-tree)
 $(LINUX26_DIR)/.stamp_extracted: $(LINUX26_DIR)/.stamp_downloaded
 	@$(call MESSAGE,"Extracting kernel")
 	mkdir -p $(@D)
 	$(Q)$(INFLATE$(suffix $(LINUX26_SOURCE))) $(DL_DIR)/$(LINUX26_SOURCE) | \
 		tar -C $(@D) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -
+else
+$(LINUX26_DIR)/.stamp_extracted:
+	@$(call MESSAGE,"Re-generating symlinks to development tree")
+	rm -f $(@D)
+	ln -s $(BR2_LINUX_KERNEL_DEV_TREE_LOCATION) $(@D)
+endif	# dev-tree
 	$(Q)touch $@
 
 # Patch
@@ -85,6 +92,7 @@ ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(@D)/.config
 endif
+
 ifeq ($(BR2_ARM_EABI),y)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config)
 else
diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index fea3ee4..3b21607 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -50,6 +50,11 @@ choice
 
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Local Linux snapshot (linux-2.6.tar.bz2)"
+
+	config BR2_KERNEL_HEADERS_DEV_TREE
+	       bool "Development tree headers"
+	       depends on BR2_LINUX_KERNEL_DEV_TREE
+	
 endchoice
 
 config BR2_DEFAULT_KERNEL_VERSION
diff --git a/toolchain/kernel-headers/kernel-headers-new.makefile b/toolchain/kernel-headers/kernel-headers-new.makefile
index 2237a0a..9ab9ad4 100644
--- a/toolchain/kernel-headers/kernel-headers-new.makefile
+++ b/toolchain/kernel-headers/kernel-headers-new.makefile
@@ -20,7 +20,13 @@ LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL)$(SUBLEVEL)$(EXTRAVERSION)
 LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
+
+ifneq ($(BR2_KERNEL_HEADERS_DEV_TREE),y)
 LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-$(LINUX_HEADERS_VERSION)
+else
+LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-dev-tree
+endif
+
 LINUX_HEADERS_DIR:=$(TOOLCHAIN_DIR)/linux
 
 LINUX_HEADERS_DEPENDS:=
@@ -41,7 +47,12 @@ ifneq ($(KERNEL_HEADERS_PATCH_DIR),)
 endif
 	touch $@
 
+ifneq ($(BR2_KERNEL_HEADERS_DEV_TREE),y)
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
+else
+$(LINUX_HEADERS_DIR)/.configured:
+	ln -s $(BR2_LINUX_KERNEL_DEV_TREE_LOCATION) $(LINUX_HEADERS_UNPACK_DIR)
+endif
 	(cd $(LINUX_HEADERS_UNPACK_DIR); \
 	 $(MAKE) ARCH=$(KERNEL_ARCH) \
 		HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
@@ -52,5 +63,5 @@ ifeq ($(BR2_ARCH),"cris")
 	ln -s $(LINUX_HEADERS_DIR)/include/arch-v10/arch $(LINUX_HEADERS_DIR)/include/arch
 	cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/linux/user.h $(LINUX_HEADERS_DIR)/include/linux
 	$(SED) "/^#include <asm\/page\.h>/d" $(LINUX_HEADERS_DIR)/include/asm/user.h
-endif
+endif 
 	touch $@
-- 
1.7.1
