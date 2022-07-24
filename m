Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692FBC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E27C040B31;
	Sun, 24 Jul 2022 02:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E27C040B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUyNGPbZafEj; Sun, 24 Jul 2022 02:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55F7C40AE4;
	Sun, 24 Jul 2022 02:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55F7C40AE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B6C31BF4E7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C096C4246E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C096C4246E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXl-SKikT5Re for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:47:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A2B14246D
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A2B14246D
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:47:37 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 e2-20020a4ab982000000b004354ba9a591so1554066oop.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ph1AXxh7m7ZNR2jQFnjNwlBHnr/szxrO2h3pHgQ+LvE=;
 b=Jf6bKKOi3TA+1Dp9jfIekXih89yRoOfGqjB0f29PFIDvDa0/4f0ixDSLnnSS+lkGCD
 D+TcLu7GRJTP7VC7Fvr/PnkmSzpBM1NwT7Cs6czNGCce5cR/bfitrvaNhPhTyCc4xvCw
 wISPRb4/efnU/vRvFwfxp/NBOnCG0omb35/BiX6NSd/ypRThHLibhShhxi6sae9vh+GZ
 Hzup/DzKfXoBHv1lDQNEApWwRiScmB6XVzsKf8O/U1gx5k9W6rnEuh9bEx6UCHbYuPfA
 8xCsUy6gKif5eUu1Ac6WZs3Sul5TbXp11WwKumeXh5JtJb0AA+WmeCdxxM3qWxK2iUqr
 t2RA==
X-Gm-Message-State: AJIora+pOz2S3QIyDDAijLqqHyuuJEN1kEcddZl3oeXW/gJIFjF72qYb
 mf+MTm+98DO6xM8W1efAMVtCdEA43pxYSg==
X-Google-Smtp-Source: AGRyM1sEFp9rWOdVFcUNjNlKtUDl9akmVTpdavmFaDroVAkCVIWlVlVoqXo2GiVHj/NAbHLq4fNenw==
X-Received: by 2002:a05:6820:814:b0:435:a1e0:5803 with SMTP id
 bg20-20020a056820081400b00435a1e05803mr2357773oob.84.1658630856206; 
 Sat, 23 Jul 2022 19:47:36 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 w138-20020acaad90000000b00339c7af0e8esm3384592oie.51.2022.07.23.19.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:47:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:47:33 -0600
Message-Id: <20220724024733.1035224-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ph1AXxh7m7ZNR2jQFnjNwlBHnr/szxrO2h3pHgQ+LvE=;
 b=l7C9EdKsC24IBD7k8308l4FFZK6ywK8nDFWAniOOpRd0Iz8NZQQl9OXorKIVbspVme
 HQc874Wuuy8sduLlqr9oB0qjVezwbjIlPCbO+JrZZI6ujFVfkVm7BBTxr85Vau/disUw
 V1XrpReS7DQcR8oH+Tycs3GPy+UG8WOaNc1q3Pod/SDhw05fekSB0MlkIUoq17CP8SwZ
 sfxikQW93pmdxs3aYNSzwix00vqwT/43HUqeonbVDAJR+8nObujJdsKTvRaqIkBOkugA
 VTEnthRciVA67U5DmBY7FWuGd/1/RV9JSrGTwXvYxnrIgmPLBOJHWglq+dB2dG2nYPuh
 Zqvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l7C9EdKs
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 63.2.0
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index bb7d6e5587..e01350124c 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  cfa521312f6ac49b2fda5640df4f8f6d  setuptools-62.6.0.tar.gz
-sha256  990a4f7861b31532871ab72331e755b5f14efbe52d336ea7f6118144dd478741  setuptools-62.6.0.tar.gz
+md5  d72acb93671bde8e4ca0971866f9cdda  setuptools-63.2.0.tar.gz
+sha256  c04b44a57a6265fe34a4a444e965884716d34bae963119a76353434d6f18e450  setuptools-63.2.0.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index e49cfbc022..082b293eef 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 62.6.0
+PYTHON_SETUPTOOLS_VERSION = 63.2.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/dc/73/88920663229023b724a854d1ab7e3e50a1a28b63eeec399a604ba30f9242
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/0a/ba/52611dc8278828eb9ec339e6914a0f865f9e2af967214905927835dfac0a
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
