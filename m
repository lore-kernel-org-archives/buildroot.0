From: Mike Frampton <mikeframpo@gmail.com>
Date: Tue, 27 Oct 2020 20:50:56 +1300
Subject: [Buildroot] [PATCH 3/3] package/abootimg: add host build for
 abootimg Build abootimg on the host,
 and use it to build a kernel image for the DB410c.
In-Reply-To: <20201027075056.10753-1-mikeframpo@gmail.com>
References: <20201027075056.10753-1-mikeframpo@gmail.com>
Message-ID: <20201027075056.10753-3-mikeframpo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frampton <mikeframpo@gmail.com>
---
 board/qcom/db410c/post-image.sh | 21 +++++++++++++++++++++
 configs/qcom_db410c_defconfig   |  4 ++++
 package/Config.in.host          |  1 +
 package/abootimg/Config.in.host |  8 ++++++++
 package/abootimg/abootimg.mk    | 12 ++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100755 board/qcom/db410c/post-image.sh
 create mode 100644 package/abootimg/Config.in.host

diff --git a/board/qcom/db410c/post-image.sh b/board/qcom/db410c/post-image.sh
new file mode 100755
index 0000000000..5182b655d2
--- /dev/null
+++ b/board/qcom/db410c/post-image.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+set -e
+
+OUTIMG=$BINARIES_DIR/boot-db410c.img
+KERNEL_BUILD=$BUILD_DIR/linux-release_qcomlt-5.4
+
+cp $KERNEL_BUILD/arch/arm64/boot/dts/qcom/apq8016-sbc.dtb $BINARIES_DIR
+cp $KERNEL_BUILD/arch/arm64/boot/Image.gz $BINARIES_DIR
+
+# now assemble the bootimg
+#cd $BINARIES_DIR
+cat $BINARIES_DIR/Image.gz $BINARIES_DIR/apq8016-sbc.dtb > $BINARIES_DIR/Image.gz+dtb
+echo "not a ramdisk" > $BINARIES_DIR/ramdisk.img
+
+abootimg --create $OUTIMG -k $BINARIES_DIR/Image.gz+dtb -r $BINARIES_DIR/ramdisk.img \
+	-c pagesize=2048 -c kerneladdr=0x80008000 -c ramdiskaddr=0x81000000 \
+	-c cmdline="root=/dev/mmcblk1p13 rw rootwait console=tty0 console=ttyMSM0,115200n8"
+
+echo "boot img written to $OUTIMG"
+
diff --git a/configs/qcom_db410c_defconfig b/configs/qcom_db410c_defconfig
index 470d55efde..4053f914cf 100644
--- a/configs/qcom_db410c_defconfig
+++ b/configs/qcom_db410c_defconfig
@@ -10,6 +10,10 @@ BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS=y
 BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO=y
 BR2_PACKAGE_QCOM_DB410C_FIRMWARE=y
 
+# Bootloader/boot image
+BR2_PACKAGE_HOST_ABOOTIMG=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qcom/db410c/post-image.sh"
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
diff --git a/package/Config.in.host b/package/Config.in.host
index fb29622ccb..39a6f89f8c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+	source "package/abootimg/Config.in.host"
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
diff --git a/package/abootimg/Config.in.host b/package/abootimg/Config.in.host
new file mode 100644
index 0000000000..1e178bc8bf
--- /dev/null
+++ b/package/abootimg/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_ABOOTIMG
+	bool "host abootimg"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
+	help
+	  Tool to manipulate Android Boot Images, either on files
+	  or directly on /dev block devices.
+	  
+	  https://github.com/ggrandou/abootimg
diff --git a/package/abootimg/abootimg.mk b/package/abootimg/abootimg.mk
index e906546948..6a4cd01586 100644
--- a/package/abootimg/abootimg.mk
+++ b/package/abootimg/abootimg.mk
@@ -11,6 +11,7 @@ ABOOTIMG_LICENSE_FILES = LICENSE
 
 # depends on libblkid from util-linux
 ABOOTIMG_DEPENDENCIES = util-linux
+ABOOTIMG_HOST_DEPENDENCIES = host-util-linux
 
 define ABOOTIMG_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
@@ -20,4 +21,15 @@ define ABOOTIMG_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/abootimg $(TARGET_DIR)/usr/bin/abootimg
 endef
 
+# host build
+
+define HOST_ABOOTIMG_BUILD_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define HOST_ABOOTIMG_INSTALL_CMDS
+	$(INSTALL) -m 0755 $(@D)/abootimg $(HOST_DIR)/usr/bin/abootimg
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.25.1
