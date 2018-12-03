From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 20:50:25 +0100
Subject: [Buildroot] [git commit] support/testing: add perl-gdgraph test
Message-ID: <20181203194907.59F3981402@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80196db1f41907d44d00fcb369457adfa6741fae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/124872330]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 +
 support/testing/tests/package/test_perl_gdgraph.py | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bd40be67ee..db4b2ef57b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -317,6 +317,7 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
+tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
diff --git a/support/testing/tests/package/test_perl_gdgraph.py b/support/testing/tests/package/test_perl_gdgraph.py
new file mode 100644
index 0000000000..16cd8cb8ec
--- /dev/null
+++ b/support/testing/tests/package/test_perl_gdgraph.py
@@ -0,0 +1,22 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlGDGraph(TestPerlBase):
+    """
+    package:
+        GDGraph
+    direct dependencies:
+        GD
+        GDTextUtil
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_GDGRAPH=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("GD")
+        self.module_test("GD::Graph")
