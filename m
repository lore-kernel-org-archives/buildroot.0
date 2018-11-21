From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 21 Nov 2018 20:58:20 +0100
Subject: [Buildroot] [PATCH 6/8] support/testing: add perl-mail-dkim test
In-Reply-To: <20181121195822.15379-1-francois.perrad@gadz.org>
References: <20181121195822.15379-1-francois.perrad@gadz.org>
Message-ID: <20181121195822.15379-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  1 +
 .../tests/package/test_perl_mail_dkim.py      | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl_mail_dkim.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 08772cca7..667483c01 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -316,6 +316,7 @@ tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
 tests.package.test_perl_libwww_perl.TestPerllibwwwperl: *runtime_test
+tests.package.test_perl_mail_dkim.TestPerlMailDKIM: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
diff --git a/support/testing/tests/package/test_perl_mail_dkim.py b/support/testing/tests/package/test_perl_mail_dkim.py
new file mode 100644
index 000000000..a19304613
--- /dev/null
+++ b/support/testing/tests/package/test_perl_mail_dkim.py
@@ -0,0 +1,27 @@
+from tests.package.test_perl import TestPerl
+
+
+class TestPerlMailDKIM(TestPerl):
+    """
+    package:
+        Mail-DKIM
+    direct dependencies:
+        Crypt-OpenSSL-RSA
+        MailTools
+        Net-DNS
+        Net-DNS-Resolver-Mock
+        YAML-LibYAML
+    indirect dependencies:
+        Crypt-OpenSSL-Random
+        Digest-HMAC
+        TimeDate
+    """
+
+    config = TestPerl.config + \
+        """
+        BR2_PACKAGE_PERL_MAIL_DKIM=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("Mail::DKIM")
-- 
2.17.1
