From: Dick Olsson <hi@senzilla.io>
Date: Sun, 02 May 2021 08:17:06 +0000
Subject: [Buildroot] [PATCH 1/5] support/testing: add execline tests
Message-ID: <eo7CYV0YZ4qRmxaeQZRmJU36KSSNGDWQmeGLr5Wzeo@cp3-web-033.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test that the interpreter can run a basic command.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 .../testing/tests/package/test_execline.py    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 support/testing/tests/package/test_execline.py

diff --git a/support/testing/tests/package/test_execline.py b/support/testing/tests/package/test_execline.py
new file mode 100644
index 0000000000..e655b501ea
--- /dev/null
+++ b/support/testing/tests/package/test_execline.py
@@ -0,0 +1,22 @@
+import os
+
+import infra.basetest
+
+
+class TestExecline(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_PACKAGE_EXECLINE=y
+    BR2_TARGET_ROOTFS_CPIO=y
+    # BR2_TARGET_ROOTFS_TAR is not set
+    """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
+
+        output, exit_code = self.emulator.run("execlineb -c 'echo hello world'")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0].strip(), "hello world")
-- 
2.30.2
