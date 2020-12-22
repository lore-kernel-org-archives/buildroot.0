From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 22 Dec 2020 17:39:16 +0100
Subject: [Buildroot] [PATCH 2/2] support/testing: add pytest-asyncio test
In-Reply-To: <20201222163916.68061-1-m.niestroj@grinn-global.com>
References: <20201222163916.68061-1-m.niestroj@grinn-global.com>
Message-ID: <20201222163916.68061-2-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 DEVELOPERS                                    |  2 ++
 .../package/sample_python_pytest_asyncio.py   | 31 +++++++++++++++++++
 .../package/test_python_pytest_asyncio.py     | 20 ++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pytest_asyncio.py
 create mode 100644 support/testing/tests/package/test_python_pytest_asyncio.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f4eab97b47..707d314bad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1605,8 +1605,10 @@ F:	package/python-xmodem/
 F:	package/rs485conf/
 F:	package/turbolua/
 F:	support/testing/tests/package/sample_python_pytest.py
+F:	support/testing/tests/package/sample_python_pytest_asyncio.py
 F:	support/testing/tests/package/test_netdata.py
 F:	support/testing/tests/package/test_python_pytest.py
+F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
 F:	package/libostree/
diff --git a/support/testing/tests/package/sample_python_pytest_asyncio.py b/support/testing/tests/package/sample_python_pytest_asyncio.py
new file mode 100644
index 0000000000..cdb8cd9fb9
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pytest_asyncio.py
@@ -0,0 +1,31 @@
+import asyncio
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
+ at pytest.mark.asyncio
+async def test_1():
+    assert x == 1
+
+
+ at pytest.mark.asyncio
+async def test_2(f1):
+    assert x == 2
+    assert f1 == 15
+
+
+ at pytest.mark.asyncio
+async def test_3():
+    assert x == 3
+    await asyncio.sleep(0.1)
+    assert x == 3
diff --git a/support/testing/tests/package/test_python_pytest_asyncio.py b/support/testing/tests/package/test_python_pytest_asyncio.py
new file mode 100644
index 0000000000..caf034be7b
--- /dev/null
+++ b/support/testing/tests/package/test_python_pytest_asyncio.py
@@ -0,0 +1,20 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3PytestAsyncio(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYTEST=y
+        BR2_PACKAGE_PYTHON_PYTEST_ASYNCIO=y
+        """
+    sample_scripts = ["tests/package/sample_python_pytest_asyncio.py"]
+
+    def run_sample_scripts(self):
+        for script in self.sample_scripts:
+            cmd = self.interpreter + " -m pytest " + os.path.basename(script)
+            _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+            self.assertEqual(exit_code, 0)
-- 
2.29.2
