From: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
Date: Thu, 30 Apr 2020 16:09:06 +0200
Subject: [Buildroot] [PATCH v2 1/1] support/testing: add
 package/test_mender.py
Message-ID: <20200430140906.GA10544@P-NAN-EREVAN-mikbou>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create a test to check Mender client at runtime.

The aim of this test is:
  - to check the correct execution of simple Mender commands,
    in a minimal environment;
  - to validate there is no missing dependencies for runtime.

This test is not a board integration test for Mender,
including well-configured bootloader, partitioning, ...

Check:
  - the daemon is started;
  - the current 'artifact name' (name of the image or update) of the active
    partition is read, without error.

For that, we need to fake (see the 'overlay' directory):
  - some bootloader environment variables;
  - the name of an update.

Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
---
Changes v1 -> v2:
  - Update the test by removing unnecessary 'build' option (Thomas P.)
  - Remove a useless test case (Thomas P.)

Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
---
 .gitlab-ci.yml                                |  1 +
 support/testing/tests/package/test_mender.py  | 32 +++++++++++++++++++
 .../rootfs-overlay/etc/mender/artifact_info   |  1 +
 .../rootfs-overlay/usr/bin/fw_printenv        |  6 ++++
 4 files changed, 40 insertions(+)
 create mode 100644 support/testing/tests/package/test_mender.py
 create mode 100644 support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
 create mode 100755 support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fa8e077a07..029a8d00aa 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -520,6 +520,7 @@ tests.package.test_rust.TestRustBin: { extends: .runtime_test }
 tests.package.test_syslog_ng.TestSyslogNg: { extends: .runtime_test }
 tests.package.test_tmux.TestTmux: { extends: .runtime_test }
 tests.package.test_turbolua.TestLuajitTurbolua: { extends: .runtime_test }
+tests.package.test_mender.TestMender: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainCCache: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
new file mode 100644
index 0000000000..8b5200b609
--- /dev/null
+++ b/support/testing/tests/package/test_mender.py
@@ -0,0 +1,32 @@
+import os
+
+import infra.basetest
+
+
+class TestMender(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_MENDER=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_ROOTFS_OVERLAY="{}"
+        """.format(
+           # overlay to add a fake 'fw_printenv', used by Mender
+           infra.filepath("tests/package/test_mender/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check if the Daemon is running
+        self.assertRunOk("ls /var/run/mender.pid")
+        self.assertRunOk("ps aux | egrep [m]ender")
+
+        # Check if a simple Mender command is correctly executed
+        self.assertRunOk("mender -log-level debug -show-artifact")
+        self.assertRunOk("mender -log-level debug -show-artifact | grep 'RUNTIME_TEST_ARTIFACT_NAME'")
+        cmd = "mender -show-artifact 2>&1 | grep -i 'err'"  # Check if no 'error' among the traces
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 1)
diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
new file mode 100644
index 0000000000..4d54b8f89c
--- /dev/null
+++ b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
@@ -0,0 +1 @@
+artifact_name=RUNTIME_TEST_ARTIFACT_NAME
diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv b/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv
new file mode 100755
index 0000000000..c002a0f2b8
--- /dev/null
+++ b/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# Fake 'fw_printenv' because UBoot is not installed: print some plausible 'key-value'
+echo "bootcount=0"
+echo "mender_boot_part=rootfs"
+echo "upgrade_available=0"
-- 
2.20.1
