Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B93AFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 22:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD55B8131B;
	Mon, 31 Oct 2022 22:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD55B8131B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxeSmy8xaAmf; Mon, 31 Oct 2022 22:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0902B812CA;
	Mon, 31 Oct 2022 22:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0902B812CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A92841BF2B6
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84A3460BCC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84A3460BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJwik5AtjpTe for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 22:29:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1368360BAE
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1368360BAE
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 22:29:13 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id y4so11997302plb.2
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 15:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3RjdAIm8b/qsvQVYMMMdLluHCfWFN3ita3vBJFFexsA=;
 b=splkk7xBCN4BU1s4kTDx/cZn+sanq5UcKa3bx9QypHAp1YxsZo/c8VM5nA+JwSiMzb
 ufv4m1DIoac1422vyYNuBiNgVwedfQ2TPzpoDn7ZE/HvP/sKW7H2r+elwXHWxoHxC4NS
 QhZ04znPYxsV983quavZPb9PasZIQ/Ge1qklAbNHJ6TK9ynKP8bF8tYisKJXsH1xc3Ay
 fjc9AAk8L2FFzkRO7J1vn7NtI27y0emDziKQ4JvejV9a2tn75fEYtffe9mEsdaxKVa6i
 ZcWdkR2VGJccqXXEswPzdOvpDb38ZDwUGOaofPJI5bXew+4KI5yv8hMpMLfspDTCPoZo
 cASg==
X-Gm-Message-State: ACrzQf0behKasW6CM+7dOw3+YECkYa7N8DkesCHzzvwmw2pV+dmSUBKw
 oHdbmMtoDx4QYHOs3P513UaqVkYV1Hhnhg==
X-Google-Smtp-Source: AMsMyM56/LavoYdQu5jU5bWvIGTDkBQ+ynNJO9miXn7ktBNsc6vK5mjQWr+hc/YH4aWciPJSjoTTSA==
X-Received: by 2002:a17:90a:fc94:b0:213:f73a:86a7 with SMTP id
 ci20-20020a17090afc9400b00213f73a86a7mr4375356pjb.144.1667255351911; 
 Mon, 31 Oct 2022 15:29:11 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 m1-20020a17090a71c100b00213202d77d9sm4641690pjs.43.2022.10.31.15.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:29:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 15:29:07 -0700
Message-Id: <20221031222907.275293-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself for
 package/docker-compose
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 06ee5d8056..e1e919ce4f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -554,6 +554,7 @@ F:	package/pkg-golang.mk
 F:	package/rtl8821au/
 F:	package/runc/
 F:	package/tini/
+F:	support/testing/tests/package/test_docker_compose.py
 
 N:	Christophe Priouzeau <christophe.priouzeau@foss.st.com>
 F:	board/stmicroelectronics/stm32f429-disco/
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
