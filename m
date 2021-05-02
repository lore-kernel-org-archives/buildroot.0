From: Dick Olsson <hi@senzilla.io>
Date: Sun, 02 May 2021 08:17:19 +0000
Subject: [Buildroot] [PATCH 3/5] support/testing: add s6-portable-utils tests
Message-ID: <la8vvzD949UZWTyCADnG35lrAC1pd5EKAwRBsVGzzY@cp4-web-040.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test that a few basis utilities are working.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 .../tests/package/test_s6_portable_utils.py   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 support/testing/tests/package/test_s6_portable_utils.py

diff --git a/support/testing/tests/package/test_s6_portable_utils.py b/support/testing/tests/package/test_s6_portable_utils.py
new file mode 100644
index 0000000000..2fb45aefbc
--- /dev/null
+++ b/support/testing/tests/package/test_s6_portable_utils.py
@@ -0,0 +1,31 @@
+import os
+
+import infra.basetest
+
+
+class TestS6PortableUtils(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_PACKAGE_S6_PORTABLE_UTILS=y
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
+        output, exit_code = self.emulator.run("s6-basename /sbin/init")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0].strip(), "init")
+
+        output, exit_code = self.emulator.run("s6-echo hello world | s6-cut -d' ' -f2")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0].strip(), "world")
+
+        _, exit_code = self.emulator.run("s6-mkfifo testpipe")
+        self.assertEqual(exit_code, 0)
+        _, exit_code = self.emulator.run("s6-test -p testpipe")
+        self.assertEqual(exit_code, 0)
-- 
2.30.2
