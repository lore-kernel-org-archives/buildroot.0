Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C43C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 16:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A23E40990;
	Sat, 14 May 2022 16:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0tpW2XOdtLUB; Sat, 14 May 2022 16:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3B06410D7;
	Sat, 14 May 2022 16:06:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8383A1BF836
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 16:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8026460A75
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 16:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-FUfIIjWhBh for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 16:06:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87A5360808
 for <buildroot@buildroot.org>; Sat, 14 May 2022 16:06:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so8478084wms.3
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VD/JAVOEJ/BK7yrATEnBpYSRup7q4cepRKAwpkaP9MY=;
 b=IEYiedMfaQcdVAPQkdTDvoXdfc46siMgwN0fwBK78x2trtncO8CLgwJkTPSiHXhjRu
 vvszRgNhf95voCdSS8stdWdTgAGobxE5U/WVe7N4sTlRIHJWvLZKIIl1Uaq0dhj16Xw4
 a+R8gp8yNCxZWIrMr/SCE4dLavhKDEQDJstViAaUmAtBGSNs1XlPIneLtJdouRo6za35
 SHym3wk6iInq1S+29T6aqXh5uQ3WtfVIxAFG1J4ECGOizOm8qs5ROhpVHeKdvWq195tC
 HS8S09ab2YX1wrXDsrriTIyrqPCkJ8l1guUL0PRded1EwpNRj//bxEYBgTpRculQ59Ay
 Hjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VD/JAVOEJ/BK7yrATEnBpYSRup7q4cepRKAwpkaP9MY=;
 b=HMMs8y7BQ95uvhIl3GBhUOtCm96n/FAtU+HP4O7S19uLtJSKL+Uw11RZTffLYSxdZO
 XWJaHdQ+2zC0CoUOsTNt0xJ0DPldbR5ojuEF01Hr0TE2hCCo91oNAkg5LicXzR5MIgmM
 lhIu4j+BqCLbHAo50BeBm/qBh1eRjBVXXVq+3HWE7i7JeNWAp0YJuFLW5qLg9UftbB12
 K7skrjSKHjbfjWabsPZUAwusvojx7sBsyVo3ySCMA3moOAJ02jCBpu0bheU54urflpN7
 9U01XqsQsGqUFEGUHJ08FeEDae1zdZy7uJxUi8fSEVR29no6KicJwlPMbSc3rKFqn9B7
 Omeg==
X-Gm-Message-State: AOAM5328gSZ1aXBoBdDf8xXm49mgF/3C6+raR0P9BJsNXzX8jvqXKSCX
 j856kNSIP63ihhxreRPaEgdQyIpZPrI=
X-Google-Smtp-Source: ABdhPJzL4TgL+S247xoCBadcRTRnTyGRBvIhGJaMo1gmJUIAgMr9FGA/vTySojLfh4oXVcPfh0AeWw==
X-Received: by 2002:a05:600c:348a:b0:394:8777:c24e with SMTP id
 a10-20020a05600c348a00b003948777c24emr19990014wmq.93.1652544398359; 
 Sat, 14 May 2022 09:06:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i10-20020adfb64a000000b0020c5253d8bbsm5099756wre.7.2022.05.14.09.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 09:06:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 18:04:26 +0200
Message-Id: <20220514160426.7683-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nodejs: fix legal info
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
 Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 07408779cc068041a2da6838fe077d1a679f1736 forgot to update hash of
LICENSE file (multiple components under MIT added:
https://github.com/nodejs/node/commit/71659fd4baa90006937e78d789ec0aef95672eb1
https://github.com/nodejs/node/commit/f17ce913c94d26c87a471179d99d8bc4134f7bb5)

ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5
ERROR: got     : 6211cc77f9ceaf365db12faf050775b3a1e6da7a1eff3577ba006c4918103c33

Fixes:
 - http://autobuild.buildroot.org/results/bd1e3238f294152d54ee8f5579431606309dbff3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nodejs/nodejs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 998229341e..716becccc9 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -2,4 +2,4 @@
 sha256  a0f812efc43f78321eca08957960a48f5e6bf97004d5058c8dd3b03c646ea4f7  node-v16.15.0.tar.xz
 
 # Hash for license file
-sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
+sha256  6211cc77f9ceaf365db12faf050775b3a1e6da7a1eff3577ba006c4918103c33  LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
