Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9422C433FE
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 07:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 753714031F;
	Wed, 30 Nov 2022 07:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 753714031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4R_0aKdhh25; Wed, 30 Nov 2022 07:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA3A940BA7;
	Wed, 30 Nov 2022 07:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA3A940BA7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 932E31BF853
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D26E40BAA
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D26E40BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBzN7Th3cfMx for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 07:44:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDD7140BA7
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDD7140BA7
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 07:44:49 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id y4so15870628plb.2
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 23:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vnj3k0u88d8aMrOB94bUgxxRxjUMBenPsqpNykReiB8=;
 b=8NI6sWlJnGxM8B78jx+SiESv7Gn95zHK1qXzK01WKF7bngcrh1Lnp30OViNkWy6Oxh
 95ldDvqRW/sWyl41Ej4xHQ52u26Frv4LXuxVExTqC1VdnXdzYUkdbf7fGDqy6PETTCer
 TMb82fEGzneyna2gaYfbKPCHLnkWSH7Q9U7LZWhgC9ZseO2WyhCNZg6rkR9rjI/y6F1F
 dHRc0ccJ5eDHcZJ09j57ssJ85/aMT/l70y8fnKSrt6ZC73WS91D+Mua5POw5fN8kpZae
 aeDfKLnFhXCakdtyDDupcINUb90qTpmrKA5rxicX4Z9fSIKFXPiCvykgOTpZJh2iHBdn
 sFmw==
X-Gm-Message-State: ANoB5plVuftmzgyVk52N0nKVTipnk63rfCuDeZc2jtKOoZqYu4xA1Bbt
 DZRBgcAg5/pYz7AXxTyBPFkjoI7eklg=
X-Google-Smtp-Source: AA0mqf48pJ546h4XXKgewnbjJ33paAViHytKWBbwXQUqg2+x22mSFUshTBqSp+dB5dSmzo9+vOFhmQ==
X-Received: by 2002:a17:90a:a88e:b0:213:13ab:c309 with SMTP id
 h14-20020a17090aa88e00b0021313abc309mr62998263pjq.80.1669794288975; 
 Tue, 29 Nov 2022 23:44:48 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 w64-20020a17090a6bc600b00219025945dcsm2512810pjj.19.2022.11.29.23.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 23:44:48 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 23:44:44 -0800
Message-Id: <20221130074444.829636-2-christian@paral.in>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130074444.829636-1-christian@paral.in>
References: <20221130074444.829636-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Christian Stewart to
 balena-engine package
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
index bfebf8163c..bcfbbc9b22 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -531,6 +531,7 @@ N:	Christian Kellermann <christian.kellermann@solectrix.de>
 F:	package/python-pylibftdi/
 
 N:	Christian Stewart <christian@paral.in>
+F:	package/balena-engine/
 F:	package/batman-adv/
 F:	package/catatonit/
 F:	package/cni-plugins/
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
