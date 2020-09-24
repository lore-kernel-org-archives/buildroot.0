From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 22:55:37 +0200
Subject: [Buildroot] [git commit] board/qemu: add IBM s390x and Z arch
 support
Message-ID: <20200924213039.C595781F58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2768db702708452bbae4bdc993ddcd096be51ded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
[yann.morin.1998 at free.fr:
  - don't force network range
  - don't forward TCP port
  - drop post-build script to add tty1
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                   |  2 ++
 board/qemu/s390x/readme.txt  |  8 ++++++++
 configs/qemu_s390x_defconfig | 23 +++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 403e42b81e..eefc88c9aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -149,6 +149,8 @@ F:	package/multipath-tools/
 
 N:	Alexander Egorenkov <egorenar@linux.ibm.com>
 F:	arch/Config.in.s390x
+F:	board/qemu/s390x/
+F:	configs/qemu_s390x_defconfig
 
 N:	Alexander Kurz <akurz@blala.de>
 F:	package/minimodem/
diff --git a/board/qemu/s390x/readme.txt b/board/qemu/s390x/readme.txt
new file mode 100644
index 0000000000..63e899c760
--- /dev/null
+++ b/board/qemu/s390x/readme.txt
@@ -0,0 +1,8 @@
+Run the emulation with:
+
+  qemu-system-s390x -M s390-ccw-virtio -cpu max,zpci=on -m 4G -smp 2 \
+    -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
+    -append "rootwait root=/dev/vda net.ifnames=0 biosdevname=0" -display none -serial mon:stdio \
+    -net nic,model=virtio -net user # qemu_s390x_defconfig
+
+The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
new file mode 100644
index 0000000000..3bd407b250
--- /dev/null
+++ b/configs/qemu_s390x_defconfig
@@ -0,0 +1,23 @@
+# Architecture
+BR2_s390x=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
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
