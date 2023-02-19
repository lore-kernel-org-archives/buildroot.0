Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8013FC05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 17:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3F9241697;
	Sun, 19 Feb 2023 17:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3F9241697
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THcsn2yCFJJ9; Sun, 19 Feb 2023 17:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB85416CE;
	Sun, 19 Feb 2023 17:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EB85416CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 028851BF423
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC4F660E28
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC4F660E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rq19ASawnr71 for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 17:32:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 761D160B98
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 761D160B98
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 17:32:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 ay15-20020a05600c1e0f00b003e206711347so694679wmb.0
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 09:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XQU5AMl3jD/Q6SLLCEYjKrlQJL4XM5fXKRR5Seos3Xo=;
 b=qm0TQnf/gNmDm9Df0BAgUCAt/oEK4E39nAtPSm3mOZU6qJvmf09q+TffHJDC6fD84M
 9oJ3626hvKf/2cxb4DRb2sq/MyaqtIJu+D/pv5AsfHQn4Q1hd0UWrkTJAparRxCibGyF
 uDKD8IaajxAMpnaFMByOLQ5WYPa4+zMnaSI6xVR0DEkgZjkfeu6jBndQiKuOB79a5W7f
 Dk/x8l8W73LVM5nt9Dl6Mt4bqRirtgQ3PlN8+J3B8PjPtKWTi5rv89HC9s55sRagrgfP
 a8pEGU3xf8kjPgr1WvuQMhYmmud8auucwC3kENEmerZeiop6cPvlL+QRfBQGgU49rnkD
 kXJg==
X-Gm-Message-State: AO0yUKUCWSrxzUhvPEUtifx8TrsV/ihHTwrazlWUCm4buqbUdPSBVv0G
 NfTJXpXXyichLsKJZZUIaU50+5GzIRI=
X-Google-Smtp-Source: AK7set9wKFOZaqlFQqAwphAfMVNhBb7rJPeJDYiY58cQcLHzN6+4CCNzl8F4Of80FdXhg8C65rWo6Q==
X-Received: by 2002:a05:600c:1605:b0:3dc:5a9f:1c7a with SMTP id
 m5-20020a05600c160500b003dc5a9f1c7amr4954596wmn.30.1676827931241; 
 Sun, 19 Feb 2023 09:32:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b003e204158ac7sm8620986wms.47.2023.02.19.09.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 09:32:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 18:32:08 +0100
Message-Id: <20230219173208.613324-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XQU5AMl3jD/Q6SLLCEYjKrlQJL4XM5fXKRR5Seos3Xo=;
 b=fxASE9gdRETOZFkGk6VCg49vWCXHj/ckLZBOwNEs88bqUPxSHfSbRyTN3FUMUXLsQU
 hDZpd3SDxcJPtbYjrjZYO8sgjVwMPcZVFIf9TU2tPUkaMmYOT+p6k9EIOhGbDI0Vwgvk
 m9iCEZsy6BOoSxdiXwmyLdNcTVVf4gIyF6DVpTb0l+m+ZIJMKSqCmVaYJT4afKCuj5WO
 AqfZbu9ZQITmHopY/cSqo4dYIH6Wf4RDQKKcYeSfHQo8DoxXZjNPtc85Mi9mWdNjenqg
 jsNFe/C4t5BcWnRs2faHZtFziDerGRQZnN0gBNuSV3124C2FcgsDJ9sRQdifhM7fVvaJ
 2v4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fxASE9gd
Subject: [Buildroot] [PATCH 1/1] package/nginx-naxsi: fix build with pcre2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of nginx to version
1.22.1 in commit 722b84eafa5e3d9540e0a80bae0c971a3a778358:

/home/buildroot/autobuild/run/instance-2/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c: In function 'ngx_http_process_basic_rule_buffer':
/home/buildroot/autobuild/run/instance-2/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c:205:61: error: invalid use of incomplete typedef 'ngx_regex_t' {aka 'struct pcre2_real_code_8'}
  205 |       (tmp_idx < len && (match = pcre_exec(rl->br->rx->regex->code,
      |                                                             ^~

Fixes:
 - http://autobuild.buildroot.org/results/7fff888bd36710e2d2f5bb39a38597e8c04305ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-PCRE2-compatibility.patch            | 221 ++++++++++++++++++
 1 file changed, 221 insertions(+)
 create mode 100644 package/nginx-naxsi/0001-PCRE2-compatibility.patch

diff --git a/package/nginx-naxsi/0001-PCRE2-compatibility.patch b/package/nginx-naxsi/0001-PCRE2-compatibility.patch
new file mode 100644
index 0000000000..aa3df4dff7
--- /dev/null
+++ b/package/nginx-naxsi/0001-PCRE2-compatibility.patch
@@ -0,0 +1,221 @@
+From 2937c44276cba21601ade4e265d32515f570d68c Mon Sep 17 00:00:00 2001
+From: Danila Vershinin <ciapnz@gmail.com>
+Date: Thu, 16 Jun 2022 01:22:23 +0300
+Subject: [PATCH] PCRE2 compatibility (#587)
+
+* Fix: use pcre2 when building with nginx >= 1.21.5
+
+I've tried to compile naxsi 1.3 as module for nginx 1.21.6, and got the error:
+
+error: invalid use of incomplete typedef 'ngx_regex_t' {aka 'struct pcre2_real_code_8'}
+  205 |       (tmp_idx < len && (match = pcre_exec(rl->br->rx->regex->code,
+
+I found this issue report: Ref: https://github.com/nbs-system/naxsi/issues/580
+then i tried to solve the pcre2 compatibility issue.
+
+I've included an helper function that is 'copied' from: https://github.com/nginx/nginx/blob/master/src/core/ngx_regex.c#L393
+that it is called in place of 'pcre_exec' when nginx_version >= 1021005
+
+Not sure if this is the best solution, but I managed to build naxsi 1.3 as module for nginx 1.21.6 succesfully, and it seems to work well.
+
+I'm not used to develop in C anymore (since 25 years ago, at least!), but I hope that this patch I made can help anybody else.
+
+* Added a check for nginx_version >= 1021005
+
+Added a check for nginx_version >= 1021005 to avoid helper function definition on older versions
+
+* Use NGX_PCRE2 conditional
+
+Update naxsi.h
+
+Don't include pcre.h in order for compilation to work both against pcre and pcre2
+
+Fix pcre vs pcre2 compilation
+
+Co-authored-by: laluigino <99279306+laluigino@users.noreply.github.com>
+[Retrieved from:
+https://github.com/nbs-system/naxsi/commit/2937c44276cba21601ade4e265d32515f570d68c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ naxsi_src/naxsi.h         |  1 -
+ naxsi_src/naxsi_config.c  |  9 ++++-
+ naxsi_src/naxsi_runtime.c | 82 ++++++++++++++++++++++++++++++++++++++-
+ naxsi_src/naxsi_utils.c   |  8 ++++
+ 4 files changed, 96 insertions(+), 4 deletions(-)
+
+diff --git a/naxsi_src/naxsi.h b/naxsi_src/naxsi.h
+index 53df1bd8..b2f5c1a5 100644
+--- a/naxsi_src/naxsi.h
++++ b/naxsi_src/naxsi.h
+@@ -19,7 +19,6 @@
+ #include <ngx_http.h>
+ #include <ngx_http_core_module.h>
+ #include <ngx_md5.h>
+-#include <pcre.h>
+ 
+ extern ngx_module_t ngx_http_naxsi_module;
+ 
+diff --git a/naxsi_src/naxsi_config.c b/naxsi_src/naxsi_config.c
+index 4ea15567..6d2f0e23 100644
+--- a/naxsi_src/naxsi_config.c
++++ b/naxsi_src/naxsi_config.c
+@@ -322,8 +322,11 @@ naxsi_zone(ngx_conf_t* r, ngx_str_t* tmp, ngx_http_rule_t* rule)
+ 
+         custom_rule->target_rx = ngx_pcalloc(r->pool, sizeof(ngx_regex_compile_t));
+         return_value_if(!custom_rule->target_rx, NGX_CONF_ERROR);
+-
++#if (NGX_PCRE2)
++        custom_rule->target_rx->options  = PCRE2_CASELESS | PCRE2_MULTILINE;
++#else
+         custom_rule->target_rx->options  = PCRE_CASELESS | PCRE_MULTILINE;
++#endif
+         custom_rule->target_rx->pattern  = custom_rule->target;
+         custom_rule->target_rx->pool     = r->pool;
+         custom_rule->target_rx->err.len  = 0;
+@@ -442,7 +445,11 @@ naxsi_rx(ngx_conf_t* r, ngx_str_t* tmp, ngx_http_rule_t* rule)
+   ha.len  = tmp->len - strlen(RX_T);
+   rgc     = ngx_pcalloc(r->pool, sizeof(ngx_regex_compile_t));
+   return_value_if(!rgc, NGX_CONF_ERROR);
++#if (NGX_PCRE2)
++  rgc->options  = PCRE2_CASELESS | PCRE2_MULTILINE;
++#else
+   rgc->options  = PCRE_CASELESS | PCRE_MULTILINE;
++#endif
+   rgc->pattern  = ha;
+   rgc->pool     = r->pool;
+   rgc->err.len  = 0;
+diff --git a/naxsi_src/naxsi_runtime.c b/naxsi_src/naxsi_runtime.c
+index d548ce37..784852b0 100644
+--- a/naxsi_src/naxsi_runtime.c
++++ b/naxsi_src/naxsi_runtime.c
+@@ -181,6 +181,75 @@ ngx_http_naxsi_rawbody_parse(ngx_http_request_ctx_t* ctx,
+ unsigned char*
+ ngx_utf8_check(ngx_str_t* str);
+ 
++#if defined nginx_version && (nginx_version >= 1021005)
++/*
++ * variables to use pcre2
++ */
++static pcre2_match_data       *ngx_pcre2_match_data;
++static ngx_uint_t              ngx_pcre2_match_data_size;
++
++/*
++ * helper function to use pcre2
++ */
++ngx_int_t
++ngx_pcre2_exec(ngx_regex_t *re, unsigned char* str, unsigned int len, ngx_int_t tmp_idx, int *captures, ngx_uint_t size)
++{
++    size_t      *ov;
++    ngx_int_t    rc;
++    ngx_uint_t   n, i;
++
++    /*
++     * The pcre2_match() function might allocate memory for backtracking
++     * frames, typical allocations are from 40k and above.  So the allocator
++     * is configured to do direct allocations from heap during matching.
++     */
++
++    if (ngx_pcre2_match_data == NULL
++        || size > ngx_pcre2_match_data_size)
++    {
++        /*
++         * Allocate a match data if not yet allocated or smaller than
++         * needed.
++         */
++
++        if (ngx_pcre2_match_data) {
++            pcre2_match_data_free(ngx_pcre2_match_data);
++        }
++
++        ngx_pcre2_match_data_size = size;
++        ngx_pcre2_match_data = pcre2_match_data_create(size / 3, NULL);
++
++        if (ngx_pcre2_match_data == NULL) {
++            rc = PCRE2_ERROR_NOMEMORY;
++            goto failed;
++        }
++    }
++
++    rc = pcre2_match(re, str, len, tmp_idx, 0, ngx_pcre2_match_data, NULL);
++
++    if (rc < 0) {
++        goto failed;
++    }
++
++    n = pcre2_get_ovector_count(ngx_pcre2_match_data);
++    ov = pcre2_get_ovector_pointer(ngx_pcre2_match_data);
++
++    if (n > size / 3) {
++        n = size / 3;
++    }
++
++    for (i = 0; i < n; i++) {
++        captures[i * 2] = ov[i * 2];
++        captures[i * 2 + 1] = ov[i * 2 + 1];
++    }
++
++failed:
++
++    return rc;
++
++}
++#endif
++
+ /*
+ ** in : string to inspect, associated rule
+ ** does : apply the rule on the string, return 1 if matched,
+@@ -201,7 +270,14 @@ ngx_http_process_basic_rule_buffer(ngx_str_t* str, ngx_http_rule_t* rl, ngx_int_
+     tmp_idx = 0;
+     len     = str->len;
+     while
+-#if defined   nginx_version && (nginx_version >= 1002002 && nginx_version != 1003000)
++#if (NGX_PCRE2)
++      (tmp_idx < len && (match = ngx_pcre2_exec(rl->br->rx->regex,                         
++                                           str->data,
++                                           str->len,
++                                           tmp_idx,
++                                           captures,
++                                           30)) >= 0)
++#elif defined nginx_version && (nginx_version >= 1002002 && nginx_version != 1003000)
+       (tmp_idx < len && (match = pcre_exec(rl->br->rx->regex->code,
+                                            0,
+                                            (const char*)str->data,
+@@ -496,7 +572,9 @@ ngx_http_naxsi_pcre_wrapper(ngx_regex_compile_t* rx, unsigned char* str, unsigne
+   int match;
+   int captures[30];
+ 
+-#if defined   nginx_version && (nginx_version >= 1002002 && nginx_version != 1003000)
++#if (NGX_PCRE2)
++  match = ngx_pcre2_exec(rx->regex, str, len, 0, captures, 1);
++#elif defined nginx_version && (nginx_version >= 1002002 && nginx_version != 1003000)
+   match = pcre_exec(rx->regex->code, 0, (const char*)str, len, 0, 0, captures, 1);
+ #elif defined nginx_version && (nginx_version > 1001011)
+   match = pcre_exec(rx->regex->pcre, 0, (const char*)str, len, 0, 0, captures, 1);
+diff --git a/naxsi_src/naxsi_utils.c b/naxsi_src/naxsi_utils.c
+index e3d6f185..d2ecedec 100644
+--- a/naxsi_src/naxsi_utils.c
++++ b/naxsi_src/naxsi_utils.c
+@@ -800,7 +800,11 @@ ngx_http_naxsi_create_hashtables_n(ngx_http_naxsi_loc_conf_t* dlc, ngx_conf_t* c
+             ngx_pcalloc(cf->pool, sizeof(ngx_regex_compile_t));
+           rgc = custloc_array(curr_r->br->custom_locations->elts)[name_idx].target_rx;
+           if (rgc) {
++#if (NGX_PCRE2)
++            rgc->options  = PCRE2_CASELESS | PCRE2_MULTILINE;
++#else
+             rgc->options  = PCRE_CASELESS | PCRE_MULTILINE;
++#endif
+             rgc->pattern  = custloc_array(curr_r->br->custom_locations->elts)[name_idx].target;
+             rgc->pool     = cf->pool;
+             rgc->err.len  = 0;
+@@ -816,7 +820,11 @@ ngx_http_naxsi_create_hashtables_n(ngx_http_naxsi_loc_conf_t* dlc, ngx_conf_t* c
+             ngx_pcalloc(cf->pool, sizeof(ngx_regex_compile_t));
+           rgc = custloc_array(curr_r->br->custom_locations->elts)[uri_idx].target_rx;
+           if (rgc) {
++#if (NGX_PCRE2)
++            rgc->options  = PCRE2_CASELESS | PCRE2_MULTILINE;
++#else
+             rgc->options  = PCRE_CASELESS | PCRE_MULTILINE;
++#endif
+             rgc->pattern  = custloc_array(curr_r->br->custom_locations->elts)[uri_idx].target;
+             rgc->pool     = cf->pool;
+             rgc->err.len  = 0;
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
