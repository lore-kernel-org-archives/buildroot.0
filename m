Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC95C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 21:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB2860A71;
	Sun,  2 Oct 2022 21:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB2860A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kj5s_-zIsFCN; Sun,  2 Oct 2022 21:19:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A64760888;
	Sun,  2 Oct 2022 21:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A64760888
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA22F1BF3E9
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 21:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5C2E60888
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 21:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C2E60888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-nWzFWojX8N for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 21:19:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A822060864
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A822060864
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 21:19:15 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b4so7216790wrs.1
 for <buildroot@buildroot.org>; Sun, 02 Oct 2022 14:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=8ahOaekcZCTLymiupO7GHVi4BWKmMBPO5ZLFdNUr+Lk=;
 b=Lka+XJU0hyMA7x8njpWo4o615egbkGvUVV9E3PN6H9mwUDeI5j5OldjgUVY9Q4HyOj
 xYrszL7npgqByRKe3GnlVyHY48qtukkIkCnU7t/lO34KWK3ff82rKCIfSfzoUMH5igSy
 BXO/9GG9uLRpggX4CSUQZaFfLhVTEtu/P8ARbp0fUOYe5Dx5CuKK7+lviJP8ytHNl8tN
 +NCRc+viK3DSB/He2V3WtxsmeZ8reDwRjcNYWP3WoTfsLzGRRxTk36d9SWvx00IVUznw
 Q6vtfaQvB71CKc/NSD+CMxeWahQQsXQr/+LhzkYCHG1sIL060MDZ4RTg9UlJPxRqJ/IY
 LdjQ==
X-Gm-Message-State: ACrzQf2vME44itF56xKAjWTKnC69MuxtfE5twLIs0xjEPBaUMwEulkwE
 X9nu/6N/KN9MaN2f1wWVILoBg3USFgw=
X-Google-Smtp-Source: AMsMyM5cuj2wY/qZJAEZUE5v4K7rY6Rh81/rVkNMfoIUc6LdOzLPhpLInHhBENOY1OeTNG53TeHflw==
X-Received: by 2002:adf:f98b:0:b0:22e:3694:a5e1 with SMTP id
 f11-20020adff98b000000b0022e3694a5e1mr2383239wrr.134.1664745553259; 
 Sun, 02 Oct 2022 14:19:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g18-20020a5d4892000000b00228d183f9c2sm8150991wrq.89.2022.10.02.14.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 14:19:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Oct 2022 23:19:10 +0200
Message-Id: <20221002211910.9526-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=8ahOaekcZCTLymiupO7GHVi4BWKmMBPO5ZLFdNUr+Lk=;
 b=U8LHwrTKMwvi0ZDYE4rJZPfp05OYDgE8pIVQB+Z6456Dpe9o1/p1CNR9uxIynSaVvC
 wEmNL+04ldrH9iG2KHOY3b1zKU0H246t9YWz/6JuntQhKT4pgT23Mzv9gPU4ookR0btf
 lz2Mzf6bkPuPDpD5KtrX2aDfkRatuKdYUEidPwXVrXB8bmDTA+n+mWEU+tQu7N6A4d+3
 tmMagtkPRFRauAyYcsK/QJAz2C376Y0BfauDIXKW+/LLksD4pyoH1RX21vwj/IwOkVm7
 h9NQZyOu4avpi9LhesSNnheungUL94qsitv9O3ofNlJ9SUJ/Pt8duIOvjTdwRHxznZBl
 We3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U8LHwrTK
Subject: [Buildroot] [PATCH 1/1] package/darkhttpd: security bump to version
 1.14
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Fix CVE-2020-25691: https://github.com/emikulic/darkhttpd/issues/21

https://github.com/emikulic/darkhttpd/releases/tag/v1.14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...vars-outside-of-for-loop-for-std-c90.patch | 39 -------------------
 package/darkhttpd/darkhttpd.hash              |  4 +-
 package/darkhttpd/darkhttpd.mk                |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch

diff --git a/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch b/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch
deleted file mode 100644
index 7584bff98e..0000000000
--- a/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 81b491e60affd67f4ec2feccbee1cdf98dc57b81 Mon Sep 17 00:00:00 2001
-From: Emil Mikulic <emikulic@gmail.com>
-Date: Sun, 21 Mar 2021 15:03:14 +1100
-Subject: [PATCH] Declare vars outside of for() loop for -std=c90.
-
-Fixes #2.
-
-[Retrieved from:
-https://github.com/emikulic/darkhttpd/commit/81b491e60affd67f4ec2feccbee1cdf98dc57b81]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- darkhttpd.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/darkhttpd.c b/darkhttpd.c
-index 219a8a3..268628a 100644
---- a/darkhttpd.c
-+++ b/darkhttpd.c
-@@ -966,8 +966,9 @@ static char *base64_encode(char *str) {
-     char *encoded_data = malloc(output_length+1);
-     if (encoded_data == NULL) return NULL;
- 
--    for (int i = 0, j = 0; i < input_length;) {
--
-+    int i;
-+    int j;
-+    for (i = 0, j = 0; i < input_length;) {
-         uint32_t octet_a = i < input_length ? (unsigned char)str[i++] : 0;
-         uint32_t octet_b = i < input_length ? (unsigned char)str[i++] : 0;
-         uint32_t octet_c = i < input_length ? (unsigned char)str[i++] : 0;
-@@ -981,7 +982,7 @@ static char *base64_encode(char *str) {
-     }
- 
-     const int mod_table[] = {0, 2, 1};
--    for (int i = 0; i < mod_table[input_length % 3]; i++)
-+    for (i = 0; i < mod_table[input_length % 3]; i++)
-         encoded_data[output_length - 1 - i] = '=';
-     encoded_data[output_length] = '\0';
- 
diff --git a/package/darkhttpd/darkhttpd.hash b/package/darkhttpd/darkhttpd.hash
index af5a2bf8c9..188afff767 100644
--- a/package/darkhttpd/darkhttpd.hash
+++ b/package/darkhttpd/darkhttpd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  1d88c395ac79ca9365aa5af71afe4ad136a4ed45099ca398168d4a2014dc0fc2  darkhttpd-1.13.tar.gz
-sha256  44e784df460954c7760e2eeae69aecb12a3d23ca1c0a4f6047c3c6452b2e2f49  darkhttpd.c
+sha256  e063de9efa5635260c8def00a4d41ec6145226a492d53fa1dac436967670d195  darkhttpd-1.14.tar.gz
+sha256  f002944c9a8516e3346002d39c3e13681306833358c0f3c7781dff1fdb639710  darkhttpd.c
diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index bc68d43ef9..bda08899b8 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DARKHTTPD_VERSION = 1.13
+DARKHTTPD_VERSION = 1.14
 DARKHTTPD_SITE = $(call github,emikulic,darkhttpd,v$(DARKHTTPD_VERSION))
 DARKHTTPD_LICENSE = MIT
 DARKHTTPD_LICENSE_FILES = darkhttpd.c
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
