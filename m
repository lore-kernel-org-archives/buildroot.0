Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C63AC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DC9642C4C;
	Wed, 10 Jan 2024 04:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DC9642C4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ROx6meCjclHg; Wed, 10 Jan 2024 04:19:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29EC42C47;
	Wed, 10 Jan 2024 04:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E29EC42C47
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6ADC11BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 401DD613B7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401DD613B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfusBGmrqr22 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:19:34 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53A4C612B4
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53A4C612B4
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7bee328027bso40943139f.1
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704860373; x=1705465173;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ocwZrlz+O36oJllqKH4wqGjohV2+CEd8J2Dr1H78a0=;
 b=RWdWy7NIH/zTdvx7KpXeDH6GrD1QU8OCy9jW08jzNBGjSAjk2jLzm921WEQhyMgI2w
 SuCE8ggAKDz1Ri7ytYLzFfQhP9EomMXPnFdkIHCFIFbty00cCmOwuuzOtmX1gOeKRP6e
 mCtXDSM+/d81dX+Zwzumk0O0+IctpmIhmz/LpIexolC059FN4WqmTvVw1Lf/im0TC/AL
 xh8QXA7g3upFN/UUK0vRvFjnjEU+NaunFo3Mz4FodVyB+euo8+vj4tOETElCXjhU7cwg
 MXxnCZIRG66GE6pj6leh5S8hth5DSPOt5KZVQlQJQu0Za5f7mskr/5IJv3TdUyGQ4oMZ
 rqJg==
X-Gm-Message-State: AOJu0Yy01jiiUVckYh/mAchTzCx14zGLM5d15P7DQr568HazG6Dq2pFW
 Qp7OJEFEhR63SPiES7+a0qnYx86rSRsO+w==
X-Google-Smtp-Source: AGHT+IFaNqjSXsf3WyD/5tVjFKlxglLFfQk2E9YA7m7EYpzRICSBfrNvAmpGq+Nx7bXIvVxYo1gRow==
X-Received: by 2002:a92:ca09:0:b0:35f:f65e:111b with SMTP id
 j9-20020a92ca09000000b0035ff65e111bmr858622ils.58.1704860372945; 
 Tue, 09 Jan 2024 20:19:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 u10-20020a02aa8a000000b0046dda6b83c1sm1070593jai.25.2024.01.09.20.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:19:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:19:30 -0700
Message-Id: <20240110041930.1037925-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704860373; x=1705465173; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ocwZrlz+O36oJllqKH4wqGjohV2+CEd8J2Dr1H78a0=;
 b=NBnbclkgEUhhmezX/O9wzCEIOQ7jmu5ddr4qbaLE/QrOytKgZihNBNDAUdWPUN1yCR
 Au3Cbs9A3GvkhScqcXNBWK1KWqh95m2p00KZ/C5HeXC3p4nhdX19BEGg/uHhHTsLQGnc
 0RTIVq87XKSJxeWd/DRF79Cc0KtpAaeAFHVdp9NwCudztYcfmkOVEdKv+JS6WBMyGFzm
 pq8eSFJtM71oPAZAqnBXugOmbgtIXqncSJxzRhv4/a7XyF7FssY9zWB807DeQYXZRGeQ
 W9rb2dHFNAjxT4xxqLadADviI4VyhZ75XNt8P4Wi4PsGEerhPlA1N0fDomFAA9qRO6fE
 FlKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NBnbclkg
Subject: [Buildroot] [PATCH 1/1] package/python-pathspec: bump to version
 0.12.1
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

Migrate from setuptools to flit build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pathspec/python-pathspec.hash | 4 ++--
 package/python-pathspec/python-pathspec.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pathspec/python-pathspec.hash b/package/python-pathspec/python-pathspec.hash
index 01177b7428..15283e3ac2 100644
--- a/package/python-pathspec/python-pathspec.hash
+++ b/package/python-pathspec/python-pathspec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathspec/json
-md5  92ebd6d735d261952ff99d64083eeff4  pathspec-0.11.2.tar.gz
-sha256  e0d8d0ac2f12da61956eb2306b69f9469b42f4deb0f3cb6ed47b9cce9996ced3  pathspec-0.11.2.tar.gz
+md5  2b26ad1981bfa23748e115f00085624c  pathspec-0.12.1.tar.gz
+sha256  a482d51503a1ab33b1c67a6c3813a26953dbdc71c31dacaef9a838c4e29f5712  pathspec-0.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/python-pathspec/python-pathspec.mk b/package/python-pathspec/python-pathspec.mk
index d32b6a56e1..c4cb34b4c3 100644
--- a/package/python-pathspec/python-pathspec.mk
+++ b/package/python-pathspec/python-pathspec.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PATHSPEC_VERSION = 0.11.2
+PYTHON_PATHSPEC_VERSION = 0.12.1
 PYTHON_PATHSPEC_SOURCE = pathspec-$(PYTHON_PATHSPEC_VERSION).tar.gz
-PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/a0/2a/bd167cdf116d4f3539caaa4c332752aac0b3a0cc0174cdb302ee68933e81
+PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/ca/bc/f35b8446f4531a7cb215605d100cd88b7ac6f44ab3fc94870c120ab3adbf
 PYTHON_PATHSPEC_LICENSE = MPL-2.0
 PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
-PYTHON_PATHSPEC_SETUP_TYPE = setuptools
+PYTHON_PATHSPEC_SETUP_TYPE = flit
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
