From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Apr 2018 14:48:22 +0300
Subject: [Buildroot] [PATCH] mbedtls: security bump to version 2.7.2
Message-ID: <be768b1de8c5908cef3e3acbff3bc03adcefd1a0.1524570502.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The release announcement mentions these security fixes:

  Defend against Bellcore glitch attacks by verifying the results of RSA
  private key operations.

  Fix implementation of the truncated HMAC extension. The previous
  implementation allowed an offline 2^80 brute force attack on the HMAC
  key of a single, uninterrupted connection (with no resumption of the
  session).

  Reject CRLs containing unsupported critical extensions.

  Fix a buffer overread in ssl_parse_server_key_exchange() that could
  cause a crash on invalid input. (CVE-2018-9988)

  Fix a buffer overread in ssl_parse_server_psk_hint() that could cause
  a crash on invalid input. (CVE-2018-9989)

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...1-dhm-Fix-typo-in-RFC-5114-constants.patch | 33 -------------------
 package/mbedtls/mbedtls.hash                  |  6 ++--
 package/mbedtls/mbedtls.mk                    |  2 +-
 3 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 package/mbedtls/0001-dhm-Fix-typo-in-RFC-5114-constants.patch

diff --git a/package/mbedtls/0001-dhm-Fix-typo-in-RFC-5114-constants.patch b/package/mbedtls/0001-dhm-Fix-typo-in-RFC-5114-constants.patch
deleted file mode 100644
index effaf3d931a5..000000000000
--- a/package/mbedtls/0001-dhm-Fix-typo-in-RFC-5114-constants.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 129f50838bf14f4e1319f06f41c827fae9cc4b73 Mon Sep 17 00:00:00 2001
-From: Jaeden Amero <jaeden.amero@arm.com>
-Date: Thu, 8 Feb 2018 14:25:36 +0000
-Subject: [PATCH] dhm: Fix typo in RFC 5114 constants
-
-We accidentally named the constant MBEDTLS_DHM_RFC5114_MODP_P instead of
-MBEDTLS_DHM_RFC5114_MODP_2048_P.
-
-Fixes #1358
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit 129f50838bf
-
- include/mbedtls/dhm.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/mbedtls/dhm.h b/include/mbedtls/dhm.h
-index da2e66b111b6..00fafd8d16f4 100644
---- a/include/mbedtls/dhm.h
-+++ b/include/mbedtls/dhm.h
-@@ -372,7 +372,7 @@ MBEDTLS_DEPRECATED typedef char const * mbedtls_deprecated_constant_t;
-  * in <em>RFC-5114: Additional Diffie-Hellman Groups for Use with
-  * IETF Standards</em>.
-  */
--#define MBEDTLS_DHM_RFC5114_MODP_P                              \
-+#define MBEDTLS_DHM_RFC5114_MODP_2048_P                         \
-     MBEDTLS_DEPRECATED_STRING_CONSTANT(                         \
-         "AD107E1E9123A9D0D660FAA79559C51FA20D64E5683B9FD1"      \
-         "B54B1597B61D0A75E6FA141DF95A56DBAF9A3C407BA1DF15"      \
--- 
-2.16.1
-
diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index a62c0f58decf..f5331bed1579 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.7.0-2.1.10-and-1.3.22-released
-sha1	01ffebf679c8696cc941c41224fa73d8944d2c85	mbedtls-2.7.0-apache.tgz
-sha256	aeb66d6cd43aa1c79c145d15845c655627a7fc30d624148aaafbb6c36d7f55ef	mbedtls-2.7.0-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.8.0-2.7.2-and-2.1.11-released
+sha1	e36d7cbdc2ed0a5d5659385840e8fbb4d351234e	mbedtls-2.7.2-apache.tgz
+sha256	fd38c2bb5fbe1ffd3e7fdcdd71130986f2010f25b3a5575eb8ded0dd3bc573d7	mbedtls-2.7.2-apache.tgz
 # Locally calculated
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 7c26ea95ee60..ca44ee371357 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.7.0
+MBEDTLS_VERSION = 2.7.2
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
-- 
2.17.0
