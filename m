From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 17:27:04 +0200
Subject: [Buildroot] [git commit] support/testing: add python-autobahn tests
Message-ID: <20181011152734.E1EDB81470@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e020709140d3d2df3ddd45acba9815a7f321c93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case that imports the module.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../testing/tests/package/test_python_autobahn.py  | 32 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)

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
