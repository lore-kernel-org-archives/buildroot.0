From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 15 Jul 2020 10:51:30 -0700
Subject: [Buildroot] [PATCH v5 4/4] support/testing: add firewalld test cases
In-Reply-To: <20200715175130.591273-1-aduskett@gmail.com>
References: <20200715175130.591273-1-aduskett@gmail.com>
Message-ID: <20200715175130.591273-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This test case runs firewalld using both system and sysvinit.

The tests perform the following tasks:
  - Start and login
  - run `firewalld-cmd --state` with the expected output of "running" and a
    return code of 0.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add this patch to the series

 .gitlab-ci.yml                                |  2 +
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_firewalld.py   | 98 +++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 support/testing/tests/package/test_firewalld.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d60a50f5c5..d7e2dc5802 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -407,6 +407,8 @@ tests.package.test_crudini.TestCrudiniPy2: { extends: .runtime_test }
 tests.package.test_crudini.TestCrudiniPy3: { extends: .runtime_test }
 tests.package.test_docker_compose.TestDockerCompose: { extends: .runtime_test }
 tests.package.test_dropbear.TestDropbear: { extends: .runtime_test }
+tests.package.test_firewalld.TestFirewalldSystemd: { extends: .runtime_test }
+tests.package.test_firewalld.TestFirewalldSysVInit: { extends: .runtime_test }
 tests.package.test_glxinfo.TestGlxinfo: { extends: .runtime_test }
 tests.package.test_gst1_python.TestGst1Python: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy3: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index d96c016997..5b020573af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -93,6 +93,7 @@ F:	package/setools/
 F:	package/sngrep/
 F:	package/spidermonkey/
 F:	package/systemd/
+F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_gst1_python.py
 F:	support/testing/tests/package/test_python_gobject.py
 
diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
new file mode 100644
index 0000000000..4fbccfacfa
--- /dev/null
+++ b/support/testing/tests/package/test_firewalld.py
@@ -0,0 +1,98 @@
+"""Test firewalld for both systemd and sysvinit."""
+import os
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestFirewalldSystemd(TestPythonPackageBase):
+    """Build the kernel as firewalld requires all of the nftable options."""
+
+    __test__ = True
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.39"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_FIREWALLD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def wait_boot(self):
+        """Boot time is longer than the default multiplier."""
+        self.emulator.timeout_multiplier *= 10
+        self.emulator.login()
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7",
+                           kernel=kernel_file,
+                           kernel_cmdline=["console=ttyAMA0,115200"],
+                           options=[
+                               "-initrd", cpio_file,
+                               "-dtb", dtb_file,
+                               "-M", "vexpress-a9"
+                           ])
+        self.wait_boot()
+        cmd = "firewall-cmd --state"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertIn("running", output[0])
+        self.assertEqual(exit_code, 0)
+
+
+class TestFirewalldSysVInit(TestPythonPackageBase):
+    """Build the kernel as firewalld requires all of the nftable options."""
+
+    __test__ = True
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.39"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_FIREWALLD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def wait_boot(self):
+        """Boot time is longer than the default multiplier."""
+        self.emulator.timeout_multiplier *= 10
+        self.emulator.login()
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7",
+                           kernel=kernel_file,
+                           kernel_cmdline=["console=ttyAMA0,115200"],
+                           options=[
+                               "-initrd", cpio_file,
+                               "-dtb", dtb_file,
+                               "-M", "vexpress-a9"
+                           ])
+        self.wait_boot()
+        cmd = "firewall-cmd --state"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertIn("running", output[0])
+        self.assertEqual(exit_code, 0)
-- 
2.26.2
