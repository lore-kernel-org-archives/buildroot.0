From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 22:08:15 +0200
Subject: [Buildroot] [git commit] support/testing: add sudo package test
Message-ID: <20210510194729.EC26786EB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74bae64dc5955bc9d14e8c6ac8c6b189e82ccc47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Create a new user 'sudotest' to validate that sudo really works (i.e.
properly has setuid).

Creating the user and adding it to sudoers is done at runtime, otherwise
we'd need to add extra files to the config which complicates things a
little bit.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_sudo.py | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/support/testing/tests/package/test_sudo.py b/support/testing/tests/package/test_sudo.py
new file mode 100644
index 0000000000..f9d0a6f301
--- /dev/null
+++ b/support/testing/tests/package/test_sudo.py
@@ -0,0 +1,36 @@
+import os
+
+import infra.basetest
+
+
+class TestSudo(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_SUDO=y
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
+        # -D    don't set a password
+        # -h    set home directory
+        # -H    don't create home directory
+        # -s    set shell
+        _, exit_code = self.emulator.run("adduser -D -h /tmp -H -s /bin/sh sudotest")
+        self.assertEqual(exit_code, 0)
+
+        _, exit_code = self.emulator.run("echo 'sudotest ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers")
+        self.assertEqual(exit_code, 0)
+
+        output, exit_code = self.emulator.run("su - sudotest -c 'echo hello world'")
+        self.assertEqual(output, ["hello world"])
+
+        output, exit_code = self.emulator.run("su - sudotest -c 'sudo echo hello world'")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output, ["hello world"])
