From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 25 Sep 2018 23:55:10 -0300
Subject: [Buildroot] [PATCH 1/5] support/testing: add python-autobahn tests
In-Reply-To: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
References: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
Message-ID: <20180926025514.2092-2-ricardo.martincoski@gmail.com>
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
 .gitlab-ci.yml                                |  2 ++
 .../tests/package/test_python_autobahn.py     | 32 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_autobahn.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b220d544f8..001ea43f72 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -299,6 +299,8 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
+tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
+tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
 tests.package.test_rust.TestRust: *runtime_test
diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
new file mode 100644
index 0000000000..2bc0f0cccf
--- /dev/null
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -0,0 +1,32 @@
+from tests.package.test_python import TestPythonBase
+
+
+class TestPythonAutobahn(TestPythonBase):
+    def import_test(self):
+        cmd = self.interpreter + " -c 'import autobahn.wamp'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+
+class TestPythonPy2Autobahn(TestPythonAutobahn):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_AUTOBAHN=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.import_test()
+
+
+class TestPythonPy3Autobahn(TestPythonAutobahn):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_AUTOBAHN=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.import_test()
-- 
2.17.1
