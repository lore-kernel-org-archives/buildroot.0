From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 21:38:56 +0100
Subject: [Buildroot] [git commit] package/perl-crypt-ssleay: new package
Message-ID: <20200315203842.4AA55803BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25033cfb8612c6d0f45c89806f7e0669ffbf0e8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added via utils/scancpan, adding a host dependency to perl-try-tiny and
target dependency to openssl.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  1 +
 package/perl-crypt-ssleay/Config.in                | 12 ++++++
 package/perl-crypt-ssleay/perl-crypt-ssleay.hash   |  6 +++
 package/perl-crypt-ssleay/perl-crypt-ssleay.mk     | 18 +++++++++
 package/perl-try-tiny/perl-try-tiny.mk             |  1 +
 .../tests/package/test_perl_crypt_ssleay.py        | 43 ++++++++++++++++++++++
 7 files changed, 83 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e3433d4466..f0a5041a03 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2401,6 +2401,7 @@ F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
+F:	package/perl-crypt-ssleay/
 F:	package/perl-i18n/
 F:	package/perl-locale-maketext-lexicon/
 F:	package/perl-lwp-protocol-https/
@@ -2419,6 +2420,7 @@ F:	package/perl-path-class/
 F:	package/pigz/
 F:	package/xenomai/
 F:	support/scripts/size-stats
+F:	support/testing/tests/package/test_perl_crypt_ssleay.py
 F:	support/testing/tests/package/test_perl_lwp_protocol_https.py
 F:	utils/size-stats-compare
 F:	toolchain/
diff --git a/package/Config.in b/package/Config.in
index 355dd0e28f..abcc9cdad5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -724,6 +724,7 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-openssl-aes/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
+	source "package/perl-crypt-ssleay/Config.in"
 	source "package/perl-data-dump/Config.in"
 	source "package/perl-data-optlist/Config.in"
 	source "package/perl-data-uuid/Config.in"
diff --git a/package/perl-crypt-ssleay/Config.in b/package/perl-crypt-ssleay/Config.in
new file mode 100644
index 0000000000..92ea354b46
--- /dev/null
+++ b/package/perl-crypt-ssleay/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PERL_CRYPT_SSLEAY
+	bool "perl-crypt-ssleay"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PERL_LWP_PROTOCOL_HTTPS # runtime
+	help
+	  OpenSSL support for LWP.
+
+	  https://metacpan.org/release/Crypt-SSLeay
+
+comment "perl-crypt-ssleay needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-crypt-ssleay/perl-crypt-ssleay.hash b/package/perl-crypt-ssleay/perl-crypt-ssleay.hash
new file mode 100644
index 0000000000..c5427bfec9
--- /dev/null
+++ b/package/perl-crypt-ssleay/perl-crypt-ssleay.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    77d955c9056dbb12413d95d8852a9cdf Crypt-SSLeay-0.72.tar.gz
+sha256 f5d34f813677829857cf8a0458623db45b4d9c2311daaebe446f9e01afa9ffe8 Crypt-SSLeay-0.72.tar.gz
+
+# computed by scancpan
+sha256 5c21a4393be5a9d307fd1dd2274e5d261a3213272277c2b72e7321db51e4bad7 README.md
diff --git a/package/perl-crypt-ssleay/perl-crypt-ssleay.mk b/package/perl-crypt-ssleay/perl-crypt-ssleay.mk
new file mode 100644
index 0000000000..9564ee2b38
--- /dev/null
+++ b/package/perl-crypt-ssleay/perl-crypt-ssleay.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# perl-crypt-ssleay
+#
+################################################################################
+
+PERL_CRYPT_SSLEAY_VERSION = 0.72
+PERL_CRYPT_SSLEAY_SOURCE = Crypt-SSLeay-$(PERL_CRYPT_SSLEAY_VERSION).tar.gz
+PERL_CRYPT_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NA/NANIS
+PERL_CRYPT_SSLEAY_DEPENDENCIES = \
+	openssl \
+	host-perl-path-class \
+	host-perl-try-tiny
+PERL_CRYPT_SSLEAY_LICENSE = Artistic-2.0
+PERL_CRYPT_SSLEAY_LICENSE_FILES = README.md
+PERL_CRYPT_SSLEAY_DISTNAME = Crypt-SSLeay
+
+$(eval $(perl-package))
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index f13e2ee59f..62fb1bbace 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -12,3 +12,4 @@ PERL_TRY_TINY_LICENSE_FILES = LICENCE
 PERL_TRY_TINY_DISTNAME = Try-Tiny
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
diff --git a/support/testing/tests/package/test_perl_crypt_ssleay.py b/support/testing/tests/package/test_perl_crypt_ssleay.py
new file mode 100644
index 0000000000..e6093b3938
--- /dev/null
+++ b/support/testing/tests/package/test_perl_crypt_ssleay.py
@@ -0,0 +1,43 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlCryptSSLeay(TestPerlBase):
+    """
+    package:
+        Crypt-SSLeay   XS
+    direct dependencies:
+        LWP-Protocol-https
+    indirect dependencies:
+        Encode-Locale
+        File-Listing
+        HTML-Parser   XS
+        HTML-Tagset
+        HTTP-Cookies
+        HTTP-Daemon
+        HTTP-Date
+        HTTP-Message
+        HTTP-Negotiate
+        IO-HTML
+        IO-Socket-SSL
+        LWP-MediaTypes
+        Mozilla-CA
+        Net-HTTP
+        Net-SSLeay   XS
+        TimeDate
+        Try-Tiny
+        URI
+        WWW-RobotRules
+        libwww-perl
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_CRYPT_SSLEAY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("HTML::Parser")
+        self.module_test("Net::SSLeay")
+        self.module_test("Crypt::SSLeay")
