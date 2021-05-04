From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 4 May 2021 21:56:49 +0200
Subject: [Buildroot] [git commit] support/testing: add s6-rc tests
Message-ID: <20210504193400.0B10788071@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50c6e932dcb80528f50964958202dfc1627d4e9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test that s6-rc service database compilation is working.

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: indent config lines more]
---
 support/testing/tests/package/test_s6_rc.py | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/support/testing/tests/package/test_s6_rc.py b/support/testing/tests/package/test_s6_rc.py
new file mode 100644
index 0000000000..8d375efe88
--- /dev/null
+++ b/support/testing/tests/package/test_s6_rc.py
@@ -0,0 +1,47 @@
+import os
+
+import infra.basetest
+
+
+class TestS6Rc(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_S6_RC=y
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
+        _, exit_code = self.emulator.run("s6-svscan -h")
+        self.assertEqual(exit_code, 100)
+
+        # Set up two service directories with a dependency
+        self.emulator.run("mkdir -p source/testsv1")
+        self.emulator.run("mkdir -p source/testsv2")
+        self.emulator.run("echo oneshot > source/testsv1/type")
+        self.emulator.run("echo oneshot > source/testsv2/type")
+        self.emulator.run("echo 'echo foo' > source/testsv1/up")
+        self.emulator.run("echo 'echo bar' > source/testsv2/up")
+        self.emulator.run("echo testsv1 > source/testsv2/dependencies")
+        self.emulator.run("chmod +x source/testsv1/up")
+        self.emulator.run("chmod +x source/testsv2/up")
+
+        # Compile the service database
+        _, exit_code = self.emulator.run("s6-rc-compile compiled source")
+        self.assertEqual(exit_code, 0)
+
+        # Inspect dependencies
+        cmd = "s6-rc-db -c compiled -d dependencies testsv1"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "testsv2")
+        cmd = "s6-rc-db -c compiled dependencies testsv2"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "testsv1")
