Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C8FC43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 21:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6EF94191B;
	Mon, 20 Jun 2022 21:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6EF94191B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZiaTLAS4X7km; Mon, 20 Jun 2022 21:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7441741913;
	Mon, 20 Jun 2022 21:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7441741913
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3CEA1BF398
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E26183E61
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E26183E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FD3kcLe443SM for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 21:18:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 932E583E5F
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 932E583E5F
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 21:18:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g27so9626472wrb.10
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 14:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttI6/l94tGNHzWFm/j95ZO4Q8Uem1kstI8qROotTPEc=;
 b=1Z5ubKzVAbNfojd12tE0P2xV1Jk/7/CJhK0DwFujCqc6YtciNuY7XvOWppiQg+6kHx
 yFcjk+cFjlhjOacpP2rTajs0cdBriQ6lkby3cyhCCaLtu6acwFryeP4V5n23ZTsbb+N9
 e/NwNj4Z5rDTmveb7fcH0UkIOwBOfsaamfCRfR640EUTXsJ3HEmZ7Avc/A/wv1bn/38a
 k9GVWB5Q/H9Bk3yz+Ap6qd+WMwdqf+gEfyYI6jLWZvYCCEAWPxeXM7npjDtc/C3poN3s
 KObvHO8ms8qU8tmOrEhTYN15L35iSIMJ1Uif9F0+J+28+k984cLXUUqp209Em6dC/R0A
 SnVQ==
X-Gm-Message-State: AJIora/qoZoJ1LmwJ3Vtib/8MClPjxYneSpvH5Y0dRZa4E6zs/G3TOcz
 miDfnYhnj09KznYa5bQCIi7MX7q5zoE=
X-Google-Smtp-Source: AGRyM1uHsJYSbLcmE3tJy1rBHIXiArSdudDyY69Mm/717doe0v0/5ED9lIzgjttZSk78F6nZ9FT/pA==
X-Received: by 2002:a5d:620f:0:b0:20c:c1ba:cf8e with SMTP id
 y15-20020a5d620f000000b0020cc1bacf8emr24644689wru.426.1655759932394; 
 Mon, 20 Jun 2022 14:18:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c2cb100b00397393419e3sm20562518wmc.28.2022.06.20.14.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:18:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 23:16:06 +0200
Message-Id: <20220620211606.772454-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttI6/l94tGNHzWFm/j95ZO4Q8Uem1kstI8qROotTPEc=;
 b=Bm0sr/iLZ+v2iKuvVE6Czs7A3lVusMoA24x/OyTkCm5jWfGrCmVUtvec8maSna6QYH
 siciFLYz3QhMWvibLsiCeWvOfmioXbLjgMYOD/c9fxeR/Kat4Ng7yIdcqfD76EUhyj7v
 6uJzbfj4iqE3lHEh3Tzss2wFkxtfhv8/yzXBEXx4tOvlYkAIBr67h0yZ9wTfmPtWKTWC
 DGMdt0gqujtaQv9h9HFnY1iJ6428Iip707FgLTXTr8xdl7jXLcCr62bB4cyCh+MriFVF
 qZFOKkG9VhqE/W7M1tBEYOOC9dKgt3xh7+DBD8seIsEk2mtHtePkZF7qokqKxfrKpXWb
 xRhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Bm0sr/iL
Subject: [Buildroot] [PATCH 1/1] Config.in.legacy: fix 2022.08 entries
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

Commit 7763ba7007172ceb5e928ae5902735d727aaa90d wrongly added
BR2_PACKAGE_RTL8723BS below 2022.05 entry instead of 2022.08

Commit 793ee1011e84bd79fa3d146dbe6c14c7fba39648 wrongly duplicated
2022.08 entry

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 956da10a9f..8af5c7ef14 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,13 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.08"
 
-config BR2_PACKAGE_PHP_EXT_WDDX
-	bool "php wddx removed"
+config BR2_PACKAGE_RTL8723BS
+	bool "rtl8723bs removed"
 	select BR2_LEGACY
 	help
-	  The WDDX extension was removed from php.
-
-comment "Legacy options removed in 2022.08"
+	  Package was removed because it is not compatible with latest
+	  kernels and is not maintained anymore: code has been removed
+	  in 2017 as driver is available in the linux-next tree.
 
 config BR2_nds32
 	bool "nds32 architecture removed"
@@ -162,15 +162,13 @@ config BR2_nds32
 	  its support being removed from the upstream Linux kernel,
 	  and its lack of maintenance in Buildroot.
 
-comment "Legacy options removed in 2022.05"
-
-config BR2_PACKAGE_RTL8723BS
-	bool "rtl8723bs removed"
+config BR2_PACKAGE_PHP_EXT_WDDX
+	bool "php wddx removed"
 	select BR2_LEGACY
 	help
-	  Package was removed because it is not compatible with latest
-	  kernels and is not maintained anymore: code has been removed
-	  in 2017 as driver is available in the linux-next tree.
+	  The WDDX extension was removed from php.
+
+comment "Legacy options removed in 2022.05"
 
 config BR2_PACKAGE_KTAP
 	bool "ktap removed"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
