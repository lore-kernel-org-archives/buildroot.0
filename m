From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Nov 2018 00:16:06 -0200
Subject: [Buildroot] [PATCH v3 5/8] support/testing: use
 TestPythonPackageBase for python-twisted
In-Reply-To: <20181110021609.14684-1-ricardo.martincoski@gmail.com>
References: <20181110021609.14684-1-ricardo.martincoski@gmail.com>
Message-ID: <20181110021609.14684-6-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v2 -> v3:
  - refresh;
  - get the config from immediate parent class;

Changes v1 -> v2:
  - refresh after creating TestPythonPackageBase;
  - override run_sample_scripts instead of test_run;
---
 .../tests/package/sample_python_twisted.py    |  9 +++++
 .../tests/package/test_python_twisted.py      | 35 ++++++-------------
 2 files changed, 19 insertions(+), 25 deletions(-)
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
-- 
2.17.1
