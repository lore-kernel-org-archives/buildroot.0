From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 25 Jan 2019 17:04:12 +0100
Subject: [Buildroot] [PATCH 02/10] package/nut: Add support for openssl 1.1.x
In-Reply-To: <20190125160420.10932-1-patrick.havelange@essensium.com>
References: <20190125160420.10932-1-patrick.havelange@essensium.com>
Message-ID: <20190125160420.10932-2-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim4j@gmail.com>

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

---
Changes v6:
  - use the actual upstream patch
  - drop unrelated patch
---
 ...Add-compatibility-with-openssl-1.1.0.patch | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch

diff --git a/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch b/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch
new file mode 100644
index 0000000000..65b7f2d6f7
--- /dev/null
+++ b/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch
@@ -0,0 +1,75 @@
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
+Upstream: https://github.com/networkupstools/nut/pull/558/
+Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
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
-- 
2.17.1
