Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699CDC4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 23:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9141541505;
	Sat, 17 Dec 2022 23:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9141541505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OM3CgOHWNXq8; Sat, 17 Dec 2022 23:09:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89BCA411C6;
	Sat, 17 Dec 2022 23:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89BCA411C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9D81BF831
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 23:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0318080F48
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 23:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0318080F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuRIRqHCiLib for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 23:09:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D08C180EE1
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D08C180EE1
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 23:09:26 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id b12so3972319pgj.6
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 15:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IYRsAKqrfiopsuh1SBUg8fv2Eqphn9xOamlyu71gN7Y=;
 b=U2+0PixZI5bAzZXHdr7hGGEaa96z8k3ndpZurEbj0y94REyAPeugzAmx2ETahYKaS4
 sH8mA9bLfB1822C1+2sjN798PbMl31fzzswsFbIZx53oriC518gY0fUnJyk3gPIiXSRv
 IPJo8pbZtEYXlhn1w8lHkCeN03917qkBLUVBCM1bEterYzdcMDEf4ukraHWQsWrmo8FF
 4htfo+AVYuB+MaX01pmEPHMRCOEr5ELKOsOFgCYaL8czCKB6tIgGcMXNmOAY5CaRN1q8
 q1fisE+09dgFfAtkMv6iZJlM45i3J7Mb5LO7zn38yJ5nnQZYfFHpW07RhU2qP6OAkBfG
 myIg==
X-Gm-Message-State: ANoB5pmtpzdfp8HC7ZwsmcEdgOp1gBsSMp1la3Ze8tgv9yAsZldHUhmc
 qvs6FXR45p4j4JZO9dr0+TH94J3iJ/A=
X-Google-Smtp-Source: AA0mqf7mKiFYWgNiC1zsnypLdK4/7hOif9py870AiQveT3R+GHkvPSUmGVDnNIOelP4VUqCObAq4qA==
X-Received: by 2002:a05:6a00:2189:b0:56d:59f0:d291 with SMTP id
 h9-20020a056a00218900b0056d59f0d291mr45497406pfi.18.1671318565575; 
 Sat, 17 Dec 2022 15:09:25 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 h12-20020a62830c000000b00577c5915138sm3609210pfe.128.2022.12.17.15.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 15:09:25 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 15:09:21 -0800
Message-Id: <20221217230921.1580107-1-christian@paral.in>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtl8812au-aircrack-ng: bump to
 latest commit 450db7
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build against Linux 6.1.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index bc3a926314..f6779fa60a 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eed4888da9cfdc0f83ad3335beaf73af33ce0796b0a2637aeec102d47e1eb8f0  rtl8812au-aircrack-ng-e7a4a390ccbdd768411e1b2a8922c47837f76b47.tar.gz
+sha256  8db7fc45ea8744a4fd7c1d16fa9486d7646d955e84ed8fd11d93b2293ab5aeff  rtl8812au-aircrack-ng-450db78f7bd23f0c611553eb475fa5b5731d6497.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 45a6ce5729..d145208b5f 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = e7a4a390ccbdd768411e1b2a8922c47837f76b47
+RTL8812AU_AIRCRACK_NG_VERSION = 450db78f7bd23f0c611553eb475fa5b5731d6497
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
