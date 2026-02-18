Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C284E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B965610D4;
	Thu, 19 Feb 2026 17:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Xsu-7IqkULT; Thu, 19 Feb 2026 17:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39BF4610F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521891;
	bh=gWeeaAwJUidYI49oNCOXrnHbGxK5NTu2+8eICIPRvtU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iOgDOZCx9ZOX2IJ+shnyEKksNnO43q6kT+tvC0bIai41uwnUM2S5H3GJU1fsdnF3g
	 OPkKfZsWii1bRVJ9R4W8eCVi7ZFChjpsVVbCx7jAWlVadR7Np/3MoDcFA0HtprReP6
	 b8RuCq7+h/2dU9QKdqDQFqu1a3HbOMBO3i2unTaW6Z59vDm3fQ1PeJefCUX78xb8OM
	 BFv3Yxo8u8ggBVf+utxbZ7opho4T6inpujvXRSfbUIpR8LeN8Seq0Rh7RSiGAa11QG
	 oucF16hamqCSzm6JHEVsRSMZi1I7mncqH766O40nEnAsd+82jT0HEF5yq7Nt8dO2hQ
	 wzPO5/C9Un+Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39BF4610F0;
	Thu, 19 Feb 2026 17:24:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 777C5206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2C2E40D04
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMM_RbnTsqCy for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CFBA40D03
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CFBA40D03
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A6EE82205; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:32:18 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: a5d0f1c6c264fccc54c9f95d6262759bf1836767
X-Git-Newrev: dfd467c970ad59b580f6fab8474a3dfc75575484
X-Patchwork-Hint: ignore
Message-Id: <20260219172414.6A6EE82205@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/nginx: patch
 CVE-2025-53859
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dfd467c970ad59b580f6fab8474a3dfc75575484
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fix the following vulnerability:

- CVE-2025-53859:
    NGINX Open Source and NGINX Plus have a vulnerability in the
    ngx_mail_smtp_module that might allow an unauthenticated attacker to
    over-read NGINX SMTP authentication process memory; as a result, the
    server side may leak arbitrary bytes sent in a request to the
    authentication server. This issue happens during the NGINX SMTP
    authentication process and requires the attacker to make preparations
    against the target system to extract the leaked data. The issue
    affects NGINX only if (1) it is built with the ngx_mail_smtp_module,
    (2) the smtp_auth directive is configured with method "none," and (3)
    the authentication server returns the "Auth-Wait" response header.
    Note: Software versions which have reached End of Technical Support
    (EoTS) are not evaluated.

For more information, see:
    - https://nvd.nist.gov/vuln/detail/CVE-2025-53859
    - https://nginx.org/download/patch.2025.smtp.txt

(cherry picked from commit a0081aa1f8c332d5fb6dbb19de9e46cb39be4931)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nginx/0010-CVE-2025-53859.patch | 130 ++++++++++++++++++++++++++++++++
 package/nginx/nginx.mk                  |   3 +
 2 files changed, 133 insertions(+)

diff --git a/package/nginx/0010-CVE-2025-53859.patch b/package/nginx/0010-CVE-2025-53859.patch
new file mode 100644
index 0000000000..34befebd8a
--- /dev/null
+++ b/package/nginx/0010-CVE-2025-53859.patch
@@ -0,0 +1,130 @@
+CVE: CVE-2025-53859
+Upstream: https://nginx.org/download/patch.2025.smtp.txt
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+diff --git a/src/mail/ngx_mail_handler.c b/src/mail/ngx_mail_handler.c
+index 1167df3fb..d3be7f3b3 100644
+--- a/src/mail/ngx_mail_handler.c
++++ b/src/mail/ngx_mail_handler.c
+@@ -523,7 +523,7 @@ ngx_mail_starttls_only(ngx_mail_session_t *s, ngx_connection_t *c)
+ ngx_int_t
+ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
+ {
+-    u_char     *p, *last;
++    u_char     *p, *pos, *last;
+     ngx_str_t  *arg, plain;
+ 
+     arg = s->args.elts;
+@@ -555,7 +555,7 @@ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
+-    s->login.data = p;
++    pos = p;
+ 
+     while (p < last && *p) { p++; }
+ 
+@@ -565,7 +565,8 @@ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
+-    s->login.len = p++ - s->login.data;
++    s->login.len = p++ - pos;
++    s->login.data = pos;
+ 
+     s->passwd.len = last - p;
+     s->passwd.data = p;
+@@ -583,24 +584,26 @@ ngx_int_t
+ ngx_mail_auth_login_username(ngx_mail_session_t *s, ngx_connection_t *c,
+     ngx_uint_t n)
+ {
+-    ngx_str_t  *arg;
++    ngx_str_t  *arg, login;
+ 
+     arg = s->args.elts;
+ 
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth login username: \"%V\"", &arg[n]);
+ 
+-    s->login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[n].len));
+-    if (s->login.data == NULL) {
++    login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[n].len));
++    if (login.data == NULL) {
+         return NGX_ERROR;
+     }
+ 
+-    if (ngx_decode_base64(&s->login, &arg[n]) != NGX_OK) {
++    if (ngx_decode_base64(&login, &arg[n]) != NGX_OK) {
+         ngx_log_error(NGX_LOG_INFO, c->log, 0,
+             "client sent invalid base64 encoding in AUTH LOGIN command");
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
++    s->login = login;
++
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth login username: \"%V\"", &s->login);
+ 
+@@ -611,7 +614,7 @@ ngx_mail_auth_login_username(ngx_mail_session_t *s, ngx_connection_t *c,
+ ngx_int_t
+ ngx_mail_auth_login_password(ngx_mail_session_t *s, ngx_connection_t *c)
+ {
+-    ngx_str_t  *arg;
++    ngx_str_t  *arg, passwd;
+ 
+     arg = s->args.elts;
+ 
+@@ -620,18 +623,19 @@ ngx_mail_auth_login_password(ngx_mail_session_t *s, ngx_connection_t *c)
+                    "mail auth login password: \"%V\"", &arg[0]);
+ #endif
+ 
+-    s->passwd.data = ngx_pnalloc(c->pool,
+-                                 ngx_base64_decoded_length(arg[0].len));
+-    if (s->passwd.data == NULL) {
++    passwd.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
++    if (passwd.data == NULL) {
+         return NGX_ERROR;
+     }
+ 
+-    if (ngx_decode_base64(&s->passwd, &arg[0]) != NGX_OK) {
++    if (ngx_decode_base64(&passwd, &arg[0]) != NGX_OK) {
+         ngx_log_error(NGX_LOG_INFO, c->log, 0,
+             "client sent invalid base64 encoding in AUTH LOGIN command");
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
++    s->passwd = passwd;
++
+ #if (NGX_DEBUG_MAIL_PASSWD)
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth login password: \"%V\"", &s->passwd);
+@@ -674,24 +678,26 @@ ngx_int_t
+ ngx_mail_auth_cram_md5(ngx_mail_session_t *s, ngx_connection_t *c)
+ {
+     u_char     *p, *last;
+-    ngx_str_t  *arg;
++    ngx_str_t  *arg, login;
+ 
+     arg = s->args.elts;
+ 
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth cram-md5: \"%V\"", &arg[0]);
+ 
+-    s->login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
+-    if (s->login.data == NULL) {
++    login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
++    if (login.data == NULL) {
+         return NGX_ERROR;
+     }
+ 
+-    if (ngx_decode_base64(&s->login, &arg[0]) != NGX_OK) {
++    if (ngx_decode_base64(&login, &arg[0]) != NGX_OK) {
+         ngx_log_error(NGX_LOG_INFO, c->log, 0,
+             "client sent invalid base64 encoding in AUTH CRAM-MD5 command");
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
++    s->login = login;
++
+     p = s->login.data;
+     last = p + s->login.len;
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 6ca1ac2075..9ea432abdb 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -19,6 +19,9 @@ NGINX_CONF_OPTS = \
 	--with-cpp="$(TARGET_CC)" \
 	--with-ld-opt="$(TARGET_LDFLAGS)"
 
+# 0010-CVE-2025-53859.patch
+NGINX_IGNORE_CVES += CVE-2025-53859
+
 # www-data user and group are used for nginx. Because these user and group
 # are already set by buildroot, it is not necessary to redefine them.
 # See system/skeleton/etc/passwd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
