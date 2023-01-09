Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CEAC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D2160AF4;
	Mon,  9 Jan 2023 03:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4D2160AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1_ZXH63pkDa; Mon,  9 Jan 2023 03:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A5B060A7E;
	Mon,  9 Jan 2023 03:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A5B060A7E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7C81BF86B
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5873C81991
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5873C81991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hWmKQ2Jq5CB for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:15:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E3A48198D
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E3A48198D
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:15:57 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id i1so857556ilu.8
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JfWBTBiBWLYP3/11GYmIWiycimstSZxrpBsn8//LPuA=;
 b=128Mjep0+96DVD7bNp8lansiLT5kGtxbYjYM5ovK53tHrdlRrecDCWagfopBRECfZI
 W8QsuB2+pDWQz5XPjIvyRgk9DbbksbRu0wbQ4ZL0Qsmp2+SW2n5HEn/7cHuuBv01V6Xp
 O7J9utKGq5T1fYmELcbnVEVX7/hr681o/wXKk0alsZ6/3xceEoiw0m9t068B7L2HTUjQ
 ZXJmq3QhvebOjznp0bO8kKrZR0Lujh2v+pqSNVKAj2AFrR90gIlWDzhbXxpGdeTt/kat
 XzEBcVNj1cQLqfgkKR+1PGu6A6ZhLfdgeY4345XcDSkJ1of0ioHqj7do5Vtzb58kSAWn
 gn+g==
X-Gm-Message-State: AFqh2ko0EWDbCOvEBKBGzd4h4y8WZnHRZmx84GbB8QbrqZwOOywK4Q+j
 fUBjrtbZDC8R1axcOFCaLmttaDgPzTAnSg==
X-Google-Smtp-Source: AMrXdXsZVLYtR2Is5RyRGNUhb+E3EJ8bMEYaqv+D66Qp13/HGwPWxbdNApgeZ7K/lBBoc5xruqoRbg==
X-Received: by 2002:a05:6e02:214e:b0:302:db15:3981 with SMTP id
 d14-20020a056e02214e00b00302db153981mr56212751ilv.27.1673234156365; 
 Sun, 08 Jan 2023 19:15:56 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 e61-20020a028643000000b0038a56fc3ca9sm2462862jai.124.2023.01.08.19.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:15:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:15:53 -0700
Message-Id: <20230109031553.2036756-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JfWBTBiBWLYP3/11GYmIWiycimstSZxrpBsn8//LPuA=;
 b=D6HNskk+9EJ39cbh3aR2q4ZfjT1xM/2qv/UvnqrnklkwbZeAiopKcSTqrXsSPm98L8
 Di+VHFTKyiu+4EQDkmDlM5RKkX9qPh2nQoMZXbmCsgZzcr43ODEyNVRav4IBIP7oMYI7
 jkUlUTzYxuTc/7OGQQnTLWD1h8umJaGOQunf2gxTAtXN2j20x3UrsgI4PvFbF7w1K0JS
 0t+HAOsolJEQr3rhtQ2KCvlHSYR2yYtEqICfrGeLxlOxaQGnC0iU0zDtfIX08koIUBZs
 +0SM7htWhqsvMBL0erp7jxx74mrQ7Oo4uumpgGtPV7EqnEfKBxFlcULJj8PJp3qmk6xk
 CiQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D6HNskk+
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.26.45
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 60fd07681c..eecc87ab2d 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  9d5447419233a259b3ade6fb86d86cb6  boto3-1.26.27.tar.gz
-sha256  255a7565226c21c5d500f69aabb977e1ac07dbaf576f4428d00558e8e508a23b  boto3-1.26.27.tar.gz
+md5  e3777333a201a2511dd7c814782fe9f0  boto3-1.26.45.tar.gz
+sha256  cc7f652df93e1ce818413fd82ffd645d4f92a64fec67c72946212d3750eaa80f  boto3-1.26.45.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index e40ac92f09..4d8fe58701 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.26.27
+PYTHON_BOTO3_VERSION = 1.26.45
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/62/7b/7cdcb980d9d90c910a6abec2cdee0ff6aa7a3d8afea4044ffd968d5c107c
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/f5/5d/62bfcda02d90699d41d5ff2573f88b5555354fb87308e8a3427fef3956c5
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
