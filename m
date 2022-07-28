Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65D4C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39708405A7;
	Thu, 28 Jul 2022 21:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39708405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKxSk2jLu8QJ; Thu, 28 Jul 2022 21:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59A8B40573;
	Thu, 28 Jul 2022 21:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59A8B40573
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46C7B1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E8C5605B2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E8C5605B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHNJXxY7dlVJ for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:18:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D541605AF
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D541605AF
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:18:03 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id tk8so5226330ejc.7
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 14:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fn5ZyUGRqydnPbdC4LiHwPvIDyf9VKOtWIujQ6ac3FQ=;
 b=HCgxfWBo3oegilJJFGTYrKOc+xr4R0RrMFCAnD/t1woRJ9to69AY7QyfVjg1iyllWy
 7xU5EmVhRRnytTmaN4RomXKDudG68iyEgxvEbWBDwa42j6tKMR7EXzoRORivrFL/nxYc
 84NPJiEyuFXufMn1zdOT64/swrbJV9+Euflr7cqDb8LCKHGP0omrIV5PEzeZnbmUlLlV
 P5tKWUyRtAP54N9TuFcnqOwWyGgz3YnPTyvcmyPZaU1latvGGdrHX4DUVOjACEsIDai4
 H3yTlQCqn5tugmKXaCu9yExuNQyudDAJ5ylPGUx0Ysjfz2TI6GSmD6zN90VlkLJq1Y95
 NkVA==
X-Gm-Message-State: AJIora8CmWTZCzM+ILkcpewVr0pPM6wW849BpfRuuBuOkvlV6Xr0+H1F
 cUBUeYTtP8Lwvq351kEm4jZuSf7SA6OiDQ==
X-Google-Smtp-Source: AGRyM1ukhDTACG44m5fxcMiuSYvv15+k45KMO/8XdtKy7jdhSgNPYvb4vv1Ht3fxHaNqY5BlgsfGOg==
X-Received: by 2002:a17:907:b11:b0:72b:54a5:7d2f with SMTP id
 h17-20020a1709070b1100b0072b54a57d2fmr579324ejl.173.1659043081358; 
 Thu, 28 Jul 2022 14:18:01 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. ([37.162.209.91])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a056402078400b00435651c4a01sm1310166edy.56.2022.07.28.14.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 14:18:01 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 23:17:55 +0200
Message-Id: <20220728211755.148370-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fn5ZyUGRqydnPbdC4LiHwPvIDyf9VKOtWIujQ6ac3FQ=;
 b=lV809UXT1Dt5L++T203k4tJvL4OW7i6gClQ1zQWBpISqmbt4D64llrg4PKA8I5SR5M
 7Hl5ig2YAAqXhcwSh2loz4lXatxd/3rIRF75cV+FrqE39MtrZbwpr6DyBqBQXmFeyJD7
 taZ/CaA3Et9kwbIYWU2MwiQGv06wd6sOHSPdg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lV809UXT
Subject: [Buildroot] [PATCH] package/htpdate: bump to version 1.3.5
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/htpdate/htpdate.hash | 2 +-
 package/htpdate/htpdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index 11e743c569..d5426c6d08 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  744f9200cfd3b008a5516c5eb6da727af532255a329126a7b8f49a5623985642  htpdate-1.3.4.tar.gz
+sha256  a8734d4f1d84d0608d045508608f2d29d8b968da269f83120aaac67709b1bd03  htpdate-1.3.5.tar.gz
 sha256  7989949df09a0489434723c571541604cd3f2e0418c6a6aa9179bfaf8ec807cc  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 35ae25929c..cf47ee5451 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.3.4
+HTPDATE_VERSION = 1.3.5
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
