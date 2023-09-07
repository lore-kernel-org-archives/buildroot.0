Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD9FEE14DB
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 10:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 450B760E7C;
	Thu,  7 Sep 2023 10:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 450B760E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-2TZTb5XCkV; Thu,  7 Sep 2023 10:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5D1F60E1A;
	Thu,  7 Sep 2023 10:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5D1F60E1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1173B1BF41A
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 10:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC92C400ED
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 10:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC92C400ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbyRIxWT0Qxl for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 10:45:48 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D15FB400B5
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 10:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D15FB400B5
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c364fb8a4cso7160205ad.1
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 03:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694083548; x=1694688348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z+QBhPw1xgw6YMLFJLq8N9QlyI6tgJtuMBRSutbtuhs=;
 b=O4AaPRdcGNcgWq9Mt2IPQ0dWdel9cHFnxXPGkQzS/TxAmefNEg29Sta7UIOJCSVloY
 PvS75rsb8lPSXt9Fm3cXNQUCcnbzl1MawULod2M/mSi9iKSPecwMoLnyf3clea7zl1fa
 FlYynd4bvIHnTjcBJsXPEEoroxxMw0iLsU3n7w/fiGEUsWEaau74EotStHX5CwKAxjG+
 IAB1pEcXJ99pPb4as1eQP6BkpnvLtNJ5/b6A8+YanHSVQs9E1/4YMEl85mGNRwvBOSx6
 oi6uJFqdWoJxdzzjWmjMCgxjYDMclnb4QSISodGPPqCgIvRJYlghY6atO/MCl6C0VIaf
 i25w==
X-Gm-Message-State: AOJu0Yz20MwkV/FDwRvi5H1iPVvJchfdB50GHqfIqaZlDKzSUqPcEdDf
 Ol3UA5NQPIU4xV9NVmBFY/IlAfwAfA9WAqVmOwTrcoeF
X-Google-Smtp-Source: AGHT+IGQfd1XIjGeQcOA1Uzshc7h7vAG68EAMImJeZ6VBq6v98HwnRu57kwyhMHYXrTEuQLgeS8SNQ==
X-Received: by 2002:a17:902:d707:b0:1bd:bbc3:c87b with SMTP id
 w7-20020a170902d70700b001bdbbc3c87bmr15631539ply.41.1694083547924; 
 Thu, 07 Sep 2023 03:45:47 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 o4-20020a170902bcc400b001b7ffca7dbcsm12447205pls.148.2023.09.07.03.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 03:45:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  7 Sep 2023 03:45:45 -0700
Message-ID: <20230907104545.1385064-1-christian@aperture.us>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1694083548; x=1694688348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z+QBhPw1xgw6YMLFJLq8N9QlyI6tgJtuMBRSutbtuhs=;
 b=bGBz06vbX5+WNMxT6O+tM6LZo2Hl37kDQ2KfHw0ehcH4rQLQIK2kylAVI3Y1jlpAoz
 H3nlq+KRl+J2p5OVOOFnbsR9gBEuj+mwus0Q0t/Ye0CqE0eaeJ+CKbDxd6X61XV/HBv1
 91jAuWH7jfxZYPSSlbIo9JnLuKO+ZOTZf324bOhgqJI5MROLT7RZMfuzT+nMqciqb45M
 ladmIEgPsI6S/u3dOt28THrLjnJPjDhyarq4UhE4glOyWVkGT178I7wSObwu4lYMe2rk
 MY/3CX4FN3H/whuQwzzDTbrqtgz/99kpc8jTPa59s6R790E+p7b/x2HKS/HZBQ44KYOr
 FUcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=bGBz06vb
Subject: [Buildroot] [PATCH v1 1/1] package/conmon: bump version to 2.1.8
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug fixes.

https://github.com/containers/conmon/releases/tag/v2.1.8

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/conmon/conmon.hash | 2 +-
 package/conmon/conmon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/conmon/conmon.hash b/package/conmon/conmon.hash
index 82d1d14ba3..f2e89b8a92 100644
--- a/package/conmon/conmon.hash
+++ b/package/conmon/conmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7d0f9a2f7cb8a76c51990128ac837aaf0cc89950b6ef9972e94417aa9cf901fe  conmon-2.1.7.tar.gz
+sha256  e72c090210a03ca3b43a0fad53f15bca90bbee65105c412468009cf3a5988325  conmon-2.1.8.tar.gz
 sha256  9c9d771d4004725237a31ada889fe06c85a24fd0a29e41825181ab4cde54f016  LICENSE
diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index f3567a4305..29deb2af47 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONMON_VERSION = 2.1.7
+CONMON_VERSION = 2.1.8
 CONMON_SITE = $(call github,containers,conmon,v$(CONMON_VERSION))
 CONMON_LICENSE = Apache-2.0
 CONMON_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
