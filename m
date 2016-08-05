From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Fri,  5 Aug 2016 13:56:26 +0300
Subject: [Buildroot] [PATCH] config: add Synopsys nSIM and nSIM OSCI
	platforms
Message-ID: <1470394586-6091-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nSIM and nSIM OSCI are 2 simulation platforms from Synopsys
that could emulate both ARCompact and ARCv2 CPUs.

Note for ARCv2 we provide both UP (uni-processor) and SMP
(multi-processor) configs.

So-called "standalone" nSIM and it's free flavor Free nSIM
have only 1 peripheral - serial port. Still they are
(especially free version) very useful for regression testing
and debugging of Linux kernel.

nSIM OSCI emulates more functional boards having not only serial port
but as well:
 * LCD screen
  * PS/2 keyboard
   * Ethernet controller (which communicates with the host)

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 configs/snps_nsim_700_defconfig          | 18 ++++++++++++++++++
 configs/snps_nsim_hs38_defconfig         | 19 +++++++++++++++++++
 configs/snps_nsim_hs38_smp_defconfig     | 19 +++++++++++++++++++
 configs/snps_nsimosci_700_defconfig      | 19 +++++++++++++++++++
 configs/snps_nsimosci_hs38_defconfig     | 20 ++++++++++++++++++++
 configs/snps_nsimosci_hs38_smp_defconfig | 20 ++++++++++++++++++++
 6 files changed, 115 insertions(+)
 create mode 100644 configs/snps_nsim_700_defconfig
 create mode 100644 configs/snps_nsim_hs38_defconfig
 create mode 100644 configs/snps_nsim_hs38_smp_defconfig
 create mode 100644 configs/snps_nsimosci_700_defconfig
 create mode 100644 configs/snps_nsimosci_hs38_defconfig
 create mode 100644 configs/snps_nsimosci_hs38_smp_defconfig

diff --git a/configs/snps_nsim_700_defconfig b/configs/snps_nsim_700_defconfig
new file mode 100644
index 0000000..3486d9a
--- /dev/null
+++ b/configs/snps_nsim_700_defconfig
@@ -0,0 +1,18 @@
+# Architecture
+BR2_arcle=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="nsim"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC nSIM"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_DEFCONFIG="nsim_700"
+BR2_LINUX_KERNEL_VMLINUX=y
+
diff --git a/configs/snps_nsim_hs38_defconfig b/configs/snps_nsim_hs38_defconfig
new file mode 100644
index 0000000..435b2ac
--- /dev/null
+++ b/configs/snps_nsim_hs38_defconfig
@@ -0,0 +1,19 @@
+# Architecture
+BR2_arcle=y
+BR2_archs38=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="nsim"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC nSIM"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_DEFCONFIG="nsim_hs"
+BR2_LINUX_KERNEL_VMLINUX=y
+
diff --git a/configs/snps_nsim_hs38_smp_defconfig b/configs/snps_nsim_hs38_smp_defconfig
new file mode 100644
index 0000000..b61b81c
--- /dev/null
+++ b/configs/snps_nsim_hs38_smp_defconfig
@@ -0,0 +1,19 @@
+# Architecture
+BR2_arcle=y
+BR2_archs38=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="nsim"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC nSIM"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_DEFCONFIG="nsim_hs_smp"
+BR2_LINUX_KERNEL_VMLINUX=y
+
diff --git a/configs/snps_nsimosci_700_defconfig b/configs/snps_nsimosci_700_defconfig
new file mode 100644
index 0000000..7cdedc3
--- /dev/null
+++ b/configs/snps_nsimosci_700_defconfig
@@ -0,0 +1,19 @@
+# Architecture
+BR2_arcle=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="nsimosci"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC nSIM OSCI"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
+
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_DEFCONFIG="nsimosci"
+BR2_LINUX_KERNEL_VMLINUX=y
+
diff --git a/configs/snps_nsimosci_hs38_defconfig b/configs/snps_nsimosci_hs38_defconfig
new file mode 100644
index 0000000..5ebece2
--- /dev/null
+++ b/configs/snps_nsimosci_hs38_defconfig
@@ -0,0 +1,20 @@
+# Architecture
+BR2_arcle=y
+BR2_archs38=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="nsimosci"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC nSIM OSCI"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
+
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_DEFCONFIG="nsimosci_hs"
+BR2_LINUX_KERNEL_VMLINUX=y
+
diff --git a/configs/snps_nsimosci_hs38_smp_defconfig b/configs/snps_nsimosci_hs38_smp_defconfig
new file mode 100644
index 0000000..3edaf4d
--- /dev/null
+++ b/configs/snps_nsimosci_hs38_smp_defconfig
@@ -0,0 +1,20 @@
+# Architecture
+BR2_arcle=y
+BR2_archs38=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="nsimosci"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC nSIM OSCI"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
+
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_DEFCONFIG="nsimosci_hs_smp"
+BR2_LINUX_KERNEL_VMLINUX=y
+
-- 
2.5.5
