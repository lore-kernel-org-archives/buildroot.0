From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 18:33:45 +0100
Subject: [Buildroot] [PATCHv2 1/4] linux: enable initrd/initramfs support
	when cpio rootfs is chosen
In-Reply-To: <1388338428-19833-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388338428-19833-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1388338428-19833-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When one enables the generation of a cpio archive of the root
filesystem, the most likely usage is as an initramfs for the
kernel. This commit ensures that the kernel has initramfs support when
the rootfs cpio image format is chosen.

This will for example ensure that if the user selects the ISO9660
filesystem format (which uses a cpio initramfs), the kernel will have
proper support to load and use the initramfs.

It is worth mentionning that when BR2_TARGET_ROOTFS_INITRAMFS is
enabled, then BR2_TARGET_ROOTFS_CPIO is always enabled. That's why we
move the enabling of CONFIG_BLK_DEV_INITRD from the initramfs case to
the cpio case.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5af167d..fa8aa0c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -169,13 +169,14 @@ define LINUX_CONFIGURE_CMDS
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
+	$(if $(BR2_TARGET_ROOTFS_CPIO),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config))
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake cpio file. It'll be
 	# replaced later by the real cpio archive, and the kernel will be
 	# rebuilt using the linux26-rebuild-with-initramfs target.
 	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
 		touch $(BINARIES_DIR)/rootfs.cpio
-		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.cpio\",$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config))
-- 
1.8.3.2
