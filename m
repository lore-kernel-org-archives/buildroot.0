Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9512CC61DA4
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47E726110E;
	Thu,  2 Feb 2023 13:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47E726110E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2pDPPnD2Le3; Thu,  2 Feb 2023 13:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50D5461008;
	Thu,  2 Feb 2023 13:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50D5461008
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D05E1BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37AD840363
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37AD840363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lp-CF1jrzqwT for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:41:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75A1340120
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75A1340120
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:41:53 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id 5so1845458plo.3
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 05:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aetjhL0JsKupoD4sxm/kHXRJ1sJiRQct/hBpKPanMWE=;
 b=KFN4e9p53k2oeB6/fHUZpjDHrstOgrJUXkLUgZxKtJyvlBewbbNvG7KfUFpx/cJKWu
 5uc09UFIIKXDkkwlUEeCtxlfOYsW4jYlZm1+RE1Wm0he+mkx7YJd7phnMcLLIuPAr4FM
 xt7BkWG/PXzXxJTpRatw6zLydKNBDLuFvFJQRreJgQTGlsJMY0lt9pDNu6d5IndnkfXX
 a9gC76r2dvV/pWX7rItbAleuGYX80QVvputItIo935YamcULHzcFzI2PdFYCal/Eeaj/
 fPotYeVAJM4zMBoqtIA/RQ/SLOUkD4YLXX3TGTRu6L42w2NDR+3etfid/eSb/zjWdLI1
 qyUQ==
X-Gm-Message-State: AO0yUKWy4A4eeTJ5PM/Kiy61sviBx9/NKztTUEyYYw7ZVEICD1q0uF2/
 5YVOXP8Z6DJUsGqLJH0JVB9Bx9cR/7AITg==
X-Google-Smtp-Source: AK7set+MHazXsXapvi8Bs97D9KY23T2HemOA3qVLfJzB1/aUDuEhWqxbgDnjO9q/dKTuokz76aadBQ==
X-Received: by 2002:a17:902:e48d:b0:196:5979:fb0b with SMTP id
 i13-20020a170902e48d00b001965979fb0bmr5686844ple.50.1675345312406; 
 Thu, 02 Feb 2023 05:41:52 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 l16-20020a170903245000b0019896d29197sm5729163pls.46.2023.02.02.05.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:41:51 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 05:41:49 -0800
Message-Id: <20230202134149.1864294-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/docker-compose: security bump
 version to 2.15.1
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

Fix CVE-2022-27664 and CVE-2022-32149 high-risk vulnerability.

Many other bugfixes, enhancements, and improvements.

https://github.com/docker/compose/releases/tag/v2.15.1

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 7a7ab5f110..2c924d5080 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5cbf6cd1dd8ce98c5e2d62ca7f622e96abce444979b8e8852b033213a98e2049  docker-compose-2.14.0.tar.gz
+sha256  346571ca487bf3f4b3dc9caeadc88a645354b0e098fa60f350249ec35ab3f240  docker-compose-2.15.1.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index ef9ee97196..3bced8bb7b 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.14.0
+DOCKER_COMPOSE_VERSION = 2.15.1
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
