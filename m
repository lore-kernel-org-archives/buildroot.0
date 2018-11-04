From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  4 Nov 2018 02:12:09 -0200
Subject: [Buildroot] [PATCH v2 5/5] support/testing: test check-package
 ignores external.mk
In-Reply-To: <20181104041209.23028-1-ricardo.martincoski@gmail.com>
References: <20181104041209.23028-1-ricardo.martincoski@gmail.com>
Message-ID: <20181104041209.23028-6-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Check external.mk is ignored only when in the root path of a
br2-external.

Add a file called external.mk as a fixture to be used by the test case.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Changes v1 -> v2:
  - update expectation after changing patch 1: when a warning is
    generated for a file from a br2-external and the file was specified
    in the arguments as a relative path, the relative path is used in
    the warning message
  - make the test stronger by cd'ing to br2-external/package/external
    before testing check-package against the newly added external.mk
---
 .../tests/utils/br2-external/external.mk      |  2 ++
 .../br2-external/package/external/external.mk |  1 +
 .../testing/tests/utils/test_check_package.py | 25 ++++++++++++++++++-
 3 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 support/testing/tests/utils/br2-external/package/external/external.mk

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
index 35c2adcf8a..75a3e3a41b 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -66,7 +66,7 @@ class TestCheckPackageBasicUsage(TestCheckPackage):
     The script can be called either using relative path, absolute path or from PATH.
     The files to be checked can be passed as arguments using either relative path or absolute path.
     When in in-tree mode (without -b) some in-tree files and also all out-of-tree files are ignored.
-    When in out-tree mode (with -b) the script does generate warnings.
+    When in out-tree mode (with -b) the script does generate warnings but ignores external.mk.
     """
 
     def test_run(self):
@@ -146,3 +146,26 @@ class TestCheckPackageBasicUsage(TestCheckPackage):
         self.assert_file_was_processed(m)
         self.assert_warnings_generated_for_file(m)
         self.assertIn("{}:1: empty line at end of file".format(abs_file), w)
+
+        # external.mk is ignored only when in the root path of a br2-external
+        rel_file = "external.mk"
+        abs_file = os.path.join(abs_path, rel_file)
+
+        _, m = call_script(["check-package", "-b", rel_file], self.WITH_UTILS_IN_PATH, abs_path)
+        self.assert_file_was_ignored(m)
+
+        _, m = call_script(["check-package", "-b", abs_file], self.WITH_UTILS_IN_PATH, infra.basepath())
+        self.assert_file_was_ignored(m)
+
+        abs_path = infra.filepath("tests/utils/br2-external/package/external")
+        abs_file = os.path.join(abs_path, rel_file)
+
+        w, m = call_script(["check-package", "-b", rel_file], self.WITH_UTILS_IN_PATH, abs_path)
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(rel_file), w)
+
+        w, m = call_script(["check-package", "-b", abs_file], self.WITH_UTILS_IN_PATH, infra.basepath())
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(abs_file), w)
-- 
2.17.1
