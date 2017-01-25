From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 23:20:26 +0100
Subject: [Buildroot] [git commit] or1k: add defconfig for Qemu system
	emulation
Message-ID: <20170125222530.CB85681F0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1395b347fb2e4a7551d220881e1a075d1e6e7bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

You can bootup a OpenRISC system, networking is not working.

[Peter: drop unneeded _GETTY_PORT="ttyS0" setting]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/or1k/linux-4.9.config                  | 29 +++++++++++++++++++++++
 board/qemu/or1k/patches/linux/0001-ld-or1k.patch  | 16 +++++++++++++
 board/qemu/or1k/patches/linux/0002-kallsyms.patch | 25 +++++++++++++++++++
 board/qemu/or1k/readme.txt                        |  9 +++++++
 configs/qemu_or1k_defconfig                       | 19 +++++++++++++++
 5 files changed, 98 insertions(+)

diff --git a/board/qemu/or1k/linux-4.9.config b/board/qemu/or1k/linux-4.9.config
new file mode 100644
index 0000000..5ba03c3
--- /dev/null
+++ b/board/qemu/or1k/linux-4.9.config
@@ -0,0 +1,29 @@
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
+CONFIG_OPENRISC_BUILTIN_DTB="or1ksim"
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_NETDEVICES=y
+CONFIG_ETHOC=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HWMON is not set
+# CONFIG_VGA_CONSOLE is not set
+# CONFIG_USB_SUPPORT is not set
diff --git a/board/qemu/or1k/patches/linux/0001-ld-or1k.patch b/board/qemu/or1k/patches/linux/0001-ld-or1k.patch
new file mode 100644
index 0000000..aba2463
--- /dev/null
+++ b/board/qemu/or1k/patches/linux/0001-ld-or1k.patch
@@ -0,0 +1,16 @@
+OpenRISC arch name was in the beginning or32
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur linux-4.4.5.orig/arch/openrisc/kernel/vmlinux.lds.S linux-4.4.5/arch/openrisc/kernel/vmlinux.lds.S
+--- linux-4.4.5.orig/arch/openrisc/kernel/vmlinux.lds.S	2016-03-10 00:35:58.000000000 +0100
++++ linux-4.4.5/arch/openrisc/kernel/vmlinux.lds.S	2016-03-16 09:21:07.933535532 +0100
+@@ -30,7 +30,7 @@
+ #include <asm/cache.h>
+ #include <asm-generic/vmlinux.lds.h>
+ 
+-OUTPUT_FORMAT("elf32-or32", "elf32-or32", "elf32-or32")
++OUTPUT_FORMAT("elf32-or1k", "elf32-or1k", "elf32-or1k")
+ jiffies = jiffies_64 + 4;
+ 
+ SECTIONS
diff --git a/board/qemu/or1k/patches/linux/0002-kallsyms.patch b/board/qemu/or1k/patches/linux/0002-kallsyms.patch
new file mode 100644
index 0000000..e788a7a
--- /dev/null
+++ b/board/qemu/or1k/patches/linux/0002-kallsyms.patch
@@ -0,0 +1,25 @@
+From: https://lkml.org/lkml/2016/12/31/13
+
+The build robot reports:
+
+   .tmp_kallsyms1.o: In function `kallsyms_relative_base':
+>> (.rodata+0x8a18): undefined reference to `_text'
+
+This is when using 'make alldefconfig'. Adding this _text symbol to mark
+the start of the kernel as in other architecture fixes this.
+
+Signed-off-by: Stafford Horne <shorne@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur linux-4.9.orig/arch/openrisc/kernel/vmlinux.lds.S linux-4.9/arch/openrisc/kernel/vmlinux.lds.S
+--- linux-4.9.orig/arch/openrisc/kernel/vmlinux.lds.S	2016-12-11 20:17:54.000000000 +0100
++++ linux-4.9/arch/openrisc/kernel/vmlinux.lds.S	2017-01-01 12:13:43.039107518 +0100
+@@ -38,6 +38,8 @@
+         /* Read-only sections, merged into text segment: */
+         . = LOAD_BASE ;
+ 
++	_text = .;
++
+ 	/* _s_kernel_ro must be page aligned */
+ 	. = ALIGN(PAGE_SIZE);
+ 	_s_kernel_ro = .;
diff --git a/board/qemu/or1k/readme.txt b/board/qemu/or1k/readme.txt
new file mode 100644
index 0000000..53c66ad
--- /dev/null
+++ b/board/qemu/or1k/readme.txt
@@ -0,0 +1,9 @@
+Run the emulation with:
+
+ qemu-system-or32 -kernel output/images/vmlinux -nographic
+
+The login prompt will appear in the terminal that started Qemu.
+
+Ethernet support is not working, yet.
+
+Tested with QEMU 2.8.0.
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
new file mode 100644
index 0000000..b2527b4
--- /dev/null
+++ b/configs/qemu_or1k_defconfig
@@ -0,0 +1,19 @@
+# Architecture
+BR2_or1k=y
+
+# Patches
+BR2_GLOBAL_PATCH_DIR="board/qemu/or1k/patches"
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Linux headers same as kernel, a 4,9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux-4.9.config"
