Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2803EC79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 10:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF31E605D9;
	Mon,  7 Sep 2026 10:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7ScIvN-2QIe; Mon,  7 Sep 2026 10:18:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AFBD2605F5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788776314;
	b=M3zwxdqZq8MuFXDkbxtjT1GIs/EWHD5DWADpPrZeYXzmcC//Ypfi4WwvA9W5Pf+WxNMR
	 q4iE36561yrOCDJ2YFTEvHt10yBY4peGvlUNYPfOG0YJYW7pqtEhI9sD1a6SmVGe43p4K
	 elCQrDA3Cv3UKUW6MX/hZHSDwr26es/5UWK+1ENTDKhd15N5EVlDjr+THrpCUInO3ypEL
	 gdLvdcJQbXZqO4EN9TvTTfnZxXEA9pk6MJCauH2y0OKA4AGwMnHNmvDzDQsnJnl1U2yrb
	 aT9ncXRUdtcUJ/LDX0rjWARa+qV3eS2E37CLk6GJvxWp6FPcdJBNz6NPL0gjHDn8++A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788776314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=M3pSgB53/R+dFhbriV4jVSZwiYBgERKaWZaptBftoFc=;
	b=AAZ6CQ0FScoayNxoaHfjeOp6x9GsryRvKU098JkOluffx8wWawmmK9ZkClrpTId2GLcu
	 7nQlK3l+HSxuKMKoEVQEz6vHVrCdTRb8Yj/fobC0W5Gt9mjoOJL1SNLwURtUQTLoJIH+8
	 VSUmUYSMTRbb0T8yPb9X8HbRCXBTRlLnHeByOOZCMcZ/6SKeRilvJ4oiZCahHMlbQfzUa
	 UJZ1fmHtEQYguqWROt7PU5nDHUw1aY7WmUySZqLMibOoqenSQRTEmBdlH7TNHVvH7pBb9
	 DfBWySmq2iFTpjuxvOC/XpSI/AMs8Ty7QBrTX6Vxw+3uCk0+XnyHGh0nA7PmCp7X1xg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788776314;
	bh=M3pSgB53/R+dFhbriV4jVSZwiYBgERKaWZaptBftoFc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MLl+/yyKvMOtvNuA8g5bVaCMZaxD2xVkCAnUYOtOWvDYObJY0qJZ9ShJfVm9gSFBs
	 QiqwzgsmKGYHHhB5UIf7yELdyFgxl392cnFWkFQqljpSHYY3FY4Ij3Lg3Ug9x42fl3
	 5CdZmWCJfUN0AV2rz95GO2OTXHILy2cYwAFetoUGNF701oUhyqCXXF45xZSBL0jeOJ
	 N59MdgnAMQrkRIDCxF2aAf20osZLRUB5mRQfWQdl3q7w2FmwtbGppfN2mAC9gHzsOl
	 aeIz2KvTVQZlPygRTpIAV6dBtidA4qF44c0y73YuqfGFU/5prCv79iiSsqvLoA/qOy
	 Q1ERMiglUwihg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFBD2605F5;
	Mon,  7 Sep 2026 10:18:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2146E29B
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 10:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07D7F400F5
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 10:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_WPrPR0Q6Cr for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 10:18:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A0E11400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788776311;
 b=bvJxmhPLO+nLt25LsRThkFZql/XniCiw4Kr/cOm1vlUdVZ5IZGrBvc4aIC5plgYxgbQp
 lljVu/ibImnkDLEaqIfK6UMFCTZKaYRlTFp679R4srC4Ng0elTUpn1cgPM5FKA37kaZwp
 bqci9G5kOILHP6H3dLHMleIgVYi/pWZRAYTf9oE+k3UFzjPXf/RskY0aUbsV2vlpqCcyn
 UnwxGoCxUWO5N60haReOyr8SAzQZNC3rIhWpOlc9bs4aFQpTegjbjfiUHPUW1hTHHMY9R
 LF383mAw23fmHr2IZtdBM3uV3rhltFw/p3ktXxPT3XliJMDD8UP7s3CyQvIVY0Iq3vA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788776311;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=L9ZUWTRWgvEngkXhkeIvZHRskarm+1i1rMXGqsyinXM=;
 b=gxYmOGjd4umK0barkjXAB/MR8PtfIpcKeZ75CpiYCEcPJnnzAyTT8p/7gX3MRnt/0wJp
 Z+NeYokOt7CJMMCEB1BSQM+EIGLET/40hpCfZJWKeXyk+Wc2lJtmwC1/Sa8OKDVTEEi6o
 6LatnaF/pxwk/FBt5yNzxjgLjgoKBxOLQ1V2fPho5KXkR3HV2XfIIrz6mEczYKYLXb8Wp
 8Yxbe3LYtd0/uBRyOr0u/UFsaE7BAirhTA+XYZpXUHGZDjQfhJ2OQuZcU91xNuM7SS4pT
 q9eCzQjCvdxRfWDUMfc6N/SH+XD4ueRbuDZG4qdNPMxO0xh83i+zAuxdgK8bwc4/Xcw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=X5g9yjMa; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0E11400D5
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 10:18:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso32036595e9.1
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 03:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788776308; x=1789381108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L9ZUWTRWgvEngkXhkeIvZHRskarm+1i1rMXGqsyinXM=;
 b=ZbzrBa++K6EFGT/lVn/Y8EjbjwocZy1wTV9crcHRuOX+HN3ncc2FcXkfrdtgVuQIoO
 euVK9Hb8CpB169RzXGnxXjXlbeS8e5WHS173b+R29Q/rQ5JJoaIMktpMMvFShfbFGXDu
 YTuz8hnyVHORquGFjbyFJsw+nT17kosX3Vst8VzyhNTQTfVbIRmatoDeQWVlYW85Exqg
 dXiyU20AiUjnsmVY206vpdAXPNrrPia6XEVmUaIZ0xEg7QomQWDjmUqT6pu2hFULhKBI
 VGCh6Gltevuf/7Rc91F0vLvlKoisvoDroBZLLybjhpA87Q2gCho0Iy8p1bIFEdLPBx9d
 1OKQ==
X-Gm-Message-State: AFuF++kUIz3c6e7CFC7SZHm+3OqFlUWSqe2Me3y4aqDDRrf+0JuES1uS
 Gk8etLcn9wLLAuE36NCC3fbZeSyZ0i0swPBo5JL7JUSG83cgFitR0PEnCmr3D/Zt8D+Dr0CjP/U
 bw2J+HhU=
X-Gm-Gg: AYBFou22vsv8REx5xq+lZUuGr8JjyCEnxQuO11t/31nbGtJKpa2sP4zfuA7mU4x6OpH
 JCKbRye28968GaFlqS82eK7pM/pYfKpdj+RaR8tdQGFwFj7hCAPqnlZEQs3zdr9nUzzpNRG5L3h
 a1Ohsn39D7OEHZwDs5ctPiCslitFDi0lYO5NhzTyO7GATrHqnZK2KnySsn/+bjkrDuAIzfRtS+T
 UnAQ32/nqQ55FnNLQ/1YBmuU3O+PNxKd0BlCtG2+onE95aF0ZNyGfWXLwCsQkvclDawNMXyE4wQ
 8qbidQDVb/QwOLjYJBU36pvhb3gn+PnaLI214WGdpA49bUPW2oLjZqBs89/jDKUZqzpmaZmDho0
 MtAGdTsrvmBsYjxfQjY3KLbk/T2T7rBWpSUe6ldGc0/wklFJvG+PfdCaq2XZiFtEZHc/Uiz1PeC
 xm07BS88wx6JeiL9V4cmRs1zTO7VPEdpN6e+HIJy6UPm5FUVRLpfBQibSlbpgrMoYHdeCZfuazk
 dpY
X-Received: by 2002:a05:600d:8499:10b0:49c:ff3c:973f with SMTP id
 5b1f17b1804b1-49cff3c977fmr124344495e9.24.1788776307595; 
 Mon, 07 Sep 2026 03:18:27 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cfbdacc45sm269639775e9.11.2026.09.07.03.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 03:18:27 -0700 (PDT)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be, raphael.melotte@mind.be,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Mon,  7 Sep 2026 12:18:07 +0200
Message-ID: <20260907101807.128958-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/proftpd: add patch for
 CVE-2026-44331
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

(alternative to commit 3577d1442efc8b6cdc396008bf867845319d508a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/proftpd/0002-CVE-2026-44331.patch | 106 ++++++++++++++++++++++
 package/proftpd/proftpd.mk                |   3 +
 2 files changed, 109 insertions(+)
 create mode 100644 package/proftpd/0002-CVE-2026-44331.patch

diff --git a/package/proftpd/0002-CVE-2026-44331.patch b/package/proftpd/0002-CVE-2026-44331.patch
new file mode 100644
index 0000000000..e07098d178
--- /dev/null
+++ b/package/proftpd/0002-CVE-2026-44331.patch
@@ -0,0 +1,106 @@
+From 07797aba88dca902da7eaf1dfe262c8896943de7 Mon Sep 17 00:00:00 2001
+From: TJ Saunders <tj@castaglia.org>
+Date: Tue, 5 May 2026 09:56:33 -0700
+Subject: [PATCH] Issue #2057: Properly escape the "name" provided when doing
+ SQL lookups for allowed/denied client IP addresses or DNS names.
+
+CVE: CVE-2026-44331
+Upstream: https://github.com/proftpd/proftpd/commit/07797aba88dca902da7eaf1dfe262c8896943de7
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ contrib/mod_wrap2_sql.c | 49 +++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 45 insertions(+), 4 deletions(-)
+
+diff --git a/contrib/mod_wrap2_sql.c b/contrib/mod_wrap2_sql.c
+index eaf6ea7dc..d4fd56e69 100644
+--- a/contrib/mod_wrap2_sql.c
++++ b/contrib/mod_wrap2_sql.c
+@@ -1,7 +1,7 @@
+ /*
+  * ProFTPD: mod_wrap2_sql -- a mod_wrap2 sub-module for supplying IP-based
+  *                           access control data via SQL tables
+- * Copyright (c) 2002-2016 TJ Saunders
++ * Copyright (c) 2002-2026 TJ Saunders
+  *
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License as published by
+@@ -25,7 +25,7 @@
+ #include "mod_wrap2.h"
+ #include "mod_sql.h"
+ 
+-#define MOD_WRAP2_SQL_VERSION		"mod_wrap2_sql/1.0"
++#define MOD_WRAP2_SQL_VERSION		"mod_wrap2_sql/1.1"
+ 
+ #define WRAP2_SQL_NSLOTS		2
+ #define WRAP2_SQL_CLIENT_QUERY_IDX	0
+@@ -62,6 +62,41 @@ static int sqltab_close_cb(wrap2_table_t *sqltab) {
+   return 0;
+ }
+ 
++static char *sqltab_get_escaped_text(pool *p, wrap2_table_t *sqltab,
++    const char *text) {
++  pool *tmp_pool = NULL;
++  cmdtable *sql_cmdtab = NULL;
++  cmd_rec *sql_cmd = NULL;
++  modret_t *sql_res = NULL;
++
++  /* Find the cmdtable for the sql_escapestr command, as the provided
++   * name needs to be properly escaped for SQL syntax; see Issue #2057.
++   */
++  sql_cmdtab = pr_stash_get_symbol2(PR_SYM_HOOK, "sql_escapestr", NULL, NULL,
++    NULL);
++  if (sql_cmdtab == NULL) {
++    wrap2_log("error: unable to find SQL hook symbol 'sql_escapestr': "
++      "perhaps your proftpd.conf needs 'LoadModule mod_sql.c'?");
++    return NULL;
++  }
++
++  sql_cmd = sql_cmd_create(tmp_pool, 1, text);
++  sql_res = pr_module_call(sql_cmdtab->m, sql_cmdtab->handler, sql_cmd);
++  if (sql_res == NULL) {
++    wrap2_log("sql_escapestr '%s' returned no data; "
++      "see the mod_sql.c SQLLogFile for more details", text);
++    return NULL;
++  }
++
++  if (MODRET_ISERROR(sql_res)) {
++    wrap2_log("error processing sql_escapestr '%s': "
++      "check the mod_sql.c SQLLogFile for more details", text);
++    return NULL;
++  }
++
++  return sql_res->data;
++}
++
+ static array_header *sqltab_fetch_clients_cb(wrap2_table_t *sqltab,
+     const char *name) {
+   register unsigned int i;
+@@ -70,12 +105,18 @@ static array_header *sqltab_fetch_clients_cb(wrap2_table_t *sqltab,
+   cmd_rec *sql_cmd = NULL;
+   modret_t *sql_res = NULL;
+   array_header *sql_data = NULL;
+-  char *query = NULL, **vals = NULL;
++  char *escaped_name = NULL, *query = NULL, **vals = NULL;
+   array_header *clients_list = NULL;
+ 
+   /* Allocate a temporary pool for the duration of this read. */
+   tmp_pool = make_sub_pool(sqltab->tab_pool);
+ 
++  escaped_name = sqltab_get_escaped_text(tmp_pool, sqltab, name);
++  if (escaped_name == NULL) {
++    destroy_pool(tmp_pool);
++    return NULL;
++  }
++
+   query = ((char **) sqltab->tab_data)[WRAP2_SQL_CLIENT_QUERY_IDX];
+ 
+   /* Find the cmdtable for the sql_lookup command. */
+@@ -89,7 +130,7 @@ static array_header *sqltab_fetch_clients_cb(wrap2_table_t *sqltab,
+   }
+ 
+   /* Prepare the SELECT query. */
+-  sql_cmd = sql_cmd_create(tmp_pool, 3, "sql_lookup", query, name);
++  sql_cmd = sql_cmd_create(tmp_pool, 3, "sql_lookup", query, escaped_name);
+ 
+   /* Call the handler. */
+   sql_res = pr_module_call(sql_cmdtab->m, sql_cmdtab->handler, sql_cmd);
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 7310cd02fe..ee290c7670 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -14,6 +14,9 @@ PROFTPD_SELINUX_MODULES = ftp
 # 0001-CVE-2026-42167.patch
 PROFTPD_IGNORE_CVES += CVE-2026-42167
 
+# 0001-CVE-2026-44331.patch
+PROFTPD_IGNORE_CVES += CVE-2026-44331
+
 PROFTPD_CONF_ENV = \
 	ac_cv_func_setpgrp_void=yes \
 	ac_cv_func_setgrent_void=yes
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
