From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Mar 2018 16:52:09 +0200
Subject: [Buildroot] [PATCH] libopenssl: security bump to version 1.0.2o
Message-ID: <20180329145209.7878-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

Constructed ASN.1 types with a recursive definition could exceed the stack
(CVE-2018-0739)

Constructed ASN.1 types with a recursive definition (such as can be found in
PKCS7) could eventually exceed the stack given malicious input with
excessive recursion.  This could result in a Denial Of Service attack.
There are no such structures used within SSL/TLS that come from untrusted
sources so this is considered safe.

Incorrect CRYPTO_memcmp on HP-UX PA-RISC (CVE-2018-0733)

Because of an implementation bug the PA-RISC CRYPTO_memcmp function is
effectively reduced to only comparing the least significant bit of each
byte.  This allows an attacker to forge messages that would be considered as
authenticated in an amount of tries lower than that guaranteed by the
security claims of the scheme.  The module can only be compiled by the HP-UX
assembler, so that only HP-UX PA-RISC targets are affected.

rsaz_1024_mul_avx2 overflow bug on x86_64 (CVE-2017-3738)

This issue has been reported in a previous OpenSSL security advisory and a
fix was provided for OpenSSL 1.0.2.  Due to the low severity no fix was
released at that time for OpenSSL 1.1.0.  The fix is now available in
OpenSSL 1.1.0h.

There is an overflow bug in the AVX2 Montgomery multiplication procedure
used in exponentiation with 1024-bit moduli.  No EC algorithms are affected.
Analysis suggests that attacks against RSA and DSA as a result of this
defect would be very difficult to perform and are not believed likely.
Attacks against DH1024 are considered just feasible, because most of the
work necessary to deduce information about a private key may be performed
offline.  The amount of resources required for such an attack would be
significant.  However, for an attack on TLS to be meaningful, the server
would have to share the DH1024 private key among multiple clients, which is
no longer an option since CVE-2016-0701.

This only affects processors that support the AVX2 but not ADX extensions
like Intel Haswell (4th generation).

For more details, see https://www.openssl.org/news/secadv/20180327.txt

The copyright year changed in LICENSE, so adjust the hash to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 6 +++---
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index e3d3da757d..48b7471c20 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,8 +1,8 @@
-# From https://www.openssl.org/source/openssl-1.0.2n.tar.gz.sha256
-sha256	370babb75f278c39e0c50e8c4e7493bc0f18db6867478341a832a982fd15a8fe	openssl-1.0.2n.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2o.tar.gz.sha256
+sha256	ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d	openssl-1.0.2o.tar.gz
 # Locally computed
 sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 sha256	30cb49489de5041841a74da9155cd4fabfbce33237262ba7cd23974314ae2956	openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 sha256	deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f	openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
-sha256	9ee37d72966bb4a841343f0606ce44d41b3eae4df4285200c5a8ddc2b935992a	LICENSE
+sha256	c8f60f4842bbad0353f5d81620e72b168b5638ca3a0a999f5da113b22491612e	LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 5a78676c64..16a9c2e9d2 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.0.2n
+LIBOPENSSL_VERSION = 1.0.2o
 LIBOPENSSL_SITE = http://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
-- 
2.11.0
