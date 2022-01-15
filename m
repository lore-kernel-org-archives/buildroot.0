Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6021FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 104D6828F2;
	Sat, 15 Jan 2022 11:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28orX9YrHRhr; Sat, 15 Jan 2022 11:25:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77E02828BA;
	Sat, 15 Jan 2022 11:25:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE9A31BF2E4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCBB060A8F
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9mdDrhnd1Ea for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:25:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 753CB607D1
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:25:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so10621324wmf.3
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 03:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DC3TsfzXqE7Coj2fKblXeySVsvzEjkNxWwRh57hnhZA=;
 b=VEsIODTshfUOdOXXzC/MJtuWULpYSFk9nwafCFolrt4zjYdAeSEenx9RYHd0Ow3sEr
 ueHpW3RfHeoouaCKBm3FTZyFaggFA09dPCDWGfqtVsotihEApPph0RZqfCDuy2Cj1uW6
 QfRYXfksvf0RnCqiMGA87BwuADKrmEvdgzfCzM+pnWfWoSfwOBVdjOSHUFo4j1wCigoK
 ZsKGTjFUZ8zRsfZ9aXAzjHaERe4oEBwKG3xPUXthkjLOFqxD9XCl4IoVF3szcWs2sTl4
 L9FnrQBXrXLNdc2lAzrKyov7WoYkltuThf1xmbhISpobv0Iakil6zYUHOcn+p6BdFnhc
 XX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DC3TsfzXqE7Coj2fKblXeySVsvzEjkNxWwRh57hnhZA=;
 b=MqY56K5y+nRw0bSGNJBB1KydvZtPKgbEIAmCVP+r2zxCEbgMBHaDIvuzpRVcxw+K4C
 JAyyeGLdFvLVDKos1D8GmKHJHfiidSgZxTZD9yykgcK/milZJns61FjcWXcJy/vGETIs
 062FHyPz/HE1vZMKCsXjjNJ2L5sTCa7wplWS9KfugS//7A4l8felXVEdNWtxmClPEkRZ
 imn8NyalHnHJ1CEd6/sNJriQp85bWw1yqiP0wkL8dxdEJjvRC1IqoJfFOYFqy5O4ZRwt
 qY0ZFWq5Aio6piNhmOlnHxq1KP0GGJBBk3cwNd80pjgsuw1pUbPCQt7/+kCuoMm1hQkM
 GaJQ==
X-Gm-Message-State: AOAM532WwqKaLZ4WcZYYrucRd6WAIak3nyyQCDnsGA12vb5qPE1vxh+C
 CZSAE+Du9NVlxSy47hSbiSiDZ6/4RCU=
X-Google-Smtp-Source: ABdhPJxZiOcGilPtSC/LtFb2U4ChaV5OfnIenSlAPcqLg2cOB9pfjjTTPRp41TclddbMucEPJhGAaQ==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr4256926wrx.240.1642245926652; 
 Sat, 15 Jan 2022 03:25:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id s8sm9506660wra.9.2022.01.15.03.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 03:25:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 12:24:03 +0100
Message-Id: <20220115112403.1910619-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bento4: add BENTO4_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:axiosys:bento4 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaxiosys%3Abento4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bento4/bento4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bento4/bento4.mk b/package/bento4/bento4.mk
index 6e17d1d53b..89ff2e4b85 100644
--- a/package/bento4/bento4.mk
+++ b/package/bento4/bento4.mk
@@ -9,6 +9,7 @@ BENTO4_SITE = $(call github,axiomatic-systems,Bento4,v$(BENTO4_VERSION))
 BENTO4_INSTALL_STAGING = YES
 BENTO4_LICENSE = GPL-2.0+
 BENTO4_LICENSE_FILES = Documents/LICENSE.txt
+BENTO4_CPE_ID_VENDOR = axiosys
 
 # Source/C++/Core/Ap4Config.h
 ifeq ($(BR2_ENDIAN),"BIG")
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
