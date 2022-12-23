Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EEBC4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 17:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F94B61169;
	Fri, 23 Dec 2022 17:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F94B61169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMOVebAylWMB; Fri, 23 Dec 2022 17:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69B8061167;
	Fri, 23 Dec 2022 17:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69B8061167
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A45B1BF3F7
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 17:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 201FB41BC0
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 17:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201FB41BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNzHDjkp6KyK for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 17:38:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDD1F418B4
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDD1F418B4
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 17:38:31 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id bg10so4057082wmb.1
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 09:38:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qIoPIMjb4+bDtxeXI9FSV4tSZuMCJ69ZMW+4HwKR1hQ=;
 b=4U0lh0yfMNFWIENtoF/LfnKrfA0tNjGS3xLhAIxEcITDiDjQJ/riLEdEECPXqGCnM+
 smXbdn7OENfEXD1s/uoETXkellC3K/I+wW6TRoMIjycqbclUlM8eSgfM+mpxjQcOL48p
 j17TFLGES7FH0neEagtfobGKaxjUsZYPQYszQbA4+KEUEznT1iqHe5hGmAwQwnrH7OoL
 SRiDipce0Hwo6DxVrt4HxGCeINc9kTMzoGZQJkX2G6vq8gHMMwwUmxhmHJEQdPIuliU4
 7fr73AAdbmYxwzwlgva2ItB50hKcwZcNZRqBUgk962zXi0pRxLJqwxIAe8PI6kgTin0z
 MgrQ==
X-Gm-Message-State: AFqh2kpqg9RX68EHJzzqKSeCnlWQnmSSmkETS480z8+SiJB+o5POoxDr
 /xtEBLX+JOAMaSUTljQ1cDSVvsIK2AU=
X-Google-Smtp-Source: AMrXdXsylqY720hEGVlSRC28jXpudc7j+dKr8RLNXB/pbwQU7rIuZ9hnMESpdiNJeI9BbytOuCQy9Q==
X-Received: by 2002:a05:600c:a4f:b0:3d2:196c:270c with SMTP id
 c15-20020a05600c0a4f00b003d2196c270cmr8043836wmq.31.1671817109729; 
 Fri, 23 Dec 2022 09:38:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003d23928b654sm11256734wms.11.2022.12.23.09.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 09:38:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 18:38:18 +0100
Message-Id: <20221223173818.51581-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221223173818.51581-1-fontaine.fabrice@gmail.com>
References: <20221223173818.51581-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIoPIMjb4+bDtxeXI9FSV4tSZuMCJ69ZMW+4HwKR1hQ=;
 b=FKmyyt9WUSvfPvtHF8duQST2NS8ddpedw6vEZu1XTl1IxTL0zPJ6pLW7Hr3uEp16qs
 Lme7dbJX9c8Gyv2h3Xsq4Ywy92rwuD5Q70poaq7z0B0Q57TPI6hjN3n8I+NFWqvPjon9
 VPDRFBPMTU/BSSphrKOyyDSmdmPDMAtjNbRfK280R2gnNGBLRpezOkqwoq9TGxTC87lc
 a1xydwUuX4o1PM7LkzOi56fI7UWb7OwlAAUJx5zUnb3nSEhI9JaKaYC+gGsJkZpO+XRt
 RBAnJLtoA2uRcYT7qExsu1exmr0X3uhELcau3ZBUMOb4Ra46n/479nOa5oMccr6rW96a
 GXwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FKmyyt9W
Subject: [Buildroot] [PATCH 2/2] package/ucl: drop package
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ucl is directly vendored in upx since version 3.99 and
https://github.com/upx/upx/commit/61e1366122f8d1b9e2434a8103e7af00a35ea902

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ucl/ucl.hash |  3 ---
 package/ucl/ucl.mk   | 15 ---------------
 2 files changed, 18 deletions(-)
 delete mode 100644 package/ucl/ucl.hash
 delete mode 100644 package/ucl/ucl.mk

diff --git a/package/ucl/ucl.hash b/package/ucl/ucl.hash
deleted file mode 100644
index 0252f69297..0000000000
--- a/package/ucl/ucl.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  b865299ffd45d73412293369c9754b07637680e5c826915f097577cd27350348  ucl-1.03.tar.gz
-sha256  70439f6e2b47057a408d2390ed6663b9875f5a08066a06a060a357ef1df89a8c  COPYING
diff --git a/package/ucl/ucl.mk b/package/ucl/ucl.mk
deleted file mode 100644
index aac068ef60..0000000000
--- a/package/ucl/ucl.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# ucl
-#
-################################################################################
-
-UCL_VERSION = 1.03
-UCL_SITE = http://www.oberhumer.com/opensource/ucl/download
-UCL_LICENSE = GPL-2.0+
-UCL_LICENSE_FILES = COPYING
-
-# Fix ACC conformance test failure for host gcc 6.x
-HOST_UCL_CONF_ENV += CPPFLAGS="$(HOST_CPPFLAGS) -std=iso9899:1990"
-
-$(eval $(host-autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
