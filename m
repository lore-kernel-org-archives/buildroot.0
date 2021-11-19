Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89328C433F5
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:58:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1319B611EF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1319B611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 925B340554;
	Fri, 19 Nov 2021 17:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0CIEoGXTP7LH; Fri, 19 Nov 2021 17:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B310D40105;
	Fri, 19 Nov 2021 17:58:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFD5B1BF37C
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACF21829B1
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id McJ34-ClBrMA for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 17:58:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC1688272D
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 17:58:14 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i5so19560278wrb.2
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 09:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=467TG0F23dmxOPpcxIoEia+1KBM1HJ8Z+MktLcyfPzk=;
 b=TW5tR5Ge/gLAR+pyaAKraU4Ht8ITmXjVV+Px7jZX6KQlQoy7QNJ6a6XPBmRalhVTY9
 AveAyg/gT1VjcQtx5OAOm+EHUfgHrFAYzfhd/jDPuikswVae4WvoKn2bEmrxj3/4ECGj
 WECD9Y4yIH/U6k1bB3HQaL5Ojr1h5VEZH38mAXn//0MgTbF3FtkEqjIruK6VahllIYUa
 7TQmD1HZnFffKAKvgrWU9MbbSzkr3OTEeAaDo7hBgDeAQwd78ZojuTSejdWb19ILGpDW
 THzscYhfAlYjlFQ8quJLbgivP9CEuYf/n9pqb7XZWMC8kq+D9lpD1SIXf93sMYcJY/RA
 jGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=467TG0F23dmxOPpcxIoEia+1KBM1HJ8Z+MktLcyfPzk=;
 b=yNPmcP0m9GdsFOC5h8O1WgG2LYYYJ0ZDePly+vG6o5LAd/phBTxEM1MX9f8SCZVHbx
 LhVLdAtn29UivZwlIRFKCrsCIiX5PW8jLgwfb44HWIMi/FirRCbzNPi7bTYCBwQd7Awy
 UICyiTNR/3sZ1ahVDBXiLrNQWcZ0wKkGrsoJGFDZDIUb6OVBl/A3zmyZy18EMvGbcNFJ
 B7dKGWrDCdfJlF7blKkhiYf9hVUa55U32frtUPgB6mWuhWCluU94Vm6eljQiyDrkimiu
 sQYF/tbkVYl+T+xY2oKquCD8/mLj462RjJHJaXRui3qjT/omFa6/yOW4ojIXnyeQ6DYa
 M9ow==
X-Gm-Message-State: AOAM530DN6JGCRwif0S0LEzEJKw4k2BS9CguzeoH8oFyEEki2M1pjS8e
 ZhSgLtt3M5n/iicb2i3Ps2bzBMSvaF0=
X-Google-Smtp-Source: ABdhPJz4Aar7TVs8oJJslSrwEGzftQlRcVxL7v814z92ZWt1agmc9nYYqKeTVAM5BvAkzGGs8smLgg==
X-Received: by 2002:a5d:628f:: with SMTP id k15mr9806069wru.363.1637344692831; 
 Fri, 19 Nov 2021 09:58:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id k37sm404225wms.21.2021.11.19.09.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 09:58:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 18:55:52 +0100
Message-Id: <20211119175553.2413433-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/2] Revert "package/log4cxx: select boost chrono and date-time
 with gcc < 7"
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
7 (making this commit a "no-op"). Indeed, the build failure is raised
with cmake < 3.21.3, because cmake assumed that boost thread depends on
date-time until
https://github.com/Kitware/CMake/commit/1ad0c5ae53fc0c4f774166337f0e9c93c578cf9b.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Update commuit message to explain that this commit is a no-op and the
   relationship with cmake

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
