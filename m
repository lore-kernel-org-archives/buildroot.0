From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 Nov 2019 21:19:00 +0100
Subject: [Buildroot] [PATCH v3 for-next 02/11] configs/qemu{x86,
 x86_64}: add a serial console
In-Reply-To: <20191117201909.12900-1-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
Message-ID: <20191117201909.12900-3-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current Buildroot defconfigs for qemu_x86 and qemu_x86_64
instantiate a console on tty1, which appears on QEMU's
graphical window. Add a console on the serial port (ttyS0) to
be used later for gitlab testing.

This change is need since the script used for gitlab testing
needs to use a serial output with pexpect.

This change is similar to the one made for raspberrypi [1] to
handle HDMI and serial console:

This requires three changes:
 1. have two 'console=' entries in the kernel command line: tty1,
    then ttyS0;
 2. change BR2_TARGET_GENERIC_GETTY_PORT to "console", so it starts
    a getty on the last console= passed to the kernel, ttyS0;
 3. add a new getty on tty1 to the generated inittab.

Step 2 is actually obtained by removing BR2_TARGET_GENERIC_GETTY_PORT
entirely from the defconfigs, since "console" is the default value.

Step 3 requires a post-build script since the Buildroot makefiles can
configure only one console.

Note: instead of simply adding a new getty on ttyS0 (which would
work) this patch actually changes BR2_TARGET_GENERIC_GETTY_PORT to
instantiate a console on UART, then adds back tty1 via
post-build.sh. This is done only to avoid the "GENERIC_SERIAL" comment
where we instantiate a console on QEMU graphical window, then
instantiate a really-serial console on another line.

The result is these two inittab lines:

  console::respawn:/sbin/getty -L  console 0 vt100 # GENERIC_SERIAL
  tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window

[1] 20878a1017e2bf7eb8c5f870dc6d2641493cb0f9

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/x86/post-build.sh    | 11 +++++++++++
 board/qemu/x86/readme.txt       |  2 +-
 board/qemu/x86_64/post-build.sh | 11 +++++++++++
 board/qemu/x86_64/readme.txt    |  2 +-
 configs/qemu_x86_64_defconfig   |  4 ++--
 configs/qemu_x86_defconfig      |  4 ++--
 6 files changed, 28 insertions(+), 6 deletions(-)
 create mode 100755 board/qemu/x86/post-build.sh
 create mode 100755 board/qemu/x86_64/post-build.sh

diff --git a/board/qemu/x86/post-build.sh b/board/qemu/x86/post-build.sh
new file mode 100755
index 0000000000..bf83a002c2
--- /dev/null
+++ b/board/qemu/x86/post-build.sh
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
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 42fc2439da..3bbafecf91 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda" -net nic,model=virtio -net user
+  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user
 
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
diff --git a/board/qemu/x86_64/post-build.sh b/board/qemu/x86_64/post-build.sh
new file mode 100755
index 0000000000..bf83a002c2
--- /dev/null
+++ b/board/qemu/x86_64/post-build.sh
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
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 4a1c0c0ff5..93ac22a947 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda" -net nic,model=virtio -net user
+  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user
 
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index c3c0991fcc..f9d868d169 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -3,11 +3,11 @@ BR2_x86_64=y
 
 # System
 BR2_SYSTEM_DHCP="eth0"
-BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
-# Filesystem
+# Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64/post-build.sh"
 
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 6d68b7d71f..cb68b5f4ff 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -4,11 +4,11 @@ BR2_x86_pentiumpro=y
 
 # System
 BR2_SYSTEM_DHCP="eth0"
-BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
-# Filesystem
+# Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86/post-build.sh"
 
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-- 
2.21.0
