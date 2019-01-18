From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri, 18 Jan 2019 03:00:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/nut: Add support for openssl 1.1.x
Message-ID: <20190118010011.22258-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches used from:

    https://github.com/openwrt/packages/tree/master/net/nut/patches

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 ...0003-Add-compatibility-with-openssl-1.1.0.patch | 73 ++++++++++++++++++++++
 package/nut/0004-Fix-check-for-empty-string.patch  | 25 ++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch
 create mode 100644 package/nut/0004-Fix-check-for-empty-string.patch

diff --git a/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch b/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch
new file mode 100644
index 0000000000..f75f1322a1
--- /dev/null
+++ b/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch
@@ -0,0 +1,73 @@
+From fcbf18c92918ce5e81d0aab62a7aed5c2245ea4d Mon Sep 17 00:00:00 2001
+From: Eneas U de Queiroz <cote2004-github@yahoo.com>
+Date: Fri, 1 Jun 2018 11:17:28 -0300
+Subject: [PATCH 1/2] Add compatibility with openssl 1.1.0
+
+Minor adjustments were needed:
+* Openssl 1.1 libs do not need to be initialized.
+* TLSv*_method became TLS_*_method.
+
+Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
+---
+ clients/upsclient.c        | 5 ++++-
+ m4/nut_check_libopenssl.m4 | 2 +-
+ server/netssl.c            | 7 +++++--
+ 3 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/clients/upsclient.c b/clients/upsclient.c
+index b90587b0..053d60fb 100644
+--- a/clients/upsclient.c
++++ b/clients/upsclient.c
+@@ -316,10 +316,13 @@ int upscli_init(int certverify, const char *certpath,
+ 	
+ #ifdef WITH_OPENSSL
+ 	
++# if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	SSL_library_init();
+ 	SSL_load_error_strings();
++#  define TLS_client_method TLSv1_client_method
++# endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
+ 
+-	ssl_method = TLSv1_client_method();
++	ssl_method = TLS_client_method();
+ 
+ 	if (!ssl_method) {
+ 		return 0;
+diff --git a/m4/nut_check_libopenssl.m4 b/m4/nut_check_libopenssl.m4
+index 1b875077..7eb401cd 100644
+--- a/m4/nut_check_libopenssl.m4
++++ b/m4/nut_check_libopenssl.m4
+@@ -58,7 +58,7 @@ if test -z "${nut_have_libopenssl_seen}"; then
+ 
+ 	dnl check if openssl is usable
+ 	AC_CHECK_HEADERS(openssl/ssl.h, [nut_have_openssl=yes], [nut_have_openssl=no], [AC_INCLUDES_DEFAULT])
+-	AC_CHECK_FUNCS(SSL_library_init, [], [nut_have_openssl=no])
++	AC_CHECK_FUNCS(SSL_CTX_new, [], [nut_have_openssl=no])
+ 
+ 	if test "${nut_have_openssl}" = "yes"; then
+ 		nut_with_ssl="yes"
+diff --git a/server/netssl.c b/server/netssl.c
+index c2f40989..0289e296 100644
+--- a/server/netssl.c
++++ b/server/netssl.c
+@@ -387,12 +387,15 @@ void ssl_init(void)
+ 
+ #ifdef WITH_OPENSSL
+ 
++# if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	SSL_load_error_strings();
+ 	SSL_library_init();
++#  define TLS_server_method TLSv1_server_method
++# endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
+ 
+-	if ((ssl_method = TLSv1_server_method()) == NULL) {
++	if ((ssl_method = TLS_server_method()) == NULL) {
+ 		ssl_debug();
+-		fatalx(EXIT_FAILURE, "TLSv1_server_method failed");
++		fatalx(EXIT_FAILURE, "TLS_server_method failed");
+ 	}
+ 
+ 	if ((ssl_ctx = SSL_CTX_new(ssl_method)) == NULL) {
+-- 
+2.16.1
+
diff --git a/package/nut/0004-Fix-check-for-empty-string.patch b/package/nut/0004-Fix-check-for-empty-string.patch
new file mode 100644
index 0000000000..2f4c72409d
--- /dev/null
+++ b/package/nut/0004-Fix-check-for-empty-string.patch
@@ -0,0 +1,25 @@
+From 2ef929da38232af63ba53074ca97e95ae4faf912 Mon Sep 17 00:00:00 2001
+From: Arjen de Korte <build+lede@de-korte.org>
+Date: Tue, 28 Nov 2017 22:01:41 +0100
+Subject: [PATCH 2/2] Fix check for empty string
+
+---
+ clients/upssched.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/clients/upssched.c b/clients/upssched.c
+index 97b3ed42..3fdf118e 100644
+--- a/clients/upssched.c
++++ b/clients/upssched.c
+@@ -794,7 +794,7 @@ static void parse_at(const char *ntype, const char *un, const char *cmd,
+ 	}
+ 
+ 	if (!strcmp(cmd, "EXECUTE")) {
+-		if (ca1 == '\0') {
++		if (ca1[0] == '\0') {
+ 			upslogx(LOG_ERR, "Empty EXECUTE command argument");
+ 			return;
+ 		}
+-- 
+2.16.1
+
-- 
2.14.1
