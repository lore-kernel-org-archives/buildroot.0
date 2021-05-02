From: Dick Olsson <hi@senzilla.io>
Date: Sun, 02 May 2021 08:17:12 +0000
Subject: [Buildroot] [PATCH 2/5] support/testing: add s6 tests
Message-ID: <VwWJsppMN7KalptbUD3cY22Vr9WusoGGsG2irkxRE@cp3-web-033.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test that directory scanning and supervision is working.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 support/testing/tests/package/test_s6.py | 54 ++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 support/testing/tests/package/test_s6.py

diff --git a/support/testing/tests/package/test_s6.py b/support/testing/tests/package/test_s6.py
new file mode 100644
index 0000000000..4c6f3c0976
--- /dev/null
+++ b/support/testing/tests/package/test_s6.py
@@ -0,0 +1,54 @@
+import os
+
+import infra.basetest
+
+
+class TestS6(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_PACKAGE_S6=y
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
+        _, exit_code = self.emulator.run("s6-svscan -h")
+        self.assertEqual(exit_code, 100)
+
+        script = """
+#!/bin/execlineb -P
+s6-ipcserver-socketbinder /tmp/socket
+s6-ipcserverd
+cat
+"""
+
+        # Set up scanning and service directories
+        self.emulator.run("mkdir -p source/testsv")
+        self.emulator.run("cat > source/testsv/run <<EOF" + script + "EOF")
+        self.emulator.run("chmod +x source/testsv/run")
+        _, exit_code = self.emulator.run("s6-svok source/testsv")
+        self.assertEqual(exit_code, 1)
+
+        # Run a scan and start all services
+        self.emulator.run("s6-svscan source &")
+        self.emulator.run("sleep 2")
+        _, exit_code = self.emulator.run("s6-svok source/testsv")
+        self.assertEqual(exit_code, 0)
+
+        # Test a running service
+        cmd = "echo foobar | s6-ipcclient /tmp/socket s6-ioconnect -67"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "foobar")
+
+        # Terminate all services
+        _, exit_code = self.emulator.run("s6-svscanctl -t source")
+        self.assertEqual(exit_code, 0)
+        self.emulator.run("sleep 2")
+        _, exit_code = self.emulator.run("s6-svok source/testsv")
+        self.assertEqual(exit_code, 1)
-- 
2.30.2
