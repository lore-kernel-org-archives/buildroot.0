From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Mar 2020 10:45:59 +0100
Subject: [Buildroot] [PATCH] Revert "package/perl-crypt-ssleay: new package"
Message-ID: <20200325094559.5046-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

This reverts commit 25033cfb8612c6d0f45c89806f7e0669ffbf0e8a.

This perl package is deprecated and gives following recommendations while
building:

    *** THIS IS NOT AN ERROR, JUST A MESSAGE FOR YOUR INFORMATION ***

        Do you really need Crypt::SSLeay?

        Starting with version 6.02 of LWP, https support was unbundled into
        LWP::Protocol::https. This module specifies as one of its prerequisites
        IO::Socket::SSL which is automatically used by LWP::UserAgent unless
        this preference is overridden separately. IO::Socket::SSL is a more
        complete implementation, and, crucially, it allows hostname
        verification. Crypt::SSLeay does not support this. At this point,
        Crypt::SSLeay is maintained to support existing software that already
        depends on it.

        However, it is possible that your software does not really depend on
        Crypt::SSLeay, only on the ability of LWP::UserAgent class to
        communicate with sites over SSL/TLS.

        If are using version LWP 6.02 or later, and therefore have installed
        LWP::Protocol::https and its dependencies, and do not explicitly use
        Net::SSL before loading LWP::UserAgent, or override the default socket
        class, you are probably using IO::Socket::SSL and do not really need
        Crypt::SSLeay.

        Before installing Crypt::SSLeay, you may want to try specifying a
        dependency on LWP::Protocol::https.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                    |  2 -
 package/Config.in                             |  1 -
 package/perl-crypt-ssleay/Config.in           | 12 ------
 .../perl-crypt-ssleay/perl-crypt-ssleay.hash  |  6 ---
 .../perl-crypt-ssleay/perl-crypt-ssleay.mk    | 18 --------
 package/perl-try-tiny/perl-try-tiny.mk        |  1 -
 .../tests/package/test_perl_crypt_ssleay.py   | 43 -------------------
 7 files changed, 83 deletions(-)
 delete mode 100644 package/perl-crypt-ssleay/Config.in
 delete mode 100644 package/perl-crypt-ssleay/perl-crypt-ssleay.hash
 delete mode 100644 package/perl-crypt-ssleay/perl-crypt-ssleay.mk
 delete mode 100644 support/testing/tests/package/test_perl_crypt_ssleay.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fb4e65755..4a43ca420d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2425,7 +2425,6 @@ F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
-F:	package/perl-crypt-ssleay/
 F:	package/perl-i18n/
 F:	package/perl-locale-maketext-lexicon/
 F:	package/perl-lwp-protocol-https/
@@ -2444,7 +2443,6 @@ F:	package/perl-path-class/
 F:	package/pigz/
 F:	package/xenomai/
 F:	support/scripts/size-stats
-F:	support/testing/tests/package/test_perl_crypt_ssleay.py
 F:	support/testing/tests/package/test_perl_lwp_protocol_https.py
 F:	utils/size-stats-compare
 F:	toolchain/
diff --git a/package/Config.in b/package/Config.in
index 614ec921e5..7b73198d50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -726,7 +726,6 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-openssl-aes/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
-	source "package/perl-crypt-ssleay/Config.in"
 	source "package/perl-data-dump/Config.in"
 	source "package/perl-data-optlist/Config.in"
 	source "package/perl-data-uuid/Config.in"
diff --git a/package/perl-crypt-ssleay/Config.in b/package/perl-crypt-ssleay/Config.in
deleted file mode 100644
index 92ea354b46..0000000000
--- a/package/perl-crypt-ssleay/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_PERL_CRYPT_SSLEAY
-	bool "perl-crypt-ssleay"
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_PERL_LWP_PROTOCOL_HTTPS # runtime
-	help
-	  OpenSSL support for LWP.
-
-	  https://metacpan.org/release/Crypt-SSLeay
-
-comment "perl-crypt-ssleay needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/perl-crypt-ssleay/perl-crypt-ssleay.hash b/package/perl-crypt-ssleay/perl-crypt-ssleay.hash
deleted file mode 100644
index c5427bfec9..0000000000
--- a/package/perl-crypt-ssleay/perl-crypt-ssleay.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5    77d955c9056dbb12413d95d8852a9cdf Crypt-SSLeay-0.72.tar.gz
-sha256 f5d34f813677829857cf8a0458623db45b4d9c2311daaebe446f9e01afa9ffe8 Crypt-SSLeay-0.72.tar.gz
-
-# computed by scancpan
-sha256 5c21a4393be5a9d307fd1dd2274e5d261a3213272277c2b72e7321db51e4bad7 README.md
diff --git a/package/perl-crypt-ssleay/perl-crypt-ssleay.mk b/package/perl-crypt-ssleay/perl-crypt-ssleay.mk
deleted file mode 100644
index 9564ee2b38..0000000000
--- a/package/perl-crypt-ssleay/perl-crypt-ssleay.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# perl-crypt-ssleay
-#
-################################################################################
-
-PERL_CRYPT_SSLEAY_VERSION = 0.72
-PERL_CRYPT_SSLEAY_SOURCE = Crypt-SSLeay-$(PERL_CRYPT_SSLEAY_VERSION).tar.gz
-PERL_CRYPT_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NA/NANIS
-PERL_CRYPT_SSLEAY_DEPENDENCIES = \
-	openssl \
-	host-perl-path-class \
-	host-perl-try-tiny
-PERL_CRYPT_SSLEAY_LICENSE = Artistic-2.0
-PERL_CRYPT_SSLEAY_LICENSE_FILES = README.md
-PERL_CRYPT_SSLEAY_DISTNAME = Crypt-SSLeay
-
-$(eval $(perl-package))
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index 62fb1bbace..f13e2ee59f 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -12,4 +12,3 @@ PERL_TRY_TINY_LICENSE_FILES = LICENCE
 PERL_TRY_TINY_DISTNAME = Try-Tiny
 
 $(eval $(perl-package))
-$(eval $(host-perl-package))
diff --git a/support/testing/tests/package/test_perl_crypt_ssleay.py b/support/testing/tests/package/test_perl_crypt_ssleay.py
deleted file mode 100644
index e6093b3938..0000000000
--- a/support/testing/tests/package/test_perl_crypt_ssleay.py
+++ /dev/null
@@ -1,43 +0,0 @@
-from tests.package.test_perl import TestPerlBase
-
-
-class TestPerlCryptSSLeay(TestPerlBase):
-    """
-    package:
-        Crypt-SSLeay   XS
-    direct dependencies:
-        LWP-Protocol-https
-    indirect dependencies:
-        Encode-Locale
-        File-Listing
-        HTML-Parser   XS
-        HTML-Tagset
-        HTTP-Cookies
-        HTTP-Daemon
-        HTTP-Date
-        HTTP-Message
-        HTTP-Negotiate
-        IO-HTML
-        IO-Socket-SSL
-        LWP-MediaTypes
-        Mozilla-CA
-        Net-HTTP
-        Net-SSLeay   XS
-        TimeDate
-        Try-Tiny
-        URI
-        WWW-RobotRules
-        libwww-perl
-    """
-
-    config = TestPerlBase.config + \
-        """
-        BR2_PACKAGE_PERL=y
-        BR2_PACKAGE_PERL_CRYPT_SSLEAY=y
-        """
-
-    def test_run(self):
-        self.login()
-        self.module_test("HTML::Parser")
-        self.module_test("Net::SSLeay")
-        self.module_test("Crypt::SSLeay")
-- 
2.24.1
