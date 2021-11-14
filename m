Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F12C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 11:45:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C9FA60EE7
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 11:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C9FA60EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA7F80DD8;
	Sun, 14 Nov 2021 11:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o31AScl2de_4; Sun, 14 Nov 2021 11:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77F1680D89;
	Sun, 14 Nov 2021 11:45:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72A4F1BF2A0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 11:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6104B402B7
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 11:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FF_mxHGWhe5i for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 11:45:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72DEC40277
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 11:45:45 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id y196so11424431wmc.3
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 03:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zADRjWz5rX77g3MqU2XQ3TFXkcXKoTHX2nuT9VPe3oo=;
 b=Dh6Q+w7NKnXdRAJNio4YwfWaLS/cUi3ZNODrw10hDZfdzoijytXVuUJNHtIst5w48O
 d1HTsIDNhd19Vl2t8e9Fk8qITpbJPAolO3BI0uPq/RtTJnEUndDWvsN1kYz9FCBlNDXN
 nyYsRMuU0TLuEcMOj6h3l9SFRVoq33JLyIBp0N/EZ5tAlFSGxMzAe2pLmOfsuTZE9U4O
 hIVP4KELjry1Y9YgCJTN0krBvaSrAE41jtlJ4uB7R33kkY4VIRiE2Ca17EkYSy7CEqZr
 0OVAZo9X5cXAR8lPnwH9fW9/OpILQrSpJb6MG5SuiMkGlLnU81PvCvRyBll58vD6E75Z
 PjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zADRjWz5rX77g3MqU2XQ3TFXkcXKoTHX2nuT9VPe3oo=;
 b=U6SyybnA1cZYTGd/CoVMxXWE2zQ43Tsxnt+ojgD54wv2kNJimH+d734XAwIez+jJ6L
 FJLwTemGBjHW+/ZaLkqWk7OaCUpiMRbtuHeIvHjarBil8FX4AgBFTzr4eouC3+j4VKSh
 svOHD4QJ8l3W3wfclcb9SAQkluescEIhf5CjAxKsignHjyGZ57fkKsub7Uru51FOTVUO
 VbbLZBcm9AcFgudp4iL+STTia+Kl+6JJvfFFL3ADIjISdxU1oYFWHf78UpIM+PNwcTe9
 M6sCCLgUZjFJqqTl+KViExL8f/072X4DKNeiAAQOGMK9RxRy3g8ZU/HOnENzm1vExpTY
 pldw==
X-Gm-Message-State: AOAM532OTTApxnyEuxd8vofvOg4gNdFS2irzK4kOaHS8UD/CRdNjRqN/
 ns9tywJYjiNwZ6GNXKVuI4BPQMXVV3c=
X-Google-Smtp-Source: ABdhPJy/uUh5KV/M8nAzvMyWbBhaUaQW5ZGo7aOw8AD7qO7JfaMHWFh3Vphic9Bajtzhwt+pZ7WUhg==
X-Received: by 2002:a05:600c:4e07:: with SMTP id
 b7mr47757361wmq.8.1636890343535; 
 Sun, 14 Nov 2021 03:45:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id k13sm6338148wri.6.2021.11.14.03.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 03:45:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 12:43:42 +0100
Message-Id: <20211114114342.1316711-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sg3_utils: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised on musl since bump to version
1.47 in commit 710b0eaebeb25d7718bfb10e87f0d67adfaf8c2f and
https://github.com/doug-gilbert/sg3_utils/commit/f0195003bb0c66ba55084b2f7e0fe982f08c5675:

sg_dd.c: In function 'main':
sg_dd.c:2402:17: error: unknown type name 'uint'; did you mean 'int'?
 2402 |                 uint off;
      |                 ^~~~
      |                 int

Fixes:
 - http://autobuild.buildroot.org/results/9ead59ffefefe2a4e3b94a153b3d23231736d882

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-src-sg_dd.c-fix-musl-build.patch     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch

diff --git a/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch b/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
new file mode 100644
index 0000000000..50a81a78a4
--- /dev/null
+++ b/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
@@ -0,0 +1,39 @@
+From c93ad13ecd8ddfbb8bb3e4d5d5ad7f3f2c633db6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 14 Nov 2021 12:37:16 +0100
+Subject: [PATCH] src/sg_dd.c: fix musl build
+
+Fix the following build failure on musl raised since version 1.47 and
+https://github.com/doug-gilbert/sg3_utils/commit/f0195003bb0c66ba55084b2f7e0fe982f08c5675:
+
+sg_dd.c: In function 'main':
+sg_dd.c:2402:17: error: unknown type name 'uint'; did you mean 'int'?
+ 2402 |                 uint off;
+      |                 ^~~~
+      |                 int
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9ead59ffefefe2a4e3b94a153b3d23231736d882
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/doug-gilbert/sg3_utils/pull/7]
+---
+ src/sg_dd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sg_dd.c b/src/sg_dd.c
+index 9d05c93..35e2423 100644
+--- a/src/sg_dd.c
++++ b/src/sg_dd.c
+@@ -2399,7 +2399,7 @@ main(int argc, char * argv[])
+             res = blocks * blk_sz;
+             if (iflag.zero && iflag.ff && (blk_sz >= 4)) {
+                 uint32_t pos = (uint32_t)skip;
+-                uint off;
++                uint32_t off;
+ 
+                 for (k = 0, off = 0; k < blocks; ++k, off += blk_sz, ++pos) {
+                     for (j = 0; j < (blk_sz - 3); j += 4)
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
