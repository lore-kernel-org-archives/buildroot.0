From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 13:25:27 +0200
Subject: [Buildroot] [git commit] support/testing/tests/core: SSP &
 hardening flags
Message-ID: <20181020113218.7133683AB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=963f824511b68104469cfda6d8874df0651ed9bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Catch the commonly used options of SSP, Relro, and fortify.
Using the package targets of busybox and lighttpd.  This
can easily be expanded to a larger list.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                               |   6 ++
 support/testing/tests/core/test_hardening.py | 110 +++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 769583b6b9..d6a2319ba0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -265,6 +265,12 @@ tests.boot.test_atf.TestATFAllwinner: *runtime_test
 tests.boot.test_atf.TestATFMarvell: *runtime_test
 tests.boot.test_atf.TestATFVexpress: *runtime_test
 tests.core.test_file_capabilities.TestFileCapabilities: *runtime_test
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
index 0000000000..9f26962b30
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
