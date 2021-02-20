From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Sat, 20 Feb 2021 05:22:39 +0100
Subject: [Buildroot] [PATCH v2] package/zfs: new package
In-Reply-To: <20210203075440.421072-1-salvador.joseluis@gmail.com>
References: <20210203075440.421072-1-salvador.joseluis@gmail.com>
Message-ID: <20210220042239.754812-1-salvador.joseluis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenZFS is an advanced file system and volume manager which was originally
developed for Solaris and is now maintained by the OpenZFS community. This
repository contains the code for running OpenZFS on Linux and FreeBSD.

http://zfsonlinux.org/

Signed-off-by: Jos? Luis Salvador Rufo <salvador.joseluis@gmail.com>
---
Changes v1 -> v2:
  (suggested by Yann E. MORIN)
  - Config.in: check-package accomplished
  - Config.in: fixed Config.in dependences
  - zfs.hash: proper zfs.hash format
  - zfs.mk: added cpe for openzfs
  - zfs.mk: uclibc patch merged into upstream
  - zfs.mk: removed futile comments as "zfs needs"
  - zfs.mk: added comments about the kernel dependence
  - zfs.mk: removed autotools default arguments values
  - zfs.mk: added optional PAM dependence
  - zfs.mk: replaced inline conditionals by full explained blocks
  - zfs.mk: added comments about optionals systemd and sysv
  - zfs.mk: removed --disable-silent-rules
  - zfs.mk: reordered autoreconf
  - zfs.mk: removed futile shared, static, and both logic
  - zfs.mk: fixed optional python(2|3) support for pyzfs
  - zfs.mk: removed futile kernel fragment
  - test_zfs: replaced external toolchain by already defined bootlin
  - test_zfs: increased memory a bit to prevents OOM
  - test_zfs: added pyzfs test

 DEVELOPERS                                |  4 +
 package/Config.in                         |  1 +
 package/zfs/Config.in                     | 32 ++++++++
 package/zfs/zfs.hash                      |  7 ++
 package/zfs/zfs.mk                        | 91 +++++++++++++++++++++++
 support/testing/tests/package/test_zfs.py | 61 +++++++++++++++
 6 files changed, 196 insertions(+)
 create mode 100644 package/zfs/Config.in
 create mode 100644 package/zfs/zfs.hash
 create mode 100644 package/zfs/zfs.mk
 create mode 100644 support/testing/tests/package/test_zfs.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 12e1f83cf7..d805aebe99 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1380,6 +1380,10 @@ F:	package/libuio/
 F:	package/netsniff-ng/
 F:	package/rabbitmq-c/
 
+N:	Jos? Luis Salvador Rufo <salvador.joseluis@gmail.com>
+F:	package/zfs/
+F:	support/testing/tests/package/test_zfs.py
+
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
diff --git a/package/Config.in b/package/Config.in
index 5304ab141c..81bb365e50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -228,6 +228,7 @@ menu "Filesystem and flash utilities"
 	source "package/udftools/Config.in"
 	source "package/unionfs/Config.in"
 	source "package/xfsprogs/Config.in"
+	source "package/zfs/Config.in"
 endmenu
 
 menu "Fonts, cursors, icons, sounds and themes"
diff --git a/package/zfs/Config.in b/package/zfs/Config.in
new file mode 100644
index 0000000000..96711d681e
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
+	select BR2_PACKAGE_LIBTIRPC
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
+	  http://zfsonlinux.org/
+
+	  This package builds the kernel modules and userland utils
+	  required to operates with ZFS volumes.
diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
new file mode 100644
index 0000000000..a2671bd4fd
--- /dev/null
+++ b/package/zfs/zfs.hash
@@ -0,0 +1,7 @@
+# Locally calculated
+sha256  0694f64aa76a3a0a506e20e99b49102c3cb68bef63cb0f0154e50befc387e539  zfs-2.0.3.tar.gz
+sha256  99287507c396717b62c5c17f03619cfc08a25d6a6b067fdfa5738e41dc82e9b3  aef1830f932c3499cb5430b4c1bd9d21f87808f3.patch
+
+# Hash for license files:
+sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
+sha256  1d8894d33462c25b56fc1747cbb5453ab64315306456d26644e51eb3fb44f0e3  COPYRIGHT
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
new file mode 100644
index 0000000000..60afe1940c
--- /dev/null
+++ b/package/zfs/zfs.mk
@@ -0,0 +1,91 @@
+################################################################################
+#
+# zfs
+#
+################################################################################
+
+ZFS_VERSION = 2.0.3
+ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
+ZFS_PATCH = https://github.com/openzfs/zfs/commit/aef1830f932c3499cb5430b4c1bd9d21f87808f3.patch  # Support uClibc for the tests compilations. Merged and queued for the next release.
+ZFS_LICENSE = CDDL
+ZFS_LICENSE_FILES = LICENSE COPYRIGHT
+ZFS_CPE_ID_VENDOR = openzfs
+ZFS_CPE_ID_PRODUCT = openzfs
+ZFS_CPE_ID_PREFIX = cpe:2.3:a
+
+# ZFS userland tools are unfunctional without its Linux kernel modules.
+ZFS_MODULES = zavl icp zlua znvpair spl zunicode zcommon zzstd zfs
+ZFS_MODULE_SUBDIRS = module/avl module/icp module/lua module/nvpair module/spl module/unicode module/zcommon module/zstd module/zfs
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
+ZFS_AUTORECONF = YES
+ZFS_AUTORECONF_OPTS = -fiv
+
+ZFS_DEPENDENCIES += zlib util-linux libtirpc libaio openssl udev
+ZFS_CONF_OPTS = \
+	--with-linux=$(LINUX_DIR) \
+	--with-linux-obj=$(LINUX_DIR) \
+	--with-tirpc \
+	--disable-rpath
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+ZFS_CONF_OPTS += --enable-nls
+else
+ZFS_CONF_OPTS += --disable-nls
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+# Installs the optional systemd generators, units, and presets files.
+ZFS_CONF_OPTS += --enable-systemd
+else
+ZFS_CONF_OPTS += --disable-systemd
+endif
+
+ifeq ($(BR2_INIT_SYSV),y)
+# Installs the optional sysvinit modules-load.d conf. file.
+ZFS_CONF_OPTS += --enable-sysvinit
+else
+ZFS_CONF_OPTS += --disable-sysvinit
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
+# ZFS will check for pam_modules.h
+ZFS_DEPENDENCIES += linux-pam
+ZFS_CONF_ENV += --enable-pam=yes
+else
+ZFS_CONF_OPTS += --disable-pam
+endif
+
+$(eval $(kernel-module))
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
new file mode 100644
index 0000000000..def3e8034b
--- /dev/null
+++ b/support/testing/tests/package/test_zfs.py
@@ -0,0 +1,61 @@
+import os
+
+from ..toolchain.test_external_bootlin import (
+    TestExternalToolchainBootlinX8664corei7UclibcStable,
+)
+
+
+class TestZfs(TestExternalToolchainBootlinX8664corei7UclibcStable):
+    config = (
+        TestExternalToolchainBootlinX8664corei7UclibcStable.config
+        + """
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.17"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL=y
+        BR2_PACKAGE_BUSYBOX=y
+        BR2_PACKAGE_ZFS=y
+        BR2_PACKAGE_ZLIB_NG=y
+        BR2_PACKAGE_LIBRESSL=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SETUPTOOLS=y
+        BR2_PACKAGE_PYTHON_CFFI=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+    )
+
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kernel,
+            kernel_cmdline=["console=ttyS0"],
+            options=["-cpu", "Nehalem", "-m", "272", "-initrd", cpio_file],
+        )
+        self.emulator.login()
+
+        timeout = 35 * self.emulator.timeout_multiplier
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
+            self.assertRunOk(cmd, timeout=timeout)
-- 
2.30.1
