From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 11 Oct 2019 00:08:39 -0300
Subject: [Buildroot] [PATCH 2/2] support/testing: add tmux test
In-Reply-To: <20191011030839.15308-1-ricardo.martincoski@gmail.com>
References: <20191011030839.15308-1-ricardo.martincoski@gmail.com>
Message-ID: <20191011030839.15308-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/318041807
---
 .gitlab-ci.yml                             |  1 +
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_tmux.py | 42 ++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 support/testing/tests/package/test_tmux.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7d21752365..59efd51340 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -466,6 +466,7 @@ tests.package.test_rings.TestLuajitRings: { extends: .runtime_test }
 tests.package.test_rust.TestRust: { extends: .runtime_test }
 tests.package.test_rust.TestRustBin: { extends: .runtime_test }
 tests.package.test_syslog_ng.TestSyslogNg: { extends: .runtime_test }
+tests.package.test_tmux.TestTmux: { extends: .runtime_test }
 tests.package.test_turbolua.TestLuajitTurbolua: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 7e4d7fa94a..9323847d63 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1968,6 +1968,7 @@ F:	support/testing/tests/download/
 F:	support/testing/tests/package/*_python*.py
 F:	support/testing/tests/package/test_atop.py
 F:	support/testing/tests/package/test_syslog_ng.py
+F:	support/testing/tests/package/test_tmux.py
 F:	support/testing/tests/utils/test_check_package.py
 F:	utils/check-package
 F:	utils/checkpackagelib/
diff --git a/support/testing/tests/package/test_tmux.py b/support/testing/tests/package/test_tmux.py
new file mode 100644
index 0000000000..7eb23cac97
--- /dev/null
+++ b/support/testing/tests/package/test_tmux.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+
+class TestTmux(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_GENERATE_LOCALE="en_US.UTF-8"
+        BR2_PACKAGE_TMUX=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        cmd = "tmux -V"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "tmux -C </dev/null"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "tmux split"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "tmux new-window"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "tmux list-windows"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("(2 panes)", output[0])
+        self.assertIn("(1 panes)", output[1])
-- 
2.17.1
