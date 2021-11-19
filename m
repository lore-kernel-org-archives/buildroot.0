Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1801C433F5
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:57:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 505FA610D0
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 505FA610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9BC04036F;
	Fri, 19 Nov 2021 16:57:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-FKtODhR4Dx; Fri, 19 Nov 2021 16:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 033D5400F3;
	Fri, 19 Nov 2021 16:57:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 917A61BF21A
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D60661BEB
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6MPCe-3BXJMJ for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 16:57:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 418D460699
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 16:57:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 137so5581450wma.1
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 08:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nqnBj4UABg9YTqquG9pSvxfhX4bzdIrmbQK/iJ/EuZU=;
 b=ZAj5QVUORS3npDVp1rNaPYDrM62cduNfa2FZx5lVXIHwmnGRdjc25fsLKe1/1eL4zJ
 N20mp3qIWWBw2+RU4grF3E2GkMSNb11yIyFG6giYCOL+ABcQ9EO97QA6GTMBCPFZauLM
 GEpyoSsqbkvxyibGzvXr1L0iBEXlWBIOruJTCsOklPaB0ngdtgaN+8l25YO1cmL+Q+8Z
 D6MUyvbCOyuHrK0WKc/pKoneFrBJM0mseS+d+iBTCLNSRYQgKrbLz/IktGHlFZkO54go
 BaDpxbBTr/CmZcoxvQHms3PDaaYWmlTRZmKXCsYk9npB1r1uMFxPgbe3v/FOVHOizX1P
 7hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nqnBj4UABg9YTqquG9pSvxfhX4bzdIrmbQK/iJ/EuZU=;
 b=7fkE/MSml2aKm3t9uHdgNVByFc64k525Oh/y9uX45cHUDoo58BoGr91+wvWQJ//m6x
 R7gQRSpBKxDuCG/9S6BQL+Q/tjU/bATLdB5S4acLdpmdeFtfiRTieSY6ipGZ2P76BmRk
 9GrYTAuQSVUeumGYZSiEDlSV4/E6Zp1A2FMDFdASAbqluL7/qWj/rZdWS9afcRtI/rL7
 SC/J8aDSwXNH3PFkQhiBa+8SBFtGHFxgXeizjj/yxqYO5HpsGRM+PKwVBSdT0XFnzOYV
 SpTgMV7YXXe3511jrlpTKRKfSF7mYqnjKFQO6VXtrEqA1EJLb+sD3iMpx2uAyaY1NxOk
 Sibw==
X-Gm-Message-State: AOAM5337cpajbMulxYbK+FXsOEFfuDzhfYXE27QT7uBR+VMPLfSlnfkO
 Jvgktjyaogy9yHal4V4OyUxLSCVQxyU=
X-Google-Smtp-Source: ABdhPJwszMUtHCXB7S7/CRRHX7IMniQYUk+pG4LKD4WKs39nNf9GmBtZVX5STw/kMMWc/BN9DaC52A==
X-Received: by 2002:a05:600c:3c91:: with SMTP id
 bg17mr1386633wmb.80.1637341034240; 
 Fri, 19 Nov 2021 08:57:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id j17sm283530wmq.41.2021.11.19.08.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:57:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 17:54:57 +0100
Message-Id: <20211119165458.2410686-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] Revert "package/log4cxx: select boost
 chrono and date-time with gcc < 7"
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 3c2245cb65741c965f4bb87d35ac3c64f250a1ae to move
these selects on boost side as the build failure was raised with gcc >=
7.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cxx/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 27a5f06988..6f1956f829 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -12,8 +12,6 @@ config BR2_PACKAGE_LOG4CXX
 	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_BOOST if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	select BR2_PACKAGE_BOOST_CHRONO if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	select BR2_PACKAGE_BOOST_DATE_TIME if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	help
 	  Apache log4cxx is a logging framework for C++ patterned
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
