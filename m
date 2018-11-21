From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 21 Nov 2018 20:58:19 +0100
Subject: [Buildroot] [PATCH 5/8] support/testing: add perl-libwww-perl test
In-Reply-To: <20181121195822.15379-1-francois.perrad@gadz.org>
References: <20181121195822.15379-1-francois.perrad@gadz.org>
Message-ID: <20181121195822.15379-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  1 +
 .../tests/package/test_perl_libwww_perl.py    | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl_libwww_perl.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fd3724178..08772cca7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -315,6 +315,7 @@ tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
+tests.package.test_perl_libwww_perl.TestPerllibwwwperl: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
diff --git a/support/testing/tests/package/test_perl_libwww_perl.py b/support/testing/tests/package/test_perl_libwww_perl.py
new file mode 100644
index 000000000..f55be2bb5
--- /dev/null
+++ b/support/testing/tests/package/test_perl_libwww_perl.py
@@ -0,0 +1,40 @@
+from tests.package.test_perl import TestPerl
+
+
+class TestPerllibwwwperl(TestPerl):
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
+    config = TestPerl.config + \
+        """
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
-- 
2.17.1
