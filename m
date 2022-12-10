Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC293C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 538C0817A9;
	Sat, 10 Dec 2022 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 538C0817A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pbNPXaU29zxb; Sat, 10 Dec 2022 20:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905C181432;
	Sat, 10 Dec 2022 20:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 905C181432
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6C5C1BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91BAC60AD1
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91BAC60AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esg8DfaFeyFP for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:52:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E5860AC2
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83E5860AC2
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:52:18 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id z9so1588190ilu.10
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BuHSSxSMv63Onb42CffoGSjJ74L2Jmb3GjmyLMNYSZs=;
 b=B6942IIPBWwvX30P434jtWdw6Mi63meGhN35wSmZYeS6gPXMMbIvuIiP5MZQq/xEpE
 NgQF7/uNEVmgiOfVWC1Vca8sqqqB3ecRCvqBOACQNU8dM2yItZDC1+dMSwvAaSdnRgXd
 n+RtLbooybf/eZN57uVNc3uBYfNPcDfCGTWt+Ckq8vqCuJYMxDugq5dmHCu7ZbsJ5WeP
 WICtVy4Cm4Z0rBP1WagTiKZYOsm5ftOI65HQhe/WjwOhs1ez8E5DktOjDcc0DNYMDGSa
 ZmGa9BFAaT0Ef83Tyt0NiFpOnVEnzhij9/S0SV2agNudovZlpn6EMAXXwVwhk2Li46N0
 /UKg==
X-Gm-Message-State: ANoB5pnYuY19ADhCdKEcb4lw7N5VBmPRRH701KQ+w7ccgYhjD4qAIkyG
 sy+J2bZ85bbX+suw4VTonvcyAH9/V9M2v23x
X-Google-Smtp-Source: AA0mqf4VSrHCRerbHgd1364MiPFm+LoTVTAGvkb6A2ytg54pN7+EEqxH7K7Wl3I99zOgIg124FXKtQ==
X-Received: by 2002:a92:874e:0:b0:2ff:b176:d1f5 with SMTP id
 d14-20020a92874e000000b002ffb176d1f5mr7859933ilm.19.1670705537486; 
 Sat, 10 Dec 2022 12:52:17 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 o1-20020a92d4c1000000b00302f4f69f62sm1576327ilm.12.2022.12.10.12.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 12:52:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:52:14 -0700
Message-Id: <20221210205214.3619560-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BuHSSxSMv63Onb42CffoGSjJ74L2Jmb3GjmyLMNYSZs=;
 b=gdY7CjQ3Q1hpuRBJgP3TrQ9mpQ1Gf/EBheNbpwELmxqjf1ACWOfmxhqL5L57Ss0fMc
 8UzZyQniBXbtX+Xh1sR+ARVy1pOvrT1XK8b/WrSUsGVLTD1ZB1MSfuXWKmx732cdeT8o
 IpAmXuIxp9SdAqN8qddA9TsQZ78SsPu3tjGSrDK7IcNJaIJn/QzD1mTSVfKbvhlORcWx
 IudWxd0M2WjYzl27+tXrg+axGKnjkMXRpOzmDidqXeWsZyLDa3P6oN1hBfHaBbW28Qlt
 RaOuQxlu1dPg9HLht+vqet2ZrqL8gIFMUjlyFKc+sfdb3lFIKJ3MYBtmnJw4TZVqYH0v
 fJpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gdY7CjQ3
Subject: [Buildroot] [PATCH 1/1] package/python-traitlets: bump to version
 5.7.0
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-traitlets/python-traitlets.hash | 4 ++--
 package/python-traitlets/python-traitlets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 095e85c155..3b48fb6ab8 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5  d5f87bbea8acf897ac3e435c7b71acdc  traitlets-5.5.0.tar.gz
-sha256  b122f9ff2f2f6c1709dab289a05555be011c87828e911c0cf4074b85cb780a79  traitlets-5.5.0.tar.gz
+md5  bae965c0e6ab468079f233e8a9caf581  traitlets-5.7.0.tar.gz
+sha256  bd0fca5c890a09bf66b33cce67ca14156b080429bc39c7ef26b075a4bd4f9fc3  traitlets-5.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3dcd47086529bf178cf7d10f35a8c188a1e9710391acecceef700898a4cf099b  COPYING.md
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index 25ab71047a..71bb775a45 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 5.5.0
+PYTHON_TRAITLETS_VERSION = 5.7.0
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/dd/a8/278742d17c9e95ccb0dcb86ae216df114d2166d88e72f42b60a7b58b600b
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/a2/88/5b2a191dd0287b45b933405d951ebfc490a9dfee2494442e5977653ec43b
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
 PYTHON_TRAITLETS_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
