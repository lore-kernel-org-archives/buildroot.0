Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013FFC4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 21:00:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94E3461251
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 21:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94E3461251
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2FA80E35;
	Sat, 21 Aug 2021 21:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 927G4Bz4pA4Y; Sat, 21 Aug 2021 21:00:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E389980E5C;
	Sat, 21 Aug 2021 21:00:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 875EC1BF3C6
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 21:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7730380E5C
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 21:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRN4Ofty1PrU for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 21:00:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC90280E35
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 21:00:40 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x12so19442432wrr.11
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 14:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IyHVBMdGRkHZfAMXJsr40EOTjovUzzOnCybousFU+24=;
 b=UaRpLkQ7dzzJZ5OGyKCc4vTjc/jYId0U1ttE2YHdy+Poy9OCHaHjxZWXq6mSLySxT8
 NiTDwUf9PraaX2EnO2exQ+t1G90AiaBV7SaPbILHDTypefsillFGBFC1n4lgRNz3Xz4y
 k+tjCzGCkex59XvH3a5RXOI5+j/DIrqJT1KuFkw2uMDC8qw7ikWsIm7YR7LKShiT+Jvp
 o6Wd7r19tV01OQ2PNnKrabPOHOYaZv8FoVE8LMTFcub5V2tXWH8Vs7jOg7WJ+emtbee0
 yjYg/bqKIq3ys5GpkExQGSlhpiyZNLbTzXxj/GX2nP/t0uVoybeQ/U2DwCce0zVkDaxu
 ykmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IyHVBMdGRkHZfAMXJsr40EOTjovUzzOnCybousFU+24=;
 b=Chr5ZlIMqNz/FrO2p1KsBT0IK5YZmtIQdMBsRhbncP6GGM+UdLzCwwf3oI6VLJ9xMY
 vNmzbMgbb9itDMVkbIDUMzRvbVKFkTcOH7nAySSJuYdZTCr5A8/W2T8F8rkcj/lHj38E
 akeyjkiA9KHeCvp7mUHl6xVc513v7H6369WDHJLb4aT6Ka+5j5sDKje80pPxLr8AZEnM
 MHIfILkwcBvXXg27VNjXVmJ+dG9OzCyw3f3HXqkftCOp2eo8iURrGFoO3nYU317T3Gcy
 4CjYUH/ayhiJOLadJ2DgJEvmjNKtoTo+a/CMUlvAvICdBS6pip4tydRhK7E8Jo4NgHE4
 YxjQ==
X-Gm-Message-State: AOAM532jF9BTQf1hqd8RO4I6S5bT84z4QNbcfXDwjHmlEMnC4zxEGYN5
 8HTOu/BhmpDMQIVngFRrSJ2vIkRjy1IUvnD7
X-Google-Smtp-Source: ABdhPJzL4tftkLoZZnv4cis80LgfhRCAC9JRffRmaWTMuJRcicGX5a7EpbQbD+YeN2KsLaB5+lV09A==
X-Received: by 2002:a5d:64ca:: with SMTP id f10mr5488945wri.225.1629579638719; 
 Sat, 21 Aug 2021 14:00:38 -0700 (PDT)
Received: from localhost.localdomain (195.160.9.109.rev.sfr.net.
 [109.9.160.195])
 by smtp.gmail.com with ESMTPSA id s1sm13718317wmh.46.2021.08.21.14.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 14:00:37 -0700 (PDT)
From: Bensuperpc <bensuperpc@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Aug 2021 23:00:35 +0200
Message-Id: <20210821210035.69230-1-bensuperpc@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] Update boost to 1.77.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bensuperpc <bensuperpc@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update boost to 1.77.0

Signed-off-by: Bensuperpc <bensuperpc@gmail.com>
---
 package/boost/boost.hash | 4 ++--
 package/boost/boost.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index e6d44a76b6..96419506cd 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From https://www.boost.org/users/history/version_1_74_0.html
-sha256  953db31e016db7bb207f11432bef7df100516eeb746843fa0486a222e3fd49cb  boost_1_75_0.tar.bz2
+# From https://www.boost.org/users/history/version_1_77_0.html
+sha256  fc9f85fc030e233142908241af7a846e60630aa7388de9a5fafb1f3a26840854  boost_1_77_0.tar.bz2
 
 # Locally computed
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index e72ddf897c..98ec30f98f 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.75.0
+BOOST_VERSION = 1.77.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
