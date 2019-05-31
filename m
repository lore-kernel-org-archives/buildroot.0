From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 09:58:59 +0200
Subject: [Buildroot] [git commit] package/libopenssl: security bump to
 version 1.1.1c
Message-ID: <20190531080318.1D1F78E840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfedfdee95df8878a15b4d3d11c5ca3b99481de1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

Prevent over long nonces in ChaCha20-Poly1305 (CVE-2019-1543)

ChaCha20-Poly1305 is an AEAD cipher, and requires a unique nonce input for
every encryption operation.  RFC 7539 specifies that the nonce value (IV)
should be 96 bits (12 bytes).  OpenSSL allows a variable nonce length and
front pads the nonce with 0 bytes if it is less than 12 bytes.  However it
also incorrectly allows a nonce to be set of up to 16 bytes.  In this case
only the last 12 bytes are significant and any additional leading bytes are
ignored.

It is a requirement of using this cipher that nonce values are unique.
Messages encrypted using a reused nonce value are susceptible to serious
confidentiality and integrity attacks.  If an application changes the
default nonce length to be longer than 12 bytes and then makes a change to
the leading bytes of the nonce expecting the new value to be a new unique
nonce then such an application could inadvertently encrypt messages with a
reused nonce.

Additionally the ignored bytes in a long nonce are not covered by the
integrity guarantee of this cipher.  Any application that relies on the
integrity of these ignored leading bytes of a long nonce may be further
affected.  Any OpenSSL internal use of this cipher, including in SSL/TLS, is
safe because no such use sets such a long nonce value.  However user
applications that use this cipher directly and set a non-default nonce
length to be longer than 12 bytes may be vulnerable.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 2 +-
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 3a8192c46c..753f447abe 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
 # From https://www.openssl.org/source/openssl-1.1.1b.tar.gz.sha256
-sha256	5c557b023230413dfb0756f3137a13e6d726838ccd1430888ad15bfb2b43ea4b	openssl-1.1.1b.tar.gz
+sha256	f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90	openssl-1.1.1c.tar.gz
 
 # License files
 sha256	c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c	LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index b7eff06c80..064b71bb2e 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1b
+LIBOPENSSL_VERSION = 1.1.1c
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
