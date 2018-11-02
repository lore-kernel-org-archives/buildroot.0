From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:37 -0300
Subject: [Buildroot] [PATCH v2 08/12] support/testing: use
 TestPythonPackageBase for python-twisted
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-9-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the test script to be run on the target from inline in the test
case to a separate file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - refresh after creating TestPythonPackageBase;
  - override run_sample_scripts instead of test_run;
---
 .../tests/package/sample_python_twisted.py    |  9 ++++
 .../tests/package/test_python_twisted.py      | 42 +++++--------------
 2 files changed, 20 insertions(+), 31 deletions(-)
 create mode 100644 support/testing/tests/package/sample_python_twisted.py

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
index 74b32fbd62..fa83620e5e 100644
--- a/support/testing/tests/package/test_python_twisted.py
+++ b/support/testing/tests/package/test_python_twisted.py
@@ -1,25 +1,19 @@
-from tests.package.test_python import TestPythonBase, TestPythonBase2, TestPythonBase3
-
-TEST_SCRIPT = """
-from twisted.internet import protocol, reactor, endpoints
-class F(protocol.Factory):
-    pass
-endpoints.serverFromString(reactor, "tcp:1234").listen(F())
-reactor.run()
-"""
+from tests.package.test_python import TestPythonPackageBase, TestPythonBase2, TestPythonBase3
 
 
-class TestPythonTwisted(TestPythonBase):
-    def import_test(self):
-        cmd = "printf '{}' > test.py".format(TEST_SCRIPT)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+class TestPythonTwisted(TestPythonPackageBase):
+    config_package = \
+        """
+        BR2_PACKAGE_PYTHON_TWISTED=y
+        """
+    sample_scripts = ["tests/package/sample_python_twisted.py"]
 
+    def run_sample_scripts(self):
         cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 1)
 
-        cmd = self.interpreter + " test.py &"
+        cmd = self.interpreter + " sample_python_twisted.py &"
         # give some time to setup the server
         cmd += "sleep 30"
         _, exit_code = self.emulator.run(cmd, timeout=35)
@@ -31,22 +25,8 @@ class TestPythonTwisted(TestPythonBase):
 
 
 class TestPythonPy2Twisted(TestPythonTwisted, TestPythonBase2):
-    config = TestPythonBase2.config + \
-        """
-        BR2_PACKAGE_PYTHON_TWISTED=y
-        """
-
-    def test_run(self):
-        self.login()
-        self.import_test()
+    pass
 
 
 class TestPythonPy3Twisted(TestPythonTwisted, TestPythonBase3):
-    config = TestPythonBase3.config + \
-        """
-        BR2_PACKAGE_PYTHON_TWISTED=y
-        """
-
-    def test_run(self):
-        self.login()
-        self.import_test()
+    pass
-- 
2.17.1
