Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7909C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7458282A72;
	Fri, 24 Jan 2025 20:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvVlKc-JQrc6; Fri, 24 Jan 2025 20:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7145D82A7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7145D82A7F;
	Fri, 24 Jan 2025 20:15:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7AA694A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFA20428F7
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXmZBWV0eA3j for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A908412FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A908412FF
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A908412FF
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:15:07 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-844e61f3902so173323339f.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737749706; x=1738354506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QCVGJxSxdtZF/9PcFUhncZhhrFXifBrU/XrS1Fq2No8=;
 b=KUtOOQtcsKrIbbDdiLAb9LHpiu/cBZYNc6IPxyXUNbau6SbmTQznD60h/EdNag6m6h
 Dd3J5/yuCRlnivaJ3W/I9e6yR5ryiZIq5eIM7+nw7H0XzxgHfhJkxhNIzuIa6Qx0/U/P
 eyb6MSZc46BJqtaa1BeMU7TUvC4Gl0vThacGRTyFm9p+T4g+u1AJrw/uOvPTuarjzB3y
 Hi872lIHA5a+6thKpf235eACYiBdJiMSEiizv2XYZg+xye7twRTfK1ziaNTSd4Fj/6Mz
 69v3aKny3acYfcufD4ra03ktBpEWyJAaEj1I3velYvgqYRFVMo0jPCm80pAGm19jzZab
 4Ykw==
X-Gm-Message-State: AOJu0Yx0zgr5eRHcYm38kUl+k42aMVQtSqopuc895NVER2Eglf+dWEJS
 nPiKj5AHC59foDknSB0vuA0u4xiS68eJsL5kQ3fDODreMQ+E6W/33aNwaH9m
X-Gm-Gg: ASbGnculdhjJCZMdpNsCagOFK0b+EwFbtXkNgBpE4+/ergzmfJqGlAdQBtMW+Ry0mfw
 VoicBicZqV0I8WQ8fhrawXd1mIcvISgSdosWHiRnUFC/CIZ301E5i+PZwx5V1SfOMih6A3tV5QK
 oKtUSeqiGNNgxFnOamKoCVBSPIILi21P+CJ/NQo8x4vSxZM9Pu7E6GF3O0UKTtyWoJFWmLiFc1Q
 UsVTp4ljH5FE0xJ9zmOwBkBQZpJ4ooY8K1/W4jGEM0X4mjw/A3f+EPHPIBRx9dXfK3TW2CBNysV
 hdqHm+VRtCcUQbRrLQEFc5A4JZGSUBacLCl3DUVHU6Nu7ipoZYTIm1U=
X-Google-Smtp-Source: AGHT+IHU2EGpew7e7Ikchp4/5yGQbDEE0v1mS1WjlTdDoTdDxxfKa8fAOR3ZZJ8V5rtvGOJ4kXUQzA==
X-Received: by 2002:a05:6602:27cb:b0:847:51e2:eb0 with SMTP id
 ca18e2360f4ac-851b62afe94mr2736474839f.12.1737749705954; 
 Fri, 24 Jan 2025 12:15:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da48511sm818196173.67.2025.01.24.12.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:15:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 13:15:02 -0700
Message-Id: <20250124201502.3846270-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737749706; x=1738354506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QCVGJxSxdtZF/9PcFUhncZhhrFXifBrU/XrS1Fq2No8=;
 b=iAYNeRMRGWw04YyfdbVgZYq4k5kq8jlTfBNRe6IIObTRSwbG2lkq6qgYRJNRZrvJPd
 TGF439lJ08DXIv+iR6ppP+aDFnSEOlDjYbeXfkwS4cgoCPFGy8ZkGw80WxvbksoMOq2y
 q+qEs+pjKeI/VvZkGbTGuR0gewLHI6YVGwQTy/d4JX+SZr2zmjoNB2yFWIMS9E38WGq1
 9TxQ+N8E4OBJ6wPn15K4i3rBwpRJQRjb+OxhaUE7lOqs5Mvq4uhyBU6LBPjE1ggzV1+y
 1FzS6rW5lQHQoP7Vs4p1SyCkGI08T5D78mO/BgTik8+xlwtFvQ0Ksn1n6xf1hCQab9ar
 EYXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iAYNeRMR
Subject: [Buildroot] [PATCH 1/1] package/python-pyphen: bump to version
 0.17.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index d37b906910..3c65c068e0 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/Pyphen/json
-md5  acb06fb5953d2b5435fa8d1428d6652f  pyphen-0.17.0.tar.gz
-sha256  1d13acd1ce37a384d7612954ae6c7801bb4c5316da0e2b937b2127ba702a3da4  pyphen-0.17.0.tar.gz
+md5  ce57c010cca3a3b67275b393d2a8b6f2  pyphen-0.17.2.tar.gz
+sha256  f60647a9c9b30ec6c59910097af82bc5dd2d36576b918e44148d8b07ef3b4aa3  pyphen-0.17.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4fd1c78fcec632bc872ba7b42ba04be330029cfffa411039b48a4f2262bb8240  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index 61f050c8c9..8db0518aa4 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.17.0
+PYTHON_PYPHEN_VERSION = 0.17.2
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/66/46/3dd0ae4b52016496069af6c4fca3b5918b0281fc92678f739edb8f3eb377
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/69/56/e4d7e1bd70d997713649c5ce530b2d15a5fc2245a74ca820fc2d51d89d4d
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
