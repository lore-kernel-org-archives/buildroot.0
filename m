Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD59C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E539F41676;
	Wed,  2 Nov 2022 19:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E539F41676
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M78jReaOYf8N; Wed,  2 Nov 2022 19:04:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D22CC4163E;
	Wed,  2 Nov 2022 19:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D22CC4163E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A46191BF4E7
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F2434163E
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F2434163E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2bV1cj4iVa0f for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:04:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E85341635
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E85341635
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:04:03 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id w4so1357779qts.0
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RdUrD1P+8HCqJoVeR5+KOsiNI00DeH7Zp2bdF2HqwwE=;
 b=tgwljcualkcYnrmv2cMyQ59S10eLK3//aW+dDhGG5vCAZhi7Mqzeslk3dPLKpCu2bO
 2Je6jjPhi/zQCKUDMQqat8EvEzdFH0vTfKaraNvaD5cU93FsZx0ewJJJHh9bjzvjerFd
 LgRaZQ4EBqcUQcerEk6DB3wk/fdpw7qVR/O3c2Yy1QupHCrZ4aIlTBNeSprZwc6QHRoF
 100XWrU2VAFwpe5fiopjmkPJqt2LQgnNuFziyNvbnWXqtuMUnoVtk0SDTMslLS8wSOGB
 J2ykvutHK4Qo6oxzH8blr9ruoImyf2vQHhvH17Qgdiffu9LrvBw/Q11tY/NFxaCNpZwq
 m37A==
X-Gm-Message-State: ACrzQf3StScNNGvEDygxps0q1UvgdiiHohj0LEldPcSLxiQng5J12u03
 lYGMrxAQGJnpHQrg7RMwFx8jjlL4MozRwQ==
X-Google-Smtp-Source: AMsMyM6DTdzR6qq5VzXiUlcgyvLn6gQEadmOCBoegi6IK/93bBIrXDTUQEFpL1ImJItYLEBjYRIB+g==
X-Received: by 2002:a05:622a:100e:b0:39c:e7d2:21d0 with SMTP id
 d14-20020a05622a100e00b0039ce7d221d0mr21059998qte.352.1667415841373; 
 Wed, 02 Nov 2022 12:04:01 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q20-20020a05620a0d9400b006ec771d8f89sm8908163qkl.112.2022.11.02.12.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:04:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:03:58 -0600
Message-Id: <20221102190358.2614738-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RdUrD1P+8HCqJoVeR5+KOsiNI00DeH7Zp2bdF2HqwwE=;
 b=hyn0YavsDhAdyGpB6+Kx34dW4yw0N8Te/COSEHyjoDPM5YUvv79dMBEnlEWssRdieR
 HDX0knNlj7v7/yL3rDdmOZd8OGT95MTt565nL1JU4S7iyOIYY7inQl9umUYWrKG9A/kM
 1aRu5UAt+M845+3TfdaJwvc5I0njDaGvjXobgKrs8d/vCGwXxQ6fwafamDSh1U/Uu2o/
 c384EJ5tkt/bjwWveIBOp2+9UH0mTGqsjPjuSeusLjvpV5kyVd/tg6UAexC7ddHQSdZK
 zvwdHklwpQpxrZYMPEruNGjgQVaP7i/Ethj2nqgyn3kSJKWULd6yhcn4a34KM//bFPj3
 Rs0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hyn0Yavs
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.29.0
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
 package/python-botocore/python-botocore.hash | 5 +++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index bb806fe251..72e64f521e 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/botocore/json
-sha256  db6667b8dfd175d16187653942cd91dd1f0cf36adc0ea9d7a0805ba4d2a3321f  botocore-1.27.8.tar.gz
+# md5, sha256 from https://pypi.org/pypi/botocore/json
+md5  fae1e9ad89e12436ef65b8208febdc3e  botocore-1.29.0.tar.gz
+sha256  f25dc0827005f81abf4b890a20c71f64ee40ea9e9795df38a242fdeed79e0a89  botocore-1.29.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 459eefeab1..9d2a94b39b 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.27.8
+PYTHON_BOTOCORE_VERSION = 1.29.0
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/d1/b0/ea92703bbbf82353d571636fe6697b162c3881576986d6474119d03fce53
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/0a/95/8f31139077187f2da9132d7547979262376e19056d99c7cf6278431a53de
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
