From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:46:41 +0200
Subject: [Buildroot] [git commit] support/testing: add pytest test
Message-ID: <20200906123833.CCCDB8104D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd89fcf9441701f0dbd2537a4be623c667c13ddb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 ++
 .../testing/tests/package/sample_python_pytest.py  | 25 ++++++++++++++++++++++
 .../testing/tests/package/test_python_pytest.py    | 19 ++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c85dd355d4..d7efc87ea4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1631,7 +1631,9 @@ F:	package/python-pluggy/
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
