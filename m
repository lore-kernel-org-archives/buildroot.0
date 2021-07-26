Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D021CC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:38:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 892D760F0F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 892D760F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 590F940286;
	Mon, 26 Jul 2021 06:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ock6JSyKdwVU; Mon, 26 Jul 2021 06:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CE54402A2;
	Mon, 26 Jul 2021 06:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1464C1BF3A8
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11057835E0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oC3Y7qLAnt8i for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 06:38:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18BB2835D9
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 06:38:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so7403372wmh.3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 23:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=raBOaIQkK6LuQI63FkGMAKGzx/k0tbv5fJQhRk96puM=;
 b=lsGl/1qjqH4Qjk/YpBcKrnanmZ0NtZ9teYmnoTx7dr9lwvtn7uZt6xZglW5hI2pjdD
 P4KuIovV5/m2ljKavgYQXukH0q2OmnTb4eiPVpoH5dotm0Yodv+z13lrnO92q1vGsdcd
 8Lw0l9kDn2zdoHuTOPKO9+KNwvGXMou+naLrSG8itVoif62IgYBCHUfCOq+Xt4Rc9Gwl
 Ggu+ypH2G+QlKox3fwknmUs//FRbg2ucmPRCLGqPpRsdreyvv9ywo9s8AFe+X6z5dzMi
 uhoa5Jg15o+x1mrfNWjEF6sIjpC0oIX6LrGEfcOabsUdkAdeqIJlyFR64yio/bJaYOqU
 aslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=raBOaIQkK6LuQI63FkGMAKGzx/k0tbv5fJQhRk96puM=;
 b=jHUK96G5l0JvUu7y86uJhYKusZnaoij4iqVrbhAZ+57isPXpDZKK5dRQjAZqeRYLuL
 948LGjS4SgYF0ol5o2H99aFXXkI8q4aEC9vQ7+doLC3RY8xcj9ozoRG1RIUctZ68HkNs
 HEcVbRdMCFLHj89Rf4ENdQQAJBxNOvuBqGuWY0rixifyT4jaHm0gl/Yit/NyKmVgiD2m
 My8K7JPuL1zbPsxGTKLo8FUIod3qga2FzGq4fdRulof4mntN5sHFG8vJdUNx/fnChYpY
 UhOAHdpsG+ZQNT8ygImaqMAiTxrM2cPI181x53Sf2DkzDjC/+bCRR8PLNFRnSj0fYcLh
 r1Ug==
X-Gm-Message-State: AOAM531OlprfU17myCH/llWpp6Oaf9UFJbONZjE4j+3kOKUJz9ZEb19+
 9Oc7WsIROTxRNnImjSzI5gbj2NsYkiEvlQ==
X-Google-Smtp-Source: ABdhPJysDLW0f9o3AMVrgHLqNqd7XB6SoLfmUApbQnOR/++gZ5MtMK2e1mxPIfLcei2xPDplz5hpig==
X-Received: by 2002:a05:600c:22d2:: with SMTP id
 18mr15367285wmg.63.1627281494620; 
 Sun, 25 Jul 2021 23:38:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id u15sm3099611wmn.6.2021.07.25.23.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 23:38:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 08:37:50 +0200
Message-Id: <20210726063750.1698302-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210726063750.1698302-1-fontaine.fabrice@gmail.com>
References: <20210726063750.1698302-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/nginx-modsecurity: fix static build
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix static build which has been enabled since bump of libmodsecurity to
version 3.0.5 in commit 464d0be380c84ac7c3f1684e49153c3868280d7e

Fixes:
 - http://autobuild.buildroot.org/results/e5a9eb8448980f1c5cafe97180b7d1f48ddf02ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-config-use-pkg-config.patch          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/nginx-modsecurity/0001-config-use-pkg-config.patch

diff --git a/package/nginx-modsecurity/0001-config-use-pkg-config.patch b/package/nginx-modsecurity/0001-config-use-pkg-config.patch
new file mode 100644
index 0000000000..3c74fa4b59
--- /dev/null
+++ b/package/nginx-modsecurity/0001-config-use-pkg-config.patch
@@ -0,0 +1,29 @@
+From 2907dcd628242eb29920321fb3a744915d11888f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 26 Jul 2021 08:29:21 +0200
+Subject: [PATCH] config: use pkg-config
+
+Change to using pkg-config to find the path to modsecurity and its
+dependencies.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ config | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config b/config
+index c6e7467..e20190f 100644
+--- a/config
++++ b/config
+@@ -50,7 +50,7 @@ END
+ else
+     # auto-discovery
+     ngx_feature="ModSecurity library"
+-    ngx_feature_libs="-lmodsecurity"
++    ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs modsecurity)"
+ 
+     . auto/feature
+ 
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
