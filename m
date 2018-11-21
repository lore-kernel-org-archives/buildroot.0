From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 21 Nov 2018 20:58:17 +0100
Subject: [Buildroot] [PATCH 3/8] support/testing: add perl-class-load test
In-Reply-To: <20181121195822.15379-1-francois.perrad@gadz.org>
References: <20181121195822.15379-1-francois.perrad@gadz.org>
Message-ID: <20181121195822.15379-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  1 +
 .../tests/package/test_perl_class_load.py     | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl_class_load.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ae5d57026..16eb134c3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -313,6 +313,7 @@ tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
+tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
diff --git a/support/testing/tests/package/test_perl_class_load.py b/support/testing/tests/package/test_perl_class_load.py
new file mode 100644
index 000000000..488719482
--- /dev/null
+++ b/support/testing/tests/package/test_perl_class_load.py
@@ -0,0 +1,27 @@
+from tests.package.test_perl import TestPerl
+
+
+class TestPerlClassLoad(TestPerl):
+    """
+    package:
+        Class-Load
+    direct dependencies:
+        Data-OptList *
+        Module-Implementation
+        Module-Runtime
+        Package-Stash
+        Try-Tiny
+    indirect dependencies:
+        Dist-CheckConflicts
+        Params-Util
+        Sub-Install
+    """
+
+    config = TestPerl.config + \
+        """
+        BR2_PACKAGE_PERL_CLASS_LOAD=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("Class::Load")
-- 
2.17.1
