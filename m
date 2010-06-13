From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 20:50:14 +0200
Subject: [Buildroot] [PATCH 10/10] linux: add support for initramfs
In-Reply-To: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bc2912c09f1ed9c08842484ce8d1a17fd6326e24.1276454802.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Buildroot, the kernel is built and installed *before* the root
filesystems are built. This allows the root filesystem to correctly
contain the kernel modules that have been installed.

However, in the initramfs case, the root filesystem is part of the
kernel. Therefore, the kernel should be built *after* the root
filesystem (which, in the initramfs case simply builds a text file
listing all files/directories/devices/symlinks that should be part of
the initramfs). However, this isn't possible as the initramfs text
file would lack all kernel modules.

So, the solution choosen here is to keep the normal order: kernel is
built before the root filesystem is generated, and to add a little
quirk to retrigger a kernel compilation after the root filesystem
generation.

To do so, we add a ROOTFS_$(FSTYPE)_POST_TARGETS variable to the
fs/common.mk infrastructure. This allows individual filesystems to set
a target name that we should depend on *after* generating the root
filesystem itself (contrary to normal ROOTFS_$(FSTYPE)_DEPENDENCIES,
on which we depend *before* generating the root filesystem).

The initramfs code in fs/initramfs/initramfs.mk uses this to add a
dependency on 'linux26-rebuild-with-initramfs'.

In linux/linux.mk, we do various things :

 * If BR2_TARGET_ROOTFS_INITRAMFS is enabled (i.e if initramfs is
   enabled as a root filesystem type), then we create an empty
   rootfs.initramfs file (remember that at this point, the root
   filesystem hasn't been generated) and we adjust the kernel
   configuration to include an initramfs. Of course, in the initial
   kernel build, this initramfs will be empty.

 * In the linux26-rebuild-with-initramfs target, we retrigger a
   compilation of the kernel image, after removing the initramfs in
   the kernel sources to make sure it gets properly rebuilt (we've
   experienced cases were modifying the rootfs.initramfs file wouldn't
   retrigger the generation of the initramfs at the kernel level).

This is fairly quirky, but initramfs really is a special case, so in
one way or another, we need a little quirk to solve its specialness.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk              |    6 +++++-
 fs/initramfs/initramfs.mk |    2 ++
 linux/linux.mk            |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 50dc974..74e9ce0 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -19,6 +19,10 @@
 #  ROOTFS_$(FSTYPE)_POST_GEN_HOOKS, a list of hooks to call after
 #  generating the filesystem image
 #
+#  ROOTFS_$(FSTYPE)_POST_TARGETS, the list of targets that should be
+#  run after running the main filesystem target. This is useful for
+#  initramfs, to rebuild the kernel once the initramfs is generated.
+#
 # In terms of configuration option, this macro assumes that the
 # BR2_TARGET_ROOTFS_$(FSTYPE) config option allows to enable/disable
 # the generation of a filesystem image of a particular type. If
@@ -60,7 +64,7 @@ endif
 $(1)-root-show-depends:
 	@echo $(ROOTFS_$(2)_DEPENDENCIES) host-fakeroot host-makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
 
-$(1)-root: $(BINARIES_DIR)/rootfs.$(1)
+$(1)-root: $(BINARIES_DIR)/rootfs.$(1) $(ROOTFS_$(2)_POST_TARGETS)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS += $(1)-root
diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 3e81567..e6d004e 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -23,4 +23,6 @@ define ROOTFS_INITRAMFS_CMD
 	$(SHELL) fs/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $$@
 endef
 
+ROOTFS_INITRAMFS_POST_TARGETS += linux26-rebuild-with-initramfs
+
 $(eval $(call ROOTFS_TARGET,initramfs))
\ No newline at end of file
diff --git a/linux/linux.mk b/linux/linux.mk
index 05a95af..1c32c86 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -101,6 +101,19 @@ ifeq ($(BR2_INET_IPV6),y)
 else
 	$(call KCONFIG_DISABLE_OPT,CONFIG_IPV6,$(@D)/.config)
 endif
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+	# As the kernel gets compiled before root filesystems are
+	# built, we create a fake initramfs file list. It'll be
+	# replaced later by the real list, and the kernel will be
+	# rebuilt using the linux26-rebuild-with-initramfs target.
+	touch $(BINARIES_DIR)/rootfs.initramfs
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
+	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config)
+else
+	$(call KCONFIG_DISABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
+	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"\",$(@D)/.config)
+endif
 	yes "" | $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig 2>&1 >/dev/null
 	$(Q)touch $@
 
@@ -131,6 +144,26 @@ linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_in
 linux26-menuconfig linux26-xconfig linux26-gconfig: $(LINUX26_DIR)/.stamp_configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
 
+# Support for rebuilding the kernel after the initramfs file list has
+# been generated in $(BINARIES_DIR)/rootfs.initramfs.
+$(LINUX26_DIR)/.stamp_initramfs_rebuilt: $(LINUX26_DIR)/.stamp_installed $(BINARIES_DIR)/rootfs.initramfs
+	@$(call MESSAGE,"Rebuilding kernel with initramfs")
+	# Remove the previously generated initramfs which was empty,
+	# to make sure the kernel will actually regenerate it.
+	$(RM) -f $(@D)/usr/initramfs_data.cpio.*
+	# Build the kernel.
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D)
+ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) uImage
+endif
+	# Copy the kernel image to its final destination
+	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
+	$(Q)touch $@
+
+# The initramfs building code must make sure this target gets called
+# after it generated the initramfs list of files.
+linux26-rebuild-with-initramfs: $(LINUX26_DIR)/.stamp_initramfs_rebuilt
+
 ifeq ($(BR2_LINUX_KERNEL),y)
 TARGETS+=linux26
 endif
\ No newline at end of file
-- 
1.7.0.4
