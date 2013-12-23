From: =?UTF-8?q?Tilman=20Keskin=C3=B6z?= <arved@arved.at>
Date: Mon, 23 Dec 2013 15:10:06 +0100
Subject: [Buildroot] [PATCH 1/1] Fix regression reported in Debian bug 729480
Message-ID: <1387807806-17014-1-git-send-email-arved@arved.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

References:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=729480
http://redmine.lighttpd.net/projects/lighttpd/repository/revisions/2925/diff/
Signed-off-by: Tilman Keskin?z <arved@arved.at>
---
 package/lighttpd/lighttpd-05-fix_ssl_sni.patch | 34 +++++++++++++++++---------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/package/lighttpd/lighttpd-05-fix_ssl_sni.patch b/package/lighttpd/lighttpd-05-fix_ssl_sni.patch
index 63094d8..525aaf7 100644
--- a/package/lighttpd/lighttpd-05-fix_ssl_sni.patch
+++ b/package/lighttpd/lighttpd-05-fix_ssl_sni.patch
@@ -1,6 +1,6 @@
-commit 1af871fcef97574c71870309d572d6b1026ee605
+commit 0fee8a0d90ffa6c5bde25d769cc578d72e4972ca
 Author: Stefan B?hler <stbuehler@web.de>
-Date:   Tue Nov 5 15:29:07 2013 +0000
+Date:   Wed Nov 13 18:29:09 2013 +0100
 
     [ssl] fix SNI handling; only use key+cert+verify-client from SNI specific config (fixes #2525, CVE-2013-4508)
     
@@ -9,11 +9,9 @@ Date:   Tue Nov 5 15:29:07 2013 +0000
     so enforcing verification for a subset of SNI names doesn't actually
     protect those.
     
-    From: Stefan B?hler <stbuehler@web.de>
-    
-    git-svn-id: svn://svn.lighttpd.net/lighttpd/branches/lighttpd-1.4.x at 2913 152afb58-edef-0310-8abb-c4023f1b3aa9
+    Also session resumption can circumvent the verify-client enforce,
+    if it isn't enforced in the default context.
 
-diff --git a/NEWS b/NEWS
 diff --git a/src/base.h b/src/base.h
 index 5d79a33..6a8df14 100644
 --- a/src/base.h
@@ -65,9 +63,9 @@ index 7408ed0..18b36b3 100644
 +#endif
  			} else if (buffer_is_equal_string(du->key, CONST_STR_LEN("ssl.honor-cipher-order"))) {
  				PATCH(ssl_honor_cipher_order);
- 			} else if (buffer_is_equal_string(du->key, CONST_STR_LEN("ssl.use-sslv2"))) {
+ 			} else if (buffer_is_equal_string(du->key, CONST_STR_LEN("ssl.empty-fragments"))) {
 diff --git a/src/network.c b/src/network.c
-index cb0564f..f6d890b 100644
+index cb0564f..57facab 100644
 --- a/src/network.c
 +++ b/src/network.c
 @@ -112,20 +112,46 @@ static int network_ssl_servername_callback(SSL *ssl, int *al, server *srv) {
@@ -246,7 +244,7 @@ index cb0564f..f6d890b 100644
  
  		if (srv->ssl_is_init == 0) {
  			SSL_load_error_strings();
-@@ -606,6 +712,29 @@ int network_init(server *srv) {
+@@ -606,12 +712,43 @@ int network_init(server *srv) {
  			}
  		}
  
@@ -276,7 +274,21 @@ index cb0564f..f6d890b 100644
  		if (NULL == (s->ssl_ctx = SSL_CTX_new(SSLv23_server_method()))) {
  			log_error_write(srv, __FILE__, __LINE__, "ss", "SSL:",
  					ERR_error_string(ERR_get_error(), NULL));
-@@ -721,45 +850,42 @@ int network_init(server *srv) {
+ 			return -1;
+ 		}
+ 
++		/* completely useless identifier; required for client cert verification to work with sessions */
++		if (0 == SSL_CTX_set_session_id_context(s->ssl_ctx, (const unsigned char*) CONST_STR_LEN("lighttpd"))) {
++			log_error_write(srv, __FILE__, __LINE__, "ss:s", "SSL:",
++				"failed to set session context",
++				ERR_error_string(ERR_get_error(), NULL));
++			return -1;
++		}
++
+ 		if (s->ssl_empty_fragments) {
+ #ifdef SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS
+ 			ssloptions &= ~SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS;
+@@ -721,45 +858,42 @@ int network_init(server *srv) {
  #endif
  #endif
  
@@ -345,7 +357,7 @@ index cb0564f..f6d890b 100644
  			log_error_write(srv, __FILE__, __LINE__, "ssb", "SSL:",
  					ERR_error_string(ERR_get_error(), NULL), s->ssl_pemfile);
  			return -1;
-@@ -856,7 +982,6 @@ int network_init(server *srv) {
+@@ -856,7 +990,6 @@ int network_init(server *srv) {
  	for (i = 1; i < srv->config_context->used; i++) {
  		data_config *dc = (data_config *)srv->config_context->data[i];
  		specific_config *s = srv->config_storage[i];
-- 
1.8.3.2
