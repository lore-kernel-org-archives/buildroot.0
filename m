From: Valentine Barshak <gvaxon@gmail.com>
Date: Sat,  6 Oct 2012 23:22:12 +0400
Subject: [Buildroot] [PATCH] linux: Fix initramfs compression
Message-ID: <1349551332-25169-1-git-send-email-gvaxon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Initramfs compression does not make much sense for the architectures
that support compressed kernel images because in this case the data
would be compressed twice. This will eventually result in a bigger
kernel image and time overhead when uncompressing it.
The only reason to use initramfs compression is to reduce memory
usage when the kernel prepares initramfs, and both the unpacked
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

This attempts to find the first RAM disk compression mode
supported by the kernel, parsing CONFIG_RD_... variables,
and sets CONFIG_INITRAMFS_COMPRESSION_ accordingly.
If no RAM disk compression is supported, no initramfs
compression is set, and the kernel will use
CONFIG_INITRAMFS_COMPRESSION_NONE.

I've slightly changed the KCONFIG_[SET|ENABLE|DISABLE]_OPT
functions to be able to call them from shell "if" statement.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 fs/initramfs/Config.in | 5 +++--
 linux/linux.mk         | 9 +++++++--
 package/pkg-utils.mk   | 6 +++---
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/fs/initramfs/Config.in b/fs/initramfs/Config.in
index bbc2ab0..774a575 100644
--- a/fs/initramfs/Config.in
+++ b/fs/initramfs/Config.in
@@ -9,8 +9,9 @@ config BR2_TARGET_ROOTFS_INITRAMFS
 
 	  A rootfs.cpio file will be generated in the images/ directory.
 	  This is the archive that will be included in the kernel image.
-	  The rootfs in the kernel will always be gzip'ed, regardless
-	  of how buildroot's cpio archive is configured.
+	  The rootfs compression in the kernel will be set according to
+	  the initial ram disk compression mode (CONFIG_RD_...) enabled,
+	  regardless of how buildroot's cpio archive is configured.
 
 	  Note that enabling initramfs together with another filesystem
 	  formats doesn't make sense: you would end up having two
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..3521dcd 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -170,8 +170,13 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.cpio\",$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config)
-		$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config))
+		for c in GZIP BZIP2 LZMA XZ LZO; do \
+			if grep -qm1 "CONFIG_RD_$$c=y" $(@D)/.config; then \
+				$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config); \
+				$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_$$c,$(@D)/.config); \
+				break; \
+			fi; \
+		done)
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 293bf4f..5568943 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -30,17 +30,17 @@ UPPERCASE = $(strip $(eval __tmp := $1) \
 #
 
 define KCONFIG_ENABLE_OPT
-	$(SED) "/\\<$(1)\\>/d" $(2)
+	$(SED) "/\\<$(1)\\>/d" $(2); \
 	echo "$(1)=y" >> $(2)
 endef
 
 define KCONFIG_SET_OPT
-	$(SED) "/\\<$(1)\\>/d" $(3)
+	$(SED) "/\\<$(1)\\>/d" $(3); \
 	echo "$(1)=$(2)" >> $(3)
 endef
 
 define KCONFIG_DISABLE_OPT
-	$(SED) "/\\<$(1)\\>/d" $(2)
+	$(SED) "/\\<$(1)\\>/d" $(2); \
 	echo "# $(1) is not set" >> $(2)
 endef
 
-- 
1.7.11.4
