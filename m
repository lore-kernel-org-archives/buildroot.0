Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C011AC61D97
	for <buildroot@archiver.kernel.org>; Wed, 22 Nov 2023 01:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA99408D6;
	Wed, 22 Nov 2023 01:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CA99408D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Rm96MKeIItX; Wed, 22 Nov 2023 01:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B8D408C9;
	Wed, 22 Nov 2023 01:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81B8D408C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A62E41BF3B0
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7687D408C9
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7687D408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jm4MZgQ1OIph for <buildroot@lists.busybox.net>;
 Wed, 22 Nov 2023 01:47:35 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D21B40425
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 01:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D21B40425
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1cf63ca9b1bso20496415ad.3
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 17:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700617653; x=1701222453;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UC5du6BjgVNIg9u0/wck7c2dM0u1V+40epklchg2g1Y=;
 b=GgubABxqGHGFk93fZdVQ1wlUlrqXVF/+evpkz6kx8P3wLmU/FFQAqoowsxXPdoHfty
 qse0IS8dQlqfD3yDPS2bwdiB+EYtv0hqU1pDCLqh0z83Hs3a2FWfvGUdXEQUUyDKOzgG
 BmruB2AFsudWmdyhWu2r/eGOQuGu+TDyOEkd0qpO1/sLS6Q9ktZDxXiavc6zeL0b4G4l
 XNGVJI9DlCXwXssVKewL0e6AsHeRvgfaYZg6d/V6M1QBQCAG0h4QBiKFQ7LVaALWRpnR
 zoid/JfbLlNJtowMbvLLEj8HtnGTR1nuVCWbBr+NOrrfANWEQP6NNmcBYQsWsAMiN5tJ
 vqRg==
X-Gm-Message-State: AOJu0Yxm9TYzNyPdUIg39gPcGlNKjqS0uXd/EbOTqMHyAqufApIkoN+8
 zGZ/dtzI9GW5gIY/Yexe74mBB4Elf1UAPCksZQsp9g==
X-Google-Smtp-Source: AGHT+IGacszjzNx9ZIrX13LZbjq1RiudRqdaKZC+bDViwy8ccs2rrjkt153OWkPoZcwEM4TKDHY3dQ==
X-Received: by 2002:a17:902:d48f:b0:1cc:449b:68a8 with SMTP id
 c15-20020a170902d48f00b001cc449b68a8mr931088plg.46.1700617653496; 
 Tue, 21 Nov 2023 17:47:33 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902d90500b001bc5dc0cd75sm8549565plz.180.2023.11.21.17.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 17:47:33 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 18:47:29 -0700
Message-ID: <20231122014730.2795697-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700617653; x=1701222453;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UC5du6BjgVNIg9u0/wck7c2dM0u1V+40epklchg2g1Y=;
 b=ZwZIEp9GYd9rQ89Ny1inNf5DZD4aW8EcXdzcbIvGIQ5HYQSbOni6bzM5osfVTDbpam
 lytNS/gGR8u2VvHlxoWAWgNFq2PpoTTrTPy3U1ZU0B7lbY6eAhSWOL3qCmB6Q30v+ZpN
 Au65B70hDdBscHh8Xf7er8e5cXKdCYyqSF/Ek=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZwZIEp9G
Subject: [Buildroot] [PATCH/next 1/2] package/Config.in: move flutter-gallery
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a Graphic applications not a Graphic library

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..c971127759 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
+	source "package/flutter-gallery/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
@@ -345,7 +346,6 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
-	source "package/flutter-gallery/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
