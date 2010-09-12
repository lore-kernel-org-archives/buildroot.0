From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 23:15:47 +0200
Subject: [Buildroot] [PATCH 1/1] linux: don't force no initramfs
In-Reply-To: <cover.1284326139.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284326139.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c04f9e9d7019744ced2f2abe198118ad1c23a819.1284326139.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When initramfs was not selected as a root filesystem, we forcefully
disabled the initramfs in the kernel configuration.

However, it prevents an user from manually managing its initramfs, as
we override the option he has set in his kernel configuration
file. There's no real reason to do so: when initramfs is not selected
as the root filesystem, just don't touch initramfs related options in
the kernel configuration.

Problem reported by Sergey Naumov <sknaumov@gmail.com>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
