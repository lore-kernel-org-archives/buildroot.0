Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5748BCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 746E1415AB;
	Sun,  7 Apr 2024 10:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8VixB02z28un; Sun,  7 Apr 2024 10:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 630AC416DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 630AC416DC;
	Sun,  7 Apr 2024 10:34:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21D161BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BFD2608ED
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j89_t7cuV5_w for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD8F7608E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD8F7608E9
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD8F7608E9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:34:45 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d8863d8a6eso4957061fa.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486083; x=1713090883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lq6lNz0xCd9dkUpOzw3sd6BDz6ekRuMjT/2DN5lu4HI=;
 b=u77ETB7Gnab2hwZUbvpgKM75dQoyTdx3WHX8lhhPasvDt3VWyfVzzXDbcDoue1WSam
 qjcn9OC6cvFky2ES01wHszhTHX12BQoiT1gAMtsumwFWl+Mbtek5w7HKDt2x3pOB4V4K
 itvWYthV4sHmO8B/38VoUB4Srtqwjz/i62qRwvozzJAR2ifV6apE2NGYvV5HxNsBxX4A
 lykjtTTB+4eJktTq2VdYJqzS9sCGaEX1v9/3YPAA09UE9RgfWD0w8EYgIG8+njpQM6YO
 XBwyxrSSpuo/zTopntsAtF3kTXlQU2JMIiZFSoqYOoG5tlxh9AMY+HYuxBU0wrEFvdlD
 3QEQ==
X-Gm-Message-State: AOJu0Yw/L13aSrNK2svLgF98NlD1CcfHwoMQf2eqNdsqR1ZHMKG4nWx1
 IvdgEvWtIrHuDt4fca1zasZVr41GlVfPGGT6U4cCT+AfJFLLp8/qceMho2E4
X-Google-Smtp-Source: AGHT+IHVFsLXLjJ1424Rlwsb4mBsj9Ycmir58oytRmL3OiezzhIgBMNms5j75Dz0AS+2Qh2BWZzfFQ==
X-Received: by 2002:a2e:914b:0:b0:2d8:4897:39a0 with SMTP id
 q11-20020a2e914b000000b002d8489739a0mr4489886ljg.15.1712486082572; 
 Sun, 07 Apr 2024 03:34:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b00416290b3e1dsm9671827wmp.24.2024.04.07.03.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:34:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:34:36 +0200
Message-ID: <20240407103436.796428-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240407103436.796428-1-fontaine.fabrice@gmail.com>
References: <20240407103436.796428-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712486083; x=1713090883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lq6lNz0xCd9dkUpOzw3sd6BDz6ekRuMjT/2DN5lu4HI=;
 b=FBS3QdU5jLSAJOisSD/DG/Mged4ZmeRjlK7ZZLHbDChlYQWMT2w+QwTfDUsD8+9KDE
 1f6+ZCf/RMPrgfZ2/1SSr24Z0UC7Z6q+iaDnA88I+GzuhrUSRNDGF7fBprX+gRHHBvdZ
 3mjOggyXvBMbOjr5WVMOmYxmU285Bmm4ovEtQtN67vwHT2qUI8dD9nixjNCFtyuWhom9
 rS/696b3cY3DYTx1XI4cmC0uOo5P5JeqrJVi+D3H8JjYXkA2+t5gmecuswsTsrFJ3JVU
 xWH+Lpy25+SeVrY7/6KBeL/srA8ioJgp3cwCwMgDcwvyLtpLC94gEnHnhvv8M76Y7ZKZ
 qGCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FBS3QdU5
Subject: [Buildroot] [PATCH 2/2] package/python-pudb: bump to version 2024.1
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure raised since commit
8937db8dd595e0988751e5dbb568e870b07b39cc thanks to
https://github.com/inducer/pudb/commit/8c8f9d4a25e226e77a18d4d938eecf2f969e9b32:

FileExistsError: File already exists: /home/buildroot/instance-0/output-1/target/usr/lib/python3.11/site-packages/test/__init__.py

https://github.com/inducer/pudb/compare/v2023.1...v2024.1

Fixes: 8937db8dd595e0988751e5dbb568e870b07b39cc
 - http://autobuild.buildroot.org/results/0e3b15b9d02dda231f768595cdcff4e75ad71afd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index 08afc67b76..a6d6b9dbae 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  81178e875fd7e15237267c3055e447a3  pudb-2023.1.tar.gz
-sha256  15df3c603aba87a918a666ef8e1bf63f764238cc3589db3c5b7a5f1b01ea2f03  pudb-2023.1.tar.gz
+md5  65639ff646f9e1f452446f4364b2e47f  pudb-2024.1.tar.gz
+sha256  fc9d6a976a59b590764c8379ec200fecd47faa84259b64efd8cd86066a0af338  pudb-2024.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index ff13efb773..68fe3850ac 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2023.1
+PYTHON_PUDB_VERSION = 2024.1
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/96/d3/a471fe68788178f2a5024031a153673df72b9287530f32b0cd469d64a68a
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/b3/a1/db467e7c828e2ced173d9dbb47abc17ca0e0b3225cb1f4066293e63a2ed9
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
