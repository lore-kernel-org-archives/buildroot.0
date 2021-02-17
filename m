From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 17:21:34 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/libopenssl:
 security bump to version 1.1.1j
Message-ID: <20210217160137.DFB6A84C26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=107e86220067cec6354d612b1d66d147ff1ecab0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes the following security issues:

- CVE-2021-23841: Null pointer deref in X509_issuer_and_serial_hash()

  The OpenSSL public API function X509_issuer_and_serial_hash() attempts to
  create a unique hash value based on the issuer and serial number data
  contained within an X509 certificate.  However it fails to correctly
  handle any errors that may occur while parsing the issuer field (which
  might occur if the issuer field is maliciously constructed).  This may
  subsequently result in a NULL pointer deref and a crash leading to a
  potential denial of service attack.

  The function X509_issuer_and_serial_hash() is never directly called by
  OpenSSL itself so applications are only vulnerable if they use this
  function directly and they use it on certificates that may have been
  obtained from untrusted sources.

- CVE-2021-23839: Incorrect SSLv2 rollback protection

  OpenSSL 1.0.2 supports SSLv2.  If a client attempts to negotiate SSLv2
  with a server that is configured to support both SSLv2 and more recent SSL
  and TLS versions then a check is made for a version rollback attack when
  unpadding an RSA signature.  Clients that support SSL or TLS versions
  greater than SSLv2 are supposed to use a special form of padding.  A
  server that supports greater than SSLv2 is supposed to reject connection
  attempts from a client where this special form of padding is present,
  because this indicates that a version rollback has occurred (i.e.  both
  client and server support greater than SSLv2, and yet this is the version
  that is being requested).

  The implementation of this padding check inverted the logic so that the
  connection attempt is accepted if the padding is present, and rejected if
  it is absent.  This means that such as server will accept a connection if
  a version rollback attack has occurred.  Further the server will
  erroneously reject a connection if a normal SSLv2 connection attempt is
  made.

  OpenSSL 1.1.1 does not have SSLv2 support and therefore is not vulnerable
  to this issue.  The underlying error is in the implementation of the
  RSA_padding_check_SSLv23() function.  This also affects the
  RSA_SSLV23_PADDING padding mode used by various other functions.  Although
  1.1.1 does not support SSLv2 the RSA_padding_check_SSLv23() function still
  exists, as does the RSA_SSLV23_PADDING padding mode.  Applications that
  directly call that function or use that padding mode will encounter this
  issue.  However since there is no support for the SSLv2 protocol in 1.1.1
  this is considered a bug and not a security issue in that version.

- CVE-2021-23840: Integer overflow in CipherUpdate

  Calls to EVP_CipherUpdate, EVP_EncryptUpdate and EVP_DecryptUpdate may
  overflow the output length argument in some cases where the input length
  is close to the maximum permissable length for an integer on the platform.
  In such cases the return value from the function call will be 1
  (indicating success), but the output length value will be negative.  This
  could cause applications to behave incorrectly or crash.

For more details, see the advisory:
https://www.openssl.org/news/secadv/20210216.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4745a484a6dd72e6aa7b56952535504b8252d6a6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 5e24ca17ae..854f8a03f7 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1i.tar.gz.sha256
-sha256  e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242  openssl-1.1.1i.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1j.tar.gz.sha256
+sha256  aaf2fcb575cdf6491b98ab4829abf78a3dec8402b8b81efc8f23c00d443981bf  openssl-1.1.1j.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 5c47927b08..b944634bc8 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1i
+LIBOPENSSL_VERSION = 1.1.1j
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
