From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Dec 2020 15:22:19 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.74.0
Message-ID: <d29e572b126866f1a91ea9ef1befceff4744f01c.1608816139.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes security issues:

CVE-2020-8286: Inferior OCSP verification

CVE-2020-8285: FTP wildcard stack overflow

CVE-2020-8284: trusting FTP PASV responses

Drop upstream patch.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ix-build-with-disabled-proxy-support.patch | 46 -------------------
 package/libcurl/libcurl.hash                  |  4 +-
 package/libcurl/libcurl.mk                    |  2 +-
 3 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 package/libcurl/0001-libssh2-fix-build-with-disabled-proxy-support.patch

diff --git a/package/libcurl/0001-libssh2-fix-build-with-disabled-proxy-support.patch b/package/libcurl/0001-libssh2-fix-build-with-disabled-proxy-support.patch
deleted file mode 100644
index 180f243581a1..000000000000
--- a/package/libcurl/0001-libssh2-fix-build-with-disabled-proxy-support.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 75d2b1787b3253784a94c66016829acf1f442526 Mon Sep 17 00:00:00 2001
-Message-Id: <75d2b1787b3253784a94c66016829acf1f442526.1603688719.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Mon, 26 Oct 2020 06:56:49 +0200
-Subject: [PATCH] libssh2: fix build with disabled proxy support
-
-Build breaks because the http_proxy field is missing:
-
-vssh/libssh2.c: In function 'ssh_connect':
-vssh/libssh2.c:3119:10: error: 'struct connectdata' has no member named 'http_proxy'
-   if(conn->http_proxy.proxytype == CURLPROXY_HTTPS) {
-		  ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/curl/curl/pull/6125
-
- lib/vssh/libssh2.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/lib/vssh/libssh2.c b/lib/vssh/libssh2.c
-index 6c6db049bf5a..74cd5d887549 100644
---- a/lib/vssh/libssh2.c
-+++ b/lib/vssh/libssh2.c
-@@ -3094,6 +3094,7 @@ static CURLcode ssh_connect(struct connectdata *conn, bool *done)
-     return CURLE_FAILED_INIT;
-   }
- 
-+#ifndef CURL_DISABLE_PROXY
-   if(conn->http_proxy.proxytype == CURLPROXY_HTTPS) {
-     /*
-      * This crazy union dance is here to avoid assigning a void pointer a
-@@ -3132,7 +3133,9 @@ static CURLcode ssh_connect(struct connectdata *conn, bool *done)
-     libssh2_session_callback_set(ssh->ssh_session,
-                                  LIBSSH2_CALLBACK_SEND, sshsend.sendp);
-   }
--  else if(conn->handler->protocol & CURLPROTO_SCP) {
-+  else
-+#endif /* CURL_DISABLE_PROXY */
-+  if(conn->handler->protocol & CURLPROTO_SCP) {
-     conn->recv[FIRSTSOCKET] = scp_recv;
-     conn->send[FIRSTSOCKET] = scp_send;
-   }
--- 
-2.28.0
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 332614d82080..8e851bb90a28 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.73.0.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.74.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  7c4c7ca4ea88abe00fea4740dcf81075c031b1d0bb23aff2d5efde20a3c2408a  curl-7.73.0.tar.xz
+sha256  999d5f2c403cf6e25d58319fdd596611e455dd195208746bc6e6d197a77e878b  curl-7.74.0.tar.xz
 sha256  db3c4a3b3695a0f317a0c5176acd2f656d18abc45b3ee78e50935a78eb1e132e  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 74ce3be654a0..9484f41ff080 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.73.0
+LIBCURL_VERSION = 7.74.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.29.2
