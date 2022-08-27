Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DA2ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 05:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A635404D5;
	Sat, 27 Aug 2022 05:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A635404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54OSiezU7i3R; Sat, 27 Aug 2022 05:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96E1340241;
	Sat, 27 Aug 2022 05:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96E1340241
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 660521BF316
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 05:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E95C40241
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 05:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E95C40241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prWJQO2jzYIV for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 05:08:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC8AE40017
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC8AE40017
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 05:08:59 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id f24so512162plr.1
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 22:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=PwiEmolI5Vjkc/NOdWOi3BcHu3yM0ZYEs2FUUyy3sHI=;
 b=NdGFBvIpbEM279lle1iDGnbOzUVngVI0jF6Ay8TDLirKweq7Hr20Juy8524ouJ3uoR
 i4Llfdgmw8+EOLkG+mx69r/DYlCwucUgbZA1/0iexnr5IPJefImnA73B7PlATOaiC3Ml
 HFHirHuKMRkHUyar0DO3UNvaCrtJaHk1xSiO5OLALjEVpq1LORy5izm5EWG0Gc24U2Tc
 Zj/+VniIRn6Aa75tH5gf6SaP/f66cO8bthmIECTlC39i6iRo8ahXhVzFgC4YpCZLyr2F
 hSKZY2bUYJWQ2UMDks8tJesWdxzZo4O9EKZYETjCK0yJzN2sPwqh8S2sNM0zRoJfKp7g
 P2Qw==
X-Gm-Message-State: ACgBeo09GHyGPf0LRHZQTZCWtrVDMRZokbNkekqQSJECX1ZV0Ftfbk/n
 4HSP9V0vIo31fuKKFXDyYe3md/qBDiVsXg==
X-Google-Smtp-Source: AA6agR5ghgARwoWwsu9clmWbuZT/VhcHEoz7J75wUQijZwKWCznj2Sxpy6Mg7C+UW4LDfJFrvHfQuA==
X-Received: by 2002:a17:90b:3b90:b0:1fb:3d53:639 with SMTP id
 pc16-20020a17090b3b9000b001fb3d530639mr7894935pjb.156.1661576938728; 
 Fri, 26 Aug 2022 22:08:58 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 x22-20020a1709027c1600b0016f1319d2a7sm2496705pll.297.2022.08.26.22.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 22:08:57 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 22:08:55 -0700
Message-Id: <20220827050855.661917-1-christian@paral.in>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] rtl8812au-aircrack-ng: bump to latest
 rev e7a4a3
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

Fixes build against kernel 5.19.x.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index 0e61e95780..bc3a926314 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ad30e61bc3100861b995617672193ab027ec51061dfe1fea9f8625b99cd27995  rtl8812au-aircrack-ng-4ab079f7cb172740c7abc8cbd6e6383bef0f65dc.tar.gz
+sha256  eed4888da9cfdc0f83ad3335beaf73af33ce0796b0a2637aeec102d47e1eb8f0  rtl8812au-aircrack-ng-e7a4a390ccbdd768411e1b2a8922c47837f76b47.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 111fd520a4..60d81469c2 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = 4ab079f7cb172740c7abc8cbd6e6383bef0f65dc
+RTL8812AU_AIRCRACK_NG_VERSION = e7a4a390ccbdd768411e1b2a8922c47837f76b47
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
