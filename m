From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 2 Aug 2017 00:52:11 +0200
Subject: [Buildroot] [PATCH v5 01/14] support/testing: add runtime testing
	for init systems
In-Reply-To: <20170801225224.16899-1-arnout@mind.be>
References: <20170801225224.16899-1-arnout@mind.be>
Message-ID: <20170801225224.16899-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The "builtin" kernel does not boot a systemd-based system, so
we resort to building the same one as currently used by our
qemu_arm_vexpress_defconfig.

We test the 8 following combinations:

  - busybox, read-only, without network
  - busybox, read-only, with network
  - busybox, read-write, without network
  - busybox, read-write, with network

  - basic systemd, read-write, network w/ ifupdown
  - basic systemd, read-write, network w/ networkd
  - full systemd, read-write, network w/ networkd

  - no init system, read-only, without network

The tests just verify what the /sbin/init binary is, and that we were
able to grab an IP address. More tests can be added later, for example
to check each systemd features (journal, tmpfiles...)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
[Arnout: update .gitlab-ci.yml]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v4 -> v5: (Arnout)
 - re-ordered
 - update .gitlab-ci.yml

Changes v3 -> v4:
  - drop the systemd read-only tests for now, we do not support it yet.
---
 .gitlab-ci.yml                             |  8 +++
 support/testing/tests/init/__init__.py     |  0
 support/testing/tests/init/base.py         | 47 +++++++++++++++++
 support/testing/tests/init/test_busybox.py | 67 ++++++++++++++++++++++++
 support/testing/tests/init/test_none.py    | 32 ++++++++++++
 support/testing/tests/init/test_systemd.py | 82 ++++++++++++++++++++++++++++++
 6 files changed, 236 insertions(+)
 create mode 100644 support/testing/tests/init/__init__.py
 create mode 100644 support/testing/tests/init/base.py
 create mode 100644 support/testing/tests/init/test_busybox.py
 create mode 100644 support/testing/tests/init/test_none.py
 create mode 100644 support/testing/tests/init/test_systemd.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f9e5b1fa6b..cdae953bf9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -229,6 +229,14 @@ tests.fs.test_jffs2.TestJffs2: *runtime_test
 tests.fs.test_squashfs.TestSquashfs: *runtime_test
 tests.fs.test_ubi.TestUbi: *runtime_test
 tests.fs.test_yaffs2.TestYaffs2: *runtime_test
+tests.init.test_busybox.TestInitSystemBusyboxRo: *runtime_test
+tests.init.test_busybox.TestInitSystemBusyboxRoNet: *runtime_test
+tests.init.test_busybox.TestInitSystemBusyboxRw: *runtime_test
+tests.init.test_busybox.TestInitSystemBusyboxRwNet: *runtime_test
+tests.init.test_none.TestInitSystemNone: *runtime_test
+tests.init.test_systemd.TestInitSystemSystemdRwFull: *runtime_test
+tests.init.test_systemd.TestInitSystemSystemdRwIfupdown: *runtime_test
+tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: *runtime_test
 tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
diff --git a/support/testing/tests/init/__init__.py b/support/testing/tests/init/__init__.py
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
new file mode 100644
index 0000000000..a261d7dd46
--- /dev/null
+++ b/support/testing/tests/init/base.py
@@ -0,0 +1,47 @@
+import os
+import subprocess
+import infra.basetest
+
+class InitSystemBase(infra.basetest.BRTest):
+
+    def startEmulator(self, fs_type, kernel=None, dtb=None, init=None):
+        img = os.path.join(self.builddir, "images", "rootfs.{}".format(fs_type))
+        subprocess.call(["truncate", "-s", "%1M", img])
+
+        options = ["-drive",
+                   "file={},if=sd,format=raw".format(img),
+                   "-M", "vexpress-a9"]
+
+        if kernel is None:
+            kernel = "builtin"
+        else:
+            kernel = os.path.join(self.builddir, "images", kernel)
+            options.extend(["-dtb", os.path.join(self.builddir, "images",
+                                             "{}.dtb".format(dtb))])
+
+        kernel_cmdline = ["root=/dev/mmcblk0",
+                          "rootfstype={}".format(fs_type),
+                          "rootwait",
+                          "ro",
+                          "console=ttyAMA0"]
+
+        if not init is None:
+            kernel_cmdline.extend(["init={}".format(init)])
+
+        self.emulator.boot(arch="armv7",
+                           kernel=kernel,
+                           kernel_cmdline=kernel_cmdline,
+                           options=options)
+
+        if init is None:
+            self.emulator.login()
+
+    def checkInit(self, path):
+        cmd = "cmp /proc/1/exe {}".format(path)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+    def checkNetwork(self, interface, exitCode=0):
+        cmd = "ip addr show {} |grep inet".format(interface)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, exitCode)
diff --git a/support/testing/tests/init/test_busybox.py b/support/testing/tests/init/test_busybox.py
new file mode 100644
index 0000000000..c3e425bf5d
--- /dev/null
+++ b/support/testing/tests/init/test_busybox.py
@@ -0,0 +1,67 @@
+import infra.basetest
+from tests.init.base import InitSystemBase as InitSystemBase
+
+class InitSystemBusyboxBase(InitSystemBase):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def checkInit(self):
+        super(InitSystemBusyboxBase, self).checkInit("/bin/busybox")
+
+
+#-------------------------------------------------------------------------------
+class TestInitSystemBusyboxRo(InitSystemBusyboxBase):
+    config = InitSystemBusyboxBase.config + \
+        """
+        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        """
+
+    def test_run(self):
+        self.startEmulator("squashfs")
+        self.checkInit()
+        self.checkNetwork("eth0", 1)
+
+
+#-------------------------------------------------------------------------------
+class TestInitSystemBusyboxRw(InitSystemBusyboxBase):
+    config = InitSystemBusyboxBase.config + \
+        """
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        self.startEmulator("ext2")
+        self.checkInit()
+        self.checkNetwork("eth0", 1)
+
+
+#-------------------------------------------------------------------------------
+class TestInitSystemBusyboxRoNet(InitSystemBusyboxBase):
+    config = InitSystemBusyboxBase.config + \
+        """
+        BR2_SYSTEM_DHCP="eth0"
+        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        """
+
+    def test_run(self):
+        self.startEmulator("squashfs")
+        self.checkInit()
+        self.checkNetwork("eth0")
+
+
+#-------------------------------------------------------------------------------
+class TestInitSystemBusyboxRwNet(InitSystemBusyboxBase):
+    config = InitSystemBusyboxBase.config + \
+        """
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        self.startEmulator("ext2")
+        self.checkInit()
+        self.checkNetwork("eth0")
diff --git a/support/testing/tests/init/test_none.py b/support/testing/tests/init/test_none.py
new file mode 100644
index 0000000000..f55db5d3e0
--- /dev/null
+++ b/support/testing/tests/init/test_none.py
@@ -0,0 +1,32 @@
+import pexpect
+
+import infra.basetest
+from tests.init.base import InitSystemBase as InitSystemBase
+
+class TestInitSystemNone(InitSystemBase):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_INIT_NONE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        """
+
+    def test_run(self):
+        self.startEmulator(fs_type="squashfs", init="/bin/sh")
+        index = self.emulator.qemu.expect(["/bin/sh: can't access tty; job control turned off", pexpect.TIMEOUT], timeout=60)
+        if index != 0:
+            self.emulator.logfile.write("==> System does not boot")
+            raise SystemError("System does not boot")
+        index = self.emulator.qemu.expect(["#", pexpect.TIMEOUT], timeout=60)
+        if index != 0:
+            self.emulator.logfile.write("==> System does not boot")
+            raise SystemError("System does not boot")
+
+        out, exit_code = self.emulator.run("sh -c 'echo $PPID'")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "1")
+
+        _, exit_code = self.emulator.run("mount -t proc none /proc")
+        self.assertEqual(exit_code, 0)
+
+        self.checkInit("/bin/sh")
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
new file mode 100644
index 0000000000..7a80aa1145
--- /dev/null
+++ b/support/testing/tests/init/test_systemd.py
@@ -0,0 +1,82 @@
+import infra.basetest
+from tests.init.base import InitSystemBase as InitSystemBase
+
+class InitSystemSystemdBase(InitSystemBase):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_INIT_SYSTEMD=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def checkInit(self):
+        super(InitSystemSystemdBase, self).checkInit("/lib/systemd/systemd")
+
+
+#-------------------------------------------------------------------------------
+class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
+    config = InitSystemSystemdBase.config + \
+        """
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        self.startEmulator("ext2", "zImage", "vexpress-v2p-ca9")
+        self.checkInit()
+        self.checkNetwork("eth0")
+
+
+#-------------------------------------------------------------------------------
+class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
+    config = InitSystemSystemdBase.config + \
+        """
+        BR2_SYSTEM_DHCP="eth0"
+        # BR2_PACKAGE_SYSTEMD_NETWORKD is not set
+        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        self.startEmulator("ext2", "zImage", "vexpress-v2p-ca9")
+        self.checkInit()
+        self.checkNetwork("eth0")
+
+
+#-------------------------------------------------------------------------------
+class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
+    config = InitSystemSystemdBase.config + \
+        """
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=y
+        BR2_PACKAGE_SYSTEMD_BACKLIGHT=y
+        BR2_PACKAGE_SYSTEMD_BINFMT=y
+        BR2_PACKAGE_SYSTEMD_COREDUMP=y
+        BR2_PACKAGE_SYSTEMD_FIRSTBOOT=y
+        BR2_PACKAGE_SYSTEMD_HIBERNATE=y
+        BR2_PACKAGE_SYSTEMD_IMPORTD=y
+        BR2_PACKAGE_SYSTEMD_LOCALED=y
+        BR2_PACKAGE_SYSTEMD_LOGIND=y
+        BR2_PACKAGE_SYSTEMD_MACHINED=y
+        BR2_PACKAGE_SYSTEMD_POLKIT=y
+        BR2_PACKAGE_SYSTEMD_QUOTACHECK=y
+        BR2_PACKAGE_SYSTEMD_RANDOMSEED=y
+        BR2_PACKAGE_SYSTEMD_RFKILL=y
+        BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT=y
+        BR2_PACKAGE_SYSTEMD_SYSUSERS=y
+        BR2_PACKAGE_SYSTEMD_VCONSOLE=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        self.startEmulator("ext2", "zImage", "vexpress-v2p-ca9")
+        self.checkInit()
+        self.checkNetwork("eth0")
-- 
2.13.3
