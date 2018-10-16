From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 15 Oct 2018 21:42:28 -0300
Subject: [Buildroot] [PATCH 5/7] support/testing: use default test_run for
 python-twisted
In-Reply-To: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
References: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
Message-ID: <20181016004230.10393-6-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../tests/package/sample_python_twisted.py    |  9 ++++
 .../tests/package/test_python_twisted.py      | 45 ++++++-------------
 2 files changed, 23 insertions(+), 31 deletions(-)
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
index ccee07d61d..ce8587a5eb 100644
--- a/support/testing/tests/package/test_python_twisted.py
+++ b/support/testing/tests/package/test_python_twisted.py
@@ -1,25 +1,19 @@
-from tests.package.test_python import TestPythonBase
+import tests.package.test_python
 
-TEST_SCRIPT = """
-from twisted.internet import protocol, reactor, endpoints
-class F(protocol.Factory):
-    pass
-endpoints.serverFromString(reactor, "tcp:1234").listen(F())
-reactor.run()
-"""
 
+class TestPythonTwisted():
+    config_package = \
+        """
+        BR2_PACKAGE_PYTHON_TWISTED=y
+        """
+    sample_scripts = ["tests/package/sample_python_twisted.py"]
 
-class TestPythonTwisted(TestPythonBase):
     def import_test(self):
-        cmd = "printf '{}' > test.py".format(TEST_SCRIPT)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-
         cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 1)
 
-        cmd = self.interpreter + " test.py &"
+        cmd = self.interpreter + " sample_python_twisted.py &"
         # give some time to setup the server
         cmd += "sleep 30"
         _, exit_code = self.emulator.run(cmd, timeout=35)
@@ -29,26 +23,15 @@ class TestPythonTwisted(TestPythonBase):
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
-
-class TestPythonPy2Twisted(TestPythonTwisted):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_TWISTED=y
-        """
-
     def test_run(self):
         self.login()
+        self.check_sample_scripts_exist()
         self.import_test()
 
 
-class TestPythonPy3Twisted(TestPythonTwisted):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON3=y
-        BR2_PACKAGE_PYTHON_TWISTED=y
-        """
+class TestPythonPy2Twisted(TestPythonTwisted, tests.package.test_python.TestPython2):
+    pass
 
-    def test_run(self):
-        self.login()
-        self.import_test()
+
+class TestPythonPy3Twisted(TestPythonTwisted, tests.package.test_python.TestPython3):
+    pass
-- 
2.17.1
