From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 16 Nov 2018 01:57:31 -0200
Subject: [Buildroot] [next 11/15] support/testing: add python-pyyaml tests
In-Reply-To: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
References: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
Message-ID: <20181116035735.31507-12-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a simple test case to check the basic usage, storing a dict into a
file and then retrieving the dict from the file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .gitlab-ci.yml                                |  2 ++
 .../tests/package/sample_python_pyyaml_dec.py | 10 ++++++++
 .../tests/package/sample_python_pyyaml_enc.py | 14 +++++++++++
 .../tests/package/test_python_pyyaml.py       | 23 +++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pyyaml_dec.py
 create mode 100644 support/testing/tests/package/sample_python_pyyaml_enc.py
 create mode 100644 support/testing/tests/package/test_python_pyyaml.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2a68e6485d..a0659d6bfb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -343,6 +343,8 @@ tests.package.test_python_pexpect.TestPythonPy2Pexpect: *runtime_test
 tests.package.test_python_pexpect.TestPythonPy3Pexpect: *runtime_test
 tests.package.test_python_pynacl.TestPythonPy2Pynacl: *runtime_test
 tests.package.test_python_pynacl.TestPythonPy3Pynacl: *runtime_test
+tests.package.test_python_pyyaml.TestPythonPy2Pyyaml: *runtime_test
+tests.package.test_python_pyyaml.TestPythonPy3Pyyaml: *runtime_test
 tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
 tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
 tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
diff --git a/support/testing/tests/package/sample_python_pyyaml_dec.py b/support/testing/tests/package/sample_python_pyyaml_dec.py
new file mode 100644
index 0000000000..9ab8931197
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pyyaml_dec.py
@@ -0,0 +1,10 @@
+import yaml
+
+with open("/tmp/data.yml", "rb") as f:
+    serialized = f.read()
+data = yaml.load(serialized)
+print(data)
+assert(data["name"] == "python-pyyaml")
+assert(data["versions"] == ["1", "2"])
+assert(data["group"]["is_a_package"] is True)
+assert(data["group"]["value"] == 42)
diff --git a/support/testing/tests/package/sample_python_pyyaml_enc.py b/support/testing/tests/package/sample_python_pyyaml_enc.py
new file mode 100644
index 0000000000..30759949e2
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pyyaml_enc.py
@@ -0,0 +1,14 @@
+import yaml
+
+data = {
+    "name": "python-pyyaml",
+    "versions": ["1", "2"],
+    "group": {
+        "is_a_package": True,
+        "value": 42
+    }
+}
+serialized = yaml.dump(data, default_flow_style=False)
+print(serialized)
+with open("/tmp/data.yml", "w") as f:
+    f.write(serialized)
diff --git a/support/testing/tests/package/test_python_pyyaml.py b/support/testing/tests/package/test_python_pyyaml.py
new file mode 100644
index 0000000000..cd45a57b86
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyyaml.py
@@ -0,0 +1,23 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Pyyaml(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_PYYAML=y
+        """
+    sample_scripts = ["tests/package/sample_python_pyyaml_enc.py",
+                      "tests/package/sample_python_pyyaml_dec.py"]
+
+
+class TestPythonPy3Pyyaml(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYYAML=y
+        """
+    sample_scripts = ["tests/package/sample_python_pyyaml_enc.py",
+                      "tests/package/sample_python_pyyaml_dec.py"]
-- 
2.17.1
