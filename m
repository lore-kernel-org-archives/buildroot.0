Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF88C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 13:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 245524193B;
	Sun, 18 Sep 2022 13:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 245524193B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pr3QAybPLxSm; Sun, 18 Sep 2022 13:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CAD141935;
	Sun, 18 Sep 2022 13:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CAD141935
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5E61BF426
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74CE74047C
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74CE74047C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEAyJJYnTGJp for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 13:22:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26A0B40111
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26A0B40111
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 13:22:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b5so43108764wrr.5
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 06:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=O944+ucvi7MWVD5AWevIqHymaVSp0cB16tnZNDuAGwM=;
 b=XQieUP14lQbHlaqgn381LruSkwzR07L642MYe11wVnUsoIqqw+EsZPPUbNJw/n/tQl
 dU/Em3/LC5aD9uqF/JAITIXQpretj+XHSPTRF4HO/YZB69P2580x47TvOqh9STdcaaj8
 UdSOHk2NEZtTHSaB3flPx6FxUSHL//Ff7pwr4BZQWCezcMEE+6v6mpQ48ByBsGijAsI6
 5D0Knv2yNuBdVs/KNIT2kXjjmRPNUXesRdH0Payqnziu68OrvLa1L3Y3XpTif7iRF4FZ
 g6Ti98Xuq0ogFlrJGsgifG28TaXgUMuyU3Dy2Oaz16fwWMhteHn3qmCAdHkG32NNLyaZ
 1C+g==
X-Gm-Message-State: ACrzQf2Y90Ug8C7EUnsjcJClT1M+VCR4Vi7Ebm2VpHsMKrK61I3iwxsi
 VjVV+8QQwKYeMrgfL6GVmlCKiDD2xVg=
X-Google-Smtp-Source: AMsMyM5E1H2vxDW5QBs9Hbgmtdocv6JYjjy/1IK1nWOalTBnT8CJK9nQ9thxd2jYtDsBFAVgmPWoMg==
X-Received: by 2002:a5d:6e10:0:b0:226:ed14:e340 with SMTP id
 h16-20020a5d6e10000000b00226ed14e340mr7880574wrz.122.1663507331823; 
 Sun, 18 Sep 2022 06:22:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c4f8d00b003a5537bb2besm10211074wmq.25.2022.09.18.06.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 06:22:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 15:22:09 +0200
Message-Id: <20220918132209.346221-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=O944+ucvi7MWVD5AWevIqHymaVSp0cB16tnZNDuAGwM=;
 b=DiPbgSyJeGc1cvNzcmNzRU0coffrctQgjUzvBJhJLp5oiVI9KmxpgieonNDpLslwpd
 vMqU0cb+sZC+V+m5YeXf9i9XaJF/zBDPw12GE1E6C2zORK/d1K+H7ErJz1uMKrjeNXKX
 6oORnAygIdxmhVw2ieWYTz5RNdR1wqz0LzQlVDM5v/WDOajdjZ6oPFfo3ZnXBOfobo+r
 ok7lm52Y48sW51HZfj81egP20Pd8a3G14BBO8si1ZpMnRlU9M9raV4FoF8KP1aFfnoXF
 hBTRqiF0B4pvTaY+qYZ+COS4xLHfnU5UHlvjkuKQ2xMdEqfEmMkLYP91Jt11t/TsvJwh
 CR0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DiPbgSyJ
Subject: [Buildroot] [PATCH 1/1] package/opencv4: bump to version 4.6.0
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

https://github.com/opencv/opencv/wiki/ChangeLog#version460

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv4/opencv4.hash | 2 +-
 package/opencv4/opencv4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index 6d43138be8..419b420917 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a1cfdcf6619387ca9e232687504da996aaa9f7b5689986b8331ec02cb61d28ad  opencv4-4.5.5.tar.gz
+sha256  1ec1cba65f9f20fe5a41fda1586e01c70ea0c9a6d7b67c9e13edf0cfe2239277  opencv4-4.6.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 84e0487dc4..ef15c6d911 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV4_VERSION = 4.5.5
+OPENCV4_VERSION = 4.6.0
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
