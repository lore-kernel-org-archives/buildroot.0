From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Mon, 26 May 2014 18:01:37 -0300
Subject: [Buildroot] [RFC/PATCH] linux: add external initramfs options
Message-ID: <1401138097-11024-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows building the kernel with an external initramfs. This
is useful in cases where one wants to generate the kernel and rootfs
with BR, and the kernel needs to contain an initramfs different to the
rootfs.

The path specified can be a cpio archive or a directory, just like
the kernel config. The path is specified w.r.t. BRs topdir, and made
absolute since the kernel builds in another directory.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
Hi,

I'm marking this as RFC because I don't particularly like what I wrote
to detect if the path is relative, but I found no other way.

Any comment is appreciated,
Thanks!
Guido

 linux/Config.in | 32 ++++++++++++++++++++++++++++++++
 linux/linux.mk  | 22 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 069a7d6..1efb845 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -155,6 +155,38 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	help
 	  Path to the kernel configuration file
 
+config BR2_LINUX_KERNEL_EXTERNAL_INITRAMFS
+	depends on !BR2_TARGET_ROOTFS_INITRAMFS
+	bool "Use an external initramfs"
+	help
+	  Append an external initramfs to the kernel image.
+
+comment "using BR initramfs, can't use an external one"
+	depends on BR2_TARGET_ROOTFS_INITRAMFS
+
+config BR2_LINUX_KERNEL_INITRAMFS_SOURCE
+	string "Appended initramfs source"
+	depends on BR2_LINUX_KERNEL_EXTERNAL_INITRAMFS
+	help
+	  Path to use as the external initramfs in the kernel. Can be
+	  a CPIO archive or a directory.
+
+config BR2_LINUX_KERNEL_INITRAMFS_ROOT_UID
+	string "Initramfs squash UID"
+	depends on BR2_LINUX_KERNEL_EXTERNAL_INITRAMFS
+	help
+	  If "Appended initramfs source" is a directory, select a UID
+	  to be squashed to 0 (root). This allows creating an archive
+	  with root-owned files as a user.
+
+config BR2_LINUX_KERNEL_INITRAMFS_ROOT_GID
+	string "Initramfs squash GID"
+	depends on BR2_LINUX_KERNEL_EXTERNAL_INITRAMFS
+	help
+	  If "Appended initramfs source" is a directory, select a GID
+	  to be squashed to 0 (root). This allows creating an archive
+	  with root-owned files as a user.
+
 #
 # Binary format
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index bd3f2ac..1ce5a25 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -166,9 +166,31 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
 
+define LINUX_CONFIGURE_INITRAMFS
+	$(if $(filter-out /%,$(call qstrip,$(BR2_LINUX_KERNEL_INITRAMFS_SOURCE))),
+	$(if $(filter-out ~%,$(call qstrip,$(BR2_LINUX_KERNEL_INITRAMFS_SOURCE))),
+		$(eval BR2_LINUX_KERNEL_INITRAMFS_SOURCE="${TOPDIR}/$(call qstrip,$(BR2_LINUX_KERNEL_INITRAMFS_SOURCE))")))
+
+	$(if $(BR2_LINUX_KERNEL_INITRAMFS_SOURCE),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BR2_LINUX_KERNEL_INITRAMFS_SOURCE)\",$(@D)/.config)
+	)
+
+	$(if $(BR2_LINUX_KERNEL_INITRAMFS_ROOT_UID),
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,$(BR2_LINUX_KERNEL_INITRAMFS_ROOT_UID),$(@D)/.config)
+	)
+
+	$(if $(BR2_LINUX_KERNEL_INITRAMFS_ROOT_GID),
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,$(BR2_LINUX_KERNEL_INITRAMFS_ROOT_GID),$(@D)/.config)
+	)
+endef
+
+
 define LINUX_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
+	$(if $(BR2_LINUX_KERNEL_EXTERNAL_INITRAMFS),
+		$(call LINUX_CONFIGURE_INITRAMFS))
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
-- 
2.0.0.rc2
