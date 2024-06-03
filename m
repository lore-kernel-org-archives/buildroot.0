Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519E6C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2201B40350;
	Mon,  3 Jun 2024 09:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuiSGEI0jBjK; Mon,  3 Jun 2024 09:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 365FD4091E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 365FD4091E;
	Mon,  3 Jun 2024 09:26:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B358F1BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FF0D60756
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELjpJ1e7LBUf for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:26:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD9C360711
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD9C360711
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD9C360711
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:26:16 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52b962c4bb6so1747341e87.3
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 02:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717406773; x=1718011573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0pwl45QNPJbA3h4Yv+jOMuhgccYMZVsyKrP7Hossgbw=;
 b=uBFiHQTR2WBkNfWA0ooFsBBNJJFtJhqWb9ModA1EDhd4l0dZodh18p6A6XWavol9Tq
 ZvohkPf/yrj8r4zuRYblurtEGUIWg58kmaYt9eupltAKp+cFLsqBL3IlNrwwCnGGTwkN
 Q89hr2Qttz086n1Kjin0FOSE6suooMX9NvV0tfHnCMwJku32+RhZoMKyo5npb2hANOnU
 Xb/dnvTt8G+SiccGZLP9/zQlpqeF59BSumqyUTmiGGrOBESigYzJm+xIuthbhqAmOIRY
 4P2hbA4/J3bz8kkGiZN2G6rr09LYJS2u0SurNnpws5nU/iTsjqGA4vfviBmt3yNyruzI
 9t+A==
X-Gm-Message-State: AOJu0YwuNX79EUar70DA+jGykv+q+QmSH3DVxZUQHde7OeotVm9tJVDw
 VegYqED1CMvl5En1ONEUq0yOo049hD0uiYyqK01B5jnxnnxArYJ6YW2l0A==
X-Google-Smtp-Source: AGHT+IEP8PlT/0P0c+a1BzGJxH1JATXqsDUsxRtl5v6QLv6jFudqdreKSx4Fq5CISVqd1cwmYhrU8g==
X-Received: by 2002:a19:2d14:0:b0:52b:9046:c44c with SMTP id
 2adb3069b0e04-52b9046c59amr4873448e87.58.1717406772873; 
 Mon, 03 Jun 2024 02:26:12 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68e2d1333fsm253740966b.219.2024.06.03.02.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 02:26:12 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 11:25:13 +0200
Message-Id: <20240603092513.2696972-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1717406773; x=1718011573; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0pwl45QNPJbA3h4Yv+jOMuhgccYMZVsyKrP7Hossgbw=;
 b=DUqqLUqxAzR8Bvxi5tGCtjSAbZXPn83HVtP7agz3LHNN+pW3BPSZ3DAvgEl7Danhed
 jQmIx1NT1k3fGSCUWZQgnOQte3armZchSUGw7hpPZ68wtVm8nVdIOO22LA2jfgQEo89o
 7tNYlqi6ZmWmyz/a6aTF2CNlXJ16JWLOoIclHf0svZTTb9rTfRVzXi6Re3lRXCq+Aj4M
 90LtZ8tvp4JIl27LbyZIcWW+AG0ZS3UYFBOAZBCvlx7adxQ9/pcjvO/SZ0vjrVuOr3mP
 tQuAmuLJgXzEjomlepTn1uA3bAQ9ae9dny2174WuFtMU0VcCOQhKsPEv41y18n+leUok
 vwvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DUqqLUqx
Subject: [Buildroot] [PATCH] DEVELOPERS: add Yegor Yefremov for package/ncftp
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b9568ed7c5..03aa7bfa74 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3342,6 +3342,7 @@ F:	package/libxmlb/
 F:	package/linux-firmware/
 F:	package/linux-serial-test/
 F:	package/modem-manager/
+F:	package/ncftp/
 F:	package/nftables/
 F:	package/nuttcp/
 F:	package/parted/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
