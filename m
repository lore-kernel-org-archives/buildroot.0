From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 20:50:21 +0100
Subject: [Buildroot] [git commit] support/testing: add perl-class-load test
Message-ID: <20181203194907.49A598A55F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78f4fad3cf86283ef55ee6f74ae47fb36b1c40c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/124872329]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 +
 .../testing/tests/package/test_perl_class_load.py  | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8edd96853c..bd40be67ee 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -316,6 +316,7 @@ tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
+tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
diff --git a/support/testing/tests/package/test_perl_class_load.py b/support/testing/tests/package/test_perl_class_load.py
new file mode 100644
index 0000000000..1e86c03743
--- /dev/null
+++ b/support/testing/tests/package/test_perl_class_load.py
@@ -0,0 +1,28 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlClassLoad(TestPerlBase):
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
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_CLASS_LOAD=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("Class::Load")
