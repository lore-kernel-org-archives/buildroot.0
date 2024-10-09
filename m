Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87505CEE330
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 16:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29AB140DE2;
	Wed,  9 Oct 2024 16:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ix94s3J_DhU; Wed,  9 Oct 2024 16:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4EA240F88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4EA240F88;
	Wed,  9 Oct 2024 16:56:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8BA1BF3F6
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 122F441025
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8vS3nFpeLAb for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 16:56:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31C50410D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31C50410D2
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31C50410D2
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 16:56:02 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a3938e73d3so307735ab.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 09:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728492961; x=1729097761;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iDV7y27f6J5rjbiRienwezdSbSVWOR7kAfEX2xKiFOc=;
 b=AsWoP9r5ovqg91+R7tdCnzhi4j1C5HzYrJJ5Q/tG/G7TAOSdur/aYbt8WCZjW+loTj
 +mENP2gHTp6/iPnLUa23lcU2bPBjCCafBmGuRfeadq26Lph95b63ADxHDmuVCCiTq84x
 ww2rT/lro/Cukv3ZmIpU7qXoKUsUYZFUGA3YvJDoEGYPsOkNyl/8Y78qVo72aVEDvB/n
 tBoF6VUqpY+woJF2C0XNnC34ZIjE0/oMD0hol09rUwjFM8qUsETc2SegFL0BkTUfPJMt
 FhxE4ev4s0h3lfD6uODVok2S0voUnQ7nmkYtZjkZTr7BzGJ7oNLGjprqodFpCSa4uqwH
 COdw==
X-Gm-Message-State: AOJu0Yz5r2lHkdmIuh/J4QFFSWY6+Yf5/PNaRPv2fFNw+QNSdUYydy2M
 Aj2vKJl8+fnUJWQd3WEFWyFx/dOEFmCRAxTkHASHwT9l031JaNz8SSAvC+4t
X-Google-Smtp-Source: AGHT+IG23Q/Rfp7ElGHmQmoGEptPuJleKMAY3opiwMY5rqF7R5CTFK5m/YmnKJTfhZWYPNQfpHjXFQ==
X-Received: by 2002:a05:6e02:18c9:b0:3a0:a641:b7c7 with SMTP id
 e9e14a558f8ab-3a397ced87bmr35707875ab.4.1728492960788; 
 Wed, 09 Oct 2024 09:56:00 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db9fe909ccsm437714173.41.2024.10.09.09.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 09:55:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 10:55:57 -0600
Message-Id: <20241009165557.3830868-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728492961; x=1729097761; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iDV7y27f6J5rjbiRienwezdSbSVWOR7kAfEX2xKiFOc=;
 b=QcYTEkuZVXrPtTfx53RlMaRbJjxIWyoFWO/NaVYDQWVGIQ2Mm+8CivO5ij7Se/YvWS
 +fmQbFw4AIErAfyf72tixA9uhr8CG+GYBa1B5BYHRI/OxIXx/3s87Jt97usr4V2MOiGK
 Jgn26CdPpLY7BsaWHC8XdOCG19NY+sXC95qB58Mhf7g8FniTXJ+IFaES5VhYj1N8B6I5
 mbTyUOBuEC0LNk4bNKyrvoRvifaUl7+dlrs9ZOUqLuTUxAob/XqjHwKUudws53t0LhOl
 oiJeZ3Rck0RFBDuQsS6idOdnX7Oui5Okq/EOfOkpkmrE+39tlR1Dl3hc6B8WddwfAw4V
 IqqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QcYTEkuZ
Subject: [Buildroot] [PATCH 1/1] package/python-jsonschema-specifications:
 bump to version 2024.10.1
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
 .../python-jsonschema-specifications.hash                     | 4 ++--
 .../python-jsonschema-specifications.mk                       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
index aa919681ac..f68e57cd5a 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema-specifications/json
-md5  de730f6937d1e3660a2d835c4f93f31b  jsonschema_specifications-2023.12.1.tar.gz
-sha256  48a76787b3e70f5ed53f1160d2b81f586e4ca6d1548c5de7085d1682674764cc  jsonschema_specifications-2023.12.1.tar.gz
+md5  e8f726a5b9647031d9ee8b922cf9b56f  jsonschema_specifications-2024.10.1.tar.gz
+sha256  0f38b83639958ce1152d02a7f062902c41c8fd20d558b0c34344292d417ae272  jsonschema_specifications-2024.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 653c839bb4..5abf236cbd 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2023.12.1
+PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2024.10.1
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SOURCE = jsonschema_specifications-$(PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/f8/b9/cc0cc592e7c195fb8a650c1d5990b10175cf13b4c97465c72ec841de9e4b
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/10/db/58f950c996c793472e336ff3655b13fbcf1e3b359dcf52dcf3ed3b52c352
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SETUP_TYPE = pep517
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE = MIT
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
