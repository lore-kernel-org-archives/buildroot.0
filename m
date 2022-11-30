Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F56C4321E
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 07:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97EBB81ECA;
	Wed, 30 Nov 2022 07:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97EBB81ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5dKzA-bXqhw; Wed, 30 Nov 2022 07:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF04E81E92;
	Wed, 30 Nov 2022 07:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF04E81E92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F3161BF94B
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77B4160759
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77B4160759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d89ANelzDcqT for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 07:55:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D3E160AD4
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D3E160AD4
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 07:55:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id w15so12543600wrl.9
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 23:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e0H4+TloAd6NZ09xl1ysn2yjbS4hvBFmtRuGONKN1gs=;
 b=r6yHmBl78NyI7n2lcU1DOpHaDo9k5qszX6Ar7CcZkhIRJvmdkWOXF8yuof35OcCtol
 3RuDG67QludwxTYTt3Pmq5hyqhhHSIdT6vtuHjB0maQ18fuoo1S9UitleQl17mh0/Sag
 mUeBnSuiZgp/YIOAgPUVHyEJu5kzHb9hi2M8L25BDvKOEspKtYXMWhln/RcAgBJI6wsq
 G0QBMJebLrsAxxF7RE//MDTkPpAW4DoSA0K4bZM6XT8ik8/IPiVm2pOgi0DqsBzNO0VQ
 SKcezzBiLE8HddAgr+Qa5Nbz07OibddfSZ3+bYYb5TINA0wxuzdqrYkgnYafJ3KbX/n4
 22kA==
X-Gm-Message-State: ANoB5pn2I8EUzJ4BaJsFsiL2Q298pJFFnc+L1FLCg2M2A0LmqHRSYfGI
 A2R2/CkwulEvM5ol9iCtAAjn0fw3bDTXmw==
X-Google-Smtp-Source: AA0mqf7vYU0F8i/AF2DNs/6iuOs9vG4HUhFtteOJh2ktRuxByD3JGThLUk65sDxqatICrSROJEm3Og==
X-Received: by 2002:a5d:5186:0:b0:241:dadb:51de with SMTP id
 k6-20020a5d5186000000b00241dadb51demr25667267wrv.142.1669794905439; 
 Tue, 29 Nov 2022 23:55:05 -0800 (PST)
Received: from lmecxl1178.lme.st.com (87-88-181-79.abo.bbox.fr. [87.88.181.79])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a5d5649000000b0022cdeba3f83sm677511wrw.84.2022.11.29.23.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 23:55:05 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 30 Nov 2022 08:54:48 +0100
Message-Id: <20221130075452.2507453-3-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130075452.2507453-1-etienne.carriere@linaro.org>
References: <20221130075452.2507453-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e0H4+TloAd6NZ09xl1ysn2yjbS4hvBFmtRuGONKN1gs=;
 b=zgZkxJSl+ZDSi1liSFfZ+qlBqIAWbQ3XGh9EJahPE6HqEFAZzWMNuajZFHar6mPSps
 J5I5QzuKpglEu2dKJLvVgs2uSYguSHaOmxcRM98xOS6zrjNK9HgbH6yFd1uCXskXJFuR
 r5CN6L10TrVzwaGKDY5huc5Y6yYN4kmeXRUIpwSeISSfJekC4Mq6r4keIZjSoN/8B1aS
 hQZVWEYr+YCQWHok9cA5TcMBUqAp/bChskUasGB/0U/Lz5qP1HKMt+gfZwMslOcdD/CR
 J04l/i8m2rPyusrsmHf56jCnYZjKM147S8hyVP1dZuVwUMmWDCCSAvbxKfdgYNjrrQls
 kHpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=zgZkxJSl
Subject: [Buildroot] [PATCH 3/7] package/optee-client: bump to version 3.19.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE client package version to OP-TEE release 3.19.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-client/optee-client.hash | 4 ++--
 package/optee-client/optee-client.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 8e55bf5725..c067e26f4e 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.18.0/optee-client-3.18.0.tar.gz
-sha256  ecc0f04fdd5398aa52fea50427fbd624f7f90274aec7bbf2cc8a5bd16758202b  optee-client-3.18.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.19.0/optee-client-3.19.0.tar.gz
+sha256  5f0d02efa0e496964e86ca9dd2461ada923d1f9e11a4b9cafb5393bd08337644  optee-client-3.19.0.tar.gz
 # Locally computed
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 252841ba10..54cc112c5c 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.18.0
+OPTEE_CLIENT_VERSION = 3.19.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
