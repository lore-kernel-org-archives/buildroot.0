From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:05:46 +0100
Subject: [Buildroot] [git commit] support/testing: add python-argh tests
Message-ID: <20181202071557.BD360815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bd9e9c199a334a035e9b4690135fdaf849b3d76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a simple script to check the basic usage. Since this package
provides command line arguments, override run_sample_scripts to call the
script with arguments and check the expected output.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 +
 .../testing/tests/package/sample_python_argh.py    | 10 +++++
 support/testing/tests/package/test_python_argh.py  | 45 ++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 98f9463928..62f3768d3d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -316,6 +316,8 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
+tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
+tests.package.test_python_argh.TestPythonPy3Argh: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
 tests.package.test_python_crossbar.TestPythonPy3Crossbar: *runtime_test
diff --git a/support/testing/tests/package/sample_python_argh.py b/support/testing/tests/package/sample_python_argh.py
new file mode 100644
index 0000000000..48247bf604
--- /dev/null
+++ b/support/testing/tests/package/sample_python_argh.py
@@ -0,0 +1,10 @@
+import argh
+
+
+ at argh.arg("foo", help="help for foo")
+ at argh.arg("--bar", help="help for bar")
+def main(foo, bar=False):
+    print("{}, {}".format(foo, bar))
+
+
+argh.dispatch_command(main)
diff --git a/support/testing/tests/package/test_python_argh.py b/support/testing/tests/package/test_python_argh.py
new file mode 100644
index 0000000000..de4b4cbe74
--- /dev/null
+++ b/support/testing/tests/package/test_python_argh.py
@@ -0,0 +1,45 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonArgh(TestPythonPackageBase):
+    config = TestPythonPackageBase.config
+    sample_scripts = ["tests/package/sample_python_argh.py"]
+
+    def run_sample_scripts(self):
+        cmd = self.interpreter + " sample_python_argh.py -h"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertIn("usage:", output[0])
+        self.assertEqual(exit_code, 0)
+
+        cmd = self.interpreter + " sample_python_argh.py 123"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(output[0], "123, False")
+        self.assertEqual(exit_code, 0)
+
+        cmd = self.interpreter + " sample_python_argh.py --bar 456"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(output[0], "456, True")
+        self.assertEqual(exit_code, 0)
+
+        cmd = self.interpreter + " sample_python_argh.py"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertIn("usage:", output[0])
+        self.assertEqual(exit_code, 2)
+
+
+class TestPythonPy2Argh(TestPythonArgh):
+    __test__ = True
+    config = TestPythonArgh.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_ARGH=y
+        """
+
+
+class TestPythonPy3Argh(TestPythonArgh):
+    __test__ = True
+    config = TestPythonArgh.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_ARGH=y
+        """
