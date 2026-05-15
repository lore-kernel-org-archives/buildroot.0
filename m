Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0438CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ABB741C24;
	Fri, 15 May 2026 13:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsgtOPS-gpU5; Fri, 15 May 2026 13:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4447841C3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852079;
	bh=58y3LPR/24j+fyx/AI1ztYiLTYxSEKPQdrjJtls7RfQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h8X2CketKxhgMRjxrhY/pNZDKjumWVxgfsKU2QdP4pUjdpwV61c0tD8/E4Cx0y1nw
	 uz9BVXnRyB50vSy6IuoKJYJpiza1rxXO7NYSo5GoUS9D9GUd1oyMko/AYyCRYhT3sV
	 hpKHCZY0dLrPkyYGJlNz4jyK8ql3r5U0cIpL4mak80QO/KxnSFQS3YGdt4RyWv3b5j
	 6/L1QRCNWaLaJS7HycUdl1cf5Y3GRfGAnlQjzM0hQwu+FKe+Ja/kLu58WsHI1bV/g1
	 PGVxPV2ZZmhZOz6NFPviJPPFCzrRFMcbJzkOGbxqbhbpOjkpKm2/yY6WXTirz5sNNj
	 AkhNvKwuJiQ4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4447841C3C;
	Fri, 15 May 2026 13:34:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D905A36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB2A361662
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHZZSBFaPWYs for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A4A261667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A4A261667
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A4A261667
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48d102471a4so90061465e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852067; x=1779456867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GafwAwiEhUdWPc9Wrama/Q1tCOc5zpy9sK2FU+oFHC0=;
 b=Kp4axzGIzueCipqQmnyR4cUytCUjHZuZCuyZvzhuhy3BUXjuDWP9IFg7Hkhivg+UuY
 seGUDuGChty7k7EmJHMH2q10pJd+ZJKMeuUq4BX44quiPJHZBwkZqYimbDP6I2i7xHQI
 ii4+sNzPXd4Bce5PGrIlxSQlhV7ijSmU1HuPpDqfKFrciVJJ89d0EH2cigzFKDe8NZU2
 DFlCa91xZ6b8rsFT0GEPf6GdKu8hVbQ1lst5h7FVA3bGkqExkIMH7hhEsr9FnL2uG8lX
 hCW4PzsbVpnEOQ0qS6jyBziPlI9katZkERFBchm+P0B5KEqdwOHwAkXWKlYgVADPHU/P
 fggw==
X-Gm-Message-State: AOJu0YxheE2iU08jpDvcZ9yqdi33aDIOsJuLT2rFswylgc+aOahPhuVF
 NmfzFTQejVt6DUgiQEO8VXE9ev6T4kCW5ZbGYd1ngX69e6FBsMoc7JGhnjfXklgquJyR7dJYnMI
 gyp9u
X-Gm-Gg: Acq92OFU2GxOyH2in/V6IXKmkHqYgthLNx9eDnjtc4jHlha3uKkDaNmFABblO5yPQLY
 gT57b9sNSqVmbn2f+6M/z9oBLS8Iw0lWnrbu8+ANS7Di48WUnZxQpb1iHucSpWZvzbvN2aM48Vh
 /446NEnaBxqnPWfLcgPTpqPXspsjN3nDziA1qEpb/kxfrbBVGiS2pd3g9xOEMd4blFPcw2wqLQe
 VjgmNUBtKTWcNlq+gKHsjvIh2Gl5D9c+GpmlkhGcU0SCd9vz3+OsFLG6wTCgwQd9UjAYvzUglCW
 SPEcF4YxqxUvayrnKWRwEwrpU3wN3nAskfrJXvJ969qr+Vt/jtRH3neeMe+FPVamtA90h8kr+wL
 T0eaBSQWrkNfocXPGX3vbhb2GER6Ky8+a7rKF3pUuY6UrB4YeaL6HL7lIPl3vrY/DIui5YCZvA6
 Xbs0zYxV43Pf7iasWyFCe3GinIkP3R4NUCw+5P1Aj22oyA
X-Received: by 2002:a05:600c:8901:b0:48e:526e:1040 with SMTP id
 5b1f17b1804b1-48fe63021f9mr46058515e9.23.1778852067244; 
 Fri, 15 May 2026 06:34:27 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5694fbfsm111930775e9.6.2026.05.15.06.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:27 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:26 +0200
Message-ID: <20260515133426.317363-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513103913.419755-1-thomas.perale@mind.be>
References: <20260513103913.419755-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852067; x=1779456867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GafwAwiEhUdWPc9Wrama/Q1tCOc5zpy9sK2FU+oFHC0=;
 b=QGZNGdK+02vev8tsvdLAMk9SWl6dRCj4Ga2dtR3IdZs53DCrb7SMaO1l6sW2V8NMm8
 bz2sSEZ910vaB7yqOj88awse+K4GQHXWW+rVS52WwshMHD8Xz7oIx7Gj8FID2sRZmdY7
 Lsh8RoXfw6TL3rx8JbIu6I6n0quI2Ur/cC/xjVLAsa5SY7CNgj/jSRhTgkHXKrP9POmz
 cE82w0r1obOFabY1/+a/uj/wwPIErhCw4KDOSs/KWizvU0dm5dImMNm+j5AkJIYf+L0h
 iNbOK69qTLkcv+oes7P33baQ2xZ1PDR6TdiTssCwPpE6xFwlhM/pJDvQ85OHDbDe+XGG
 LDfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QGZNGdK+
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/proftpd: patch
 CVE-2026-42167
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

In reply of:
> - CVE-2026-42167:
>     mod_sql in ProFTPD before 1.3.9a allows remote attackers to execute
>     arbitrary code via a username, in scenarios where there is logging of
>     USER requests with an expansion such as %U, and the SQL backend allows
>     commands (e.g., COPY TO PROGRAM).
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-42167
>  - https://github.com/proftpd/proftpd/issues/2052
>  - https://github.com/proftpd/proftpd/commit/af90843baf7dcb8c6be1e5261be2d0b5b5850673
> 
> The backport was provided by the Fedora Community:
>  - https://src.fedoraproject.org/rpms/proftpd/raw/epel9/f/2052.patch
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/proftpd/0001-CVE-2026-42167.patch | 199 ++++++++++++++++++++++
>  package/proftpd/proftpd.mk                |   3 +
>  2 files changed, 202 insertions(+)
>  create mode 100644 package/proftpd/0001-CVE-2026-42167.patch
> 
> diff --git a/package/proftpd/0001-CVE-2026-42167.patch b/package/proftpd/0001-CVE-2026-42167.patch
> new file mode 100644
> index 0000000000..8ac4803d3d
> --- /dev/null
> +++ b/package/proftpd/0001-CVE-2026-42167.patch
> @@ -0,0 +1,199 @@
> +From 415395b795436ae47cc25b2394e80033b80f11be Mon Sep 17 00:00:00 2001
> +From: TJ Saunders <tj@castaglia.org>
> +Date: Mon, 27 Apr 2026 12:13:09 -0700
> +Subject: [PATCH] Issue #2052: When resolving any variable whose value is
> + supplied by the client, make sure we **always** escape that value text.
> +
> +CVE: CVE-2026-42167
> +Upstream: https://github.com/proftpd/proftpd/commit/af90843baf7dcb8c6be1e5261be2d0b5b5850673
> +Upstream: https://src.fedoraproject.org/rpms/proftpd/raw/epel9/f/2052.patch
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + contrib/mod_sql.c | 103 ++++++++++++++++++++++++++++------------------
> + 1 file changed, 64 insertions(+), 39 deletions(-)
> +
> +diff --git a/contrib/mod_sql.c b/contrib/mod_sql.c
> +index 4978b38b70..4872f5fa64 100644
> +--- a/contrib/mod_sql.c
> ++++ b/contrib/mod_sql.c
> +@@ -2,7 +2,7 @@
> +  * ProFTPD: mod_sql -- SQL frontend
> +  * Copyright (c) 1998-1999 Johnie Ingram.
> +  * Copyright (c) 2001 Andrew Houghton.
> +- * Copyright (c) 2004-2022 TJ Saunders
> ++ * Copyright (c) 2004-2026 TJ Saunders
> +  *  
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License as published by
> +@@ -760,40 +760,46 @@ static int is_escaped_text(const char *text, size_t text_len) {
> + }
> + 
> + static int sql_resolved_append_text(pool *p, struct sql_resolved *resolved,
> +-    const char *text, size_t text_len) {
> +-  char *new_text;
> +-  size_t new_textlen;
> ++    const char *text, size_t text_len, int already_escaped) {
> ++  char *new_text = NULL;
> ++  size_t new_textlen = 0;
> + 
> +   if (text == NULL ||
> +       text_len == 0) {
> +     return 0;
> +   }
> + 
> +-  /* For backward compatibility (see Issue #1149), we indulge in a little
> +-   * heuristic here, and only escape the text if it hasn't already been
> +-   * escaped.  How to properly tell?  If the first and last characters of
> +-   * the given text are `'`, AND there are no other occurrences of that
> +-   * character in the text, assume it has already been quoted.
> +-   */
> +-  if (is_escaped_text(text, text_len) == FALSE) {
> +-    modret_t *mr;
> ++  new_text = (char *) text;
> ++  new_textlen = text_len;
> + 
> +-    mr = sql_dispatch(sql_make_cmd(p, 2, resolved->conn_name, text),
> +-      "sql_escapestring");
> +-    if (check_response(mr, resolved->conn_flags) < 0) {
> +-      errno = EIO;
> +-      return -1;
> +-    }
> ++  if (already_escaped == FALSE) {
> ++    /* For backward compatibility (see Issue #1149), we indulge in a little
> ++     * heuristic here, and only escape the text if it hasn't already been
> ++     * escaped.  How to properly tell?  If the first and last characters of
> ++     * the given text are `'`, AND there are no other occurrences of that
> ++     * character in the text, assume it has already been quoted.
> ++     *
> ++     * Per Issue #2052, we refine this to use this heuristic only if we do
> ++     * not already know that the text has been escaped.  Some callers may
> ++     * have already escaped the provided text for us.
> ++     */
> ++    if (is_escaped_text(text, text_len) == FALSE) {
> ++      modret_t *mr;
> + 
> +-    new_text = (char *) mr->data;
> +-    new_textlen = strlen(new_text);
> ++      mr = sql_dispatch(sql_make_cmd(p, 2, resolved->conn_name, text),
> ++        "sql_escapestring");
> ++      if (check_response(mr, resolved->conn_flags) < 0) {
> ++        errno = EIO;
> ++        return -1;
> ++      }
> + 
> +-  } else {
> +-    pr_trace_msg(trace_channel, 17,
> +-      "text '%s' is already escaped, skipping escaping it again", text);
> ++      new_text = (char *) mr->data;
> ++      new_textlen = strlen(new_text);
> + 
> +-    new_text = (char *) text;
> +-    new_textlen = text_len;
> ++    } else {
> ++      pr_trace_msg(trace_channel, 17,
> ++        "text '%s' is already escaped, skipping escaping it again", text);
> ++    }
> +   }
> + 
> +   if (new_textlen > resolved->buflen) {
> +@@ -811,7 +817,7 @@ static int sql_resolved_append_text(pool *p, struct sql_resolved *resolved,
> + 
> + static int sql_resolve_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
> +     unsigned char logfmt_id, const char *jot_hint, const void *val) {
> +-  int res = 0;
> ++  int res = 0, already_escaped = FALSE;
> +   struct sql_resolved *resolved;
> + 
> +   resolved = jot_ctx->log;
> +@@ -970,35 +976,53 @@ static int sql_resolve_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
> +         break;
> +       }
> + 
> ++      /* Per Issue #2052, the following variable values can all be supplied
> ++       * remotely by the client.  As such, they should be escaped preemptively.
> ++       */
> +       case LOGFMT_META_ANON_PASS:
> +       case LOGFMT_META_BASENAME:
> +-      case LOGFMT_META_CLASS:
> +       case LOGFMT_META_CMD_PARAMS:
> +       case LOGFMT_META_COMMAND:
> +       case LOGFMT_META_DIR_NAME:
> +       case LOGFMT_META_DIR_PATH:
> ++      case LOGFMT_META_FILENAME:
> ++      case LOGFMT_META_IDENT_USER:
> ++      case LOGFMT_META_METHOD:
> ++      case LOGFMT_META_ORIGINAL_USER:
> ++      case LOGFMT_META_RESPONSE_STR:
> ++      case LOGFMT_META_REMOTE_HOST:
> ++      case LOGFMT_META_RENAME_FROM:
> ++      case LOGFMT_META_USER:
> ++      case LOGFMT_META_XFER_PATH: {
> ++        modret_t *mr;
> ++
> ++        mr = sql_dispatch(sql_make_cmd(p, 2, resolved->conn_name,
> ++          (const char *) val), "sql_escapestring");
> ++        if (check_response(mr, resolved->conn_flags) < 0) {
> ++          errno = EIO;
> ++          return -1;
> ++        }
> ++
> ++        text = (char *) mr->data;
> ++        text_len = strlen(text);
> ++        already_escaped = TRUE;
> ++        break;
> ++      }
> ++
> ++      case LOGFMT_META_CLASS:
> +       case LOGFMT_META_ENV_VAR:
> +       case LOGFMT_META_EOS_REASON:
> +-      case LOGFMT_META_FILENAME:
> +       case LOGFMT_META_GROUP:
> +-      case LOGFMT_META_IDENT_USER:
> +       case LOGFMT_META_ISO8601:
> +       case LOGFMT_META_LOCAL_FQDN:
> +       case LOGFMT_META_LOCAL_IP:
> +       case LOGFMT_META_LOCAL_NAME:
> +-      case LOGFMT_META_METHOD:
> +       case LOGFMT_META_NOTE_VAR:
> +-      case LOGFMT_META_ORIGINAL_USER:
> +       case LOGFMT_META_PROTOCOL:
> +-      case LOGFMT_META_REMOTE_HOST:
> +       case LOGFMT_META_REMOTE_IP:
> +-      case LOGFMT_META_RENAME_FROM:
> +-      case LOGFMT_META_RESPONSE_STR:
> +-      case LOGFMT_META_USER:
> +       case LOGFMT_META_VERSION:
> +       case LOGFMT_META_VHOST_IP:
> +       case LOGFMT_META_XFER_FAILURE:
> +-      case LOGFMT_META_XFER_PATH:
> +       case LOGFMT_META_XFER_STATUS:
> +       case LOGFMT_META_XFER_TYPE:
> +       default:
> +@@ -1011,7 +1035,8 @@ static int sql_resolve_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
> +       text_len = strlen(text);
> +     }
> + 
> +-    res = sql_resolved_append_text(p, resolved, text, text_len);
> ++    res = sql_resolved_append_text(p, resolved, text, text_len,
> ++      already_escaped);
> +   }
> + 
> +   return res;
> +@@ -1074,7 +1099,7 @@ static int sql_resolve_on_default(pool *p, pr_jot_ctx_t *jot_ctx,
> +         break;
> +     }
> + 
> +-    res = sql_resolved_append_text(p, resolved, text, text_len);
> ++    res = sql_resolved_append_text(p, resolved, text, text_len, FALSE);
> +   }
> + 
> +   return res;
> +@@ -3175,7 +3200,7 @@ static int showinfo_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
> +       }
> + 
> +       text_len = strlen(text);
> +-      res = sql_resolved_append_text(p, resolved, text, text_len);
> ++      res = sql_resolved_append_text(p, resolved, text, text_len, FALSE);
> + 
> +     } else {
> +       res = sql_resolve_on_meta(p, jot_ctx, logfmt_id, jot_hint, val);
> diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
> index 84a499a5c0..7310cd02fe 100644
> --- a/package/proftpd/proftpd.mk
> +++ b/package/proftpd/proftpd.mk
> @@ -11,6 +11,9 @@ PROFTPD_LICENSE_FILES = COPYING
>  PROFTPD_CPE_ID_VENDOR = proftpd
>  PROFTPD_SELINUX_MODULES = ftp
>  
> +# 0001-CVE-2026-42167.patch
> +PROFTPD_IGNORE_CVES += CVE-2026-42167
> +
>  PROFTPD_CONF_ENV = \
>  	ac_cv_func_setpgrp_void=yes \
>  	ac_cv_func_setgrent_void=yes
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
