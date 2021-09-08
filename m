Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A574C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:20:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1693E6113C
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1693E6113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6E8E6074D;
	Wed,  8 Sep 2021 08:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0QwB3Eli_Sh7; Wed,  8 Sep 2021 08:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 332AE6073A;
	Wed,  8 Sep 2021 08:20:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 197761BF5B4
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 161F560666
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AoCVRSOWCrw1 for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 08:19:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DA036062B
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 08:19:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v10so1952968wrd.4
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 01:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TilHL9l5n5FMuCqTQsxIbvnb6b2pGGBIMGJcxlORfNM=;
 b=BnL5uupdriXkAHbamjc4Qgq0C1oL9Vt2zb+UC6/5Rgq89Nh3tg9xTUNdMpqV0gAprs
 I5gOZ2scKT2+Ic17pbTnW8Jaol8DTLyp0MsedLH3470G9LccaTrX7GE1xPvbWJFkAKdd
 nTV80repIVDYzANdOFD4RPnh/wNtQDFHjMyA7CQ3V0BIXdWeYLxDnsGlp+/tLBfkAtya
 nuNVDj5AL+ABVErS6KPiqF3Udr34ACYodYnS2yzyKnVGjTKyoI59GvV/h4k7PSgeD+rh
 P8AGEqJhIOV7G3tI+NkVzmXiO/dgZyvjE6mlKWZi7GjhG5ZvYjoVkZVvMxCH0BgJ/62D
 fCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TilHL9l5n5FMuCqTQsxIbvnb6b2pGGBIMGJcxlORfNM=;
 b=XC8+VzNCnqrm1XwlL4RlpaVSoQPXeTzm6nYLLFu+Kz4S6VOvSxXmIP29NRZuDNluha
 4/IA3hcdZdM9d5A2SwHMJfxPtiwv+p936stSxxIRAwh4JXcirq+nKVrWSYxn4JI1j6tA
 4nyJiesZYdKjAL6MTsaYCUNCve1Nf9npjiIv3pgDexKm8eDXeZu4DlwyOdYKKL/8W8zr
 sFgyqMxe06sDGMe1YBy75zhv2XXV+Xoz+ZQaEjFi51WMJ5pwMsxlOsxpk920Zf0tkOro
 Oc1HBqjAkf35EjqC+oZQaHyvko/oBGXkF+CQF7Ylj0eK5P1N4klp9JN4i+a4Ax0Tn/Ez
 sREw==
X-Gm-Message-State: AOAM5324GKYZfrnib8c7gaJEGgPZ/FTxwfg14xNfwmwq6jGxDVa1k0Kp
 DfhzrUZvuds5ZWMymemDCPNmBHiTMBIVmg==
X-Google-Smtp-Source: ABdhPJwPNMLVfkxXajsheYf9n8cfxZNFOxA1VV3n0TU2i8u1MWoCzfTOGVukWkjAM1QeFTPOmzLpWA==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr2562010wrs.271.1631089182059; 
 Wed, 08 Sep 2021 01:19:42 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:8ac0:67ea:778a:fea7])
 by smtp.gmail.com with ESMTPSA id c15sm1304347wmr.8.2021.09.08.01.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:19:41 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 11:19:25 +0300
Message-Id: <20210908081927.694201-5-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908081927.694201-1-asafka7@gmail.com>
References: <20210908081927.694201-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-bsdiff4: bump to version
 1.2.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Plus, use two spaces for indentation in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-bsdiff4/python-bsdiff4.hash | 6 +++---
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index e64e817f9c..4fddd137e6 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5	a0d047e91429ce67a3b0231facf41169  bsdiff4-1.2.0.tar.gz
-sha256	3c2f7f5504f41a54d238b54b00b4544d0eb4276179edabf02b9d00415a03cc9d  bsdiff4-1.2.0.tar.gz
+md5  58889a1cd439c82c78aa2e4776b1ff38  bsdiff4-1.2.1.tar.gz
+sha256  87cffc7522effdda03fd1564b212ad2279c0af50d16c3e65776f80acb6705d4b  bsdiff4-1.2.1.tar.gz
 # Locally computed sha256
-sha256	c6c921c90383f1c43beb53c49a652d28309a410a7c394c729fd8870271451cf0  LICENSE
+sha256  c6c921c90383f1c43beb53c49a652d28309a410a7c394c729fd8870271451cf0  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index 3b789ac9b4..e1c3f7765b 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.2.0
+PYTHON_BSDIFF4_VERSION = 1.2.1
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/9b/ca/06cd939630ca78125c36489f92b52918980cbcfee2dcc0969411eb5ae8a8
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/d8/97/101315b0d8c8d6340ee310484a1af6a2ccf65d7bb4762c3a669cf9457c71
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
