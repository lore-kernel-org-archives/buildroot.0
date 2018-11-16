From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 16 Nov 2018 01:57:34 -0200
Subject: [Buildroot] [next 14/15] support/testing: add python-treq tests
In-Reply-To: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
References: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
Message-ID: <20181116035735.31507-15-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a simple script to check the basic usage. The target has no https
server, so a connection from in the target to localhost must not
succeed.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .gitlab-ci.yml                                |  2 ++
 .../tests/package/sample_python_treq.py       | 16 ++++++++++
 .../testing/tests/package/test_python_treq.py | 29 +++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_treq.py
 create mode 100644 support/testing/tests/package/test_python_treq.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 743f4edc06..61a6997178 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -348,6 +348,8 @@ tests.package.test_python_pyyaml.TestPythonPy3Pyyaml: *runtime_test
 tests.package.test_python_service_identity.TestPythonPy2ServiceIdentity: *runtime_test
 tests.package.test_python_service_identity.TestPythonPy3ServiceIdentity: *runtime_test
 tests.package.test_python_subprocess32.TestPythonPy2Subprocess32: *runtime_test
+tests.package.test_python_treq.TestPythonPy2Treq: *runtime_test
+tests.package.test_python_treq.TestPythonPy3Treq: *runtime_test
 tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
 tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
 tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
diff --git a/support/testing/tests/package/sample_python_treq.py b/support/testing/tests/package/sample_python_treq.py
new file mode 100644
index 0000000000..974fdcd8e1
--- /dev/null
+++ b/support/testing/tests/package/sample_python_treq.py
@@ -0,0 +1,16 @@
+from twisted.internet import reactor
+import treq
+
+
+def done(response):
+    print(response.code)
+    reactor.stop()
+
+
+def err(fail):
+    print(fail.value)
+    reactor.stop()
+
+
+treq.get("https://localhost").addCallback(done).addErrback(err)
+reactor.run()
diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
new file mode 100644
index 0000000000..7108b95696
--- /dev/null
+++ b/support/testing/tests/package/test_python_treq.py
@@ -0,0 +1,29 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonTreq(TestPythonPackageBase):
+    sample_scripts = ["tests/package/sample_python_treq.py"]
+
+    def run_sample_scripts(self):
+        cmd = self.interpreter + " sample_python_treq.py"
+        output, exit_code = self.emulator.run(cmd, timeout=20)
+        self.assertIn("Connection refused", output[0])
+        self.assertEqual(exit_code, 0)
+
+
+class TestPythonPy2Treq(TestPythonTreq):
+    __test__ = True
+    config = TestPythonTreq.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_TREQ=y
+        """
+
+
+class TestPythonPy3Treq(TestPythonTreq):
+    __test__ = True
+    config = TestPythonTreq.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_TREQ=y
+        """
-- 
2.17.1
