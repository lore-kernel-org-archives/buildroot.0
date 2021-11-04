Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3AFC433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 23:14:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 163C461213
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 23:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 163C461213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78BDF40427;
	Thu,  4 Nov 2021 23:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8xryc6meoTp; Thu,  4 Nov 2021 23:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6B0D401FC;
	Thu,  4 Nov 2021 23:14:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46FD21BF21A
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 23:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3643A40620
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 23:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xvd4EusbO3ax for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 23:14:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DAAF40623
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 23:14:06 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d24so11026223wra.0
 for <buildroot@buildroot.org>; Thu, 04 Nov 2021 16:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QUkLdmbySjclExNN6w24chjvORBlzmO35csuf4bbLWI=;
 b=jd5Ax54YSC92BYSaGrM6b+7/AivxxecvhesBs5QJiYGzYDjOfwPxd+A+zbx04GE6wN
 ZLZ5iwV+8Js+Q8eFCg9V8ML0vdQ9RhJIJqPt7fdL+zpvl5h4Lp+rqV4c/SeE1hSKJK9Q
 WkB3/VPa51Ox6NAIWAYBZnx56Mzs0G26Vj4m3M8CLSorfdU/DS3HBQPQSU4ZxG4Baxlr
 C0HdRYtZ8wDmgWriyh5mcWGbJamfsZTPF7LYqBSZCpQa9RC5Ala6fwbOORE06cYI+CEj
 orfk7W2kcRLBdvwNXGVem8OLbFvaRcpWHPPrV/hUfBLBb9yrYLlrZS+hUUqDWm+JiIxe
 X2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QUkLdmbySjclExNN6w24chjvORBlzmO35csuf4bbLWI=;
 b=lFNmnkNWhLdaADR3JNPocKsFJoIoa/KFIHFOIpt3eQf5U+HyVhVB9xnTdw84bg0ZsR
 uA1jetRUghiy/2j4FRBDh8RzjJXDKwZAGjFQKrv93UOO3+su496Y7zeDczhnUwzrGI0R
 g0Db8FwCid5tksG8IyUWUItAJg5X45M6oUYdbq3UI0DVYfMrkWOrytboI/Uxx35zQGKN
 wkBliBr4NP54exzsBSVAGoMiCY1l1USnmY93roPIq9NNxzrrqPwAXarz+8UZcsTeLSv7
 r0A1uIZPZfSnpnWEc/t9XKZfE0pu9QQUNwaPiEM7boRyYBK8RzTqojkkh6o7e4YL4ixO
 Oucw==
X-Gm-Message-State: AOAM530AtK7YkwBCjWwqhxGH4AKkKeRXvKCY73F1fsrnz6LR9fbkVjxq
 Ue5Q2TSLeURDHjb3oilwaB+tgHqG+QA=
X-Google-Smtp-Source: ABdhPJwNwBq4DO42nhTfoFxXcB34Cl+vd5H5h8prosFU49/DsbkyP/kzSN3Z32k7dJguslRRmS62Gw==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr67943913wrn.291.1636067644249; 
 Thu, 04 Nov 2021 16:14:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z14sm6542995wrp.70.2021.11.04.16.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 16:14:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 00:12:07 +0100
Message-Id: <20211104231210.2027405-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/dahdi-linux: fix typo in Config.in
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo added with commit d959966b41bd88a36664c733a8a8d2b6809e4fc2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dahdi-linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dahdi-linux/Config.in b/package/dahdi-linux/Config.in
index f2a370917c..ea9fc00db2 100644
--- a/package/dahdi-linux/Config.in
+++ b/package/dahdi-linux/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_DAHDI_LINUX
-	bool "dhadi-linux"
+	bool "dahdi-linux"
 	depends on BR2_LINUX_KERNEL
 	help
 	  DAHDI (Digium/Asterisk Hardware Device Interface) is the open
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
