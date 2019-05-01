From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  1 May 2019 14:52:36 +0200
Subject: [Buildroot] [PATCH] board/qemu/ppc*: disable Werror while building
 ppc kernel with gcc >= 9.1
Message-ID: <20190501125236.16786-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From patch [1] included in kernel >= 5.0:
"The upcoming GCC 9 release extends the -Wmissing-attributes warnings
(enabled by -Wall) to C and aliases: it warns when particular function
attributes are missing in the aliases but not in their target.

In particular, it triggers for all the init/cleanup_module
aliases in the kernel (defined by the module_init/exit macros),
ending up being very noisy.

These aliases point to the __init/__exit functions of a module,
which are defined as __cold (among other attributes). However,
the aliases themselves do not have the __cold attribute.

Since the compiler behaves differently when compiling a __cold
function as well as when compiling paths leading to calls
to __cold functions, the warning is trying to point out
the possibly-forgotten attribute in the alias."

Werror is set by default while building ppc kernel [2], but
some warning can be introduced while building current kernel with
newer compiler (for example building kernel 4.19 with gcc 9.1).

Instead of backporting this patch [1] to kernel 4.19, select
the Kconfig option CONFIG_PPC_DISABLE_WERROR that allow to
disable Werror.

Add CONFIG_PPC_DISABLE_WERROR only for qemu ppc{64} defconfig
since they are used for CI with toolchain-builder's gitlab [3].

Fixes:
https://gitlab.com/kubu93/toolchains-builder/-/jobs/205435741

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=a6e60d84989fa0e91db7f236eda40453b0e44afa
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=ba55bd74360ea4b8b95e73ed79474d37ff482b36
[3] https://gitlab.com/bootlin/toolchains-builder

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Note: It can be usefull to select CONFIG_PPC_DISABLE_WERROR for
other ppc board defconfig.
---
 board/qemu/ppc-g3beige/linux.config       | 1 +
 board/qemu/ppc-mpc8544ds/linux.config     | 1 +
 board/qemu/ppc-virtex-ml507/linux.config  | 1 +
 board/qemu/ppc64-e5500/linux.fragment     | 2 ++
 board/qemu/ppc64-pseries/linux.fragment   | 1 +
 board/qemu/ppc64le-pseries/linux.fragment | 1 +
 configs/qemu_ppc64_pseries_defconfig      | 1 +
 configs/qemu_ppc64le_pseries_defconfig    | 1 +
 8 files changed, 9 insertions(+)
 create mode 100644 board/qemu/ppc64-pseries/linux.fragment
 create mode 100644 board/qemu/ppc64le-pseries/linux.fragment

diff --git a/board/qemu/ppc-g3beige/linux.config b/board/qemu/ppc-g3beige/linux.config
index 7994553544..a65df7d807 100644
--- a/board/qemu/ppc-g3beige/linux.config
+++ b/board/qemu/ppc-g3beige/linux.config
@@ -23,3 +23,4 @@ CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_BOOTX_TEXT=y
+CONFIG_PPC_DISABLE_WERROR=y
diff --git a/board/qemu/ppc-mpc8544ds/linux.config b/board/qemu/ppc-mpc8544ds/linux.config
index b36847c93d..ec65510d9d 100644
--- a/board/qemu/ppc-mpc8544ds/linux.config
+++ b/board/qemu/ppc-mpc8544ds/linux.config
@@ -36,3 +36,4 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_FSL=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_TMPFS=y
+CONFIG_PPC_DISABLE_WERROR=y
diff --git a/board/qemu/ppc-virtex-ml507/linux.config b/board/qemu/ppc-virtex-ml507/linux.config
index ed4eb792b6..b07ba6e5fb 100644
--- a/board/qemu/ppc-virtex-ml507/linux.config
+++ b/board/qemu/ppc-virtex-ml507/linux.config
@@ -34,3 +34,4 @@ CONFIG_EXT4_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
+CONFIG_PPC_DISABLE_WERROR=y
diff --git a/board/qemu/ppc64-e5500/linux.fragment b/board/qemu/ppc64-e5500/linux.fragment
index 071a55ccf7..7a33b09065 100644
--- a/board/qemu/ppc64-e5500/linux.fragment
+++ b/board/qemu/ppc64-e5500/linux.fragment
@@ -8,3 +8,5 @@ CONFIG_VIRTIO_PCI=y
 CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_VIRTIO_NET=y
+
+CONFIG_PPC_DISABLE_WERROR=y
diff --git a/board/qemu/ppc64-pseries/linux.fragment b/board/qemu/ppc64-pseries/linux.fragment
new file mode 100644
index 0000000000..6ea12a1243
--- /dev/null
+++ b/board/qemu/ppc64-pseries/linux.fragment
@@ -0,0 +1 @@
+CONFIG_PPC_DISABLE_WERROR=y
diff --git a/board/qemu/ppc64le-pseries/linux.fragment b/board/qemu/ppc64le-pseries/linux.fragment
new file mode 100644
index 0000000000..6ea12a1243
--- /dev/null
+++ b/board/qemu/ppc64le-pseries/linux.fragment
@@ -0,0 +1 @@
+CONFIG_PPC_DISABLE_WERROR=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 5f55b246f7..38c9ad5654 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -19,3 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-pseries/linux.fragment"
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 8356e4e250..bf00009e45 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -19,3 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64le-pseries/linux.fragment"
-- 
2.14.5
