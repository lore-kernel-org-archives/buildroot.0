From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 May 2021 14:19:33 +0200
Subject: [Buildroot] [git commit] package/libcurl: security bump to version
 7.77.0
Message-ID: <20210528115121.CA5A187A45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eae15d62c6a857f43d6f21af9a30f38994b3efc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2021-22897: schannel cipher selection surprise
  https://curl.se/docs/CVE-2021-22897.html

- CVE-2021-22898: TELNET stack contents disclosure
  https://curl.se/docs/CVE-2021-22898.html

- CVE-2021-22901: TLS session caching disaster
  https://curl.se/docs/CVE-2021-22901.html

Unconditionally disable the ldap(s) options.  These require external
libraries, but the options were ignored if the needed libraries weren't
available. This is now changed to be a fatal error since

https://github.com/curl/curl/commit/dae382a1a1481a94b708c82d5aa9fa7253084160

Additionally, add a post-7.77.0 upstream patch to fix compilation with
bearssl.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998 at free.fr: annotate the patch, that it is a backport]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ove-incorrect-const-on-variable-that-is-m.patch | 32 ++++++++++++++++++++++
 package/libcurl/libcurl.hash                       |  4 +--
 package/libcurl/libcurl.mk                         |  8 ++----
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/package/libcurl/0001-bearssl-remove-incorrect-const-on-variable-that-is-m.patch b/package/libcurl/0001-bearssl-remove-incorrect-const-on-variable-that-is-m.patch
new file mode 100644
index 0000000000..b88791fa45
--- /dev/null
+++ b/package/libcurl/0001-bearssl-remove-incorrect-const-on-variable-that-is-m.patch
@@ -0,0 +1,32 @@
+From a03ea6223950002eba8b1ef0df3133c62f387d6b Mon Sep 17 00:00:00 2001
+From: Michael Forney <mforney@mforney.org>
+Date: Tue, 25 May 2021 23:42:07 -0700
+Subject: [PATCH] bearssl: remove incorrect const on variable that is modified
+
+hostname may be set to NULL later on in this function if it is an
+IP address.
+
+Closes #7133
+
+[peter at korsgaard.com: backported from upstream]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/vtls/bearssl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
+index 7f729713d..40a5e7879 100644
+--- a/lib/vtls/bearssl.c
++++ b/lib/vtls/bearssl.c
+@@ -300,7 +300,7 @@ static CURLcode bearssl_connect_step1(struct Curl_easy *data,
+   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
+   struct ssl_backend_data *backend = connssl->backend;
+   const char * const ssl_cafile = SSL_CONN_CONFIG(CAfile);
+-  const char * const hostname = SSL_HOST_NAME();
++  const char *hostname = SSL_HOST_NAME();
+   const bool verifypeer = SSL_CONN_CONFIG(verifypeer);
+   const bool verifyhost = SSL_CONN_CONFIG(verifyhost);
+   CURLcode ret;
+-- 
+2.20.1
+
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 9ee98f1e13..183321588f 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.76.1.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.77.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  64bb5288c39f0840c07d077e30d9052e1cbb9fa6c2dc52523824cc859e679145  curl-7.76.1.tar.xz
+sha256  0f64582c54282f31c0de9f0a1a596b182776bd4df9a4c4a2a41bbeb54f62594b  curl-7.77.0.tar.xz
 sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index f2cfd72897..53ff9836c1 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.76.1
+LIBCURL_VERSION = 7.77.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -24,7 +24,7 @@ LIBCURL_INSTALL_STAGING = YES
 # generate C code) isn't very useful
 LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
 	--enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug \
-	--disable-libcurl-option
+	--disable-libcurl-option --disable-ldap --disable-ldaps
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
@@ -150,8 +150,6 @@ LIBCURL_CONF_OPTS += \
 	--enable-dict \
 	--enable-gopher \
 	--enable-imap \
-	--enable-ldap \
-	--enable-ldaps \
 	--enable-pop3 \
 	--enable-rtsp \
 	--enable-smb \
@@ -163,8 +161,6 @@ LIBCURL_CONF_OPTS += \
 	--disable-dict \
 	--disable-gopher \
 	--disable-imap \
-	--disable-ldap \
-	--disable-ldaps \
 	--disable-pop3 \
 	--disable-rtsp \
 	--disable-smb \
