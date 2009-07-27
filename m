From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 27 Jul 2009 18:07:49 +0200
Subject: [Buildroot] [PATCH 1/2] linux: fix initramfs related config
	adaptions
Message-ID: <1248710870-7709-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When fiddling with the kernel .config settings manually, make sure the
dependencies for initramfs are met. Without that, the kernel's
'make oldconfig' will silently remove the newly added lines again.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 target/linux/Makefile.in.advanced |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 47a1f4e..d176edd 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -361,6 +361,11 @@ endif
 	$(SED) '/CONFIG_INITRAMFS_SOURCE/d' $(LINUX26_DIR)/.config
 	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+	echo "CONFIG_BLK_DEV_INITRD=y" >> $(LINUX26_DIR)/.config
+	echo "CONFIG_INITRAMFS_COMPRESSION_GZIP=y" >> $(LINUX26_DIR)/.config
+	echo "# CONFIG_INITRAMFS_COMPRESSION_NONE is not set" >> $(LINUX26_DIR)/.config
+	echo "# CONFIG_INITRAMFS_COMPRESSION_BZIP2 is not set" >> $(LINUX26_DIR)/.config
+	echo "# CONFIG_INITRAMFS_COMPRESSION_LZMA is not set" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_SOURCE=\"$(INITRAMFS_TARGET)\"" >> \
 		$(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
-- 
1.6.3.1
