From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 17:17:29 +0200
Subject: [Buildroot] [git commit] support/testing: test check-package
 ignores external.mk
Message-ID: <20190803152016.C089A83902@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ad5e0a6a6c8c82c116352abf420ea14074177e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Check external.mk is ignored only when in the root path of a
br2-external.

Add a file called external.mk as a fixture to be used by the test case.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
[Arnout: wrap at 80 columns]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../testing/tests/utils/br2-external/external.mk   |  2 ++
 .../br2-external/package/external/external.mk      |  1 +
 support/testing/tests/utils/test_check_package.py  | 30 +++++++++++++++++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/utils/br2-external/external.mk b/support/testing/tests/utils/br2-external/external.mk
index e69de29bb2..470c01a382 100644
--- a/support/testing/tests/utils/br2-external/external.mk
+++ b/support/testing/tests/utils/br2-external/external.mk
@@ -0,0 +1,2 @@
+custom-target:
+	@echo "do nothing"
diff --git a/support/testing/tests/utils/br2-external/package/external/external.mk b/support/testing/tests/utils/br2-external/package/external/external.mk
new file mode 100644
index 0000000000..74fb6540ab
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/package/external/external.mk
@@ -0,0 +1 @@
+# wrong
diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index 009d9f3f38..17c2fcf3bc 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -32,7 +32,8 @@ class TestCheckPackage(unittest.TestCase):
     When in in-tree mode (without -b) some in-tree files and also all
     out-of-tree files are ignored.
 
-    When in out-tree mode (with -b) the script does generate warnings for these.
+    When in out-tree mode (with -b) the script does generate warnings for these
+    but ignores external.mk.
     """
 
     WITH_EMPTY_PATH = {}
@@ -172,3 +173,30 @@ class TestCheckPackage(unittest.TestCase):
         self.assert_file_was_processed(m)
         self.assert_warnings_generated_for_file(m)
         self.assertIn("{}:1: empty line at end of file".format(abs_file), w)
+
+        # external.mk is ignored only when in the root path of a br2-external
+        rel_file = "external.mk"
+        abs_file = os.path.join(abs_path, rel_file)
+
+        _, m = call_script(["check-package", "-b", rel_file],
+                           self.WITH_UTILS_IN_PATH, abs_path)
+        self.assert_file_was_ignored(m)
+
+        _, m = call_script(["check-package", "-b", abs_file],
+                           self.WITH_UTILS_IN_PATH, infra.basepath())
+        self.assert_file_was_ignored(m)
+
+        abs_path = infra.filepath("tests/utils/br2-external/package/external")
+        abs_file = os.path.join(abs_path, rel_file)
+
+        w, m = call_script(["check-package", "-b", rel_file],
+                           self.WITH_UTILS_IN_PATH, abs_path)
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(rel_file), w)
+
+        w, m = call_script(["check-package", "-b", abs_file],
+                           self.WITH_UTILS_IN_PATH, infra.basepath())
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(abs_file), w)
