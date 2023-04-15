Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EB4C7619A
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 11:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D4DC40B58;
	Sat, 15 Apr 2023 11:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D4DC40B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3uKp-U6tjv6; Sat, 15 Apr 2023 11:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEC6341C45;
	Sat, 15 Apr 2023 11:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEC6341C45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CD121C3FC3
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 11:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 829078458A
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 11:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 829078458A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sruyEujXYeb2 for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 11:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C5508458B
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 11:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C5508458B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B22C840A4; Sat, 15 Apr 2023 11:52:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Apr 2023 13:51:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0236f934663a5f46d84ddba101a52cf2e04f429
X-Git-Newrev: cb78e8c362686660cdb3876607b67c92eacc6140
X-Patchwork-Hint: ignore
Message-Id: <20230415115232.3B22C840A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx-naxsi: bump version to
 d714f16
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2615419570084338531=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2615419570084338531==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cb78e8c362686660cdb3876607b67c92eacc6140
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to latest upstream git version, fixes compile failure since
nginx-1.23.0:

  src/event/ngx_event_udp.h:38:27: error: field ‘pkt6’ has incomplete type
     38 |     struct in6_pktinfo    pkt6;
        |                           ^~~~

  .../nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c:2925:36: error: ‘r->headers_in.x_forwarded_for’ is a pointer; did you mean to use ‘->’?
   2925 |   if (r->headers_in.x_forwarded_for.nelts >= 1) {
        |                                    ^
        |                                    ->

- remove 0001-naxsi_src-naxsi_runtime.c-fix-build-without-x_forwar.patch
  (upstream commit, see [1])
- remove 0002-PCRE2-compatibility.patch
  (upstream commit, see [2])

Changelog (since 1.3):

- a2add9f docs: fix simple typo, registred -> registered (#538)
- aa9da98 Fix #541 - Removing useless assert.
- fbe6ffd Some includes are required for OpenBSD (#545)
- 296583f naxsi_src/naxsi_runtime.c: fix build without x_forwarded_for (#568)
- fe5df20 redirect naxsi log to a separate log file (#563)
- c81a4e3 parse HTTP PATCH requests and associated tests (#595)
- 2937c44 PCRE2 compatibility (#587)
- d714f16 Fixes NGINX >= v.1.23.0 (all credits @lubomudr) (#598)

Given the short history since 1.3, and rather than backporting one more
patch, just bump to current HEAD of the upstream repository.

[1] https://github.com/nbs-system/naxsi/commit/296583f06ba5c43cc859e01fd3c0ae1271eef0ce
[2] https://github.com/nbs-system/naxsi/commit/2937c44276cba21601ade4e265d32515f570d68c

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...axsi_runtime.c-fix-build-without-x_forwar.patch |  63 ------
 package/nginx-naxsi/0002-PCRE2-compatibility.patch | 221 ---------------------
 package/nginx-naxsi/nginx-naxsi.hash               |   2 +-
 package/nginx-naxsi/nginx-naxsi.mk                 |   2 +-
 4 files changed, 2 insertions(+), 286 deletions(-)

diff --git a/package/nginx-naxsi/0001-naxsi_src-naxsi_runtime.c-fix-build-without-x_forwar.patch b/package/nginx-naxsi/0001-naxsi_src-naxsi_runtime.c-fix-build-without-x_forwar.patch
deleted file mode 100644
index 238a01923d..0000000000
--- a/package/nginx-naxsi/0001-naxsi_src-naxsi_runtime.c-fix-build-without-x_forwar.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 8ea5218b07f715e9616a846bf305633ef1b3aa2a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 14 Aug 2021 11:46:08 +0200
-Subject: [PATCH] naxsi_src/naxsi_runtime.c: fix build without x_forwarded_for
-
-x_forwarded_for is not available if realip, geo, geoip or proxy modules
-aren't enabled resulting in the following build failure since version
-1.1a and
-https://github.com/nbs-system/naxsi/commit/07a056ccd36bc3c5c40dc17991db226cb8cf6241:
-
-/home/buildroot/autobuild/instance-3/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c: In function 'ngx_http_naxsi_data_parse':
-/home/buildroot/autobuild/instance-3/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c:2846:20: error: 'ngx_http_headers_in_t' has no member named 'x_forwarded_for'
-   if (r->headers_in.x_forwarded_for.nelts >= 1) {
-                    ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/cdbc1536f6b5de3d4c836efa2f0dcaf0cdbb1462
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/nbs-system/naxsi/pull/568]
----
- naxsi_src/naxsi_runtime.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/naxsi_src/naxsi_runtime.c b/naxsi_src/naxsi_runtime.c
-index 28e0b29..6a723d2 100644
---- a/naxsi_src/naxsi_runtime.c
-+++ b/naxsi_src/naxsi_runtime.c
-@@ -2842,10 +2842,12 @@ ngx_http_naxsi_data_parse(ngx_http_request_ctx_t* ctx, ngx_http_request_t* r)
-   unsigned int      n = 0;
-   ngx_table_elt_t** h = NULL;
-   ngx_array_t       a;
-+#if (NGX_HTTP_X_FORWARDED_FOR)
-   if (r->headers_in.x_forwarded_for.nelts >= 1) {
-     a = r->headers_in.x_forwarded_for;
-     n = a.nelts;
-   }
-+#endif
-   if (n >= 1)
-     h = a.elts;
-   if (n >= 1) {
-@@ -2879,6 +2881,7 @@ ngx_http_naxsi_update_current_ctx_status(ngx_http_request_ctx_t*    ctx,
- 
-   /*cr, sc, cf, ctx*/
-   if (cf->check_rules && ctx->special_scores) {
-+#if (NGX_HTTP_X_FORWARDED_FOR)
-     if (r->headers_in.x_forwarded_for.nelts >= 1) {
-       a = r->headers_in.x_forwarded_for;
-       n = a.nelts;
-@@ -2896,7 +2899,9 @@ ngx_http_naxsi_update_current_ctx_status(ngx_http_request_ctx_t*    ctx,
-         memcpy(ip.data, h[0]->value.data, ip.len);
-         ignore = nx_can_ignore_ip(&ip, cf) || nx_can_ignore_cidr(&ip, cf);
-       }
--    } else {
-+    } else
-+#endif
-+    {
-       ngx_str_t* ip = &r->connection->addr_text;
-       NX_DEBUG(_debug_whitelist_ignore,
-                NGX_LOG_DEBUG_HTTP,
--- 
-2.30.2
-
diff --git a/package/nginx-naxsi/0002-PCRE2-compatibility.patch b/package/nginx-naxsi/0002-PCRE2-compatibility.patch
deleted file mode 100644
index aa3df4dff7..0000000000
--- a/package/nginx-naxsi/0002-PCRE2-compatibility.patch
+++ /dev/null
@@ -1,221 +0,0 @@
-From 2937c44276cba21601ade4e265d32515f570d68c Mon Sep 17 00:00:00 2001
-From: Danila Vershinin <ciapnz@gmail.com>
-Date: Thu, 16 Jun 2022 01:22:23 +0300
-Subject: [PATCH] PCRE2 compatibility (#587)
-
-* Fix: use pcre2 when building with nginx >= 1.21.5
-
-I've tried to compile naxsi 1.3 as module for nginx 1.21.6, and got the error:
-
-error: invalid use of incomplete typedef 'ngx_regex_t' {aka 'struct pcre2_real_code_8'}
-  205 |       (tmp_idx < len && (match = pcre_exec(rl->br->rx->regex->code,
-
-I found this issue report: Ref: https://github.com/nbs-system/naxsi/issues/580
-then i tried to solve the pcre2 compatibility issue.
-
-I've included an helper function that is 'copied' from: https://github.com/nginx/nginx/blob/master/src/core/ngx_regex.c#L393
-that it is called in place of 'pcre_exec' when nginx_version >= 1021005
-
-Not sure if this is the best solution, but I managed to build naxsi 1.3 as module for nginx 1.21.6 succesfully, and it seems to work well.
-
-I'm not used to develop in C anymore (since 25 years ago, at least!), but I hope that this patch I made can help anybody else.
-
-* Added a check for nginx_version >= 1021005
-
-Added a check for nginx_version >= 1021005 to avoid helper function definition on older versions
-
-* Use NGX_PCRE2 conditional
-
-Update naxsi.h
-
-Don't include pcre.h in order for compilation to work both against pcre and pcre2
-
-Fix pcre vs pcre2 compilation
-
-Co-authored-by: laluigino <99279306+laluigino@users.noreply.github.com>
-[Retrieved from:
-https://github.com/nbs-system/naxsi/commit/2937c44276cba21601ade4e265d32515f570d68c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- naxsi_src/naxsi.h         |  1 -
- naxsi_src/naxsi_config.c  |  9 ++++-
- naxsi_src/naxsi_runtime.c | 82 ++++++++++++++++++++++++++++++++++++++-
- naxsi_src/naxsi_utils.c   |  8 ++++
- 4 files changed, 96 insertions(+), 4 deletions(-)
-
-diff --git a/naxsi_src/naxsi.h b/naxsi_src/naxsi.h
-index 53df1bd8..b2f5c1a5 100644
---- a/naxsi_src/naxsi.h
-+++ b/naxsi_src/naxsi.h
-@@ -19,7 +19,6 @@
- #include <ngx_http.h>
- #include <ngx_http_core_module.h>
- #include <ngx_md5.h>
--#include <pcre.h>
- 
- extern ngx_module_t ngx_http_naxsi_module;
- 
-diff --git a/naxsi_src/naxsi_config.c b/naxsi_src/naxsi_config.c
-index 4ea15567..6d2f0e23 100644
---- a/naxsi_src/naxsi_config.c
-+++ b/naxsi_src/naxsi_config.c
-@@ -322,8 +322,11 @@ naxsi_zone(ngx_conf_t* r, ngx_str_t* tmp, ngx_http_rule_t* rule)
- 
-         custom_rule->target_rx = ngx_pcalloc(r->pool, sizeof(ngx_regex_compile_t));
-         return_value_if(!custom_rule->target_rx, NGX_CONF_ERROR);
--
-+#if (NGX_PCRE2)
-+        custom_rule->target_rx->options  = PCRE2_CASELESS | PCRE2_MULTILINE;
-+#else
-         custom_rule->target_rx->options  = PCRE_CASELESS | PCRE_MULTILINE;
-+#endif
-         custom_rule->target_rx->pattern  = custom_rule->target;
-         custom_rule->target_rx->pool     = r->pool;
-         custom_rule->target_rx->err.len  = 0;
-@@ -442,7 +445,11 @@ naxsi_rx(ngx_conf_t* r, ngx_str_t* tmp, ngx_http_rule_t* rule)
-   ha.len  = tmp->len - strlen(RX_T);
-   rgc     = ngx_pcalloc(r->pool, sizeof(ngx_regex_compile_t));
-   return_value_if(!rgc, NGX_CONF_ERROR);
-+#if (NGX_PCRE2)
-+  rgc->options  = PCRE2_CASELESS | PCRE2_MULTILINE;
-+#else
-   rgc->options  = PCRE_CASELESS | PCRE_MULTILINE;
-+#endif
-   rgc->pattern  = ha;
-   rgc->pool     = r->pool;
-   rgc->err.len  = 0;
-diff --git a/naxsi_src/naxsi_runtime.c b/naxsi_src/naxsi_runtime.c
-index d548ce37..784852b0 100644
---- a/naxsi_src/naxsi_runtime.c
-+++ b/naxsi_src/naxsi_runtime.c
-@@ -181,6 +181,75 @@ ngx_http_naxsi_rawbody_parse(ngx_http_request_ctx_t* ctx,
- unsigned char*
- ngx_utf8_check(ngx_str_t* str);
- 
-+#if defined nginx_version && (nginx_version >= 1021005)
-+/*
-+ * variables to use pcre2
-+ */
-+static pcre2_match_data       *ngx_pcre2_match_data;
-+static ngx_uint_t              ngx_pcre2_match_data_size;
-+
-+/*
-+ * helper function to use pcre2
-+ */
-+ngx_int_t
-+ngx_pcre2_exec(ngx_regex_t *re, unsigned char* str, unsigned int len, ngx_int_t tmp_idx, int *captures, ngx_uint_t size)
-+{
-+    size_t      *ov;
-+    ngx_int_t    rc;
-+    ngx_uint_t   n, i;
-+
-+    /*
-+     * The pcre2_match() function might allocate memory for backtracking
-+     * frames, typical allocations are from 40k and above.  So the allocator
-+     * is configured to do direct allocations from heap during matching.
-+     */
-+
-+    if (ngx_pcre2_match_data == NULL
-+        || size > ngx_pcre2_match_data_size)
-+    {
-+        /*
-+         * Allocate a match data if not yet allocated or smaller than
-+         * needed.
-+         */
-+
-+        if (ngx_pcre2_match_data) {
-+            pcre2_match_data_free(ngx_pcre2_match_data);
-+        }
-+
-+        ngx_pcre2_match_data_size = size;
-+        ngx_pcre2_match_data = pcre2_match_data_create(size / 3, NULL);
-+
-+        if (ngx_pcre2_match_data == NULL) {
-+            rc = PCRE2_ERROR_NOMEMORY;
-+            goto failed;
-+        }
-+    }
-+
-+    rc = pcre2_match(re, str, len, tmp_idx, 0, ngx_pcre2_match_data, NULL);
-+
-+    if (rc < 0) {
-+        goto failed;
-+    }
-+
-+    n = pcre2_get_ovector_count(ngx_pcre2_match_data);
-+    ov = pcre2_get_ovector_pointer(ngx_pcre2_match_data);
-+
-+    if (n > size / 3) {
-+        n = size / 3;
-+    }
-+
-+    for (i = 0; i < n; i++) {
-+        captures[i * 2] = ov[i * 2];
-+        captures[i * 2 + 1] = ov[i * 2 + 1];
-+    }
-+
-+failed:
-+
-+    return rc;
-+
-+}
-+#endif
-+
- /*
- ** in : string to inspect, associated rule
- ** does : apply the rule on the string, return 1 if matched,
-@@ -201,7 +270,14 @@ ngx_http_process_basic_rule_buffer(ngx_str_t* str, ngx_http_rule_t* rl, ngx_int_
-     tmp_idx = 0;
-     len     = str->len;
-     while
--#if defined   nginx_version && (nginx_version >= 1002002 && nginx_version != 1003000)
-+#if (NGX_PCRE2)
-+      (tmp_idx < len && (match = ngx_pcre2_exec(rl->br->rx->regex,                         
-+                                           str->data,
-+                                           str->len,
-+                                           tmp_idx,
-+                                           captures,
-+                                           30)) >= 0)
-+#elif defined nginx_version && (nginx_version >= 1002002 && nginx_version != 1003000)
-       (tmp_idx < len && (match = pcre_exec(rl->br->rx->regex->code,
-                                            0,
-                                            (const char*)str->data,
-@@ -496,7 +572,9 @@ ngx_http_naxsi_pcre_wrapper(ngx_regex_compile_t* rx, unsigned char* str, unsigne
-   int match;
-   int captures[30];
- 
--#if defined   nginx_version && (nginx_version >= 1002002 && nginx_version != 1003000)
-+#if (NGX_PCRE2)
-+  match = ngx_pcre2_exec(rx->regex, str, len, 0, captures, 1);
-+#elif defined nginx_version && (nginx_version >= 1002002 && nginx_version != 1003000)
-   match = pcre_exec(rx->regex->code, 0, (const char*)str, len, 0, 0, captures, 1);
- #elif defined nginx_version && (nginx_version > 1001011)
-   match = pcre_exec(rx->regex->pcre, 0, (const char*)str, len, 0, 0, captures, 1);
-diff --git a/naxsi_src/naxsi_utils.c b/naxsi_src/naxsi_utils.c
-index e3d6f185..d2ecedec 100644
---- a/naxsi_src/naxsi_utils.c
-+++ b/naxsi_src/naxsi_utils.c
-@@ -800,7 +800,11 @@ ngx_http_naxsi_create_hashtables_n(ngx_http_naxsi_loc_conf_t* dlc, ngx_conf_t* c
-             ngx_pcalloc(cf->pool, sizeof(ngx_regex_compile_t));
-           rgc = custloc_array(curr_r->br->custom_locations->elts)[name_idx].target_rx;
-           if (rgc) {
-+#if (NGX_PCRE2)
-+            rgc->options  = PCRE2_CASELESS | PCRE2_MULTILINE;
-+#else
-             rgc->options  = PCRE_CASELESS | PCRE_MULTILINE;
-+#endif
-             rgc->pattern  = custloc_array(curr_r->br->custom_locations->elts)[name_idx].target;
-             rgc->pool     = cf->pool;
-             rgc->err.len  = 0;
-@@ -816,7 +820,11 @@ ngx_http_naxsi_create_hashtables_n(ngx_http_naxsi_loc_conf_t* dlc, ngx_conf_t* c
-             ngx_pcalloc(cf->pool, sizeof(ngx_regex_compile_t));
-           rgc = custloc_array(curr_r->br->custom_locations->elts)[uri_idx].target_rx;
-           if (rgc) {
-+#if (NGX_PCRE2)
-+            rgc->options  = PCRE2_CASELESS | PCRE2_MULTILINE;
-+#else
-             rgc->options  = PCRE_CASELESS | PCRE_MULTILINE;
-+#endif
-             rgc->pattern  = custloc_array(curr_r->br->custom_locations->elts)[uri_idx].target;
-             rgc->pool     = cf->pool;
-             rgc->err.len  = 0;
diff --git a/package/nginx-naxsi/nginx-naxsi.hash b/package/nginx-naxsi/nginx-naxsi.hash
index 4712ede2af..a724941b25 100644
--- a/package/nginx-naxsi/nginx-naxsi.hash
+++ b/package/nginx-naxsi/nginx-naxsi.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  439c8677372d2597b4360bbcc10bc86490de1fc75695b193ad5df154a214d628  nginx-naxsi-1.3.tar.gz
+sha256  dbe2177411457f1cba98ee4673ce31876994ad06bdce5ecc0ee66384ef0e420e  nginx-naxsi-d714f1636ea49a9a9f4f06dba14aee003e970834.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
 sha256  d0732bc23658db5b9749e3f9cd4fe0f9b3e132b5955adccb08821845fe2a21c8  naxsi_src/ext/libinjection/COPYING
diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
index 2dba8ad589..84d167a663 100644
--- a/package/nginx-naxsi/nginx-naxsi.mk
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_NAXSI_VERSION = 1.3
+NGINX_NAXSI_VERSION = d714f1636ea49a9a9f4f06dba14aee003e970834
 NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
 NGINX_NAXSI_LICENSE = GPL-3.0, BSD-3-Clause (libinjection)
 NGINX_NAXSI_LICENSE_FILES = LICENSE naxsi_src/ext/libinjection/COPYING

--===============2615419570084338531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2615419570084338531==--
