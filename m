Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBF4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 20:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA4D741BD2;
	Thu, 28 Apr 2022 20:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EcNpclQ0LAti; Thu, 28 Apr 2022 20:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CFCF4181D;
	Thu, 28 Apr 2022 20:09:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7C0C1BF36D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADB904016C
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RZUlhLtn7ruP for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 20:09:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7859A400E3
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 20:09:29 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id i20so6013840ion.0
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 13:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyPJj1ExxwUq4Qjs3I5eI+nMACoFpJPSG9Aug5xGF7I=;
 b=OO9DY9muOCmrIJhKSJpwCInGINEjhfJt3UHtl/zQjOFepPQDBKWlD2JMRh7ipJLDph
 JcGDEa5niB/87IIHr7Mj+B1BijmM9uCoqtoVAC1XIVbFHIsoc2vS9pKQrBq/Nb8gtLnG
 nw848wI9cCFDeX4KwyyrJgW9nOzfRkuPftEVvpaAR9986cP/WBBbXKUf6d6yz+PpAjsz
 4saqv5lKHQcju3CenAwOKeEdeQQzRPz1TzEm4ly0MknHts1Zo1ZltwM9QVA/Vh+v+F2Q
 ZhnOPkDPiT5OpCROn3aia/XcTC27Fx0y7GVN3nh/qm6kFrC67QY7ynBh9HS31MLpAtNT
 ZEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyPJj1ExxwUq4Qjs3I5eI+nMACoFpJPSG9Aug5xGF7I=;
 b=VJ+CjF/pf92qTJp/Fm/qomxRpyMo8aDxwrt5a19Fmo48K6c8uk8Mu7Rcyz5N2zE7OU
 EdKE9CmsZnhFdNlmiZM8Kg8jW/MU0U0DsaGqyLPlS3IplmksP1ySp0wOdBAVgnmg5y8W
 CFqkFFta+llihhcSEJuowHrCMZUf72U+vI5+Y7Tb+TyFc36LEfGG3uzikm3Ais/2Yu0o
 6hmUpXWzZgpVpoh3GXAGMxSz+EE+8blZTRrmbBEBBkM4+eA6/l/0+1oilvztgY2E2HIb
 kj4dnRHUC6rKPtFk6aQ9JEfmlxmqNvdQe555Hc4OyDWadzEB/kPFj/Y9oT1rmUq7EQSX
 ns6A==
X-Gm-Message-State: AOAM530BV+8ibmwlhiFDfyIhA6uWjR2c5CbGZ3VkecKtgeK/5HRGXbAL
 RYY9DgBOQi8CSbD4Xvh37i2hFTgVeRk=
X-Google-Smtp-Source: ABdhPJwVn+q2mvKJfmfcL9VE10cTfhSy8vI9NbQcq9j4T3PYjNFgOVYLH16U6dFtjeYRo5K+3g8hzg==
X-Received: by 2002:a5d:898b:0:b0:649:5bbb:7d95 with SMTP id
 m11-20020a5d898b000000b006495bbb7d95mr14169786iol.107.1651176568356; 
 Thu, 28 Apr 2022 13:09:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 p4-20020a5d9844000000b0065738785199sm478257ios.13.2022.04.28.13.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 13:09:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 14:09:26 -0600
Message-Id: <20220428200926.790948-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aenum: bump to version 3.1.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aenum/python-aenum.hash | 4 ++--
 package/python-aenum/python-aenum.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aenum/python-aenum.hash b/package/python-aenum/python-aenum.hash
index d10254f9b1..40c0e55fc5 100644
--- a/package/python-aenum/python-aenum.hash
+++ b/package/python-aenum/python-aenum.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aenum/json
-md5  6f30144abd4d156f22f8a49d81c496df  aenum-3.1.0.tar.gz
-sha256  87f0e9ef4f828578ab06af30e4d7944043bf4ecd3f4b7bd1cbe37e2173cde94a  aenum-3.1.0.tar.gz
+md5  c0b78a74cdfacc0bf0cbb42785afaed8  aenum-3.1.11.tar.gz
+sha256  aed2c273547ae72a0d5ee869719c02a643da16bf507c80958faadc7e038e3f73  aenum-3.1.11.tar.gz
 # Locally computed sha256 checksums
 sha256  0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
index 72eaa1db2b..9a30211bb6 100644
--- a/package/python-aenum/python-aenum.mk
+++ b/package/python-aenum/python-aenum.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AENUM_VERSION = 3.1.0
+PYTHON_AENUM_VERSION = 3.1.11
 PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
-PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/ae/25/00b2949186e76a4c9732e33221274964fecf5c88178cbe5a14a80cfc04e8
+PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/63/6c/a71e18de7c651f384b328be6bccadbbd472aca62f547c1a307b9388d03ca
 PYTHON_AENUM_SETUP_TYPE = setuptools
 PYTHON_AENUM_LICENSE = BSD-3-Clause
 PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
