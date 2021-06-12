From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:32:03 +0200
Subject: [Buildroot] [git commit] package/perl-crypt-openssl-rsa: add
 missing dependency to openssl
Message-ID: <20210612210930.1CC3681819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c636d9c6601538920f6e46955168f41b458a287
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

perl-crypt-openssl-rsa inherits the dependency on openssl indirectly
from perl-crypt-openssl-random. Hwvere, perl-crypt-openssl-rsa needs
the openssl libraries for itself, so it must explicitly depend on it.

So far, this was totally unconsequential, but since commit a83d41867c8d
(package/libopenssl: add option to enable some features), features can
be configured out, of which RMD160 that perl-crypt-openssl-rsa needs.
If we were to add the select to that option (in a followup commit),
without a dependency to openssl, that would be very confusing in the
future.

So, add the explicit dependency now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-crypt-openssl-rsa/Config.in                 | 1 +
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/perl-crypt-openssl-rsa/Config.in b/package/perl-crypt-openssl-rsa/Config.in
index e58a921bcb..e2c0131345 100644
--- a/package/perl-crypt-openssl-rsa/Config.in
+++ b/package/perl-crypt-openssl-rsa/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
 	bool "perl-crypt-openssl-rsa"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM # runtime
 	help
 	  RSA encoding and decoding, using the openSSL libraries.
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
index b161523421..23fd1ac381 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
@@ -9,7 +9,8 @@ PERL_CRYPT_OPENSSL_RSA_SOURCE = Crypt-OpenSSL-RSA-$(PERL_CRYPT_OPENSSL_RSA_VERSI
 PERL_CRYPT_OPENSSL_RSA_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = \
 	host-perl-crypt-openssl-guess \
-	perl-crypt-openssl-random
+	perl-crypt-openssl-random \
+	openssl
 PERL_CRYPT_OPENSSL_RSA_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_RSA_LICENSE_FILES = LICENSE
 PERL_CRYPT_OPENSSL_RSA_DISTNAME = Crypt-OpenSSL-RSA
