From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 29 Nov 2019 12:38:41 -0800
Subject: [Buildroot] [PATCH 2/2] support/testing: add smmap2 test
In-Reply-To: <20191129203841.2197088-1-aduskett@gmail.com>
References: <20191129203841.2197088-1-aduskett@gmail.com>
Message-ID: <20191129203841.2197088-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Add a simple test case that imports the module and instantiates a new
SlidingWindowMapManager class.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .gitlab-ci.yml                                |  2 ++
 .../tests/package/sample_python_smmap2.py     |  6 ++++++
 .../tests/package/test_python_smmap2.py       | 21 +++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_smmap2.py
 create mode 100644 support/testing/tests/package/test_python_smmap2.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 22befa0427..f48e188dd0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -460,6 +460,8 @@ tests.package.test_python_pyyaml.TestPythonPy2Pyyaml: { extends: .runtime_test }
 tests.package.test_python_pyyaml.TestPythonPy3Pyyaml: { extends: .runtime_test }
 tests.package.test_python_service_identity.TestPythonPy2ServiceIdentity: { extends: .runtime_test }
 tests.package.test_python_service_identity.TestPythonPy3ServiceIdentity: { extends: .runtime_test }
+tests.package.test_python_smmap2.TestPythonPy2Smmap2: { extends: .runtime_test }
+tests.package.test_python_smmap2.TestPythonPy3Smmap2: { extends: .runtime_test }
 tests.package.test_python_subprocess32.TestPythonPy2Subprocess32: { extends: .runtime_test }
 tests.package.test_python_treq.TestPythonPy2Treq: { extends: .runtime_test }
 tests.package.test_python_treq.TestPythonPy3Treq: { extends: .runtime_test }
diff --git a/support/testing/tests/package/sample_python_smmap2.py b/support/testing/tests/package/sample_python_smmap2.py
new file mode 100644
index 0000000000..494fc26e89
--- /dev/null
+++ b/support/testing/tests/package/sample_python_smmap2.py
@@ -0,0 +1,6 @@
+# Taken from smmap/test/test_tutorial.py
+
+import smmap
+mman = smmap.SlidingWindowMapManager()
+assert mman.num_file_handles() == 0
+assert mman.mapped_memory_size() == 0
diff --git a/support/testing/tests/package/test_python_smmap2.py b/support/testing/tests/package/test_python_smmap2.py
new file mode 100644
index 0000000000..07c0e6621e
--- /dev/null
+++ b/support/testing/tests/package/test_python_smmap2.py
@@ -0,0 +1,21 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Smmap2(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_SMMAP2=y
+        """
+    sample_scripts = ["tests/package/sample_python_smmap2.py"]
+
+
+class TestPythonPy3Smmap2(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SMMAP2=y
+        """
+    sample_scripts = ["tests/package/sample_python_smmap2.py"]
-- 
2.23.0
