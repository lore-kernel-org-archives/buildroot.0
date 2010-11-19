From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 07:24:15 +0100
Subject: [Buildroot] [git commit master 1/1] openssh: bump to version 5.6p1
Message-ID: <20101119080414.70C3C8D303@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9cadb9aca37e3a295aee2721cafcb8c8b0b074c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                         |    2 +-
 package/openssh/openssh-drop-SUSv3-legacy.patch |  441 +++++++++++++++++++++++
 package/openssh/openssh.002-SUSv-legacy.patch   |   21 --
 package/openssh/openssh.mk                      |    6 +-
 package/openssh/openssh.patch                   |   37 --
 5 files changed, 445 insertions(+), 62 deletions(-)
 create mode 100644 package/openssh/openssh-drop-SUSv3-legacy.patch
 delete mode 100644 package/openssh/openssh.002-SUSv-legacy.patch
 delete mode 100644 package/openssh/openssh.patch

diff --git a/CHANGES b/CHANGES
index c73fdbf..a62580e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: libglib2, module-init-tools,
-	mtd-utils, qt
+	mtd-utils, openssh, qt
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/openssh/openssh-drop-SUSv3-legacy.patch b/package/openssh/openssh-drop-SUSv3-legacy.patch
new file mode 100644
index 0000000..8299da1
--- /dev/null
+++ b/package/openssh/openssh-drop-SUSv3-legacy.patch
@@ -0,0 +1,441 @@
+Drop SUSv3 legacy fuctions
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ auth2-jpake.c             |   24 ++++++++++++------------
+ channels.c                |    6 +++---
+ clientloop.c              |    4 ++--
+ jpake.c                   |    6 +++---
+ monitor.c                 |   18 +++++++++---------
+ openbsd-compat/port-tun.c |    4 ++--
+ schnorr.c                 |    6 +++---
+ session.c                 |    2 +-
+ sftp-client.c             |    2 +-
+ ssh-keygen.c              |    2 +-
+ ssh.c                     |    8 ++++----
+ sshconnect2.c             |   22 +++++++++++-----------
+ 12 files changed, 52 insertions(+), 52 deletions(-)
+
+diff --git a/auth2-jpake.c b/auth2-jpake.c
+index 5de5506..b34d696 100644
+--- a/auth2-jpake.c
++++ b/auth2-jpake.c
+@@ -173,7 +173,7 @@ derive_rawsalt(const char *username, u_char *rawsalt, u_int len)
+ 		fatal("%s: not enough bytes for rawsalt (want %u have %u)",
+ 		    __func__, len, digest_len);
+ 	memcpy(rawsalt, digest, len);
+-	bzero(digest, digest_len);
++	memset(digest, 0, digest_len);
+ 	xfree(digest);
+ }
+ 
+@@ -198,10 +198,10 @@ makesalt(u_int want, const char *user)
+ 		fatal("%s: want %u", __func__, want);
+ 
+ 	derive_rawsalt(user, rawsalt, sizeof(rawsalt));
+-	bzero(ret, sizeof(ret));
++	memset(ret, 0, sizeof(ret));
+ 	for (i = 0; i < want; i++)
+ 		ret[i] = pw_encode64(rawsalt[i]);
+-	bzero(rawsalt, sizeof(rawsalt));
++	memset(rawsalt, 0, sizeof(rawsalt));
+ 
+ 	return ret;
+ }
+@@ -355,7 +355,7 @@ auth2_jpake_get_pwdata(Authctxt *authctxt, BIGNUM **s,
+ 	debug3("%s: scheme = %s", __func__, *hash_scheme);
+ 	JPAKE_DEBUG_BN((*s, "%s: s = ", __func__));
+ #endif
+-	bzero(secret, secret_len);
++	memset(secret, 0, secret_len);
+ 	xfree(secret);
+ }
+ 
+@@ -396,12 +396,12 @@ auth2_jpake_start(Authctxt *authctxt)
+ 	packet_send();
+ 	packet_write_wait();
+ 
+-	bzero(hash_scheme, strlen(hash_scheme));
+-	bzero(salt, strlen(salt));
++	memset(hash_scheme, 0, strlen(hash_scheme));
++	memset(salt, 0, strlen(salt));
+ 	xfree(hash_scheme);
+ 	xfree(salt);
+-	bzero(x3_proof, x3_proof_len);
+-	bzero(x4_proof, x4_proof_len);
++	memset(x3_proof, 0, x3_proof_len);
++	memset(x4_proof, 0, x4_proof_len);
+ 	xfree(x3_proof);
+ 	xfree(x4_proof);
+ 
+@@ -448,8 +448,8 @@ input_userauth_jpake_client_step1(int type, u_int32_t seq, void *ctxt)
+ 	    &pctx->b,
+ 	    &x4_s_proof, &x4_s_proof_len));
+ 
+-	bzero(x1_proof, x1_proof_len);
+-	bzero(x2_proof, x2_proof_len);
++	memset(x1_proof, 0, x1_proof_len);
++	memset(x2_proof, 0, x2_proof_len);
+ 	xfree(x1_proof);
+ 	xfree(x2_proof);
+ 
+@@ -463,7 +463,7 @@ input_userauth_jpake_client_step1(int type, u_int32_t seq, void *ctxt)
+ 	packet_send();
+ 	packet_write_wait();
+ 
+-	bzero(x4_s_proof, x4_s_proof_len);
++	memset(x4_s_proof, 0, x4_s_proof_len);
+ 	xfree(x4_s_proof);
+ 
+ 	/* Expect step 2 packet from peer */
+@@ -504,7 +504,7 @@ input_userauth_jpake_client_step2(int type, u_int32_t seq, void *ctxt)
+ 	    &pctx->k,
+ 	    &pctx->h_k_sid_sessid, &pctx->h_k_sid_sessid_len));
+ 
+-	bzero(x2_s_proof, x2_s_proof_len);
++	memset(x2_s_proof, 0, x2_s_proof_len);
+ 	xfree(x2_s_proof);
+ 
+ 	if (!use_privsep)
+diff --git a/channels.c b/channels.c
+index 1cd5004..89dcfc6 100644
+--- a/channels.c
++++ b/channels.c
+@@ -418,7 +418,7 @@ channel_free(Channel *c)
+ 		if (cc->abandon_cb != NULL)
+ 			cc->abandon_cb(c, cc->ctx);
+ 		TAILQ_REMOVE(&c->status_confirms, cc, entry);
+-		bzero(cc, sizeof(*cc));
++		memset(cc, 0, sizeof(*cc));
+ 		xfree(cc);
+ 	}
+ 	if (c->filter_cleanup != NULL && c->filter_ctx != NULL)
+@@ -2625,7 +2625,7 @@ channel_input_status_confirm(int type, u_int32_t seq, void *ctxt)
+ 		return;
+ 	cc->cb(type, c, cc->ctx);
+ 	TAILQ_REMOVE(&c->status_confirms, cc, entry);
+-	bzero(cc, sizeof(*cc));
++	memset(cc, 0, sizeof(*cc));
+ 	xfree(cc);
+ }
+ 
+@@ -3128,7 +3128,7 @@ channel_connect_ctx_free(struct channel_connect *cctx)
+ 	xfree(cctx->host);
+ 	if (cctx->aitop)
+ 		freeaddrinfo(cctx->aitop);
+-	bzero(cctx, sizeof(*cctx));
++	memset(cctx, 0, sizeof(*cctx));
+ 	cctx->host = NULL;
+ 	cctx->ai = cctx->aitop = NULL;
+ }
+diff --git a/clientloop.c b/clientloop.c
+index de79793..2d08690 100644
+--- a/clientloop.c
++++ b/clientloop.c
+@@ -533,7 +533,7 @@ client_global_request_reply(int type, u_int32_t seq, void *ctxt)
+ 		gc->cb(type, seq, gc->ctx);
+ 	if (--gc->ref_count <= 0) {
+ 		TAILQ_REMOVE(&global_confirms, gc, entry);
+-		bzero(gc, sizeof(*gc));
++		memset(gc, 0, sizeof(*gc));
+ 		xfree(gc);
+ 	}
+ 
+@@ -823,7 +823,7 @@ process_cmdline(void)
+ 	int cancel_port;
+ 	Forward fwd;
+ 
+-	bzero(&fwd, sizeof(fwd));
++	memset(&fwd, 0, sizeof(fwd));
+ 	fwd.listen_host = fwd.connect_host = NULL;
+ 
+ 	leave_raw_mode(force_tty_flag);
+diff --git a/jpake.c b/jpake.c
+index cdf65f5..73ba954 100644
+--- a/jpake.c
++++ b/jpake.c
+@@ -104,7 +104,7 @@ jpake_free(struct jpake_ctx *pctx)
+ #define JPAKE_BUF_CLEAR_FREE(v, l)		\
+ 	do {					\
+ 		if ((v) != NULL) {		\
+-			bzero((v), (l));	\
++			memset((v), 0, (l));	\
+ 			xfree(v);		\
+ 			(v) = NULL;		\
+ 			(l) = 0;		\
+@@ -132,7 +132,7 @@ jpake_free(struct jpake_ctx *pctx)
+ #undef JPAKE_BN_CLEAR_FREE
+ #undef JPAKE_BUF_CLEAR_FREE
+ 
+-	bzero(pctx, sizeof(pctx));
++	memset(pctx, 0, sizeof(pctx));
+ 	xfree(pctx);
+ }
+ 
+@@ -437,7 +437,7 @@ jpake_check_confirm(const BIGNUM *k,
+ 	else if (timingsafe_bcmp(peer_confirm_hash, expected_confirm_hash,
+ 	    expected_confirm_hash_len) == 0)
+ 		success = 1;
+-	bzero(expected_confirm_hash, expected_confirm_hash_len);
++	memset(expected_confirm_hash, 0, expected_confirm_hash_len);
+ 	xfree(expected_confirm_hash);
+ 	debug3("%s: success = %d", __func__, success);
+ 	return success;
+diff --git a/monitor.c b/monitor.c
+index 9eb4e35..0e85b7a 100644
+--- a/monitor.c
++++ b/monitor.c
+@@ -2028,8 +2028,8 @@ mm_answer_jpake_step1(int sock, Buffer *m)
+ 	debug3("%s: sending step1", __func__);
+ 	mm_request_send(sock, MONITOR_ANS_JPAKE_STEP1, m);
+ 
+-	bzero(x3_proof, x3_proof_len);
+-	bzero(x4_proof, x4_proof_len);
++	memset(x3_proof, 0, x3_proof_len);
++	memset(x4_proof, 0, x4_proof_len);
+ 	xfree(x3_proof);
+ 	xfree(x4_proof);
+ 
+@@ -2058,8 +2058,8 @@ mm_answer_jpake_get_pwdata(int sock, Buffer *m)
+ 	debug3("%s: sending pwdata", __func__);
+ 	mm_request_send(sock, MONITOR_ANS_JPAKE_GET_PWDATA, m);
+ 
+-	bzero(hash_scheme, strlen(hash_scheme));
+-	bzero(salt, strlen(salt));
++	memset(hash_scheme, 0, strlen(hash_scheme));
++	memset(salt, 0, strlen(salt));
+ 	xfree(hash_scheme);
+ 	xfree(salt);
+ 
+@@ -2098,8 +2098,8 @@ mm_answer_jpake_step2(int sock, Buffer *m)
+ 
+ 	JPAKE_DEBUG_CTX((pctx, "step2 done in %s", __func__));
+ 
+-	bzero(x1_proof, x1_proof_len);
+-	bzero(x2_proof, x2_proof_len);
++	memset(x1_proof, 0, x1_proof_len);
++	memset(x2_proof, 0, x2_proof_len);
+ 	xfree(x1_proof);
+ 	xfree(x2_proof);
+ 
+@@ -2111,7 +2111,7 @@ mm_answer_jpake_step2(int sock, Buffer *m)
+ 	debug3("%s: sending step2", __func__);
+ 	mm_request_send(sock, MONITOR_ANS_JPAKE_STEP2, m);
+ 
+-	bzero(x4_s_proof, x4_s_proof_len);
++	memset(x4_s_proof, 0, x4_s_proof_len);
+ 	xfree(x4_s_proof);
+ 
+ 	monitor_permit(mon_dispatch, MONITOR_REQ_JPAKE_KEY_CONFIRM, 1);
+@@ -2145,7 +2145,7 @@ mm_answer_jpake_key_confirm(int sock, Buffer *m)
+ 
+ 	JPAKE_DEBUG_CTX((pctx, "key_confirm done in %s", __func__));
+ 
+-	bzero(x2_s_proof, x2_s_proof_len);
++	memset(x2_s_proof, 0, x2_s_proof_len);
+ 	buffer_clear(m);
+ 
+ 	/* pctx->k is sensitive, not sent */
+@@ -2179,7 +2179,7 @@ mm_answer_jpake_check_confirm(int sock, Buffer *m)
+ 
+ 	JPAKE_DEBUG_CTX((pctx, "check_confirm done in %s", __func__));
+ 
+-	bzero(peer_confirm_hash, peer_confirm_hash_len);
++	memset(peer_confirm_hash, 0, peer_confirm_hash_len);
+ 	xfree(peer_confirm_hash);
+ 
+ 	buffer_clear(m);
+diff --git a/openbsd-compat/port-tun.c b/openbsd-compat/port-tun.c
+index 0d756f7..98332ae 100644
+--- a/openbsd-compat/port-tun.c
++++ b/openbsd-compat/port-tun.c
+@@ -67,7 +67,7 @@ sys_tun_open(int tun, int mode)
+ 		return (-1);
+ 	}
+ 
+-	bzero(&ifr, sizeof(ifr));	
++	memset(&ifr, 0, sizeof(ifr));	
+ 
+ 	if (mode == SSH_TUNMODE_ETHERNET) {
+ 		ifr.ifr_flags = IFF_TAP;
+@@ -215,7 +215,7 @@ sys_tun_infilter(struct Channel *c, char *buf, int len)
+ 	if (len <= 0 || len > (int)(sizeof(rbuf) - sizeof(*af)))
+ 		return (-1);
+ 	ptr = (char *)&rbuf[0];
+-	bcopy(buf, ptr + sizeof(u_int32_t), len);
++	memmove(ptr + sizeof(u_int32_t), buf, len);
+ 	len += sizeof(u_int32_t);
+ 	af = (u_int32_t *)ptr;
+ 
+diff --git a/schnorr.c b/schnorr.c
+index c17ff32..ec4e41b 100644
+--- a/schnorr.c
++++ b/schnorr.c
+@@ -101,7 +101,7 @@ schnorr_hash(const BIGNUM *p, const BIGNUM *q, const BIGNUM *g,
+ 	SCHNORR_DEBUG_BN((h, "%s: h = ", __func__));
+  out:
+ 	buffer_free(&b);
+-	bzero(digest, digest_len);
++	memset(digest, 0, digest_len);
+ 	xfree(digest);
+ 	digest_len = 0;
+ 	if (success == 0)
+@@ -451,7 +451,7 @@ hash_buffer(const u_char *buf, u_int len, const EVP_MD *md,
+ 	success = 0;
+  out:
+ 	EVP_MD_CTX_cleanup(&evp_md_ctx);
+-	bzero(digest, sizeof(digest));
++	memset(digest, 0, sizeof(digest));
+ 	digest_len = 0;
+ 	return success;
+ }
+@@ -544,7 +544,7 @@ modp_group_free(struct modp_group *grp)
+ 		BN_clear_free(grp->p);
+ 	if (grp->q != NULL)
+ 		BN_clear_free(grp->q);
+-	bzero(grp, sizeof(*grp));
++	memset(grp, 0, sizeof(*grp));
+ 	xfree(grp);
+ }
+ 
+diff --git a/session.c b/session.c
+index 71e4fbe..70c51f2 100644
+--- a/session.c
++++ b/session.c
+@@ -1895,7 +1895,7 @@ session_unused(int id)
+ 		fatal("%s: insane session id %d (max %d nalloc %d)",
+ 		    __func__, id, options.max_sessions, sessions_nalloc);
+ 	}
+-	bzero(&sessions[id], sizeof(*sessions));
++	memset(&sessions[id], 0, sizeof(*sessions));
+ 	sessions[id].self = id;
+ 	sessions[id].used = 0;
+ 	sessions[id].chanid = -1;
+diff --git a/sftp-client.c b/sftp-client.c
+index 9dab477..0815b41 100644
+--- a/sftp-client.c
++++ b/sftp-client.c
+@@ -289,7 +289,7 @@ get_decode_statvfs(int fd, struct sftp_statvfs *st, u_int expected_id,
+ 		    SSH2_FXP_EXTENDED_REPLY, type);
+ 	}
+ 
+-	bzero(st, sizeof(*st));
++	memset(st, 0, sizeof(*st));
+ 	st->f_bsize = buffer_get_int64(&msg);
+ 	st->f_frsize = buffer_get_int64(&msg);
+ 	st->f_blocks = buffer_get_int64(&msg);
+diff --git a/ssh-keygen.c b/ssh-keygen.c
+index d90b1df..d78837a 100644
+--- a/ssh-keygen.c
++++ b/ssh-keygen.c
+@@ -1503,7 +1503,7 @@ parse_absolute_time(const char *s)
+ 		fatal("Invalid certificate time format %s", s);
+ 	}
+ 
+-	bzero(&tm, sizeof(tm));
++	memset(&tm, 0, sizeof(tm));
+ 	if (strptime(buf, fmt, &tm) == NULL)
+ 		fatal("Invalid certificate time %s", s);
+ 	if ((tt = mktime(&tm)) < 0)
+diff --git a/ssh.c b/ssh.c
+index 4419f76..52a8b5e 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -1436,8 +1436,8 @@ load_public_identity_files(void)
+ #endif /* PKCS11 */
+ 
+ 	n_ids = 0;
+-	bzero(identity_files, sizeof(identity_files));
+-	bzero(identity_keys, sizeof(identity_keys));
++	memset(identity_files, 0, sizeof(identity_files));
++	memset(identity_keys, 0, sizeof(identity_keys));
+ 
+ #ifdef ENABLE_PKCS11
+ 	if (options.pkcs11_provider != NULL &&
+@@ -1511,8 +1511,8 @@ load_public_identity_files(void)
+ 	memcpy(options.identity_files, identity_files, sizeof(identity_files));
+ 	memcpy(options.identity_keys, identity_keys, sizeof(identity_keys));
+ 
+-	bzero(pwname, strlen(pwname));
++	memset(pwname, 0, strlen(pwname));
+ 	xfree(pwname);
+-	bzero(pwdir, strlen(pwdir));
++	memset(pwdir, 0, strlen(pwdir));
+ 	xfree(pwdir);
+ }
+diff --git a/sshconnect2.c b/sshconnect2.c
+index 4c379ae..b5502c2 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -948,14 +948,14 @@ jpake_password_to_secret(Authctxt *authctxt, const char *crypt_scheme,
+ 	    &secret, &secret_len) != 0)
+ 		fatal("%s: hash_buffer", __func__);
+ 
+-	bzero(password, strlen(password));
+-	bzero(crypted, strlen(crypted));
++	memset(password, 0, strlen(password));
++	memset(crypted, 0, strlen(crypted));
+ 	xfree(password);
+ 	xfree(crypted);
+ 
+ 	if ((ret = BN_bin2bn(secret, secret_len, NULL)) == NULL)
+ 		fatal("%s: BN_bin2bn (secret)", __func__);
+-	bzero(secret, secret_len);
++	memset(secret, 0, secret_len);
+ 	xfree(secret);
+ 
+ 	return ret;
+@@ -992,8 +992,8 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
+ 
+ 	/* Obtain password and derive secret */
+ 	pctx->s = jpake_password_to_secret(authctxt, crypt_scheme, salt);
+-	bzero(crypt_scheme, strlen(crypt_scheme));
+-	bzero(salt, strlen(salt));
++	memset(crypt_scheme, 0, strlen(crypt_scheme));
++	memset(salt, 0, strlen(salt));
+ 	xfree(crypt_scheme);
+ 	xfree(salt);
+ 	JPAKE_DEBUG_BN((pctx->s, "%s: s = ", __func__));
+@@ -1008,8 +1008,8 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
+ 	    &pctx->a,
+ 	    &x2_s_proof, &x2_s_proof_len);
+ 
+-	bzero(x3_proof, x3_proof_len);
+-	bzero(x4_proof, x4_proof_len);
++	memset(x3_proof, 0, x3_proof_len);
++	memset(x4_proof, 0, x4_proof_len);
+ 	xfree(x3_proof);
+ 	xfree(x4_proof);
+ 
+@@ -1021,7 +1021,7 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
+ 	packet_put_string(x2_s_proof, x2_s_proof_len);
+ 	packet_send();
+ 
+-	bzero(x2_s_proof, x2_s_proof_len);
++	memset(x2_s_proof, 0, x2_s_proof_len);
+ 	xfree(x2_s_proof);
+ 
+ 	/* Expect step 2 packet from peer */
+@@ -1061,7 +1061,7 @@ input_userauth_jpake_server_step2(int type, u_int32_t seq, void *ctxt)
+ 	    &pctx->k,
+ 	    &pctx->h_k_cid_sessid, &pctx->h_k_cid_sessid_len);
+ 
+-	bzero(x4_s_proof, x4_s_proof_len);
++	memset(x4_s_proof, 0, x4_s_proof_len);
+ 	xfree(x4_s_proof);
+ 
+ 	JPAKE_DEBUG_CTX((pctx, "confirm sending in %s", __func__));
+@@ -1725,8 +1725,8 @@ userauth_jpake(Authctxt *authctxt)
+ 	packet_put_string(x2_proof, x2_proof_len);
+ 	packet_send();
+ 
+-	bzero(x1_proof, x1_proof_len);
+-	bzero(x2_proof, x2_proof_len);
++	memset(x1_proof, 0, x1_proof_len);
++	memset(x2_proof, 0, x2_proof_len);
+ 	xfree(x1_proof);
+ 	xfree(x2_proof);
+ 
+-- 
+1.7.2.2
+
diff --git a/package/openssh/openssh.002-SUSv-legacy.patch b/package/openssh/openssh.002-SUSv-legacy.patch
deleted file mode 100644
index 6aece09..0000000
--- a/package/openssh/openssh.002-SUSv-legacy.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -rdup openssh-4.6p1.oorig/openbsd-compat/port-tun.c openssh-4.6p1/openbsd-compat/port-tun.c
---- openssh-4.6p1.oorig/openbsd-compat/port-tun.c	2006-09-02 07:32:40.000000000 +0200
-+++ openssh-4.6p1/openbsd-compat/port-tun.c	2007-06-28 16:08:42.000000000 +0200
-@@ -66,7 +66,7 @@ sys_tun_open(int tun, int mode)
- 		return (-1);
- 	}
- 
--	bzero(&ifr, sizeof(ifr));	
-+	memset(&ifr, 0, sizeof(ifr));
- 
- 	if (mode == SSH_TUNMODE_ETHERNET) {
- 		ifr.ifr_flags = IFF_TAP;
-@@ -212,7 +212,7 @@ sys_tun_infilter(struct Channel *c, char
- 	if (len <= 0 || len > (int)(sizeof(rbuf) - sizeof(*af)))
- 		return (-1);
- 	ptr = (char *)&rbuf[0];
--	bcopy(buf, ptr + sizeof(u_int32_t), len);
-+	memmove(ptr + sizeof(u_int32_t), buf, len);
- 	len += sizeof(u_int32_t);
- 	af = (u_int32_t *)ptr;
- 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 988815a..236a3a8 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -3,12 +3,12 @@
 # openssh
 #
 #############################################################
-OPENSSH_VERSION=5.1p1
-OPENSSH_SITE=ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 
+OPENSSH_VERSION = 5.6p1
+OPENSSH_SITE = ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)"
 OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
-		--disable-utmpx --disable-wtmp --disable-wtmpx --without-x
+		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
diff --git a/package/openssh/openssh.patch b/package/openssh/openssh.patch
deleted file mode 100644
index c678d67..0000000
--- a/package/openssh/openssh.patch
+++ /dev/null
@@ -1,37 +0,0 @@
---- openssh-3.6.1p1/Makefile.in.orig	2003-03-20 17:34:34.000000000 -0700
-+++ openssh-3.6.1p1/Makefile.in	2003-04-25 17:09:00.000000000 -0600
-@@ -27,7 +27,7 @@
- RAND_HELPER=$(libexecdir)/ssh-rand-helper
- PRIVSEP_PATH=@PRIVSEP_PATH@
- SSH_PRIVSEP_USER=@SSH_PRIVSEP_USER@
--STRIP_OPT=@STRIP_OPT@
-+STRIP_OPT=
- 
- PATHS= -DSSHDIR=\"$(sysconfdir)\" \
- 	-D_PATH_SSH_PROGRAM=\"$(SSH_PROGRAM)\" \
-
---- openssh-4.6p1.oorig/sshd_config	2006-07-24 06:06:47.000000000 +0200
-+++ openssh-4.6p1/sshd_config	2007-06-28 15:58:49.000000000 +0200
-@@ -83,9 +83,11 @@
- #AllowTcpForwarding yes
- #GatewayPorts no
- #X11Forwarding no
-+X11Forwarding yes
- #X11DisplayOffset 10
- #X11UseLocalhost yes
- #PrintMotd yes
-+PrintMotd no
- #PrintLastLog yes
- #TCPKeepAlive yes
- #UseLogin no
-@@ -102,8 +104,12 @@
- # no default banner path
- #Banner none
- 
-+ClientAliveInterval 15
-+ClientAliveCountMax 4
-+AcceptEnv LANG LC_*
-+
- # override default of no subsystems
- Subsystem	sftp	/usr/libexec/sftp-server
- 
-- 
1.7.2.2
