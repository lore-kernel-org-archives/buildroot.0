Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BE8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 23:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16A6E405B2;
	Tue, 14 Dec 2021 23:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rApucbwxvcP0; Tue, 14 Dec 2021 23:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E2194027A;
	Tue, 14 Dec 2021 23:11:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D672A1BF397
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 23:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D255B60D69
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 23:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HK-LPONDFzBB for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 23:11:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E203460D64
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 23:11:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 bg2-20020a05600c3c8200b0034565c2be15so1031171wmb.0
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 15:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uS1TzPZHzKDCchowD0RxkhZ7y5/RZEXjtmIZgC1UrKQ=;
 b=mrYTrw9yUf5Q0sQzntOIrhaK2QVN50vsUVpGBiDJpgjVEarUeNXbEx779bBBwJLuab
 QvE2IuR9Dv7blu/6eisewIBfolkmrqy32S2op7vSdVNiht58BZknuIRXkUMnDcE4s6lb
 kG18m0Y1MHqvc1pCT2sMoe3YVQN0TsGU0tYEV7IP4lLshmaZTZU1nqoNl2pvRg/JC1PI
 49NnRuM8EPQTZ2he0V/Z7wwFz7L0ESRxiW+BjvonrwSoHrnWr9GwuSr7bOOZ+rnQ1HNQ
 ZP2FUKX7yYHQss+G7paqvOJo2m3/777mmWaFNP55fhlzuw8BiopL5tzyrfDV+SGHAxNy
 7T/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uS1TzPZHzKDCchowD0RxkhZ7y5/RZEXjtmIZgC1UrKQ=;
 b=oA6y2/ksipV3Zbjp2GtKF+9+3SLZ0MHZWJwVrSUn/plCZeTwDwAscM0nRwA/Yrj8Ni
 xFHw6hzci30GDF7RWsB1EtyN7cNpbQFm3nfaAAeWbpMtZCeXpdh9K42dkJdjPEzaClUy
 vhesOREg60HKO3L2QI4FO8t9Sdvm0dmB3LSQq9szvxoRp5jsHKiGJgINo2/iOd+LB72q
 taz3puE6a6gm5wgD2nj4/36LJ+KyRyw6WZjhKTFOM17szbOAP19QFFi5HXJiHpv2xvFe
 bzbl2mqwyoTsZfi1Vk8UqHeCgxTACYWQ+Bt0AR+1mVEQZRB2W0ZJp7Rw9yyhyDByrjva
 HW+A==
X-Gm-Message-State: AOAM530lmO6pg0MXzYx+0UnHe5VaU9icCxoYpYG1OZm8IiPfigR9TF6Z
 HWwRoUrkQtp+IKwKohHQwwAOE6lUdz3euw==
X-Google-Smtp-Source: ABdhPJzuNJaGm2AZI5LjYiVrc4xdee8ZOf4BDXrhq3ZZFX7pQugmYNu0Pn/ENalIFKFkv+DPltRGGQ==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr1971526wml.148.1639523460970; 
 Tue, 14 Dec 2021 15:11:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id y12sm235917wrn.73.2021.12.14.15.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 15:11:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 00:10:42 +0100
Message-Id: <20211214231042.3277459-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: bump to version 4.5.0
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

https://github.com/sqlcipher/sqlcipher/blob/v4.5.0/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sqlcipher/sqlcipher.hash | 2 +-
 package/sqlcipher/sqlcipher.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
index ddc78ef7d6..f831e615d8 100644
--- a/package/sqlcipher/sqlcipher.hash
+++ b/package/sqlcipher/sqlcipher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  b8df69b998c042ce7f8a99f07cf11f45dfebe51110ef92de95f1728358853133  sqlcipher-4.4.3.tar.gz
+sha256  20c46a855c47d5a0a159fdcaa8491ec7bdbaa706a734ee52bc76188b929afb14  sqlcipher-4.5.0.tar.gz
 sha256  3eee3c7964a9becc94d747bd36703d31fc86eb994680b06a61bfd4f2661eaac8  LICENSE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 776e2d0dcf..c47aa48429 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLCIPHER_VERSION = 4.4.3
+SQLCIPHER_VERSION = 4.5.0
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
