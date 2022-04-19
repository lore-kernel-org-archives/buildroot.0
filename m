Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ED8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 09:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE1C04107D;
	Tue, 19 Apr 2022 09:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVWx9fbtuxPb; Tue, 19 Apr 2022 09:06:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59E2B41078;
	Tue, 19 Apr 2022 09:05:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 626811BF299
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5076C83FFC
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iFqSBJNRxfie for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 09:05:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7270F83FFB
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:05:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id r19so4311481wmq.0
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 02:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vg7QdhyEWzmYoYJbZ5jVAjqoDlZxzCV03mfAz6QU6ug=;
 b=LUOV7zeAQQooKyQuDeRG+0eYTP4hQ3MDUWn18G8tu1+449mANTHEGZ5+/VyE8pwEdo
 BVA3zgOsFK+NnbR/WlytKMZO34BorzFSHZdZ6mYzDZhPM36U8q+r4UukuU3IZ3WuGbbi
 y+cB2ua0ulREjKJ9ijwYA9AnEZWXz1t8baUclXvyt6ZH4cttWWUQiuZOyLHvNwCsWpAG
 ehwCMxI30xkMB9SJzbOBerTMOl2BYjSIwhgaP6kWZEWefcO2ASngQkGfic21gCKnmH2o
 Eym6V+Nk1uyLamt+KyULByBDk3lknXh7zb8nXYi2vcGQ892O5QMAF8cUzG/u4qSHMiA+
 6cdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vg7QdhyEWzmYoYJbZ5jVAjqoDlZxzCV03mfAz6QU6ug=;
 b=EA46KxG64fhGrBd78W9b2bc4lc9YzpL/6CG3MW4SXhS4GbkIBeMppoNsZLoZaqSXfL
 azHeDYtf9UkX69HqYys4Ar8LFQyKqjftH9ovP18jMEgJDYeEo9TxW+/hJyHZLKU0/tIm
 H/i9u5exzUE9G87ebcaYUKQMVgSauD/1uAF6i2nynmbto8+jeHUrg/bHCVoyysc0wSjS
 pFOB3DCL/hxMEvJhQlxaUVAq4z4EyQgdYoyXfyiZrL/1uhLieFNSJHTiBi2NbrwlBTme
 y4OmEafHtt3jr0sPyzsAZP9bT23ZJzIV+RSLZhzxA47lokD0l5Oe9WRfmq+gBOn1Rtfr
 rUpw==
X-Gm-Message-State: AOAM532ZGUOKis46udIHnmY8mfuP1F3BF7xWlslSwWf+KOomlnkdF0gY
 ggru0oY3UByYrfQOVtcv+sqBXCJS8ow=
X-Google-Smtp-Source: ABdhPJyLFdzdY7yi8gVeo4RYEM9goK5gHclW3SWfQLbmtzLFatwIQFQViW18H9+46V1CvJgkkpXB8g==
X-Received: by 2002:a05:600c:2211:b0:38e:bc30:e6d2 with SMTP id
 z17-20020a05600c221100b0038ebc30e6d2mr19042012wml.114.1650359144461; 
 Tue, 19 Apr 2022 02:05:44 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 az20-20020a05600c601400b0038ffb253bb3sm15839143wmb.36.2022.04.19.02.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:05:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 11:03:46 +0200
Message-Id: <20220419090346.2029839-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419090346.2029839-1-fontaine.fabrice@gmail.com>
References: <20220419090346.2029839-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/expat: drop host-pkgconf dependency
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

Drop host-pkgconf dependency which has been wrongly added by commit
732d94d25fd10fff65a378b03c3fca9bde403e95. Indeed, expat doesn't use
pkgconf to retrieve dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 92a3bfda8e..a42c77e0fb 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -8,8 +8,6 @@ EXPAT_VERSION = 2.4.7
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-EXPAT_DEPENDENCIES = host-pkgconf
-HOST_EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
 EXPAT_CPE_ID_VENDOR = libexpat_project
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
