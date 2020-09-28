From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Mon, 28 Sep 2020 16:54:19 +0200
Subject: [Buildroot] [PATCH 1/7] support/testing: add an SELinuxSystemdExt4
 test
In-Reply-To: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
References: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
Message-ID: <20200928145425.2109095-2-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a test called 'SELinuxSystemdExt4'. This test will build an
SELinux enabled image with systemd, boot it, and perform a few runtime
tests to check SELinux related capabilities.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 support/testing/tests/boot/test_selinux.py | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 support/testing/tests/boot/test_selinux.py

diff --git a/support/testing/tests/boot/test_selinux.py b/support/testing/tests/boot/test_selinux.py
new file mode 100644
index 000000000000..b7e15655e7eb
--- /dev/null
+++ b/support/testing/tests/boot/test_selinux.py
@@ -0,0 +1,59 @@
+import os
+
+import infra.basetest
+
+
+class TestSELinuxSystemd(infra.basetest.BRTest):
+    config = """
+             BR2_x86_64=y
+             BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+             BR2_INIT_SYSTEMD=y
+             BR2_LINUX_KERNEL=y
+             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+             BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.12"
+             BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+             BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+             BR2_PACKAGE_LIBSELINUX=y
+             BR2_PACKAGE_REFPOLICY=y
+             """
+
+    def wait_boot(self):
+        # The complete boot with systemd takes more time than what the default multipler permits
+        self.emulator.timeout_multiplier *= 10
+        self.emulator.login()
+
+    def run_tests(self, fstype):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        rootfs = os.path.join(self.builddir, "images", "rootfs.{}".format(fstype))
+
+        self.emulator.boot(arch="x86_64", kernel=kernel,
+                           kernel_cmdline=["root=/dev/vda", "rootfstype={}".format(fstype),
+                                           "console=ttyS0", "security=selinux"],
+                           options=["-drive", "file={},if=virtio,format=raw".format(rootfs)])
+        self.wait_boot()
+
+        # Test the reported SELinux mode.
+        out, ret = self.emulator.run("getenforce")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Permissive")
+
+        # Check the extended arguments are correctly set.
+        out, ret = self.emulator.run("ls -dZ /")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0].split()[0], "system_u:object_r:root_t")
+
+        # Check init's attributes.
+        out, ret = self.emulator.run("cat /proc/1/attr/current")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "system_u:system_r:init_t\0")
+
+class TestSELinuxSystemdExt4(TestSELinuxSystemd):
+    config = TestSELinuxSystemd.config + \
+            """
+            BR2_TARGET_ROOTFS_EXT2=y
+            BR2_TARGET_ROOTFS_EXT2_4=y
+            BR2_TARGET_ROOTFS_EXT2_SIZE="100M"
+            """
+
+    def test_run(self):
+        self.run_tests("ext4")
-- 
2.26.2
