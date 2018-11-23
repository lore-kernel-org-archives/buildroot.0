From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:05:46 +0100
Subject: [Buildroot] [git commit] support/testing: add python-cbor tests
Message-ID: <20181202071557.DCEC1814B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61b4b81c44028910ebfe111b70454b8e193bf85b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case to check the basic usage, storing a dict into a
file and then retrieving the dict from the file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../tests/package/sample_python_cbor_dec.py        | 10 ++++++++++
 .../tests/package/sample_python_cbor_enc.py        | 14 +++++++++++++
 support/testing/tests/package/test_python_cbor.py  | 23 ++++++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2fc0fe7e6a..d6f2e6595f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -326,6 +326,8 @@ tests.package.test_python_automat.TestPythonPy2Automat: *runtime_test
 tests.package.test_python_automat.TestPythonPy3Automat: *runtime_test
 tests.package.test_python_bitstring.TestPythonPy2Bitstring: *runtime_test
 tests.package.test_python_bitstring.TestPythonPy3Bitstring: *runtime_test
+tests.package.test_python_cbor.TestPythonPy2Cbor: *runtime_test
+tests.package.test_python_cbor.TestPythonPy3Cbor: *runtime_test
 tests.package.test_python_crossbar.TestPythonPy3Crossbar: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
diff --git a/support/testing/tests/package/sample_python_cbor_dec.py b/support/testing/tests/package/sample_python_cbor_dec.py
new file mode 100644
index 0000000000..5ca5e3aa7c
--- /dev/null
+++ b/support/testing/tests/package/sample_python_cbor_dec.py
@@ -0,0 +1,10 @@
+import cbor
+
+with open("/tmp/data.cbor", "rb") as f:
+    serialized = f.read()
+data = cbor.loads(serialized)
+print(data)
+assert(data["name"] == "python-cbor")
+assert(data["versions"] == ["1", "2"])
+assert(data["group"]["is_a_package"] is True)
+assert(data["group"]["value"] == 42)
diff --git a/support/testing/tests/package/sample_python_cbor_enc.py b/support/testing/tests/package/sample_python_cbor_enc.py
new file mode 100644
index 0000000000..1bde92bb9f
--- /dev/null
+++ b/support/testing/tests/package/sample_python_cbor_enc.py
@@ -0,0 +1,14 @@
+import cbor
+
+data = {
+    "name": "python-cbor",
+    "versions": ["1", "2"],
+    "group": {
+        "is_a_package": True,
+        "value": 42
+    }
+}
+serialized = cbor.dumps(data)
+print(serialized)
+with open("/tmp/data.cbor", "wb") as f:
+    f.write(serialized)
diff --git a/support/testing/tests/package/test_python_cbor.py b/support/testing/tests/package/test_python_cbor.py
new file mode 100644
index 0000000000..9da3503763
--- /dev/null
+++ b/support/testing/tests/package/test_python_cbor.py
@@ -0,0 +1,23 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Cbor(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_CBOR=y
+        """
+    sample_scripts = ["tests/package/sample_python_cbor_enc.py",
+                      "tests/package/sample_python_cbor_dec.py"]
+
+
+class TestPythonPy3Cbor(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CBOR=y
+        """
+    sample_scripts = ["tests/package/sample_python_cbor_enc.py",
+                      "tests/package/sample_python_cbor_dec.py"]
