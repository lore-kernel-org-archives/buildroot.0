Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0F6CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 07:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C0C8812EA;
	Sun, 22 Sep 2024 07:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIQmD12BDQ9E; Sun, 22 Sep 2024 07:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9250812EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9250812EB;
	Sun, 22 Sep 2024 07:40:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 686511BF3FB
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57227605F0
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQjmN3DfQuhO for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 07:40:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 630EA605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 630EA605ED
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 630EA605ED
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 07:40:22 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a098564893so11148675ab.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726990821; x=1727595621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PrYg6q6JgJ/dtwI8YvrHFfShiv8j3EW4EaKSV/va2zU=;
 b=NlYwX4RVkr703+gKrZfbDQz7aZDimSOCfG4PKtPAd09oQ6FAUV2BUbhR+UjZMBeIQj
 w1CiV4dSn1uffmHO8NnnPHpDD0GeAZlXc7L67YmsoZbkO7Ozxh9mVO04V4CWF0dCFFGS
 3pGmSQCDCasKf9cRkCyFrWNvejoLJpv/thtysMS5NsT31NJp1T5L93tzGwQJ/QpWtN1l
 ZeKKF5Ko1dyxnF8LB7Epuc9fK7+tLGqtjqJtoIPNETqduEEatXCPu4sxdx9iEFOvmGuT
 qmVGYT7bs0ewAwoahYBAsWDgJQJExl4i04DqPGRPkfexRfcZ9thfOZvpJgjmHM/+wCuy
 KiXA==
X-Gm-Message-State: AOJu0YzXmnl8QVeSJdr8gwCVvvTCPGe/edfvpoCmzzduyGs0IKrjnv4t
 c4c+hi4ag+MqPZskM6jf7x7zeLiN6/AdDV2XQLGxDlIVE8zPlmkKhfFWUA==
X-Google-Smtp-Source: AGHT+IGzORcaLpy7Wrlf+EVAnrMzJX1AmnAdMogyw5ZvkaNkfFqvn3snnl2W+rQAIGOwcWOOjwxr7A==
X-Received: by 2002:a05:6e02:4a2:b0:3a0:ca91:2b4e with SMTP id
 e9e14a558f8ab-3a0ca912b99mr37819815ab.3.1726990820979; 
 Sun, 22 Sep 2024 00:40:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13d31sm4488768173.98.2024.09.22.00.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 00:40:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 01:40:18 -0600
Message-Id: <20240922074018.1003428-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726990821; x=1727595621; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PrYg6q6JgJ/dtwI8YvrHFfShiv8j3EW4EaKSV/va2zU=;
 b=VBi+aX2E5XeDs0gj+PZyYOL78QEJhb8iNXDWUumagQEOBsPAaW4OZProcHIUcN3fHT
 MRbs3h+L/GXnXCHM3rrjREPXs+BzgsIrdCRg5k/H1JYuzzgaAwcEC7bSsL479JQgDMeI
 Ld4x1AOHLVkxnxG3BhyD8ADPxXvw9/gVem/ECrst1Dc2QqV+e6ZOVRpy50qPiWtx2p5s
 qsNg53Bl8aCjMFFBb41YKlvkUSj5kQypItLBnxmjNQg24Tezu74B0I33EoJndFcbuvr0
 6yjz+bseJqmFFyPIRrwGfg4uhLjz40TW16WLZOJOjYSSw7DTKtuK0DXwaoPfiVXTb7eD
 mTGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VBi+aX2E
Subject: [Buildroot] [PATCH 1/1] package/python-zopfli: bump to version 0.2.3
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
 package/python-zopfli/python-zopfli.hash | 4 ++--
 package/python-zopfli/python-zopfli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
index 29bdfe5e5b..c397808029 100644
--- a/package/python-zopfli/python-zopfli.hash
+++ b/package/python-zopfli/python-zopfli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zopfli/json
-md5  0c1e41e5403524e0180f3ed9aaa356ec  zopfli-0.2.2.zip
-sha256  2d49db7540d9991976af464ebc1b9ed12988c04d90691bcb51dc4a373a9e2afc  zopfli-0.2.2.zip
+md5  7c8761eac18a9c6c16049192fc4fe119  zopfli-0.2.3.zip
+sha256  dbc9841bedd736041eb5e6982cd92da93bee145745f5422f3795f6f258cdc6ef  zopfli-0.2.3.zip
 # Locally computed sha256 checksums
 sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index d6af6e4b5f..df76845a7f 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPFLI_VERSION = 0.2.2
+PYTHON_ZOPFLI_VERSION = 0.2.3
 PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).zip
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/9a/ed/d004d5737f9546167eecf0ecd995ee1a796703e512deb2f2ea26cdbe4b3e
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/92/d8/71230eb25ede499401a9a39ddf66fab4e4dab149bf75ed2ecea51a662d9e
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
