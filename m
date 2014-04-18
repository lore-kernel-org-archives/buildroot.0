From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 18 Apr 2014 14:28:16 -0500
Subject: [Buildroot] [PATCH 1/1] linux: Don't enable DEVTMPFS support for
	kernels older than 3.x.
Message-ID: <1397849296-5517-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Poduska <mjpodusk@rockwellcollins.com>

In the case where DEVTMPFS is desired for older kernels where the
support is experimental, it's still possible to enable the option in
the board's specific linux .config instead of relying on buildroot to
make the modification.

Signed-off-by: Matt Poduska <mjpodusk@rockwellcollins.com>
Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 linux/linux.mk |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e270705..694ea16 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -183,9 +183,11 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.cpio\",$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config))
-	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
-		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
+	# Kernels prior to 2.6.32 don't support DEVTMPFS, which is also experimental prior to 3.x
+	$(if $(findstring x2.6.,x$(LINUX_VERSION)),,
+		$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
+			$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
+			$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config)))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
-- 
1.7.9.5
