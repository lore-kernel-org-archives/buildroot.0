Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A21D36108
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 19:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51ACF605FE;
	Tue,  5 Nov 2024 19:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oWJE_TgEf6h; Tue,  5 Nov 2024 19:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55BF860872
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55BF860872;
	Tue,  5 Nov 2024 19:14:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 132373B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7C31402FF
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_MgUvhkxL9O for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 19:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B007E40304
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B007E40304
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B007E40304
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:14:23 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-83aac75fcceso196225539f.0
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 11:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730834063; x=1731438863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8ISTLPNVLaLJNC+xiSpM4Utb/t72pawjPWp2KSdilqA=;
 b=VJ0fbppJnIx3wzJj7VkcQoVSOVFyYRjDVK6xoLWJ+MeP8gN2YI+yJnQoMy7CKZSNBh
 qrzaasQB4Tb1vbu4/fOaNyH49CbhLA+vue1aHoq+ruuhKdZl9kPOjlJwJyq98i+bT1Vx
 iNlmFJgSlNEimHAdRJ0hujh3hGcm73jJIA3uW67J4x1vEdsp/P+WQ1q2K9HjeC2H0N+a
 H9rDlA0kreq+efLajhLAF+236sklzHOwhuJHhUzCUXWkT5YDnwXlikDSDDkejycCLSmj
 xiJnnqnq8XF1BXilXyxrDZMbSZTUyVhVmeto+bVRnAFYikLcviyc5pxmRzfheRb+Tfsv
 Xl0w==
X-Gm-Message-State: AOJu0YwMJuUYhkGCXpszpAx+3j2JXKSRxgRzI2kuQYy7Q3BBdxV60Wk9
 ro4HdCe15GiZjzgRYChiQLfpQVRP2o1hC4EvHgeTfeVTa6+ica+3tCf3Og==
X-Google-Smtp-Source: AGHT+IF1ADLwlIL1tg606+syMoYToSr6hjl2nJEZzdil+ByEjXXPQVo2b1xtLYCu9nOtaPMiFEVD9g==
X-Received: by 2002:a05:6602:6b0e:b0:82d:18d:bab with SMTP id
 ca18e2360f4ac-83b719f043emr1730252539f.15.1730834062681; 
 Tue, 05 Nov 2024 11:14:22 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b67bb5831sm282181639f.26.2024.11.05.11.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 11:14:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 12:14:20 -0700
Message-Id: <20241105191420.1580269-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730834063; x=1731438863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8ISTLPNVLaLJNC+xiSpM4Utb/t72pawjPWp2KSdilqA=;
 b=JLH/hilVZSWsYPBZeVS7wELCYHgpgucXhRxFRJYPZ+IdghgzIzrMU2iTqrq45xkdHq
 6n6xqVHXdziCpOlNFME8HljjelNmD3kRqKnu7lhIydm/lToI8eSkZiXQCcgoSpycf1N8
 kruoyN0wwVdv3TMhToaYgDFo+9w63mhIHwWz8q9cucI2F5obG7vGkzno0lKk0/qMLYGp
 EYQ4Gwt1ETZbJJqX26nl9z+43okPcWDNlYJMRKhciOY128ZuMJZu/uCguF6DYCF5WAKt
 kr2ndadM6/Er8sOMElJKxOwz0bZOly4rEWOy9Cjcq5sz1QoRxHIRucG8idKHKfBKSh6k
 FOaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JLH/hilV
Subject: [Buildroot] [PATCH 1/1] package/python-typeguard: bump to version
 4.4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 package/python-typeguard/python-typeguard.hash | 4 ++--
 package/python-typeguard/python-typeguard.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typeguard/python-typeguard.hash b/package/python-typeguard/python-typeguard.hash
index 6bb7c031c6..8cd3dd0dc6 100644
--- a/package/python-typeguard/python-typeguard.hash
+++ b/package/python-typeguard/python-typeguard.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typeguard/json
-md5  609f7e69f381dcbe600d971a3c43d4db  typeguard-4.4.0.tar.gz
-sha256  463bd8697a65a4aa576a63767c369b1ecfba8a5ba735edfe3223127b6ecfa28c  typeguard-4.4.0.tar.gz
+md5  842237266846dbb102b7239fcf4faeb6  typeguard-4.4.1.tar.gz
+sha256  0d22a89d00b453b47c49875f42b6601b961757541a2e1e0ef517b6e24213c21b  typeguard-4.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
index 928a34e395..df5433993d 100644
--- a/package/python-typeguard/python-typeguard.mk
+++ b/package/python-typeguard/python-typeguard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEGUARD_VERSION = 4.4.0
+PYTHON_TYPEGUARD_VERSION = 4.4.1
 PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
-PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/79/5a/91b7c8cfc2e96962442abc9d65c650436dd831910b4d7878980d6596fb98
+PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/62/c3/400917dd37d7b8c07e9723f3046818530423e1e759a56a22133362adab00
 PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
 PYTHON_TYPEGUARD_LICENSE = MIT
 PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
