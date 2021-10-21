Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FD7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 21:37:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 508836103D
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 21:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 508836103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD1204087A;
	Thu, 21 Oct 2021 21:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DiNYUuIN_iog; Thu, 21 Oct 2021 21:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 361C04087D;
	Thu, 21 Oct 2021 21:37:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1E21BF9C8
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 21:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55D75606A3
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 21:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l2ffuPAOE0s4 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 21:37:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C3ED6068D
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 21:37:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id v127so921165wme.5
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 14:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QFkENh/qgUR03lxGEG+/OYwgvYiOV6ActYyKdx9Da18=;
 b=K4Q7rsTtVja0owmOksuKm0eNy7ujDKf1JomB4Lw3chpZk8iMmeZkPdk0bF06qt7y9w
 ZYi+pHXGTWT59ux1U9wI31XvgZ/9TX8bhFW9i8DbhmhH/vhyJj7K8hd6wGL8J4QsHuOB
 1H5uP49RDEDz6y7QEFXngf+GjRgli29xk65ErJtC6weJzpWZYzm4Mec8ET2YC1IhbP7v
 F0j5PSPPt7p31J2phdbQibJ6RZ7EVlgNspP1BX1h1Y4wx4RQmv2yO4QJuZbvQogRmdy8
 X30gjpd4BVJ5JvRmUSbBX0G7R0P+rgjYziwZxFTN1gy/TTXEE7zIcmrDWoFoJHSTbAGQ
 4fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QFkENh/qgUR03lxGEG+/OYwgvYiOV6ActYyKdx9Da18=;
 b=IhCI7PNI/aT+WCgX/D9byRjAK4LahkZrslYL2qS2JQN96btjvsS68ocfNOYOTAu664
 bondouF7Y7Smh2YEXeLB13gbr9TtCNrk8t7W3WBRPth3/vlLtz+HLqc6pi71gDFGzLMa
 Vrm8sTyh+s4gmSOVVPfe++QmK518XUxs85nJV2napJGkezn+J7tyUHJTZDbq8NNbV5eD
 8I6cgpKI2cNE9lu41dNo75hBHuMr4uqhw0SToOZrPnlQVttIWUHmwYASTwvDa3n1lBp9
 HV/Y+LAU7BDumFEOufO8XZZbBjoiyykxqXr1yMz+3e9kOs4OUaLE8DZq+GSFt1DPg4m+
 r/ew==
X-Gm-Message-State: AOAM530hdhAMRVGnstKpyGsqFqOSLGaLDw2TcyXkYyZPNNdrOXNE0nlB
 UkDmLskrxI2G5Y3tUDXOCl6uHwNIrLw=
X-Google-Smtp-Source: ABdhPJzemcBRL326c9HuXF+w8QYOgoYLBZuPjJAScF/luiwMls9OcDmHEodjjUf/kG1yG9BgUGhUsw==
X-Received: by 2002:a1c:2209:: with SMTP id i9mr24170345wmi.20.1634852273064; 
 Thu, 21 Oct 2021 14:37:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id u15sm6704686wmq.12.2021.10.21.14.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:37:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 23:36:18 +0200
Message-Id: <20211021213618.159196-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sg3_utils: bump to version 1.46
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of COPYING (space removed:
https://github.com/hreinecke/sg3_utils/commit/c1fad13023cde771406ebe3eb8a0df0f3a409bf4)

https://github.com/hreinecke/sg3_utils/blob/v1.46/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sg3_utils/sg3_utils.hash | 4 ++--
 package/sg3_utils/sg3_utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sg3_utils/sg3_utils.hash b/package/sg3_utils/sg3_utils.hash
index d6c7f03abb..39510b4dc2 100644
--- a/package/sg3_utils/sg3_utils.hash
+++ b/package/sg3_utils/sg3_utils.hash
@@ -1,6 +1,6 @@
 # Locally calculated from download (no sig, hash)
-sha256  c7dab547dc37381fa50e482d9da680fe64b88cfe0e3d79b61e478de14f58b2ee  sg3_utils-1.45.tar.xz
+sha256  59c268b10b93ce31a517af13e19c88f285c12b7dd065f50e36b16a7b6fa7b9a0  sg3_utils-1.46.tar.xz
 
 # Hash for license files
-sha256  d516b8b337a77e3d4c65dffe708ca7fb25b1cb4ec77ec362cf11ed659b9250bc  COPYING
+sha256  256ec2d7e4e79faabb105ed1ddf32aec11d830c3dadb955a4ab2616eb87439ba  COPYING
 sha256  8ddd1d82f2be2f5cbd5b5c3b5c2ee94a90d2ca7112958448da74dd78384fd96a  BSD_LICENSE
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 11b3691ffc..1983a12261 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.45
+SG3_UTILS_VERSION = 1.46
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-2-Clause (library)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
