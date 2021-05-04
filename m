From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 4 May 2021 21:53:52 +0200
Subject: [Buildroot] [git commit] support/testing: add s6-portable-utils
 tests
Message-ID: <20210504193359.F2ADC83998@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77c13ae989be6d7aebb8099fc454e9c47dcf9566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test that a few basis utilities are working.

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: indent config lines more]
---
 .../tests/package/test_s6_portable_utils.py        | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/support/testing/tests/package/test_s6_portable_utils.py b/support/testing/tests/package/test_s6_portable_utils.py
new file mode 100644
index 0000000000..372e3ba812
--- /dev/null
+++ b/support/testing/tests/package/test_s6_portable_utils.py
@@ -0,0 +1,32 @@
+import os
+
+import infra.basetest
+
+
+class TestS6PortableUtils(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_S6_PORTABLE_UTILS=y
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
