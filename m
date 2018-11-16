From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 16 Nov 2018 01:57:24 -0200
Subject: [Buildroot] [next 04/15] support/testing: add python-bitstring tests
In-Reply-To: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
References: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
Message-ID: <20181116035735.31507-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a simple test case to check the basic usage by checking the
corresponding representation of a 12-bit decimal number in hex, binary
and integer.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .gitlab-ci.yml                                |  2 ++
 .../tests/package/sample_python_bitstring.py  |  6 ++++++
 .../tests/package/test_python_bitstring.py    | 21 +++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_bitstring.py
 create mode 100644 support/testing/tests/package/test_python_bitstring.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7f311f74cf..2fc0fe7e6a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -324,6 +324,8 @@ tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
 tests.package.test_python_automat.TestPythonPy2Automat: *runtime_test
 tests.package.test_python_automat.TestPythonPy3Automat: *runtime_test
+tests.package.test_python_bitstring.TestPythonPy2Bitstring: *runtime_test
+tests.package.test_python_bitstring.TestPythonPy3Bitstring: *runtime_test
 tests.package.test_python_crossbar.TestPythonPy3Crossbar: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
diff --git a/support/testing/tests/package/sample_python_bitstring.py b/support/testing/tests/package/sample_python_bitstring.py
new file mode 100644
index 0000000000..2cc10dba65
--- /dev/null
+++ b/support/testing/tests/package/sample_python_bitstring.py
@@ -0,0 +1,6 @@
+import bitstring
+
+value = bitstring.BitArray("uint:12=42")
+assert(value.hex == "02a")
+assert(value.bin == "000000101010")
+assert(value.uint == 42)
diff --git a/support/testing/tests/package/test_python_bitstring.py b/support/testing/tests/package/test_python_bitstring.py
new file mode 100644
index 0000000000..63b3fdb69c
--- /dev/null
+++ b/support/testing/tests/package/test_python_bitstring.py
@@ -0,0 +1,21 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Bitstring(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_BITSTRING=y
+        """
+    sample_scripts = ["tests/package/sample_python_bitstring.py"]
+
+
+class TestPythonPy3Bitstring(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_BITSTRING=y
+        """
+    sample_scripts = ["tests/package/sample_python_bitstring.py"]
-- 
2.17.1
