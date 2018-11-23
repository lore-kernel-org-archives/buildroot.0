From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:05:46 +0100
Subject: [Buildroot] [git commit] support/testing: add python-attrs tests
Message-ID: <20181202071557.C4896815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=367c0455129ae2b496858884b2432bb5d6ec2e48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a minimal script to check the basic usage creating a class with 2
attributes.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                      |  2 ++
 .../testing/tests/package/sample_python_attrs.py    | 15 +++++++++++++++
 support/testing/tests/package/test_python_attrs.py  | 21 +++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 62f3768d3d..494894a782 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -318,6 +318,8 @@ tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
 tests.package.test_python_argh.TestPythonPy3Argh: *runtime_test
+tests.package.test_python_attrs.TestPythonPy2Attrs: *runtime_test
+tests.package.test_python_attrs.TestPythonPy3Attrs: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
 tests.package.test_python_crossbar.TestPythonPy3Crossbar: *runtime_test
diff --git a/support/testing/tests/package/sample_python_attrs.py b/support/testing/tests/package/sample_python_attrs.py
new file mode 100644
index 0000000000..f224944914
--- /dev/null
+++ b/support/testing/tests/package/sample_python_attrs.py
@@ -0,0 +1,15 @@
+import attr
+
+
+ at attr.s
+class Obj(object):
+    x = attr.ib()
+    y = attr.ib(default=1)
+
+
+obj1 = Obj(2)
+assert(obj1.x == 2)
+assert(obj1.y == 1)
+obj2 = Obj(3, 4)
+assert(obj2.x == 3)
+assert(obj2.y == 4)
diff --git a/support/testing/tests/package/test_python_attrs.py b/support/testing/tests/package/test_python_attrs.py
new file mode 100644
index 0000000000..9f597034ae
--- /dev/null
+++ b/support/testing/tests/package/test_python_attrs.py
@@ -0,0 +1,21 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Attrs(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_ATTRS=y
+        """
+    sample_scripts = ["tests/package/sample_python_attrs.py"]
+
+
+class TestPythonPy3Attrs(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_ATTRS=y
+        """
+    sample_scripts = ["tests/package/sample_python_attrs.py"]
