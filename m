Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E1DCAC5A8
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F882608E8;
	Tue, 17 Sep 2024 21:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYD39ylVr_z5; Tue, 17 Sep 2024 21:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FEFE6111B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FEFE6111B;
	Tue, 17 Sep 2024 21:35:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0291BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED60741A6C
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNDgBFAQG7TP for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:35:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D58C741A50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D58C741A50
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D58C741A50
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:35:29 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82d24e18dfcso242882539f.3
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 14:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726608928; x=1727213728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gurS3MO8KBT0iiar5NAWHywwI524VsPgTqBCsfyV17w=;
 b=BDb28Qfivhv+yz+rZDrP64QcNTAKpB2nH0K0ojKlDWgX6G7dvsiy8dyB8F8P54/y7a
 qd7/K+EFtRCTgah3TnBDlXzXS74dKcKCqhFMqoFrUebsBoRcwAOi9A44SEN6h4tpzkxZ
 zBjfHcjDg7ZXz7z3APWJuMMkpjLCsPPUVul5aYC2B9QH305Y9ppseWFpSGcEeTkDY2Lv
 eDbxruVu3B3/jHCHalTrYQwdO8t+lVfOmcgVupqiLHLnWg3yvz5bvYCIxcBJ9MeHVurl
 BBxAM26NnnuYqvqdiRrIcZ/dtHqgQM74mNyu7QNh9wSR8C8IZmMEuTKaU1tzE27nD5VK
 6t2w==
X-Gm-Message-State: AOJu0Yx1UrIU+jSmFXnx5O/IUKA1CeJmd4Y5Xoj5hC9XQMwGXTodmfHK
 hvHnc0Kz3IdJMImGIOP+QuBNqmoA3hT2oeFtgly3tmCll5KgBR5yeJEh2g==
X-Google-Smtp-Source: AGHT+IHjKVSg2yqHQbb8mMqnrh2I1p7bXPJArdKcjkxBlyTU/bmGtX50ouht1q36GBU6Ioq3Y1Sdew==
X-Received: by 2002:a05:6602:1555:b0:82d:2a45:79f6 with SMTP id
 ca18e2360f4ac-82d2a458bf6mr1955977039f.11.1726608928505; 
 Tue, 17 Sep 2024 14:35:28 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d493384c4sm227364739f.43.2024.09.17.14.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 14:35:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:35:26 -0600
Message-Id: <20240917213526.74146-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726608928; x=1727213728; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gurS3MO8KBT0iiar5NAWHywwI524VsPgTqBCsfyV17w=;
 b=R2LmrjM+xyL22ot//PwFiDe7d5qRZIfCruc23prhQLybOvaQkBHUjUQKyN38o6aXOk
 2/UNWLUy6F2t08odrKdqCtqmRMW1KXhL6m5xeebxW7Vf7jLu+C/LcwckqVL5W7VmJHI6
 tvP25oNXf5VPCF5xe0gdeoKLQT62eHyJCWPpfR3OybbejDsCudfsauxFDq6auTK4YnUV
 e1mNZ1GuzluifcCPCr9IAgHieTcKTmrAPsMIn/95UQ6coJD4GJLbE4Y+T5pYiI0EkAdy
 O2n6yUpBehjWzbNF/T03ljowFqmf+lPxKayc6b1PRx5xaaj97NDz1VcQjEY+t+E9obay
 JJZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R2LmrjM+
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to version
 2.9.2
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
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index fd8d16dbb1..b0db8ab4ef 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  f328e2d6c3d511a81e358aac6a8636b6  pydantic-2.9.0.tar.gz
-sha256  c7a8a9fdf7d100afa49647eae340e2d23efa382466a8d177efcd1381e9be5598  pydantic-2.9.0.tar.gz
+md5  84624d794e7d2b528fe1d34eeeeb481a  pydantic-2.9.2.tar.gz
+sha256  d155cef71265d1e9807ed1c32b4c8deec042a44a50a4188b25ac67ecd81a9c0f  pydantic-2.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 828658af19..ab0cd601c1 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.9.0
+PYTHON_PYDANTIC_VERSION = 2.9.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/f6/8f/3b9f7a38caa3fa0bcb3cea7ee9958e89a9a6efc0e6f51fd6096f24cac140
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/a9/b7/d9e3f12af310e1120c21603644a1cd86f59060e040ec5c3a80b8f05fae30
 PYTHON_PYDANTIC_SETUP_TYPE = pep517
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
