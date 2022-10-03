Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06C4C433FE
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 15:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FF7160C2D;
	Mon,  3 Oct 2022 15:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FF7160C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djt8lWBHxF37; Mon,  3 Oct 2022 15:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FF3160AB2;
	Mon,  3 Oct 2022 15:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FF3160AB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3CC31BF398
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC1564011C
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC1564011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DVgFmR44f2oA for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 15:12:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C77D04067B
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C77D04067B
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 15:12:11 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id l22so13567679edj.5
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 08:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=4451sgqwWStHuG1XzVqRzz3tNN2js3W4u0P1BJnlQXU=;
 b=BYKvuhH1NM9CSZDdyYeE9glwniqJesijhwNGsY23ekKBihKSfTrBAjq8xbg6LFxJpQ
 QMfSGsAYmvPIkSbw3rQuib1NDlxpx57so3Sa7pnyvmWPAj3O3HPjHzsGMtoIHthy7FxF
 afvyIlKUeI62PlQUHRIlOTb2CAlcS+RmECuwPxnLwSvuC3/RNjRWn/F2zuih7oMtJzAb
 btU99Y8bzSqtfP0rS8upWfQuQsSg8eS/Zlbv5GGf6cuW4K4/ftkWcy5k83pMlEhfQGNu
 mCJ0ggN75WziWTyuitgHrMt74WpeqdETMGvBrJkp/z5eH2z5naonMG/LX+fpd5yVim61
 ZaUg==
X-Gm-Message-State: ACrzQf398HXvmNYHz1wez7EmE928b4JGZxshr6zUQjXP7TkmQ81ICOt8
 s9Dknxwr/pThdelXWedk88jL8K0r5z9cVA==
X-Google-Smtp-Source: AMsMyM4Hrlxx7343Dgcv1EaYkofotVj7Molw862+T0v2iBBZKsl2Pq142PAZ/j4nzrGXV78CWo8Jzw==
X-Received: by 2002:a50:9991:0:b0:458:a612:bf5a with SMTP id
 m17-20020a509991000000b00458a612bf5amr11068556edb.22.1664809929873; 
 Mon, 03 Oct 2022 08:12:09 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a056402400600b00459148fbb3csm1737843eda.86.2022.10.03.08.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 08:12:09 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Oct 2022 17:12:07 +0200
Message-Id: <20221003151207.3250577-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=4451sgqwWStHuG1XzVqRzz3tNN2js3W4u0P1BJnlQXU=;
 b=jpOO2Qhsxs/FLl5gM3SxIKMxGc5fMUr3xjYTHQewidphAQH1+ULd4W3GHMtboc6CVO
 CbJyZTYTv2o1ijiAYMoshxuPDNwVyXA1jRLvjZK+hjYAvN4PSgtE0aeCgGnG33zPmob0
 zQPTfLAVtCs3jVowzRNDety+BoDbgIGvVqqME=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jpOO2Qhs
Subject: [Buildroot] [PATCH] package/python-pydal: bump to version 20220814.1
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
 package/python-pydal/python-pydal.hash | 2 +-
 package/python-pydal/python-pydal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 9366708a7d..2a712e26c9 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  7891bd35d57b850efdbbe1f2d46cb1daf8c991c912a99e211ab87a30e7685781  python-pydal-20220609.1.tar.gz
+sha256  e4bde1955c2d15cae07349275cda48fa61a46dd51562717c2f0f1374dd459547  python-pydal-20220814.1.tar.gz
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 2990051351..89c3f14726 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20220609.1
+PYTHON_PYDAL_VERSION = 20220814.1
 PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
