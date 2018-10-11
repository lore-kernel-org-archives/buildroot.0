From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 17:28:06 +0200
Subject: [Buildroot] [git commit] support/testing: add python-twisted tests
Message-ID: <20181011152735.0BFC382AB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10095908701ce291578f4b1c9359ba6f8b381449
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a minimal script to listen to a port and check using netstat.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: increase the delay after starting the Twisted server, as 5
seconds was not enough for Python 3.x configurations.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 +
 .../testing/tests/package/test_python_twisted.py   | 54 ++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ab3493686d..4b8fee5f23 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -305,6 +305,8 @@ tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
 tests.package.test_python_incremental.TestPythonPy2Incremental: *runtime_test
 tests.package.test_python_incremental.TestPythonPy3Incremental: *runtime_test
+tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
+tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
 tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
 tests.package.test_python_txaio.TestPythonPy3Txaio: *runtime_test
 tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: *runtime_test
diff --git a/support/testing/tests/package/test_python_twisted.py b/support/testing/tests/package/test_python_twisted.py
new file mode 100644
index 0000000000..ccee07d61d
--- /dev/null
+++ b/support/testing/tests/package/test_python_twisted.py
@@ -0,0 +1,54 @@
+from tests.package.test_python import TestPythonBase
+
+TEST_SCRIPT = """
+from twisted.internet import protocol, reactor, endpoints
+class F(protocol.Factory):
+    pass
+endpoints.serverFromString(reactor, "tcp:1234").listen(F())
+reactor.run()
+"""
+
+
+class TestPythonTwisted(TestPythonBase):
+    def import_test(self):
+        cmd = "printf '{}' > test.py".format(TEST_SCRIPT)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 1)
+
+        cmd = self.interpreter + " test.py &"
+        # give some time to setup the server
+        cmd += "sleep 30"
+        _, exit_code = self.emulator.run(cmd, timeout=35)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+
+class TestPythonPy2Twisted(TestPythonTwisted):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_TWISTED=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.import_test()
+
+
+class TestPythonPy3Twisted(TestPythonTwisted):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_TWISTED=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.import_test()
