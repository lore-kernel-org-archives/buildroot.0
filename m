Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCA7D0BB4A
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 00:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FDF381123;
	Thu, 24 Oct 2024 00:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dx9TRjI8f8wy; Thu, 24 Oct 2024 00:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C13881131
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C13881131;
	Thu, 24 Oct 2024 00:12:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A5E12073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D356E81131
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLDf7FPQkU1p for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 00:12:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D851F81123
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D851F81123
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D851F81123
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:12:00 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-83ab21c26f1so13993639f.2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729728719; x=1730333519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R+8We65xBeFnWkxRkcUalGkNRcjyVvXIhXMHpsb07lQ=;
 b=QOOWsTd/OwLusegvbPjDQaI889hQjmB7PV/jiifqq0TWNLOJZOuV5Ps/PV3NRADDHA
 35tbD8idmZeKxYw0cdhC3lUNNg3DT2GuINxNgU2xfXsnsqx8zDXCtFldauPwcAA8ke8d
 4kdSljBmN8pIcOa2BV6p3StQhNXg6l3Zdpns4t83amBiCAxSjnfyS9G/G9taASac21tm
 Or/tn1KYPDaKGCt3P+U4a5ek5OhZDQnyQnKVh57/zoElkNWm+kvRw3OIk+hHkNIEh+DL
 f+Z0+N/C+GeLsCcRoPDCMbMBfUy/iVdvXayqEO3ahY53pxqYMKw8W0F7xdhjLJFGYWmc
 B/tA==
X-Gm-Message-State: AOJu0YxRUe75X/flLwTVJ3S5umW1837BRabyORrgH/Dvm58OTEOPpANN
 OsEgFqL9zPhB8RxhMa+kl4YVWqOjgwHpmjb6/1eueVzF16ht3SythQ2MQQ==
X-Google-Smtp-Source: AGHT+IGHh+W1hP1Pg2lHhXHfIccrWsj8V4kk80uc9n12ONSlAZ/iBKIW4HQAs9e5aAaOVyCKWmgo+g==
X-Received: by 2002:a05:6e02:138f:b0:3a0:8d8a:47c with SMTP id
 e9e14a558f8ab-3a4d599c3c8mr50652745ab.14.1729728719576; 
 Wed, 23 Oct 2024 17:11:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a400b6496asm27853635ab.57.2024.10.23.17.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 17:11:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 18:11:57 -0600
Message-Id: <20241024001157.3359070-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729728719; x=1730333519; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R+8We65xBeFnWkxRkcUalGkNRcjyVvXIhXMHpsb07lQ=;
 b=PAvI851GKYBEdboLh6FGH/7Fdc61IIiu6ZDigqLTdoN56+8Y144lVZ/yncO8AqtAxU
 sNRFcSm63Rd9jcmSYFB8LqcPJoMg96JT27vPu8Z3M13dwCmbZ0ZVQz1KdUvCVzyW38+A
 11rqMh+hHUc/UJKcUmhNjitaJHI6O3YVLMxjAoBkkgRysBWmySYBQObBK41KSZEnwx2O
 PwwkXRsNKL349ypKkGXj8ur5sFAIo+qLCYHVIylHFeTA8MqBtEkkCWp5hO0gIMpB1TD7
 F86aKuylmB4TQUydml+EImh9TYknRMqBkn6NIW8Jq/es45uUDEQWpsiW/EPXYRkOHAFI
 LwCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PAvI851G
Subject: [Buildroot] [PATCH 1/1] package/python-httpcore: use hatch setup
 type
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

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-httpcore/python-httpcore.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/python-httpcore/python-httpcore.mk b/package/python-httpcore/python-httpcore.mk
index 19edf18c97..a432433884 100644
--- a/package/python-httpcore/python-httpcore.mk
+++ b/package/python-httpcore/python-httpcore.mk
@@ -7,11 +7,9 @@
 PYTHON_HTTPCORE_VERSION = 1.0.6
 PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
 PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/b6/44/ed0fa6a17845fb033bd885c03e842f08c1b9406c86a2e60ac1ae1b9206a6
-PYTHON_HTTPCORE_SETUP_TYPE = pep517
+PYTHON_HTTPCORE_SETUP_TYPE = hatch
 PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
-PYTHON_HTTPCORE_DEPENDENCIES = \
-	host-python-hatchling \
-	host-python-hatch-fancy-pypi-readme
+PYTHON_HTTPCORE_DEPENDENCIES = host-python-hatch-fancy-pypi-readme
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
