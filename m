Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFD6C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 473E3402E4;
	Mon,  9 Jan 2023 04:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 473E3402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WeF-IEMtM5Au; Mon,  9 Jan 2023 04:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F47C40142;
	Mon,  9 Jan 2023 04:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F47C40142
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEFBD1BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6633819BC
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6633819BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cKsywLssvC2J for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:37:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB2881985
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEB2881985
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:37:44 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id c20so4379267ilj.10
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9vPMUyzM0fezRHLfkCygxjtSjjTxHTYmGdSJINGuVog=;
 b=61axHlXgOqdJrgakZlcUYkQjshMPB8nEIYyjmSS9/le1gvGAhwlT04hQe/J+z8+8zB
 AHvp8eyOMq+NInKRxrV0HAPaNvG4Vv8C7NHiiCja+wV3dAYafWXxf/45Fxu0w5WRnB+V
 Wp6fLj+7EvDLETDJ3ylSFdyK2kW06m8LKbGenPqXklAFWNFsp5aMriNd875lUnlzC6Iz
 Xon9Kg/w3Bz7XZXxYOATYAADVS+mGe6+g8AonLu5X+gi/0/0i4t3Jy24N+mVSh3YMn/J
 aaoJOvZpr1xLuRAWVrRP4xIDeo8MBx7EKmeuWaBhhuv/f7RN+MKFZIxLK5ycB8dPN1Xb
 0QdQ==
X-Gm-Message-State: AFqh2kocWE/DKLXAb1woEOHX+NSHV4a+mI2ZnnPHmU9/DTPi0Zz3Ctlt
 UFABdtTqmoKlmLI8J/eJtQd6Ty/9b8GIeSvN
X-Google-Smtp-Source: AMrXdXsw4TqtF7UqvttNrZ2t3cc0goreXrT5g6isqbZdt8msvMVANFi85obvd4sS2ihPs0QjfyVF4A==
X-Received: by 2002:a92:da42:0:b0:302:a58f:38ab with SMTP id
 p2-20020a92da42000000b00302a58f38abmr41086213ilq.0.1673239063435; 
 Sun, 08 Jan 2023 20:37:43 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 o24-20020a02c6b8000000b00389b36027a6sm2466051jan.92.2023.01.08.20.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:37:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:37:41 -0700
Message-Id: <20230109043741.2395333-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9vPMUyzM0fezRHLfkCygxjtSjjTxHTYmGdSJINGuVog=;
 b=M9GPRsPtgMqtzo8Uk44CeM83ELIMVetN30s1T6W0+fN22sdtc4u9SFUHJiPj9pDzG2
 2Xug+4yJ7OULHSBBpISTv03bzVKkvGGNGyg5dyS9XK27vuyUXPxnlonw1G495vBpIdzn
 k+ryWdf7cLYjGkGccXlYIwiKe29A3nFwg/leZB28RbbRMZ8FjDabkR0oPhZekaqxkcBq
 4rDganOWV+RZj1pNBFJSFJXItZ0zI69lpnyxHaStctaqByDVqMfPAqVxUFpPdDCrXhcS
 sVg1clFpmZ1lfS3l8CQJSOzmiGPf1PmI45Oey97LktWzT6npfrNmAkeJscvqMBPm34JQ
 VMaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M9GPRsPt
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 6.0.4
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
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index eae60af37c..568c320c53 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  b5875cf0a0578956dcfffc123d8344ca  multidict-6.0.3.tar.gz
-sha256  2523a29006c034687eccd3ee70093a697129a3ffe8732535d3b2df6a4ecc279d  multidict-6.0.3.tar.gz
+md5  ec06a613d871dadfb66f2be3a1f2f3fa  multidict-6.0.4.tar.gz
+sha256  3666906492efb76453c0e7b97f2cf459b0682e7402c0489a95484965dbc1da49  multidict-6.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  06a240ea10ba868fda2de58df859886961df873aa74bbab1e0f13eaf99f92b7b  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index bfffb84709..cd35dcb4cb 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 6.0.3
+PYTHON_MULTIDICT_VERSION = 6.0.4
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/b5/5b/1dd3b9cf73c474ea1d0f0b1f8b7b712b0f13817493fd93101256ec856b59
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/4a/15/bd620f7a6eb9aa5112c4ef93e7031bcd071e0611763d8e17706ef8ba65e0
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
