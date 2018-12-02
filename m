From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] support/testing: use TestPythonPackageBase
 for python-twisted
Message-ID: <20181202071554.EA42B8107F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f98e58caccef50612df83604397b3537af57526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the test script to be run on the target from inline in the test
case to a separate file.

Get the base defconfig fragment from the immediate parent class and not
directly from TestPythonBase because it is the correct way of doing
this. This way the base class TestPythonTwisted could even be placed in
a separate file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../testing/tests/package/sample_python_twisted.py |  9 ++++++
 .../testing/tests/package/test_python_twisted.py   | 35 +++++++---------------
 2 files changed, 19 insertions(+), 25 deletions(-)

diff --git a/support/testing/tests/package/sample_python_twisted.py b/support/testing/tests/package/sample_python_twisted.py
new file mode 100644
index 0000000000..47d6c5debc
--- /dev/null
+++ b/support/testing/tests/package/sample_python_twisted.py
@@ -0,0 +1,9 @@
+from twisted.internet import protocol, reactor, endpoints
+
+
+class F(protocol.Factory):
+    pass
+
+
+endpoints.serverFromString(reactor, "tcp:1234").listen(F())
+reactor.run()
diff --git a/support/testing/tests/package/test_python_twisted.py b/support/testing/tests/package/test_python_twisted.py
index ccee07d61d..a458ee45dd 100644
--- a/support/testing/tests/package/test_python_twisted.py
+++ b/support/testing/tests/package/test_python_twisted.py
@@ -1,25 +1,16 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonPackageBase
 
-TEST_SCRIPT = """
-from twisted.internet import protocol, reactor, endpoints
-class F(protocol.Factory):
-    pass
-endpoints.serverFromString(reactor, "tcp:1234").listen(F())
-reactor.run()
-"""
 
+class TestPythonTwisted(TestPythonPackageBase):
+    config = TestPythonPackageBase.config
+    sample_scripts = ["tests/package/sample_python_twisted.py"]
 
-class TestPythonTwisted(TestPythonBase):
-    def import_test(self):
-        cmd = "printf '{}' > test.py".format(TEST_SCRIPT)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-
+    def run_sample_scripts(self):
         cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 1)
 
-        cmd = self.interpreter + " test.py &"
+        cmd = self.interpreter + " sample_python_twisted.py &"
         # give some time to setup the server
         cmd += "sleep 30"
         _, exit_code = self.emulator.run(cmd, timeout=35)
@@ -31,24 +22,18 @@ class TestPythonTwisted(TestPythonBase):
 
 
 class TestPythonPy2Twisted(TestPythonTwisted):
-    config = TestPythonBase.config + \
+    __test__ = True
+    config = TestPythonTwisted.config + \
         """
         BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_TWISTED=y
         """
 
-    def test_run(self):
-        self.login()
-        self.import_test()
-
 
 class TestPythonPy3Twisted(TestPythonTwisted):
-    config = TestPythonBase.config + \
+    __test__ = True
+    config = TestPythonTwisted.config + \
         """
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_TWISTED=y
         """
-
-    def test_run(self):
-        self.login()
-        self.import_test()
