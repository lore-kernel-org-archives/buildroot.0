From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:05:46 +0100
Subject: [Buildroot] [git commit] support/testing: add python-ubjson tests
Message-ID: <20181202071558.36E0282855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bac9a786469cc37299da2bc54af52349fa63919d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case to check the basic usage, storing a dict into a
file and then retrieving the dict from the file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../tests/package/sample_python_ubjson_dec.py      | 10 ++++++++++
 .../tests/package/sample_python_ubjson_enc.py      | 14 +++++++++++++
 .../testing/tests/package/test_python_ubjson.py    | 23 ++++++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 61a6997178..5a100884f6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -356,6 +356,8 @@ tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
 tests.package.test_python_txaio.TestPythonPy3Txaio: *runtime_test
 tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: *runtime_test
 tests.package.test_python_txtorcon.TestPythonPy3Txtorcon: *runtime_test
+tests.package.test_python_ubjson.TestPythonPy2Ubjson: *runtime_test
+tests.package.test_python_ubjson.TestPythonPy3Ubjson: *runtime_test
 tests.package.test_rust.TestRust: *runtime_test
 tests.package.test_rust.TestRustBin: *runtime_test
 tests.package.test_syslog_ng.TestSyslogNg: *runtime_test
diff --git a/support/testing/tests/package/sample_python_ubjson_dec.py b/support/testing/tests/package/sample_python_ubjson_dec.py
new file mode 100644
index 0000000000..12ccdfd587
--- /dev/null
+++ b/support/testing/tests/package/sample_python_ubjson_dec.py
@@ -0,0 +1,10 @@
+import ubjson
+
+with open("/tmp/data.json", "rb") as f:
+    serialized = f.read()
+data = ubjson.loadb(serialized)
+print(data)
+assert(data["name"] == "python-ubjson")
+assert(data["versions"] == ["1", "2"])
+assert(data["group"]["is_a_package"] is True)
+assert(data["group"]["value"] == 42)
diff --git a/support/testing/tests/package/sample_python_ubjson_enc.py b/support/testing/tests/package/sample_python_ubjson_enc.py
new file mode 100644
index 0000000000..9a2140ef85
--- /dev/null
+++ b/support/testing/tests/package/sample_python_ubjson_enc.py
@@ -0,0 +1,14 @@
+import ubjson
+
+data = {
+    "name": "python-ubjson",
+    "versions": ["1", "2"],
+    "group": {
+        "is_a_package": True,
+        "value": 42
+    }
+}
+serialized = ubjson.dumpb(data)
+print(serialized)
+with open("/tmp/data.json", "wb") as f:
+    f.write(serialized)
diff --git a/support/testing/tests/package/test_python_ubjson.py b/support/testing/tests/package/test_python_ubjson.py
new file mode 100644
index 0000000000..85c707e292
--- /dev/null
+++ b/support/testing/tests/package/test_python_ubjson.py
@@ -0,0 +1,23 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Ubjson(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_UBJSON=y
+        """
+    sample_scripts = ["tests/package/sample_python_ubjson_enc.py",
+                      "tests/package/sample_python_ubjson_dec.py"]
+
+
+class TestPythonPy3Ubjson(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_UBJSON=y
+        """
+    sample_scripts = ["tests/package/sample_python_ubjson_enc.py",
+                      "tests/package/sample_python_ubjson_dec.py"]
