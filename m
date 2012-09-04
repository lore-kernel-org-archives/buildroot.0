From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Sep 2012 10:52:52 -0300
Subject: [Buildroot] [PATCH] openssh: bump to version 6.1p1
Message-ID: <1346766772-29761-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssh/openssh-drop-SUSv3-legacy.patch |  236 ++++++++++++++++++-----
 package/openssh/openssh.mk                      |    2 +-
 2 files changed, 185 insertions(+), 53 deletions(-)

diff --git a/package/openssh/openssh-drop-SUSv3-legacy.patch b/package/openssh/openssh-drop-SUSv3-legacy.patch
index 8299da1..3e79813 100644
--- a/package/openssh/openssh-drop-SUSv3-legacy.patch
+++ b/package/openssh/openssh-drop-SUSv3-legacy.patch
@@ -1,26 +1,36 @@
-Drop SUSv3 legacy fuctions
+From a66a3edccc336fe5942a50fd4347b452d3bdea1f Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 4 Sep 2012 09:42:03 -0300
+Subject: [PATCH] Drop SUSv3 legacy functions
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  auth2-jpake.c             |   24 ++++++++++++------------
+ authfd.c                  |    2 +-
+ authfile.c                |    6 +++---
+ bufaux.c                  |    2 +-
+ bufec.c                   |    4 ++--
+ canohost.c                |    2 +-
  channels.c                |    6 +++---
  clientloop.c              |    4 ++--
+ hostfile.c                |    2 +-
  jpake.c                   |    6 +++---
- monitor.c                 |   18 +++++++++---------
+ monitor.c                 |   20 ++++++++++----------
  openbsd-compat/port-tun.c |    4 ++--
+ sandbox-systrace.c        |    2 +-
  schnorr.c                 |    6 +++---
  session.c                 |    2 +-
  sftp-client.c             |    2 +-
  ssh-keygen.c              |    2 +-
  ssh.c                     |    8 ++++----
  sshconnect2.c             |   22 +++++++++++-----------
- 12 files changed, 52 insertions(+), 52 deletions(-)
+ 19 files changed, 63 insertions(+), 63 deletions(-)
 
 diff --git a/auth2-jpake.c b/auth2-jpake.c
-index 5de5506..b34d696 100644
+index a460e82..caa8c6f 100644
 --- a/auth2-jpake.c
 +++ b/auth2-jpake.c
-@@ -173,7 +173,7 @@ derive_rawsalt(const char *username, u_char *rawsalt, u_int len)
+@@ -178,7 +178,7 @@ derive_rawsalt(const char *username, u_char *rawsalt, u_int len)
  		fatal("%s: not enough bytes for rawsalt (want %u have %u)",
  		    __func__, len, digest_len);
  	memcpy(rawsalt, digest, len);
@@ -29,7 +39,7 @@ index 5de5506..b34d696 100644
  	xfree(digest);
  }
  
-@@ -198,10 +198,10 @@ makesalt(u_int want, const char *user)
+@@ -203,10 +203,10 @@ makesalt(u_int want, const char *user)
  		fatal("%s: want %u", __func__, want);
  
  	derive_rawsalt(user, rawsalt, sizeof(rawsalt));
@@ -42,7 +52,7 @@ index 5de5506..b34d696 100644
  
  	return ret;
  }
-@@ -355,7 +355,7 @@ auth2_jpake_get_pwdata(Authctxt *authctxt, BIGNUM **s,
+@@ -360,7 +360,7 @@ auth2_jpake_get_pwdata(Authctxt *authctxt, BIGNUM **s,
  	debug3("%s: scheme = %s", __func__, *hash_scheme);
  	JPAKE_DEBUG_BN((*s, "%s: s = ", __func__));
  #endif
@@ -51,7 +61,7 @@ index 5de5506..b34d696 100644
  	xfree(secret);
  }
  
-@@ -396,12 +396,12 @@ auth2_jpake_start(Authctxt *authctxt)
+@@ -401,12 +401,12 @@ auth2_jpake_start(Authctxt *authctxt)
  	packet_send();
  	packet_write_wait();
  
@@ -68,7 +78,7 @@ index 5de5506..b34d696 100644
  	xfree(x3_proof);
  	xfree(x4_proof);
  
-@@ -448,8 +448,8 @@ input_userauth_jpake_client_step1(int type, u_int32_t seq, void *ctxt)
+@@ -453,8 +453,8 @@ input_userauth_jpake_client_step1(int type, u_int32_t seq, void *ctxt)
  	    &pctx->b,
  	    &x4_s_proof, &x4_s_proof_len));
  
@@ -79,7 +89,7 @@ index 5de5506..b34d696 100644
  	xfree(x1_proof);
  	xfree(x2_proof);
  
-@@ -463,7 +463,7 @@ input_userauth_jpake_client_step1(int type, u_int32_t seq, void *ctxt)
+@@ -468,7 +468,7 @@ input_userauth_jpake_client_step1(int type, u_int32_t seq, void *ctxt)
  	packet_send();
  	packet_write_wait();
  
@@ -88,7 +98,7 @@ index 5de5506..b34d696 100644
  	xfree(x4_s_proof);
  
  	/* Expect step 2 packet from peer */
-@@ -504,7 +504,7 @@ input_userauth_jpake_client_step2(int type, u_int32_t seq, void *ctxt)
+@@ -509,7 +509,7 @@ input_userauth_jpake_client_step2(int type, u_int32_t seq, void *ctxt)
  	    &pctx->k,
  	    &pctx->h_k_sid_sessid, &pctx->h_k_sid_sessid_len));
  
@@ -97,11 +107,97 @@ index 5de5506..b34d696 100644
  	xfree(x2_s_proof);
  
  	if (!use_privsep)
+diff --git a/authfd.c b/authfd.c
+index f037e83..0e51468 100644
+--- a/authfd.c
++++ b/authfd.c
+@@ -102,7 +102,7 @@ ssh_get_authentication_socket(void)
+ 	if (!authsocket)
+ 		return -1;
+ 
+-	bzero(&sunaddr, sizeof(sunaddr));
++	memset(&sunaddr, 0, sizeof(sunaddr));
+ 	sunaddr.sun_family = AF_UNIX;
+ 	strlcpy(sunaddr.sun_path, authsocket, sizeof(sunaddr.sun_path));
+ 
+diff --git a/authfile.c b/authfile.c
+index 7dd4496..068f75e 100644
+--- a/authfile.c
++++ b/authfile.c
+@@ -349,17 +349,17 @@ key_load_file(int fd, const char *filename, Buffer *blob)
+ 			    __func__, filename == NULL ? "" : filename,
+ 			    filename == NULL ? "" : " ", strerror(errno));
+ 			buffer_clear(blob);
+-			bzero(buf, sizeof(buf));
++			memset(buf, 0, sizeof(buf));
+ 			return 0;
+ 		}
+ 		buffer_append(blob, buf, len);
+ 		if (buffer_len(blob) > MAX_KEY_FILE_SIZE) {
+ 			buffer_clear(blob);
+-			bzero(buf, sizeof(buf));
++			memset(buf, 0, sizeof(buf));
+ 			goto toobig;
+ 		}
+ 	}
+-	bzero(buf, sizeof(buf));
++	memset(buf, 0, sizeof(buf));
+ 	if ((st.st_mode & (S_IFSOCK|S_IFCHR|S_IFIFO)) == 0 &&
+ 	    st.st_size != buffer_len(blob)) {
+ 		debug("%s: key file %.200s%schanged size while reading",
+diff --git a/bufaux.c b/bufaux.c
+index 00208ca..d82351d 100644
+--- a/bufaux.c
++++ b/bufaux.c
+@@ -215,7 +215,7 @@ buffer_get_cstring_ret(Buffer *buffer, u_int *length_ptr)
+ 		if (cp == ret + length - 1)
+ 			error("buffer_get_cstring_ret: string contains \\0");
+ 		else {
+-			bzero(ret, length);
++			memset(ret, 0, length);
+ 			xfree(ret);
+ 			return NULL;
+ 		}
+diff --git a/bufec.c b/bufec.c
+index 3dcb494..36c14e9 100644
+--- a/bufec.c
++++ b/bufec.c
+@@ -77,7 +77,7 @@ buffer_put_ecpoint_ret(Buffer *buffer, const EC_GROUP *curve,
+ 	ret = 0;
+  out:
+ 	if (buf != NULL) {
+-		bzero(buf, len);
++		memset(buf, 0, len);
+ 		xfree(buf);
+ 	}
+ 	BN_CTX_free(bnctx);
+@@ -130,7 +130,7 @@ buffer_get_ecpoint_ret(Buffer *buffer, const EC_GROUP *curve,
+ 	ret = 0;
+  out:
+ 	BN_CTX_free(bnctx);
+-	bzero(buf, len);
++	memset(buf, 0, len);
+ 	xfree(buf);
+ 	return ret;
+ }
+diff --git a/canohost.c b/canohost.c
+index dabd8a3..a302727 100644
+--- a/canohost.c
++++ b/canohost.c
+@@ -199,7 +199,7 @@ ipv64_normalise_mapped(struct sockaddr_storage *addr, socklen_t *len)
+ 	memcpy(&inaddr, ((char *)&a6->sin6_addr) + 12, sizeof(inaddr));
+ 	port = a6->sin6_port;
+ 
+-	bzero(a4, sizeof(*a4));
++	memset(a4, 0, sizeof(*a4));
+ 
+ 	a4->sin_family = AF_INET;
+ 	*len = sizeof(*a4);
 diff --git a/channels.c b/channels.c
-index 1cd5004..89dcfc6 100644
+index 7791feb..2e6dddf 100644
 --- a/channels.c
 +++ b/channels.c
-@@ -418,7 +418,7 @@ channel_free(Channel *c)
+@@ -425,7 +425,7 @@ channel_free(Channel *c)
  		if (cc->abandon_cb != NULL)
  			cc->abandon_cb(c, cc->ctx);
  		TAILQ_REMOVE(&c->status_confirms, cc, entry);
@@ -110,7 +206,7 @@ index 1cd5004..89dcfc6 100644
  		xfree(cc);
  	}
  	if (c->filter_cleanup != NULL && c->filter_ctx != NULL)
-@@ -2625,7 +2625,7 @@ channel_input_status_confirm(int type, u_int32_t seq, void *ctxt)
+@@ -2667,7 +2667,7 @@ channel_input_status_confirm(int type, u_int32_t seq, void *ctxt)
  		return;
  	cc->cb(type, c, cc->ctx);
  	TAILQ_REMOVE(&c->status_confirms, cc, entry);
@@ -119,7 +215,7 @@ index 1cd5004..89dcfc6 100644
  	xfree(cc);
  }
  
-@@ -3128,7 +3128,7 @@ channel_connect_ctx_free(struct channel_connect *cctx)
+@@ -3296,7 +3296,7 @@ channel_connect_ctx_free(struct channel_connect *cctx)
  	xfree(cctx->host);
  	if (cctx->aitop)
  		freeaddrinfo(cctx->aitop);
@@ -129,10 +225,10 @@ index 1cd5004..89dcfc6 100644
  	cctx->ai = cctx->aitop = NULL;
  }
 diff --git a/clientloop.c b/clientloop.c
-index de79793..2d08690 100644
+index 1c1a770..fd226e6 100644
 --- a/clientloop.c
 +++ b/clientloop.c
-@@ -533,7 +533,7 @@ client_global_request_reply(int type, u_int32_t seq, void *ctxt)
+@@ -551,7 +551,7 @@ client_global_request_reply(int type, u_int32_t seq, void *ctxt)
  		gc->cb(type, seq, gc->ctx);
  	if (--gc->ref_count <= 0) {
  		TAILQ_REMOVE(&global_confirms, gc, entry);
@@ -141,20 +237,33 @@ index de79793..2d08690 100644
  		xfree(gc);
  	}
  
-@@ -823,7 +823,7 @@ process_cmdline(void)
- 	int cancel_port;
+@@ -867,7 +867,7 @@ process_cmdline(void)
+ 	int cancel_port, ok;
  	Forward fwd;
  
 -	bzero(&fwd, sizeof(fwd));
 +	memset(&fwd, 0, sizeof(fwd));
  	fwd.listen_host = fwd.connect_host = NULL;
  
- 	leave_raw_mode(force_tty_flag);
+ 	leave_raw_mode(options.request_tty == REQUEST_TTY_FORCE);
+diff --git a/hostfile.c b/hostfile.c
+index b6f924b..e25820d 100644
+--- a/hostfile.c
++++ b/hostfile.c
+@@ -330,7 +330,7 @@ free_hostkeys(struct hostkeys *hostkeys)
+ 		xfree(hostkeys->entries[i].host);
+ 		xfree(hostkeys->entries[i].file);
+ 		key_free(hostkeys->entries[i].key);
+-		bzero(hostkeys->entries + i, sizeof(*hostkeys->entries));
++		memset(hostkeys->entries + i, 0, sizeof(*hostkeys->entries));
+ 	}
+ 	if (hostkeys->entries != NULL)
+ 		xfree(hostkeys->entries);
 diff --git a/jpake.c b/jpake.c
-index cdf65f5..73ba954 100644
+index b010daf..147ffe7 100644
 --- a/jpake.c
 +++ b/jpake.c
-@@ -104,7 +104,7 @@ jpake_free(struct jpake_ctx *pctx)
+@@ -105,7 +105,7 @@ jpake_free(struct jpake_ctx *pctx)
  #define JPAKE_BUF_CLEAR_FREE(v, l)		\
  	do {					\
  		if ((v) != NULL) {		\
@@ -163,16 +272,16 @@ index cdf65f5..73ba954 100644
  			xfree(v);		\
  			(v) = NULL;		\
  			(l) = 0;		\
-@@ -132,7 +132,7 @@ jpake_free(struct jpake_ctx *pctx)
+@@ -133,7 +133,7 @@ jpake_free(struct jpake_ctx *pctx)
  #undef JPAKE_BN_CLEAR_FREE
  #undef JPAKE_BUF_CLEAR_FREE
  
--	bzero(pctx, sizeof(pctx));
+-	bzero(pctx, sizeof(*pctx));
 +	memset(pctx, 0, sizeof(pctx));
  	xfree(pctx);
  }
  
-@@ -437,7 +437,7 @@ jpake_check_confirm(const BIGNUM *k,
+@@ -444,7 +444,7 @@ jpake_check_confirm(const BIGNUM *k,
  	else if (timingsafe_bcmp(peer_confirm_hash, expected_confirm_hash,
  	    expected_confirm_hash_len) == 0)
  		success = 1;
@@ -182,10 +291,19 @@ index cdf65f5..73ba954 100644
  	debug3("%s: success = %d", __func__, success);
  	return success;
 diff --git a/monitor.c b/monitor.c
-index 9eb4e35..0e85b7a 100644
+index e9802a3..97a50f6 100644
 --- a/monitor.c
 +++ b/monitor.c
-@@ -2028,8 +2028,8 @@ mm_answer_jpake_step1(int sock, Buffer *m)
+@@ -547,7 +547,7 @@ monitor_read(struct monitor *pmonitor, struct mon_table *ent,
+ 	struct pollfd pfd[2];
+ 
+ 	for (;;) {
+-		bzero(&pfd, sizeof(pfd));
++		memset(&pfd, 0, sizeof(pfd));
+ 		pfd[0].fd = pmonitor->m_sendfd;
+ 		pfd[0].events = POLLIN;
+ 		pfd[1].fd = pmonitor->m_log_recvfd;
+@@ -2137,8 +2137,8 @@ mm_answer_jpake_step1(int sock, Buffer *m)
  	debug3("%s: sending step1", __func__);
  	mm_request_send(sock, MONITOR_ANS_JPAKE_STEP1, m);
  
@@ -196,7 +314,7 @@ index 9eb4e35..0e85b7a 100644
  	xfree(x3_proof);
  	xfree(x4_proof);
  
-@@ -2058,8 +2058,8 @@ mm_answer_jpake_get_pwdata(int sock, Buffer *m)
+@@ -2167,8 +2167,8 @@ mm_answer_jpake_get_pwdata(int sock, Buffer *m)
  	debug3("%s: sending pwdata", __func__);
  	mm_request_send(sock, MONITOR_ANS_JPAKE_GET_PWDATA, m);
  
@@ -207,7 +325,7 @@ index 9eb4e35..0e85b7a 100644
  	xfree(hash_scheme);
  	xfree(salt);
  
-@@ -2098,8 +2098,8 @@ mm_answer_jpake_step2(int sock, Buffer *m)
+@@ -2207,8 +2207,8 @@ mm_answer_jpake_step2(int sock, Buffer *m)
  
  	JPAKE_DEBUG_CTX((pctx, "step2 done in %s", __func__));
  
@@ -218,7 +336,7 @@ index 9eb4e35..0e85b7a 100644
  	xfree(x1_proof);
  	xfree(x2_proof);
  
-@@ -2111,7 +2111,7 @@ mm_answer_jpake_step2(int sock, Buffer *m)
+@@ -2220,7 +2220,7 @@ mm_answer_jpake_step2(int sock, Buffer *m)
  	debug3("%s: sending step2", __func__);
  	mm_request_send(sock, MONITOR_ANS_JPAKE_STEP2, m);
  
@@ -227,7 +345,7 @@ index 9eb4e35..0e85b7a 100644
  	xfree(x4_s_proof);
  
  	monitor_permit(mon_dispatch, MONITOR_REQ_JPAKE_KEY_CONFIRM, 1);
-@@ -2145,7 +2145,7 @@ mm_answer_jpake_key_confirm(int sock, Buffer *m)
+@@ -2254,7 +2254,7 @@ mm_answer_jpake_key_confirm(int sock, Buffer *m)
  
  	JPAKE_DEBUG_CTX((pctx, "key_confirm done in %s", __func__));
  
@@ -236,7 +354,7 @@ index 9eb4e35..0e85b7a 100644
  	buffer_clear(m);
  
  	/* pctx->k is sensitive, not sent */
-@@ -2179,7 +2179,7 @@ mm_answer_jpake_check_confirm(int sock, Buffer *m)
+@@ -2288,7 +2288,7 @@ mm_answer_jpake_check_confirm(int sock, Buffer *m)
  
  	JPAKE_DEBUG_CTX((pctx, "check_confirm done in %s", __func__));
  
@@ -267,8 +385,21 @@ index 0d756f7..98332ae 100644
  	len += sizeof(u_int32_t);
  	af = (u_int32_t *)ptr;
  
+diff --git a/sandbox-systrace.c b/sandbox-systrace.c
+index 2d16a62..fcd657a 100644
+--- a/sandbox-systrace.c
++++ b/sandbox-systrace.c
+@@ -140,7 +140,7 @@ ssh_sandbox_parent(struct ssh_sandbox *box, pid_t child_pid,
+ 		    box->systrace_fd, child_pid, strerror(errno));
+ 
+ 	/* Allocate and assign policy */
+-	bzero(&policy, sizeof(policy));
++	memset(&policy, 0, sizeof(policy));
+ 	policy.strp_op = SYSTR_POLICY_NEW;
+ 	policy.strp_maxents = SYS_MAXSYSCALL;
+ 	if (ioctl(box->systrace_fd, STRIOCPOLICY, &policy) == -1)
 diff --git a/schnorr.c b/schnorr.c
-index c17ff32..ec4e41b 100644
+index 4d54d68..e626400 100644
 --- a/schnorr.c
 +++ b/schnorr.c
 @@ -101,7 +101,7 @@ schnorr_hash(const BIGNUM *p, const BIGNUM *q, const BIGNUM *g,
@@ -280,7 +411,7 @@ index c17ff32..ec4e41b 100644
  	xfree(digest);
  	digest_len = 0;
  	if (success == 0)
-@@ -451,7 +451,7 @@ hash_buffer(const u_char *buf, u_int len, const EVP_MD *md,
+@@ -477,7 +477,7 @@ hash_buffer(const u_char *buf, u_int len, const EVP_MD *md,
  	success = 0;
   out:
  	EVP_MD_CTX_cleanup(&evp_md_ctx);
@@ -289,7 +420,7 @@ index c17ff32..ec4e41b 100644
  	digest_len = 0;
  	return success;
  }
-@@ -544,7 +544,7 @@ modp_group_free(struct modp_group *grp)
+@@ -570,7 +570,7 @@ modp_group_free(struct modp_group *grp)
  		BN_clear_free(grp->p);
  	if (grp->q != NULL)
  		BN_clear_free(grp->q);
@@ -299,10 +430,10 @@ index c17ff32..ec4e41b 100644
  }
  
 diff --git a/session.c b/session.c
-index 71e4fbe..70c51f2 100644
+index 65bf287..440c68e 100644
 --- a/session.c
 +++ b/session.c
-@@ -1895,7 +1895,7 @@ session_unused(int id)
+@@ -1840,7 +1840,7 @@ session_unused(int id)
  		fatal("%s: insane session id %d (max %d nalloc %d)",
  		    __func__, id, options.max_sessions, sessions_nalloc);
  	}
@@ -312,10 +443,10 @@ index 71e4fbe..70c51f2 100644
  	sessions[id].used = 0;
  	sessions[id].chanid = -1;
 diff --git a/sftp-client.c b/sftp-client.c
-index 9dab477..0815b41 100644
+index 85f2bd4..09ec360 100644
 --- a/sftp-client.c
 +++ b/sftp-client.c
-@@ -289,7 +289,7 @@ get_decode_statvfs(int fd, struct sftp_statvfs *st, u_int expected_id,
+@@ -308,7 +308,7 @@ get_decode_statvfs(struct sftp_conn *conn, struct sftp_statvfs *st,
  		    SSH2_FXP_EXTENDED_REPLY, type);
  	}
  
@@ -325,10 +456,10 @@ index 9dab477..0815b41 100644
  	st->f_frsize = buffer_get_int64(&msg);
  	st->f_blocks = buffer_get_int64(&msg);
 diff --git a/ssh-keygen.c b/ssh-keygen.c
-index d90b1df..d78837a 100644
+index a223ddc..dd7f430 100644
 --- a/ssh-keygen.c
 +++ b/ssh-keygen.c
-@@ -1503,7 +1503,7 @@ parse_absolute_time(const char *s)
+@@ -1660,7 +1660,7 @@ parse_absolute_time(const char *s)
  		fatal("Invalid certificate time format %s", s);
  	}
  
@@ -338,10 +469,10 @@ index d90b1df..d78837a 100644
  		fatal("Invalid certificate time %s", s);
  	if ((tt = mktime(&tm)) < 0)
 diff --git a/ssh.c b/ssh.c
-index 4419f76..52a8b5e 100644
+index 3f61eb0..4a3d2fc 100644
 --- a/ssh.c
 +++ b/ssh.c
-@@ -1436,8 +1436,8 @@ load_public_identity_files(void)
+@@ -1509,8 +1509,8 @@ load_public_identity_files(void)
  #endif /* PKCS11 */
  
  	n_ids = 0;
@@ -352,7 +483,7 @@ index 4419f76..52a8b5e 100644
  
  #ifdef ENABLE_PKCS11
  	if (options.pkcs11_provider != NULL &&
-@@ -1511,8 +1511,8 @@ load_public_identity_files(void)
+@@ -1584,9 +1584,9 @@ load_public_identity_files(void)
  	memcpy(options.identity_files, identity_files, sizeof(identity_files));
  	memcpy(options.identity_keys, identity_keys, sizeof(identity_keys));
  
@@ -363,11 +494,12 @@ index 4419f76..52a8b5e 100644
 +	memset(pwdir, 0, strlen(pwdir));
  	xfree(pwdir);
  }
+ 
 diff --git a/sshconnect2.c b/sshconnect2.c
-index 4c379ae..b5502c2 100644
+index 7c369d7..bc362e6 100644
 --- a/sshconnect2.c
 +++ b/sshconnect2.c
-@@ -948,14 +948,14 @@ jpake_password_to_secret(Authctxt *authctxt, const char *crypt_scheme,
+@@ -1010,14 +1010,14 @@ jpake_password_to_secret(Authctxt *authctxt, const char *crypt_scheme,
  	    &secret, &secret_len) != 0)
  		fatal("%s: hash_buffer", __func__);
  
@@ -385,7 +517,7 @@ index 4c379ae..b5502c2 100644
  	xfree(secret);
  
  	return ret;
-@@ -992,8 +992,8 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
+@@ -1054,8 +1054,8 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
  
  	/* Obtain password and derive secret */
  	pctx->s = jpake_password_to_secret(authctxt, crypt_scheme, salt);
@@ -396,7 +528,7 @@ index 4c379ae..b5502c2 100644
  	xfree(crypt_scheme);
  	xfree(salt);
  	JPAKE_DEBUG_BN((pctx->s, "%s: s = ", __func__));
-@@ -1008,8 +1008,8 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
+@@ -1070,8 +1070,8 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
  	    &pctx->a,
  	    &x2_s_proof, &x2_s_proof_len);
  
@@ -407,7 +539,7 @@ index 4c379ae..b5502c2 100644
  	xfree(x3_proof);
  	xfree(x4_proof);
  
-@@ -1021,7 +1021,7 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
+@@ -1083,7 +1083,7 @@ input_userauth_jpake_server_step1(int type, u_int32_t seq, void *ctxt)
  	packet_put_string(x2_s_proof, x2_s_proof_len);
  	packet_send();
  
@@ -416,7 +548,7 @@ index 4c379ae..b5502c2 100644
  	xfree(x2_s_proof);
  
  	/* Expect step 2 packet from peer */
-@@ -1061,7 +1061,7 @@ input_userauth_jpake_server_step2(int type, u_int32_t seq, void *ctxt)
+@@ -1123,7 +1123,7 @@ input_userauth_jpake_server_step2(int type, u_int32_t seq, void *ctxt)
  	    &pctx->k,
  	    &pctx->h_k_cid_sessid, &pctx->h_k_cid_sessid_len);
  
@@ -425,7 +557,7 @@ index 4c379ae..b5502c2 100644
  	xfree(x4_s_proof);
  
  	JPAKE_DEBUG_CTX((pctx, "confirm sending in %s", __func__));
-@@ -1725,8 +1725,8 @@ userauth_jpake(Authctxt *authctxt)
+@@ -1787,8 +1787,8 @@ userauth_jpake(Authctxt *authctxt)
  	packet_put_string(x2_proof, x2_proof_len);
  	packet_send();
  
@@ -437,5 +569,5 @@ index 4c379ae..b5502c2 100644
  	xfree(x2_proof);
  
 -- 
-1.7.2.2
+1.7.8.6
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 0878fce..81a28a1 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSH_VERSION = 6.0p1
+OPENSSH_VERSION = 6.1p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
-- 
1.7.8.6
