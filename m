From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 21:38:56 +0100
Subject: [Buildroot] [git commit] package/perl-lwp-protocol-https: new
 package
Message-ID: <20200315203842.32E2C8158B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8638b99aef11c0830ddaa3a777719d8d5da719b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dependency for perl-crypt-ssleay (added in subsequent commit).

Added via utils/scancpan, without changes.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 ++
 package/Config.in                                  |  1 +
 package/perl-lwp-protocol-https/Config.in          | 14 ++++++++
 .../perl-lwp-protocol-https.hash                   |  6 ++++
 .../perl-lwp-protocol-https.mk                     | 14 ++++++++
 .../tests/package/test_perl_lwp_protocol_https.py  | 42 ++++++++++++++++++++++
 6 files changed, 79 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2dc8d4b59d..0025a38654 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2403,6 +2403,7 @@ F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
 F:	package/perl-i18n/
 F:	package/perl-locale-maketext-lexicon/
+F:	package/perl-lwp-protocol-https/
 F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
@@ -2417,6 +2418,7 @@ F:	package/perl-net-telnet/
 F:	package/pigz/
 F:	package/xenomai/
 F:	support/scripts/size-stats
+F:	support/testing/tests/package/test_perl_lwp_protocol_https.py
 F:	utils/size-stats-compare
 F:	toolchain/
 
diff --git a/package/Config.in b/package/Config.in
index 74d3f676e3..355dd0e28f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -770,6 +770,7 @@ menu "Perl libraries/modules"
 	source "package/perl-libwww-perl/Config.in"
 	source "package/perl-locale-maketext-lexicon/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
+	source "package/perl-lwp-protocol-https/Config.in"
 	source "package/perl-mail-dkim/Config.in"
 	source "package/perl-mailtools/Config.in"
 	source "package/perl-math-prime-util/Config.in"
diff --git a/package/perl-lwp-protocol-https/Config.in b/package/perl-lwp-protocol-https/Config.in
new file mode 100644
index 0000000000..c4a7b306b3
--- /dev/null
+++ b/package/perl-lwp-protocol-https/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PERL_LWP_PROTOCOL_HTTPS
+	bool "perl-lwp-protocol-https"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_IO_SOCKET_SSL # runtime
+	select BR2_PACKAGE_PERL_MOZILLA_CA # runtime
+	select BR2_PACKAGE_PERL_NET_HTTP # runtime
+	select BR2_PACKAGE_PERL_LIBWWW_PERL # runtime
+	help
+	  Provide https support for LWP::UserAgent.
+
+	  https://metacpan.org/release/LWP-Protocol-https
+
+comment "perl-lwp-protocol-https needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
new file mode 100644
index 0000000000..899cc22079
--- /dev/null
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    b8943dfb7d187af63c36fc18ab15947d LWP-Protocol-https-6.07.tar.gz
+sha256 522cc946cf84a1776304a5737a54b8822ec9e79b264d0ba0722a70473dbfb9e7 LWP-Protocol-https-6.07.tar.gz
+
+# computed by scancpan
+sha256 a93c39b0bce2bdff027b58d8a97f5116183b18b23da366fd7e1ec361d4603db2 README
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
new file mode 100644
index 0000000000..00b93c74aa
--- /dev/null
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-lwp-protocol-https
+#
+################################################################################
+
+PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.07
+PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VERSION).tar.gz
+PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic or GPL-1.0+
+PERL_LWP_PROTOCOL_HTTPS_LICENSE_FILES = README
+PERL_LWP_PROTOCOL_HTTPS_DISTNAME = LWP-Protocol-https
+
+$(eval $(perl-package))
diff --git a/support/testing/tests/package/test_perl_lwp_protocol_https.py b/support/testing/tests/package/test_perl_lwp_protocol_https.py
new file mode 100644
index 0000000000..35437459a1
--- /dev/null
+++ b/support/testing/tests/package/test_perl_lwp_protocol_https.py
@@ -0,0 +1,42 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlLWPProtocolhttps(TestPerlBase):
+    """
+    package:
+        LWP-Protocol-https
+    direct dependencies:
+        IO-Socket-SSL
+        Mozilla-CA
+        Net-HTTP
+        libwww-perl
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
+        LWP-MediaTypes
+        Net-SSLeay   XS
+        TimeDate
+        Try-Tiny
+        URI
+        WWW-RobotRules
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_LWP_PROTOCOL_HTTPS=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("HTML::Parser")
+        self.module_test("Net::SSLeay")
+        self.module_test("LWP::Protocol::https")
