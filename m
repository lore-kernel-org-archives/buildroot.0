Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AC9C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:54:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC0E460FF3
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC0E460FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E76B4018D;
	Tue, 20 Jul 2021 20:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Px1trhyOX3Dq; Tue, 20 Jul 2021 20:54:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAC7B401BA;
	Tue, 20 Jul 2021 20:54:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4CC81BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A159882D57
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIziRHBrec4A for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:54:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DB4C82B81
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 20:54:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id w13so124428wmc.3
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 13:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pga4vhfEbuNtd8m8Fx37sX8YPqLBxdmGBG4llDOwZTg=;
 b=rDy4ZTpD9kY8xBMnuJLWwFEwk12Y6uxRj0AOty4kgGV7+GMORZejiGP319kQgXArn/
 l7HsDSLbziBU79ymu5fpxp/MYNNAsyMpTSRfYBpr7k0oFQBa+48/q5cWc475hlDbsNvN
 sUvGC7tzcqMOWlCMG4Ou37nZI2dYZgL97WvruFt5r4NbnjQGFJ3UgBXtbv3MADOI4bLx
 KEQZDknYNQjC3JoxF+zROUcdvZS/5QTAR78VOpPOHPAzh4EN1D/s3qdznp0XZZhV4wCs
 GpT/FvT2pDlFfepZ3lB2GJBYTXxDnPvUabeCp8xaYuBDi66WbRvIU8YW6HMuxjKGUfDp
 CNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pga4vhfEbuNtd8m8Fx37sX8YPqLBxdmGBG4llDOwZTg=;
 b=C1uGwlvybmVAY7/ozO1CR6rEU/alXcNKWwRUeIwjYYyaBfmmJcIcd5LmF+kF/Fsmko
 xBiA9qMaWA9aSe+JqRpUTmyFHG8Txier0MZNbLGGGEn1+Hj4qzBkETdcR+L1qVcwuHrd
 Tni9dmee3wmVdq8GEyl6j4o1AGGtKtxKRdRk8hUZHXbZaR7apfPxxznGkwTXdrbiC4cQ
 s5BKpgyqjRkyv+xhdV61u754OJWioDrorncfYM/zsENyQJonzmiJhdzTlIse3SN7bJJa
 1QZPtob1iBw1U/dH/4Fs8UlbRCgcpwkOzqiSeWPUSaFFD/LSOQ6HQv7sl9Y2AsaoAW15
 Qmow==
X-Gm-Message-State: AOAM533PBw8lZr9tZWNabwWntefwzXX4bRLzRPD9XLA9woHdelt88IQj
 22WorNM6hFW1jV9ufe/vplls9zOu9nFdfA==
X-Google-Smtp-Source: ABdhPJz73+MTbKTKWpecN6pMIym9GhkMGp49WY1DCfiNXS/aOs+SW0UX/+D0QY4nXkf365gCTKiEow==
X-Received: by 2002:a05:600c:3644:: with SMTP id
 y4mr373214wmq.85.1626814455997; 
 Tue, 20 Jul 2021 13:54:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id 140sm20958807wmb.43.2021.07.20.13.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 13:54:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:54:08 +0200
Message-ID: <20210720205408.84155-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/darkhttpd: fix build with gcc 4.8
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720205408.tu0d_Z4aMsHdwJ3_1sNMMuGba2soSuZM6w8moFb313k@z>

Fix the following build failure which is raised since bump to version
0.13 in commit 88705a8c248e566f2c9ca71a8ee5353b33e368c2:

darkhttpd.c:966:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int i = 0, j = 0; i < input_length;) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/ffc/ffcb627c44d2b7202d641129b67af2dc7865c618/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...vars-outside-of-for-loop-for-std-c90.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch

diff --git a/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch b/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch
new file mode 100644
index 0000000000..7584bff98e
--- /dev/null
+++ b/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch
@@ -0,0 +1,39 @@
+From 81b491e60affd67f4ec2feccbee1cdf98dc57b81 Mon Sep 17 00:00:00 2001
+From: Emil Mikulic <emikulic@gmail.com>
+Date: Sun, 21 Mar 2021 15:03:14 +1100
+Subject: [PATCH] Declare vars outside of for() loop for -std=c90.
+
+Fixes #2.
+
+[Retrieved from:
+https://github.com/emikulic/darkhttpd/commit/81b491e60affd67f4ec2feccbee1cdf98dc57b81]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ darkhttpd.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/darkhttpd.c b/darkhttpd.c
+index 219a8a3..268628a 100644
+--- a/darkhttpd.c
++++ b/darkhttpd.c
+@@ -966,8 +966,9 @@ static char *base64_encode(char *str) {
+     char *encoded_data = malloc(output_length+1);
+     if (encoded_data == NULL) return NULL;
+ 
+-    for (int i = 0, j = 0; i < input_length;) {
+-
++    int i;
++    int j;
++    for (i = 0, j = 0; i < input_length;) {
+         uint32_t octet_a = i < input_length ? (unsigned char)str[i++] : 0;
+         uint32_t octet_b = i < input_length ? (unsigned char)str[i++] : 0;
+         uint32_t octet_c = i < input_length ? (unsigned char)str[i++] : 0;
+@@ -981,7 +982,7 @@ static char *base64_encode(char *str) {
+     }
+ 
+     const int mod_table[] = {0, 2, 1};
+-    for (int i = 0; i < mod_table[input_length % 3]; i++)
++    for (i = 0; i < mod_table[input_length % 3]; i++)
+         encoded_data[output_length - 1 - i] = '=';
+     encoded_data[output_length] = '\0';
+ 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
