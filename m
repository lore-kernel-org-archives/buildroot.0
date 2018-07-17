From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 16 Jul 2018 22:04:20 -0500
Subject: [Buildroot] [PATCH v2 6/6] support/testing/tests/core: SSP &
 hardening flags
Message-ID: <20180717030420.12009-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Catch the commonly used options of SSP, Relro, and fortify.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes v1 -> v2
[Ricardo
 - Fix flake8 warnings
 - Added missing busyfox pie assertions
 - Updated the yml to include new test cases
---
 .gitlab-ci.yml                               |   6 +
 support/testing/tests/core/test_hardening.py | 112 +++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 support/testing/tests/core/test_hardening.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e80491cdde..49f83918d6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -258,6 +258,12 @@ zynq_zybo_defconfig: *defconfig
 tests.boot.test_atf.TestATFAllwinner: *runtime_test
 tests.boot.test_atf.TestATFMarvell: *runtime_test
 tests.boot.test_atf.TestATFVexpress: *runtime_test
+tests.core.test_hardening.TestFortifyConserv: *runtime_test
+tests.core.test_hardening.TestFortifyNone: *runtime_test
+tests.core.test_hardening.TestRelro: *runtime_test
+tests.core.test_hardening.TestRelroPartial: *runtime_test
+tests.core.test_hardening.TestSspNone: *runtime_test
+tests.core.test_hardening.TestSspStrong: *runtime_test
 tests.core.test_post_scripts.TestPostScripts: *runtime_test
 tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
 tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
new file mode 100644
index 0000000000..d3eb0941d3
--- /dev/null
+++ b/support/testing/tests/core/test_hardening.py
@@ -0,0 +1,112 @@
+import os
+import subprocess
+import json
+
+import infra.basetest
+
+HARD_DEFCONFIG = \
+    """
+    BR2_powerpc64=y
+    BR2_powerpc_e5500=y
+    BR2_TOOLCHAIN_EXTERNAL=y
+    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+    BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2018.02-2.tar.bz2"
+    BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+    BR2_TOOLCHAIN_EXTERNAL_CXX=y
+    BR2_PACKAGE_LIGHTTPD=y
+    BR2_PACKAGE_HOST_CHECKSEC=y
+    # BR2_TARGET_ROOTFS_TAR is not set
+    """
+
+
+def checksec_run(builddir, target_file):
+    cmd = ["host/bin/checksec", "--output", "json", "--file", target_file]
+    ret = subprocess.check_output(cmd,
+                                  stderr=open(os.devnull, "w"),
+                                  cwd=builddir,
+                                  env={"LANG": "C"})
+    return ret
+
+
+class TestRelro(infra.basetest.BRTest):
+    config = HARD_DEFCONFIG + \
+        """
+        BR2_RELRO_FULL=y
+        """
+
+    def test_run(self):
+        out = json.loads(checksec_run(self.builddir, "target/usr/sbin/lighttpd"))
+        self.assertEqual(out["file"]["relro"], "full")
+        self.assertEqual(out["file"]["pie"], "yes")
+        out = json.loads(checksec_run(self.builddir, "target/bin/busybox"))
+        self.assertEqual(out["file"]["relro"], "full")
+        self.assertEqual(out["file"]["pie"], "yes")
+
+
+class TestRelroPartial(infra.basetest.BRTest):
+    config = HARD_DEFCONFIG + \
+        """
+        BR2_RELRO_PARTIAL=y
+        """
+
+    def test_run(self):
+        out = json.loads(checksec_run(self.builddir, "target/usr/sbin/lighttpd"))
+        self.assertEqual(out["file"]["relro"], "partial")
+        self.assertEqual(out["file"]["pie"], "no")
+        out = json.loads(checksec_run(self.builddir, "target/bin/busybox"))
+        self.assertEqual(out["file"]["relro"], "partial")
+        self.assertEqual(out["file"]["pie"], "no")
+
+
+class TestSspNone(infra.basetest.BRTest):
+    config = HARD_DEFCONFIG + \
+        """
+        BR2_SSP_NONE=y
+        """
+
+    def test_run(self):
+        out = json.loads(checksec_run(self.builddir, "target/usr/sbin/lighttpd"))
+        self.assertEqual(out["file"]["canary"], "no")
+        out = json.loads(checksec_run(self.builddir, "target/bin/busybox"))
+        self.assertEqual(out["file"]["canary"], "no")
+
+
+class TestSspStrong(infra.basetest.BRTest):
+    config = HARD_DEFCONFIG + \
+        """
+        BR2_SSP_STRONG=y
+        """
+
+    def test_run(self):
+        out = json.loads(checksec_run(self.builddir, "target/usr/sbin/lighttpd"))
+        self.assertEqual(out["file"]["canary"], "yes")
+        out = json.loads(checksec_run(self.builddir, "target/bin/busybox"))
+        self.assertEqual(out["file"]["canary"], "yes")
+
+
+class TestFortifyNone(infra.basetest.BRTest):
+    config = HARD_DEFCONFIG + \
+        """
+        BR2_FORTIFY_SOURCE_NONE=y
+        """
+
+    def test_run(self):
+        out = json.loads(checksec_run(self.builddir, "target/usr/sbin/lighttpd"))
+        self.assertEqual(out["file"]["fortified"], "0")
+        out = json.loads(checksec_run(self.builddir, "target/bin/busybox"))
+        self.assertEqual(out["file"]["fortified"], "0")
+
+
+class TestFortifyConserv(infra.basetest.BRTest):
+    config = HARD_DEFCONFIG + \
+        """
+        BR2_FORTIFY_SOURCE_1=y
+        """
+
+    def test_run(self):
+        out = json.loads(checksec_run(self.builddir, "target/usr/sbin/lighttpd"))
+        self.assertNotEqual(out["file"]["fortified"], "0")
+        out = json.loads(checksec_run(self.builddir, "target/bin/busybox"))
+        self.assertNotEqual(out["file"]["fortified"], "0")
-- 
2.17.0
