Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B529C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5DB560FA2;
	Thu,  3 Nov 2022 14:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5DB560FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60IJIRewk9rn; Thu,  3 Nov 2022 14:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1BB760AED;
	Thu,  3 Nov 2022 14:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1BB760AED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E25321BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC85C402BA
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC85C402BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGt9uiwOugnl for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D57444020B
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D57444020B
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:06:17 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id r81so1399677iod.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 07:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4arYTTpG4kCHg1ecPKHeJTizwUTfdY1lULXOXorZpHo=;
 b=oV0v2PRbtopSPAdPB4d9vwCnbdV4SimhwDMehT8w6669QZJk0EA+HQxJIjg9cYue2M
 OcBRZpJ0zUm4L1NBZuvNN9EfcWY1SjG7MNIM8xWBd0sSNKSy0WSsxlK1MGTOi+E45C1/
 vvmJ73ICRyTPA56ydrw1VoTIynu/xL0t3b6Q7JhyqBzyrdR+FxXFwlHGdBeGvISUfixI
 +I1Cb91g1dYHF3uIT3DoSjTrKWC9CQkOaqHKXORGB4bQ3EZJ0pXUNZaJLbXMfN8KdFgo
 HcTY/rxyC8TyAhMSolpuFEzMvkqcSivev4KMQ/6cVAZ17NW9AloCveZgLuKHWvlr51FZ
 oa4w==
X-Gm-Message-State: ACrzQf2Des5rXDaHHLu7RsLHn+EeTYarHRq/hGN4QqLB/KaX3YydUmVx
 hzMsqf1qEnVdYaLeq3g1gc26qzgcFk6UM8la
X-Google-Smtp-Source: AMsMyM4/4ABswAEtT0FlfJC0N18HIjb37daJf18HwahoZi5dzi7NTldCOb1BNcEwHg0jp2P7saKDfw==
X-Received: by 2002:a02:271c:0:b0:375:5e38:607a with SMTP id
 g28-20020a02271c000000b003755e38607amr13806513jaa.245.1667484376623; 
 Thu, 03 Nov 2022 07:06:16 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z1-20020a027a41000000b003717c1df569sm231941jad.165.2022.11.03.07.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:06:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 08:06:14 -0600
Message-Id: <20221103140614.4067969-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4arYTTpG4kCHg1ecPKHeJTizwUTfdY1lULXOXorZpHo=;
 b=FlajAXA85MPyO6iyHdPbISc0s877uZEUe2ig364I7mDtsRBe89lhCSMSNcQV+0fgAv
 HvP5pRRq+csd2CqqrHkWPcFKyoOao07hgqgrK2e60mlubonn/mipIJU/MKNztfT5O2Yk
 tu0l09u5S0XX+UyA5ARurzT3afQlnqOdIAVtVtEQ8nIzuqBx1NRls1Vsbr+0UXHpLkRQ
 fiLl0f3rrM51CjaoESmguiM8oZVnuL0erJb9CjUuuN5jaKAhgEY1AKpbAcLkSpaidnY0
 FuOJsn0x81OR1q+vzcePjF1lBBaAukumRmKMW9iu42ICFf/2czFalpTUzHGNH7Qhmf/P
 hNjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FlajAXA8
Subject: [Buildroot] [PATCH 1/1] package/python-pydal: bump to version
 20220916.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydal/python-pydal.hash | 2 +-
 package/python-pydal/python-pydal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 2a712e26c9..852e568ac5 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  e4bde1955c2d15cae07349275cda48fa61a46dd51562717c2f0f1374dd459547  python-pydal-20220814.1.tar.gz
+sha256  0a2dbc5d61d37d2b59d441ed0aab48c1ec906ce66088eb5cee021b009601de02  python-pydal-20220916.1.tar.gz
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 89c3f14726..a3df1ccff1 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20220814.1
+PYTHON_PYDAL_VERSION = 20220916.1
 PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
