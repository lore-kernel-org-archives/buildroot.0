From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 17:27:23 +0200
Subject: [Buildroot] [git commit] support/testing: add python-incremental
 tests
Message-ID: <20181011152735.04E7881470@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35bcb54e1d571967df3e3c1d7c11cb2a480aaafb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case that imports the module and asserts a version
string for a fake package is generated.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../tests/package/test_python_incremental.py       | 34 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fcbb066cf6..ab3493686d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -303,6 +303,8 @@ tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
+tests.package.test_python_incremental.TestPythonPy2Incremental: *runtime_test
+tests.package.test_python_incremental.TestPythonPy3Incremental: *runtime_test
 tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
 tests.package.test_python_txaio.TestPythonPy3Txaio: *runtime_test
 tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: *runtime_test
diff --git a/support/testing/tests/package/test_python_incremental.py b/support/testing/tests/package/test_python_incremental.py
new file mode 100644
index 0000000000..acf743cdd2
--- /dev/null
+++ b/support/testing/tests/package/test_python_incremental.py
@@ -0,0 +1,34 @@
+from tests.package.test_python import TestPythonBase
+
+
+class TestPythonIncremental(TestPythonBase):
+    def str_test(self):
+        cmd = self.interpreter + " -c 'import incremental;"
+        cmd += "v = incremental.Version(\"package\", 1, 2, 3, release_candidate=4);"
+        cmd += "assert(str(v) == \"[package, version 1.2.3rc4]\")'"
+        _, exit_code = self.emulator.run(cmd, timeout=30)
+        self.assertEqual(exit_code, 0)
+
+
+class TestPythonPy2Incremental(TestPythonIncremental):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_INCREMENTAL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.str_test()
+
+
+class TestPythonPy3Incremental(TestPythonIncremental):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_INCREMENTAL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.str_test()
