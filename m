Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B4FC4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:25:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F1D60E52
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34F1D60E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B14380DE0;
	Sun, 15 Aug 2021 07:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66vfDpyr_pVZ; Sun, 15 Aug 2021 07:25:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 938D980DE2;
	Sun, 15 Aug 2021 07:25:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7261BF4DB
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 177E44032F
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GCIvw4uQX7Zt for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 07:25:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7C824032D
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 07:25:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4BE648C715; Sun, 15 Aug 2021 07:25:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 09:23:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff619b5c4212000e8bd511bcdb060531c0b4ceab
X-Git-Newrev: 1be9d2eb4ad5164d4443e9b63aeaec832bb18adc
X-Patchwork-Hint: ignore
Message-Id: <20210815072511.4BE648C715@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx-naxsi: fix build without
 x_forwarded_for
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1be9d2eb4ad5164d4443e9b63aeaec832bb18adc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without x_forwarded_for raised since
bump to version 1.3 in commit 3335c8d8685119ebb5b2a9a6e575f3a5337c4d90:

/home/buildroot/autobuild/instance-3/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c: In function 'ngx_http_naxsi_data_parse':
/home/buildroot/autobuild/instance-3/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c:2846:20: error: 'ngx_http_headers_in_t' has no member named 'x_forwarded_for'
   if (r->headers_in.x_forwarded_for.nelts >= 1) {
                    ^

Fixes:
 - http://autobuild.buildroot.org/results/cdbc1536f6b5de3d4c836efa2f0dcaf0cdbb1462

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...axsi_runtime.c-fix-build-without-x_forwar.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/nginx-naxsi/0001-naxsi_src-naxsi_runtime.c-fix-build-without-x_forwar.patch b/package/nginx-naxsi/0001-naxsi_src-naxsi_runtime.c-fix-build-without-x_forwar.patch
new file mode 100644
index 0000000000..238a01923d
--- /dev/null
+++ b/package/nginx-naxsi/0001-naxsi_src-naxsi_runtime.c-fix-build-without-x_forwar.patch
@@ -0,0 +1,63 @@
+From 8ea5218b07f715e9616a846bf305633ef1b3aa2a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 14 Aug 2021 11:46:08 +0200
+Subject: [PATCH] naxsi_src/naxsi_runtime.c: fix build without x_forwarded_for
+
+x_forwarded_for is not available if realip, geo, geoip or proxy modules
+aren't enabled resulting in the following build failure since version
+1.1a and
+https://github.com/nbs-system/naxsi/commit/07a056ccd36bc3c5c40dc17991db226cb8cf6241:
+
+/home/buildroot/autobuild/instance-3/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c: In function 'ngx_http_naxsi_data_parse':
+/home/buildroot/autobuild/instance-3/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c:2846:20: error: 'ngx_http_headers_in_t' has no member named 'x_forwarded_for'
+   if (r->headers_in.x_forwarded_for.nelts >= 1) {
+                    ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cdbc1536f6b5de3d4c836efa2f0dcaf0cdbb1462
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/nbs-system/naxsi/pull/568]
+---
+ naxsi_src/naxsi_runtime.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/naxsi_src/naxsi_runtime.c b/naxsi_src/naxsi_runtime.c
+index 28e0b29..6a723d2 100644
+--- a/naxsi_src/naxsi_runtime.c
++++ b/naxsi_src/naxsi_runtime.c
+@@ -2842,10 +2842,12 @@ ngx_http_naxsi_data_parse(ngx_http_request_ctx_t* ctx, ngx_http_request_t* r)
+   unsigned int      n = 0;
+   ngx_table_elt_t** h = NULL;
+   ngx_array_t       a;
++#if (NGX_HTTP_X_FORWARDED_FOR)
+   if (r->headers_in.x_forwarded_for.nelts >= 1) {
+     a = r->headers_in.x_forwarded_for;
+     n = a.nelts;
+   }
++#endif
+   if (n >= 1)
+     h = a.elts;
+   if (n >= 1) {
+@@ -2879,6 +2881,7 @@ ngx_http_naxsi_update_current_ctx_status(ngx_http_request_ctx_t*    ctx,
+ 
+   /*cr, sc, cf, ctx*/
+   if (cf->check_rules && ctx->special_scores) {
++#if (NGX_HTTP_X_FORWARDED_FOR)
+     if (r->headers_in.x_forwarded_for.nelts >= 1) {
+       a = r->headers_in.x_forwarded_for;
+       n = a.nelts;
+@@ -2896,7 +2899,9 @@ ngx_http_naxsi_update_current_ctx_status(ngx_http_request_ctx_t*    ctx,
+         memcpy(ip.data, h[0]->value.data, ip.len);
+         ignore = nx_can_ignore_ip(&ip, cf) || nx_can_ignore_cidr(&ip, cf);
+       }
+-    } else {
++    } else
++#endif
++    {
+       ngx_str_t* ip = &r->connection->addr_text;
+       NX_DEBUG(_debug_whitelist_ignore,
+                NGX_LOG_DEBUG_HTTP,
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
