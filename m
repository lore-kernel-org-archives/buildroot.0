From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Jan 2014 09:55:26 -0300
Subject: [Buildroot] [PATCH] openssl: bump to version 1.0.1f
Message-ID: <1389099326-23703-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-4343, CVE-2013-6450 and the previously patched
CVE-2013-6449.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl-003-CVE-2013-6449.patch | 34 -------------------------
 package/openssl/openssl.mk                      |  2 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 package/openssl/openssl-003-CVE-2013-6449.patch

diff --git a/package/openssl/openssl-003-CVE-2013-6449.patch b/package/openssl/openssl-003-CVE-2013-6449.patch
deleted file mode 100644
index 034da7d..0000000
--- a/package/openssl/openssl-003-CVE-2013-6449.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-https://bugs.gentoo.org/494816
-https://bugzilla.redhat.com/show_bug.cgi?id=1045363
-http://rt.openssl.org/Ticket/Display.html?id=3200&user=guest&pass=guest
-
-From ca989269a2876bae79393bd54c3e72d49975fc75 Mon Sep 17 00:00:00 2001
-From: "Dr. Stephen Henson" <steve@openssl.org>
-Date: Thu, 19 Dec 2013 14:37:39 +0000
-Subject: [PATCH] Use version in SSL_METHOD not SSL structure.
-
-When deciding whether to use TLS 1.2 PRF and record hash algorithms
-use the version number in the corresponding SSL_METHOD structure
-instead of the SSL structure. The SSL structure version is sometimes
-inaccurate. Note: OpenSSL 1.0.2 and later effectively do this already.
-(CVE-2013-6449)
----
- ssl/s3_lib.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ssl/s3_lib.c b/ssl/s3_lib.c
-index bf832bb..c4ef273 100644
---- a/ssl/s3_lib.c
-+++ b/ssl/s3_lib.c
-@@ -4286,7 +4286,7 @@ need to go to SSL_ST_ACCEPT.
- long ssl_get_algorithm2(SSL *s)
- 	{
- 	long alg2 = s->s3->tmp.new_cipher->algorithm2;
--	if (TLS1_get_version(s) >= TLS1_2_VERSION &&
-+	if (s->method->version == TLS1_2_VERSION &&
- 	    alg2 == (SSL_HANDSHAKE_MAC_DEFAULT|TLS1_PRF))
- 		return SSL_HANDSHAKE_MAC_SHA256 | TLS1_PRF_SHA256;
- 	return alg2;
--- 
-1.8.4.3
-
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 48f522f..98a098c 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.1e
+OPENSSL_VERSION = 1.0.1f
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
-- 
1.8.3.2
