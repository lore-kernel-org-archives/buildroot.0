Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B78AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:40:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86623611C6
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86623611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 322EC60ABE;
	Wed, 22 Sep 2021 06:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDfCDpUMHjfy; Wed, 22 Sep 2021 06:40:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75D9560839;
	Wed, 22 Sep 2021 06:40:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80D781BF409
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B68D80F4B
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsD1ydv7Af4O for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 06:40:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F1BE80F2D
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 06:40:23 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id d11so1606336ilc.8
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 23:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ytgITc+iEu1lirwdG7cKP15Xda7H+108vTSd2PB0EE=;
 b=ZaU0sez8Mcy+yPzTJFGFEcUorR9a8s4PyN1gOdI/7Q1/M//c2lOwI0+ipsZIPP4VqP
 ESU+DpzZaQ8qt6UEtxeuUWe14DVllLEKscJVZqwlNfZHGyrpRPMlJwsfePPRNeStWmNF
 L473dPmxZG3igdqItGI+0XxTKCul9if27tGWVSgP0ZjpJNRQSpYzxmq39LFkujPVfQyM
 DM64irBQYciWdvLz2Si5pwm5Pu8PF4yhj/X5PwTknosumdvC6jdzzJAtiMw+Kb6x9ZOR
 huaf9rj8JbZ/EW+/70KezgyW8LU3hhpbJneT4ZG1N+neE2jBL2BKK7jinAnQiguYnXsy
 jizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ytgITc+iEu1lirwdG7cKP15Xda7H+108vTSd2PB0EE=;
 b=nlUYYDfI83EZpgCAp5zZXjm64djwb9ct3q3WyZ/AJJW4JqYiyPknBKMP/XAJ5tPYGr
 msGpRJ42kQrqYlxYqrGvs9QPBRaBDpoacetiJrryzvNSmNhXE9ExhVIUfYMF3/VaiBF6
 dxrmPqhWGl2A5KZ3T6IXuNV9mkcnaEIwI82sgPjr6g/dxO3bfzybwjmK77p5ZBBgpqOU
 RKdQMGo5V6g9Sp7IszNwYPgW55wVFHYfx1g8pX2VjlsAsVM1YGJNG1qGnURvqFa20ES8
 E1FWSIFzvHuLfCFL9+fdK2aTLGYGmbIshCLT1jW+pLwIfft+D7IE0LJqEaB3mf+b/Kn2
 dOew==
X-Gm-Message-State: AOAM5329aQ5XKsEfuEmu+Z7oQOHOBMDPDAb/XT0zvrfI0lKrguTe8O6N
 HqP5Yr1PKhuVpu2mAJCDSe5Vp5Kij9o=
X-Google-Smtp-Source: ABdhPJxVIlKbouJZPJM1fkLzHyWAxi1AVYERYkPaPKyNY59aoHqk8GCo9wagI9lw6QyvaKEx6PCvqA==
X-Received: by 2002:a05:6e02:e13:: with SMTP id
 a19mr24628181ilk.11.1632292822659; 
 Tue, 21 Sep 2021 23:40:22 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id m13sm623765ilh.45.2021.09.21.23.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:40:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 00:40:20 -0600
Message-Id: <20210922064020.4173488-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-hyperlink: bump to version
 21.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

License hash change due to name being added:
https://github.com/python-hyper/hyperlink/commit/c7509785af58fa4d065faed2557e57943e31f53d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hyperlink/python-hyperlink.hash | 6 +++---
 package/python-hyperlink/python-hyperlink.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-hyperlink/python-hyperlink.hash b/package/python-hyperlink/python-hyperlink.hash
index 94535002e6..c7621a96ac 100644
--- a/package/python-hyperlink/python-hyperlink.hash
+++ b/package/python-hyperlink/python-hyperlink.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hyperlink/json
-md5	4772fb4d87c26a1ab22a6161424e3cba  hyperlink-19.0.0.tar.gz
-sha256	4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654  hyperlink-19.0.0.tar.gz
+md5  6285ac13e7d6be4157698ad7960ed490  hyperlink-21.0.0.tar.gz
+sha256  427af957daa58bc909471c6c40f74c5450fa123dd093fc53efd2e91d2705a56b  hyperlink-21.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	9577b66fb599aa5700b4981078ab0a319416a086beee646cd282aa9f33c8c74c  LICENSE
+sha256  7468ded55310f64fbf085b8e892df81d1bcc49263bf535d3c2c58b014cfae214  LICENSE
diff --git a/package/python-hyperlink/python-hyperlink.mk b/package/python-hyperlink/python-hyperlink.mk
index deff4feac3..a80c555450 100644
--- a/package/python-hyperlink/python-hyperlink.mk
+++ b/package/python-hyperlink/python-hyperlink.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HYPERLINK_VERSION = 19.0.0
+PYTHON_HYPERLINK_VERSION = 21.0.0
 PYTHON_HYPERLINK_SOURCE = hyperlink-$(PYTHON_HYPERLINK_VERSION).tar.gz
-PYTHON_HYPERLINK_SITE = https://files.pythonhosted.org/packages/e0/46/1451027b513a75edf676d25a47f601ca00b06a6a7a109e5644d921e7462d
+PYTHON_HYPERLINK_SITE = https://files.pythonhosted.org/packages/3a/51/1947bd81d75af87e3bb9e34593a4cf118115a8feb451ce7a69044ef1412e
 PYTHON_HYPERLINK_SETUP_TYPE = setuptools
 PYTHON_HYPERLINK_LICENSE = MIT
 PYTHON_HYPERLINK_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
