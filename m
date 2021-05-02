From: Dick Olsson <hi@senzilla.io>
Date: Sun, 02 May 2021 08:17:32 +0000
Subject: [Buildroot] [PATCH 5/5] support/testing: add s6-networking tests
Message-ID: <V2TNjX0qltwA0640z5rMA5K205FnnBlqvPL9ZrCks@cp3-web-033.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test that the TAICLOCK and TCP servers are working.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 .../tests/package/test_s6_networking.py       | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 support/testing/tests/package/test_s6_networking.py

diff --git a/support/testing/tests/package/test_s6_networking.py b/support/testing/tests/package/test_s6_networking.py
new file mode 100644
index 0000000000..ae008f7a4b
--- /dev/null
+++ b/support/testing/tests/package/test_s6_networking.py
@@ -0,0 +1,35 @@
+import os
+
+import infra.basetest
+
+
+class TestS6Networking(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_PACKAGE_S6_NETWORKING=y
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
+        # Test the TAICLOCK server and client
+        _, exit_code = self.emulator.run("s6-taiclockd &")
+        self.emulator.run("sleep 2")
+        cmd = "s6-taiclock 127.0.0.1 | s6-clockview"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0][0:6], "before")
+        self.assertEqual(output[1][0:5], "after")
+
+        # Test the TCP server and client
+        _, exit_code = self.emulator.run("s6-tcpserver4 127.0.0.1 1024 cat &")
+        self.emulator.run("sleep 2")
+        cmd = "echo foobar | s6-tcpclient 127.0.0.1 1024 s6-ioconnect -67"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "foobar")
-- 
2.30.2
