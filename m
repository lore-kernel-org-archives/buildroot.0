Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C72C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 316DA406DF;
	Mon, 13 May 2024 20:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FQYkj7-K6GK; Mon, 13 May 2024 20:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3E35406E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3E35406E2;
	Mon, 13 May 2024 20:59:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB7861BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E58C760816
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oj2c75D0CSyP for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:59:20 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 698036060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 698036060A
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 698036060A
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:59:19 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1e3c3aa8938so32927515ad.1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 13:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715633958; x=1716238758;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XVoekPpLeCy81TgoR4PhojUJkAJpb8BvkKg5cFovDZY=;
 b=Dhwk3PJwhk5WnsXirmyomz18R+mQ+yAB2FqKZQoXB7YScVveVfd06iE21bOnbOH/CU
 /Yz6GdMM31ZjMqJJxLbgBX5HL6F3UlVXdzNJ1MZpps2ypU9QG92qUB31VUlw5RrfrPbE
 w1aCHbhW6UysctPfK6nZNStgj5bUY26jnVv7gFGnTXrIV4nPMrtvJR8uJhaJC2JMof/p
 WtA3Bz9Kyd61k1zxMef3Hn8w6eVKDNxMwppTpBYDVABZe9GrRZFRqZQ8zvRYNikmlynp
 hikpJcDqgihklMxNQTtLfz8Pcku+QzrrllYQWze5lCumFzVy0Z6Q3MWjOj4PKuPlQfH9
 azDQ==
X-Gm-Message-State: AOJu0Yxo667IUe7Qe77QuPPM3agTT1bodhul7dmSXt42nOJXf+7NSrAZ
 JJKvKgtNOgREAtS+NgyH2vmQQmQ81Vs7cIADBi0tFT6Tsphe/ynJpaDCNEVNzVAA/xglj/u8LHd
 bClM=
X-Google-Smtp-Source: AGHT+IFMYxMVtZyVZUsY/UIz0/IrUbRKCPAmiOGW4YD5HKWsr/t000n99EcxECPqTiJXmNHfKohRVg==
X-Received: by 2002:a17:902:e887:b0:1eb:7d1d:67d7 with SMTP id
 d9443c01a7336-1ef43c0fda8mr147252815ad.3.1715633958248; 
 Mon, 13 May 2024 13:59:18 -0700 (PDT)
Received: from niltesque.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0badcf69sm84033615ad.113.2024.05.13.13.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 13:59:17 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 17:59:02 -0300
Message-ID: <20240513205902.1096057-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1715633958; x=1716238758;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XVoekPpLeCy81TgoR4PhojUJkAJpb8BvkKg5cFovDZY=;
 b=d0wQxfUF5P549BZkCDl+yLh5A7Hj5JfYaZFmY5qMOuM1xFqXrBsUxGvKNCpckDQAmA
 KF36Jv09JOhIz55/ArSRafBbN91SIIhJhw175ULof+u1GItOT1k4pvSnNGaZeTjbS2wP
 TXEQYbhipF/aBnuorTTeP8864l5D1KAbgbnXQtExZmJNri5pIsHm3Ba6Bx2sWsn9LhsZ
 7EW8WaqA/pBISSWrkQyBA1c1RXa/ZXq5NR999eU41TIELaZA7MA8rwctLgIii3ChezbZ
 8vJtQtH3AyVw/bPv1BMuBE7Jk6E4/KvA0K3vbbTZABS6baEnXuVlu0jmGhrW3mysvOS9
 qRiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=d0wQxfUF
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump version to
 2.0.30
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 0bc9256c54..d047719d54 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  ea746e69e0702cc8d2c91c5140ce35cc  SQLAlchemy-2.0.28.tar.gz
-sha256  bd9566b8e58cabd700bc367b60e90d9349cd16f0984973f98a9a09f9c64e86f0  SQLAlchemy-2.0.29.tar.gz
+md5  c13a21626c7ae00b42a08880af574e3c  SQLAlchemy-2.0.30.tar.gz
+sha256  2b1708916730f4830bc69d6f49d37f7698b5bd7530aca7f04f785f8849e95255  SQLAlchemy-2.0.30.tar.gz
 # Locally computed sha256 checksums
 sha256  3c0f59ab887d041de6a4e52ffe3e9edb5d9522de909fae9a6cd7adb6e7be3293  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index b7dac92a99..e1180a4e1a 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.29
+PYTHON_SQLALCHEMY_VERSION = 2.0.30
 PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/99/04/59971bfc2f192e3b52376ca8d1e134c78d04bc044ef7e04cf10c42d2ce17
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/36/d0/0137ebcf0dc230c2e82a621b3af755b8788a2a9dd6fd1b8cd6d5e7f6b00d
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
