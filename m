Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28397CAC5AF
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 00:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97F2D6079F;
	Wed, 18 Sep 2024 00:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYygXbiyCnoA; Wed, 18 Sep 2024 00:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52235614D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52235614D8;
	Wed, 18 Sep 2024 00:22:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D599B1BF969
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 00:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3E8140125
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 00:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5ZjEAm3v3XM for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 00:22:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 841DC400F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 841DC400F4
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 841DC400F4
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 00:22:25 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82cdb749598so353497839f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 17:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726618944; x=1727223744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSZ9jzdBpdlFrZCOBaMXkzjau3V9dCRDHcU+P05regM=;
 b=UEvTU5YYBF2KVhp4OXrspBOiJwspG5g650GT+ty5pNxSMCfyqEGHEfyg4kYFsPyMD1
 NFcutoiYv09AoWJtcESK5U/JflEfRU5ItC/h8vTt6W5q8Aj8E56z5cyHZxzEAv89o7I1
 hIUnfDNivJIFv+7CCj8FrPLtZom46OccFbU67TDJ8A/RXPQvY28sCEiR1xsz9LEgWmWW
 CplZe/mqnaqs0UzFQbwGkfetEPDIdSt3d6j+qQ6MxBErYZnA88YFIAAnA6FktOTq6x/M
 xZcBIOrD4j5Uz6wKzHQ09kBMkNGFUW6Eoxv/sbDvGCvJnCkqvlppl2MPihFscIycfDpR
 Kwjg==
X-Gm-Message-State: AOJu0YzF9nu15j9FJZbhH3L3yigVaytk0NoudAikaXQ4BTtdZ2LgcIja
 ImrEuoVXQLsOm4EINuO/l1S3KLwYf+pn6z8uzvraWlhmuGESZRR1ni5wb4Ex
X-Google-Smtp-Source: AGHT+IFl2KYhm9wOjQMoCEIlFaJAlYW8xKeQK39Gc3BpJIbhe6Jqbdtuxucs/Q63f7EkkAnDhDHLeQ==
X-Received: by 2002:a05:6e02:1c48:b0:39f:53b6:cdec with SMTP id
 e9e14a558f8ab-3a0848fa196mr179436675ab.12.1726618943980; 
 Tue, 17 Sep 2024 17:22:23 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1b189sm24789575ab.37.2024.09.17.17.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 17:22:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 18:22:20 -0600
Message-Id: <20240918002220.414668-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918002220.414668-1-james.hilliard1@gmail.com>
References: <20240918002220.414668-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726618944; x=1727223744; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSZ9jzdBpdlFrZCOBaMXkzjau3V9dCRDHcU+P05regM=;
 b=lnX/oNeLbaaz5KvWtzHuxYUb4lOnTQnuXl8s/t013sJdDP+ZzcmQTAmBzx47S0SNs2
 kWy1PpZdltkQWOSzRLkgtDQdIe1Ams4edZ08IYrMWaaV4JUwliABipomJNIPAZJEfd4V
 GEGXkUzcpbqvbwHmqSBA9RfPZH3jqdyBSgvoutJV2mknsftqHQ2sj6w9/l2MeZnGY+oO
 tL0bDWSTMiz8LtXsm8ZDuEmfL+2y6HdsHU6wFRd1n+aCHnW0s0X688rMx+t4Q73idzMj
 Ba7JuxoLFocKBX2bTWAfj0unTj2i1KJqgxnIYuGuMiqn9bCmAXhFGZPqSQLQUPcjUd/g
 /s8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lnX/oNeL
Subject: [Buildroot] [PATCH 2/2] package/python-pysnmp: bump to version 7.1.3
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

License hash changed due to date update:
https://github.com/lextudio/pysnmp/commit/fa9909cbbf9b25eb992a945715e2511a2ba2c905

Update license from BSD-3-Clause to BSD-2-Clause, the license
changed in 8122a1d85b6cc9f2adcb1243521c04ba4cae0510 but the commit
incorrectly indicated "no content changed" when updating the hash.

Add new python-pysnmpcrypto runtime dependency.

Drop no longer required python-pycryptodomex runtime dependency.

Migrate from setuptools to poetry build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysnmp/Config.in          | 5 +++--
 package/python-pysnmp/python-pysnmp.hash | 6 +++---
 package/python-pysnmp/python-pysnmp.mk   | 9 +++++----
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
index a034b16852..2abd3a86ad 100644
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_PYTHON_PYSNMP
 	bool "python-pysnmp"
-	select BR2_PACKAGE_PYTHON_PYSMI # runtime
-	select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX # runtime
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pysnmpcrypto -> python-cryptography
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
+	select BR2_PACKAGE_PYTHON_PYSMI # runtime
+	select BR2_PACKAGE_PYTHON_PYSNMPCRYPTO # runtime
 	help
 	  PySNMP is a cross-platform, pure-Python SNMP engine
 	  implementation.
diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 3b0af1af62..9136d23a14 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  2222880259daf6e2cb322e938c818276  pysnmp-4.4.12.tar.gz
-sha256  0c3dbef2f958caca96071fe5c19de43e9c1b0484ab02a0cf08b190bcee768ba9  pysnmp-4.4.12.tar.gz
+md5  527c09f53ea7c28963e55b4c4b483ec2  pysnmp-7.1.3.tar.gz
+sha256  29853e4daca82992ae8b1932a4e32e1ec9df8234905b6d594d43773bdc72c4b4  pysnmp-7.1.3.tar.gz
 # Locally computed sha256 checksums
-sha256  d0b2edd772164395320fc5ad7dfaa9806fa038fb29762b347c549891d7a79237  LICENSE.rst
+sha256  4954453957449b5e6f797d070f4d91024dceb3e056c99d72350795b71db0fc70  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index 520ce2877a..5db86bc976 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 4.4.12
+PYTHON_PYSNMP_VERSION = 7.1.3
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/4e/75/72f64c451bf5884715f84f8217b69b4025da0b67628d611cd14a5b7db217
-PYTHON_PYSNMP_SETUP_TYPE = setuptools
-PYTHON_PYSNMP_LICENSE = BSD-3-Clause
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/f3/0c/bb2ccb587b5e79036dd83aa5fe835c2bc460a3098c4060461e9d324c6670
+PYTHON_PYSNMP_SETUP_TYPE = pep517
+PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
+PYTHON_PYSNMP_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
