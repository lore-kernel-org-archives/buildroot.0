From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  3 Jan 2014 07:38:22 -0300
Subject: [Buildroot] [PATCH] openssl: add fix for CVE-2013-6449
Message-ID: <1388745502-21288-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...s.patch => openssl-001-do-not-build-docs.patch} |  0
 ...tch => openssl-002-dont-force-large-file.patch} |  0
 package/openssl/openssl-003-CVE-2013-6449.patch    | 34 ++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 rename package/openssl/{openssl-do-not-build-docs.patch => openssl-001-do-not-build-docs.patch} (100%)
 rename package/openssl/{openssl-dont-force-large-file.patch => openssl-002-dont-force-large-file.patch} (100%)
 create mode 100644 package/openssl/openssl-003-CVE-2013-6449.patch

diff --git a/package/openssl/openssl-do-not-build-docs.patch b/package/openssl/openssl-001-do-not-build-docs.patch
similarity index 100%
rename from package/openssl/openssl-do-not-build-docs.patch
rename to package/openssl/openssl-001-do-not-build-docs.patch
diff --git a/package/openssl/openssl-dont-force-large-file.patch b/package/openssl/openssl-002-dont-force-large-file.patch
similarity index 100%
rename from package/openssl/openssl-dont-force-large-file.patch
rename to package/openssl/openssl-002-dont-force-large-file.patch
diff --git a/package/openssl/openssl-003-CVE-2013-6449.patch b/package/openssl/openssl-003-CVE-2013-6449.patch
new file mode 100644
index 0000000..034da7d
--- /dev/null
+++ b/package/openssl/openssl-003-CVE-2013-6449.patch
@@ -0,0 +1,34 @@
+https://bugs.gentoo.org/494816
+https://bugzilla.redhat.com/show_bug.cgi?id=1045363
+http://rt.openssl.org/Ticket/Display.html?id=3200&user=guest&pass=guest
+
+From ca989269a2876bae79393bd54c3e72d49975fc75 Mon Sep 17 00:00:00 2001
+From: "Dr. Stephen Henson" <steve@openssl.org>
+Date: Thu, 19 Dec 2013 14:37:39 +0000
+Subject: [PATCH] Use version in SSL_METHOD not SSL structure.
+
+When deciding whether to use TLS 1.2 PRF and record hash algorithms
+use the version number in the corresponding SSL_METHOD structure
+instead of the SSL structure. The SSL structure version is sometimes
+inaccurate. Note: OpenSSL 1.0.2 and later effectively do this already.
+(CVE-2013-6449)
+---
+ ssl/s3_lib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ssl/s3_lib.c b/ssl/s3_lib.c
+index bf832bb..c4ef273 100644
+--- a/ssl/s3_lib.c
++++ b/ssl/s3_lib.c
+@@ -4286,7 +4286,7 @@ need to go to SSL_ST_ACCEPT.
+ long ssl_get_algorithm2(SSL *s)
+ 	{
+ 	long alg2 = s->s3->tmp.new_cipher->algorithm2;
+-	if (TLS1_get_version(s) >= TLS1_2_VERSION &&
++	if (s->method->version == TLS1_2_VERSION &&
+ 	    alg2 == (SSL_HANDSHAKE_MAC_DEFAULT|TLS1_PRF))
+ 		return SSL_HANDSHAKE_MAC_SHA256 | TLS1_PRF_SHA256;
+ 	return alg2;
+-- 
+1.8.4.3
+
-- 
1.8.3.2
