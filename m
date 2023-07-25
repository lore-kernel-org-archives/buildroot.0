Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4487C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E6DC416D2;
	Tue, 25 Jul 2023 13:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E6DC416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOu-2cXpOgEw; Tue, 25 Jul 2023 13:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D83340155;
	Tue, 25 Jul 2023 13:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D83340155
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC44C1BF3CE
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0A1740155
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0A1740155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2QUwZe3D0Hi for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:21:16 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A27A400CB
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A27A400CB
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-78666994bc2so207683239f.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690291275; x=1690896075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bIFbAxBPvPhF4oNs+NU0eteHQymfCDGfGwKkhuBOZzA=;
 b=dEaZsm0vmLypMfCXbimbQQSreicVYsES65yXouiUls8EJ40jbVrQ8zvTiYykc0Q3+c
 GzwOd6jaqyEmOdjbQeHxQRKuJJHBS2LXK5XeT07nngWB/OJvD2PwGu4m32qvsNDnh7Ww
 Jn+knaOKiTmKRSwirgnCZhTJ556uq/53xyw2tkp/kJnR1QxyoLHNpmDPonQfKQHvxmaa
 gRxaUz8hpOqasFtc68PgL8hqelgry1LncI2PF7zly4/farERHPCNG8TDsJvT5EKJ+b3J
 ZcdG07irkFXtNNSz3SdinTvTcKLjk/81RBJ5+qb1mLDd1LKfhuSJX1bEr28eG/dBflg5
 KwHg==
X-Gm-Message-State: ABy/qLZzhZTkMADtdJsRvBZCjk0Ki8JUfLa5HnglHRtEeUfeN08JEJGs
 rYxjMQarhqHwrD6iZEaJSrFXEg9QB50=
X-Google-Smtp-Source: APBJJlFPy5VqxdgnAK9CTMoZTiJ5byk9nJldBHASxhn2JYuqMfgAFC7hzN5zzK+mc7dduhVxyb4iDQ==
X-Received: by 2002:a5d:8957:0:b0:76c:8877:861d with SMTP id
 b23-20020a5d8957000000b0076c8877861dmr2720457iot.1.1690291274850; 
 Tue, 25 Jul 2023 06:21:14 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 z4-20020a6b0a04000000b007836252a084sm4093356ioi.48.2023.07.25.06.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:21:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 07:21:12 -0600
Message-Id: <20230725132112.134227-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690291275; x=1690896075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bIFbAxBPvPhF4oNs+NU0eteHQymfCDGfGwKkhuBOZzA=;
 b=syGANCHl5a2RzPomCX4iq5KOxzvuXjjO8Hju2NbPFQnuKaB/a+TErBf83kxW/yECsl
 MT4NjU4p7zGmdui9yeNYdOXC521Zgy4Vkuct/MWj9Nog0uCskxJzCPth5l1gV6zjojHu
 2WwEe6GNFErP+iUJ954sLDWQgNltsNf+/djZy+Bh/+BgSRJ5s9oLYvgqiE64SrYtB9vq
 h5ywsBNX5v9qTdl1BZjxV2WTvta46Nksgkg3sGGLwsLsC4cpyiPKI2KCOY27fe4F9A53
 tMgCWCDMOp+al4v9m4lKW4DMWrs3m9YVkEi3eGTLSVAHFiJBU7Kreq4c+Ta8JyzwnyLV
 XN5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=syGANCHl
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2023.7.22
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
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index d3cf24ecfa..fe0748adb8 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  d00966473b8ac42c2c033b75f4bed6f4  certifi-2022.12.7.tar.gz
-sha256  35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3  certifi-2022.12.7.tar.gz
+md5  10a72845d3fc2c38d212b4b7b1872c76  certifi-2023.7.22.tar.gz
+sha256  539cc1d13202e33ca466e88b2807e29f4c13049d6d87031a3c110744495cb082  certifi-2023.7.22.tar.gz
 # Locally computed sha256 checksums
 sha256  a02f6c638f9fb84d06f7764c3ab085d8af7eda5b93c166da54312479077c6fb0  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 70f9e69d2c..9b5f853682 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2022.12.7
+PYTHON_CERTIFI_VERSION = 2023.7.22
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/37/f7/2b1b0ec44fdc30a3d31dfebe52226be9ddc40cd6c0f34ffc8923ba423b69
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/98/98/c2ff18671db109c9f10ed27f5ef610ae05b73bd876664139cf95bd1429aa
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
