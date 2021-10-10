Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A98DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:41:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D007C61039
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D007C61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4E664050B;
	Sun, 10 Oct 2021 09:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id da0jLmN8cbA3; Sun, 10 Oct 2021 09:41:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF8FF404F1;
	Sun, 10 Oct 2021 09:41:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C63BB1BF476
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B61E2404F1
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57F85xRUMnCO for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 09:41:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5325404F0
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 09:41:19 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e3so11599212wrc.11
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGGhTndlRqFU4mL1bnAvX4iucUWicpY4Xwkhy4/Vox8=;
 b=Qjk457qA/RzGCMweKAmSeS46+Ktf7TKv9KC2UJoaPAGqdqa2Drd0VrGXkwBj4ZtuUA
 dGjPtilNM9IqXSfOKnDOTYHhdqj/w1Cq7FdXW0cvzj1Cj/+G6pjqou9FLEHAvKdh5kq1
 DQfjdZzOZjg3z1AOS42J679IZH/R4oa1vP/HB1oKn5h5EpIhLxeOeNlfTCZnmL3n6Tpr
 PqPjrMUB2EeJrRSKMJPAiTN0hsYsNZah/qkMMJphYQnBPeWvUP3Jx+6RbTxIuXn7uBrY
 wKZeu4uBKotiTsWGPlsLVEq2IbZa1EVDfURp/1V2jQrtk9m4/PjKLh0yKTN1oWZp37Ea
 PrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGGhTndlRqFU4mL1bnAvX4iucUWicpY4Xwkhy4/Vox8=;
 b=adLuosmZWwhT0F3kyRW1+YZ/7o27QOOqHcBI8MzcscUiFUQ3teabBATZ1k/saOzGGX
 AKp5suKh9onqUvNg2v2UT1RBJyHYNQ5VZFKxnJLlz7iTn9679IjAgPPpLqjbtBW9wgL2
 AnJhvFKdVzrJC4WF0CnLIfziUERmHv9bkzhvlXQ5NMPAwUckdDMne/KuPOdCjr61htxb
 QtIIMc0hAKE2HXjAYUuaso3HBog8fCdgGYiil1oXPLISRP8enxySWpUPWp+uyNc7DGqB
 mVOuyzAOoDpPhkVXEhKZaYbwuc8tOb4TBSb7mTH5LttvW9GNZrEbxow7loa03zJgHzxl
 XYVg==
X-Gm-Message-State: AOAM532m00HQxu8Nz9/0Z4YYvBJqTk6GAG72gKNsflMQQe8/B9obaDBu
 3D8dXE/849eC2Ul7JFdU9QQJGNA9z0I=
X-Google-Smtp-Source: ABdhPJyk89j100FMkLWDh7z+dwMYcpGESugFf9Sn3jMvMn73xUsd7r6/kjf5oSa4dBKvNmnlnJ8ohQ==
X-Received: by 2002:a05:600c:198e:: with SMTP id
 t14mr14742620wmq.124.1633858877826; 
 Sun, 10 Oct 2021 02:41:17 -0700 (PDT)
Received: from localhost.localdomain (138.23.87.79.rev.sfr.net. [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id a16sm4409904wrp.14.2021.10.10.02.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 02:41:17 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 11:41:10 +0200
Message-Id: <20211010094110.109025-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/leptonica: bump to version 1.82.0
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/leptonica/leptonica.hash | 2 +-
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 6ef1a09122..1220fbbd6e 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  ec9c46c2aefbb960fb6a6b7f800fe39de48343437b6ce08e30a8d9688ed14ba4  leptonica-1.80.0.tar.gz
+sha256  155302ee914668c27b6fe3ca9ff2da63b245f6d62f3061c8f27563774b8ae2d6  leptonica-1.82.0.tar.gz
 sha256  87829abb5bbb00b55a107365da89e9a33f86c4250169e5a1e5588505be7d5806  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 93d1e47c28..368078bf10 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.80.0
+LEPTONICA_VERSION = 1.82.0
 LEPTONICA_SITE = http://www.leptonica.org/source
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
