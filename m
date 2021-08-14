Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD32C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 10:43:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32F7060EB5
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 10:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32F7060EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0F6A400C7;
	Sat, 14 Aug 2021 10:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ERX1zXDbFakA; Sat, 14 Aug 2021 10:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AB9D40278;
	Sat, 14 Aug 2021 10:43:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 390891BF3D6
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 10:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21B75606EF
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 10:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-eqpuFPui7i for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 10:43:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08CB5606CF
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 10:43:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k29so16679697wrd.7
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6wSV4DZ/+6Gu3n3hCzM0au/+0eQSCb+Ps69IPhPZ5Ak=;
 b=ggwtKukSjviVMANqD9xAwQSxeBaJM5QlrLu89fBHe62yrzOHF2eymAlf3rdg6T5WK2
 uCD/k1dliH1BbxjsxfYFxeA8hO8ZJGM2uuNnvUXFF558UjZP1EVyLgJuJPA81ltePEOp
 TdOHaudKC92ZXhXqkQU60iGEBfNM0Y9oMtPNojpKpBmsPdMbNUvZWrzY1CnclyhMeufI
 ZMVFU9jL/f/aw7+RFVzynQn+E9ikvJOYAXOllsl/dzMYVr76B6BLOjtDcRptz2Lt7Mwf
 QVYGRktQuuvW+7kT4Ng8g7JGo9bVjOHMh/Xd2AKv8ljFpK5XpdyCWZoq3T4+ib05DQYS
 u5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6wSV4DZ/+6Gu3n3hCzM0au/+0eQSCb+Ps69IPhPZ5Ak=;
 b=iIzG5lExZEIQSSm1yYfanFwnBuHIOhsY2JrzW8alpwBAe5UFevaw7rI6u+PjWN/D/Z
 vldSzUK3/GjyRgWoGHImhmpyviQph45M4UAegELgjK2e4991pUoEeAGCMKPO0xzhIkOq
 eoc4lHrIAeEsosEn6Y0eUYIAUc4chKaXX3E5mw1g1w1pckV8WSIhsO4VBvPZett4s+sp
 PAvKUzuEJLIWoYQOOwVEAjoyCuelsTd0CDV/9cdO8B04MVBeg0eLZWK3atMKglIRmZJq
 TZf3cY2k2oKbAPTgcaGE0PAYsajC512dLBcC3op7ldHmBvhgjK4hVPcDio84V0QLpOfM
 e5Qg==
X-Gm-Message-State: AOAM531lx0Szp4PGx6OcFfyyobaDbXL7U8tecbjWxRHH4qpnyHQoaGhx
 0Gx08pvDPXmC5H6/WJw3m0Ii+V4MW2DWDg==
X-Google-Smtp-Source: ABdhPJzJWWY9PA+S/prlIVcBP8+MBOkOdXV9/gwpJQVgUlXcr/SANCSDx2C25Kj8/HC0wziuxfP9rA==
X-Received: by 2002:adf:fc50:: with SMTP id e16mr8011101wrs.382.1628937809028; 
 Sat, 14 Aug 2021 03:43:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id w9sm3952169wmc.19.2021.08.14.03.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 03:43:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 12:43:17 +0200
Message-Id: <20210814104317.349769-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nginx-naxsi: fix build without
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure without x_forwarded_for raised since
bump to version 1.3 in commit 3335c8d8685119ebb5b2a9a6e575f3a5337c4d90:

/home/buildroot/autobuild/instance-3/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c: In function 'ngx_http_naxsi_data_parse':
/home/buildroot/autobuild/instance-3/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c:2846:20: error: 'ngx_http_headers_in_t' has no member named 'x_forwarded_for'
   if (r->headers_in.x_forwarded_for.nelts >= 1) {
                    ^

Fixes:
 - http://autobuild.buildroot.org/results/cdbc1536f6b5de3d4c836efa2f0dcaf0cdbb1462

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...runtime.c-fix-build-without-x_forwar.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/nginx-naxsi/0001-naxsi_src-naxsi_runtime.c-fix-build-without-x_forwar.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
