Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF99C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75CDE81852;
	Sat, 10 Dec 2022 20:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75CDE81852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1FE84GvaWFeW; Sat, 10 Dec 2022 20:20:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3A7781815;
	Sat, 10 Dec 2022 20:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3A7781815
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63A7E1BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3864040292
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3864040292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuJ6duuwvzYN for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:20:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5473E40239
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5473E40239
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:20:01 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id h15so1556392ilh.12
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CpTLrh62jXN0d7d9O3edcpLmGmccUe/zlIQRLkRSIUM=;
 b=pnVQdY1K+I2oG+Y0n8U7t0QNtN4Z2Pc5d59mcZECrP6kVch1GLjsNAdEMvs91FqZr+
 o6aDaqq94YzOkjjybncp79UnXhjdBsQg7asq8uMrFj62r6nSnQgTAeZuXYzZailnfZYV
 TcMBGHCxNJt9tiWn60HFlJdt+dLkLin6BXzgkZkM0jikHSF/QrIUbtULZ+2YswQ5EuhV
 6VqYLlBSuoZnNoihQG6apnSasRuXkbUsbLAyIvgLdyXV/ffuxocJ3QCozX5+Pg1NMOqI
 8TpTGtBonhRJTMHQn4pqO39/cqwuXjQOksDBafRk2reEU2MxVCI4M0Q1Hz58XTaEK15U
 sDXA==
X-Gm-Message-State: ANoB5plypZEnt6RhCvFBz0MsjGbxJKWSkZ0VGo5mbgKipNUfo2S1Ry6D
 AY/ubOCrxY2srsuekkLqRXiupQYAugIGH6su
X-Google-Smtp-Source: AA0mqf4KiTOXYUNLUucgjkIMCi8rWppvLxNdZEIoMV55vU/qxbxs/8CL/lF57qtf3ux/ZhWWzD33QA==
X-Received: by 2002:a92:d2d0:0:b0:303:581a:92b3 with SMTP id
 w16-20020a92d2d0000000b00303581a92b3mr6686889ilg.1.1670703599970; 
 Sat, 10 Dec 2022 12:19:59 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 o3-20020a027403000000b0035678e2e175sm1615234jac.50.2022.12.10.12.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 12:19:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:19:58 -0700
Message-Id: <20221210201958.3524816-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CpTLrh62jXN0d7d9O3edcpLmGmccUe/zlIQRLkRSIUM=;
 b=qWjO4Ovkvkc8OMFDe625+KFz2+uc6ectckUNhUXS/J3yIOqEUN/REfhY+nbNNyyvMN
 8hso7uLJ95+z7YNO2fNGr+LG3B34hmnJKxzV0M2ccL0HIpPu9rNWuWClUDMDIN1TjWZs
 m8a5cBLu3Jlb2vrTMGxN9infQQ6TSxhTe18CLy9LXdIwvuPx/XXsvinXFi9dTtWo5ZC8
 qStVWyt7Bz05mCiIC+C0Ja8IZC56cuIVqChQdQVfuCaW0VGphnM0PBDX3ueFhgeDSt6J
 c9u+lfdcQpeCMJ/3mpiHUHQucvBNw+IqxBx3/M+Av8etM/YzNKL+wHqlqJH1WDkLATgV
 v2+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qWjO4Ovk
Subject: [Buildroot] [PATCH 1/1] package/python-redis: bump to version 4.4.0
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to syntax update:
https://github.com/redis/redis-py/commit/2a0405d07e20ac7f695ff67415ad6c8368fd6066

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-redis/python-redis.hash | 6 +++---
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 9465e251f8..209ff35b78 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  15f05dbef3d166c6244f7afa6c3cacf8  redis-4.3.4.tar.gz
-sha256  ddf27071df4adf3821c4f2ca59d67525c3a82e5f268bed97b813cb4fabf87880  redis-4.3.4.tar.gz
+md5  4ab691af57ac346c2e630ce2787a424f  redis-4.4.0.tar.gz
+sha256  7b8c87d19c45d3f1271b124858d2a5c13160c4e74d4835e28273400fa34d5228  redis-4.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
+sha256  7801a39e3a1aec58a7ea7c9f4dc1238cf0922c36a1fc8eff0bb7d684ff6dd354  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 7c18f31507..bbbd6f1df2 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 4.3.4
+PYTHON_REDIS_VERSION = 4.4.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/8f/d4/78ef2d3f316041fa6c92daa7ac2c8056c39858c3775fad35fd84b9b3a6fb
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/7a/05/671367bb466b3301bc4543fdad6ac107214ca327c8d97165b30246d87e88
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
