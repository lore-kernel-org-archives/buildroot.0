Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68E6CDD55C
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69F4A6123D;
	Wed, 18 Sep 2024 20:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVb_EB3Y4YGV; Wed, 18 Sep 2024 20:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C5A461248
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C5A461248;
	Wed, 18 Sep 2024 20:48:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D33B1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 498FC84937
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWfuUvGTM3DP for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:48:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3932684918
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3932684918
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3932684918
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:48:47 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82cdc21b5d8so7642939f.3
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 13:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726692526; x=1727297326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aQkaeXt7EapL4g1y2LqF166sHDzZXyPB+Jm/hiroX7o=;
 b=fQG+TbZ9FyFweUw3Xd0pBbtZjGh1IGnHe6ngvozowFrvqdUebpY1kn2jqLG6m6sCkZ
 92tv55tmTPvTzbztsDCC7O5phb+20ELTolNV5J9aj2YlLFixjI/iJSZMpn0r8xBxahCY
 JGlL4+5nhYTwYw1nF7+Klts1GRQI5Q2U+4yONNrzaHFk6HNomaZ4zgCiNucTISDiFJdo
 2JAvlwKUwHfs108uabi+7iojl1URsXWdG0cC/+Lt2BZU1v2V9/QRUSWayTyPw9MQ46Uy
 Lfi8mvx+gKPnL26JU69HkVj/xpkLcXSU4sFnt9O1HCCqTSdr2HWSZYWCbvOCvNng8+Pa
 9JIg==
X-Gm-Message-State: AOJu0YzV4YgE3uXyf8X0yqE3BHTbYIwM0egpGpN7n+V8Ch9H28nKz/Mm
 3DmYwOylkkKO3btUyDIwafdLlbS1tUsIYAanMHTxg9gu9FY28ZHVaDucnOjR
X-Google-Smtp-Source: AGHT+IH6anT1eaDMihX8MezXnTbBLB3y1tXa+oOT54vSQ3focMRHQaknC5TjoxWaokYrqBtniQi9jg==
X-Received: by 2002:a05:6e02:1c86:b0:3a0:a4ce:73c2 with SMTP id
 e9e14a558f8ab-3a0a4ce75eamr112110965ab.14.1726692525862; 
 Wed, 18 Sep 2024 13:48:45 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed19ed6sm2648470173.111.2024.09.18.13.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 13:48:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 14:48:44 -0600
Message-Id: <20240918204844.436748-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726692526; x=1727297326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aQkaeXt7EapL4g1y2LqF166sHDzZXyPB+Jm/hiroX7o=;
 b=lj2LXmmEfy2cIsWGIRL5CwPzggeltUx66+1VZEeT5G5tzzvrb93wLaHZWjLNHJ5YeD
 GxE612kstvuYkmOhi3BDMhzk1d5eo80Vi31rGI64xJPNnhwRJ9t3TVHDxaCMulbWe9ED
 evqt7AL2fLvPl+iHndJ+aYgRO9cr3LV3EnJYydC9UcoWLZw+BxY5p9MDhU5hlgFQinPr
 6XBxDrHVFZKDmGfMhCJWrMet9iWxGhjKcPnHOdc2prXCiCtTlyfDNV2FgHEwazPqh6uC
 RTEmJHcsL6FVwXVFRuakfXjrmM2q+hKaFjaoLgBamJneRu72Axl3o0Bh0TaH4gA0lAVF
 MD+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lj2LXmmE
Subject: [Buildroot] [PATCH 1/1] package/python-pythran: bump to version
 0.16.1
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pythran/python-pythran.hash | 4 ++--
 package/python-pythran/python-pythran.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
index a46825c933..06f3b3839c 100644
--- a/package/python-pythran/python-pythran.hash
+++ b/package/python-pythran/python-pythran.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pythran/json
-md5  cc6fa05e583733182d06d2e41e03cc10  pythran-0.15.0.tar.gz
-sha256  f9bc61bcb96df2cd4b578abc5a62dfb3fbb0b0ef02c264513dfb615c5f87871c  pythran-0.15.0.tar.gz
+md5  106497787546f3538db7bb1a9e48d88a  pythran-0.16.1.tar.gz
+sha256  861748c0f9c7d422b32724b114b3817d818ed4eab86c09781aa0a3f7ceabb7f9  pythran-0.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
 sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
index 43853a514d..4af281eb9a 100644
--- a/package/python-pythran/python-pythran.mk
+++ b/package/python-pythran/python-pythran.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTHRAN_VERSION = 0.15.0
+PYTHON_PYTHRAN_VERSION = 0.16.1
 PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
-PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/82/31/cc6fd7a2b91efc6cdb03e7c42df895b4a65a8f049b074579d45d1def746f
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/73/32/f892675c5009cd4c1895ded3d6153476bf00adb5ad1634d03635620881f5
 PYTHON_PYTHRAN_SETUP_TYPE = setuptools
 PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
 PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
