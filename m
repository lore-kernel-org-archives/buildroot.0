From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  1 Nov 2018 20:15:04 +0200
Subject: [Buildroot] [PATCH] lua-curl: fix build with libcurl 7.62.0
Message-ID: <6fc47b7d2219db0c3ede0ab64d207c62bfca285c.1541096104.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The last libcurl bump changed error code definitions in a way that
breaks lua-curl build. Add a patch to fix that.

Fixes:
http://autobuild.buildroot.net/results/fa6/fa6e289162124b3e079c4a2d9c3f00910c8cc063/
http://autobuild.buildroot.net/results/7b9/7b962a63630abaed21d99f719c1bd710ec4d4b28/
http://autobuild.buildroot.net/results/c5b/c5b2a7f21259bbf79861bd95a2d7ca055920bf09/

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-Fix-build-with-curl-7.62.0.patch     | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch

diff --git a/package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch b/package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch
new file mode 100644
index 000000000000..456afb30f79a
--- /dev/null
+++ b/package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch
@@ -0,0 +1,58 @@
+From 4e3764ecf2b2c3f62475579fee6af4a753729f07 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 1 Nov 2018 19:12:20 +0200
+Subject: [PATCH] Fix build with curl 7.62.0
+
+Fixes #134.
+
+curl 7.62.0 deprecates the CURLE_SSL_CACERT error code, and unifies it
+with CURLE_PEER_FAILED_VERIFICATION. Adjust the errors list to match.
+
+This fixes the following build failure:
+
+src/lcerr_easy.h: In function 'lcurl_err_easy_mnemo':
+src/lcerror.c:32:22: error: duplicate case value
+ #define ERR_ENTRY(E) case CURLE_##E: return #E;
+                      ^
+src/lcerr_easy.h:74:1: note: in expansion of macro 'ERR_ENTRY'
+ ERR_ENTRY ( SSL_CACERT               )
+ ^~~~~~~~~
+src/lcerror.c:32:22: note: previously used here
+ #define ERR_ENTRY(E) case CURLE_##E: return #E;
+                      ^
+src/lcerr_easy.h:65:1: note: in expansion of macro 'ERR_ENTRY'
+ ERR_ENTRY ( PEER_FAILED_VERIFICATION )
+ ^~~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/Lua-cURL/Lua-cURLv3/pull/136
+
+diff --git a/src/lcerr_easy.h b/src/lcerr_easy.h
+index 94ad143c3bfe..895c6d87d72f 100644
+--- a/Lua-cURLv3-0.3.7/src/lcerr_easy.h
++++ b/Lua-cURLv3-0.3.7/src/lcerr_easy.h
+@@ -62,7 +62,11 @@ ERR_ENTRY ( UNKNOWN_TELNET_OPTION    ) /* User specified an unknown option */
+ #endif
+ ERR_ENTRY ( TELNET_OPTION_SYNTAX     )
+ ERR_ENTRY ( OBSOLETE50               )
++#if LCURL_CURL_VER_GE(7,62,0)
++ERR_ENTRY ( OBSOLETE51               )
++#else
+ ERR_ENTRY ( PEER_FAILED_VERIFICATION )
++#endif
+ ERR_ENTRY ( GOT_NOTHING              )
+ ERR_ENTRY ( SSL_ENGINE_NOTFOUND      )
+ ERR_ENTRY ( SSL_ENGINE_SETFAILED     )
+@@ -71,7 +75,11 @@ ERR_ENTRY ( RECV_ERROR               )
+ ERR_ENTRY ( OBSOLETE57               )
+ ERR_ENTRY ( SSL_CERTPROBLEM          )
+ ERR_ENTRY ( SSL_CIPHER               )
++#if LCURL_CURL_VER_GE(7,62,0)
++ERR_ENTRY ( PEER_FAILED_VERIFICATION )
++#else
+ ERR_ENTRY ( SSL_CACERT               )
++#endif
+ ERR_ENTRY ( BAD_CONTENT_ENCODING     )
+ ERR_ENTRY ( LDAP_INVALID_URL         )
+ ERR_ENTRY ( FILESIZE_EXCEEDED        )
-- 
2.19.1
