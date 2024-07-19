Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F02CC3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 04:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F61B408DB;
	Fri, 19 Jul 2024 04:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-DM4oWIFv-n; Fri, 19 Jul 2024 04:37:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B70540917
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B70540917;
	Fri, 19 Jul 2024 04:37:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFB861BF841
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B96C180CBB
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrr_8nKPeocD for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 04:37:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4EE080C77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4EE080C77
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4EE080C77
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 04:37:42 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-804ac219676so81566539f.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721363861; x=1721968661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EPZMxKY4s7Mvyb6JPVjc1wmy53CCW9JGYQDRMe/ZlW4=;
 b=uD4o0icNzV5vfyo20GrMlKcrDpe1hMWlau74nBwdqcsasfwyAZQgEyMRJVOgN+1AR6
 2KEYq0ZU/SHEvjzcljzLNNbKkfajnYvFOp5CtEm7HPGOpzcih0jyMmJu06QlsukTo+vY
 XiKi5mLg8xiHnh19Pvi4NGJ7yHJk6q6ZekExhmsTcf+vM95cAmSsbHERIK37LhorYPQX
 opZ+HDthWaEx8hPmnaWRXOwJLoU7KKl3G/t55+o7DLFyKqPeF5EpBDM2ype715wi3QfR
 f+UHBMws8bTBWKCOGyDBt+1myGeoq3blg5JFATQmyvSw3JPLqmAMs6dnqd0deZwsZTtY
 PDHw==
X-Gm-Message-State: AOJu0YygJPPgKLYQLzLeAR8cKDegOPkOSRZ2azvifwf76sWFkpVhYeDA
 Fsawwjh/6GVdE39iZNu6VWWqtbL2BTEKHo8XbLztPLXh3IIYh4UtdDi7lg==
X-Google-Smtp-Source: AGHT+IHW4PE1LKa+vCeXn9Vtyi2ZiGvbCjcPXLUV7YQzP6JBDyTmfbk702jK3pBK6AIVEP+8TS/CDw==
X-Received: by 2002:a05:6e02:1d86:b0:382:325c:f7bd with SMTP id
 e9e14a558f8ab-3964e088bd3mr39757965ab.10.1721363861269; 
 Thu, 18 Jul 2024 21:37:41 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f5c2b5b5sm1985955ab.39.2024.07.18.21.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 21:37:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:37:39 -0600
Message-Id: <20240719043739.3241372-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721363861; x=1721968661; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EPZMxKY4s7Mvyb6JPVjc1wmy53CCW9JGYQDRMe/ZlW4=;
 b=g6UlAgFSdaooG3qmyYvHxqscNYAAaS9FoJKdSMENpB8LrI36SEKKykmn1h6ki7selK
 SRy8QHi4CTyLde6ffWnyjhGfFnHso5hIFjAdQeGcYXN2posusSg0q+R4TwtOlVl7fVwR
 pBJXxaGRd9ZDnVlDlVz+rPuSoWERleoILDpAl+WTeRyLJjJAVV2JTZkMIbWNJ5UusAVR
 w5wDaKyKMkGlb4fvGl/9d3gxTcza8u864Jtoe34opX9M9WU1ydiLJ+HmuhJaEdArNevc
 8+Pu1JabelWVz9yqBE2gxg5Ah67lV8HKDELB6lv0tU2V7uR2GpzmzNWYE6WpyFlmTXXA
 /6FQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g6UlAgFS
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.20.1
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
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 1703fcff3d..3554d0c0f6 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  a3597bcb7a6c9aabee543ba5797ba4997eb5a91b36bc6c596be4640bccf98daf  pydantic_core-2.20.0.tar.gz
+sha256  87cee9e796c31e3470dd13675286f13d58084e4362dae9288a9fa45b1264c084  pydantic_core-2.20.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 2e37c37004..4332c4f6a6 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.20.0
+PYTHON_PYDANTIC_CORE_VERSION = 2.20.1
 PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/7d/fa/9802d053f33dbcf110d46e3f28667b06cd764b164f1e3f4189848cdd6e78
+PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/12/e3/0d5ad91211dba310f7ded335f4dad871172b9cc9ce204f5a56d76ccd6247
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
