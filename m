From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 11 Dec 2010 02:25:21 +0100
Subject: [Buildroot] [git commit master 1/1] linux: set a few more initramfs
	opts for newer kernels
Message-ID: <20101211012555.87DDD8DF0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=56d387716a7f6f744b1db77c69d661051db6e9d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building with linux-2.6.36 and initramfs support causes the build to
pause while it prompts for newer options (uid/gid/compression).  So
have the build system inject the newer options into the linux config
automatically.  Older versions should just ignore these.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index feda418..ab90c03 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -106,6 +106,9 @@ ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 	touch $(BINARIES_DIR)/rootfs.initramfs
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(@D)/.config)
+	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
+	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config)
 endif
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
-- 
1.7.2.2
