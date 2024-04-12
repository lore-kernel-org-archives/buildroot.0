Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDDEC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 13:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D85E607CF;
	Fri, 12 Apr 2024 13:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOGAhF8QLQ-U; Fri, 12 Apr 2024 13:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43537607D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43537607D5;
	Fri, 12 Apr 2024 13:27:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36C711BF3A9
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2388580FA6
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nQ6Nf9LV0Xe for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 13:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1593080F62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1593080F62
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1593080F62
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 13:27:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4180c6a60baso2036535e9.0
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 06:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712928458; x=1713533258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/2PhXelcqlX/zZX5Ov4PrNE+gepbTcmvlJn3IeBQO00=;
 b=W6JILvJuTms8iC+HLCHnoc69YQrsPNedklUpfa4NesTzFvE5ljdUYY2c4cZNktPjkl
 SLQcNy+MalXZ0kC0HAi8uX85Oef8XO9lDgykeKYfKHmFvy4GCqjv9CgH17Ef5+MFpaQi
 AtrZFDPQAlQLGh1mAT+P5lX1YunGs2GgHglwJKv5yIuoIswNRl/QF5AoBsV7zY9cGO6q
 gEIPbIuCqFf4k3fYvEpFmvK8wbnJYBdyM0yL+ViIstjNcaKw4p8fi91VdrW1dtV0SWuv
 LPkgdIwgrtrAO83Rj/mKxz4a17yuEgx/A3VvqAFtJGhoVOX5ZySSWEdhPvolGZYa+GBx
 kCEQ==
X-Gm-Message-State: AOJu0YwXsNrj9vlCdK9OIrD/hRTnbR6LswzU39xFDWc90M/MtUgHX0Iz
 qNNeui/FJJF5zRZWDRD0Yz+vLrjrbEYwlvUUwyK8+gaOkG6Y9nH4j8OyEOsa7AMY4GmUEXsDBc3
 6Ais=
X-Google-Smtp-Source: AGHT+IHnHj5SY6XCiMbOiXTZXdzIYJPzq1+G9+KEEivUsSdk6YQ4unZZS2N24GULZcMwQTJtpev5dQ==
X-Received: by 2002:a05:600c:34d6:b0:418:cae:509a with SMTP id
 d22-20020a05600c34d600b004180cae509amr632032wmq.40.1712928458532; 
 Fri, 12 Apr 2024 06:27:38 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b00343a66f6be4sm4288163wru.24.2024.04.12.06.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 06:27:38 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 15:26:53 +0200
Message-ID: <20240412132659.1168317-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412132659.1168317-1-thomas.perale@mind.be>
References: <20240412132659.1168317-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712928458; x=1713533258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2PhXelcqlX/zZX5Ov4PrNE+gepbTcmvlJn3IeBQO00=;
 b=dMnq3Hao1N/nXEJk9eURO4vgF09UaY6GeqXTMR4cEySn5v/bmmOh+ZepxF9NcrlGfb
 jDR5OATL4LPlG929ruziuLaM09au7wr4GFGisWveQCVf+neNb5UKbvh7FpiH/iQyf8HM
 rVRatcNDQIETRnFqMaqz0WCmYjLk9TBKvNVAHkvMo+ESmp4sNvpmNWb0G3SRgRllJQpu
 kF4gnX6KNffREa6wEZC+iHhZejVo9ZxNFVTWRKsIRSswHFSu2hkHitgKhFVogZ8j0ojP
 4Ss1GhdtoxXpqR10rZ27TyM2Ea7GPPBfB6XKfIEeQEFhrycF88LWAijwfFL/t/7+Go1b
 fDkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=dMnq3Hao
Subject: [Buildroot] [PATCH 1/6] DEVELOPERS: add Thomas Perale for 'go'
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Christian Stewart <christian@aperture.us>,
 Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff..039b803d50 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2979,6 +2979,9 @@ F:	package/frotz/
 F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
+N:	Thomas Perale <thomas.perale@mind.be>
+F:	package/go/
+
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/beaglev/
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
