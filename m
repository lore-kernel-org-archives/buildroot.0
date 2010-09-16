From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 09:56:16 +0200
Subject: [Buildroot] [git commit master 1/1] linux: don't force no initramfs
Message-ID: <20100916075849.1D6C88A666@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ee3f319249e146d92b093ad8c45a3a908d44236f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When initramfs was not selected as a root filesystem, we forcefully
disabled the initramfs in the kernel configuration.

However, it prevents an user from manually managing its initramfs, as
we override the option he has set in his kernel configuration
file. There's no real reason to do so: when initramfs is not selected
as the root filesystem, just don't touch initramfs related options in
the kernel configuration.

Problem reported by Sergey Naumov <sknaumov@gmail.com>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3fc259c..ea338fc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -104,9 +104,6 @@ ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config)
-else
-	$(call KCONFIG_DISABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
-	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"\",$(@D)/.config)
 endif
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
 	$(Q)touch $@
-- 
1.7.1
