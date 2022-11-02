Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD13CC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D7881E6E;
	Wed,  2 Nov 2022 20:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59D7881E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Cqw5pQj9HUQ; Wed,  2 Nov 2022 20:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77D2881E07;
	Wed,  2 Nov 2022 20:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77D2881E07
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59C151BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35ED360F6C
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35ED360F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfLKG2-Kft42 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:19:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4797D607D1
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4797D607D1
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:19:26 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id z9so17612ilu.10
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B+v9xb94aGvF/W8fwAeWhLrUeK207OU/O5C+ZC4ZB24=;
 b=jVWj1b0hqnMqZpm6G8nnzE2bkhXyvreOQ5XONAhgX6R+7b2nJe7B9TJg6sTI8GlQqU
 hEnZOYaUH/4Yi6eAimKNFy5rnq2Pq1wVRti3OloheTsHiO255gFUA1/mbcJ1hYOgpxEj
 iu5VDF99krnP7u7wkwgNlAf4PPQqeBMODhSBREwoKoCutHFXLU27HEct4Wz9weJuJBBO
 nHqlaDzwvOOwqa8M4fRC+lN38datXUp+Gj+gIS3mYZicFSB5dd4aKvS5LfWxE/c/SzTP
 jmRFc+CdIOWfl9VJtBeRhMmb3BbDYrCGXbNRQidzNDM0ib13PbuIdYB/60jhMWL6YNM9
 NTEw==
X-Gm-Message-State: ACrzQf1RlTOvlhQn22djIrcTeqTPtwjvxDwzPR3SY9G4S8RAyS6Hbloj
 XjhCsKbtBVa61ENXhNitZ7cnF/tzDOIBcQ==
X-Google-Smtp-Source: AMsMyM4jmX9Ca3d/WV8K+gNySKnHFQx0rtoQpcgJwHQbjD/QihqT5+byM+r3KLZ6trVrUTXDUWsTLA==
X-Received: by 2002:a05:6e02:1a62:b0:300:59b0:8a8b with SMTP id
 w2-20020a056e021a6200b0030059b08a8bmr16735817ilv.31.1667420364892; 
 Wed, 02 Nov 2022 13:19:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o17-20020a02a1d1000000b003750cd6e9f2sm5106104jah.177.2022.11.02.13.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:19:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:19:22 -0600
Message-Id: <20221102201922.2652296-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B+v9xb94aGvF/W8fwAeWhLrUeK207OU/O5C+ZC4ZB24=;
 b=n0F0JH6HTWTZZiu4kGxGzPdRHqED0xzGjnnsdSy0bNUUvDXDtXVRFUj9+QcdWsI91g
 F1lcqHQKT1rVGa6z0U5ITD1+iGdAxTWtNGWOk34MwQ2ZpHaSA3U0gLfj3xuW3CbyjZe5
 2MGOrPYaKpRH/ajrABOf/biro6ee4iFtK4po46My5dudBvKTi7B9VQ2xr9SLsNTfcx4r
 IyUaZ3bxK7zfhGpvqWiOh/2FfKn3sfhjLjOgmZoxlFI/UERGyhNmckYRWnZhdYiKWO3z
 BX487rOQ7BBClZZ7K4YlbAr2esQeWKKmVREkDSH67FylE/2oy7W1A7lkvkqL+L70yAtD
 b9Qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n0F0JH6H
Subject: [Buildroot] [PATCH 1/1] package/python-ecdsa: bump to version 0.18.0
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
 package/python-ecdsa/python-ecdsa.hash | 4 ++--
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index a082d30b0f..382cccd47c 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ecdsa/json
-md5  d0dd59c43af0f640a60599551529f5d0  ecdsa-0.17.0.tar.gz
-sha256  b9f500bb439e4153d0330610f5d26baaf18d17b8ced1bc54410d189385ea68aa  ecdsa-0.17.0.tar.gz
+md5  cbca26ec29cc50e32e8b070aa2ec0786  ecdsa-0.18.0.tar.gz
+sha256  190348041559e21b22a1d65cee485282ca11a6f81d503fddb84d5017e9ed1e49  ecdsa-0.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index eda35616de..d3d49c2520 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.17.0
+PYTHON_ECDSA_VERSION = 0.18.0
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/bf/3d/3d909532ad541651390bf1321e097404cbd39d1d89c2046f42a460220fb3
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/ff/7b/ba6547a76c468a0d22de93e89ae60d9561ec911f59532907e72b0d8bc0f1
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
