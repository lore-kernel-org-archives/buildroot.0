Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424B9C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 04:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9597482A95;
	Tue,  9 Jan 2024 04:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9597482A95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04NPMpkMMzHU; Tue,  9 Jan 2024 04:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E461382A7F;
	Tue,  9 Jan 2024 04:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E461382A7F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4354A1BF284
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 04:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29A1782A7F
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 04:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29A1782A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v36ZLUPULRLo for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 04:56:39 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BDA482A72
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 04:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BDA482A72
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3606f3b8069so13033735ab.2
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 20:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704776198; x=1705380998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FNDxbOwcGfmiojZvD6i25pH72dy0bFM8cnq5ZMs4Rhg=;
 b=rzYtUTYOndmgtBGvKgvTs6m3WKyKqnYlTfATkGVSJF+nCB3EZHe+R7SQnkd9gkgDna
 EELe60799ycE16KsvcHKx6y1gXKR7DSzrCMSuyqlYL5b08C2B5deXCU/Xf8ClZhn8xqo
 6Rgegjxfx+0TAP0KLfcaMGr7jb08Ckn/+L4T26h6dyrX2x4GWfkK84dxZLSEvacT3Ev2
 mGO+2+nvq1yAfio1gg2POHXKoM1gRZER3SBRFN9F7MhIwa4mPuD5M2cs4FZZPd/6s8YU
 6qRmH810fYp+592+MazzcoLAaJMn099l064a1tCH/hqTYGDJL1oLxfDMTnfV9YmKw0kW
 Zdsg==
X-Gm-Message-State: AOJu0YxNaKYhzTyatLfZLMQQbq/NPpZSUtaxzRFVB3PUmVv748VK6SEb
 SGt2y6OEtFv8a4UkTeudLeLzcTCU8Wxj/A==
X-Google-Smtp-Source: AGHT+IGqqVRQivJsTFNMU9RtvkO75X6cx3uxmFaO3dMDEzvSsD4Plj6zvynw83exrQfaxH7NTZVE4A==
X-Received: by 2002:a05:6e02:20e6:b0:35f:ece8:c319 with SMTP id
 q6-20020a056e0220e600b0035fece8c319mr5530212ilv.63.1704776197848; 
 Mon, 08 Jan 2024 20:56:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cd3-20020a056e02320300b003608be77593sm390341ilb.18.2024.01.08.20.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 20:56:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 21:56:35 -0700
Message-Id: <20240109045635.3951040-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704776198; x=1705380998; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FNDxbOwcGfmiojZvD6i25pH72dy0bFM8cnq5ZMs4Rhg=;
 b=gbHhgPCnbxGmSnjb7EKQ46pkGnJ5WzLC8fvyODfjDQAXUZjurFAO4Tt28+ADDrSwiy
 YzFqbTn8HASDmOOn40h/+m62PNjdKY3z5896XPd0pDcVaKVrmGJOOE5KhtdxDwgB6g10
 K9hnjV8IjxfmU2EyCXzHJ4phd8Vvss4mbrc3o75bbwWvAfOPZQv5lceMZIti50Y0zlI5
 Hk5EqWvXNAZOLrFGYZLjzeDlEHS/cygCgxrUSstRptGrdKTucvgZMYYBnlL/RBb5PxxH
 v9Ly7mLDZRdeZKLfyMEaED3h7CoBCzvuVqGZZaTuSq5pi14U0jRreDAsfSSiM/K6fqE5
 4FTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gbHhgPCn
Subject: [Buildroot] [PATCH 1/1] package/python-can: bump to version 4.3.1
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer used python-aenum runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-can/Config.in       | 1 -
 package/python-can/python-can.hash | 4 ++--
 package/python-can/python-can.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 68a9ffca71..27dc16fa33 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
-	select BR2_PACKAGE_PYTHON_AENUM # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 35e752ea54..4e706519be 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-can/json
-md5  26d799fe952cb590fba03f3d26ee66a4  python-can-4.2.2.tar.gz
-sha256  6ad50f4613289f3c4d276b6d2ac8901d776dcb929994cce93f55a69e858c595f  python-can-4.2.2.tar.gz
+md5  a84ace55fdeca8efd50986deacfba584  python-can-4.3.1.tar.gz
+sha256  008bea1c12e31586e1aa76971126b831bf01056a900e91862a11360e011ab933  python-can-4.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 012c82682c..c7100e3dda 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 4.2.2
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/dd/f1/327caaf05b6bca594250053058a2adac537a88dfb5c41bb5498cfda9de78
+PYTHON_CAN_VERSION = 4.3.1
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/02/fc/d5fd33ee93f17a4eb0dcd75aebf522396e3f511bf474058e99e86ae4e33f
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
