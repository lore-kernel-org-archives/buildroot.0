From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 17 Sep 2020 06:07:55 +0200
Subject: [Buildroot] [PATCH v4 05/12] board/qemu: add IBM s390x and Z arch
 support
In-Reply-To: <20200917040802.846896-1-egorenar@linux.ibm.com>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
Message-ID: <20200917040802.846896-6-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 DEVELOPERS                     |  2 ++
 board/qemu/s390x/post-build.sh | 11 +++++++++++
 board/qemu/s390x/readme.txt    |  8 ++++++++
 configs/qemu_s390x_defconfig   | 24 ++++++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100755 board/qemu/s390x/post-build.sh
 create mode 100644 board/qemu/s390x/readme.txt
 create mode 100644 configs/qemu_s390x_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 2285694f66..2c6cc45d45 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -148,6 +148,8 @@ F:	package/multipath-tools/
 
 N:	Alexander Egorenkov <egorenar@linux.ibm.com>
 F:	arch/Config.in.s390x
+F:	board/qemu/s390x/
+F:	configs/qemu_s390x_defconfig
 
 N:	Alexander Kurz <akurz@blala.de>
 F:	package/minimodem/
diff --git a/board/qemu/s390x/post-build.sh b/board/qemu/s390x/post-build.sh
new file mode 100755
index 0000000000..bf83a002c2
--- /dev/null
+++ b/board/qemu/s390x/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+set -u
+set -e
+
+# Add a console on tty1
+if [ -e ${TARGET_DIR}/etc/inittab ]; then
+    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
+	sed -i '/GENERIC_SERIAL/a\
+tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
+fi
diff --git a/board/qemu/s390x/readme.txt b/board/qemu/s390x/readme.txt
new file mode 100644
index 0000000000..7fa41640c0
--- /dev/null
+++ b/board/qemu/s390x/readme.txt
@@ -0,0 +1,8 @@
+Run the emulation with:
+
+  qemu-system-s390x -M s390-ccw-virtio -cpu max,zpci=on -m 4G -smp 2 \
+    -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
+    -append "rootwait root=/dev/vda net.ifnames=0 biosdevname=0" -display none -serial mon:stdio \
+    -net nic,model=virtio -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 # qemu_s390x_defconfig
+
+The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
new file mode 100644
index 0000000000..8e25d64e15
--- /dev/null
+++ b/configs/qemu_s390x_defconfig
@@ -0,0 +1,24 @@
+# Architecture
+BR2_s390x=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/s390x/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.7"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.26.2
