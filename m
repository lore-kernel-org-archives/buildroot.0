From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Nov 2018 10:07:20 +0100
Subject: [Buildroot] [PATCH/next v3 6/8] support/testing: add perl-mail-dkim
 test
In-Reply-To: <20181124090723.14722-1-francois.perrad@gadz.org>
References: <20181124090723.14722-1-francois.perrad@gadz.org>
Message-ID: <20181124090723.14722-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/124872333]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .gitlab-ci.yml                                |  1 +
 .../tests/package/test_perl_mail_dkim.py      | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl_mail_dkim.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 344acc254..14e6a27ac 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -316,6 +316,7 @@ tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
 tests.package.test_perl_libwww_perl.TestPerllibwwwperl: *runtime_test
+tests.package.test_perl_mail_dkim.TestPerlMailDKIM: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
diff --git a/support/testing/tests/package/test_perl_mail_dkim.py b/support/testing/tests/package/test_perl_mail_dkim.py
new file mode 100644
index 000000000..dc4d4bb3a
--- /dev/null
+++ b/support/testing/tests/package/test_perl_mail_dkim.py
@@ -0,0 +1,28 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlMailDKIM(TestPerlBase):
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
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_MAIL_DKIM=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("Mail::DKIM")
-- 
2.17.1
