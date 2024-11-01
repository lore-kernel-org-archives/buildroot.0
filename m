Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD82E6F06E
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 16:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E380D42450;
	Fri,  1 Nov 2024 16:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVQO4G1GTNq8; Fri,  1 Nov 2024 16:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E8DD42457
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E8DD42457;
	Fri,  1 Nov 2024 16:45:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3134060
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C62A4243C
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igNanzZgq2pJ for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 16:45:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0712442457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0712442457
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0712442457
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:45:38 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83a9be2c0e6so81470539f.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 09:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730479538; x=1731084338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8m5EV8gS829oUNnPAuFu/+PmEMrlr5Y2y5sNoVkSFkg=;
 b=vdBhTYwuDEoxLiT+upgMyjU26yEbtDVqgeEEiJsQWkDuoUq9zFnH+JR9lslTK+Tmx4
 05iQdQOwWj3rJ+et6pT75z55/YTmsQMr/z4HcdspTRBoG7+CTyHnlIeeounN0nGA6m+0
 8LXLmPtvvtUOEnCQbOiti4EaZxbAYPC4maOPBQgO39n/NbWJNcWs+ABtdh7MKDJqiewy
 4yJat2/PrTKMU3ZayvZ0DkwdrGvIoSmMlV9y8YixSicTu2PH7J0Jb/0Z7TrBwv5OUhHH
 KEIlS+BdMqRb2R82xfHMtYZEVr6Q82XczCENIqlel01toQPkUUoA3nZjzyM19lRM56RJ
 LG+A==
X-Gm-Message-State: AOJu0YxiEDt82wLn5KrnlOp7oU+VxS6diah3wYG7DqPh6GNIxWvG5BEO
 tS3HhmPBEHxvpkwLfoIXZ/TJFpR8Z2jkmUKadRPZnNNPPEYG+3jiqQ3wbQ==
X-Google-Smtp-Source: AGHT+IFOqOe86EE+L+cn+ffbtTQQVkN/lxKqSrnlb7OIBcZ+VcNENvlhcguT87w8yU+/bcmLmH8UUQ==
X-Received: by 2002:a05:6602:2d8a:b0:83b:56df:a173 with SMTP id
 ca18e2360f4ac-83b719482d8mr387487839f.2.1730479537604; 
 Fri, 01 Nov 2024 09:45:37 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048e4f56sm791727173.78.2024.11.01.09.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 09:45:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 10:45:35 -0600
Message-Id: <20241101164535.376777-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730479538; x=1731084338; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8m5EV8gS829oUNnPAuFu/+PmEMrlr5Y2y5sNoVkSFkg=;
 b=UlwR4MYe+Ovk86ffEYcU2ovkJZw89EHbfrjLqSlyFx16RKh4DbIa2lLx4mzKu4HoLV
 UalCqApGlmdMYqMMPG2ZCTTXNPsdwC00iGUAhCWyP97+RjlB41xenrdAENX+tDqhzUdx
 WtzkBP7sq3LbQtcOE2p9XrrRDygYPWuHUSO7HQjmT9Z/wauQWmnLcwGx3Z+ecLGoOwr5
 jGmo2YRe0JtIqiNr6WiBcuF3gqIjlpZD3AF638fKhznbZuj4yd7gcFeSUi5FXjJz61bm
 pdGSL5d+QxnxvAcDFxXiCvDpCvIDySWzI3Cus957Ti7JzBXQoCfBfDtyQN4SG4LBQFmE
 KAMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UlwR4MYe
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.35.53
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 5dc348fc30..6879cee31c 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  5742162ec6e63e7d7ea7ccc7d1f8c0b0  botocore-1.35.36.tar.gz
-sha256  354ec1b766f0029b5d6ff0c45d1a0f9e5007b7d2f3ec89bcdd755b208c5bc797  botocore-1.35.36.tar.gz
+md5  41a22a0b48a9f4a90f5333fd64bfcb34  botocore-1.35.53.tar.gz
+sha256  e610ae076ad1eaed5680d3990493659bbabdffd67b15c61d8373a23e4bc41062  botocore-1.35.53.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 84a8d43705..3f05c051a2 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.35.36
+PYTHON_BOTOCORE_VERSION = 1.35.53
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/8d/4f/11d2d314f0bdbe7ff975737d125e1a5357115afe28fcc64f13e68b05ba61
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/48/c9/d5a1f5ad4024eda0d5d1b4103d28085c13cf42ca377fc141f7df4ad1cec9
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
