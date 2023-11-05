Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43676C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 03:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5A40813B5;
	Sun,  5 Nov 2023 03:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5A40813B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6wU3jmcFqju; Sun,  5 Nov 2023 03:00:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01610813BB;
	Sun,  5 Nov 2023 03:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01610813BB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA8EB1BF267
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3B15418F7
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3B15418F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kKzm6JWnBic0 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 03:00:37 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C9BB418E4
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 03:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C9BB418E4
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3574f99d236so12788215ab.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 20:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699153236; x=1699758036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g/6ykNvqzyxJjvjj2pdSyGPdk1nDJdJDp1Fsehm2BNE=;
 b=MG/+OvW4GByd7yOMBs/i9H18fvSESRLcWeqP0vWiuMAR2asGjGV8B/w/DeTC2KPDL4
 Xb457uRCQXOdW9EfXh/LFxKixfGsuL68KAZ7TfnuHuoRmT/pCZMk/e//feIQHfq3U6zT
 xh2sNekSRbQpQXosDwsbuYUNyd5FRIGxuQwwUoA7ovptCsa/wqw6Cshead/NHdJ31vmI
 yBstZq2hVpLsWnja1LLNCFdOdpExTCzF9NzZ4AWjR+cEw6ebZ4ZDCOOjeT0+gbamAmAx
 6B13MOp6sJCyhF7y/pVVrNroDHosc06Bc6+zl2ogLfulPSLcQQ2S2itDoZbd7VxbOD3B
 BCIA==
X-Gm-Message-State: AOJu0YysbK3tixTZJsttqtLCWf1j2bA9U3kqUmofRvqIDfVOZ3p2NQPb
 LsYhwSK0cOzNn6nLtddhD0RMSWyP3rY=
X-Google-Smtp-Source: AGHT+IGvccD/eMKxuvNkcDRzhZS2yYyiw6dpqePMVInGhBWcbo6bvmjalEV9oA7qTXBct2yAPzSwrQ==
X-Received: by 2002:a92:c047:0:b0:359:32ad:484 with SMTP id
 o7-20020a92c047000000b0035932ad0484mr14893247ilf.16.1699153236105; 
 Sat, 04 Nov 2023 20:00:36 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 q7-20020a056e020c2700b003524d2ea34dsm1593604ilg.10.2023.11.04.20.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 20:00:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 21:00:34 -0600
Message-Id: <20231105030034.2771365-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699153236; x=1699758036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g/6ykNvqzyxJjvjj2pdSyGPdk1nDJdJDp1Fsehm2BNE=;
 b=OCTS3vYj03oJgZB/tZ8GV5DWkuzjEKGiMBvdYwMb6AraYVGPoucYC4MfjKMWRBHDjT
 FdohTOJx3VMVuvHik5N3O6t0kLkmOjv4MiY2zlE7M4/LdtluZ16/6k1WEVUg3mlBvDx9
 BTQwAF25jXy01ifXaiA4Wjew9+HpdVyNpdrg1OGd4bsJOt6+vi4TukWdQZb6hBrV7IZs
 cVuhgWcjxcEdmz1sW3Joekathcu/cJgjG63jKqtnjjnh5ja3XxbkKo5Rj7nz64MBSNdH
 trx3W6dVeLWg6ajQz+vTlDbna1q4ygo0dhYWVO2A1FWeeZOwKEWF+aLTcD+megvyUAAM
 21Ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OCTS3vYj
Subject: [Buildroot] [PATCH 1/1] package/python-cheroot: bump to version
 10.0.0
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

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cheroot/Config.in           | 1 -
 package/python-cheroot/python-cheroot.hash | 4 ++--
 package/python-cheroot/python-cheroot.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-cheroot/Config.in b/package/python-cheroot/Config.in
index bb9b4abbc3..4c907ff8c6 100644
--- a/package/python-cheroot/Config.in
+++ b/package/python-cheroot/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CHEROOT
 	bool "python-cheroot"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	help
diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index c3556109cd..d103eb6f96 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cheroot/json
-md5  1617fdbaba7d6edbe5b0ff48f7563111  cheroot-9.0.0.tar.gz
-sha256  3d47ad9ee19ecbec144b4758399036692fdbf67a40b96eef1fb1454367b3d338  cheroot-9.0.0.tar.gz
+md5  be96fa052c54892240f916fbb06cc571  cheroot-10.0.0.tar.gz
+sha256  59c4a1877fef9969b3c3c080caaaf377e2780919437853fc0d32a9df40b311f0  cheroot-10.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e20feeb491a7e98084f15719349e9857aad41c4503c5e479f8815b063dbf7564  LICENSE.md
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index f75065c7da..86e16f7db2 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 9.0.0
+PYTHON_CHEROOT_VERSION = 10.0.0
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/8c/e7/8e6387d59a352c5799e917a23e7b76771a8bb97322c1ce7e42934d0066c3
+PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/08/7c/95c154177b16077de0fec1b821b0d8b3df2b59c5c7b3575a9c1bf52a437e
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
