Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E697ED149CD
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 17:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99FF560B00;
	Fri, 25 Oct 2024 17:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Trz-wzgNhevD; Fri, 25 Oct 2024 17:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8592F60AFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8592F60AFC;
	Fri, 25 Oct 2024 17:07:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D00072316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFA3E607BE
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rn8rRQNgGAW for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 17:06:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 993EF606C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 993EF606C8
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 993EF606C8
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:06:58 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-83ab5b4b048so91459239f.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 10:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876017; x=1730480817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gh/Mogery/zDSgfu4st+BgEgy34JpC94FARTFWuxUAg=;
 b=pyPS3jr83lkDOjNsEWuQGiYzHsFThQP6km7bwRms4cW0tyV9rCZPGjpSMGMV5H4MfD
 WoCWm4DDmyh1EBh0jixBrFHv76AsGBSHTVRc+SHSJcPofJmOFMXBER8VtQEFCRjd7VGU
 fJbuORSgVKoXQ+4AkIa4/MYrVvrnJKx4Svv4AkKMeBjDfDMoTOVUCAKdlXz37F8fPkt6
 kA0G+tILpAGkQtLRugeTYwCIHb45IqLDSPnjJB4rArzsjq8Z80SOwGlIl5EtrJvK92YK
 dXiGWXg4kJsmO4/pty6H2DgJpHRJhyJqhsprqQ+8rd2uXoGDNEyZx4k/hExQLoB5T0Ac
 R7FQ==
X-Gm-Message-State: AOJu0YwHD42ELpYy2z0ihSbhe1suC3LvBjf6aJio2xGU6sr61euF4v6c
 5siI1jldTkEGDXmOhsyvmHTObOZqIKxn64sY7+OD+J3R2JO4RinHuTK7Ug==
X-Google-Smtp-Source: AGHT+IFJ9mzzFkTeHCo17hMKLuvA2mn6UYfzHFk24Ci/18w87A2II++vrKJKjgQRSD2So7EXCXfXfA==
X-Received: by 2002:a05:6602:2cd0:b0:83a:7a19:1de0 with SMTP id
 ca18e2360f4ac-83b1c5cd847mr4960339f.14.1729876017088; 
 Fri, 25 Oct 2024 10:06:57 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72784db5sm344215173.148.2024.10.25.10.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:06:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 11:06:55 -0600
Message-Id: <20241025170655.3528656-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729876017; x=1730480817; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gh/Mogery/zDSgfu4st+BgEgy34JpC94FARTFWuxUAg=;
 b=i0Tb2zHnwclbE4ZO3t1flVMmfOau0g+4NU/5xgEXWkOF6kEPxk+bJHLZQUmfjsRPgS
 cNmDBjYtjtT0tTCtxu5xlKvyPQN93n75MnnHZW6lUgjDv/CEzUbwu52IM5HR0m//oUCG
 sM/QR2q+LfHdr2bE0988CW0njIFLWVKuvGrlmUbVU+6EtAOEI0VQhZ0e3lQht6e17DQd
 Mxu6G8pMWoLxr4wgbGD9PCd3o+WrXYUrsqTguhANumdbu99LMGPaMFBsTJ3k5dHKUOnT
 Zv7tic7fOOIGJjhGm4OVUjhm+c86nuiJSaBE/Fq004Q7y6x8CqpFqFrtZj28FbbPTRXN
 8BQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i0Tb2zHn
Subject: [Buildroot] [PATCH 1/1] package/python-bottle: bump to version
 0.13.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 package/python-bottle/python-bottle.hash | 4 ++--
 package/python-bottle/python-bottle.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 1b3f28c0ce..3ea1f71ca6 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bottle/json
-md5  d4f5cf1d573c2166fbd25093a54b0d6c  bottle-0.13.1.tar.gz
-sha256  a48852dc7a051353d3e4de3dd5590cd25de370bcfd94a72237561e314ceb0c88  bottle-0.13.1.tar.gz
+md5  3564bf7c5e348d6dee6dd13a89dd9330  bottle-0.13.2.tar.gz
+sha256  e53803b9d298c7d343d00ba7d27b0059415f04b9f6f40b8d58b5bf914ba9d348  bottle-0.13.2.tar.gz
 # Locally computed sha256 checksums
 sha256  af150257b1f7cce92b6207854f2e8f90ea9ae52d7cac758d13a47bd12e2a2443  LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index 567c7a2ffd..d6469b11d0 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.13.1
+PYTHON_BOTTLE_VERSION = 0.13.2
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/87/7e/eae463f832f64b3a1cb640384d155079e7dd2905116ab925e9bb04f66e75
+PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/1b/fb/97839b95c2a2ea1ca91877a846988f90f4ca16ee42c0bb79e079171c0c06
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
