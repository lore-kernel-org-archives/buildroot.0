Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4BEFCC056
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4780613D8;
	Fri,  6 Mar 2026 18:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LboK2mod04uG; Fri,  6 Mar 2026 18:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBDAE613C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822444;
	bh=EpcZ4JEM7bllcDHL4cg+3y0I9ATI0Cd807+tTn6pG3U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KZDxPoXP9TEwU0Yg8UpB0szPL3nDBVoVEgKRd/sXsRoO3BkZi+XHqlb2PUibsHgg1
	 g1YlsBc4YFBWRZvwNLzpf1Ci8VV/IP8+4dzf5n8r6FLSbv+JGfTXDpLyt9lpXrgExL
	 74xWPMTIWhIaO17z6yq3qdZFNLQf+HMWqDllrpLy4am38basXo6iAX8OIuz/B5jyo6
	 0jniBIXkIyZnd2xCejF532nC//qbn5cnZNoTDmmmIv4IevWwAyBrECng2u6JHoNY5D
	 bHMcic5Sh96mIqgoy7CIw6xGZyjDwm8EUOHu4Nh5n1eCOntd+/y84ktHkMYu3re/Ca
	 6mFe9Qqvq/kYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBDAE613C7;
	Fri,  6 Mar 2026 18:40:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FA5A339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9035441DDB
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqYqiji65_H8 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D48F41E03
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D48F41E03
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61C17867A4; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2115e079efbf53bf20f48f281586a8f69174f921
X-Git-Newrev: 5cdf5fa4242c0b5e94c36c4f9fccc2a386f84a57
X-Patchwork-Hint: ignore
Message-Id: <20260306184030.61C17867A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkrb5: fix build with glibc 2.43
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5cdf5fa4242c0b5e94c36c4f9fccc2a386f84a57
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Fix-strchr-conformance-to-C23.patch       | 189 +++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/package/libkrb5/0001-Fix-strchr-conformance-to-C23.patch b/package/libkrb5/0001-Fix-strchr-conformance-to-C23.patch
new file mode 100644
index 0000000000..693ec7258a
--- /dev/null
+++ b/package/libkrb5/0001-Fix-strchr-conformance-to-C23.patch
@@ -0,0 +1,189 @@
+From ad4dcf1856dadc4b352b5c8ff08e51c7290fb41f Mon Sep 17 00:00:00 2001
+From: Alexander Bokovoy <abokovoy@redhat.com>
+Date: Wed, 10 Dec 2025 10:42:02 +0200
+Subject: [PATCH] Fix strchr() conformance to C23
+
+C23 7.28.5.1 specifies search functions such as strchr() as generic,
+returning const char * if the first argument is of type const char *.
+Fix uses of strchr() to conform to this change.
+
+[jrische@redhat.com: altered changes to avoid casts; fixed an
+additional case]
+[ghudson@mit.edu: condensed some declarations; rewrote commit message]
+
+ticket: 9191 (new)
+
+Upstream: https://github.com/krb5/krb5/commit/ad4dcf1856dadc4b352b5c8ff08e51c7290fb41f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/krb5/ccache/ccbase.c                      |  4 ++--
+ src/lib/krb5/os/expand_path.c                     |  3 ++-
+ src/lib/krb5/os/locate_kdc.c                      | 15 +++++++--------
+ src/plugins/preauth/pkinit/pkinit_crypto.h        |  2 +-
+ .../preauth/pkinit/pkinit_crypto_openssl.c        |  6 +++---
+ src/plugins/preauth/pkinit/pkinit_identity.c      |  2 +-
+ src/plugins/preauth/pkinit/pkinit_matching.c      |  2 +-
+ src/tests/responder.c                             |  3 +--
+ 8 files changed, 18 insertions(+), 19 deletions(-)
+
+diff --git a/src/lib/krb5/ccache/ccbase.c b/src/lib/krb5/ccache/ccbase.c
+index 696b681812d..30a0a410c50 100644
+--- a/src/lib/krb5/ccache/ccbase.c
++++ b/src/lib/krb5/ccache/ccbase.c
+@@ -201,8 +201,8 @@ krb5_cc_register(krb5_context context, const krb5_cc_ops *ops,
+ krb5_error_code KRB5_CALLCONV
+ krb5_cc_resolve (krb5_context context, const char *name, krb5_ccache *cache)
+ {
+-    char *pfx, *cp;
+-    const char *resid;
++    char *pfx;
++    const char *cp, *resid;
+     unsigned int pfxlen;
+     krb5_error_code err;
+     const krb5_cc_ops *ops;
+diff --git a/src/lib/krb5/os/expand_path.c b/src/lib/krb5/os/expand_path.c
+index 5cbccf08c8b..6569b8820bd 100644
+--- a/src/lib/krb5/os/expand_path.c
++++ b/src/lib/krb5/os/expand_path.c
+@@ -454,7 +454,8 @@ k5_expand_path_tokens_extra(krb5_context context, const char *path_in,
+ {
+     krb5_error_code ret;
+     struct k5buf buf;
+-    char *tok_begin, *tok_end, *tok_val, **extra_tokens = NULL, *path;
++    const char *tok_begin, *tok_end;
++    char *tok_val, **extra_tokens = NULL, *path;
+     const char *path_left;
+     size_t nargs = 0, i;
+     va_list ap;
+diff --git a/src/lib/krb5/os/locate_kdc.c b/src/lib/krb5/os/locate_kdc.c
+index c186bce51c5..0cceff80006 100644
+--- a/src/lib/krb5/os/locate_kdc.c
++++ b/src/lib/krb5/os/locate_kdc.c
+@@ -214,8 +214,8 @@ add_host_to_list(struct serverlist *list, const char *hostname, int port,
+ }
+ 
+ static void
+-parse_uri_if_https(const char *host_or_uri, k5_transport *transport,
+-                   const char **host, const char **uri_path)
++parse_uri_if_https(char *host_or_uri, k5_transport *transport,
++                   char **host, const char **uri_path)
+ {
+     char *cp;
+ 
+@@ -257,8 +257,7 @@ locate_srv_conf_1(krb5_context context, const krb5_data *realm,
+                   k5_transport transport, int udpport)
+ {
+     const char *realm_srv_names[4];
+-    char **hostlist = NULL, *realmstr = NULL, *host = NULL;
+-    const char *hostspec;
++    char **hostlist = NULL, *realmstr = NULL, *host = NULL, *hostspec;
+     krb5_error_code code;
+     size_t i;
+     int default_port;
+@@ -587,8 +586,8 @@ prof_locate_server(krb5_context context, const krb5_data *realm,
+  * Return a NULL *host_out if there are any problems parsing the URI.
+  */
+ static void
+-parse_uri_fields(const char *uri, k5_transport *transport_out,
+-                 const char **host_out, int *primary_out)
++parse_uri_fields(char *uri, k5_transport *transport_out,
++                 char **host_out, int *primary_out)
+ 
+ {
+     k5_transport transport;
+@@ -656,8 +655,8 @@ locate_uri(krb5_context context, const krb5_data *realm,
+     krb5_error_code ret;
+     k5_transport transport, host_trans;
+     struct srv_dns_entry *answers, *entry;
+-    char *host, *sitename;
+-    const char *host_field, *path;
++    char *host, *sitename, *host_field;
++    const char *path;
+     int port, def_port, primary;
+ 
+     ret = get_sitename(context, realm, &sitename);
+diff --git a/src/plugins/preauth/pkinit/pkinit_crypto.h b/src/plugins/preauth/pkinit/pkinit_crypto.h
+index 57bb3cb840b..be2d02c227a 100644
+--- a/src/plugins/preauth/pkinit/pkinit_crypto.h
++++ b/src/plugins/preauth/pkinit/pkinit_crypto.h
+@@ -440,7 +440,7 @@ krb5_error_code crypto_load_cas_and_crls
+ 		    defines the storage type (file, directory, etc) */
+ 	int catype,					/* IN
+ 		    defines the ca type (anchor, intermediate, crls) */
+-	char *id);					/* IN
++	const char *id);				/* IN
+ 		    defines the location (filename, directory name, etc) */
+ 
+ /*
+diff --git a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
+index bd25bae4789..d1fe18e5abf 100644
+--- a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
++++ b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
+@@ -4999,7 +4999,7 @@ load_cas_and_crls(krb5_context context,
+                   pkinit_req_crypto_context req_cryptoctx,
+                   pkinit_identity_crypto_context id_cryptoctx,
+                   int catype,
+-                  char *filename)
++                  const char *filename)
+ {
+     STACK_OF(X509_INFO) *sk = NULL;
+     STACK_OF(X509) *ca_certs = NULL;
+@@ -5157,7 +5157,7 @@ load_cas_and_crls_dir(krb5_context context,
+                       pkinit_req_crypto_context req_cryptoctx,
+                       pkinit_identity_crypto_context id_cryptoctx,
+                       int catype,
+-                      char *dirname)
++                      const char *dirname)
+ {
+     krb5_error_code retval = EINVAL;
+     char **fnames = NULL, *filename;
+@@ -5201,7 +5201,7 @@ crypto_load_cas_and_crls(krb5_context context,
+                          pkinit_identity_crypto_context id_cryptoctx,
+                          int idtype,
+                          int catype,
+-                         char *id)
++                         const char *id)
+ {
+     switch (idtype) {
+     case IDTYPE_FILE:
+diff --git a/src/plugins/preauth/pkinit/pkinit_identity.c b/src/plugins/preauth/pkinit/pkinit_identity.c
+index 0dcfcfc46a6..ad65f237b07 100644
+--- a/src/plugins/preauth/pkinit/pkinit_identity.c
++++ b/src/plugins/preauth/pkinit/pkinit_identity.c
+@@ -473,7 +473,7 @@ process_option_ca_crl(krb5_context context,
+                       const char *value,
+                       int catype)
+ {
+-    char *residual;
++    const char *residual;
+     unsigned int typelen;
+     int idtype;
+ 
+diff --git a/src/plugins/preauth/pkinit/pkinit_matching.c b/src/plugins/preauth/pkinit/pkinit_matching.c
+index 0ea072c8876..b3c8df1610f 100644
+--- a/src/plugins/preauth/pkinit/pkinit_matching.c
++++ b/src/plugins/preauth/pkinit/pkinit_matching.c
+@@ -262,7 +262,7 @@ parse_rule_component(krb5_context context,
+     char err_buf[128];
+     int ret;
+     struct keyword_desc *kw, *nextkw;
+-    char *nk;
++    const char *nk;
+     int found_next_kw = 0;
+     char *value = NULL;
+     size_t len;
+diff --git a/src/tests/responder.c b/src/tests/responder.c
+index 82f870ea5d4..4221a20283d 100644
+--- a/src/tests/responder.c
++++ b/src/tests/responder.c
+@@ -282,8 +282,7 @@ responder(krb5_context ctx, void *rawdata, krb5_responder_context rctx)
+     /* Provide a particular response for an OTP challenge. */
+     if (data->otp_answer != NULL) {
+         if (krb5_responder_otp_get_challenge(ctx, rctx, &ochl) == 0) {
+-            key = strchr(data->otp_answer, '=');
+-            if (key != NULL) {
++            if (strchr(data->otp_answer, '=') != NULL) {
+                 /* Make a copy of the answer that we can chop up. */
+                 key = strdup(data->otp_answer);
+                 if (key == NULL)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
