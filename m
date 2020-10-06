From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 15:30:12 +0200
Subject: [Buildroot] [git commit]
 support/testing/tests/init/test_systemd_selinux: new SELinuxSystemdExt4
 test
Message-ID: <20201006132255.D31F17FB4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d466b9c0ffb3e6167ac9ec2fae7c59efdc09f79f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds a test called 'SELinuxSystemdExt4'. This test will build an
SELinux enabled image with systemd, boot it, and perform a few runtime
tests to check SELinux related capabilities.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 support/testing/tests/init/test_systemd_selinux.py | 62 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 95942cbeee..f147088996 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -255,6 +255,7 @@ F:	package/gnuplot/
 
 N:	Antoine T??nart <antoine.tenart@bootlin.com>
 F:	package/wf111/
+F:	support/testing/tests/init/test_systemd_selinux.py
 
 N:	Antony Pavlov <antonynpavlov@gmail.com>
 F:	package/lsscsi/
diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
new file mode 100644
index 0000000000..527dbf10ac
--- /dev/null
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -0,0 +1,62 @@
+import os
+
+import infra.basetest
+
+
+class TestSELinuxSystemd(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_INIT_SYSTEMD=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.12"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_PACKAGE_LIBSELINUX=y
+        BR2_PACKAGE_REFPOLICY=y
+        """
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
+                           options=["-cpu", "Nehalem",
+                                    "-drive", "file={},if=virtio,format=raw".format(rootfs)])
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
+        """
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="100M"
+        """
+
+    def test_run(self):
+        self.run_tests("ext4")
