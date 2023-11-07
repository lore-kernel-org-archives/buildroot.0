Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C394C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 00:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9EC742032;
	Tue,  7 Nov 2023 00:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9EC742032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMTYJPbtXHNQ; Tue,  7 Nov 2023 00:50:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E777B42029;
	Tue,  7 Nov 2023 00:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E777B42029
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C262A1BF34D
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 00:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 952E04017B
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 00:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 952E04017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NN47_LkmWYQd for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 00:50:28 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1950340151
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 00:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1950340151
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-35942cb9ef4so22175365ab.3
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 16:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699318226; x=1699923026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WrVX71VriGo1aFsN1hz1Gq+BA9NMOArxRKCTvDgjAY8=;
 b=o1jSP1O1wpySwTIBPa4f94PwhkHkBwGo2AS3wP6iVI/pBR4qImmBEnCIBKj87IBfuS
 3TltvCYGsu/gxniHapGWjGDFd0WvszII9epLhop6eRcWvaXMWL8O0GgofHL6LhIKqQGZ
 wMYq/JSRomx2nadzJ1RIDB/KZZT7ydonpRDD6rf2HIC5/22xKDcngx1QoPBDWeM5jUjZ
 QZT19YjRyzYD3u2J8fJEleS/hIusuYZwY00Vz30O6TA18qbWHTKEplf7FxjNOpJcE3PE
 saWcmYU0W4ZU/LS/djjTt62j6ingBjdJW6U5/QkKsm9UZbjL2j8rKx5iBtRYlc1NgtPl
 e91w==
X-Gm-Message-State: AOJu0Yy+N+iTqe5AQsOlR2Z2Xq78/659rNaEMpHKssYBkdscdREZUtTO
 L5eP/UP9/LGIxlg1tph08SWdaNKD7eM=
X-Google-Smtp-Source: AGHT+IG2wYbcpIcqyzitzooFba+SiQEauTUb3e8wkYMvpNMbH0QDmwzGv4c3r/lwCPjGVFjghlxxeQ==
X-Received: by 2002:a05:6e02:168a:b0:359:4b03:d92d with SMTP id
 f10-20020a056e02168a00b003594b03d92dmr1541593ila.13.1699318226558; 
 Mon, 06 Nov 2023 16:50:26 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 h30-20020a056e021d9e00b00357c06be898sm2787863ila.81.2023.11.06.16.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 16:50:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 17:50:24 -0700
Message-Id: <20231107005024.3446166-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699318226; x=1699923026; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WrVX71VriGo1aFsN1hz1Gq+BA9NMOArxRKCTvDgjAY8=;
 b=UOZTssypAVWG6j6gh1n7hj9rExTrweKRIjd/5qKt4BGG2VMdVXOvrrd7ub1HngwURU
 jbJAw3h1B24RcSO5Gy5TZLFFPUrrHaeABhkC8zhBisqk0B7kfXTFkdC9ao3m2HB+fR4R
 rZDkgk3rbpsulPFJI19N6NNlNqliLUwVdiKfUJW/5hu36Njc2L4TxyD2BD1YcmGXwtdJ
 iY9oUu3SuougnAXxbzDgtFGOeXbyEWw16vJZ304Hvp2HTalvNIrzqC3gFLKmE3AV6zM+
 Ar85O3NRwx1iZOp2kfrkENtiTfDMxOXyRf72lHEL3sl3Fm13sEMMmzyf6ZUgXF7n5JzR
 GRFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UOZTssyp
Subject: [Buildroot] [PATCH 1/1] package/python-lmdb: bump to version 1.4.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index c8137ce4c0..ad176d5d21 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  230103e2cd8efbca8ee7cf29151afd0d  lmdb-1.4.0.tar.gz
-sha256  39f6c4ee145d28d17025d350720abb6f95db816514e868db57444fdef51cbb47  lmdb-1.4.0.tar.gz
+md5  d216e0220c625aa72de2acc158e81a0e  lmdb-1.4.1.tar.gz
+sha256  1f4c76af24e907593487c904ef5eba1993beb38ed385af82adb25a858f2d658d  lmdb-1.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 071106605f..52617b6ed0 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.4.0
+PYTHON_LMDB_VERSION = 1.4.1
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/fd/78/4cdc5927d5f3c3c86c4da0108c2eeba544cd67e773232164d59f3e442ff0
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/de/13/dd9b0c1924f0becc93e0bacd123a4e7a347966e3e74753ace3b1e85acc39
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
