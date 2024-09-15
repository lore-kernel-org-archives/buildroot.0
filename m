Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ADCC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A7A809EF;
	Sun, 15 Sep 2024 21:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80Pc0j2pKZrJ; Sun, 15 Sep 2024 21:14:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5C538109C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C538109C;
	Sun, 15 Sep 2024 21:14:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D0061BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AE4B40464
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NC58WXblcSmu for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:14:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CB9040042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CB9040042
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CB9040042
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:14:39 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82cd93a6617so117364539f.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726434878; x=1727039678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vMYppACsoOCTYOQUqq0jGpaMhlpN4XE1CZwXIGaN16A=;
 b=jJp6GnatnC7+pgwR4tb9gOLAZlkymOAme5nQuqsz4Cv8L/UKasqjMGkv9Fql44Zejy
 TUZR109xtFKnNUlcoXVAmJYt3yJB4IroR7y/ZK0Y/jVPeGZpr2rNCF/ent5sLoTWGuyd
 Kh5dR2pbsXFgq/dVmN/WszSMXj+EcLtNtXGN7KzWWu3S4bacL3++TxkGHgndE9/lZzFH
 bfiVv41hbFnJCKyDOO6st3g5S1uoDYfdrW6T2SxEQ7pHK3Zd/FZjU2yVgDPojKzlrDl+
 lsnmhPrmdaUkTO7VLsuGUVW1eVu9LNMm7h9TeXm4eSEAFc0e0+5JiXiAqDm/CA3x/yGj
 ne0A==
X-Gm-Message-State: AOJu0Ywie/cUzlEC/Gu5dcNB2UEKFUQp6pimIYJR+Vd5z1fJZq3iVurL
 /LVi+SbbMU9IhRwI/IYBeSJBhgQFzSzOL4Ih+i5oCgc7rPRBUeP+WT8PCQ==
X-Google-Smtp-Source: AGHT+IFwJ5K6BPFpJ8DfGlnrbDdxC2OtYwkp67y7AFW2juaEqdHlEpGESf8XDhmUKg+O9q8/YLLCMA==
X-Received: by 2002:a05:6e02:198a:b0:3a0:9244:1916 with SMTP id
 e9e14a558f8ab-3a092441acemr50553885ab.11.1726434878216; 
 Sun, 15 Sep 2024 14:14:38 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed597dfsm1110863173.166.2024.09.15.14.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 14:14:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 15:14:35 -0600
Message-Id: <20240915211435.1604938-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726434878; x=1727039678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vMYppACsoOCTYOQUqq0jGpaMhlpN4XE1CZwXIGaN16A=;
 b=Y5VJdXw3skq5UH/2X6Ff0b1cL2M/oZNgVmTgQs7RdWSZTvwp0EBFWwRwCytYdwDAgt
 KA9LDlM3Dce6Z7DfiodvOLoUIGyhRRB/BHLB7lFLgMMROaMkeClbykGHYIzU08qu3lTI
 soPjGQvU4RV3W1HY4XKOS020sN7u9J4YVc5NPuOV6z6orY3XCj1l04F65ccm6cBzVa4I
 dua0rcZ7Sp/P5w9gSb4s+9L1i601fEBkdMheL+4wnR6YIhATtEE8SMQPTkzd/Tv3beU9
 TngdeHKVcnOi5o2YdXqZfE0kiAlPQa3sugW0KpkwoLbFdtRm6+BVY6W5F3BhJus4GyyR
 Ge/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y5VJdXw3
Subject: [Buildroot] [PATCH 1/1] package/python-lmdb: bump to version 1.5.1
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
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-cffi dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lmdb/Config.in        | 1 -
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 5 ++---
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-lmdb/Config.in b/package/python-lmdb/Config.in
index baf9bce5ac..b63af96ec4 100644
--- a/package/python-lmdb/Config.in
+++ b/package/python-lmdb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_LMDB
 	bool "python-lmdb"
-	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  Universal Python binding for the LMDB 'Lightning' Database.
 
diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index ad176d5d21..064c76fb58 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  d216e0220c625aa72de2acc158e81a0e  lmdb-1.4.1.tar.gz
-sha256  1f4c76af24e907593487c904ef5eba1993beb38ed385af82adb25a858f2d658d  lmdb-1.4.1.tar.gz
+md5  bdd78148e8374cb0001af06cc64bfefb  lmdb-1.5.1.tar.gz
+sha256  717c255827d331e02f7242b44051aa06466c90f6d732ecb07b31edfb1e06c67a  lmdb-1.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 7906d388ae..7105fd1464 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.4.1
+PYTHON_LMDB_VERSION = 1.5.1
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/de/13/dd9b0c1924f0becc93e0bacd123a4e7a347966e3e74753ace3b1e85acc39
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/67/2c/0cc9375341121ca1f4b31a2137f955dc24550e095d733c9b42ea94113ba1
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_CPE_ID_VENDOR = py-lmdb_project
 PYTHON_LMDB_CPE_ID_PRODUCT = py-lmdb
 PYTHON_LMDB_SETUP_TYPE = setuptools
-PYTHON_LMDB_DEPENDENCIES = host-python-cffi
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
