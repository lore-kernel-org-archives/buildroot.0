From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Mon, 13 Nov 2017 07:34:16 +0300
Subject: [Buildroot] [PATCH] Linux: Clear CONFIG_INITRAMFS_SOURCE if
 BR2_TARGET_ROOTFS_INITRAMFS is not set
Message-ID: <20171113043416.43750-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes sure CONFIG_INITRAMFS_SOURCE option gets reset
when BR2_TARGET_ROOTFS_INITRAMFS is not set. Some kernel defconfigs, 
for example for ARC processors, set CONFIG_INITRAMFS_SOURCE value, which cause such error:
"./scripts/gen_initramfs_list.sh: Cannot open '../../arc_initramfs_hs/'"

Signed-off-by: Evgeniy Didin <didin@synopsys.com> 
CC: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 9c2aa77..0eee315 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -269,7 +269,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		touch $(BINARIES_DIR)/rootfs.cpio
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio",$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
-		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config))
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config),
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"",$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
-- 
2.9.3
