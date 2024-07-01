Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDA1C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6384180EEE;
	Mon,  1 Jul 2024 18:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g93UpU3-_WIZ; Mon,  1 Jul 2024 18:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DDBE81EA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DDBE81EA4;
	Mon,  1 Jul 2024 18:47:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36B891BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D12181EA4
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhCQBqYTJo_s for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4336680EEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4336680EEE
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4336680EEE
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:47:17 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7e21dfbc310so124565539f.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 11:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719859636; x=1720464436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YUH2KDs95ns5KYLBahFKDc+OvhzxtP9kqfPOqqN27ls=;
 b=Uq26164D8iKjgaW5td3/SNKWyiAj4c7I4Blp1RZbAlsHScqSmcknlOupKTVR8G2zMc
 5pggSuOfq5R/BwxWPqf1Y9NYlsBDSKdkZpvT7T59yFwr99pqlimUANE8ZAIR3gc0U2gu
 Zd92UpTiRPZ0gFH6OMKTsxbC2PjBM1/V0tmCNcLCw39+eNsxtU/1Gj4RY2cAk3UnNnrh
 tZlNabXUo3+YxqCAEZJKVvBl/lqYryD8zkdp8E1EPYQGK0UwOyTxnrvwDknD8nUh9ez0
 E8s0Gsv5WEnNSTzvjW1IiaxtNgzlzXtorWLFPCueztSVFxf7uNacg+/PsHv0D6Mb0+OY
 xxbA==
X-Gm-Message-State: AOJu0YzHWtaCpg8TE3hxclxd+KDcSq9HQrfeY8CURu6yGGV1Or/usFBR
 GJUHIxIlog1cAHxfDxgNrB5clo/eFRhiQwg8rbEyG2yMAwPX5TmVcVGf/w==
X-Google-Smtp-Source: AGHT+IFyU6t5slj5sexja47voLEs61kxWbabUo6sIMEB0Q26psptZTItYKPCDRjSrITU6H9G2tQ9iQ==
X-Received: by 2002:a05:6602:4f:b0:7f6:2c61:a419 with SMTP id
 ca18e2360f4ac-7f62ee74934mr699567839f.13.1719859635914; 
 Mon, 01 Jul 2024 11:47:15 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73f96e89sm2287346173.117.2024.07.01.11.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:47:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 12:47:14 -0600
Message-Id: <20240701184714.1751575-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719859636; x=1720464436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YUH2KDs95ns5KYLBahFKDc+OvhzxtP9kqfPOqqN27ls=;
 b=VIIdlo2oKcPhVnBi1w1Fb5eob4tanFuavX1p47Fif74IegmdmabS5TrpBdzIEfnm6J
 SsykiUdO14l3YmbV6DoYoDC4vB4kvlGzjPZRlzpTp4blM5eXocYucSIhZvVbj+ksB1Hc
 s8CJ3iUaC9zX7YMx7ForFvAF176Y++BJfTN8b+NpyNmAxmwsHqSCWB3XADoa/Gvm1O/x
 UnKnGsgzKm9+hKo7Srq2dzzEQCStIE8VjGme2lRT+7gX+bOMCrba4vYxXYhWlYuwgd5d
 rBdm01HnFhevSyE5CnlnwHT1NopOPlNZVXK3s88cSlegEU578tM3RYshoYHje31Huy37
 nxLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VIIdlo2o
Subject: [Buildroot] [PATCH 1/1] package/python-itsdangerous: bump to
 version 2.2.0
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

License hash changed due to include format change:
https://github.com/pallets/itsdangerous/commit/9a25d989cd65c4991c2c8ac46ef55e0e8dfe49ab

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-itsdangerous/python-itsdangerous.hash | 8 ++++----
 package/python-itsdangerous/python-itsdangerous.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-itsdangerous/python-itsdangerous.hash b/package/python-itsdangerous/python-itsdangerous.hash
index 071544e5bd..1cac9a5607 100644
--- a/package/python-itsdangerous/python-itsdangerous.hash
+++ b/package/python-itsdangerous/python-itsdangerous.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/itsdangerous/json
-md5  c1bc730ddf53b8374eaa823f24eb6438  itsdangerous-2.1.2.tar.gz
-sha256  5dbbc68b317e5e42f327f9021763545dc3fc3bfe22e6deb96aaf1fc38874156a  itsdangerous-2.1.2.tar.gz
+md5  a901babde35694c3577f7655010cd380  itsdangerous-2.2.0.tar.gz
+sha256  e0050c0b7da1eea53ffaf149c0cfbb5c6e2e2b69c4bef22c81fa6eb73e5f6173  itsdangerous-2.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  63af09891b6be8ad1a4252ed43af0f4efba7fc948e228367bed7f3c5ae0b09d7  LICENSE.rst
-sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
+sha256  63af09891b6be8ad1a4252ed43af0f4efba7fc948e228367bed7f3c5ae0b09d7  LICENSE.txt
+sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-itsdangerous/python-itsdangerous.mk b/package/python-itsdangerous/python-itsdangerous.mk
index d7a1344e0a..5fb2919c97 100644
--- a/package/python-itsdangerous/python-itsdangerous.mk
+++ b/package/python-itsdangerous/python-itsdangerous.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ITSDANGEROUS_VERSION = 2.1.2
+PYTHON_ITSDANGEROUS_VERSION = 2.2.0
 PYTHON_ITSDANGEROUS_SOURCE = itsdangerous-$(PYTHON_ITSDANGEROUS_VERSION).tar.gz
-PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/7f/a1/d3fb83e7a61fa0c0d3d08ad0a94ddbeff3731c05212617dff3a94e097f08
-PYTHON_ITSDANGEROUS_SETUP_TYPE = setuptools
+PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/9c/cb/8ac0172223afbccb63986cc25049b154ecfb5e85932587206f42317be31d
+PYTHON_ITSDANGEROUS_SETUP_TYPE = flit
 PYTHON_ITSDANGEROUS_LICENSE = BSD-3-Clause
-PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.rst docs/license.rst
+PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.txt docs/license.rst
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
