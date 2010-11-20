From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 19 Nov 2010 22:38:05 -0500
Subject: [Buildroot] [PATCH] linux: set a few more initramfs opts for newer
	kernels
Message-ID: <1290224285-21053-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building with linux-2.6.36 and initramfs support causes the build to
pause while it prompts for newer options (uid/gid/compression).  So
have the build system inject the newer options into the linux config
automatically.  Older versions should just ignore these.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 linux/linux.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 4ab519b..981edc5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -118,6 +118,9 @@ ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 	touch $(BINARIES_DIR)/rootfs.initramfs
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(@D)/.config)
+	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
+	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config)
 endif
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_SOURCE_DIR) oldconfig
-- 
1.7.3.2
