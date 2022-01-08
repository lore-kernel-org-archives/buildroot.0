Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243C9C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D02C860804;
	Sat,  8 Jan 2022 17:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EcUJ-YNrx80v; Sat,  8 Jan 2022 17:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 415A7607F2;
	Sat,  8 Jan 2022 17:35:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FBC81BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 094974011F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7s7KKv5_THm for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:35:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02E72400BA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:35:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so2656673wme.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 09:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gRBG1CjgalXrieguPxVT+j40n8xxKYZAp/Qd/8mIoH4=;
 b=ld9qNbtKuTlwF6s7dr0eL7JcawMATMZD3A+WKbj9v5VZ+9G5l/Tp13R1P6El+57b9Q
 GsKESpzos5OgMvLwONReGW4hw772QyRGFI+kmqDhFJ1LcvVeZeNI7B471QatCyvj0qor
 GjBdllNi8j8SL5t+KoBvflFxEzO4V0J7QJnGHUhGzE7ipDJaSYz3D6qYdUCUusyrP0Cy
 PGRopJDtlVgVAjBXJ7c74RM0x7JeZHfZVM6kb9zYwyZmn9ZgeBcOpMsEnl1uXIZOteP1
 bNOe51g9GpWq+6Cc0nLh85hdyThntXyY2agwW44CQUuv9KNyh5aMIrpeG4xSuDn4bRsa
 BSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gRBG1CjgalXrieguPxVT+j40n8xxKYZAp/Qd/8mIoH4=;
 b=sR+NtAHv8cS2gHH3Fnu/ET1lzPCNIWATW0J1n4stvKC4u/ZyHQvYizrkGuo1kVBx2m
 feXGCkudfiJcj7xCXiRXpseseI/3tqMJ58kI5EZj3fXJJy8X2PSGyuXOyMwKaKHofs/V
 /bIjwvMIot8t2GBKxRPnVjKnIp/8qHjBT64Nv6g7nDS4ZX4eAiDPkOtmAYzyMYA58PkJ
 mrkajeF0ZPieskzcY3ng362o1HdnwPBJUpDdTM9qrix+X2iRHMpJH0g44LwMNzc0McXN
 S8gdI4JLHyvBgXpSfsueyvTIWyU3ePuhPbdGzOOx6MOhB38pl87V9qZnz7v4eX0BfzvR
 zzYQ==
X-Gm-Message-State: AOAM533hacDwY8nGZEKIxyLoYcY2cguaIwteH2ndg9kZjcgHHbPr50vc
 efmRRReuhH9w8VjoMrY99djfu3v1Wk8=
X-Google-Smtp-Source: ABdhPJwYVzVUIFo2SRSt3Z25idXXbUozh/qhu/Y/Xp0gwjDfWmc/6tX/mEY9S/VE1xoM0/qCPuyswQ==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr15129014wmh.140.1641663310027; 
 Sat, 08 Jan 2022 09:35:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id n7sm1957726wms.46.2022.01.08.09.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 09:35:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 18:34:03 +0100
Message-Id: <20220108173403.2819830-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/hackrf: add a comma between licenses
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hackrf/hackrf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index 391bddcdb0..d80f87e6b9 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -7,7 +7,7 @@
 HACKRF_VERSION = 2018.01.1
 HACKRF_SITE = https://github.com/mossmann/hackrf/releases/download/v$(HACKRF_VERSION)
 HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
-HACKRF_LICENSE = GPL-2.0+ BSD-3-Clause
+HACKRF_LICENSE = GPL-2.0+, BSD-3-Clause
 HACKRF_LICENSE_FILES = COPYING
 HACKRF_DEPENDENCIES = fftw-single libusb
 HACKRF_SUBDIR = host
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
