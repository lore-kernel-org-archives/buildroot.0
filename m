From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Apr 2021 23:08:17 +0200
Subject: [Buildroot] [git commit] package/zfs: new package
Message-ID: <20210413204821.F37698144C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4470bc9914d730383db86f58bc86fb09739622dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenZFS is an advanced file system and volume manager which was originally
developed for Solaris and is now maintained by the OpenZFS community. This
repository contains the code for running OpenZFS on Linux and FreeBSD.

http://zfsonlinux.org/

Signed-off-by: Jos?? Luis Salvador Rufo <salvador.joseluis@gmail.com>
[me:
  - fix test case on how to use a pre-built toolchain
  - reorder the test case config
  - add test case with glibc
  - drop superflous test timeout override
  - only select libtirpc when C library lacks native RPC
  - drop unused ZFS_MODULES variable
  - drop ZFS_CPE_ID_PREFIX and ZFS_AUTORECONF_OPTS which are defaults
  - drop NLS options, already set in a generic manner
  - drop incomplete/improper sysvinit support
  - some cosmetics
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                |   4 +
 package/Config.in                         |   1 +
 package/zfs/Config.in                     |  32 ++++++++
 package/zfs/zfs.hash                      |   6 ++
 package/zfs/zfs.mk                        |  91 +++++++++++++++++++++++
 support/testing/tests/package/test_zfs.py | 117 ++++++++++++++++++++++++++++++
 6 files changed, 251 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7699c471d3..1348b8eb91 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1401,6 +1401,10 @@ F:	package/libuio/
 F:	package/netsniff-ng/
 F:	package/rabbitmq-c/
 
+N:	Jos?? Luis Salvador Rufo <salvador.joseluis@gmail.com>
+F:	package/zfs/
+F:	support/testing/tests/package/test_zfs.py
+
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
diff --git a/package/Config.in b/package/Config.in
index 19f2606b6b..ea0e9edc3e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -229,6 +229,7 @@ menu "Filesystem and flash utilities"
 	source "package/udftools/Config.in"
 	source "package/unionfs/Config.in"
 	source "package/xfsprogs/Config.in"
+	source "package/zfs/Config.in"
 endmenu
 
 menu "Fonts, cursors, icons, sounds and themes"
diff --git a/package/zfs/Config.in b/package/zfs/Config.in
new file mode 100644
index 0000000000..c766c370e4
--- /dev/null
+++ b/package/zfs/Config.in
@@ -0,0 +1,32 @@
+comment "zfs needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "zfs needs udev /dev management"
+	depends on BR2_LINUX_KERNEL
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+config BR2_PACKAGE_ZFS
+	bool "zfs"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_USE_MMU  # util-linux (libblkid)
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # libtirpc
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  OpenZFS on Linux and FreeBSD
+
+	  OpenZFS is an advanced file system and volume manager which
+	  was originally developed for Solaris and is now maintained by
+	  the OpenZFS community. This repository contains the code for
+	  running OpenZFS on Linux and FreeBSD.
+
+	  This package builds the kernel modules and userland utils
+	  required to operates with ZFS volumes.
+
+	  http://zfsonlinux.org/
diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
new file mode 100644
index 0000000000..5a0c43d366
--- /dev/null
+++ b/package/zfs/zfs.hash
@@ -0,0 +1,6 @@
+# Locally calculated
+sha256  7d1344c5433b91823f02c2e40b33d181fa6faf286bea5591f4b1965f23d45f6c  zfs-2.0.4.tar.gz
+
+# Hash for license files:
+sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
+sha256  f125a37c829705eff3e6f77a9f6c58fd71060f84ab54180b98fafdf94a2021eb  COPYRIGHT
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
new file mode 100644
index 0000000000..c8e33a7b1a
--- /dev/null
+++ b/package/zfs/zfs.mk
@@ -0,0 +1,91 @@
+################################################################################
+#
+# zfs
+#
+################################################################################
+
+ZFS_VERSION = 2.0.4
+ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
+ZFS_LICENSE = CDDL
+ZFS_LICENSE_FILES = LICENSE COPYRIGHT
+ZFS_CPE_ID_VENDOR = openzfs
+ZFS_CPE_ID_PRODUCT = openzfs
+
+ZFS_AUTORECONF = YES
+
+ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib
+
+# sysvinit installs only a commented-out modules-load.d/ config file
+ZFS_CONF_OPTS = \
+	--with-linux=$(LINUX_DIR) \
+	--with-linux-obj=$(LINUX_DIR) \
+	--disable-rpath \
+	--disable-sysvinit
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+ZFS_DEPENDENCIES += libtirpc
+ZFS_CONF_OPTS += --with-tirpc
+else
+ZFS_CONF_OPTS += --without-tirpc
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+# Installs the optional systemd generators, units, and presets files.
+ZFS_CONF_OPTS += --enable-systemd
+else
+ZFS_CONF_OPTS += --disable-systemd
+endif
+
+# The optional PyZFS uses different scripts depending on the python
+# version (ex: arc_summary2 or arc_summary3).
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+ZFS_DEPENDENCIES += python python-setuptools host-python-cffi
+ZFS_CONF_ENV += \
+	PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python2-config --ldflags`" \
+	PYTHON_SITE_PKG="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
+ZFS_CONF_OPTS += --enable-pyzfs
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ZFS_DEPENDENCIES += python3 python-setuptools host-python-cffi
+ZFS_CONF_ENV += \
+	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`" \
+	PYTHON_EXTRA_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`" \
+	PYTHON_SITE_PKG="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
+ZFS_CONF_OPTS += --enable-pyzfs
+else
+ZFS_CONF_OPTS += --disable-pyzfs --without-python
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+ZFS_DEPENDENCIES += linux-pam
+ZFS_CONF_ENV += --enable-pam=yes
+else
+ZFS_CONF_OPTS += --disable-pam
+endif
+
+# ZFS userland tools are unfunctional without the Linux kernel modules.
+ZFS_MODULE_SUBDIRS = \
+	module/avl \
+	module/icp \
+	module/lua \
+	module/nvpair \
+	module/spl \
+	module/unicode \
+	module/zcommon \
+	module/zstd \
+	module/zfs
+
+# These requirements will be validated by zfs/config/kernel-config-defined.m4
+define ZFS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_DEBUG_LOCK_ALLOC)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_TRIM_UNUSED_KSYMS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DEFLATE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ZLIB_DEFLATE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ZLIB_INFLATE)
+endef
+
+$(eval $(kernel-module))
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
new file mode 100644
index 0000000000..e5f5526faf
--- /dev/null
+++ b/support/testing/tests/package/test_zfs.py
@@ -0,0 +1,117 @@
+import os
+
+import infra.basetest
+
+
+class TestZfsGlibc(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.23"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_PACKAGE_ZFS=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CFFI=y
+        BR2_PACKAGE_PYTHON_SETUPTOOLS=y
+        BR2_PACKAGE_ZLIB_NG=y
+        BR2_PACKAGE_LIBRESSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kernel,
+            kernel_cmdline=["console=ttyS0"],
+            options=["-cpu", "Nehalem", "-m", "320", "-initrd", cpio_file],
+        )
+        self.emulator.login()
+
+        cmds = [
+            # Init
+            "modprobe zfs",
+            "mount -o remount,size=132M /tmp",
+            "fallocate -l 64M /tmp/container1.raw",
+            "fallocate -l 64M /tmp/container2.raw",
+            "zpool create -m /pool pool raidz /tmp/container1.raw /tmp/container2.raw",
+            "dd if=/dev/urandom bs=1M count=8 of=/pool/urandom",
+            "sha256sum /pool/urandom > /tmp/urandom.sha256",
+            # Check ZFS
+            "zpool export pool",
+            "zpool import pool -d /tmp/container1.raw -d /tmp/container2.raw",
+            "dd conv=notrunc bs=1M count=32 seek=16 if=/dev/urandom of=/tmp/container1.raw",
+            "zpool scrub -w pool",
+            "sha256sum -c /tmp/urandom.sha256",
+            "zpool status -v",
+            # Check PyZFS
+            "arc_summary",
+        ]
+        for cmd in cmds:
+            self.assertRunOk(cmd)
+
+
+class TestZfsUclibc(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.23"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_PACKAGE_ZFS=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CFFI=y
+        BR2_PACKAGE_PYTHON_SETUPTOOLS=y
+        BR2_PACKAGE_ZLIB_NG=y
+        BR2_PACKAGE_LIBRESSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kernel,
+            kernel_cmdline=["console=ttyS0"],
+            options=["-cpu", "Nehalem", "-m", "320", "-initrd", cpio_file],
+        )
+        self.emulator.login()
+
+        cmds = [
+            # Init
+            "modprobe zfs",
+            "mount -o remount,size=132M /tmp",
+            "fallocate -l 64M /tmp/container1.raw",
+            "fallocate -l 64M /tmp/container2.raw",
+            "zpool create -m /pool pool raidz /tmp/container1.raw /tmp/container2.raw",
+            "dd if=/dev/urandom bs=1M count=8 of=/pool/urandom",
+            "sha256sum /pool/urandom > /tmp/urandom.sha256",
+            # Check ZFS
+            "zpool export pool",
+            "zpool import pool -d /tmp/container1.raw -d /tmp/container2.raw",
+            "dd conv=notrunc bs=1M count=32 seek=16 if=/dev/urandom of=/tmp/container1.raw",
+            "zpool scrub -w pool",
+            "sha256sum -c /tmp/urandom.sha256",
+            "zpool status -v",
+            # Check PyZFS
+            "arc_summary",
+        ]
+        for cmd in cmds:
+            self.assertRunOk(cmd)
