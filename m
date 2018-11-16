From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 16 Nov 2018 01:57:26 -0200
Subject: [Buildroot] [next 06/15] support/testing: add python-click tests
In-Reply-To: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
References: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
Message-ID: <20181116035735.31507-7-ricardo.martincoski@gmail.com>
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
 .../tests/package/sample_python_click.py      | 12 +++++
 .../tests/package/test_python_click.py        | 44 +++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_click.py
 create mode 100644 support/testing/tests/package/test_python_click.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d6f2e6595f..eb6a187615 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -328,6 +328,8 @@ tests.package.test_python_bitstring.TestPythonPy2Bitstring: *runtime_test
 tests.package.test_python_bitstring.TestPythonPy3Bitstring: *runtime_test
 tests.package.test_python_cbor.TestPythonPy2Cbor: *runtime_test
 tests.package.test_python_cbor.TestPythonPy3Cbor: *runtime_test
+tests.package.test_python_click.TestPythonPy2Click: *runtime_test
+tests.package.test_python_click.TestPythonPy3Click: *runtime_test
 tests.package.test_python_crossbar.TestPythonPy3Crossbar: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
diff --git a/support/testing/tests/package/sample_python_click.py b/support/testing/tests/package/sample_python_click.py
new file mode 100644
index 0000000000..759868d087
--- /dev/null
+++ b/support/testing/tests/package/sample_python_click.py
@@ -0,0 +1,12 @@
+import click
+
+
+ at click.command()
+ at click.argument("foo")
+ at click.option("--bar", is_flag=True, help="help for bar")
+def main(foo, bar):
+    click.echo("{}, {}".format(foo, bar))
+
+
+if __name__ == '__main__':
+    main()
diff --git a/support/testing/tests/package/test_python_click.py b/support/testing/tests/package/test_python_click.py
new file mode 100644
index 0000000000..db57d3aa9f
--- /dev/null
+++ b/support/testing/tests/package/test_python_click.py
@@ -0,0 +1,44 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonClick(TestPythonPackageBase):
+    sample_scripts = ["tests/package/sample_python_click.py"]
+
+    def run_sample_scripts(self):
+        cmd = self.interpreter + " sample_python_click.py --help"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertIn("Usage:", output[0])
+        self.assertEqual(exit_code, 0)
+
+        cmd = self.interpreter + " sample_python_click.py 123"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(output[0], "123, False")
+        self.assertEqual(exit_code, 0)
+
+        cmd = self.interpreter + " sample_python_click.py --bar 456"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(output[0], "456, True")
+        self.assertEqual(exit_code, 0)
+
+        cmd = self.interpreter + " sample_python_click.py"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertIn("Usage:", output[0])
+        self.assertEqual(exit_code, 2)
+
+
+class TestPythonPy2Click(TestPythonClick):
+    __test__ = True
+    config = TestPythonClick.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_CLICK=y
+        """
+
+
+class TestPythonPy3Click(TestPythonClick):
+    __test__ = True
+    config = TestPythonClick.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CLICK=y
+        """
-- 
2.17.1
