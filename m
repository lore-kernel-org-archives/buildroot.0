From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Aug 2019 22:15:18 +0200
Subject: [Buildroot] [git commit] support/testing: fix hardening tests
Message-ID: <20190805201630.8BD958E272@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c39c90ae1968492ef565fe9afbe639cc38e9a69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since "2467822c85 package/checksec: bump to version 2.1.0" the hardening
tests fail because upstream slightly changed the way the script is
called.
According to README.md: "- All options now require `--$option=$value`
instead of `--$option $value`"

Instead of just replacing '--output json' with '--output=json' take into
account that upstream also changed the usage example to show --format
instead of --output. Both options do exactly the same, but following the
usage example seems to be more future-proof.

Upstream also improved the json output. Now when a file is passed as
parameter, the json has the file name as the main key, instead of the
string "file". Adjust the test cases accordingly.

Fixes:
tests.core.test_hardening.TestFortifyConserv
tests.core.test_hardening.TestFortifyNone
tests.core.test_hardening.TestRelro
tests.core.test_hardening.TestRelroPartial
tests.core.test_hardening.TestSspNone
tests.core.test_hardening.TestSspStrong

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/core/test_hardening.py | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index 82e0f3d8f2..4d19b9f96d 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -26,7 +26,8 @@ class TestHardeningBase(infra.basetest.BRTest):
 
     def checksec_run(self, target_file):
         filepath = os.path.join(self.builddir, "target", target_file)
-        cmd = ["host/bin/checksec", "--output", "json", "--file", filepath]
+        cmd = ["host/bin/checksec", "--format=json",
+               "--file={}".format(filepath)]
         # Checksec is being used for elf file analysis only.  There are no
         # assumptions of target/run-time checks as part of this testing.
         ret = subprocess.check_output(cmd,
@@ -45,8 +46,9 @@ class TestRelro(TestHardeningBase):
     def test_run(self):
         for f in self.checksec_files:
             out = self.checksec_run(f)
-            self.assertEqual(out["file"]["relro"], "full")
-            self.assertEqual(out["file"]["pie"], "yes")
+            filepath = os.path.join(self.builddir, "target", f)
+            self.assertEqual(out[filepath]["relro"], "full")
+            self.assertEqual(out[filepath]["pie"], "yes")
 
 
 class TestRelroPartial(TestHardeningBase):
@@ -58,8 +60,9 @@ class TestRelroPartial(TestHardeningBase):
     def test_run(self):
         for f in self.checksec_files:
             out = self.checksec_run(f)
-            self.assertEqual(out["file"]["relro"], "partial")
-            self.assertEqual(out["file"]["pie"], "no")
+            filepath = os.path.join(self.builddir, "target", f)
+            self.assertEqual(out[filepath]["relro"], "partial")
+            self.assertEqual(out[filepath]["pie"], "no")
 
 
 class TestSspNone(TestHardeningBase):
@@ -71,7 +74,8 @@ class TestSspNone(TestHardeningBase):
     def test_run(self):
         for f in self.checksec_files:
             out = self.checksec_run(f)
-            self.assertEqual(out["file"]["canary"], "no")
+            filepath = os.path.join(self.builddir, "target", f)
+            self.assertEqual(out[filepath]["canary"], "no")
 
 
 class TestSspStrong(TestHardeningBase):
@@ -83,7 +87,8 @@ class TestSspStrong(TestHardeningBase):
     def test_run(self):
         for f in self.checksec_files:
             out = self.checksec_run(f)
-            self.assertEqual(out["file"]["canary"], "yes")
+            filepath = os.path.join(self.builddir, "target", f)
+            self.assertEqual(out[filepath]["canary"], "yes")
 
 
 class TestFortifyNone(TestHardeningBase):
@@ -95,7 +100,8 @@ class TestFortifyNone(TestHardeningBase):
     def test_run(self):
         for f in self.checksec_files:
             out = self.checksec_run(f)
-            self.assertEqual(out["file"]["fortified"], "0")
+            filepath = os.path.join(self.builddir, "target", f)
+            self.assertEqual(out[filepath]["fortified"], "0")
 
 
 class TestFortifyConserv(TestHardeningBase):
@@ -107,4 +113,5 @@ class TestFortifyConserv(TestHardeningBase):
     def test_run(self):
         for f in self.checksec_files:
             out = self.checksec_run(f)
-            self.assertNotEqual(out["file"]["fortified"], "0")
+            filepath = os.path.join(self.builddir, "target", f)
+            self.assertNotEqual(out[filepath]["fortified"], "0")
