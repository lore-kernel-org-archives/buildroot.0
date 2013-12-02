From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 02 Dec 2013 14:51:41 +0800
Subject: [Buildroot] [PATCH] lighttpd: apply security patches for
	lighttpd-1.4.33
Message-ID: <1385967101.8380.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply security patches for lighttpd-1.4.33.
Also rename these patches to follow buildroot's naming scheme.

lighttpd-03-fix_fam_use_after_free.patch:
http://download.lighttpd.net/lighttpd/security/lighttpd-1.4.33_fix_fam_use_after_free.patch

lighttpd-04-fix_setuid.patch:
http://download.lighttpd.net/lighttpd/security/lighttpd-1.4.33_fix_setuid.patch

lighttpd-05-fix_ssl_sni.patch:
http://download.lighttpd.net/lighttpd/security/lighttpd-1.4.33_fix_ssl_sni.patch

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 .../lighttpd-03-fix_fam_use_after_free.patch       |  22 ++
 package/lighttpd/lighttpd-04-fix_setuid.patch      |  43 +++
 package/lighttpd/lighttpd-05-fix_ssl_sni.patch     | 369 +++++++++++++++++++++
 3 files changed, 434 insertions(+)
 create mode 100644 package/lighttpd/lighttpd-03-fix_fam_use_after_free.patch
 create mode 100644 package/lighttpd/lighttpd-04-fix_setuid.patch
 create mode 100644 package/lighttpd/lighttpd-05-fix_ssl_sni.patch

diff --git a/package/lighttpd/lighttpd-03-fix_fam_use_after_free.patch b/package/lighttpd/lighttpd-03-fix_fam_use_after_free.patch
new file mode 100644
index 0000000..9d0e78b
--- /dev/null
+++ b/package/lighttpd/lighttpd-03-fix_fam_use_after_free.patch
@@ -0,0 +1,22 @@
+commit ae1335503a8f63489f847668ee37df8470a2ab0a
+Author: Stefan B?hler <stbuehler@web.de>
+Date:   Wed Nov 13 11:43:28 2013 +0000
+
+    [stat-cache] FAM: fix use after free (CVE-2013-4560)
+    
+    From: Stefan B?hler <stbuehler@web.de>
+    
+    git-svn-id: svn://svn.lighttpd.net/lighttpd/branches/lighttpd-1.4.x at 2921 152afb58-edef-0310-8abb-c4023f1b3aa9
+
+diff --git a/src/stat_cache.c b/src/stat_cache.c
+index e995f3b..924f4dc 100644
+--- a/src/stat_cache.c
++++ b/src/stat_cache.c
+@@ -648,6 +648,7 @@ handler_t stat_cache_get_entry(server *srv, connection *con, buffer *name, stat_
+ 						FamErrlist[FAMErrno]);
+ 
+ 				fam_dir_entry_free(fam_dir);
++				fam_dir = NULL;
+ 			} else {
+ 				int osize = 0;
+ 
diff --git a/package/lighttpd/lighttpd-04-fix_setuid.patch b/package/lighttpd/lighttpd-04-fix_setuid.patch
new file mode 100644
index 0000000..cb7f563
--- /dev/null
+++ b/package/lighttpd/lighttpd-04-fix_setuid.patch
@@ -0,0 +1,43 @@
+commit 99cddff73ab4023186bcfca54cbb73051140e15d
+Author: Stefan B?hler <stbuehler@web.de>
+Date:   Wed Nov 13 11:43:33 2013 +0000
+
+    [core] check success of setuid,setgid,setgroups (CVE-2013-4559)
+    
+    From: Stefan B?hler <stbuehler@web.de>
+    
+    git-svn-id: svn://svn.lighttpd.net/lighttpd/branches/lighttpd-1.4.x at 2923 152afb58-edef-0310-8abb-c4023f1b3aa9
+
+diff --git a/src/server.c b/src/server.c
+index 2d825bb..e2b42eb 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -820,8 +820,14 @@ int main (int argc, char **argv) {
+ 		 * to /etc/group
+ 		 * */
+ 		if (NULL != grp) {
+-			setgid(grp->gr_gid);
+-			setgroups(0, NULL);
++			if (-1 == setgid(grp->gr_gid)) {
++				log_error_write(srv, __FILE__, __LINE__, "ss", "setgid failed: ", strerror(errno));
++				return -1;
++			}
++			if (-1 == setgroups(0, NULL)) {
++				log_error_write(srv, __FILE__, __LINE__, "ss", "setgroups failed: ", strerror(errno));
++				return -1;
++			}
+ 			if (srv->srvconf.username->used) {
+ 				initgroups(srv->srvconf.username->ptr, grp->gr_gid);
+ 			}
+@@ -844,7 +850,10 @@ int main (int argc, char **argv) {
+ #ifdef HAVE_PWD_H
+ 		/* drop root privs */
+ 		if (NULL != pwd) {
+-			setuid(pwd->pw_uid);
++			if (-1 == setuid(pwd->pw_uid)) {
++				log_error_write(srv, __FILE__, __LINE__, "ss", "setuid failed: ", strerror(errno));
++				return -1;
++			}
+ 		}
+ #endif
+ #if defined(HAVE_SYS_PRCTL_H) && defined(PR_SET_DUMPABLE)
diff --git a/package/lighttpd/lighttpd-05-fix_ssl_sni.patch b/package/lighttpd/lighttpd-05-fix_ssl_sni.patch
new file mode 100644
index 0000000..63094d8
--- /dev/null
+++ b/package/lighttpd/lighttpd-05-fix_ssl_sni.patch
@@ -0,0 +1,369 @@
+commit 1af871fcef97574c71870309d572d6b1026ee605
+Author: Stefan B?hler <stbuehler@web.de>
+Date:   Tue Nov 5 15:29:07 2013 +0000
+
+    [ssl] fix SNI handling; only use key+cert+verify-client from SNI specific config (fixes #2525, CVE-2013-4508)
+    
+    pull all ssl.ca-file values into all SSL_CTXs, but use only the local
+    ssl.ca-file for verify-client; correct SNI name is no requirement,
+    so enforcing verification for a subset of SNI names doesn't actually
+    protect those.
+    
+    From: Stefan B?hler <stbuehler@web.de>
+    
+    git-svn-id: svn://svn.lighttpd.net/lighttpd/branches/lighttpd-1.4.x at 2913 152afb58-edef-0310-8abb-c4023f1b3aa9
+
+diff --git a/NEWS b/NEWS
+diff --git a/src/base.h b/src/base.h
+index 5d79a33..6a8df14 100644
+--- a/src/base.h
++++ b/src/base.h
+@@ -320,7 +320,11 @@ typedef struct {
+ 	off_t *global_bytes_per_second_cnt_ptr; /*  */
+ 
+ #ifdef USE_OPENSSL
+-	SSL_CTX *ssl_ctx;
++	SSL_CTX *ssl_ctx; /* not patched */
++	/* SNI per host: with COMP_SERVER_SOCKET, COMP_HTTP_SCHEME, COMP_HTTP_HOST */
++	EVP_PKEY *ssl_pemfile_pkey;
++	X509 *ssl_pemfile_x509;
++	STACK_OF(X509_NAME) *ssl_ca_file_cert_names;
+ #endif
+ } specific_config;
+ 
+diff --git a/src/configfile.c b/src/configfile.c
+index 7408ed0..18b36b3 100644
+--- a/src/configfile.c
++++ b/src/configfile.c
+@@ -339,9 +339,13 @@ int config_setup_connection(server *srv, connection *con) {
+ 
+ 	PATCH(ssl_pemfile);
+ #ifdef USE_OPENSSL
+-	PATCH(ssl_ctx);
++	PATCH(ssl_pemfile_x509);
++	PATCH(ssl_pemfile_pkey);
+ #endif
+ 	PATCH(ssl_ca_file);
++#ifdef USE_OPENSSL
++	PATCH(ssl_ca_file_cert_names);
++#endif
+ 	PATCH(ssl_cipher_list);
+ 	PATCH(ssl_dh_file);
+ 	PATCH(ssl_ec_curve);
+@@ -409,10 +413,14 @@ int config_patch_connection(server *srv, connection *con, comp_key_t comp) {
+ 			} else if (buffer_is_equal_string(du->key, CONST_STR_LEN("ssl.pemfile"))) {
+ 				PATCH(ssl_pemfile);
+ #ifdef USE_OPENSSL
+-				PATCH(ssl_ctx);
++				PATCH(ssl_pemfile_x509);
++				PATCH(ssl_pemfile_pkey);
+ #endif
+ 			} else if (buffer_is_equal_string(du->key, CONST_STR_LEN("ssl.ca-file"))) {
+ 				PATCH(ssl_ca_file);
++#ifdef USE_OPENSSL
++				PATCH(ssl_ca_file_cert_names);
++#endif
+ 			} else if (buffer_is_equal_string(du->key, CONST_STR_LEN("ssl.honor-cipher-order"))) {
+ 				PATCH(ssl_honor_cipher_order);
+ 			} else if (buffer_is_equal_string(du->key, CONST_STR_LEN("ssl.use-sslv2"))) {
+diff --git a/src/network.c b/src/network.c
+index cb0564f..f6d890b 100644
+--- a/src/network.c
++++ b/src/network.c
+@@ -112,20 +112,46 @@ static int network_ssl_servername_callback(SSL *ssl, int *al, server *srv) {
+ 	config_patch_connection(srv, con, COMP_HTTP_SCHEME);
+ 	config_patch_connection(srv, con, COMP_HTTP_HOST);
+ 
+-	if (NULL == con->conf.ssl_ctx) {
+-		/* ssl_ctx <=> pemfile was set <=> ssl_ctx got patched: so this should never happen */
++	if (NULL == con->conf.ssl_pemfile_x509 || NULL == con->conf.ssl_pemfile_pkey) {
++		/* x509/pkey available <=> pemfile was set <=> pemfile got patched: so this should never happen, unless you nest $SERVER["socket"] */
+ 		log_error_write(srv, __FILE__, __LINE__, "ssb", "SSL:",
+-			"null SSL_CTX for TLS server name", con->tlsext_server_name);
++			"no certificate/private key for TLS server name", con->tlsext_server_name);
+ 		return SSL_TLSEXT_ERR_ALERT_FATAL;
+ 	}
+ 
+-	/* switch to new SSL_CTX in reaction to a client's server_name extension */
+-	if (con->conf.ssl_ctx != SSL_set_SSL_CTX(ssl, con->conf.ssl_ctx)) {
+-		log_error_write(srv, __FILE__, __LINE__, "ssb", "SSL:",
+-			"failed to set SSL_CTX for TLS server name", con->tlsext_server_name);
++	/* first set certificate! setting private key checks whether certificate matches it */
++	if (!SSL_use_certificate(ssl, con->conf.ssl_pemfile_x509)) {
++		log_error_write(srv, __FILE__, __LINE__, "ssb:s", "SSL:",
++			"failed to set certificate for TLS server name", con->tlsext_server_name,
++			ERR_error_string(ERR_get_error(), NULL));
++		return SSL_TLSEXT_ERR_ALERT_FATAL;
++	}
++
++	if (!SSL_use_PrivateKey(ssl, con->conf.ssl_pemfile_pkey)) {
++		log_error_write(srv, __FILE__, __LINE__, "ssb:s", "SSL:",
++			"failed to set private key for TLS server name", con->tlsext_server_name,
++			ERR_error_string(ERR_get_error(), NULL));
+ 		return SSL_TLSEXT_ERR_ALERT_FATAL;
+ 	}
+ 
++	if (con->conf.ssl_verifyclient) {
++		if (NULL == con->conf.ssl_ca_file_cert_names) {
++			log_error_write(srv, __FILE__, __LINE__, "ssb:s", "SSL:",
++				"can't verify client without ssl.ca-file for TLS server name", con->tlsext_server_name,
++				ERR_error_string(ERR_get_error(), NULL));
++			return SSL_TLSEXT_ERR_ALERT_FATAL;
++		}
++
++		SSL_set_client_CA_list(ssl, SSL_dup_CA_list(con->conf.ssl_ca_file_cert_names));
++		/* forcing verification here is really not that useful - a client could just connect without SNI */
++		SSL_set_verify(
++			ssl,
++			SSL_VERIFY_PEER | (con->conf.ssl_verifyclient_enforce ? SSL_VERIFY_FAIL_IF_NO_PEER_CERT : 0),
++			NULL
++		);
++		SSL_set_verify_depth(ssl, con->conf.ssl_verifyclient_depth);
++	}
++
+ 	return SSL_TLSEXT_ERR_OK;
+ }
+ #endif
+@@ -491,9 +517,100 @@ typedef enum {
+ 	NETWORK_BACKEND_SOLARIS_SENDFILEV
+ } network_backend_t;
+ 
++#ifdef USE_OPENSSL
++static X509* x509_load_pem_file(server *srv, const char *file) {
++	BIO *in;
++	X509 *x = NULL;
++
++	in = BIO_new(BIO_s_file());
++	if (NULL == in) {
++		log_error_write(srv, __FILE__, __LINE__, "S", "SSL: BIO_new(BIO_s_file()) failed");
++		goto error;
++	}
++
++	if (BIO_read_filename(in,file) <= 0) {
++		log_error_write(srv, __FILE__, __LINE__, "SSS", "SSL: BIO_read_filename('", file,"') failed");
++		goto error;
++	}
++	x = PEM_read_bio_X509(in, NULL, NULL, NULL);
++
++	if (NULL == x) {
++		log_error_write(srv, __FILE__, __LINE__, "SSS", "SSL: couldn't read X509 certificate from '", file,"'");
++		goto error;
++	}
++
++	BIO_free(in);
++	return x;
++
++error:
++	if (NULL != x) X509_free(x);
++	if (NULL != in) BIO_free(in);
++	return NULL;
++}
++
++static EVP_PKEY* evp_pkey_load_pem_file(server *srv, const char *file) {
++	BIO *in;
++	EVP_PKEY *x = NULL;
++
++	in=BIO_new(BIO_s_file());
++	if (NULL == in) {
++		log_error_write(srv, __FILE__, __LINE__, "s", "SSL: BIO_new(BIO_s_file()) failed");
++		goto error;
++	}
++
++	if (BIO_read_filename(in,file) <= 0) {
++		log_error_write(srv, __FILE__, __LINE__, "SSS", "SSL: BIO_read_filename('", file,"') failed");
++		goto error;
++	}
++	x = PEM_read_bio_PrivateKey(in, NULL, NULL, NULL);
++
++	if (NULL == x) {
++		log_error_write(srv, __FILE__, __LINE__, "SSS", "SSL: couldn't read private key from '", file,"'");
++		goto error;
++	}
++
++	BIO_free(in);
++	return x;
++
++error:
++	if (NULL != x) EVP_PKEY_free(x);
++	if (NULL != in) BIO_free(in);
++	return NULL;
++}
++
++static int network_openssl_load_pemfile(server *srv, size_t ndx) {
++	specific_config *s = srv->config_storage[ndx];
++
++#ifdef OPENSSL_NO_TLSEXT
++	{
++		data_config *dc = (data_config *)srv->config_context->data[i];
++		if ((ndx > 0 && (COMP_SERVER_SOCKET != dc->comp || dc->cond != CONFIG_COND_EQ))
++			|| !s->ssl_enabled) {
++			log_error_write(srv, __FILE__, __LINE__, "ss", "SSL:",
++					"ssl.pemfile only works in SSL socket binding context as openssl version does not support TLS extensions");
++			return -1;
++		}
++	}
++#endif
++
++	if (NULL == (s->ssl_pemfile_x509 = x509_load_pem_file(srv, s->ssl_pemfile->ptr))) return -1;
++	if (NULL == (s->ssl_pemfile_pkey = evp_pkey_load_pem_file(srv, s->ssl_pemfile->ptr))) return -1;
++
++	if (!X509_check_private_key(s->ssl_pemfile_x509, s->ssl_pemfile_pkey)) {
++		log_error_write(srv, __FILE__, __LINE__, "sssb", "SSL:",
++				"Private key does not match the certificate public key, reason:",
++				ERR_error_string(ERR_get_error(), NULL),
++				s->ssl_pemfile);
++		return -1;
++	}
++
++	return 0;
++}
++#endif
++
+ int network_init(server *srv) {
+ 	buffer *b;
+-	size_t i;
++	size_t i, j;
+ 	network_backend_t backend;
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x0090800fL
+@@ -580,18 +697,7 @@ int network_init(server *srv) {
+ 		long ssloptions =
+ 			SSL_OP_ALL | SSL_OP_NO_SESSION_RESUMPTION_ON_RENEGOTIATION | SSL_OP_NO_COMPRESSION;
+ 
+-		if (buffer_is_empty(s->ssl_pemfile)) continue;
+-
+-#ifdef OPENSSL_NO_TLSEXT
+-		{
+-			data_config *dc = (data_config *)srv->config_context->data[i];
+-			if (COMP_HTTP_HOST == dc->comp) {
+-			    log_error_write(srv, __FILE__, __LINE__, "ss", "SSL:",
+-					    "can't use ssl.pemfile with $HTTP[\"host\"], openssl version does not support TLS extensions");
+-			    return -1;
+-			}
+-		}
+-#endif
++		if (buffer_is_empty(s->ssl_pemfile) && buffer_is_empty(s->ssl_ca_file)) continue;
+ 
+ 		if (srv->ssl_is_init == 0) {
+ 			SSL_load_error_strings();
+@@ -606,6 +712,29 @@ int network_init(server *srv) {
+ 			}
+ 		}
+ 
++		if (!buffer_is_empty(s->ssl_pemfile)) {
++#ifdef OPENSSL_NO_TLSEXT
++			data_config *dc = (data_config *)srv->config_context->data[i];
++			if (COMP_HTTP_HOST == dc->comp) {
++				log_error_write(srv, __FILE__, __LINE__, "ss", "SSL:",
++						"can't use ssl.pemfile with $HTTP[\"host\"], openssl version does not support TLS extensions");
++				return -1;
++			}
++#endif
++			if (network_openssl_load_pemfile(srv, i)) return -1;
++		}
++
++
++		if (!buffer_is_empty(s->ssl_ca_file)) {
++			s->ssl_ca_file_cert_names = SSL_load_client_CA_file(s->ssl_ca_file->ptr);
++			if (NULL == s->ssl_ca_file_cert_names) {
++				log_error_write(srv, __FILE__, __LINE__, "ssb", "SSL:",
++						ERR_error_string(ERR_get_error(), NULL), s->ssl_ca_file);
++			}
++		}
++
++		if (buffer_is_empty(s->ssl_pemfile) || !s->ssl_enabled) continue;
++
+ 		if (NULL == (s->ssl_ctx = SSL_CTX_new(SSLv23_server_method()))) {
+ 			log_error_write(srv, __FILE__, __LINE__, "ss", "SSL:",
+ 					ERR_error_string(ERR_get_error(), NULL));
+@@ -721,45 +850,42 @@ int network_init(server *srv) {
+ #endif
+ #endif
+ 
+-		if (!buffer_is_empty(s->ssl_ca_file)) {
+-			if (1 != SSL_CTX_load_verify_locations(s->ssl_ctx, s->ssl_ca_file->ptr, NULL)) {
+-				log_error_write(srv, __FILE__, __LINE__, "ssb", "SSL:",
+-						ERR_error_string(ERR_get_error(), NULL), s->ssl_ca_file);
+-				return -1;
+-			}
+-			if (s->ssl_verifyclient) {
+-				STACK_OF(X509_NAME) *certs = SSL_load_client_CA_file(s->ssl_ca_file->ptr);
+-				if (!certs) {
++		/* load all ssl.ca-files specified in the config into each SSL_CTX to be prepared for SNI */
++		for (j = 0; j < srv->config_context->used; j++) {
++			specific_config *s1 = srv->config_storage[j];
++
++			if (!buffer_is_empty(s1->ssl_ca_file)) {
++				if (1 != SSL_CTX_load_verify_locations(s->ssl_ctx, s1->ssl_ca_file->ptr, NULL)) {
+ 					log_error_write(srv, __FILE__, __LINE__, "ssb", "SSL:",
+-							ERR_error_string(ERR_get_error(), NULL), s->ssl_ca_file);
+-				}
+-				if (SSL_CTX_set_session_id_context(s->ssl_ctx, (void*) &srv, sizeof(srv)) != 1) {
+-					log_error_write(srv, __FILE__, __LINE__, "ss", "SSL:",
+-						ERR_error_string(ERR_get_error(), NULL));
++							ERR_error_string(ERR_get_error(), NULL), s1->ssl_ca_file);
+ 					return -1;
+ 				}
+-				SSL_CTX_set_client_CA_list(s->ssl_ctx, certs);
+-				SSL_CTX_set_verify(
+-					s->ssl_ctx,
+-					SSL_VERIFY_PEER | (s->ssl_verifyclient_enforce ? SSL_VERIFY_FAIL_IF_NO_PEER_CERT : 0),
+-					NULL
++			}
++		}
++
++		if (s->ssl_verifyclient) {
++			if (NULL == s->ssl_ca_file_cert_names) {
++				log_error_write(srv, __FILE__, __LINE__, "s",
++					"SSL: You specified ssl.verifyclient.activate but no ca_file"
+ 				);
+-				SSL_CTX_set_verify_depth(s->ssl_ctx, s->ssl_verifyclient_depth);
++				return -1;
+ 			}
+-		} else if (s->ssl_verifyclient) {
+-			log_error_write(
+-				srv, __FILE__, __LINE__, "s",
+-				"SSL: You specified ssl.verifyclient.activate but no ca_file"
++			SSL_CTX_set_client_CA_list(s->ssl_ctx, SSL_dup_CA_list(s->ssl_ca_file_cert_names));
++			SSL_CTX_set_verify(
++				s->ssl_ctx,
++				SSL_VERIFY_PEER | (s->ssl_verifyclient_enforce ? SSL_VERIFY_FAIL_IF_NO_PEER_CERT : 0),
++				NULL
+ 			);
++			SSL_CTX_set_verify_depth(s->ssl_ctx, s->ssl_verifyclient_depth);
+ 		}
+ 
+-		if (SSL_CTX_use_certificate_file(s->ssl_ctx, s->ssl_pemfile->ptr, SSL_FILETYPE_PEM) < 0) {
++		if (SSL_CTX_use_certificate(s->ssl_ctx, s->ssl_pemfile_x509) < 0) {
+ 			log_error_write(srv, __FILE__, __LINE__, "ssb", "SSL:",
+ 					ERR_error_string(ERR_get_error(), NULL), s->ssl_pemfile);
+ 			return -1;
+ 		}
+ 
+-		if (SSL_CTX_use_PrivateKey_file (s->ssl_ctx, s->ssl_pemfile->ptr, SSL_FILETYPE_PEM) < 0) {
++		if (SSL_CTX_use_PrivateKey(s->ssl_ctx, s->ssl_pemfile_pkey) < 0) {
+ 			log_error_write(srv, __FILE__, __LINE__, "ssb", "SSL:",
+ 					ERR_error_string(ERR_get_error(), NULL), s->ssl_pemfile);
+ 			return -1;
+@@ -856,7 +982,6 @@ int network_init(server *srv) {
+ 	for (i = 1; i < srv->config_context->used; i++) {
+ 		data_config *dc = (data_config *)srv->config_context->data[i];
+ 		specific_config *s = srv->config_storage[i];
+-		size_t j;
+ 
+ 		/* not our stage */
+ 		if (COMP_SERVER_SOCKET != dc->comp) continue;
+diff --git a/src/server.c b/src/server.c
+index a779928..1eb68b6 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -314,6 +314,9 @@ static void server_free(server *srv) {
+ 			buffer_free(s->ssl_verifyclient_username);
+ #ifdef USE_OPENSSL
+ 			SSL_CTX_free(s->ssl_ctx);
++			EVP_PKEY_free(s->ssl_pemfile_pkey);
++			X509_free(s->ssl_pemfile_x509);
++			if (NULL != s->ssl_ca_file_cert_names) sk_X509_NAME_pop_free(s->ssl_ca_file_cert_names, X509_NAME_free);
+ #endif
+ 			free(s);
+ 		}
-- 
1.8.1.2
