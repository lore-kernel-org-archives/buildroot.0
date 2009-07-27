From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 27 Jul 2009 15:45:30 +0200
Subject: [Buildroot] [PATCH] linux: allow own initramfs to be specified
Message-ID: <1248702330-28741-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The initramfs source location is removed from the given Linux kernel
configuration at the moment and only filled in again in case BR2 is
asked to provide a cpio for that feature.

This patch allows to specify an own location for such an image file.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 target/linux/Config.in.advanced   |   12 ++++++++++++
 target/linux/Makefile.in.advanced |   13 +++++++++++++
 2 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index 3a171b5..53020ac 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -429,6 +429,18 @@ config BR2_KERNEL_CONFIG_METHOD
 	default "xconfig"	if BR2_MAKE_XCONFIG
 	default "menuconfig"	if BR2_MAKE_MENUCONFIG
 
+config BR2_PACKAGE_LINUX_INITRAMFS
+	string "initramfs source"
+	depends on BR2_PACKAGE_LINUX
+	help
+	  The initial RAM filesystem is a ramfs which is loaded by the
+	  boot loader (loadlin or lilo) and that is mounted as root
+	  before the normal boot procedure. It is typically used to
+	  load modules needed to mount the "real" root file system,
+	  etc.
+
+	  Specify a path relative to BR2's root folder.
+
 endmenu
 
 choice
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 47a1f4e..71c0eb1 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -377,6 +377,19 @@ ifeq ($(BR2_PACKAGE_BUSYBOX_INITRAMFS),y)
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
 endif
+ifneq ($(BR2_PACKAGE_LINUX_INITRAMFS),)
+	$(SED) '/CONFIG_INITRAMFS_SOURCE/d' $(LINUX26_DIR)/.config
+	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
+	echo "CONFIG_BLK_DEV_INITRD=y" >> $(LINUX26_DIR)/.config
+	echo "CONFIG_INITRAMFS_COMPRESSION_GZIP=y" >> $(LINUX26_DIR)/.config
+	echo "# CONFIG_INITRAMFS_COMPRESSION_NONE is not set" >> $(LINUX26_DIR)/.config
+	echo "# CONFIG_INITRAMFS_COMPRESSION_BZIP2 is not set" >> $(LINUX26_DIR)/.config
+	echo "# CONFIG_INITRAMFS_COMPRESSION_LZMA is not set" >> $(LINUX26_DIR)/.config
+	echo "CONFIG_INITRAMFS_SOURCE=\"$(PWD)/$(BR2_PACKAGE_LINUX_INITRAMFS)\"" >> \
+		$(LINUX26_DIR)/.config
+	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
+	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
+endif
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
 	touch $@
 
-- 
1.6.3.1
