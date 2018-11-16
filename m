From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 16 Nov 2018 01:57:21 -0200
Subject: [Buildroot] [next 01/15] support/testing: add python-argh tests
In-Reply-To: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
References: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
Message-ID: <20181116035735.31507-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a simple script to check the basic usage. Since this package
provides command line arguments, override run_sample_scripts to call the
script with arguments and check the expected output.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .gitlab-ci.yml                                |  2 +
 .../tests/package/sample_python_argh.py       | 10 +++++
 .../testing/tests/package/test_python_argh.py | 45 +++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_argh.py
 create mode 100644 support/testing/tests/package/test_python_argh.py

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
-- 
2.17.1
