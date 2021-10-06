Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5BBC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 23:44:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C59A610E6
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 23:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C59A610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F99740937;
	Wed,  6 Oct 2021 23:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6FT5qtLhiZk; Wed,  6 Oct 2021 23:44:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7567A40934;
	Wed,  6 Oct 2021 23:44:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A0931BF30B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 23:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34FF84019E
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 23:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnuAWsuUHjKD for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 23:44:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBF9E400BB
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 23:44:53 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id h189so1874377iof.1
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 16:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K+MVPxWZbeCtyCRtm3ATfNI0yj1uGx0up0wdJ5Dg9iY=;
 b=gnTxp7k5cRagghpnCe7uCQI45sRS0PmUf4d79bFsUtDWUcZoOXUO7ZwyfSrN53JKdv
 GJnZSBa9M5sQNjWHlrQFeV8jWY31RnG94A0IBMVtyUVONteqBIJnIEf2InjKZpfFiK5C
 KL84yoHc5+oUcw5pk+f47I8YkXEFmkY7l50Ud3CDX+uUOAzwhbVs8JyOyysWNTpslhYb
 Uq4BPKZaw2nMhiMxh6WfzgdMPOnPGStLiUxFNcZWGTmyG65wso46nu0te1w8YJnWgZZT
 1wvdoekov+1s6BhpKzCrKA871kSUqyOwcD/naiqTDibcAeEWTio0IIMJZj5+98gxD1gi
 9kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K+MVPxWZbeCtyCRtm3ATfNI0yj1uGx0up0wdJ5Dg9iY=;
 b=j7R3ThxXugj988X2LbL5GjUqxCF9LiGwB2S8I7cBFhsh1w/CW8L1g0LKu/OxOHCr/+
 EcAKyebl8yotyt9XXvvuP4MVBhTbS/tab4NTONfcSq28/3Y5evBiGjEqXc1mXkmVeFAe
 yhXPDO1kB8XyxFEn+05WUxOJGmyQ0LArcfdITZmZXS2CIeAR7jWN9WciQ5vFCKSyOVH4
 VThZMAhabDHaEtYRB02KRKq9dzCqT2T86UN6UCJ4v9WUz+ow5VURft4WDAVOcIDsBN/1
 SQkR/7z/UCjqBJEcAgnEknlrFDK0woW9yX4YIFaFMr1mMkW2AwhNypPycGvz7p/IdbmK
 X6xQ==
X-Gm-Message-State: AOAM5309lufi3eTMqU5L+X4n31UOxQZsRLaxf5eSmMUMWH3XbzydPQya
 jAW4gTkUn9DO+B8dZTvIYJ4yf5PEN/E=
X-Google-Smtp-Source: ABdhPJyPgHdEQThsfpCt3w4WS6EpxMfUNo7t/BJmVk+wgz7AtsMC2M0JbcZYe7IFdwONfc0lSsNJLQ==
X-Received: by 2002:a5d:9493:: with SMTP id v19mr884998ioj.34.1633563892947;
 Wed, 06 Oct 2021 16:44:52 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id s8sm12814102ilt.47.2021.10.06.16.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 16:44:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 17:44:50 -0600
Message-Id: <20211006234450.3228049-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to version
 1.1.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index ad216b0368..c1870c886d 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  a3fbf41851a6b5e1e823e8c18905877c  greenlet-1.1.1.tar.gz
-sha256  c0f22774cd8294078bdf7392ac73cf00bfa1e5e0ed644bd064fdabc5f2a2f481  greenlet-1.1.1.tar.gz
+md5  f424fbd9afeed575dd2ba5f0ac66e30b  greenlet-1.1.2.tar.gz
+sha256  e30f5ea4ae2346e62cedde8794a56858a67b878dd79f7df76a0767e356b1744a  greenlet-1.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index e9feec5321..7b983ff0ef 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 1.1.1
+PYTHON_GREENLET_VERSION = 1.1.2
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/72/7e/d8586068d47adba73afc085249712bd266cd7ffbf27d8bc260c33e9d6133
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/0c/10/754e21b5bea89d0e73f99d60c83754df7cc64db74f47d98ab187669ce341
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
