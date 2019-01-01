From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  1 Jan 2019 16:21:21 +0100
Subject: [Buildroot] [PATCH] lua-curl: bump to version 0.3.9
Message-ID: <20190101152121.24282-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-Fix-build-with-curl-7.62.0.patch     | 58 -------------------
 .../0002-Fix.-Removed-invalid-semicolon.patch | 28 ---------
 package/lua-curl/lua-curl.hash                |  4 +-
 package/lua-curl/lua-curl.mk                  |  4 +-
 4 files changed, 4 insertions(+), 90 deletions(-)
 delete mode 100644 package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch
 delete mode 100644 package/lua-curl/0002-Fix.-Removed-invalid-semicolon.patch

diff --git a/package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch b/package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch
deleted file mode 100644
index f1c1f2e21..000000000
--- a/package/lua-curl/0001-Fix-build-with-curl-7.62.0.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4e3764ecf2b2c3f62475579fee6af4a753729f07 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 1 Nov 2018 19:12:20 +0200
-Subject: [PATCH] Fix build with curl 7.62.0
-
-Fixes #134.
-
-curl 7.62.0 deprecates the CURLE_SSL_CACERT error code, and unifies it
-with CURLE_PEER_FAILED_VERIFICATION. Adjust the errors list to match.
-
-This fixes the following build failure:
-
-src/lcerr_easy.h: In function 'lcurl_err_easy_mnemo':
-src/lcerror.c:32:22: error: duplicate case value
- #define ERR_ENTRY(E) case CURLE_##E: return #E;
-                      ^
-src/lcerr_easy.h:74:1: note: in expansion of macro 'ERR_ENTRY'
- ERR_ENTRY ( SSL_CACERT               )
- ^~~~~~~~~
-src/lcerror.c:32:22: note: previously used here
- #define ERR_ENTRY(E) case CURLE_##E: return #E;
-                      ^
-src/lcerr_easy.h:65:1: note: in expansion of macro 'ERR_ENTRY'
- ERR_ENTRY ( PEER_FAILED_VERIFICATION )
- ^~~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/Lua-cURL/Lua-cURLv3/pull/136
-
-diff --git a/src/lcerr_easy.h b/src/lcerr_easy.h
-index 94ad143c3bfe..895c6d87d72f 100644
---- a/Lua-cURLv3-0.3.8/src/lcerr_easy.h
-+++ b/Lua-cURLv3-0.3.8/src/lcerr_easy.h
-@@ -62,7 +62,11 @@ ERR_ENTRY ( UNKNOWN_TELNET_OPTION    ) /* User specified an unknown option */
- #endif
- ERR_ENTRY ( TELNET_OPTION_SYNTAX     )
- ERR_ENTRY ( OBSOLETE50               )
-+#if LCURL_CURL_VER_GE(7,62,0)
-+ERR_ENTRY ( OBSOLETE51               )
-+#else
- ERR_ENTRY ( PEER_FAILED_VERIFICATION )
-+#endif
- ERR_ENTRY ( GOT_NOTHING              )
- ERR_ENTRY ( SSL_ENGINE_NOTFOUND      )
- ERR_ENTRY ( SSL_ENGINE_SETFAILED     )
-@@ -71,7 +75,11 @@ ERR_ENTRY ( RECV_ERROR               )
- ERR_ENTRY ( OBSOLETE57               )
- ERR_ENTRY ( SSL_CERTPROBLEM          )
- ERR_ENTRY ( SSL_CIPHER               )
-+#if LCURL_CURL_VER_GE(7,62,0)
-+ERR_ENTRY ( PEER_FAILED_VERIFICATION )
-+#else
- ERR_ENTRY ( SSL_CACERT               )
-+#endif
- ERR_ENTRY ( BAD_CONTENT_ENCODING     )
- ERR_ENTRY ( LDAP_INVALID_URL         )
- ERR_ENTRY ( FILESIZE_EXCEEDED        )
diff --git a/package/lua-curl/0002-Fix.-Removed-invalid-semicolon.patch b/package/lua-curl/0002-Fix.-Removed-invalid-semicolon.patch
deleted file mode 100644
index 288f5a137..000000000
--- a/package/lua-curl/0002-Fix.-Removed-invalid-semicolon.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 39aeb8aa6f3a379918c58560d58f243fa7ec2b8b Mon Sep 17 00:00:00 2001
-From: Anderson Silva <anderson.silva@cujo.com>
-Date: Wed, 11 Jul 2018 11:59:33 -0700
-Subject: [PATCH] Fix. Removed invalid semicolon
-
-[Thomas: backported from upstream commit
-3f0489157d2f1e3a90a32f8fb31ade6e02296367]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/lceasy.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Lua-cURLv3-0.3.8/src/lceasy.h b/Lua-cURLv3-0.3.8/src/lceasy.h
-index d6ccefd..7c95668 100644
---- a/Lua-cURLv3-0.3.8/src/lceasy.h
-+++ b/Lua-cURLv3-0.3.8/src/lceasy.h
-@@ -47,7 +47,7 @@ struct lcurl_multi_tag;
- #define lcurl_multi_t struct lcurl_multi_tag
- #if LCURL_CURL_VER_GE(7,56,0)
- struct lcurl_mime_tag;
--#define lcurl_mime_t struct lcurl_mime_tag;
-+#define lcurl_mime_t struct lcurl_mime_tag
- #endif
- #endif
- 
--- 
-2.20.1
-
diff --git a/package/lua-curl/lua-curl.hash b/package/lua-curl/lua-curl.hash
index c2497bc0a..49cd6653a 100644
--- a/package/lua-curl/lua-curl.hash
+++ b/package/lua-curl/lua-curl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 ab07d40dad98bbd025b02e3bde397d582fae2b41451d748925120e3aa9192043  lua-curl-0.3.8-2.src.rock
-sha256 264807cb89f960808fed1ef9922aed9d9f8437764e836d8e594e66db7be9c54c  Lua-cURLv3-0.3.8/LICENSE
+sha256 ec761e800cec630ff0e78f100e1a61246c35823073014de65f1af0a85bfe1dc0  lua-curl-0.3.9-1.src.rock
+sha256 264807cb89f960808fed1ef9922aed9d9f8437764e836d8e594e66db7be9c54c  Lua-cURLv3-0.3.9/LICENSE
diff --git a/package/lua-curl/lua-curl.mk b/package/lua-curl/lua-curl.mk
index 6ac6351bc..9fa9408a4 100644
--- a/package/lua-curl/lua-curl.mk
+++ b/package/lua-curl/lua-curl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUA_CURL_VERSION_UPSTREAM = 0.3.8
-LUA_CURL_VERSION = $(LUA_CURL_VERSION_UPSTREAM)-2
+LUA_CURL_VERSION_UPSTREAM = 0.3.9
+LUA_CURL_VERSION = $(LUA_CURL_VERSION_UPSTREAM)-1
 LUA_CURL_SUBDIR = Lua-cURLv3-$(LUA_CURL_VERSION_UPSTREAM)
 LUA_CURL_LICENSE = MIT
 LUA_CURL_LICENSE_FILES = $(LUA_CURL_SUBDIR)/LICENSE
-- 
2.17.1
