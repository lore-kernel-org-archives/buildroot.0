Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06405C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:57:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A35C660F90
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A35C660F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CFD86079A;
	Sun,  5 Sep 2021 06:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-zU7Fwitmeb; Sun,  5 Sep 2021 06:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAF206078E;
	Sun,  5 Sep 2021 06:57:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A83A41BF5D7
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 985348194A
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KoN5l57S4TMr for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 06:57:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE5FB8193E
 for <buildroot@busybox.net>; Sun,  5 Sep 2021 06:57:45 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d6so4150621wrc.11
 for <buildroot@busybox.net>; Sat, 04 Sep 2021 23:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sdP2zt3EXrO16Xx1dVt4rPoPj1XAyRmQns5gxgrsAQY=;
 b=C3v8VXgGIKiupoSO6viP/WVF6hbQS+gGB6OmWz0dVDFT4HLkM0C2Gwg9S106RK0aQl
 KHLxuR4uKsiEwXMkyKRDM2Ycp9r/i9ODYdwFJy6SCmlIsRtw4dh9oL9fSV1vtLjwaNFR
 1EFOPDpy8OfBTnIuddRKsdHy3DJQaRCClIiTj66RFPu7CxY1+Cx3eU9Y/yhnKVefdSGk
 KgFOFC9Ot+sEJnN8Yn1E51CsqWx5Fn0m3iwf9CNl0aPxC8X9eGZ5Vq7pcRGo5sgkww4n
 4YGeINwpzDRg0q7MyCY6tJ4GjRg90n3Gc6txaxlXj0BothuRiuy1jQq8wB88AUo1dbPi
 p04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sdP2zt3EXrO16Xx1dVt4rPoPj1XAyRmQns5gxgrsAQY=;
 b=VwMgQ7AHJcZzCNTvAQ1IFEcAWfOd1sygH40KXYEC6DlRk1ty9E9M/FR47Lq4wpcxn6
 GxyfhkYwUJaHUVw5HWB9VOX7eqtoAg5jS55BeeVYuDMZNGcbSXkX8dT2JHc+ikUZXWFV
 /Up7BWPlnS20kBRs5qo0lPAO6q89V7JVi7FcR52q1bi5lr4me8zy3SzJaDJ4iZ2drsHM
 QG9pNVg6KojdGJ9u+yjU7xXENVQX1oChp+1jnqAMA+9mvo/6RRa+J+TH/ITqgMBdQJZE
 uYXecsLPKCJdKrwQ9sHWzHL7k1soy5+vekE/JLj6bmMFmH05phT+CUZgXWMfdwbFXPJo
 vGww==
X-Gm-Message-State: AOAM532v7UDakLq8MuPLD8VkjR/SDq12rolR7PnOms4GjgHsiOUCC49M
 dh6NNoqKVul6iKTvmw12o/6Hs1h8bu4=
X-Google-Smtp-Source: ABdhPJwFTWW1Au3+mzpVy4OFb99ThuwGDGH7CVtDzVGq2Qr8cJwF5TOB248ym7yJQYtqL7W0mdGPvg==
X-Received: by 2002:adf:edcf:: with SMTP id v15mr7100361wro.61.1630825064295; 
 Sat, 04 Sep 2021 23:57:44 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id a10sm3822624wmj.44.2021.09.04.23.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 23:57:44 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  5 Sep 2021 08:57:38 +0200
Message-Id: <20210905065738.1828744-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/can-utils: bump to version 2021.08.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/can-utils/can-utils.hash | 2 +-
 package/can-utils/can-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
index 145d0a33e..4e47143f3 100644
--- a/package/can-utils/can-utils.hash
+++ b/package/can-utils/can-utils.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f7874457224c89f8b2eb55ab741935ddb7f1c9bc52de2642330b0799f89d1040  can-utils-2021.06.0.tar.gz
+sha256  c9b8f29515ad34af7f78450ec55c983abc5393e86b1f128a92ac0dfd141baaf7  can-utils-2021.08.0.tar.gz
 sha256  c3dc748f5e725cf5ed89784fe78e4ff1b05d309bf1e7ade4c572e8fde1b8406c  LICENSES/BSD-3-Clause
 sha256  995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  LICENSES/GPL-2.0-only.txt
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 1e7add055..5b8a2aeea 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 2021.06.0
+CAN_UTILS_VERSION = 2021.08.0
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,v$(CAN_UTILS_VERSION))
 CAN_UTILS_LICENSE = BSD-3-Clause or GPL-2.0
 CAN_UTILS_LICENSE_FILES = LICENSES/BSD-3-Clause LICENSES/GPL-2.0-only.txt
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
