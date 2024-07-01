Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D77C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 17:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 933A560AC4;
	Mon,  1 Jul 2024 17:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttG9gM-Ty-ED; Mon,  1 Jul 2024 17:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A0A60AC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A0A60AC1;
	Mon,  1 Jul 2024 17:38:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D43B1BF342
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19FE1400F2
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqqzbWfRHAwd for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 17:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D68E041171
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D68E041171
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D68E041171
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 17:38:19 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7eb895539e3so135981239f.2
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 10:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719855498; x=1720460298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8zSkO74l3eafIzHmayf8o0xN05b5SZR8SJeZIjmXqk=;
 b=Hp67y2AzACZgEBLvG1uMxs+ajgS/uL5NJsmtvF68ivsGupH6W8voRHwL6eDXw7hL4p
 uBegc1cf3AYFMw/DRnb7qnVSPiisE16aCHpPN+qrfWLELqd6/4ODAPkLIXHxEQW3JTgs
 m/D+pSzVRL/nu4EK4TGcLhf1c5hiu3oRX83AWpczP5UGehSeSy35LzxV0Fl1j8QPWKiV
 NPK9sN8rhJAG27phx5dUWUH0pSz1340Rmu6kFKc8kQ3I+3WN1x4FK/1tQA2dq2BM0gFM
 eaRQqL2Q3/DIAnUU1HAQNct7eWb9ZAr9kVFPIbsaX35kMDwqzEjCLyT1ASTkEkFuckuV
 xcCQ==
X-Gm-Message-State: AOJu0Yz0pFkreZvyUh1/pKPYXS59GYK4Q3/BUNfCFnj4SY5oN9ZPvpIl
 WHihbzVt3bROIDjOAolBKUsdjqrwywmoSeMcFbrtDHe5IltPXP4E1EaPNQ==
X-Google-Smtp-Source: AGHT+IFDI1qzDmywsdz59H7s+4SJ9jR/zJ4pTc3XIiJc5TEP/CWJbuwkvpOdewgavlXuZRdLARH1WA==
X-Received: by 2002:a6b:4f12:0:b0:7f3:d924:8612 with SMTP id
 ca18e2360f4ac-7f62ee86a33mr777221139f.15.1719855498397; 
 Mon, 01 Jul 2024 10:38:18 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73f96e89sm2251451173.117.2024.07.01.10.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 10:38:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 11:38:15 -0600
Message-Id: <20240701173815.1725948-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240701173815.1725948-1-james.hilliard1@gmail.com>
References: <20240701173815.1725948-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719855498; x=1720460298; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8zSkO74l3eafIzHmayf8o0xN05b5SZR8SJeZIjmXqk=;
 b=hwDbcipg7WZZaZ4QQFpEVmeXCS83CucTfirJ1x1xNUUYEszZ1dFkk/liXIOwRbOqVU
 DX59QV9k/iyzzOC4kZKsfmRdwxoaJctU71DqK9W6/S6/oCknIVQiQGyyILkYmsZmWagE
 YMObnaydaNd0pg4oiOIrY7VnkEDTsWxlpITZ8+8A87RYGE+H8U07UhpqyuGOOYJg5Lm0
 UJJMOz8Ql2vTccktNVF52DeL0BwabekPymXOktSq545BpvS1NMWghCYdnqunjcaRN6wq
 NmeElTITz8f4flkzHNKYNFVjPCeSFl3BnwE0Mtqj7OdNt9qOgfgjj19P6jR1WiCxu4fL
 PkpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hwDbcipg
Subject: [Buildroot] [PATCH 3/3] package/python-fastapi: bump to version
 0.111.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch from hatchling to pdm-backend pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 224eccbccd..2be006a97d 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  5e9226e70e1553a630599cf584ed53de  fastapi-0.110.0.tar.gz
-sha256  266775f0dcc95af9d3ef39bad55cff525329a931d5fd51930aadd4f428bf7ff3  fastapi-0.110.0.tar.gz
+md5  32df7b178fb59e180d34729be33d5024  fastapi-0.111.0.tar.gz
+sha256  b9db9dd147c91cb8b769f7183535773d8741dd46f9dc6676cd82eab510228cd7  fastapi-0.111.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index c1844960b9..262b166907 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.110.0
+PYTHON_FASTAPI_VERSION = 0.111.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/61/53/326977db62bf34bbdfc64acb9414e1881af7ea14e8a062fd1c11a8697616
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0e/1f/f4a99e92c583780787e04b05aa9d8a8db9ec76d091d81545948a006f5b44
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
 PYTHON_FASTAPI_CPE_ID_VENDOR = fastapi_project
 PYTHON_FASTAPI_CPE_ID_PRODUCT = fastapi
-PYTHON_FASTAPI_DEPENDENCIES = host-python-hatchling
+PYTHON_FASTAPI_DEPENDENCIES = host-python-pdm-backend
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
