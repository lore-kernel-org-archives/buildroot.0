From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:26 -0300
Subject: [Buildroot] [PATCH 01/15] fs: add genimage infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, all the boards using genimage are using the same
command incantation. Therefore, let's introduce a new filesystem
infra to factorize them and allow easier genimage setup.

This commit adds a new genimage infra, by calling genimage
with a user-provided config file. The user is still responsible
of enabling the apropriate rootfs filesystem images.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 fs/Config.in            |  1 +
 fs/genimage/Config.in   | 20 ++++++++++++++++++++
 fs/genimage/genimage.mk | 21 +++++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 fs/genimage/Config.in
 create mode 100644 fs/genimage/genimage.mk

diff --git a/fs/Config.in b/fs/Config.in
index 51ccf28169ef..94fe1446047f 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -5,6 +5,7 @@ source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
 source "fs/ext2/Config.in"
+source "fs/genimage/Config.in"
 source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
diff --git a/fs/genimage/Config.in b/fs/genimage/Config.in
new file mode 100644
index 000000000000..749494652464
--- /dev/null
+++ b/fs/genimage/Config.in
@@ -0,0 +1,20 @@
+config BR2_TARGET_ROOTFS_GENIMAGE
+	bool "full system image using genimage"
+	help
+	  Generate a full system image using the genimage tool
+	  and a user-provided configuration file. The image generated
+	  will contain a partition table and will be ready to be copied
+	  onto storage media, such as MMC, NAND or NOR devices.
+
+	  Keep in mind that you probably require to enable a rootfs
+	  filesystem image, according to the genimage config file that you
+	  provide.
+
+if BR2_TARGET_ROOTFS_GENIMAGE
+
+config BR2_TARGET_ROOTFS_GENIMAGE_CFG
+	string "genimage config file"
+	help
+	  Genimage user configuration file.
+
+endif # BR2_TARGET_ROOTFS_GENIMAGE
diff --git a/fs/genimage/genimage.mk b/fs/genimage/genimage.mk
new file mode 100644
index 000000000000..17c146b6b519
--- /dev/null
+++ b/fs/genimage/genimage.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# Generate a system image using genimage
+#
+################################################################################
+
+ROOTFS_GENIMAGE_DEPENDENCIES = host-genimage
+
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+define ROOTFS_GENIMAGE_CMD
+	$(RM) -rf ${GENIMAGE_TMP} &&		\
+	$(HOST_DIR)/usr/bin/genimage		\
+		--rootpath ${TARGET_DIR}	\
+		--tmppath ${GENIMAGE_TMP}	\
+		--inputpath ${BINARIES_DIR}	\
+		--outputpath ${BINARIES_DIR}	\
+		--config ${BR2_TARGET_ROOTFS_GENIMAGE_CFG}
+endef
+
+$(eval $(call ROOTFS_TARGET,genimage))
-- 
2.7.0
