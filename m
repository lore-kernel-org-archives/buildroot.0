From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 17:27:12 +0200
Subject: [Buildroot] [git commit] support/testing: add python-txaio tests
Message-ID: <20181011152734.EFDEF82AB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f389f266910b27cbaf26fa384dbed8632ad7b981
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case that imports the module to use with twisted in
Python 2 and with asyncio in Python 3.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 support/testing/tests/package/test_python_txaio.py | 34 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 001ea43f72..609ea0cdb5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -303,6 +303,8 @@ tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
+tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
+tests.package.test_python_txaio.TestPythonPy3Txaio: *runtime_test
 tests.package.test_rust.TestRust: *runtime_test
 tests.package.test_rust.TestRustBin: *runtime_test
 tests.package.test_syslog_ng.TestSyslogNg: *runtime_test
diff --git a/support/testing/tests/package/test_python_txaio.py b/support/testing/tests/package/test_python_txaio.py
new file mode 100644
index 0000000000..af93e031b5
--- /dev/null
+++ b/support/testing/tests/package/test_python_txaio.py
@@ -0,0 +1,34 @@
+from tests.package.test_python import TestPythonBase
+
+
+class TestPythonPy2Txaio(TestPythonBase):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_TXAIO=y
+        BR2_PACKAGE_PYTHON_TWISTED=y
+        """
+
+    def test_run(self):
+        self.login()
+        cmd = self.interpreter + " -c 'import txaio;"
+        cmd += "txaio.use_twisted();"
+        cmd += "f0 = txaio.create_future()'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+
+class TestPythonPy3Txaio(TestPythonBase):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_TXAIO=y
+        """
+
+    def test_run(self):
+        self.login()
+        cmd = self.interpreter + " -c 'import txaio;"
+        cmd += "txaio.use_asyncio();"
+        cmd += "f0 = txaio.create_future()'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
