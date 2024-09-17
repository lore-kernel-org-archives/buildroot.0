Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28111CAC59F
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 20:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7B526086B;
	Tue, 17 Sep 2024 20:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89igFtDVtjrd; Tue, 17 Sep 2024 20:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACE3F60E18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACE3F60E18;
	Tue, 17 Sep 2024 20:45:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7102F1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 602F081DE4
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYubTzjdyfjB for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 20:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60E8781B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60E8781B26
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60E8781B26
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 20:45:10 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-831e62bfa98so42067939f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 13:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726605909; x=1727210709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aOFaTyHeIZrmVGyfecV5IJ84cTGB2Z06w0F5d+qF3vE=;
 b=r5hu3PrbOZVC/Ob6TFzVh67LV1MBf9SUPnL0kZP+2V9hj/382QBH8DupEdb9zyMGRq
 FbJOa0wlGXZPwymLxkfLRanluZwjdGip3t5valVqlWsfgzGdmvI2j3YKJ6frXkWOGtR1
 ypqcn7yTNp/Rmsb8nxbRTpyxdGvQf/2SdM1+InGr6Kiu4Q24WIxBciutL1j9KELYPPBz
 QqH/Nwa8OqeHy7BOWQdUf4cEHnhn0WVtvA75PZsVvGc6tXuaRou2Tr6UjFfh3dphrSJ/
 XtM0EIlUSQzZd3Fe9Fc2zLjACxlrFmCI+pG13GDkh5k3dInZs7epEidYzycDy8W6L+Bc
 PkTw==
X-Gm-Message-State: AOJu0YzaMPx9MXJDMA07L0YKSDdeU/aCFb22M/xzb/nVS2sojIza2wwE
 //ycL+GuFAi9yz07s4G3MDl/lraktZYcAV2GP85opeMrhZ6TymVX678GQw==
X-Google-Smtp-Source: AGHT+IHQtqVXJngYvESpRi9kgZQWzvEsECFrzBjui3ZNpslIzUc8Sr4lh07OUsp0lm/FczRDn6dgqA==
X-Received: by 2002:a05:6e02:16cb:b0:3a0:451b:ade3 with SMTP id
 e9e14a558f8ab-3a0848c9f4dmr177936145ab.10.1726605909095; 
 Tue, 17 Sep 2024 13:45:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e10b83sm24035925ab.31.2024.09.17.13.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 13:45:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 14:45:07 -0600
Message-Id: <20240917204507.4028023-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726605909; x=1727210709; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aOFaTyHeIZrmVGyfecV5IJ84cTGB2Z06w0F5d+qF3vE=;
 b=EDAReA6w9K6fSx38PocPdIReEq/YukSdoCXf4TJ71eYoRFteVYvbZ3ooOLkUTflEv6
 bl8EvsFWjAr5ugvmxo4kGBmPYDDuP5Zp22rxxW3mpiv1n1ylI0xOa5u95KsaFZ3G4C4C
 0GTHbcOR1VtDUXl6/F4bwWd7BQEKaSYTWljSuLH4HmEQ4kn8KuBdBfjJ6lwMcJAcuZHh
 /7/NTVV3QPQ4Nnv43QIMwC7wtUkDxU/BlZKefBo2MmNEXi1XM4YrPBuPzguhy8Bkg0XB
 c5ZQJH39Xat3huSX/WdQG8lXnA6cBHV09kvm3h41/rhoxx2wouacOXAw2XFNDT/Qh32R
 gJzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EDAReA6w
Subject: [Buildroot] [PATCH 1/1] package/python-pyasn1-modules: bump to
 version 0.4.1
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
 package/python-pyasn1-modules/python-pyasn1-modules.hash | 4 ++--
 package/python-pyasn1-modules/python-pyasn1-modules.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.hash b/package/python-pyasn1-modules/python-pyasn1-modules.hash
index 6f4bb6faf0..fd7b732791 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.hash
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1-modules/json
-md5  94ee572b06ae09f1903b11333575b091  pyasn1_modules-0.3.0.tar.gz
-sha256  5bd01446b736eb9d31512a30d46c1ac3395d676c6f3cafa4c03eb54b9925631c  pyasn1_modules-0.3.0.tar.gz
+md5  2cb6c7001ac5caa2ead3ad2d28c9a43e  pyasn1_modules-0.4.1.tar.gz
+sha256  c28e2dbf9c06ad61c71a075c7e0f9fd0f1b0bb2d2ad4377f240d33ac2ab60a7c  pyasn1_modules-0.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.txt
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.mk b/package/python-pyasn1-modules/python-pyasn1-modules.mk
index 41987028fc..7087d5c44d 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.mk
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_MODULES_VERSION = 0.3.0
+PYTHON_PYASN1_MODULES_VERSION = 0.4.1
 PYTHON_PYASN1_MODULES_SOURCE = pyasn1_modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
-PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/3b/e4/7dec823b1b5603c5b3c51e942d5d9e65efd6ff946e713a325ed4146d070f
+PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/1d/67/6afbf0d507f73c32d21084a79946bfcfca5fbc62a72057e9c23797a737c9
 PYTHON_PYASN1_MODULES_SETUP_TYPE = setuptools
 PYTHON_PYASN1_MODULES_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_MODULES_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
