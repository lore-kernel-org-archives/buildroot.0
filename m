From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 30 Apr 2020 00:42:25 +0200
Subject: [Buildroot] [PATCH 4/4] support/testing: add pytest test
In-Reply-To: <20200429224225.2454330-1-m.niestroj@grinn-global.com>
References: <20200429224225.2454330-1-m.niestroj@grinn-global.com>
Message-ID: <20200429224225.2454330-5-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  2 ++
 .../tests/package/sample_python_pytest.py     | 25 +++++++++++++++++++
 .../tests/package/test_python_pytest.py       | 19 ++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pytest.py
 create mode 100644 support/testing/tests/package/test_python_pytest.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fa8e077a07..12930dd849 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -497,6 +497,7 @@ tests.package.test_python_pexpect.TestPythonPy2Pexpect: { extends: .runtime_test
 tests.package.test_python_pexpect.TestPythonPy3Pexpect: { extends: .runtime_test }
 tests.package.test_python_pynacl.TestPythonPy2Pynacl: { extends: .runtime_test }
 tests.package.test_python_pynacl.TestPythonPy3Pynacl: { extends: .runtime_test }
+tests.package.test_python_pytest.TestPythonPy3Pytest: { extends: .runtime_test }
 tests.package.test_python_pyyaml.TestPythonPy2Pyyaml: { extends: .runtime_test }
 tests.package.test_python_pyyaml.TestPythonPy3Pyyaml: { extends: .runtime_test }
 tests.package.test_python_service_identity.TestPythonPy2ServiceIdentity: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 2e14053559..5175798e76 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1603,7 +1603,9 @@ F:	package/python-pluggy/
 F:	package/python-pytest/
 F:	package/rs485conf/
 F:	package/turbolua/
+F:	support/testing/tests/package/sample_python_pytest.py
 F:	support/testing/tests/package/test_netdata.py
+F:	support/testing/tests/package/test_python_pytest.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
 F:	package/libostree/
diff --git a/support/testing/tests/package/sample_python_pytest.py b/support/testing/tests/package/sample_python_pytest.py
new file mode 100644
index 0000000000..870cc8512b
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pytest.py
@@ -0,0 +1,25 @@
+import pytest
+
+
+x = 1
+
+
+ at pytest.fixture()
+def f1():
+    global x
+    x = 2
+    yield 15
+    x = 3
+
+
+def test_1():
+    assert x == 1
+
+
+def test_2(f1):
+    assert x == 2
+    assert f1 == 15
+
+
+def test_3():
+    assert x == 3
diff --git a/support/testing/tests/package/test_python_pytest.py b/support/testing/tests/package/test_python_pytest.py
new file mode 100644
index 0000000000..7fa7e44018
--- /dev/null
+++ b/support/testing/tests/package/test_python_pytest.py
@@ -0,0 +1,19 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Pytest(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYTEST=y
+        """
+    sample_scripts = ["tests/package/sample_python_pytest.py"]
+
+    def run_sample_scripts(self):
+        for script in self.sample_scripts:
+            cmd = self.interpreter + " -m pytest " + os.path.basename(script)
+            _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+            self.assertEqual(exit_code, 0)
-- 
2.26.2
