Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77635EDF145
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 10:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A5E607AD;
	Fri, 13 Feb 2026 10:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xH-S9hOKEXsD; Fri, 13 Feb 2026 10:05:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DDB2607C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770977141;
	bh=T5I1pkYfcGKVU19275sgVM9lDfN4mKj4ocA7Bzxvn9Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FC+tIEe+8S6HHqBzdB9YGuot09yGjKSlJSUwNsU7who9JOvLt0Tg4wQ7FyU1IDJlM
	 HnO3toy2BDQ4jzsjg+q1appmFsAbl48zn11UZJ/x1vnn8TlvwDvSU/P9iPJFkU9zr4
	 lCFXureW+VfTUYkc/Wajlq9Rg4Je3q6WYP1Ln4lHVJ9BqAJn/HjZRg398V85e9CiiW
	 dhczmYAuOTO1z/62IisxIGX+VWKc7PmT68yGlYOJffu9r++iDR1jUs0PC5EXxcRRG1
	 WqdYtBH1K3xSByUdbp/Vri2cx+rrtX5VzTJwvfUuVHyWmJDoiCfdvjQyy1MQLIktKg
	 1wavUzNzMtzig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DDB2607C5;
	Fri, 13 Feb 2026 10:05:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC4AFEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9A8C411EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xH4FhhaHqVH for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 10:05:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BF17411D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BF17411D4
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BF17411D4
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:05:37 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b885a18f620so94101766b.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 02:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770977136; x=1771581936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=34pLM2V0JbtagAq0LhCSxfcyt8f0BqEfXACgj/am6Ig=;
 b=k5eavwttBJb+x+Wiz7jvSJwb/OvG4CiXjZ6FrSLtOeO1W1m2Skeq9kaZ+CPhcuQva2
 NShXsXp7vi+w59L6GFBOB9RAgskOMQEpDQwvvrSCT4jK0WYup7ZcxwwOprAo94XjtAst
 PKiLPLdWNpkCR1JMEqmjFfEZB7wgIlTw2VrZuADJ3z4iMcn3KpSOgiREkNwdYSV2KANk
 CH/cb7o0exUgnp1vkyTy9kdESbbSWohLRPfbXOEK3ETOcqCtTGCofNWjPzoW4MtbiDIb
 iNdC02UTUk3ufI6AyLb5gjtbotAYg0DzGgc07nLfv+0PeLvp9fv7praAzRQQz13ScfKT
 E1Cw==
X-Gm-Message-State: AOJu0Yx+S1rsRnyccpQSigMAfv1q+J2R87aboZy33p9eXdbWGztAkvN5
 mcvpbzhLAmJM5NV4uIWEFpve/ojC0rITvTNOIPu5op3Qj+u1qIkdyz8ElMI2vSNgZysqs7HEBwY
 Aqae/
X-Gm-Gg: AZuq6aLKNyNE428N5QhCwX9iUZVB8MpS5gAaJBm4ZOJvFlP0PM12oiIHszsyhQAMKRB
 sBEVOqnTyqDaTrZ2GEIma8I0ljXWd5uF+HdiDGidzt6w9LX9moqOtMhTwi7MFR+gaWn2BVMT+JA
 NTyM5m6wu7qqXBo1MWs+/zskWp8OiP3gUIsaqC+kEXeoD2Y3tsN+OoxcbsRPWF436hoTFvQfkfS
 HhfVXLZ91NVdZTWLsUBUZkz8vuHGwZ0vgA+k3duWNilxybucuwLUVrf2VlqTgGrj8VTTinzX6ta
 xpQC6X90v9Gyz/yo0jRBYZQSMyPIhDc5GiZIFJLodjTqGgGsbKwWaukjn94KLkAOZ8VvnQXMLJ9
 zK15zu+AH/sGvwyoztxshV3vNL7d3ONekz91wCW0HWuaDxkHGCpYJKa5WqwkKmkPJPduNsiSNlH
 WDw0/8QivQJrt8srg=
X-Received: by 2002:a17:907:6e8d:b0:b7c:e4e9:b13f with SMTP id
 a640c23a62f3a-b8face24c53mr106811966b.39.1770977135610; 
 Fri, 13 Feb 2026 02:05:35 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6ec5740csm235981166b.56.2026.02.13.02.05.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 02:05:35 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 11:05:08 +0100
Message-ID: <20260213100508.422846-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770977136; x=1771581936; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=34pLM2V0JbtagAq0LhCSxfcyt8f0BqEfXACgj/am6Ig=;
 b=b70RAii2AyCzW1fOrpGanc8M/AWGAdNLE6yrj6JPY2iFrTYdMNWjZHaAtB5yRMrMju
 WmYV70K5gw18HTFni9Jp5tNVDPFokcS5jeBH+xx7RZhJ+sIk7w3yUSblad1U9WDxTK3I
 RmBUz9kABMn+lEWcD3Cod6mriLgKBSeN16onjgITOOlMVpODFbrpNAYLN7gT5+Mi3Gjf
 en1n7rrUI+H3ouyE3GB77I234GuWZ4lpT/iSIT76uEV0xIQ++UZeKzSwEYT/rPNbQas9
 KdSpVaDnhgmD2YKJtQcoN5HhhdXYNFnk1xKPlVyKQTF6KBvBJwfuSw+GYARAcQHxRhge
 CdGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=b70RAii2
Subject: [Buildroot] [2025.02.x, PATCH] package/nginx: patch CVE-2025-53859
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nginx/0010-CVE-2025-53859.patch | 130 ++++++++++++++++++++++++
 package/nginx/nginx.mk                  |   3 +
 2 files changed, 133 insertions(+)
 create mode 100644 package/nginx/0010-CVE-2025-53859.patch

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
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
