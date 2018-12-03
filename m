From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 20:52:05 +0100
Subject: [Buildroot] [git commit] support/testing: add perl-mail-dkim test
Message-ID: <20181203194907.7A22881402@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d48dc64c7d3ccf57b197b3579d93663a900aaf22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/124872333]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 +
 .../testing/tests/package/test_perl_mail_dkim.py   | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0863b027ce..1390c25316 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -319,6 +319,7 @@ tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
 tests.package.test_perl_libwww_perl.TestPerllibwwwperl: *runtime_test
+tests.package.test_perl_mail_dkim.TestPerlMailDKIM: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
diff --git a/support/testing/tests/package/test_perl_mail_dkim.py b/support/testing/tests/package/test_perl_mail_dkim.py
new file mode 100644
index 0000000000..dc4d4bb3a7
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
