Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B17CAC59E
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 20:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CFBE81166;
	Tue, 17 Sep 2024 20:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4rdRSzpXspT; Tue, 17 Sep 2024 20:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D30581168
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D30581168;
	Tue, 17 Sep 2024 20:36:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 989DC1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8608A412F0
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ah6MTKmBk-tc for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 20:36:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42272412D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42272412D4
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42272412D4
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 20:36:55 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-82ceab75c27so281269639f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 13:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726605414; x=1727210214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lQ2OVEHcgmunNS8WNhlopDiutLrr2817D2zURhJsZfY=;
 b=i5y/HdyVFOys/htLQ1bUgnvB6hdr1VZ/DpZ9d2BvDm6THvZ1+ELDQ8YNrwIi4Mr9bh
 jlioEZD48y8EDp87fg9BnZDELWOh7ERYNvCotzoA79hlrUpjDzoTJEZCuw9vYZnj5jsA
 kBAZAU6dImX4yWB0lJdmN+3yUJj9cucXnNFk17mvxhwLeHryMi0o9PEfdjRMnPUrLJu7
 LEb9P3Xl4J8NzDPoOf2QTx4nFN3adEZSQ+3TXluRy6dMYBIYxcwt6g5gd58T4XgDPQ61
 39Q9a5JiDK/WW3+p3R4XamBAYnXHABMv6eipcSopw5CsHEHg+ceGsawlH6TwWbnvKq3Y
 kmiA==
X-Gm-Message-State: AOJu0Yz7j7l51yyGmk3UvOooObJ2N9ndM3h+1yaAlwR2PqPW+390tdCM
 AqAG1M3C9dwyRh5bX46zrvW1BpQrysOC1s2WFT9minpfcFD8MhC7/BGzrg==
X-Google-Smtp-Source: AGHT+IGvMqKTdeR/zFfwiOytC1FpL5fR5N93lxYsiaNlGU3vfE62eFSTN/HHUd50ynIy2VQjdbrcOg==
X-Received: by 2002:a05:6e02:160e:b0:3a0:a3cd:f239 with SMTP id
 e9e14a558f8ab-3a0a3cdf40emr75705435ab.8.1726605413896; 
 Tue, 17 Sep 2024 13:36:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e71a85sm24076925ab.65.2024.09.17.13.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 13:36:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 14:36:52 -0600
Message-Id: <20240917203652.4022146-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726605414; x=1727210214; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lQ2OVEHcgmunNS8WNhlopDiutLrr2817D2zURhJsZfY=;
 b=nBEFbDDkzw5GmTRe5tEm9RYoaQc1uMFeO3qe3p6jcTenNW0pACfHaUdc7k7u1Dqx7p
 R+N18dek756hsejBQHv7RLFTdgSI3FrtACl1e9+o6j9lXTXfiJ0gs+dWgLWfys3dYgow
 RrcP5G7SpSODkWqS/aPqNwGqY0KYEVrQbDO2EYLbayFZ8kJdKfcnCyAkyQD2ri7LsLCu
 EG7P/kqnWyLNT0DRzPu4l1LFC6iQKvY+usZb6fDCEdtyB6imRiJidtRjLm0N54BgpreE
 TkuOAxy63M+1JPcrAWeklcvxfmf8AELT5ykFhAznb1wfScul7CZgx2WXyQYG+Ok9mvm/
 4HgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nBEFbDDk
Subject: [Buildroot] [PATCH 1/1] package/python-pudb: bump to version
 2024.1.2
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
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index a6d6b9dbae..dd67b9fd81 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  65639ff646f9e1f452446f4364b2e47f  pudb-2024.1.tar.gz
-sha256  fc9d6a976a59b590764c8379ec200fecd47faa84259b64efd8cd86066a0af338  pudb-2024.1.tar.gz
+md5  8452e5d114a58a63b6c7781452980171  pudb-2024.1.2.tar.gz
+sha256  adc9b00042ba8367117df0a6c0dc62fa9609abd21c3bf8e5b73d620907c5b43e  pudb-2024.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 68fe3850ac..cad1bf00bf 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2024.1
+PYTHON_PUDB_VERSION = 2024.1.2
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/b3/a1/db467e7c828e2ced173d9dbb47abc17ca0e0b3225cb1f4066293e63a2ed9
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/54/70/fc7d81b7ac439d5e21c8c2b51e15cdc6632b720b02219057fe098a80e766
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
