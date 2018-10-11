From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 17:27:15 +0200
Subject: [Buildroot] [git commit] support/testing: add python-txtorcon tests
Message-ID: <20181011152734.F0CFB82B92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddc0ebdb7cc9f55351002f836360cb2ec8b429d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case that imports the module.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../testing/tests/package/test_python_txtorcon.py  | 32 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)

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
