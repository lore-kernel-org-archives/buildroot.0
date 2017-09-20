From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Sep 2017 12:18:45 +0930
Subject: [Buildroot] [PATCH 2/2] configs: Add qemu_ppc64le_pseries
In-Reply-To: <20170920024845.26157-1-joel@jms.id.au>
References: <20170920024845.26157-1-joel@jms.id.au>
Message-ID: <20170920024845.26157-3-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is similar to the ppc64_pseries config, except we build for little
endian instead of big endian.

The default architecture is set to Power8 as this was the first fully
enabled LE machine.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .gitlab-ci.yml                         |  1 +
 DEVELOPERS                             |  2 ++
 board/qemu/ppc64le-pseries/readme.txt  |  9 +++++++++
 configs/qemu_ppc64le_pseries_defconfig | 21 +++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 board/qemu/ppc64le-pseries/readme.txt
 create mode 100644 configs/qemu_ppc64le_pseries_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b44c935f2a93..ff3541a9e3c9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -174,6 +174,7 @@ qemu_mips64r6el_malta_defconfig: *defconfig
 qemu_nios2_10m50_defconfig: *defconfig
 qemu_or1k_defconfig: *defconfig
 qemu_ppc64_pseries_defconfig: *defconfig
+qemu_ppc64le_pseries_defconfig: *defconfig
 qemu_ppc_g3beige_defconfig: *defconfig
 qemu_ppc_mpc8544ds_defconfig: *defconfig
 qemu_ppc_virtex_ml507_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index ed5fa3d7604a..805898d6be97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -913,6 +913,8 @@ F:	package/fxload/
 
 N:	Joel Stanley <joel@jms.id.au>
 F:	package/pdbg/
+F:	board/qemu/ppc64le-pseries/
+F:	configs/qemu_ppc64le_pseries_defconfig
 
 N:	Johan Derycke <johanderycke@gmail.com>
 F:	package/python-libconfig/
diff --git a/board/qemu/ppc64le-pseries/readme.txt b/board/qemu/ppc64le-pseries/readme.txt
new file mode 100644
index 000000000000..dd188c505f4e
--- /dev/null
+++ b/board/qemu/ppc64le-pseries/readme.txt
@@ -0,0 +1,9 @@
+Run the emulation with:
+
+qemu-system-ppc64le -M pseries -nographic \
+		-kernel output/images/vmlinux \
+		-initrd output/images/rootfs.ext2
+
+The login prompt will appear in the terminal window.
+
+Tested with QEMU 2.10.0
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
new file mode 100644
index 000000000000..62e729d30260
--- /dev/null
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -0,0 +1,21 @@
+# Architecture
+BR2_powerpc64le=y
+BR2_powerpc_power8=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.1"
+BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
+BR2_LINUX_KERNEL_VMLINUX=y
-- 
2.14.1
