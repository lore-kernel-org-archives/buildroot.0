Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3021DE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68CAA84E45;
	Fri,  6 Sep 2024 20:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsVXCOHzP3QK; Fri,  6 Sep 2024 20:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81E0E84E4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E0E84E4D;
	Fri,  6 Sep 2024 20:12:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C95231BF328
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFBA8405EF
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1p3EqI8llX_T for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 20:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 99546401DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99546401DE
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99546401DE
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 20:11:35 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82a316f8ae1so96055439f.1
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 13:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725653494; x=1726258294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P01MU7RS1Zo5mnpuSS9PyTj+qT/bsGgf58vlNRnd8W0=;
 b=w8eSMJTKUAibK7KgC4QJshzuRqzIx5ltmh2H2Blu/QSTp7UsHN/L7pHb6xyvRtQukb
 3Y72m1vRJ8KUG64ajjQ1jEMi3ojHSf2FAI0shNCdGerDu0pnX7lLCNlVYtRy6nkadkC1
 DZecR8EuuNiRNP1MB7S/l/O8MEzS7a5fnjzBJ9n6yG6Z6b4vEifo3CJPkQ8KWce8n5OY
 vB7eQYtPS8NXA5noAGG9KCqv0rLIOHm3LtBQ2yvRrQuEWqsv3E3cB8OtpSI4/nbdAD2Y
 XIC8sgk3Fs9235pB52GJNeHUVJbIaVn3M8vQhoAh1RtJFhefgzhju+yulTB/QFusIhfF
 01Og==
X-Gm-Message-State: AOJu0Yyo5xIv2YcSPeMmfZqLBlfEg2K779JeKM53v0WNOrLa+iMokGcB
 aVzORBaI/uhW9mIEkDzW/3D5taYqLVnmwUDAls+FJ/NTWLSQk9zwuYiKGg==
X-Google-Smtp-Source: AGHT+IE1tyo0qv8W4dy1mMdcarNIdYQmW9/pH6cfVuSGiGRU7CvUCuKc8lBL8TMtWJmTsiiszkmpqw==
X-Received: by 2002:a05:6e02:1c09:b0:399:4535:b66e with SMTP id
 e9e14a558f8ab-3a04f0792b0mr46078035ab.9.1725653493731; 
 Fri, 06 Sep 2024 13:11:33 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f70b570bfsm18220445ab.34.2024.09.06.13.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 13:11:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 14:11:29 -0600
Message-Id: <20240906201129.3787478-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725653494; x=1726258294; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P01MU7RS1Zo5mnpuSS9PyTj+qT/bsGgf58vlNRnd8W0=;
 b=g8RU6UH+B8XD2uxq6A42tw6sj0igjbY71NxkNjdTpASQAO66uQFqNRR6N7/cQOit4L
 yzf+CeCM7Ncr4+fq0WjoOUgW/PNTi6DQ37UpGRFR6tb+LcCFAYfuALxplGfUlHlb5DM5
 hshmHj+ArOivojYpc3/V40YO4G/CEw6qSVIW2VjVrK559r8q6waPVOpjkbyl+iV2817z
 PBbiGO1UrzJj34J/7+fxL13YNbUeB7xFyJV2JhSisZ/wKbYICOvUHI0Dl4f23IywXrrK
 A4zMfpUOdZqZJQO4anFlcTFunjqWjeqtyNVrW8dOESSfZNbJcWdBPNBmIJz5sHAxQe87
 8ASQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g8RU6UH+
Subject: [Buildroot] [PATCH v2 1/1] package/python-starlette: bump to
 version 0.38.4
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
Changes v1 -> v2:
  - rebase
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index eca8cb8fd1..b5ba43c061 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  c56bd58a7ed1320677cff4b1055dff18  starlette-0.38.2.tar.gz
-sha256  c7c0441065252160993a1a37cf2a73bb64d271b17303e0b0c1eb7191cfb12d75  starlette-0.38.2.tar.gz
+md5  7861ee7609e649508792a4ece854406b  starlette-0.38.4.tar.gz
+sha256  53a7439060304a208fea17ed407e998f46da5e5d9b1addfea3040094512a6379  starlette-0.38.4.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index bf38b1375b..1a2b7532f7 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.38.2
+PYTHON_STARLETTE_VERSION = 0.38.4
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/43/e2/d49a94ecb665b3a1c34b40c78165a737abc384fcabc843ccb14a3bd3dc37
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/b4/9c/d85721508122ae927aa7064e10a3f47f8dabcd4fd162222afcecd0d8d7b7
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
