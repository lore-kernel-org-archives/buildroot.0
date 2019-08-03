From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 17:17:29 +0200
Subject: [Buildroot] [git commit] support/testing: add test for check-package
Message-ID: <20190803152016.AE74183902@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4323fbaf8d203da5782d042d6f2fd399300ca03a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Check the basic usage for check-package.

It can be called using either absolute path, relative path or from PATH.
Files to be checked can be passed with either absolute path or relative
path (also including files in the current directory).

Also check it ignores some special files when checking intree files,
i.e. package/pkg-generic.mk, while still generating warnings for out-of-tree
files when called with -b.
In order to allow the later, add an empty line to the Config.in in the
br2-external being tested so the script does generate a warning.

Catches bug #11271.

More tests can be added later, for example compatibility to Python 3.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
[Arnout: wrap at 80 columns where appropriate; merge into a single
class.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml                                     |   1 +
 support/testing/tests/utils/__init__.py            |   0
 support/testing/tests/utils/br2-external/Config.in |   1 +
 .../testing/tests/utils/br2-external/external.desc |   1 +
 .../testing/tests/utils/br2-external/external.mk   |   0
 support/testing/tests/utils/test_check_package.py  | 174 +++++++++++++++++++++
 6 files changed, 177 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3f2284d15f..fff9d99237 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -475,3 +475,4 @@ tests.toolchain.test_external.TestExternalToolchainLinaroArm: { extends: .runtim
 tests.toolchain.test_external.TestExternalToolchainSourceryArmv4: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainSourceryArmv5: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainSourceryArmv7: { extends: .runtime_test }
+tests.utils.test_check_package.TestCheckPackageBasicUsage: { extends: .runtime_test }
diff --git a/support/testing/tests/utils/__init__.py b/support/testing/tests/utils/__init__.py
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/utils/br2-external/Config.in b/support/testing/tests/utils/br2-external/Config.in
new file mode 100644
index 0000000000..8b13789179
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/Config.in
@@ -0,0 +1 @@
+
diff --git a/support/testing/tests/utils/br2-external/external.desc b/support/testing/tests/utils/br2-external/external.desc
new file mode 100644
index 0000000000..e89c3560ab
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/external.desc
@@ -0,0 +1 @@
+name: CHECK_PACKAGE
diff --git a/support/testing/tests/utils/br2-external/external.mk b/support/testing/tests/utils/br2-external/external.mk
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
new file mode 100644
index 0000000000..009d9f3f38
--- /dev/null
+++ b/support/testing/tests/utils/test_check_package.py
@@ -0,0 +1,174 @@
+"""Test cases for utils/check-package.
+
+It does not inherit from infra.basetest.BRTest and therefore does not generate
+a logfile. Only when the tests fail there will be output to the console.
+
+The make target ('make check-package') is already used by the job
+'check-package' and won't be tested here.
+"""
+import os
+import subprocess
+import unittest
+
+import infra
+
+
+def call_script(args, env, cwd):
+    """Call a script and return stdout and stderr as lists."""
+    out, err = subprocess.Popen(args, cwd=cwd, stdout=subprocess.PIPE,
+                                stderr=subprocess.PIPE, env=env).communicate()
+    return out.splitlines(), err.splitlines()
+
+
+class TestCheckPackage(unittest.TestCase):
+    """Test the various ways the script can be called.
+
+    The script can be called either using relative path, absolute path or from
+    PATH.
+
+    The files to be checked can be passed as arguments using either relative
+    path or absolute path.
+
+    When in in-tree mode (without -b) some in-tree files and also all
+    out-of-tree files are ignored.
+
+    When in out-tree mode (with -b) the script does generate warnings for these.
+    """
+
+    WITH_EMPTY_PATH = {}
+    WITH_UTILS_IN_PATH = {"PATH": infra.basepath("utils") + ":" + os.environ["PATH"]}
+    relative = [
+        # base_script           base_file               rel_script               rel_file                rel_cwd
+        ["utils/check-package", "package/atop/atop.mk", "./utils/check-package", "package/atop/atop.mk", ""],
+        ["utils/check-package", "package/atop/atop.mk", "./utils/check-package", "./package/atop/atop.mk", ""],
+        ["utils/check-package", "package/atop/atop.mk", "../../utils/check-package", "atop.mk", "package/atop"],
+        ["utils/check-package", "package/atop/atop.mk", "../../utils/check-package", "./atop.mk", "package/atop"],
+        ["utils/check-package", "package/atop/atop.mk", "../utils/check-package", "atop/atop.mk", "package"],
+        ["utils/check-package", "package/atop/atop.mk", "../utils/check-package", "./atop/atop.mk", "package"],
+        ["utils/check-package", "package/atop/Config.in", "./utils/check-package", "package/atop/Config.in", ""],
+        ["utils/check-package", "package/atop/Config.in", "./utils/check-package", "./package/atop/Config.in", ""],
+        ["utils/check-package", "package/atop/Config.in", "../../utils/check-package", "Config.in", "package/atop"],
+        ["utils/check-package", "package/atop/Config.in", "../../utils/check-package", "./Config.in", "package/atop"],
+        ["utils/check-package", "package/atop/Config.in", "../utils/check-package", "atop/Config.in", "package"],
+        ["utils/check-package", "package/atop/Config.in", "../utils/check-package", "./atop/Config.in", "package"]]
+
+    def assert_file_was_processed(self, stderr):
+        """Infer from check-package stderr if at least one file was processed
+        and fail otherwise."""
+        self.assertIn("lines processed", stderr[0], stderr)
+        processed = int(stderr[0].split()[0])
+        self.assertGreater(processed, 0)
+
+    def assert_file_was_ignored(self, stderr):
+        """Infer from check-package stderr if no file was processed and fail
+        otherwise."""
+        self.assertIn("lines processed", stderr[0], stderr)
+        processed = int(stderr[0].split()[0])
+        self.assertEqual(processed, 0)
+
+    def assert_warnings_generated_for_file(self, stderr):
+        """Infer from check-package stderr if at least one warning was generated
+        and fail otherwise."""
+        self.assertIn("warnings generated", stderr[1], stderr)
+        generated = int(stderr[1].split()[0])
+        self.assertGreater(generated, 0)
+
+    def test_run(self):
+        """Test the various ways the script can be called in a simple top to
+        bottom sequence."""
+        # an intree file can be checked by the script called from relative path,
+        # absolute path and from PATH
+        for base_script, base_file, rel_script, rel_file, rel_cwd in self.relative:
+            abs_script = infra.basepath(base_script)
+            abs_file = infra.basepath(base_file)
+            cwd = infra.basepath(rel_cwd)
+
+            _, m = call_script([rel_script, rel_file],
+                               self.WITH_EMPTY_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+            _, m = call_script([abs_script, rel_file],
+                               self.WITH_EMPTY_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+            _, m = call_script(["check-package", rel_file],
+                               self.WITH_UTILS_IN_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+            _, m = call_script([rel_script, abs_file],
+                               self.WITH_EMPTY_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+            _, m = call_script([abs_script, abs_file],
+                               self.WITH_EMPTY_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+            _, m = call_script(["check-package", abs_file],
+                               self.WITH_UTILS_IN_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+        # some intree files are ignored
+        _, m = call_script(["./utils/check-package", "package/pkg-generic.mk"],
+                           self.WITH_EMPTY_PATH, infra.basepath())
+        self.assert_file_was_ignored(m)
+
+        _, m = call_script(["./utils/check-package", "-b", "package/pkg-generic.mk"],
+                           self.WITH_EMPTY_PATH, infra.basepath())
+        self.assert_file_was_processed(m)
+
+        # an out-of-tree file can be checked by the script called from relative
+        # path, absolute path and from PATH
+        for base_script, base_file, rel_script, rel_file, rel_cwd in self.relative:
+            abs_script = infra.basepath(base_script)
+            abs_file = infra.basepath(base_file)
+            cwd = infra.basepath(rel_cwd)
+
+            _, m = call_script([rel_script, "-b", rel_file],
+                               self.WITH_EMPTY_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+            _, m = call_script([abs_script, "-b", rel_file],
+                               self.WITH_EMPTY_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+            _, m = call_script(["check-package", "-b", rel_file],
+                               self.WITH_UTILS_IN_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+            _, m = call_script([rel_script, "-b", abs_file],
+                               self.WITH_EMPTY_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+            _, m = call_script([abs_script, "-b", abs_file],
+                               self.WITH_EMPTY_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+            _, m = call_script(["check-package", "-b", abs_file],
+                               self.WITH_UTILS_IN_PATH, cwd)
+            self.assert_file_was_processed(m)
+
+        # out-of-tree files are are ignored without -b but can generate warnings
+        # with -b
+        abs_path = infra.filepath("tests/utils/br2-external")
+        rel_file = "Config.in"
+        abs_file = os.path.join(abs_path, rel_file)
+
+        _, m = call_script(["check-package", rel_file],
+                           self.WITH_UTILS_IN_PATH, abs_path)
+        self.assert_file_was_ignored(m)
+
+        _, m = call_script(["check-package", abs_file],
+                           self.WITH_UTILS_IN_PATH, infra.basepath())
+        self.assert_file_was_ignored(m)
+
+        w, m = call_script(["check-package", "-b", rel_file],
+                           self.WITH_UTILS_IN_PATH, abs_path)
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:1: empty line at end of file".format(rel_file), w)
+
+        w, m = call_script(["check-package", "-b", abs_file],
+                           self.WITH_UTILS_IN_PATH, infra.basepath())
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:1: empty line at end of file".format(abs_file), w)
