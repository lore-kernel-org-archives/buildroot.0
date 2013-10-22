From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 16:29:22 +0200
Subject: [Buildroot] [git commit] openssh: bump to version 6.3p1
Message-ID: <20131022143059.0F41D7FFBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0757b41ab3925a8460456b34584b91432d695eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...cy.patch => openssh-01-drop-SUSv3-legacy.patch} |  450 ++++++++++----------
 ...openssh-02-fix-pam-uclibc-pthreads-clash.patch} |    0
 package/openssh/openssh.mk                         |    2 +-
 3 files changed, 229 insertions(+), 223 deletions(-)

diff --git a/package/openssh/openssh-drop-SUSv3-legacy.patch b/package/openssh/openssh-01-drop-SUSv3-legacy.patch
similarity index 56%
rename from package/openssh/openssh-drop-SUSv3-legacy.patch
rename to package/openssh/openssh-01-drop-SUSv3-legacy.patch
index 3e79813..39a63e4 100644
--- a/package/openssh/openssh-drop-SUSv3-legacy.patch
+++ b/package/openssh/openssh-01-drop-SUSv3-legacy.patch
@@ -1,45 +1,32 @@
-From a66a3edccc336fe5942a50fd4347b452d3bdea1f Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 4 Sep 2012 09:42:03 -0300
-Subject: [PATCH] Drop SUSv3 legacy functions
+Switch usage of SUSv3-deprecated bzero(a,b) to memset(a, 0, b).
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- auth2-jpake.c             |   24 ++++++++++++------------
- authfd.c                  |    2 +-
- authfile.c                |    6 +++---
- bufaux.c                  |    2 +-
- bufec.c                   |    4 ++--
- canohost.c                |    2 +-
- channels.c                |    6 +++---
- clientloop.c              |    4 ++--
- hostfile.c                |    2 +-
- jpake.c                   |    6 +++---
- monitor.c                 |   20 ++++++++++----------
- openbsd-compat/port-tun.c |    4 ++--
- sandbox-systrace.c        |    2 +-
- schnorr.c                 |    6 +++---
- session.c                 |    2 +-
- sftp-client.c             |    2 +-
- ssh-keygen.c              |    2 +-
- ssh.c                     |    8 ++++----
- sshconnect2.c             |   22 +++++++++++-----------
- 19 files changed, 63 insertions(+), 63 deletions(-)
 
-diff --git a/auth2-jpake.c b/auth2-jpake.c
-index a460e82..caa8c6f 100644
---- a/auth2-jpake.c
-+++ b/auth2-jpake.c
-@@ -178,7 +178,7 @@ derive_rawsalt(const char *username, u_char *rawsalt, u_int len)
+diff -Nura openssh-6.3p1.orig/auth2-chall.c openssh-6.3p1/auth2-chall.c
+--- openssh-6.3p1.orig/auth2-chall.c	2013-06-01 18:31:18.000000000 -0300
++++ openssh-6.3p1/auth2-chall.c	2013-10-22 09:47:38.665516102 -0300
+@@ -148,7 +148,7 @@
+ 	if (kbdintctxt->device)
+ 		kbdint_reset_device(kbdintctxt);
+ 	free(kbdintctxt->devices);
+-	bzero(kbdintctxt, sizeof(*kbdintctxt));
++	memset(kbdintctxt, 0, sizeof(*kbdintctxt));
+ 	free(kbdintctxt);
+ }
+ /* get next device */
+diff -Nura openssh-6.3p1.orig/auth2-jpake.c openssh-6.3p1/auth2-jpake.c
+--- openssh-6.3p1.orig/auth2-jpake.c	2013-06-01 18:31:18.000000000 -0300
++++ openssh-6.3p1/auth2-jpake.c	2013-10-22 09:43:32.504472356 -0300
+@@ -178,7 +178,7 @@
  		fatal("%s: not enough bytes for rawsalt (want %u have %u)",
  		    __func__, len, digest_len);
  	memcpy(rawsalt, digest, len);
 -	bzero(digest, digest_len);
 +	memset(digest, 0, digest_len);
- 	xfree(digest);
+ 	free(digest);
  }
  
-@@ -203,10 +203,10 @@ makesalt(u_int want, const char *user)
+@@ -203,10 +203,10 @@
  		fatal("%s: want %u", __func__, want);
  
  	derive_rawsalt(user, rawsalt, sizeof(rawsalt));
@@ -52,16 +39,16 @@ index a460e82..caa8c6f 100644
  
  	return ret;
  }
-@@ -360,7 +360,7 @@ auth2_jpake_get_pwdata(Authctxt *authctxt, BIGNUM **s,
+@@ -360,7 +360,7 @@
  	debug3("%s: scheme = %s", __func__, *hash_scheme);
  	JPAKE_DEBUG_BN((*s, "%s: s = ", __func__));
  #endif
 -	bzero(secret, secret_len);
 +	memset(secret, 0, secret_len);
- 	xfree(secret);
+ 	free(secret);
  }
  
-@@ -401,12 +401,12 @@ auth2_jpake_start(Authctxt *authctxt)
+@@ -401,12 +401,12 @@
  	packet_send();
  	packet_write_wait();
  
@@ -69,16 +56,16 @@ index a460e82..caa8c6f 100644
 -	bzero(salt, strlen(salt));
 +	memset(hash_scheme, 0, strlen(hash_scheme));
 +	memset(salt, 0, strlen(salt));
- 	xfree(hash_scheme);
- 	xfree(salt);
+ 	free(hash_scheme);
+ 	free(salt);
 -	bzero(x3_proof, x3_proof_len);
 -	bzero(x4_proof, x4_proof_len);
 +	memset(x3_proof, 0, x3_proof_len);
 +	memset(x4_proof, 0, x4_proof_len);
- 	xfree(x3_proof);
- 	xfree(x4_proof);
+ 	free(x3_proof);
+ 	free(x4_proof);
  
-@@ -453,8 +453,8 @@ input_userauth_jpake_client_step1(int type, u_int32_t seq, void *ctxt)
+@@ -453,8 +453,8 @@
  	    &pctx->b,
  	    &x4_s_proof, &x4_s_proof_len));
  
@@ -86,32 +73,31 @@ index a460e82..caa8c6f 100644
 -	bzero(x2_proof, x2_proof_len);
 +	memset(x1_proof, 0, x1_proof_len);
 +	memset(x2_proof, 0, x2_proof_len);
- 	xfree(x1_proof);
- 	xfree(x2_proof);
+ 	free(x1_proof);
+ 	free(x2_proof);
  
-@@ -468,7 +468,7 @@ input_userauth_jpake_client_step1(int type, u_int32_t seq, void *ctxt)
+@@ -468,7 +468,7 @@
  	packet_send();
  	packet_write_wait();
  
 -	bzero(x4_s_proof, x4_s_proof_len);
 +	memset(x4_s_proof, 0, x4_s_proof_len);
- 	xfree(x4_s_proof);
+ 	free(x4_s_proof);
  
  	/* Expect step 2 packet from peer */
-@@ -509,7 +509,7 @@ input_userauth_jpake_client_step2(int type, u_int32_t seq, void *ctxt)
+@@ -509,7 +509,7 @@
  	    &pctx->k,
  	    &pctx->h_k_sid_sessid, &pctx->h_k_sid_sessid_len));
  
 -	bzero(x2_s_proof, x2_s_proof_len);
 +	memset(x2_s_proof, 0, x2_s_proof_len);
- 	xfree(x2_s_proof);
+ 	free(x2_s_proof);
  
  	if (!use_privsep)
-diff --git a/authfd.c b/authfd.c
-index f037e83..0e51468 100644
---- a/authfd.c
-+++ b/authfd.c
-@@ -102,7 +102,7 @@ ssh_get_authentication_socket(void)
+diff -Nura openssh-6.3p1.orig/authfd.c openssh-6.3p1/authfd.c
+--- openssh-6.3p1.orig/authfd.c	2013-06-01 18:31:18.000000000 -0300
++++ openssh-6.3p1/authfd.c	2013-10-22 09:47:48.208827946 -0300
+@@ -102,7 +102,7 @@
  	if (!authsocket)
  		return -1;
  
@@ -120,11 +106,10 @@ index f037e83..0e51468 100644
  	sunaddr.sun_family = AF_UNIX;
  	strlcpy(sunaddr.sun_path, authsocket, sizeof(sunaddr.sun_path));
  
-diff --git a/authfile.c b/authfile.c
-index 7dd4496..068f75e 100644
---- a/authfile.c
-+++ b/authfile.c
-@@ -349,17 +349,17 @@ key_load_file(int fd, const char *filename, Buffer *blob)
+diff -Nura openssh-6.3p1.orig/authfile.c openssh-6.3p1/authfile.c
+--- openssh-6.3p1.orig/authfile.c	2013-06-01 18:31:18.000000000 -0300
++++ openssh-6.3p1/authfile.c	2013-10-22 09:47:08.538531649 -0300
+@@ -349,17 +349,17 @@
  			    __func__, filename == NULL ? "" : filename,
  			    filename == NULL ? "" : " ", strerror(errno));
  			buffer_clear(blob);
@@ -145,46 +130,43 @@ index 7dd4496..068f75e 100644
  	if ((st.st_mode & (S_IFSOCK|S_IFCHR|S_IFIFO)) == 0 &&
  	    st.st_size != buffer_len(blob)) {
  		debug("%s: key file %.200s%schanged size while reading",
-diff --git a/bufaux.c b/bufaux.c
-index 00208ca..d82351d 100644
---- a/bufaux.c
-+++ b/bufaux.c
-@@ -215,7 +215,7 @@ buffer_get_cstring_ret(Buffer *buffer, u_int *length_ptr)
+diff -Nura openssh-6.3p1.orig/bufaux.c openssh-6.3p1/bufaux.c
+--- openssh-6.3p1.orig/bufaux.c	2013-07-18 03:12:44.000000000 -0300
++++ openssh-6.3p1/bufaux.c	2013-10-22 09:47:56.220089728 -0300
+@@ -215,7 +215,7 @@
  		if (cp == ret + length - 1)
  			error("buffer_get_cstring_ret: string contains \\0");
  		else {
 -			bzero(ret, length);
 +			memset(ret, 0, length);
- 			xfree(ret);
+ 			free(ret);
  			return NULL;
  		}
-diff --git a/bufec.c b/bufec.c
-index 3dcb494..36c14e9 100644
---- a/bufec.c
-+++ b/bufec.c
-@@ -77,7 +77,7 @@ buffer_put_ecpoint_ret(Buffer *buffer, const EC_GROUP *curve,
+diff -Nura openssh-6.3p1.orig/bufec.c openssh-6.3p1/bufec.c
+--- openssh-6.3p1.orig/bufec.c	2013-06-01 18:31:18.000000000 -0300
++++ openssh-6.3p1/bufec.c	2013-10-22 09:48:07.798468072 -0300
+@@ -77,7 +77,7 @@
  	ret = 0;
   out:
  	if (buf != NULL) {
 -		bzero(buf, len);
 +		memset(buf, 0, len);
- 		xfree(buf);
+ 		free(buf);
  	}
  	BN_CTX_free(bnctx);
-@@ -130,7 +130,7 @@ buffer_get_ecpoint_ret(Buffer *buffer, const EC_GROUP *curve,
+@@ -130,7 +130,7 @@
  	ret = 0;
   out:
  	BN_CTX_free(bnctx);
 -	bzero(buf, len);
 +	memset(buf, 0, len);
- 	xfree(buf);
+ 	free(buf);
  	return ret;
  }
-diff --git a/canohost.c b/canohost.c
-index dabd8a3..a302727 100644
---- a/canohost.c
-+++ b/canohost.c
-@@ -199,7 +199,7 @@ ipv64_normalise_mapped(struct sockaddr_storage *addr, socklen_t *len)
+diff -Nura openssh-6.3p1.orig/canohost.c openssh-6.3p1/canohost.c
+--- openssh-6.3p1.orig/canohost.c	2013-06-01 18:31:18.000000000 -0300
++++ openssh-6.3p1/canohost.c	2013-10-22 09:48:16.484751912 -0300
+@@ -199,7 +199,7 @@
  	memcpy(&inaddr, ((char *)&a6->sin6_addr) + 12, sizeof(inaddr));
  	port = a6->sin6_port;
  
@@ -193,30 +175,29 @@ index dabd8a3..a302727 100644
  
  	a4->sin_family = AF_INET;
  	*len = sizeof(*a4);
-diff --git a/channels.c b/channels.c
-index 7791feb..2e6dddf 100644
---- a/channels.c
-+++ b/channels.c
-@@ -425,7 +425,7 @@ channel_free(Channel *c)
+diff -Nura openssh-6.3p1.orig/channels.c openssh-6.3p1/channels.c
+--- openssh-6.3p1.orig/channels.c	2013-09-13 03:19:31.000000000 -0300
++++ openssh-6.3p1/channels.c	2013-10-22 09:50:37.059773902 -0300
+@@ -423,7 +423,7 @@
  		if (cc->abandon_cb != NULL)
  			cc->abandon_cb(c, cc->ctx);
  		TAILQ_REMOVE(&c->status_confirms, cc, entry);
 -		bzero(cc, sizeof(*cc));
 +		memset(cc, 0, sizeof(*cc));
- 		xfree(cc);
+ 		free(cc);
  	}
  	if (c->filter_cleanup != NULL && c->filter_ctx != NULL)
-@@ -2667,7 +2667,7 @@ channel_input_status_confirm(int type, u_int32_t seq, void *ctxt)
+@@ -2668,7 +2668,7 @@
  		return;
  	cc->cb(type, c, cc->ctx);
  	TAILQ_REMOVE(&c->status_confirms, cc, entry);
 -	bzero(cc, sizeof(*cc));
 +	memset(cc, 0, sizeof(*cc));
- 	xfree(cc);
+ 	free(cc);
  }
  
-@@ -3296,7 +3296,7 @@ channel_connect_ctx_free(struct channel_connect *cctx)
- 	xfree(cctx->host);
+@@ -3289,7 +3289,7 @@
+ 	free(cctx->host);
  	if (cctx->aitop)
  		freeaddrinfo(cctx->aitop);
 -	bzero(cctx, sizeof(*cctx));
@@ -224,20 +205,19 @@ index 7791feb..2e6dddf 100644
  	cctx->host = NULL;
  	cctx->ai = cctx->aitop = NULL;
  }
-diff --git a/clientloop.c b/clientloop.c
-index 1c1a770..fd226e6 100644
---- a/clientloop.c
-+++ b/clientloop.c
-@@ -551,7 +551,7 @@ client_global_request_reply(int type, u_int32_t seq, void *ctxt)
+diff -Nura openssh-6.3p1.orig/clientloop.c openssh-6.3p1/clientloop.c
+--- openssh-6.3p1.orig/clientloop.c	2013-06-10 00:07:12.000000000 -0300
++++ openssh-6.3p1/clientloop.c	2013-10-22 09:50:20.361228247 -0300
+@@ -549,7 +549,7 @@
  		gc->cb(type, seq, gc->ctx);
  	if (--gc->ref_count <= 0) {
  		TAILQ_REMOVE(&global_confirms, gc, entry);
 -		bzero(gc, sizeof(*gc));
 +		memset(gc, 0, sizeof(*gc));
- 		xfree(gc);
+ 		free(gc);
  	}
  
-@@ -867,7 +867,7 @@ process_cmdline(void)
+@@ -876,7 +876,7 @@
  	int cancel_port, ok;
  	Forward fwd;
  
@@ -246,55 +226,104 @@ index 1c1a770..fd226e6 100644
  	fwd.listen_host = fwd.connect_host = NULL;
  
  	leave_raw_mode(options.request_tty == REQUEST_TTY_FORCE);
-diff --git a/hostfile.c b/hostfile.c
-index b6f924b..e25820d 100644
---- a/hostfile.c
-+++ b/hostfile.c
-@@ -330,7 +330,7 @@ free_hostkeys(struct hostkeys *hostkeys)
- 		xfree(hostkeys->entries[i].host);
- 		xfree(hostkeys->entries[i].file);
+diff -Nura openssh-6.3p1.orig/hostfile.c openssh-6.3p1/hostfile.c
+--- openssh-6.3p1.orig/hostfile.c	2013-07-18 03:12:45.000000000 -0300
++++ openssh-6.3p1/hostfile.c	2013-10-22 09:50:06.438773307 -0300
+@@ -333,10 +333,10 @@
+ 		free(hostkeys->entries[i].host);
+ 		free(hostkeys->entries[i].file);
  		key_free(hostkeys->entries[i].key);
 -		bzero(hostkeys->entries + i, sizeof(*hostkeys->entries));
 +		memset(hostkeys->entries + i, 0, sizeof(*hostkeys->entries));
  	}
- 	if (hostkeys->entries != NULL)
- 		xfree(hostkeys->entries);
-diff --git a/jpake.c b/jpake.c
-index b010daf..147ffe7 100644
---- a/jpake.c
-+++ b/jpake.c
-@@ -105,7 +105,7 @@ jpake_free(struct jpake_ctx *pctx)
+ 	free(hostkeys->entries);
+-	bzero(hostkeys, sizeof(*hostkeys));
++	memset(hostkeys, 0, sizeof(*hostkeys));
+ 	free(hostkeys);
+ }
+ 
+diff -Nura openssh-6.3p1.orig/jpake.c openssh-6.3p1/jpake.c
+--- openssh-6.3p1.orig/jpake.c	2013-06-01 18:31:18.000000000 -0300
++++ openssh-6.3p1/jpake.c	2013-10-22 09:49:54.371378983 -0300
+@@ -105,7 +105,7 @@
  #define JPAKE_BUF_CLEAR_FREE(v, l)		\
  	do {					\
  		if ((v) != NULL) {		\
 -			bzero((v), (l));	\
 +			memset((v), 0, (l));	\
- 			xfree(v);		\
+ 			free(v);		\
  			(v) = NULL;		\
  			(l) = 0;		\
-@@ -133,7 +133,7 @@ jpake_free(struct jpake_ctx *pctx)
+@@ -133,7 +133,7 @@
  #undef JPAKE_BN_CLEAR_FREE
  #undef JPAKE_BUF_CLEAR_FREE
  
 -	bzero(pctx, sizeof(*pctx));
-+	memset(pctx, 0, sizeof(pctx));
- 	xfree(pctx);
++	memset(pctx, 0, sizeof(*pctx));
+ 	free(pctx);
  }
  
-@@ -444,7 +444,7 @@ jpake_check_confirm(const BIGNUM *k,
+@@ -444,7 +444,7 @@
  	else if (timingsafe_bcmp(peer_confirm_hash, expected_confirm_hash,
  	    expected_confirm_hash_len) == 0)
  		success = 1;
 -	bzero(expected_confirm_hash, expected_confirm_hash_len);
 +	memset(expected_confirm_hash, 0, expected_confirm_hash_len);
- 	xfree(expected_confirm_hash);
+ 	free(expected_confirm_hash);
  	debug3("%s: success = %d", __func__, success);
  	return success;
-diff --git a/monitor.c b/monitor.c
-index e9802a3..97a50f6 100644
---- a/monitor.c
-+++ b/monitor.c
-@@ -547,7 +547,7 @@ monitor_read(struct monitor *pmonitor, struct mon_table *ent,
+diff -Nura openssh-6.3p1.orig/krl.c openssh-6.3p1/krl.c
+--- openssh-6.3p1.orig/krl.c	2013-07-24 22:52:49.000000000 -0300
++++ openssh-6.3p1/krl.c	2013-10-22 09:49:27.731508478 -0300
+@@ -238,7 +238,7 @@
+ 	struct revoked_serial rs, *ers, *crs, *irs;
+ 
+ 	KRL_DBG(("%s: insert %llu:%llu", __func__, lo, hi));
+-	bzero(&rs, sizeof(rs));
++	memset(&rs, 0, sizeof(rs));
+ 	rs.lo = lo;
+ 	rs.hi = hi;
+ 	ers = RB_NFIND(revoked_serial_tree, rt, &rs);
+@@ -1115,7 +1115,7 @@
+ 	struct revoked_certs *rc;
+ 
+ 	/* Check explicitly revoked hashes first */
+-	bzero(&rb, sizeof(rb));
++	memset(&rb, 0, sizeof(rb));
+ 	if ((rb.blob = key_fingerprint_raw(key, SSH_FP_SHA1, &rb.len)) == NULL)
+ 		return -1;
+ 	erb = RB_FIND(revoked_blob_tree, &krl->revoked_sha1s, &rb);
+@@ -1126,7 +1126,7 @@
+ 	}
+ 
+ 	/* Next, explicit keys */
+-	bzero(&rb, sizeof(rb));
++	memset(&rb, 0, sizeof(rb));
+ 	if (plain_key_blob(key, &rb.blob, &rb.len) != 0)
+ 		return -1;
+ 	erb = RB_FIND(revoked_blob_tree, &krl->revoked_keys, &rb);
+@@ -1147,7 +1147,7 @@
+ 		return 0; /* No entry for this CA */
+ 
+ 	/* Check revocation by cert key ID */
+-	bzero(&rki, sizeof(rki));
++	memset(&rki, 0, sizeof(rki));
+ 	rki.key_id = key->cert->key_id;
+ 	erki = RB_FIND(revoked_key_id_tree, &rc->revoked_key_ids, &rki);
+ 	if (erki != NULL) {
+@@ -1162,7 +1162,7 @@
+ 	if (key_cert_is_legacy(key) || key->cert->serial == 0)
+ 		return 0;
+ 
+-	bzero(&rs, sizeof(rs));
++	memset(&rs, 0, sizeof(rs));
+ 	rs.lo = rs.hi = key->cert->serial;
+ 	ers = RB_FIND(revoked_serial_tree, &rc->revoked_serials, &rs);
+ 	if (ers != NULL) {
+diff -Nura openssh-6.3p1.orig/monitor.c openssh-6.3p1/monitor.c
+--- openssh-6.3p1.orig/monitor.c	2013-07-20 00:21:53.000000000 -0300
++++ openssh-6.3p1/monitor.c	2013-10-22 09:46:48.592879890 -0300
+@@ -566,7 +566,7 @@
  	struct pollfd pfd[2];
  
  	for (;;) {
@@ -303,7 +332,7 @@ index e9802a3..97a50f6 100644
  		pfd[0].fd = pmonitor->m_sendfd;
  		pfd[0].events = POLLIN;
  		pfd[1].fd = pmonitor->m_log_recvfd;
-@@ -2137,8 +2137,8 @@ mm_answer_jpake_step1(int sock, Buffer *m)
+@@ -2193,8 +2193,8 @@
  	debug3("%s: sending step1", __func__);
  	mm_request_send(sock, MONITOR_ANS_JPAKE_STEP1, m);
  
@@ -311,10 +340,10 @@ index e9802a3..97a50f6 100644
 -	bzero(x4_proof, x4_proof_len);
 +	memset(x3_proof, 0, x3_proof_len);
 +	memset(x4_proof, 0, x4_proof_len);
- 	xfree(x3_proof);
- 	xfree(x4_proof);
+ 	free(x3_proof);
+ 	free(x4_proof);
  
-@@ -2167,8 +2167,8 @@ mm_answer_jpake_get_pwdata(int sock, Buffer *m)
+@@ -2223,8 +2223,8 @@
  	debug3("%s: sending pwdata", __func__);
  	mm_request_send(sock, MONITOR_ANS_JPAKE_GET_PWDATA, m);
  
@@ -322,10 +351,10 @@ index e9802a3..97a50f6 100644
 -	bzero(salt, strlen(salt));
 +	memset(hash_scheme, 0, strlen(hash_scheme));
 +	memset(salt, 0, strlen(salt));
- 	xfree(hash_scheme);
- 	xfree(salt);
+ 	free(hash_scheme);
+ 	free(salt);
  
-@@ -2207,8 +2207,8 @@ mm_answer_jpake_step2(int sock, Buffer *m)
+@@ -2263,8 +2263,8 @@
  
  	JPAKE_DEBUG_CTX((pctx, "step2 done in %s", __func__));
  
@@ -333,19 +362,19 @@ index e9802a3..97a50f6 100644
 -	bzero(x2_proof, x2_proof_len);
 +	memset(x1_proof, 0, x1_proof_len);
 +	memset(x2_proof, 0, x2_proof_len);
- 	xfree(x1_proof);
- 	xfree(x2_proof);
+ 	free(x1_proof);
+ 	free(x2_proof);
  
-@@ -2220,7 +2220,7 @@ mm_answer_jpake_step2(int sock, Buffer *m)
+@@ -2276,7 +2276,7 @@
  	debug3("%s: sending step2", __func__);
  	mm_request_send(sock, MONITOR_ANS_JPAKE_STEP2, m);
  
 -	bzero(x4_s_proof, x4_s_proof_len);
 +	memset(x4_s_proof, 0, x4_s_proof_len);
- 	xfree(x4_s_proof);
+ 	free(x4_s_proof);
  
  	monitor_permit(mon_dispatch, MONITOR_REQ_JPAKE_KEY_CONFIRM, 1);
-@@ -2254,7 +2254,7 @@ mm_answer_jpake_key_confirm(int sock, Buffer *m)
+@@ -2310,7 +2310,7 @@
  
  	JPAKE_DEBUG_CTX((pctx, "key_confirm done in %s", __func__));
  
@@ -354,42 +383,19 @@ index e9802a3..97a50f6 100644
  	buffer_clear(m);
  
  	/* pctx->k is sensitive, not sent */
-@@ -2288,7 +2288,7 @@ mm_answer_jpake_check_confirm(int sock, Buffer *m)
+@@ -2344,7 +2344,7 @@
  
  	JPAKE_DEBUG_CTX((pctx, "check_confirm done in %s", __func__));
  
 -	bzero(peer_confirm_hash, peer_confirm_hash_len);
 +	memset(peer_confirm_hash, 0, peer_confirm_hash_len);
- 	xfree(peer_confirm_hash);
+ 	free(peer_confirm_hash);
  
  	buffer_clear(m);
-diff --git a/openbsd-compat/port-tun.c b/openbsd-compat/port-tun.c
-index 0d756f7..98332ae 100644
---- a/openbsd-compat/port-tun.c
-+++ b/openbsd-compat/port-tun.c
-@@ -67,7 +67,7 @@ sys_tun_open(int tun, int mode)
- 		return (-1);
- 	}
- 
--	bzero(&ifr, sizeof(ifr));	
-+	memset(&ifr, 0, sizeof(ifr));	
- 
- 	if (mode == SSH_TUNMODE_ETHERNET) {
- 		ifr.ifr_flags = IFF_TAP;
-@@ -215,7 +215,7 @@ sys_tun_infilter(struct Channel *c, char *buf, int len)
- 	if (len <= 0 || len > (int)(sizeof(rbuf) - sizeof(*af)))
- 		return (-1);
- 	ptr = (char *)&rbuf[0];
--	bcopy(buf, ptr + sizeof(u_int32_t), len);
-+	memmove(ptr + sizeof(u_int32_t), buf, len);
- 	len += sizeof(u_int32_t);
- 	af = (u_int32_t *)ptr;
- 
-diff --git a/sandbox-systrace.c b/sandbox-systrace.c
-index 2d16a62..fcd657a 100644
---- a/sandbox-systrace.c
-+++ b/sandbox-systrace.c
-@@ -140,7 +140,7 @@ ssh_sandbox_parent(struct ssh_sandbox *box, pid_t child_pid,
+diff -Nura openssh-6.3p1.orig/sandbox-systrace.c openssh-6.3p1/sandbox-systrace.c
+--- openssh-6.3p1.orig/sandbox-systrace.c	2013-06-01 18:46:17.000000000 -0300
++++ openssh-6.3p1/sandbox-systrace.c	2013-10-22 09:49:02.048669246 -0300
+@@ -141,7 +141,7 @@
  		    box->systrace_fd, child_pid, strerror(errno));
  
  	/* Allocate and assign policy */
@@ -398,20 +404,19 @@ index 2d16a62..fcd657a 100644
  	policy.strp_op = SYSTR_POLICY_NEW;
  	policy.strp_maxents = SYS_MAXSYSCALL;
  	if (ioctl(box->systrace_fd, STRIOCPOLICY, &policy) == -1)
-diff --git a/schnorr.c b/schnorr.c
-index 4d54d68..e626400 100644
---- a/schnorr.c
-+++ b/schnorr.c
-@@ -101,7 +101,7 @@ schnorr_hash(const BIGNUM *p, const BIGNUM *q, const BIGNUM *g,
+diff -Nura openssh-6.3p1.orig/schnorr.c openssh-6.3p1/schnorr.c
+--- openssh-6.3p1.orig/schnorr.c	2013-06-01 18:31:19.000000000 -0300
++++ openssh-6.3p1/schnorr.c	2013-10-22 09:47:27.631155534 -0300
+@@ -101,7 +101,7 @@
  	SCHNORR_DEBUG_BN((h, "%s: h = ", __func__));
   out:
  	buffer_free(&b);
 -	bzero(digest, digest_len);
 +	memset(digest, 0, digest_len);
- 	xfree(digest);
+ 	free(digest);
  	digest_len = 0;
  	if (success == 0)
-@@ -477,7 +477,7 @@ hash_buffer(const u_char *buf, u_int len, const EVP_MD *md,
+@@ -477,7 +477,7 @@
  	success = 0;
   out:
  	EVP_MD_CTX_cleanup(&evp_md_ctx);
@@ -420,20 +425,19 @@ index 4d54d68..e626400 100644
  	digest_len = 0;
  	return success;
  }
-@@ -570,7 +570,7 @@ modp_group_free(struct modp_group *grp)
+@@ -572,7 +572,7 @@
  		BN_clear_free(grp->p);
  	if (grp->q != NULL)
  		BN_clear_free(grp->q);
 -	bzero(grp, sizeof(*grp));
 +	memset(grp, 0, sizeof(*grp));
- 	xfree(grp);
+ 	free(grp);
  }
  
-diff --git a/session.c b/session.c
-index 65bf287..440c68e 100644
---- a/session.c
-+++ b/session.c
-@@ -1840,7 +1840,7 @@ session_unused(int id)
+diff -Nura openssh-6.3p1.orig/session.c openssh-6.3p1/session.c
+--- openssh-6.3p1.orig/session.c	2013-07-20 00:21:53.000000000 -0300
++++ openssh-6.3p1/session.c	2013-10-22 09:49:35.085748791 -0300
+@@ -1861,7 +1861,7 @@
  		fatal("%s: insane session id %d (max %d nalloc %d)",
  		    __func__, id, options.max_sessions, sessions_nalloc);
  	}
@@ -442,11 +446,10 @@ index 65bf287..440c68e 100644
  	sessions[id].self = id;
  	sessions[id].used = 0;
  	sessions[id].chanid = -1;
-diff --git a/sftp-client.c b/sftp-client.c
-index 85f2bd4..09ec360 100644
---- a/sftp-client.c
-+++ b/sftp-client.c
-@@ -308,7 +308,7 @@ get_decode_statvfs(struct sftp_conn *conn, struct sftp_statvfs *st,
+diff -Nura openssh-6.3p1.orig/sftp-client.c openssh-6.3p1/sftp-client.c
+--- openssh-6.3p1.orig/sftp-client.c	2013-07-25 19:40:00.000000000 -0300
++++ openssh-6.3p1/sftp-client.c	2013-10-22 09:48:47.139753618 -0300
+@@ -308,7 +308,7 @@
  		    SSH2_FXP_EXTENDED_REPLY, type);
  	}
  
@@ -455,24 +458,10 @@ index 85f2bd4..09ec360 100644
  	st->f_bsize = buffer_get_int64(&msg);
  	st->f_frsize = buffer_get_int64(&msg);
  	st->f_blocks = buffer_get_int64(&msg);
-diff --git a/ssh-keygen.c b/ssh-keygen.c
-index a223ddc..dd7f430 100644
---- a/ssh-keygen.c
-+++ b/ssh-keygen.c
-@@ -1660,7 +1660,7 @@ parse_absolute_time(const char *s)
- 		fatal("Invalid certificate time format %s", s);
- 	}
- 
--	bzero(&tm, sizeof(tm));
-+	memset(&tm, 0, sizeof(tm));
- 	if (strptime(buf, fmt, &tm) == NULL)
- 		fatal("Invalid certificate time %s", s);
- 	if ((tt = mktime(&tm)) < 0)
-diff --git a/ssh.c b/ssh.c
-index 3f61eb0..4a3d2fc 100644
---- a/ssh.c
-+++ b/ssh.c
-@@ -1509,8 +1509,8 @@ load_public_identity_files(void)
+diff -Nura openssh-6.3p1.orig/ssh.c openssh-6.3p1/ssh.c
+--- openssh-6.3p1.orig/ssh.c	2013-07-24 22:55:53.000000000 -0300
++++ openssh-6.3p1/ssh.c	2013-10-22 09:45:52.967062218 -0300
+@@ -1539,8 +1539,8 @@
  #endif /* PKCS11 */
  
  	n_ids = 0;
@@ -483,23 +472,22 @@ index 3f61eb0..4a3d2fc 100644
  
  #ifdef ENABLE_PKCS11
  	if (options.pkcs11_provider != NULL &&
-@@ -1584,9 +1584,9 @@ load_public_identity_files(void)
+@@ -1615,9 +1615,9 @@
  	memcpy(options.identity_files, identity_files, sizeof(identity_files));
  	memcpy(options.identity_keys, identity_keys, sizeof(identity_keys));
  
 -	bzero(pwname, strlen(pwname));
 +	memset(pwname, 0, strlen(pwname));
- 	xfree(pwname);
+ 	free(pwname);
 -	bzero(pwdir, strlen(pwdir));
 +	memset(pwdir, 0, strlen(pwdir));
- 	xfree(pwdir);
+ 	free(pwdir);
  }
  
-diff --git a/sshconnect2.c b/sshconnect2.c
-index 7c369d7..bc362e6 100644
---- a/sshconnect2.c
-+++ b/sshconnect2.c
-@@ -1010,14 +1010,14 @@ jpake_password_to_secret(Authctxt *authctxt, const char *crypt_scheme,
+diff -Nura openssh-6.3p1.orig/sshconnect2.c openssh-6.3p1/sshconnect2.c
+--- openssh-6.3p1.orig/sshconnect2.c	2013-06-05 19:22:05.000000000 -0300
++++ openssh-6.3p1/sshconnect2.c	2013-10-22 09:44:58.967297681 -0300
+@@ -1008,14 +1008,14 @@
  	    &secret, &secret_len) != 0)
  		fatal("%s: hash_buffer", __func__);
  
@@ -507,17 +495,17 @@ index 7c369d7..bc362e6 100644
 -	bzero(crypted, strlen(crypted));
 +	memset(password, 0, strlen(password));
 +	memset(crypted, 0, strlen(crypted));
- 	xfree(password);
- 	xfree(crypted);
+ 	free(password);
+ 	free(crypted);
  
  	if ((ret = BN_bin2bn(secret, secret_len, NULL)) == NULL)
  		fatal("%s: BN_bin2bn (secret)", __func__);
 -	bzero(secret, secret_len);
 +	memset(secret, 0, secret_len);
- 	xfree(secret);
+ 	free(secret);
  
  	return ret;
-@@ -1054,8 +1054,8 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
+@@ -1052,8 +1052,8 @@
  
  	/* Obtain password and derive secret */
  	pctx->s = jpake_password_to_secret(authctxt, crypt_scheme, salt);
@@ -525,10 +513,10 @@ index 7c369d7..bc362e6 100644
 -	bzero(salt, strlen(salt));
 +	memset(crypt_scheme, 0, strlen(crypt_scheme));
 +	memset(salt, 0, strlen(salt));
- 	xfree(crypt_scheme);
- 	xfree(salt);
+ 	free(crypt_scheme);
+ 	free(salt);
  	JPAKE_DEBUG_BN((pctx->s, "%s: s = ", __func__));
-@@ -1070,8 +1070,8 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
+@@ -1068,8 +1068,8 @@
  	    &pctx->a,
  	    &x2_s_proof, &x2_s_proof_len);
  
@@ -536,28 +524,37 @@ index 7c369d7..bc362e6 100644
 -	bzero(x4_proof, x4_proof_len);
 +	memset(x3_proof, 0, x3_proof_len);
 +	memset(x4_proof, 0, x4_proof_len);
- 	xfree(x3_proof);
- 	xfree(x4_proof);
+ 	free(x3_proof);
+ 	free(x4_proof);
  
-@@ -1083,7 +1083,7 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
+@@ -1081,7 +1081,7 @@
  	packet_put_string(x2_s_proof, x2_s_proof_len);
  	packet_send();
  
 -	bzero(x2_s_proof, x2_s_proof_len);
 +	memset(x2_s_proof, 0, x2_s_proof_len);
- 	xfree(x2_s_proof);
+ 	free(x2_s_proof);
  
  	/* Expect step 2 packet from peer */
-@@ -1123,7 +1123,7 @@ input_userauth_jpake_server_step2(int type, u_int32_t seq, void *ctxt)
+@@ -1121,7 +1121,7 @@
  	    &pctx->k,
  	    &pctx->h_k_cid_sessid, &pctx->h_k_cid_sessid_len);
  
 -	bzero(x4_s_proof, x4_s_proof_len);
 +	memset(x4_s_proof, 0, x4_s_proof_len);
- 	xfree(x4_s_proof);
+ 	free(x4_s_proof);
  
  	JPAKE_DEBUG_CTX((pctx, "confirm sending in %s", __func__));
-@@ -1787,8 +1787,8 @@ userauth_jpake(Authctxt *authctxt)
+@@ -1406,7 +1406,7 @@
+ 		/* If IdentitiesOnly set and key not found then don't use it */
+ 		if (!found && options.identities_only) {
+ 			TAILQ_REMOVE(&files, id, next);
+-			bzero(id, sizeof(*id));
++			memset(id, 0, sizeof(*id));
+ 			free(id);
+ 		}
+ 	}
+@@ -1814,8 +1814,8 @@
  	packet_put_string(x2_proof, x2_proof_len);
  	packet_send();
  
@@ -565,9 +562,18 @@ index 7c369d7..bc362e6 100644
 -	bzero(x2_proof, x2_proof_len);
 +	memset(x1_proof, 0, x1_proof_len);
 +	memset(x2_proof, 0, x2_proof_len);
- 	xfree(x1_proof);
- 	xfree(x2_proof);
+ 	free(x1_proof);
+ 	free(x2_proof);
  
--- 
-1.7.8.6
-
+diff -Nura openssh-6.3p1.orig/ssh-keygen.c openssh-6.3p1/ssh-keygen.c
+--- openssh-6.3p1.orig/ssh-keygen.c	2013-07-20 00:22:32.000000000 -0300
++++ openssh-6.3p1/ssh-keygen.c	2013-10-22 09:45:10.003658313 -0300
+@@ -1693,7 +1693,7 @@
+ 		fatal("Invalid certificate time format %s", s);
+ 	}
+ 
+-	bzero(&tm, sizeof(tm));
++	memset(&tm, 0, sizeof(tm));
+ 	if (strptime(buf, fmt, &tm) == NULL)
+ 		fatal("Invalid certificate time %s", s);
+ 	if ((tt = mktime(&tm)) < 0)
diff --git a/package/openssh/openssh-fix-pam-uclibc-pthreads-clash.patch b/package/openssh/openssh-02-fix-pam-uclibc-pthreads-clash.patch
similarity index 100%
rename from package/openssh/openssh-fix-pam-uclibc-pthreads-clash.patch
rename to package/openssh/openssh-02-fix-pam-uclibc-pthreads-clash.patch
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 4a5b125..f0652e5 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 6.2p2
+OPENSSH_VERSION = 6.3p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \
