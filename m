Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8398C0219E
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8CFB4040B;
	Sat, 14 Sep 2024 21:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMd7dKpcbruQ; Sat, 14 Sep 2024 21:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CCC44043D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CCC44043D;
	Sat, 14 Sep 2024 21:27:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6991BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80A6640289
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72OBZ045L6a3 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:27:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33CD5401F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33CD5401F5
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33CD5401F5
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:27:49 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a08dc09ac6so10610985ab.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726349268; x=1726954068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pHTPRPtWqeyCK7j/xbT7Affty5JPGM54D1UB4Ml8k8c=;
 b=VsBrZoh4e580sFFNomPQt4FaKTMTNoIsUUNz+6nEGIlPRdkXsVq4tYjLcTlsbkcXqj
 vUADLUW//0aCQiKPEL8o19CQwUUvTd/Npcc698bhzTiA2zC7LpvmsNsxFuRVzkmTeVNS
 i1Jx6+g554t+EhfODX+QFQtNST66WNukV/O6eNiLNi/+HdyatHqGc5fMpvnaGOA1lrle
 KGQczA875WEAfth8OxJbkVipckRsz7vKJHmwJ7EkxKBiL04TrNdP3sSntahBxrlAJUrN
 NQ6N1daXYvh8Jfc8HK0OjB1vS8Vlv7Qy7lGbGW/166MmCQKrusy4MmwYzvTEl4R4p/Cx
 +1ew==
X-Gm-Message-State: AOJu0YyUTSZ7jld5MtRfBb26fVrENXO73vpf4lQMbPdpTPd4TnL1bMNN
 8vnyJJGxZJgNt6gBiujDqEL5jMCsE+ZA0GI0ARfILC6JZjBfFGAyMj4eYQ==
X-Google-Smtp-Source: AGHT+IHztNRw18EXkZBDE0pGP9yjPrdnjJsvUGRARxvG10u6JtkzX5PL5n2cLWp7cN/jCxc/4CShSw==
X-Received: by 2002:a05:6e02:1b0d:b0:39d:2939:3076 with SMTP id
 e9e14a558f8ab-3a08b79c5dcmr83751405ab.25.1726349267601; 
 Sat, 14 Sep 2024 14:27:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1b899sm6399785ab.46.2024.09.14.14.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 14:27:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:27:45 -0600
Message-Id: <20240914212745.1274531-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726349268; x=1726954068; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pHTPRPtWqeyCK7j/xbT7Affty5JPGM54D1UB4Ml8k8c=;
 b=FQUmLf9UKV5hf2nd4ylTHIl0oRSocjOPzMLOFV+lD1zaOpF0nW8lFvcc71PQLJFa4h
 pBAjTdyVM7xaA9jljxNAJ5TCX/esgF9FC7JjeL/guNKfbG9/OdtI+ESCI66FNuDvu7rT
 557Csys7hiTnSSNbrruXV3Ab36efrdSvedbMWfWRqY74ic8zK+Fnjf7P2sQIR5tsPIYg
 BeMVqQsh31mrvDaTdu0US1+Q1XxeBDjzkJeRjm1kbcHkaP3WMzayj9ApAvq/0+raNgNS
 Vmd2YSuj/PeUxApUNFEqW8y09f07MpTMMb+AGcjpqZJ5oMytgvJkh9KImtmLXktCumgj
 MHcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FQUmLf9U
Subject: [Buildroot] [PATCH 1/1] package/python-argh: bump to version 0.31.3
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
 package/python-argh/python-argh.hash | 4 ++--
 package/python-argh/python-argh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
index bac9df42d6..e90b79dce8 100644
--- a/package/python-argh/python-argh.hash
+++ b/package/python-argh/python-argh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/argh/json
-md5  2659a6353589156e6aa65a99797f8913  argh-0.31.0.tar.gz
-sha256  b93093544309ddbfe6c73dc9bfd60dbc4acecef39f3f464774b3084a1ec5d7b0  argh-0.31.0.tar.gz
+md5  b3526d2a5126defffdb8075e1c34f0c8  argh-0.31.3.tar.gz
+sha256  f30023d8be14ca5ee6b1b3eeab829151d7bbda464ae07dc4dd5347919c5892f9  argh-0.31.3.tar.gz
 # Locally computed sha256 checksums
 sha256  2594f46b9b23a5fddeca090faeb270c7ceee8116675fe35082be859aa7466e89  COPYING
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
index 0da3281d49..cdaa7e4139 100644
--- a/package/python-argh/python-argh.mk
+++ b/package/python-argh/python-argh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGH_VERSION = 0.31.0
+PYTHON_ARGH_VERSION = 0.31.3
 PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
-PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/7c/3c/1b7f3fab380c96d61119178040c0183161fe0f182c4da3933bcb3284538f
+PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/4f/34/bc0b3577a818b4b70c6e318d23fe3c81fc3bb25f978ca8a3965cd8ee3af9
 PYTHON_ARGH_SETUP_TYPE = flit
 PYTHON_ARGH_LICENSE = LGPL-3.0+
 PYTHON_ARGH_LICENSE_FILES = COPYING COPYING.LESSER
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
