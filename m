From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue,  1 Sep 2020 19:16:45 +0200
Subject: [Buildroot] [PATCH v2 4/4] support/testing: add pytest test
In-Reply-To: <20200901171645.708587-1-m.niestroj@grinn-global.com>
References: <20200901171645.708587-1-m.niestroj@grinn-global.com>
Message-ID: <20200901171645.708587-5-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
changes v1 -> v2:
 * remove .gitlab-ci.yml changes (not needed anymore)

 DEVELOPERS                                    |  2 ++
 .../tests/package/sample_python_pytest.py     | 25 +++++++++++++++++++
 .../tests/package/test_python_pytest.py       | 19 ++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pytest.py
 create mode 100644 support/testing/tests/package/test_python_pytest.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 928b259428..3ced195207 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1617,7 +1617,9 @@ F:	package/python-pluggy/
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
2.28.0
