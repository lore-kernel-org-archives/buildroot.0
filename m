From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 20:50:40 +0100
Subject: [Buildroot] [git commit] support/testing: add perl-libwww-perl test
Message-ID: <20181203194907.6934381361@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ac4178f2f631dfaed782fe436401005bb4404de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/124872332]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 +
 .../testing/tests/package/test_perl_libwww_perl.py | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index db4b2ef57b..0863b027ce 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -318,6 +318,7 @@ tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
+tests.package.test_perl_libwww_perl.TestPerllibwwwperl: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
diff --git a/support/testing/tests/package/test_perl_libwww_perl.py b/support/testing/tests/package/test_perl_libwww_perl.py
new file mode 100644
index 0000000000..e777071bb5
--- /dev/null
+++ b/support/testing/tests/package/test_perl_libwww_perl.py
@@ -0,0 +1,41 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerllibwwwperl(TestPerlBase):
+    """
+    package:
+        libwww-perl
+    direct dependencies:
+        Encode-Locale
+        File-Listing
+        HTML-Parser
+        HTTP-Cookies
+        HTTP-Daemon
+        HTTP-Date
+        HTTP-Message
+        HTTP-Negotiate
+        LWP-MediaTypes
+        Net-HTTP
+        Try-Tiny
+        URI
+        WWW-RobotRules
+    indirect dependencies:
+        HTML-Tagset
+        IO-HTML
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_LIBWWW_PERL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("LWP")
+        self.module_test("LWP::UserAgent")
+        self.module_test("LWP::Authen::Basic")
+        self.module_test("LWP::Authen::Digest")
+        self.module_test("HTTP::Message")
+        self.module_test("HTTP::Daemon")
+        self.module_test("WWW::RobotRules")
