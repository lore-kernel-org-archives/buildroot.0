Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1242FD0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 22:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C62494032E;
	Sat, 26 Oct 2024 22:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VU8Y8iuJfDW; Sat, 26 Oct 2024 22:59:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99DD040335
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99DD040335;
	Sat, 26 Oct 2024 22:59:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B07F25C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 914D7605E6
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mW2Xhw1QUeT9 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 22:59:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5621605A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5621605A4
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5621605A4
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:59:22 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-83ab6cbd8b1so134977139f.1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729983561; x=1730588361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UocisoHyDlIpiWQlmuNcDfouGpLbytls0DLSL0QaCuE=;
 b=E+46uYw7YxnjVTSV0NmUIQZeMjf5TVkiNW00I0/4hijgomx9ZEeB3IXvYnBYvs6PWS
 5+2tYc+scCzfglEYswMJM1hQvbojbJniD1D4kurw5B+mi/1v7Lp2SotbVbEalnogc1hS
 q9RFene43SPiaE8W723FFLAR9tFp5dTHgIz5ylmrGWrhXkye07BMzcEuCc3HIBZFCcx/
 1BuPM5KvO29s8DGZhUQFT7h9Ll6+44Pl5P+nolFgTTEsQgAk0EfhgbRbHVCQIMBoIObL
 hKmwnqQN48oqJVfH1Vq90XoQWh916C6qAJdznjQnMpIGGRp3fHebmBZtHrlPpD1dM6jG
 u/sw==
X-Gm-Message-State: AOJu0Yy2ZNf+1P3vB3ZZ676VGl126TaCvM7DuIQ19mEZUPkO7AMBU1mW
 QH6shFho1jL+ZRtZY5I8xuu0rln6VdLFLAUJ2fdT0CW+95yG2nCPntMMJA==
X-Google-Smtp-Source: AGHT+IFr31Einmk0eeh5EFOczZsUhHpCO4NYXnzIWZDa69ra+tBonnlXiznROSm4NQR0QkRNSZBIGg==
X-Received: by 2002:a05:6602:1687:b0:837:7f1a:40af with SMTP id
 ca18e2360f4ac-83b1c5d45efmr288076439f.14.1729983561122; 
 Sat, 26 Oct 2024 15:59:21 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc725ea557sm927850173.22.2024.10.26.15.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 15:59:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:59:18 -0600
Message-Id: <20241026225918.3853690-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729983561; x=1730588361; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UocisoHyDlIpiWQlmuNcDfouGpLbytls0DLSL0QaCuE=;
 b=Neimuova3CCetuUrW/quxBDxh9Dit5xGe3zJdaGTsVgJRIb2PyMMbPKx1ojquwgo4M
 DolGZHPSQCmsh6aNPC2hM6GGHQsXIo2jkXt/GiCJR7cIrv5yLeuuEJnW4PQrKDth3d80
 oZ1PMmT/zIDRlp5MfN7sO3svAo250P9M1hoG94e67+RqfL3aZQb0jimTRNtMyxwKeUGj
 eGctWjSLKSNjZN7YyQcJM/PvnIv2m9Ojv0Ow49VRkFYMsBcBH81dcEQs5JOwrAoELC2a
 HfCbRvukmMuCw+Wa0DgcQWtcilulyeyxvtdVvnUOVB/5C/EemxLnPk3txclHBKWwjN79
 u/Qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Neimuova
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.7.4
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 72b5b82019..7e3cadce70 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  c7879e21035bb4fc5d22b473e097b353  pymodbus-3.7.3.tar.gz
-sha256  603490162382fe34258992e3b8fe8d2da573a08aa49257ee7ab7b5b1d1a6653c  pymodbus-3.7.3.tar.gz
+md5  0371a857e08b555cabf3935044675f39  pymodbus-3.7.4.tar.gz
+sha256  573c370aea04523403eea1e159616a583cd7b93cfc5c81b07340d3cccd52c99f  pymodbus-3.7.4.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 6833e8d58b..0bd99cc3da 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.7.3
+PYTHON_PYMODBUS_VERSION = 3.7.4
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/af/33/3ccba09863981b2a3977933aa583b66ab65084bcb94aae4ec94ac23c9e39
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/0b/bc/f98789706351e778676a3e84ed6203160c4f581092e298eb075bc9e08230
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
