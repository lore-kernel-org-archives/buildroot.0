From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 30 Jul 2014 15:44:11 +0200
Subject: [Buildroot] [PATCH 2/2] qemu/x86: add defconfig for serial console
	usage
Message-ID: <20140730134403.GA11974@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Developers sometimes work remotely and want to test stuff in Qemu
without having X11 running. For this case an extra defconfig is
useful and does not break existing defconfig.

A config which can be used for both cases might be used instead,
but I see no option to add more gettys via the existing buildroot
variables.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/x86/readme.txt         |  6 ++++++
 configs/qemu_x86_serial_defconfig | 23 +++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 configs/qemu_x86_serial_defconfig

diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 9ee2e37..f907770 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -4,4 +4,10 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
+Or for serial config:
+
+  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append "root=/dev/sda console=ttyS0" -net nic,model=rtl8139 -net user -nographic 
+
+The login prompt will appear in the console window.
+
 Tested with QEMU 2.0.0
diff --git a/configs/qemu_x86_serial_defconfig b/configs/qemu_x86_serial_defconfig
new file mode 100644
index 0000000..2b58dec
--- /dev/null
+++ b/configs/qemu_x86_serial_defconfig
@@ -0,0 +1,23 @@
+# Architecture
+BR2_i386=y
+BR2_x86_pentiumpro=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Lock to 3.15 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.15.7"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.7"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.15.config"
-- 
2.0.1
