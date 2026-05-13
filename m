Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A64CD4F24
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 10:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A668A61197;
	Wed, 13 May 2026 10:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKfvsQe3B8Ye; Wed, 13 May 2026 10:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8041E6116B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778668760;
	bh=pdKf4ZrytfWqagK/9bMcVFyKxziyidY4wFplr5y9rho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=AqwdYzKfJ/uIUJ+onCL6sA80HqE8AGbR/IJvdqQSnv3WgS0LxjqB1bNN9QKR0EM61
	 q96TDd1GQvFCmKgcELFlvnuBPAkdPbw45ChqIXr7YPgxIp+OMrtK/pb+Pq41KXaCCV
	 DkBsOq4TnWM3zs5zzOU+0H7Fvvy2m8M6Xqw15or3eFJBhkMrWOFS2VK/mBGTKy0OQ/
	 VmqH9xTR5aVwIUt2X6Exihl9DgVzarfsW+x+fndKpmeqNCpamBdhbtX2aD5imoTTk/
	 aocDJVFAVe7bGu4gts7VQcFtpfhqbV5cWP0gWDXS8/0j1TT9HB9LFkaDE0CzV5oY36
	 xdLLqMIbaxqhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8041E6116B;
	Wed, 13 May 2026 10:39:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEFE015F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A497383E64
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQSZGwxq4HmV for <buildroot@buildroot.org>;
 Wed, 13 May 2026 10:39:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6979683E70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6979683E70
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6979683E70
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:39:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-45ae6a0e523so1202714f8f.1
 for <buildroot@buildroot.org>; Wed, 13 May 2026 03:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778668755; x=1779273555;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6KHNvxICcaLGZsOXVE5T9Wnr9rhG3N+wPd2Q3ky4CM=;
 b=XyDqgv2UWDoi9GZEpXmRaqRZWaVcMyLTX6pAmAQpRg81VYm5Ma/XiFyIOBoFoDYhKB
 BqHSXHMJuuKjbsmvKybXLC35q5KiREEPQZoIGj28OCJ2IXlyx+Fk6zVbFoY2I5CWI2qh
 yH4OGKtIHmQSg5gEd7Lg9lATUjXiDblOCtfvqMhn08J7Ls0LDErAsaZUfvWT6cSO//fx
 3fNck8kRD0v/eQicBJMJ8jGIOlHyxcls1dyMrtCHG3rAryBkyqDoB4zVwtqcOVC63gIj
 DY0onpuYQxM9Xdln702JK0FhcRGT82OaM6Yg79qWiecfykl9Be1BIX4N0GT75wj0ZT7Z
 QHwQ==
X-Gm-Message-State: AOJu0YyZtyR4NOO/HkRvhypcZlq6dHfXW2LimMoqhYySbpxKqifPqurM
 HZo2++drvwJrXB7Pr89cAT6xOxS1yGI7vn6Y8JQqN9ow5JPG00d2kDPPII4lBXY53yXcsVA1ROS
 45XVv
X-Gm-Gg: Acq92OGtsAkM44DFwBYccmAKJ/HvG17/IvHq/RzZlq//R4nVxY3wsGf3AIYCcxOhtuX
 9CFBkbNuyba+iSfdXQoZFNJsB2k22C39PGp+2ninoOC4DFFmu2jfChsY056MoVfYfEezqywqibT
 aNZ2To4E+ovKTX55prR017pdqi6BfxHWZzHfjEJhtfztbg51OlAi1pIE8NF+FdmlbbKTJbdxPH+
 1hXm2bt0B368rzE2uTG9ov8KJLGhDPhRhL8QvX5Y3TwOXq/2qyVCt1aahuNbhmRwEQdW3bLIN6x
 XsQhIOkSy3oFC7H4Y9PLmgC6K9DEO1Q/+6fiDGJD1ghywN3GTrIcXt/pkx4R99kpRf2E3Quqr9c
 ce4oePD5yN5RF5fiDmvbMnglqeycaBeJ3Mvm9IE1ziV2AGJuaNZu5iCIn83tz9xJeaymksKv11v
 Rv7G+oNcV4IF4AEEm1h0/mEn+QHfO5xv3WOy6Tq5dET598YRc4+tFyFWQ=
X-Received: by 2002:a05:6000:2481:b0:452:a209:560 with SMTP id
 ffacd0b85a97d-45c59bd69bamr4324083f8f.28.1778668754754; 
 Wed, 13 May 2026 03:39:14 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454919c13c9sm38573215f8f.27.2026.05.13.03.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:39:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 12:39:07 +0200
Message-ID: <20260513103913.419755-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778668755; x=1779273555; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a6KHNvxICcaLGZsOXVE5T9Wnr9rhG3N+wPd2Q3ky4CM=;
 b=KZwqwDI2ipDfILPmjRDNVxKQFJVYtFjtCp2jnKVY57lYbRm980vfEzvuozcRvEr2RF
 NcxkELJgD6RA6Qx0dYRTnkCEhvt3MvpkDi2n4UsR5GZYbnYLk6pormH5Tpf08tBbq4yK
 WLbcwFwEmYgwYqYVyHZQQkfycRDf78jWSWyJMs+ITCd0XfKyoAgLbgTQmtCHH802PXtM
 I6rit7AyxKU1LwS4hLfO5o7cLTZ3gW0obIrug6iPLxchWeBX0uWi11wHqHyhvKvEboyy
 1jVkuhGIuRl+2tCaLxJFZOeVagwvuxad6IMNXX4FsALOe/AdyQ7x3zqI9JnqANvov3WR
 27gA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KZwqwDI2
Subject: [Buildroot] [PATCH 2025.02.x] package/proftpd: patch CVE-2026-42167
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- CVE-2026-42167:
    mod_sql in ProFTPD before 1.3.9a allows remote attackers to execute
    arbitrary code via a username, in scenarios where there is logging of
    USER requests with an expansion such as %U, and the SQL backend allows
    commands (e.g., COPY TO PROGRAM).

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-42167
 - https://github.com/proftpd/proftpd/issues/2052
 - https://github.com/proftpd/proftpd/commit/af90843baf7dcb8c6be1e5261be2d0b5b5850673

The backport was provided by the Fedora Community:
 - https://src.fedoraproject.org/rpms/proftpd/raw/epel9/f/2052.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/proftpd/0001-CVE-2026-42167.patch | 199 ++++++++++++++++++++++
 package/proftpd/proftpd.mk                |   3 +
 2 files changed, 202 insertions(+)
 create mode 100644 package/proftpd/0001-CVE-2026-42167.patch

diff --git a/package/proftpd/0001-CVE-2026-42167.patch b/package/proftpd/0001-CVE-2026-42167.patch
new file mode 100644
index 0000000000..8ac4803d3d
--- /dev/null
+++ b/package/proftpd/0001-CVE-2026-42167.patch
@@ -0,0 +1,199 @@
+From 415395b795436ae47cc25b2394e80033b80f11be Mon Sep 17 00:00:00 2001
+From: TJ Saunders <tj@castaglia.org>
+Date: Mon, 27 Apr 2026 12:13:09 -0700
+Subject: [PATCH] Issue #2052: When resolving any variable whose value is
+ supplied by the client, make sure we **always** escape that value text.
+
+CVE: CVE-2026-42167
+Upstream: https://github.com/proftpd/proftpd/commit/af90843baf7dcb8c6be1e5261be2d0b5b5850673
+Upstream: https://src.fedoraproject.org/rpms/proftpd/raw/epel9/f/2052.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ contrib/mod_sql.c | 103 ++++++++++++++++++++++++++++------------------
+ 1 file changed, 64 insertions(+), 39 deletions(-)
+
+diff --git a/contrib/mod_sql.c b/contrib/mod_sql.c
+index 4978b38b70..4872f5fa64 100644
+--- a/contrib/mod_sql.c
++++ b/contrib/mod_sql.c
+@@ -2,7 +2,7 @@
+  * ProFTPD: mod_sql -- SQL frontend
+  * Copyright (c) 1998-1999 Johnie Ingram.
+  * Copyright (c) 2001 Andrew Houghton.
+- * Copyright (c) 2004-2022 TJ Saunders
++ * Copyright (c) 2004-2026 TJ Saunders
+  *  
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License as published by
+@@ -760,40 +760,46 @@ static int is_escaped_text(const char *text, size_t text_len) {
+ }
+ 
+ static int sql_resolved_append_text(pool *p, struct sql_resolved *resolved,
+-    const char *text, size_t text_len) {
+-  char *new_text;
+-  size_t new_textlen;
++    const char *text, size_t text_len, int already_escaped) {
++  char *new_text = NULL;
++  size_t new_textlen = 0;
+ 
+   if (text == NULL ||
+       text_len == 0) {
+     return 0;
+   }
+ 
+-  /* For backward compatibility (see Issue #1149), we indulge in a little
+-   * heuristic here, and only escape the text if it hasn't already been
+-   * escaped.  How to properly tell?  If the first and last characters of
+-   * the given text are `'`, AND there are no other occurrences of that
+-   * character in the text, assume it has already been quoted.
+-   */
+-  if (is_escaped_text(text, text_len) == FALSE) {
+-    modret_t *mr;
++  new_text = (char *) text;
++  new_textlen = text_len;
+ 
+-    mr = sql_dispatch(sql_make_cmd(p, 2, resolved->conn_name, text),
+-      "sql_escapestring");
+-    if (check_response(mr, resolved->conn_flags) < 0) {
+-      errno = EIO;
+-      return -1;
+-    }
++  if (already_escaped == FALSE) {
++    /* For backward compatibility (see Issue #1149), we indulge in a little
++     * heuristic here, and only escape the text if it hasn't already been
++     * escaped.  How to properly tell?  If the first and last characters of
++     * the given text are `'`, AND there are no other occurrences of that
++     * character in the text, assume it has already been quoted.
++     *
++     * Per Issue #2052, we refine this to use this heuristic only if we do
++     * not already know that the text has been escaped.  Some callers may
++     * have already escaped the provided text for us.
++     */
++    if (is_escaped_text(text, text_len) == FALSE) {
++      modret_t *mr;
+ 
+-    new_text = (char *) mr->data;
+-    new_textlen = strlen(new_text);
++      mr = sql_dispatch(sql_make_cmd(p, 2, resolved->conn_name, text),
++        "sql_escapestring");
++      if (check_response(mr, resolved->conn_flags) < 0) {
++        errno = EIO;
++        return -1;
++      }
+ 
+-  } else {
+-    pr_trace_msg(trace_channel, 17,
+-      "text '%s' is already escaped, skipping escaping it again", text);
++      new_text = (char *) mr->data;
++      new_textlen = strlen(new_text);
+ 
+-    new_text = (char *) text;
+-    new_textlen = text_len;
++    } else {
++      pr_trace_msg(trace_channel, 17,
++        "text '%s' is already escaped, skipping escaping it again", text);
++    }
+   }
+ 
+   if (new_textlen > resolved->buflen) {
+@@ -811,7 +817,7 @@ static int sql_resolved_append_text(pool *p, struct sql_resolved *resolved,
+ 
+ static int sql_resolve_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
+     unsigned char logfmt_id, const char *jot_hint, const void *val) {
+-  int res = 0;
++  int res = 0, already_escaped = FALSE;
+   struct sql_resolved *resolved;
+ 
+   resolved = jot_ctx->log;
+@@ -970,35 +976,53 @@ static int sql_resolve_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
+         break;
+       }
+ 
++      /* Per Issue #2052, the following variable values can all be supplied
++       * remotely by the client.  As such, they should be escaped preemptively.
++       */
+       case LOGFMT_META_ANON_PASS:
+       case LOGFMT_META_BASENAME:
+-      case LOGFMT_META_CLASS:
+       case LOGFMT_META_CMD_PARAMS:
+       case LOGFMT_META_COMMAND:
+       case LOGFMT_META_DIR_NAME:
+       case LOGFMT_META_DIR_PATH:
++      case LOGFMT_META_FILENAME:
++      case LOGFMT_META_IDENT_USER:
++      case LOGFMT_META_METHOD:
++      case LOGFMT_META_ORIGINAL_USER:
++      case LOGFMT_META_RESPONSE_STR:
++      case LOGFMT_META_REMOTE_HOST:
++      case LOGFMT_META_RENAME_FROM:
++      case LOGFMT_META_USER:
++      case LOGFMT_META_XFER_PATH: {
++        modret_t *mr;
++
++        mr = sql_dispatch(sql_make_cmd(p, 2, resolved->conn_name,
++          (const char *) val), "sql_escapestring");
++        if (check_response(mr, resolved->conn_flags) < 0) {
++          errno = EIO;
++          return -1;
++        }
++
++        text = (char *) mr->data;
++        text_len = strlen(text);
++        already_escaped = TRUE;
++        break;
++      }
++
++      case LOGFMT_META_CLASS:
+       case LOGFMT_META_ENV_VAR:
+       case LOGFMT_META_EOS_REASON:
+-      case LOGFMT_META_FILENAME:
+       case LOGFMT_META_GROUP:
+-      case LOGFMT_META_IDENT_USER:
+       case LOGFMT_META_ISO8601:
+       case LOGFMT_META_LOCAL_FQDN:
+       case LOGFMT_META_LOCAL_IP:
+       case LOGFMT_META_LOCAL_NAME:
+-      case LOGFMT_META_METHOD:
+       case LOGFMT_META_NOTE_VAR:
+-      case LOGFMT_META_ORIGINAL_USER:
+       case LOGFMT_META_PROTOCOL:
+-      case LOGFMT_META_REMOTE_HOST:
+       case LOGFMT_META_REMOTE_IP:
+-      case LOGFMT_META_RENAME_FROM:
+-      case LOGFMT_META_RESPONSE_STR:
+-      case LOGFMT_META_USER:
+       case LOGFMT_META_VERSION:
+       case LOGFMT_META_VHOST_IP:
+       case LOGFMT_META_XFER_FAILURE:
+-      case LOGFMT_META_XFER_PATH:
+       case LOGFMT_META_XFER_STATUS:
+       case LOGFMT_META_XFER_TYPE:
+       default:
+@@ -1011,7 +1035,8 @@ static int sql_resolve_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
+       text_len = strlen(text);
+     }
+ 
+-    res = sql_resolved_append_text(p, resolved, text, text_len);
++    res = sql_resolved_append_text(p, resolved, text, text_len,
++      already_escaped);
+   }
+ 
+   return res;
+@@ -1074,7 +1099,7 @@ static int sql_resolve_on_default(pool *p, pr_jot_ctx_t *jot_ctx,
+         break;
+     }
+ 
+-    res = sql_resolved_append_text(p, resolved, text, text_len);
++    res = sql_resolved_append_text(p, resolved, text, text_len, FALSE);
+   }
+ 
+   return res;
+@@ -3175,7 +3200,7 @@ static int showinfo_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
+       }
+ 
+       text_len = strlen(text);
+-      res = sql_resolved_append_text(p, resolved, text, text_len);
++      res = sql_resolved_append_text(p, resolved, text, text_len, FALSE);
+ 
+     } else {
+       res = sql_resolve_on_meta(p, jot_ctx, logfmt_id, jot_hint, val);
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 84a499a5c0..7310cd02fe 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -11,6 +11,9 @@ PROFTPD_LICENSE_FILES = COPYING
 PROFTPD_CPE_ID_VENDOR = proftpd
 PROFTPD_SELINUX_MODULES = ftp
 
+# 0001-CVE-2026-42167.patch
+PROFTPD_IGNORE_CVES += CVE-2026-42167
+
 PROFTPD_CONF_ENV = \
 	ac_cv_func_setpgrp_void=yes \
 	ac_cv_func_setgrent_void=yes
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
