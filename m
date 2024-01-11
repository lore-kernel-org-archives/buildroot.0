Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ECAC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 814466143C;
	Thu, 11 Jan 2024 05:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 814466143C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkcZDBFpcVyB; Thu, 11 Jan 2024 05:11:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D9161400;
	Thu, 11 Jan 2024 05:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D9161400
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B41FE1BF23C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9964A83E40
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9964A83E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5LwxCq8UXA3 for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:11:12 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A577A83E3E
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A577A83E3E
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3608cfa5ce6so19416435ab.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704949871; x=1705554671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RbxH69VGiy9Hr6hXLjhz5Q0pAz4wMA67qFAU6NpLqCc=;
 b=an/L0eJY6l+whiw2RHcaMSLOPYLjyhDHiiDgLEBAm/R11uvyBplKp0g4v0L1Mu1vo5
 GETdhxBv/TULEY6D6Hay2mPRpmZfJhRZpJNvTB8x/ujkcLPvSeted/T3YBbxSh9AHaPn
 zT0wXITntq9vki9ECOek7e/w53yTshNso7i+ixdXVdHxXbTfmJoiv9rXpamT2ngD9KAp
 v6w/jwxoV5XFUYXZCEpkOq2I0LLDJZgaGJR4rL4JlSy+iiLcXWT9KXI04fDaEaujNzCd
 DuD1ngqHOrQHfvM7GpbXtFsUFtgExBziucAQx0Yi4Qe0+CF0UXc77vpOBaFhIjqrss/g
 hu9Q==
X-Gm-Message-State: AOJu0YxJM/NsnZVDltV2palzvTFiA01bcN9nTHb3yo+/+zWjsjZZ0gNV
 b6ZjGYHsZcyFV5gTqMwCtV2Minn+d9Yt/w==
X-Google-Smtp-Source: AGHT+IHOdPMG3yzcx0Uqcg7UXfXsLKc3ATFtUjWFNZizP/PlXo/MyDijSCFTyj7jtmgCDE4eMUCVhQ==
X-Received: by 2002:a05:6e02:1ba8:b0:35f:d3aa:584b with SMTP id
 n8-20020a056e021ba800b0035fd3aa584bmr930171ili.3.1704949871116; 
 Wed, 10 Jan 2024 21:11:11 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 y1-20020a056e02128100b0035fea0268bcsm68355ilq.28.2024.01.10.21.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:11:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:11:07 -0700
Message-Id: <20240111051107.2905870-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704949871; x=1705554671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RbxH69VGiy9Hr6hXLjhz5Q0pAz4wMA67qFAU6NpLqCc=;
 b=bVaOr+ZoFfO6DTp+aLDVXHk/Z9wHyGYQxinTYpKfDO/UCZ9VWwt24/68ZedlKfPPf/
 VLOSl6SxEdduP3TRsQ0lXZUCrkqWCQmNAEt4QcWg0IG2jlKvtlI9LlfQ4vpfPVh0CJaH
 9W/3n+B0Ve5PEQT4ij9T6xtyKzl6WH+AKmQZz8SOkgk6hSNx6SgDTakSdqgq2qD2GDq6
 44Kc2jeWpqxM7vn7vmpQjiO0pGqJwz4Qy/lL1DaFCHFK2gKKO4efwvm6NvD1GZQjrqq1
 dLNnSGPR+ppTbt8wssnEtQXmKYTEs+/4gFukI7ZKR6ae9JeewLUXaoQrQeV+GJOdMFQJ
 dmFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bVaOr+Zo
Subject: [Buildroot] [PATCH 1/1] package/python-requests-toolbelt: bump to
 version 1.0.0
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
 package/python-requests-toolbelt/Config.in                    | 2 +-
 .../python-requests-toolbelt/python-requests-toolbelt.hash    | 4 ++--
 package/python-requests-toolbelt/python-requests-toolbelt.mk  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-requests-toolbelt/Config.in b/package/python-requests-toolbelt/Config.in
index ba2b95152e..7d5b4b65c2 100644
--- a/package/python-requests-toolbelt/Config.in
+++ b/package/python-requests-toolbelt/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT
 	help
 	  A utility belt for advanced users of python-requests.
 
-	  https://toolbelt.readthedocs.org
+	  https://toolbelt.readthedocs.io/
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.hash b/package/python-requests-toolbelt/python-requests-toolbelt.hash
index 28abf2c628..12bc58131d 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.hash
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests-toolbelt/json
-md5  636d226d03632d013269aebbc85f4f4b  requests-toolbelt-0.10.1.tar.gz
-sha256  62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d  requests-toolbelt-0.10.1.tar.gz
+md5  6a8348cfc9991b44e499345db1c6f925  requests-toolbelt-1.0.0.tar.gz
+sha256  7681a0a3d047012b5bdc0ee37d7f8f07ebe76ab08caeccfc3921ce23c88d5bc6  requests-toolbelt-1.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1f8cf8bdacd98ed6d36d0fec0c07f7765acebd6e81205962ab5146023b3c858d  LICENSE
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.mk b/package/python-requests-toolbelt/python-requests-toolbelt.mk
index 8c141e3aa9..d0bcb1bb21 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.mk
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_TOOLBELT_VERSION = 0.10.1
+PYTHON_REQUESTS_TOOLBELT_VERSION = 1.0.0
 PYTHON_REQUESTS_TOOLBELT_SOURCE = requests-toolbelt-$(PYTHON_REQUESTS_TOOLBELT_VERSION).tar.gz
-PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/0c/4c/07f01c6ac44f7784fa399137fbc8d0cdc1b5d35304e8c0f278ad82105b58
+PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/f3/61/d7545dafb7ac2230c70d38d31cbfe4cc64f7144dc41f6e4e4b78ecd9f5bb
 PYTHON_REQUESTS_TOOLBELT_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_TOOLBELT_LICENSE = Apache-2.0
 PYTHON_REQUESTS_TOOLBELT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
