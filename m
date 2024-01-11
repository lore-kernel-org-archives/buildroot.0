Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F194C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 07:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFB7A40549;
	Thu, 11 Jan 2024 07:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFB7A40549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iP3b-qGa4yIT; Thu, 11 Jan 2024 07:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEAC840102;
	Thu, 11 Jan 2024 07:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEAC840102
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B3C21BF2C7
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DCF340549
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DCF340549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FFAkhAsxRsmJ for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 07:32:30 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB97740102
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB97740102
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-36091f4d8easo16079825ab.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704958349; x=1705563149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hqI0QlJGWsQb2oLHP3Toybv56sgTg12lrQ5QaVRD6Bg=;
 b=PqfY52Ov0EGuwx6n+Y67bpdUXAm+2in/jQmSB2JcHj5g6OKRdHb+2mzIz2mmHDnw1p
 BIjVFR4bzbq57/+G/sEGQly/pNhuWSknfdvB7TBwmGlGDvU9o/WeNETUir+02Wi9oK6Z
 jK7L56dxj9L2Ney5I+hKm3eaSCJvnixVylYlmnSpX09JkDZivymTfyXldNPMacr+qj2w
 sTlkJMiyS3+mp5blXyN3sunRqcwyx0IQYH2gmP1sPPeWAP/GsR7y8rXyxTmHxE9dEx+K
 Dj1LO6eI60Ju2gmueW4JKaKrAp3R7hI+tKt58SMl3iFTqbycieR8c8Wfru8rJWIa1Pkh
 HTJQ==
X-Gm-Message-State: AOJu0YzmavuJauDDVby0ea9XZgqbiU1E3isNdcFNh3WZcnyKd3OittV5
 P/MRDUEzUKOPuaYtppqGtis27DYSYP6pYw==
X-Google-Smtp-Source: AGHT+IE22rRd2mdWaDOaAn7IVzL90tTwaI4AqiDt7fo6GhHyGCx8qZTBboNw1oYu+NL/dtbjJaO13A==
X-Received: by 2002:a92:4b09:0:b0:35f:ec66:154e with SMTP id
 m9-20020a924b09000000b0035fec66154emr848142ilg.64.1704958349221; 
 Wed, 10 Jan 2024 23:32:29 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cv3-20020a056e023b8300b0035fb30380bcsm126499ilb.58.2024.01.10.23.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:32:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 00:32:26 -0700
Message-Id: <20240111073226.3084555-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704958349; x=1705563149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hqI0QlJGWsQb2oLHP3Toybv56sgTg12lrQ5QaVRD6Bg=;
 b=g9XOgPKxcDHhjhhRdu/Uqw9TWJdQtMDXM3FxSRK5q4MSOyzrqsq0QwG+xVU3TpgcdD
 IXsVDClwIlJliOOD5ot6o6flClpC+8/lnum2xYtbiPmljqte+nUpYaYb2QewG8VrIFTj
 YN5+s0bv0I12F/LrTSBGFuX2Glm33vxaPttdENigVKblwrc5k1HL//xJdiugc/rYLiJM
 1ifNEqbDbf+4rN95EMFOiSXp4AAYMpt/uKdfjGAEdj8qbXjYk+P3hoWexvUKc3g7j9HZ
 A9uaBuGBA2trP90SsNlXxBELasGBY+UhtVdahoSNdXPpTIYI/NnstQS7mCYwr4b0HUFm
 WQaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g9XOgPKx
Subject: [Buildroot] [PATCH 1/1] package/python-tabledata: bump to version
 1.3.3
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
 package/python-tabledata/Config.in             | 2 --
 package/python-tabledata/python-tabledata.hash | 4 ++--
 package/python-tabledata/python-tabledata.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-tabledata/Config.in b/package/python-tabledata/Config.in
index 9947f41af6..3ee3057a39 100644
--- a/package/python-tabledata/Config.in
+++ b/package/python-tabledata/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_PYTHON_TABLEDATA
 	bool "python-tabledata"
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
 	  A Python library to represent tabular data for
diff --git a/package/python-tabledata/python-tabledata.hash b/package/python-tabledata/python-tabledata.hash
index 3613589ae0..19fd4ea9c5 100644
--- a/package/python-tabledata/python-tabledata.hash
+++ b/package/python-tabledata/python-tabledata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tabledata/json
-md5  1874cb0bf69cbc824a7bec67431023a9  tabledata-1.3.0.tar.gz
-sha256  54541b0c9e58f8fa38251ea0a60965dbaf95737027fa80e6ab56f98d7e4d61e9  tabledata-1.3.0.tar.gz
+md5  579c4e7454a837d252d4977b73556aae  tabledata-1.3.3.tar.gz
+sha256  c90daaba9a408e4397934b3ff2f6c06797d5289676420bf520c741ad43e6ff91  tabledata-1.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
index 48f544b115..43e22d45d1 100644
--- a/package/python-tabledata/python-tabledata.mk
+++ b/package/python-tabledata/python-tabledata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TABLEDATA_VERSION = 1.3.0
+PYTHON_TABLEDATA_VERSION = 1.3.3
 PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
-PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/ed/ed/dd0d6975963967492ac2c230107587593c7bd94acfa802b0c60a5395125c
+PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/48/6a/7f78fbf883f325b70ba9ce5c10d97652f5c371e224940097c2cea9d0f456
 PYTHON_TABLEDATA_SETUP_TYPE = setuptools
 PYTHON_TABLEDATA_LICENSE = MIT
 PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
