Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FFEE7C4C1
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29DF261421;
	Wed,  4 Oct 2023 14:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29DF261421
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnYiy-REsbwd; Wed,  4 Oct 2023 14:23:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6893561424;
	Wed,  4 Oct 2023 14:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6893561424
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4D2A1BF47F
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F37461418
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F37461418
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txJrLnLaLOPD for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 14:23:22 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4955960B1C
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 14:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4955960B1C
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9b98a699f45so16773466b.3
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 07:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696429400; x=1697034200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7gVo9U24z28RJQSja+zKvy6LUQaAMFxiy6OdgFDVe1Y=;
 b=BCh+rPIHem5YG0GHmS8mu8z4KduxYU0unthEZd6YNfI0GlwX76ct/LwCan/I+ZOPPY
 XiuF5INihxdmmZ43pdQ+RLTvx2NlLV+YHz/4XWrWC9GX4pdLBtfJRfq3HofKjyK3l0xE
 Lbp53XnHwQRsIIUREtVnwCZ++rW2veAUXLMPDeGWet9/jIJxaAx97F+rxVn3plvOK93g
 2vCwZy5nih6YA4bB0nQdZvc4Zo6IICBLWt7j1CwxRdbM8e02JhJZ03RRiPVfVHrjEws7
 V43E0fjYUvKseKh/NsJ1wCt5/WVdB5iQHhEo6QBOLfmKxGQMIZT3PQ08kV3YqTnoEz7i
 C4NA==
X-Gm-Message-State: AOJu0YzAhELUnBdTnjh6daETP71bk2qWXLF1MEBXNp7OuLIs7Lc51A6A
 UivAgS+Suv4R5DXvJ/tTgk4FoOj8IfGUb9WK/9ZumQ==
X-Google-Smtp-Source: AGHT+IFS41X3rLiIqVXqZlP7E9viReg6I0VoXvy+cS1vzt937TWaBzNy27RWegKX4Ly5wCIjDhX3JA==
X-Received: by 2002:a17:907:75fb:b0:9ae:7870:1533 with SMTP id
 jz27-20020a17090775fb00b009ae78701533mr2061771ejc.64.1696429399933; 
 Wed, 04 Oct 2023 07:23:19 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 dv7-20020a170906b80700b009a5f7fb51dcsm2851805ejb.42.2023.10.04.07.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 07:23:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 16:22:57 +0200
Message-ID: <20231004142303.203520-2-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004142303.203520-1-thomas.perale@essensium.com>
References: <20231004142303.203520-1-thomas.perale@essensium.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696429400; x=1697034200; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7gVo9U24z28RJQSja+zKvy6LUQaAMFxiy6OdgFDVe1Y=;
 b=J+mHfEt+5ZVJTG8AvSWxlFvkseLxdTDUfkGP2ikWI3W5eCXYbh+uCAS2LgwoGMrdOa
 2y77VSlP5u5Pe/x8BFhC4YuO17gPuDtrtxfRHN++scPjpRY/zHNV1IJzXBnKhObgFvGp
 uFZil0omlAQOEbVbCCWKpk6LgQMulpTYS2qJ6GkhqRhKdYb1A0BeSBtNfxlyQ9wDLjru
 W/4yDGl043zZcwbsalSqHSdm1l3Q1u24MNAvjKKolcSgoMo3ToVs7y0AQ0aROFTfC5af
 3BjjfXcr6iyrEVJdlAXNT7JP/WNGnPokmLJuW/CRWLGpu25XPl7nNE5yhpzrHf/HNECV
 F06w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=J+mHfEt+
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Geoff Levand <geoff@infradead.org>, Fabio Estevam <festevam@gmail.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Perale <thomas.perale@mind.be>

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c45e7315da..4681b2a21f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2898,6 +2898,9 @@ F:	package/frotz/
 F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
+N:	Thomas Perale <thomas.perale@mind.be>
+F:	package/go/
+
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/beaglev/
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
