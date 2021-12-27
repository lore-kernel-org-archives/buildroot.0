Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA97C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B69140270;
	Mon, 27 Dec 2021 21:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5p4Rbp-ZfIy; Mon, 27 Dec 2021 21:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E55B401FE;
	Mon, 27 Dec 2021 21:46:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83F641BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D72560803
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oIa01FqJfLcU for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:46:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3A89607DE
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:46:47 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id s1so34660622wrg.1
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 13:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=16T2R4L1kwJr+asdaO229E6motYO3PTolCmVf+eSp9M=;
 b=eBcb8/Zsaa9W1Pxiosko+s7pVWYT2VdK0RhZs5wTGZ3qsryNY5CutSFAaw5wlGu7y9
 B0TIFYqczIRhZnZO9iPj2aduV7pSqLgSSZM8rJ10HFQjDevNes8Z7bWTpc0TB+S8Z6W8
 PVJTIpoxDaljMY7BClYJlkOpBQhECbxmlatl6tqFd9ukMxvh//7qKbZZpE2T5K40DLNX
 AvuAY0e2WUlVRyyBvuqi6CG0vXRVR2CDj26LZjmDftPLKNdmY8kL5s3XUFa6NMofvOAp
 qjiP2uw8SOjZwC6iTtL/2v7MFqBmbUnWj8p5iVNdSjjvLDV290ZUjuZucgH2YJWCfGIA
 tw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=16T2R4L1kwJr+asdaO229E6motYO3PTolCmVf+eSp9M=;
 b=NRqYuTNEXZ83kasVJfD1ykCjeW6cevp3z8SEy02c04+3SJxaaUdJ4LM4dkzKXBIAKU
 wYnFJ33ErIFtP4Aj5jbSEVxCW0JZZCs3kH1tXk021XQdElN+OquMUiM1HQDioSJdyB5i
 SE5/EtJvUU9dSG9Jz/dNfrqqTsQo00ik9MDmPWqO0tBBNjxpJuee4OH3oF6W9WlS0uZh
 GHpjkDGhz2C/UNqwudN2nloM0/V/VX77bWO2XnmtT/OPUVYhahfCEZYotyG26KlobaPA
 d+OlD9sN8tRxRmNw/xkN7KNGaHu0eZrxi4t4s5GAfRL5YwwrRt2srCiUzEuN+G/3kopJ
 vBwA==
X-Gm-Message-State: AOAM5306Nuzlf7+JMjAz5Wk9E47aiPX4tsQ4jZkpYedyypBsI4J+4TUM
 I1xPIb9IW7pQwMoVTQcv7eoKRJshpTVh9A==
X-Google-Smtp-Source: ABdhPJyPf2x7EnwdXlWP5TxOL41+DR1BJN+npQIDPdIpNhh7BpSxPiBo42g+AhOR4A5U/qqavETA3Q==
X-Received: by 2002:a5d:53c5:: with SMTP id a5mr13984625wrw.328.1640641605652; 
 Mon, 27 Dec 2021 13:46:45 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id i8sm6235363wmq.36.2021.12.27.13.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 13:46:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 22:46:04 +0100
Message-Id: <20211227214604.2903431-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/graphicsmagick: bump to version
 1.3.37
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of Copryright.txt (update in year)

http://www.graphicsmagick.org/NEWS.html#december-2021

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/graphicsmagick/graphicsmagick.hash | 4 ++--
 package/graphicsmagick/graphicsmagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
index 6ad5de9d65..cf6d224216 100644
--- a/package/graphicsmagick/graphicsmagick.hash
+++ b/package/graphicsmagick/graphicsmagick.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5d5b3fde759cdfc307aaf21df9ebd8c752e3f088bb051dd5df8aac7ba7338f46  GraphicsMagick-1.3.36.tar.xz
-sha256  aed5bd8e28cbce601cbe2ca2267b663ccd63152965f2d5caea1311bf0039c325  Copyright.txt
+sha256  90dc22f1a7bd240e4c9065a940962bf13da43c99bcc36cb111cc3c1a0d7477d4  GraphicsMagick-1.3.37.tar.xz
+sha256  8a4d960c5a3e453ee21e459e1794c7a0c85559825d3363a8d3b510b3344fdad4  Copyright.txt
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 2a22936fcc..38743487eb 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHICSMAGICK_VERSION = 1.3.36
+GRAPHICSMAGICK_VERSION = 1.3.37
 GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
 GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
 GRAPHICSMAGICK_LICENSE = MIT
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
