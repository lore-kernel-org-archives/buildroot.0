From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 29 Aug 2018 16:20:55 -0500
Subject: [Buildroot] [PATCH 5/5] support/testing/tests/core: SSP & hardening
 flags
In-Reply-To: <1535577655-9583-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1535577655-9583-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1535577655-9583-6-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Catch the commonly used options of SSP, Relro, and fortify.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes
Original v4 -> v1 of link wrapper patchset
 - Added back in busybox test case

v3 -> v4
 - Removed commented out lines I missed when I removed busybox
 - Removed duplicate fortify assertion test

v2 -> v3
[Matt
 - Removed the busybox target as without the link time
   wrapper/specfile being merged the build will fail.
   Link time conflict between use of 'r' and pie.

[Thomas
 - Add clarificaion of what checksec can test
 - Reworked using inheritance
 - Relocated json load (removed duplication)

v1 -> v2
[Ricardo
 - Fix flake8 warnings
 - Added missing busyfox pie assertions
 - Updated the yml to include new test cases
---
 .gitlab-ci.yml                               |   6 ++
 support/testing/tests/core/test_hardening.py | 110 +++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 support/testing/tests/core/test_hardening.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3fc9b06..c271c05 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -261,6 +261,12 @@ zynqmp_zcu106_defconfig: *defconfig
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
index 0000000..9f26962
--- /dev/null
+++ b/support/testing/tests/core/test_hardening.py
@@ -0,0 +1,110 @@
+import os
+import subprocess
+import json
+
+import infra.basetest
+
+
+class TestHardeningBase(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_powerpc64=y
+        BR2_powerpc_e5500=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2018.02-2.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_PACKAGE_LIGHTTPD=y
+        BR2_PACKAGE_HOST_CHECKSEC=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    checksec_files = ["usr/sbin/lighttpd","bin/busybox"]
+
+    def checksec_run(self, target_file):
+        filepath = os.path.join(self.builddir, "target", target_file)
+        cmd = ["host/bin/checksec", "--output", "json", "--file", filepath]
+        # Checksec is being used for elf file analysis only.  There are no
+        # assumptions of target/run-time checks as part of this testing.
+        ret = subprocess.check_output(cmd,
+                                      stderr=open(os.devnull, "w"),
+                                      cwd=self.builddir,
+                                      env={"LANG": "C"})
+        return json.loads(ret)
+
+
+class TestRelro(TestHardeningBase):
+    config = TestHardeningBase.config + \
+        """
+        BR2_RELRO_FULL=y
+        """
+
+    def test_run(self):
+        for f in self.checksec_files:
+            out = self.checksec_run(f)
+            self.assertEqual(out["file"]["relro"], "full")
+            self.assertEqual(out["file"]["pie"], "yes")
+
+
+class TestRelroPartial(TestHardeningBase):
+    config = TestHardeningBase.config + \
+        """
+        BR2_RELRO_PARTIAL=y
+        """
+
+    def test_run(self):
+        for f in self.checksec_files:
+            out = self.checksec_run(f)
+            self.assertEqual(out["file"]["relro"], "partial")
+            self.assertEqual(out["file"]["pie"], "no")
+
+
+class TestSspNone(TestHardeningBase):
+    config = TestHardeningBase.config + \
+        """
+        BR2_SSP_NONE=y
+        """
+
+    def test_run(self):
+        for f in self.checksec_files:
+            out = self.checksec_run(f)
+            self.assertEqual(out["file"]["canary"], "no")
+
+
+class TestSspStrong(TestHardeningBase):
+    config = TestHardeningBase.config + \
+        """
+        BR2_SSP_STRONG=y
+        """
+
+    def test_run(self):
+        for f in self.checksec_files:
+            out = self.checksec_run(f)
+            self.assertEqual(out["file"]["canary"], "yes")
+
+
+class TestFortifyNone(TestHardeningBase):
+    config = TestHardeningBase.config + \
+        """
+        BR2_FORTIFY_SOURCE_NONE=y
+        """
+
+    def test_run(self):
+        for f in self.checksec_files:
+            out = self.checksec_run(f)
+            self.assertEqual(out["file"]["fortified"], "0")
+
+
+class TestFortifyConserv(TestHardeningBase):
+    config = TestHardeningBase.config + \
+        """
+        BR2_FORTIFY_SOURCE_1=y
+        """
+
+    def test_run(self):
+        for f in self.checksec_files:
+            out = self.checksec_run(f)
+            self.assertNotEqual(out["file"]["fortified"], "0")
-- 
1.9.1
