From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 17:54:47 +0200
Subject: [Buildroot] [git commit] board: Add PowerPC mac99
Message-ID: <20190801155208.CDDAE84287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8fac3fcfc2c71c8a30d28c3d2e74646490502c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PowerPC kernel developers were after a userspace for testing 32-bit
powerpc kernels. This machine both suits that requirement and has
support in qemu. It's also a fairly common piece of 32-bit ppc hardware.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Tested-by: Daniel Axtens <dja@axtens.net>
[Peter: lock kernel/headers to 5.2.4]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                          |  2 ++
 board/qemu/ppc-mac99/linux.fragment |  3 +++
 board/qemu/ppc-mac99/readme.txt     |  5 +++++
 configs/qemu_ppc_mac99_defconfig    | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 78cdae8f3d..877bb36a66 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1149,6 +1149,8 @@ N:	Joel Stanley <joel@jms.id.au>
 F:	package/pdbg/
 F:	board/qemu/ppc64le-pseries/
 F:	configs/qemu_ppc64le_pseries_defconfig
+F:	board/qemu/ppc-mac99/
+F:	configs/qemu_ppc_mac99_defconfig
 
 N:	Johan Derycke <johanderycke@gmail.com>
 F:	package/python-libconfig/
diff --git a/board/qemu/ppc-mac99/linux.fragment b/board/qemu/ppc-mac99/linux.fragment
new file mode 100644
index 0000000000..b1975f8253
--- /dev/null
+++ b/board/qemu/ppc-mac99/linux.fragment
@@ -0,0 +1,3 @@
+CONFIG_SERIAL_PMACZILOG=y
+CONFIG_SERIAL_PMACZILOG_TTYS=y
+CONFIG_SERIAL_PMACZILOG_CONSOLE=y
diff --git a/board/qemu/ppc-mac99/readme.txt b/board/qemu/ppc-mac99/readme.txt
new file mode 100644
index 0000000000..a8a18db5b9
--- /dev/null
+++ b/board/qemu/ppc-mac99/readme.txt
@@ -0,0 +1,5 @@
+Run the emulation with:
+
+  qemu-system-ppc -nographic -vga none -M mac99 -cpu g4 -m 1G -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -net nic,model=sungem -net user -append "root=/dev/sda"
+
+Tested with QEMU 3.1.0
diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
new file mode 100644
index 0000000000..377fc9466f
--- /dev/null
+++ b/configs/qemu_ppc_mac99_defconfig
@@ -0,0 +1,14 @@
+BR2_powerpc=y
+BR2_powerpc_7400=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.4"
+BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
+BR2_LINUX_KERNEL_VMLINUX=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
