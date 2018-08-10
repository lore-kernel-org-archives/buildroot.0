From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Aug 2018 08:27:17 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] support/testing: add test
 for file capabilities
Message-ID: <20180810062602.916EB8B81E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3510619bc40505130afdff45f6b7ccb90ea5e364
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5f201de0dca4f7ed9bd2be9d836fbb7955f5b572)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                                     |  1 +
 support/testing/tests/core/device_table2.txt       |  7 ++++
 .../tests/core/squashfs-xattr-kernel.config        |  1 +
 .../testing/tests/core/test_file_capabilities.py   | 47 ++++++++++++++++++++++
 4 files changed, 56 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e80491cdde..0357927f34 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -258,6 +258,7 @@ zynq_zybo_defconfig: *defconfig
 tests.boot.test_atf.TestATFAllwinner: *runtime_test
 tests.boot.test_atf.TestATFMarvell: *runtime_test
 tests.boot.test_atf.TestATFVexpress: *runtime_test
+tests.core.test_file_capabilities.TestFileCapabilities: *runtime_test
 tests.core.test_post_scripts.TestPostScripts: *runtime_test
 tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
 tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
diff --git a/support/testing/tests/core/device_table2.txt b/support/testing/tests/core/device_table2.txt
new file mode 100644
index 0000000000..f8323217f3
--- /dev/null
+++ b/support/testing/tests/core/device_table2.txt
@@ -0,0 +1,7 @@
+# <name>				<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+/usr/sbin/getcap                        f       755     0       0	-	-	-	-	-
+|xattr cap_sys_nice+eip
+# leading spaces are ignored for xattr
+  |xattr cap_kill+eip
+# leading tabs are ignored for xattr
+	|xattr cap_sys_time+eip
diff --git a/support/testing/tests/core/squashfs-xattr-kernel.config b/support/testing/tests/core/squashfs-xattr-kernel.config
new file mode 100644
index 0000000000..81b21b94c5
--- /dev/null
+++ b/support/testing/tests/core/squashfs-xattr-kernel.config
@@ -0,0 +1 @@
+CONFIG_SQUASHFS_XATTR=y
diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
new file mode 100644
index 0000000000..945b48a4c3
--- /dev/null
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -0,0 +1,47 @@
+import os
+import subprocess
+
+import infra.basetest
+
+
+class TestFileCapabilities(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt {}"
+        BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_PACKAGE_LIBCAP=y
+        BR2_PACKAGE_LIBCAP_TOOLS=y
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(infra.filepath("tests/core/device_table2.txt"),
+                   infra.filepath("tests/core/squashfs-xattr-kernel.config"))
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.squashfs")
+        subprocess.call(["truncate", "-s", "%1M", img])
+
+        self.emulator.boot(arch="armv7",
+                           kernel=os.path.join(self.builddir, "images", "zImage"),
+                           kernel_cmdline=["root=/dev/mmcblk0",
+                                           "rootfstype=squashfs"],
+                           options=["-drive", "file={},if=sd,format=raw".format(img),
+                                    "-M", "vexpress-a9",
+                                    "-dtb", os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")])
+        self.emulator.login()
+
+        cmd = "getcap -v /usr/sbin/getcap"
+        output, _ = self.emulator.run(cmd)
+        self.assertIn("cap_kill", output[0])
+        self.assertIn("cap_sys_nice", output[0])
+        self.assertIn("cap_sys_time", output[0])
+        self.assertIn("+eip", output[0])
