From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 28 Jan 2019 00:14:06 -0200
Subject: [Buildroot] [PATCH 2/2] support/testing: add atop test
In-Reply-To: <20190128021406.27477-1-ricardo.martincoski@gmail.com>
References: <20190128021406.27477-1-ricardo.martincoski@gmail.com>
Message-ID: <20190128021406.27477-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .gitlab-ci.yml                             |  1 +
 support/testing/tests/package/test_atop.py | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 support/testing/tests/package/test_atop.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 79daebf160..8f1e4ae804 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -317,6 +317,7 @@ tests.init.test_systemd.TestInitSystemSystemdRoNetworkd: *runtime_test
 tests.init.test_systemd.TestInitSystemSystemdRwFull: *runtime_test
 tests.init.test_systemd.TestInitSystemSystemdRwIfupdown: *runtime_test
 tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: *runtime_test
+tests.package.test_atop.TestAtop: *runtime_test
 tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
diff --git a/support/testing/tests/package/test_atop.py b/support/testing/tests/package/test_atop.py
new file mode 100644
index 0000000000..32c5a07c3c
--- /dev/null
+++ b/support/testing/tests/package/test_atop.py
@@ -0,0 +1,40 @@
+import os
+
+import infra.basetest
+
+
+class TestAtop(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_PACKAGE_ATOP=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "zImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        dtb = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7", kernel=kernel, options=["-initrd", cpio_file, "-M", "vexpress-a9", "-dtb", dtb])
+        self.emulator.login()
+
+        cmd = "atop -V | grep '^Version'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "atop -a 1 2 | grep '% *atop *$'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
-- 
2.17.1
