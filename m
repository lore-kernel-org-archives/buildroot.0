From: Valentine Barshak <gvaxon@gmail.com>
Date: Wed, 10 Oct 2012 03:34:56 +0400
Subject: [Buildroot] [PATCH] linux: Do not force GZIP initramfs compression
Message-ID: <1349825696-28535-1-git-send-email-gvaxon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Initramfs compression does not make much sense for the architectures
that support compressed kernel images because in this case the data
would be compressed twice. This will eventually result in a bigger
kernel image and time overhead when uncompressing it.
The only reason to use compressed initramfs is to reduce memory
usage when the kernel prepares rootfs, and both the unpacked
filesystem and initramfs.cpio are present in the memory.

Buildroot attempts to force GZIP compression for initramfs,
however it doesn't always work because initramfs compression mode
depends on RAM disk compression supported by the kernel.
Thus, CONFIG_INITRAMFS_COMPRESSION_GZIP depends on CONFIG_RD_GZIP.
If CONFIG_RD_GZIP is not set, setting GZIP initramfs compression
will have no effect.

Besides, the kernel also supports other compression methods,
like BZIP2, LZMA, XZ and LZO. Forcing the good old GZIP does not
really make much sense any more.

This removes initramfs compression settings from Buildroot,
so that the default value preset in the kernel config is used,
which is CONFIG_INITRAMFS_COMPRESSION_NONE.

If initramfs compression is still needed, it can be set
in the kernel config (using make linux-menuconfig)

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 fs/initramfs/Config.in | 4 ++--
 linux/linux.mk         | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/initramfs/Config.in b/fs/initramfs/Config.in
index bbc2ab0..b71018e 100644
--- a/fs/initramfs/Config.in
+++ b/fs/initramfs/Config.in
@@ -9,8 +9,8 @@ config BR2_TARGET_ROOTFS_INITRAMFS
 
 	  A rootfs.cpio file will be generated in the images/ directory.
 	  This is the archive that will be included in the kernel image.
-	  The rootfs in the kernel will always be gzip'ed, regardless
-	  of how buildroot's cpio archive is configured.
+	  The default rootfs compression set in the kernel configuration
+	  is used, regardless of how buildroot's cpio archive is configured.
 
 	  Note that enabling initramfs together with another filesystem
 	  formats doesn't make sense: you would end up having two
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..914c09a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -169,9 +169,7 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.cpio\",$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
-		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config)
-		$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config))
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
-- 
1.7.11.4
