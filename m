Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2419C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 01:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02A1B60DF9;
	Sun,  5 Nov 2023 01:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02A1B60DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yu2zujOdj4zV; Sun,  5 Nov 2023 01:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EEBE60DC6;
	Sun,  5 Nov 2023 01:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EEBE60DC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66D731BF21A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45D5E41A60
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45D5E41A60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzDV7fdaUWUS for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 01:59:18 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3963C41A42
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 01:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3963C41A42
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7a6830df017so109461339f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 18:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699149557; x=1699754357;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8T++hsKCdeZ9Yti+SOcR/w4LoPny9mRBZWgHRmVfzaQ=;
 b=WiJd6LarA9O7rEBwaU1qRMNVCyYSZny7uB/rMJsscWimDOvknGQ1xxAFIveNgcnuuT
 IuijOlF4ZYaX7+rZ4cc50xx5d6ozyuCB2UHaKBbwj7fTIF494FPx4YQSX0ZfR2vsO3Ff
 JyU/I8G1dE3kNdiT1YKNFPde3NaEtjDDn+ii58Pa7bbuIA3EUkwRvrg9deB3JOr8y7Em
 CX5gS8fLr+A3NmPdbIKE/MjBdRuvQFNpF72OdV4p18NiT+afU9eKYyRr0zwhxLsO4Pyt
 AOiAPsrJPdW+j5fzfZoZkO9RIBDwe1C+qd70XuCQBNUdPs4MTAzzl4ujQRo1MgLradCl
 b1PQ==
X-Gm-Message-State: AOJu0YwWsjfm1wZ7a2SiHK2W6aYXD2kZhaMM0bb9oh4+UuRljHb61501
 OGcy+JLOnd8uGCexgRSMkTc9rYAE4yI=
X-Google-Smtp-Source: AGHT+IE0BRSSwGRWCTmU46J3PEa81Ih00G20+jm0KYWtzbrYu1bcagMvm9xTbMCawrmRqDB1eTUm2Q==
X-Received: by 2002:a05:6602:48f:b0:794:da97:d194 with SMTP id
 y15-20020a056602048f00b00794da97d194mr31219499iov.19.1699149556898; 
 Sat, 04 Nov 2023 18:59:16 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 n11-20020a056602340b00b007a66df53f71sm1531734ioz.38.2023.11.04.18.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 18:59:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 19:59:14 -0600
Message-Id: <20231105015914.2732362-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699149557; x=1699754357; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8T++hsKCdeZ9Yti+SOcR/w4LoPny9mRBZWgHRmVfzaQ=;
 b=UnWLxVTxEgztOrIYT8iUDOB24s7LxlBjvL3khesHYmylSrWEHo2w1Ss56aUzyaWZ9z
 Yf9fT+uTsSjn5IxTx18Fd0prWDZiVL6Z7QN/6Q5KFYs5ZmZn/mLDg5KPLDOIjHxkKi6U
 VwSrF6iPojGJw7M1pA4Luo8sh9sz7tVXzsJONlsVWBU/7e/oCrQ/lJiRDgIn+spk3m8g
 kNeLoY8UWEsP25UZI+9NNhPvmP8YZFF0I+Ss0dfcSkMZ7wguNXK53DnFHMn5wr5DduPw
 r+Mjr1ftfmMLGabnXB5au/8SdoFWtkdi/AGbngCnThHjhTHosZhygdHg/uOoMavWoCbl
 2Fkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UnWLxVTx
Subject: [Buildroot] [PATCH 1/1] package/python-beautifulsoup4: bump to
 version 4.12.2
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

Migrate from setuptools to pep517 hatchling build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 4 ++--
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index 1777563190..0387af8a65 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
-md5  428d2737d94d238b146081c03d3b2b87  beautifulsoup4-4.12.0.tar.gz
-sha256  c5fceeaec29d09c84970e47c65f2f0efe57872f7cff494c9691a26ec0ff13234  beautifulsoup4-4.12.0.tar.gz
+md5  b49a6696a762e946c2be97c36a5adaa8  beautifulsoup4-4.12.2.tar.gz
+sha256  492bbc69dca35d12daac71c4db1bfff0c876c00ef4a2ffacce226d4638eb72da  beautifulsoup4-4.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  55b4d8d4b1e5bc86d10efac91b74c87bcb77526b0f5b9edaf8b9cd2adc7397b2  LICENSE
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index 7896dd0f39..4c8b996d07 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.12.0
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.12.2
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/c5/4c/b5b7d6e1d4406973fb7f4e5df81c6f07890fa82548ac3b945deed1df9d48
-PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = setuptools
+PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/af/0b/44c39cf3b18a9280950ad63a579ce395dda4c32193ee9da7ff0aed547094
+PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = pep517
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = LICENSE
+PYTHON_BEAUTIFULSOUP4_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
