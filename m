From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Tue,  8 Sep 2020 17:51:40 +0200
Subject: [Buildroot] [PATCH 2/4] support/testing: add the SELinuxExt4 test
In-Reply-To: <20200908155142.1385820-1-antoine.tenart@bootlin.com>
References: <20200908155142.1385820-1-antoine.tenart@bootlin.com>
Message-ID: <20200908155142.1385820-3-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a test called 'SELinuxExt4'. This test will build an SELinux
enabled image using the in-tree qemu_x86_64_selinux_defconfig, boot the
image, and perform a few runtime tests to check SELinux related
capabilities.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 support/testing/tests/boot/test_selinux.py | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 support/testing/tests/boot/test_selinux.py

diff --git a/support/testing/tests/boot/test_selinux.py b/support/testing/tests/boot/test_selinux.py
new file mode 100644
index 000000000000..7b67feed83b5
--- /dev/null
+++ b/support/testing/tests/boot/test_selinux.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+
+class TestSELinux(infra.basetest.BRTest):
+    # Use the available Qemu x86_64 SELinux defconfig.
+    with open(infra.filepath("../../configs/qemu_x86_64_selinux_defconfig")) as f:
+        config = f.read()
+
+    def wait_boot(self):
+        # The complete boot with systemd takes more time than what the default multipler permits
+        self.emulator.timeout_multiplier *= 10
+        self.emulator.login()
+
+    def run_tests(self):
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
+class TestSELinuxExt4(TestSELinux):
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
+
+        self.emulator.boot(arch="x86_64", kernel=kernel,
+                           kernel_cmdline=["root=/dev/vda", "console=ttyS0", "security=selinux"],
+                           options=["-drive", "file={},if=virtio,format=raw".format(rootfs)])
+
+        self.wait_boot()
+        self.run_tests()
-- 
2.26.2
