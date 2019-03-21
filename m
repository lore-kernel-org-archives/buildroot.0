From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Mar 2019 22:07:25 +0100
Subject: [Buildroot] [PATCH-2018.02] package/libopenssl: security bump to
 version 1.0.2r
Message-ID: <20190321210725.25632-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue:

0-byte record padding oracle (CVE-2019-1559)

If an application encounters a fatal protocol error and then calls
SSL_shutdown() twice (once to send a close_notify, and once to receive one)
then OpenSSL can respond differently to the calling application if a 0 byte
record is received with invalid padding compared to if a 0 byte record is
received with an invalid MAC.  If the application then behaves differently
based on that in a way that is detectable to the remote peer, then this
amounts to a padding oracle that could be used to decrypt data.

For more details, see the advisory:

https://mta.openssl.org/pipermail/openssl-announce/2019-February/000148.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 8 ++++----
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 83fb8bd513..7e6e6057ee 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,7 +1,7 @@
-# From https://www.openssl.org/source/openssl-1.0.2q.tar.gz.sha256
-sha256	5744cfcbcec2b1b48629f7354203bc1e5e9b5466998bbccc5b5fcde3b18eb684	openssl-1.0.2q.tar.gz
-# From https://www.openssl.org/source/openssl-1.0.2q.tar.gz.sha1
-sha1	692f5f2f1b114f8adaadaa3e7be8cce1907f38c5				openssl-1.0.2q.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2r.tar.gz.sha256
+sha256	ae51d08bba8a83958e894946f15303ff894d75c2b8bbd44a852b64e3fe11d0d6	openssl-1.0.2r.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2r.tar.gz.sha1
+sha1	b9aec1fa5cedcfa433aed37c8fe06b0ab0ce748d				openssl-1.0.2r.tar.gz
 # Locally computed
 sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index dc15abf66a..a53e78c07e 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.0.2q
+LIBOPENSSL_VERSION = 1.0.2r
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
-- 
2.11.0
