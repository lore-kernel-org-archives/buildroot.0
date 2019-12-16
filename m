From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 23:28:08 +0100
Subject: [Buildroot] [git commit] support/testing: add smmap2 test
Message-ID: <20191216221921.11E168B83A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f81f673a78373ac07069863dd87cd6041cd79850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case that imports the module and instantiates a new
SlidingWindowMapManager class.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                      |  2 ++
 .../testing/tests/package/sample_python_smmap2.py   |  6 ++++++
 support/testing/tests/package/test_python_smmap2.py | 21 +++++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cf3382732f..2337eff472 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -463,6 +463,8 @@ tests.package.test_python_pyyaml.TestPythonPy2Pyyaml: { extends: .runtime_test }
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
