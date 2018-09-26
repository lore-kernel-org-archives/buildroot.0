From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 25 Sep 2018 23:55:12 -0300
Subject: [Buildroot] [PATCH 3/5] support/testing: add python-txtorcon tests
In-Reply-To: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
References: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
Message-ID: <20180926025514.2092-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a simple test case that imports the module.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
NOTICE that TestPythonPy3Txtorcon currently fails on master branch like this:

Cannot compile usr/lib/python3.7/site-packages/twisted/conch/manhole.py
Traceback (most recent call last):
  File "/builds/RicardoMartincoski/buildroot/test-output/TestPythonPy3Txtorcon/host/lib/python3.7/py_compile.py", line 136, in compile
    _optimize=optimize)
  File "<frozen importlib._bootstrap_external>", line 763, in source_to_code
  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
  File "usr/lib/python3.7/site-packages/twisted/conch/manhole.py", line 154
    def write(self, data, async=False):
                              ^
SyntaxError: invalid syntax
---
 .gitlab-ci.yml                                |  2 ++
 .../tests/package/test_python_txtorcon.py     | 32 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_txtorcon.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 609ea0cdb5..fcbb066cf6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -305,6 +305,8 @@ tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
 tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
 tests.package.test_python_txaio.TestPythonPy3Txaio: *runtime_test
+tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: *runtime_test
+tests.package.test_python_txtorcon.TestPythonPy3Txtorcon: *runtime_test
 tests.package.test_rust.TestRust: *runtime_test
 tests.package.test_rust.TestRustBin: *runtime_test
 tests.package.test_syslog_ng.TestSyslogNg: *runtime_test
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
new file mode 100644
index 0000000000..352ff67825
--- /dev/null
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -0,0 +1,32 @@
+from tests.package.test_python import TestPythonBase
+
+
+class TestPythonTxtorcon(TestPythonBase):
+    def import_test(self):
+        cmd = self.interpreter + " -c 'import txtorcon'"
+        _, exit_code = self.emulator.run(cmd, timeout=30)
+        self.assertEqual(exit_code, 0)
+
+
+class TestPythonPy2Txtorcon(TestPythonTxtorcon):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_TXTORCON=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.import_test()
+
+
+class TestPythonPy3Txtorcon(TestPythonTxtorcon):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_TXTORCON=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.import_test()
-- 
2.17.1
