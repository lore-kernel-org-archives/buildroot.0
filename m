From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:19 -0000
Subject: [Buildroot] [git commit] linux: avoid unnecessary changes in
	defconfig for INITRAMFS_SOURCE
Message-ID: <20150302222718.0BF6A807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00daf37c4f43630d92dd54c5e36005e00a9b25c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When Buildroot is configured to append the root filesystem to the Linux
kernel as initramfs, Buildroot sets the path to the initramfs source
dynamically in the Linux configuration file.

As this path is specified as an absolute path, typically being different
for different users of the same project (e.g. containing a username),
saving the configuration to a version control system (for example using
'make linux-update-defconfig') would result in a difference for this
path at every invocation by a different user.
Although this is technically not an issue, it is confusing that this
generates a difference.

Address this issue by using a not-yet-expanded make variable to specify
the path to the initramfs source. That variable will be expanded by the
Linux build system, which uses it both as a Makefile variable and a
shell variable; thus, it needs to be specified in LINUX_MAKE_ENV (so
it is exported and available in sub-processes of make).  Any saved
configuration file would simply contain the reference to the
not-yet-expanded variable.

As in the Linux build system, the config variables are both read from
make as from a shell script, we cannot use $() syntax as this would be
interpreted as a command invocation by the shell. Instead, use ${}
syntax which is interpreted as variable reference both by the shell as
by make.

[Thomas:
 - Really make the patch work by using $(LINUX_MAKE_ENV) instead of
   $(TARGET_MAKE_ENV). Otherwise, the new BR2_BINARIES_DIR variable is
   not passed at all stages of the build process, which makes the
   build fail when an initramfs is used.]

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 86dd1ee..accc42e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -55,7 +55,9 @@ LINUX_MAKE_FLAGS = \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
 
-LINUX_MAKE_ENV = $(TARGET_MAKE_ENV)
+LINUX_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	BR_BINARIES_DIR=$(BINARIES_DIR)
 
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
@@ -191,7 +193,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	# rebuilt using the linux-rebuild-with-initramfs target.
 	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
 		touch $(BINARIES_DIR)/rootfs.cpio
-		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$(BINARIES_DIR)/rootfs.cpio",$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio",$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
@@ -230,7 +232,7 @@ endef
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTBS)
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTBS)
 endef
 define LINUX_INSTALL_DTB
 	# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
@@ -277,9 +279,9 @@ endif
 define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		cp $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
-		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
+		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
 	$(LINUX_BUILD_DTB)
 	$(LINUX_APPEND_DTB)
@@ -312,7 +314,7 @@ define LINUX_INSTALL_TARGET_CMDS
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
-		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
+		$(LINUX_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ;	\
 	fi
@@ -328,7 +330,7 @@ $(eval $(kconfig-package))
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.cpio
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	$(LINUX_APPEND_DTB)
 	# Copy the kernel image to its final destination
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
