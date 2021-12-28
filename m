Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E2BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 15:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16AEF81766;
	Tue, 28 Dec 2021 15:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAR-P7v3Ji2X; Tue, 28 Dec 2021 15:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BD4181764;
	Tue, 28 Dec 2021 15:35:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 507881BF2BD
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 15:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F8C560B01
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 15:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WV-8rEcdqZR for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 15:34:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CB6460AF7
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 15:34:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id g132so11866678wmg.2
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 07:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=35mElcja/G2NoiZjI5LlsZQUIyjuKdOrEGjMDotGSLA=;
 b=oqK4YCh5IfDJxQi9d8sn9OJTHlWztSClPDQF/2mJwNQMlCoLQ14fSDITXN1f4jdRmd
 59FrnPuz9RiF2jMMv2sho8CTFBUjxhMQjdO1Q9NtDVvT1AvAucbdpbsK2MFHQrbkRuvL
 6wxVr7tDy3vh9QgnQeHUUiBoxpIqsgL/83kOqV8KnOTRqkMkUEw7qTN3rc8bFtATCBOo
 eehb3PaI2DbWQiXypY9YJCKZzesRxeXCVrB1kuy0OYD4SiFbzE9RDWHqqtRB2qCDql3k
 dU2PIYDsVDnVtUNBVv9/oYkuJ0eQ23tfxREpPq005ZHTPvUAA+FqBShRjPcsDilJ6ymW
 vH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35mElcja/G2NoiZjI5LlsZQUIyjuKdOrEGjMDotGSLA=;
 b=X72oWPOGD6V0E/eDxUO6tnBLOZIk+KuqZ+zIwdvunYQ4F/vLii+EpzbUpmoGlxAjAy
 WxNCoDH+zA7T35f3Amsde+HMTqxUdfFf5iYoI+ezkZ+BDzTjYN4cR2ST/9cAT0sBkvjW
 b+HOjCKT5rnY0PrxkmcR9oypAFHCcbzeYVtnaiplvMBp0qPfD1OGgPRW6Gkb04V5B75/
 1oSBsXkiBYf3oqiVjtpR62Hbs0ym28IoJaUrzIcnUg0Q6pu28ervD9P2ijtYAMHqODFk
 whuDE6E4K/Qe3P+EGyG7wFuAklCcCwln9yM/gdRmifY7FHfpH9r7nfY+0T96xSCs6xUw
 q2vw==
X-Gm-Message-State: AOAM533migwO028Sn1igZme7Hy5b/cuO3RE6hjM5tmvRglqufh9xuk7Q
 ccwkdwOxGhjGJCYVoccwi1pSrRQMoS0ELw==
X-Google-Smtp-Source: ABdhPJyY+qXtt9KCajslV4CgexYlK+0+OFmPgPvqqpc46j0ag0t54wBYG/SBlthqaiz/nfMmN25yQA==
X-Received: by 2002:a05:600c:4e15:: with SMTP id
 b21mr17907614wmq.91.1640705694390; 
 Tue, 28 Dec 2021 07:34:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id p13sm17233573wrr.37.2021.12.28.07.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 07:34:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 16:33:45 +0100
Message-Id: <20211228153345.4087026-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/hiawatha: needs mbedtls3
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

hiawatha needs mbedtls3 since bump to version 11.1 in commit
24e4c888c3d36e3943206ea55894b84344cc8b2e:

/home/giuliobenetti/autobuild/run/instance-3/output-1/build/hiawatha-11.1/src/wigwam.c:39:10: fatal error: mbedtls/psa_util.h: No such file or directory
   39 | #include "mbedtls/psa_util.h"
      |          ^~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/064af90aa95c28781d96d7eca0f14841fce0687a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiawatha/Config.in   | 3 ++-
 package/hiawatha/hiawatha.mk | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 8f1908f6f4..94737bf318 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -32,6 +32,7 @@ if BR2_PACKAGE_HIAWATHA
 
 config BR2_PACKAGE_HIAWATHA_SSL
 	bool "hiawatha TLS support"
-	select BR2_PACKAGE_MBEDTLS
+	depends on !BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_MBEDTLS3
 
 endif
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 5618e6900d..8f975813a5 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -21,7 +21,7 @@ HIAWATHA_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
 HIAWATHA_CONF_OPTS += -DUSE_SYSTEM_MBEDTLS=ON
-HIAWATHA_DEPENDENCIES += mbedtls
+HIAWATHA_DEPENDENCIES += mbedtls3
 else
 HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
