From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Mar 2017 16:03:20 +0100
Subject: [Buildroot] [PATCH v2 4/5] support/testing: add package tests
In-Reply-To: <1488726201-6507-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488726201-6507-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1488726201-6507-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds some basic tests for two Buildroot packages: python and
dropbear. These tests are by no mean meant to be exhaustive, but mainly
to serve as initial examples for other tests.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/package/__init__.py      |  0
 support/testing/tests/package/test_dropbear.py | 28 +++++++++++++++++++++
 support/testing/tests/package/test_python.py   | 35 ++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 support/testing/tests/package/__init__.py
 create mode 100644 support/testing/tests/package/test_dropbear.py
 create mode 100644 support/testing/tests/package/test_python.py

diff --git a/support/testing/tests/package/__init__.py b/support/testing/tests/package/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/support/testing/tests/package/test_dropbear.py b/support/testing/tests/package/test_dropbear.py
new file mode 100644
index 0000000..a64b782
--- /dev/null
+++ b/support/testing/tests/package/test_dropbear.py
@@ -0,0 +1,28 @@
+import os
+
+import infra.basetest
+
+class TestDropbear(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+"""
+BR2_TARGET_GENERIC_ROOT_PASSWD="testpwd"
+BR2_SYSTEM_DHCP="eth0"
+BR2_PACKAGE_DROPBEAR=y
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img,
+                                    "-net", "nic",
+                                    "-net", "user,hostfwd=tcp::2222-:22"])
+        self.emulator.login("testpwd")
+        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:22"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        # Would be useful to try to login through SSH here, through
+        # localhost:2222, though it is not easy to pass the ssh
+        # password on the command line.
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
new file mode 100644
index 0000000..5532fb5
--- /dev/null
+++ b/support/testing/tests/package/test_python.py
@@ -0,0 +1,35 @@
+import os
+
+import infra.basetest
+
+class TestPythonBase(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+"""
+BR2_PACKAGE_PYTHON=y
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+        cmd = "python --version 2>&1 | grep '^Python 2'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "python -c 'import math; math.floor(12.3)'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "python -c 'import ctypes;"
+        cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
+        cmd += "print libc.time(None)'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "python -c 'import zlib'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 1)
-- 
2.7.4
