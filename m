From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Wed,  3 Feb 2021 08:54:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/zfs: new package
Message-ID: <20210203075440.421072-1-salvador.joseluis@gmail.com>
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
 DEVELOPERS                                    |   4 +
 package/Config.in                             |   1 +
 ...x-zfs-tests-cmd-xattrtest-for-uclibc.patch |  14 +++
 package/zfs/0002-fix-ztest-for-uclibc.patch   |  20 ++++
 package/zfs/Config.in                         |  29 +++++
 package/zfs/zfs.hash                          |   5 +
 package/zfs/zfs.mk                            | 104 ++++++++++++++++++
 .../testing/conf/zfs-kernel-fragment.config   |   2 +
 support/testing/tests/package/test_zfs.py     |  65 +++++++++++
 9 files changed, 244 insertions(+)
 create mode 100644 package/zfs/0001-fix-zfs-tests-cmd-xattrtest-for-uclibc.patch
 create mode 100644 package/zfs/0002-fix-ztest-for-uclibc.patch
 create mode 100644 package/zfs/Config.in
 create mode 100644 package/zfs/zfs.hash
 create mode 100644 package/zfs/zfs.mk
 create mode 100644 support/testing/conf/zfs-kernel-fragment.config
 create mode 100644 support/testing/tests/package/test_zfs.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 64d770e9fc..707d8266cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1384,6 +1384,10 @@ F:	package/libuio/
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
index 06dfc32cc6..34e4967456 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -228,6 +228,7 @@ menu "Filesystem and flash utilities"
 	source "package/udftools/Config.in"
 	source "package/unionfs/Config.in"
 	source "package/xfsprogs/Config.in"
+	source "package/zfs/Config.in"
 endmenu
 
 menu "Fonts, cursors, icons, sounds and themes"
diff --git a/package/zfs/0001-fix-zfs-tests-cmd-xattrtest-for-uclibc.patch b/package/zfs/0001-fix-zfs-tests-cmd-xattrtest-for-uclibc.patch
new file mode 100644
index 0000000000..39ac1b213e
--- /dev/null
+++ b/package/zfs/0001-fix-zfs-tests-cmd-xattrtest-for-uclibc.patch
@@ -0,0 +1,14 @@
+--- a/tests/zfs-tests/cmd/xattrtest/xattrtest.c	2020-08-30 23:11:05.000000000 +0200
++++ b/tests/zfs-tests/cmd/xattrtest/xattrtest.c	2020-08-30 23:11:05.000000000 +0200
+@@ -44,7 +44,11 @@
+ #include <sys/time.h>
+ #include <linux/limits.h>
+
++#ifdef __UCLIBC__
++extern const char *program_invocation_short_name;
++#else
+ extern char *program_invocation_short_name;
++#endif
+ 
+ #define	ERROR(fmt, ...)                                                 \
+ 	fprintf(stderr, "%s: %s:%d: %s: " fmt "\n",                     \
diff --git a/package/zfs/0002-fix-ztest-for-uclibc.patch b/package/zfs/0002-fix-ztest-for-uclibc.patch
new file mode 100644
index 0000000000..dd755ba573
--- /dev/null
+++ b/package/zfs/0002-fix-ztest-for-uclibc.patch
@@ -0,0 +1,20 @@
+--- a/cmd/ztest/ztest.c	2021-02-01 18:49:13.000000000 +0100
++++ b/cmd/ztest/ztest.c	2021-02-01 18:49:13.000000000 +0100
+@@ -132,7 +132,7 @@
+ #include <libnvpair.h>
+ #include <libzutil.h>
+ #include <sys/crypto/icp.h>
+-#ifdef __GLIBC__
++#if (__GLIBC__ && !__UCLIBC__)
+ #include <execinfo.h> /* for backtrace() */
+ #endif
+ 
+@@ -556,7 +556,7 @@
+ static void sig_handler(int signo)
+ {
+ 	struct sigaction action;
+-#ifdef __GLIBC__ /* backtrace() is a GNU extension */
++#if (__GLIBC__ && !__UCLIBC__) /* backtrace() is a GNU extension */
+ 	int nptrs;
+ 	void *buffer[BACKTRACE_SZ];
+ 
diff --git a/package/zfs/Config.in b/package/zfs/Config.in
new file mode 100644
index 0000000000..0a117c2f7c
--- /dev/null
+++ b/package/zfs/Config.in
@@ -0,0 +1,29 @@
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
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBZLIB
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_LIBTIRPC
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL
+	help
+	  OpenZFS on Linux and FreeBSD
+
+	  OpenZFS is an advanced file system and volume manager which
+	  was originally developed for Solaris and is now maintained by
+	  the OpenZFS community. This repository contains the code for
+	  running OpenZFS on Linux and FreeBSD.
+
+	  http://zfsonlinux.org/
diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
new file mode 100644
index 0000000000..b0ca922d18
--- /dev/null
+++ b/package/zfs/zfs.hash
@@ -0,0 +1,5 @@
+sha256 bde5067ce4577d26cc0f0313a09173ad40d590d01539b92c93f33f06ee150b24 zfs-2.0.2.tar.gz
+
+# Hash for license files:
+sha256 1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520 LICENSE
+sha256 1d8894d33462c25b56fc1747cbb5453ab64315306456d26644e51eb3fb44f0e3 COPYRIGHT
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
new file mode 100644
index 0000000000..42e4a55c47
--- /dev/null
+++ b/package/zfs/zfs.mk
@@ -0,0 +1,104 @@
+###############################################################################
+#
+# zfs
+#
+###############################################################################
+
+ZFS_VERSION = 2.0.2
+ZFS_SOURCE = zfs-$(ZFS_VERSION).tar.gz
+ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
+ZFS_LICENSE = CDDL
+ZFS_LICENSE_FILES = LICENSE COPYRIGHT
+
+ZFS_CONF_OPTS = \
+	--prefix=/usr \
+	--bindir=/bin \
+	--sbindir=/sbin \
+	--libdir=/lib \
+	--sysconfdir=/etc \
+	--enable-pam=$(if $(BR2_PACKAGE_LINUX_PAM),yes,no) \
+	--enable-systemd=$(if $(BR2_INIT_SYSTEMD),yes,no) \
+	--enable-sysvinit=$(if $(BR2_INIT_SYSV),yes,no) \
+	$(if $(BR2_SYSTEM_ENABLE_NLS),,--disable-nls) \
+	--with-udevdir=/lib/udev \
+	--with-linux=$(LINUX_DIR) \
+	--with-linux-obj=$(LINUX_DIR) \
+	--disable-rpath \
+	--disable-silent-rules
+
+ZFS_AUTORECONF = YES
+ZFS_AUTORECONF_OPTS = -fiv
+
+# Static, shared or both
+ifeq ($(BR2_STATIC_LIBS),y)
+ZFS_CONF_OPTS += --enable-static=yes --enable-shared=no
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+ZFS_CONF_OPTS += --enable-static=yes --enable-shared=yes
+else ifeq ($(BR2_SHARED_LIBS),y)
+ZFS_CONF_OPTS += --enable-static=no --enable-shared=yes
+endif
+
+# Optional python support
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+ZFS_CONF_ENV += PYTHON=$(STAGING_DIR)/usr/bin/python
+ZFS_CONF_OPTS += --enable-pyzfs --with-python=$(PYTHON_VERSION)
+ZFS_DEPENDENCIES += python
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ZFS_CONF_ENV += PYTHON=$(STAGING_DIR)/usr/bin/python
+ZFS_CONF_OPTS += --enable-pyzfs --with-python=$(PYTHON3_VERSION)
+ZFS_DEPENDENCIES += python3
+else
+ZFS_CONF_OPTS += --enable-pyzfs=no --with-python=no
+endif
+
+# ZFS needs zlib
+ZFS_DEPENDENCIES += libzlib
+ZFS_CONF_ENV += ZLIB_CFLAGS="-I$(STAGING_DIR)/usr/include"
+ZFS_CONF_ENV += ZLIB_LIBS="-lz"
+
+# ZFS needs libuuid (util-linux)
+ZFS_DEPENDENCIES += util-linux
+ZFS_CONF_ENV += LIBUUID_CFLAGS="-I$(STAGING_DIR)/usr/include/uuid"
+ZFS_CONF_ENV += LIBUUID_LIBS="-luuid"
+ZFS_CONF_ENV += LIBBLKID_CFLAGS="-I$(STAGING_DIR)/usr/include/blkid"
+ZFS_CONF_ENV += LIBBLKID_LIBS="-lblkid"
+
+# ZFS needs libtirpc
+ZFS_DEPENDENCIES += libtirpc
+ZFS_CONF_ENV += LIBTIRPC_CFLAGS="-I$(STAGING_DIR)/usr/include/tirpc"
+ZFS_CONF_ENV += LIBTIRPC_LIBS="-ltirpc"
+ZFS_CONF_OPTS += --with-tirpc
+#endif
+
+# ZFS needs libaio
+ZFS_DEPENDENCIES += libaio
+ZFS_CONF_ENV += LIBAIO_CFLAGS="-I$(STAGING_DIR)/usr/include/"
+ZFS_CONF_ENV += LIBAIO_LIBS="-laio"
+
+# ZFS needs libopenssl
+ZFS_DEPENDENCIES += libopenssl
+ZFS_CONF_ENV += LIBCRYPTO_CFLAGS="-I$(STAGING_DIR)/usr/include/"
+ZFS_CONF_ENV += LIBCRYPTO_LIBS="-lcrypto"
+
+# ZFS needs udev
+ZFS_CONF_ENV += LIBUDEV_CFLAGS="-I$(STAGING_DIR)/usr/include/"
+# The ZFS Makefile expects the /lib/udev/rules.d directory to exist.
+define ZFS_CREATE_MISSING_DIRS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/lib/udev/rules.d
+endef
+ZFS_PRE_INSTALL_TARGET_HOOKS += ZFS_CREATE_MISSING_DIRS
+
+# Linux kernel config
+define ZFS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_DEBUG_LOCK_ALLOC)  # incompatible with the CDDL license
+	$(call KCONFIG_DISABLE_OPT,CONFIG_TRIM_UNUSED_KSYMS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ZLIB_DEFLATE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ZLIB_INFLATE)
+endef
+
+# Linux kernel modules
+ZFS_MODULES = zavl icp zlua znvpair spl zunicode zcommon zzstd zfs
+ZFS_MODULE_SUBDIRS = module/avl module/icp module/lua module/nvpair module/spl module/unicode module/zcommon module/zstd module/zfs
+$(eval $(kernel-module))
+
+$(eval $(autotools-package))
diff --git a/support/testing/conf/zfs-kernel-fragment.config b/support/testing/conf/zfs-kernel-fragment.config
new file mode 100644
index 0000000000..4c3cead8ef
--- /dev/null
+++ b/support/testing/conf/zfs-kernel-fragment.config
@@ -0,0 +1,2 @@
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_ZLIB_DEFLATE=y
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
new file mode 100644
index 0000000000..637669d522
--- /dev/null
+++ b/support/testing/tests/package/test_zfs.py
@@ -0,0 +1,65 @@
+import os
+
+import infra.basetest
+
+
+class TestZfs(infra.basetest.BRTest):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kcfgfrag}"
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.12"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL=y
+        BR2_PACKAGE_BUSYBOX=y
+        BR2_PACKAGE_ZFS=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+        BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2020.08-1.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_WCHAR=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        """.format(
+        kcfgfrag=infra.filepath("conf/zfs-kernel-fragment.config")
+    )
+
+    def test_run(self):
+        timeout = 35 * self.emulator.timeout_multiplier
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kernel,
+            kernel_cmdline=["console=ttyS0"],
+            options=["-initrd", cpio_file],
+        )
+        self.emulator.login()
+
+        for cmd in [
+            # Init
+            "modprobe zfs",
+            "mount -o remount,size=160M /tmp",
+            "fallocate -l 64M /tmp/container1.raw",
+            "fallocate -l 64M /tmp/container2.raw",
+            "zpool create -m /pool pool raidz /tmp/container1.raw /tmp/container2.raw",
+            "dd if=/dev/urandom bs=1M count=8 of=/pool/urandom",
+            "sha256sum /pool/urandom > /tmp/urandom.sha256",
+            # Check
+            "zpool export pool",
+            "zpool import pool -d /tmp/container1.raw -d /tmp/container2.raw",
+            "dd conv=notrunc bs=1M count=32 seek=16 if=/dev/urandom of=/tmp/container1.raw",
+            "zpool scrub -w pool",
+            "sha256sum -c /tmp/urandom.sha256",
+            "zpool status -v",
+            "zpool export pool",
+            "rm /tmp/container1.raw /tmp/container2.raw /tmp/urandom.sha256",
+        ]:
+            self.assertRunOk(cmd, timeout=timeout)
-- 
2.30.0
