From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 4 May 2021 21:34:36 +0200
Subject: [Buildroot] [git commit] support/testing: add execline tests
Message-ID: <20210504193359.D63CE83998@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7ea0af8831b427e3d8148eda848219478c6dec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test that the interpreter can run a basic command.

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: indent config lines more]
---
 support/testing/tests/package/test_execline.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/support/testing/tests/package/test_execline.py b/support/testing/tests/package/test_execline.py
new file mode 100644
index 0000000000..a7ea36c1a2
--- /dev/null
+++ b/support/testing/tests/package/test_execline.py
@@ -0,0 +1,23 @@
+import os
+
+import infra.basetest
+
+
+class TestExecline(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_EXECLINE=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
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
