Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F039CAC595
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA99860034;
	Tue, 17 Sep 2024 18:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5HJiRxDO0ba; Tue, 17 Sep 2024 18:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCE11608C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE11608C4;
	Tue, 17 Sep 2024 18:30:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 850D61BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80DC1401ED
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjLmFCKrwK8Y for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:30:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B11D40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B11D40139
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B11D40139
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:30:34 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82cdb0baf19so381612039f.3
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726597833; x=1727202633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJv62A0JGYM/+1WPN4/gER+TV6wNKunzx491V8NfiG0=;
 b=uCqsTUUguMEuCUGZOiTDT1MFPD3EtjSutmE4KQ9bwFck3x7LPOSx+pHHYTYZgmJn9z
 otneszwLbytjgnAA3cIoSZZy8Q1IS8uU43LEdQzmocdgdYAYvs2YHJgVysem90GTZW2r
 +tarJ6Ct/1YKDtQjiR2GYy/wCY8B2dCIZ48K127p5VhST+B7xxbXh21wnXYzKbJ6RSnt
 loEQKo1jxJfDXfF2Q/DwD9pIjPllyuCDxJtKY+3HB25iaCDxSei7zIoMAvAy1+fL0xry
 DlGkvpoX8HK13MSn94G2D1JHjNImvB7MnPtXJHiv5Kxd8/KDkQznLjSOXi3qRsQ5TeYr
 SHuQ==
X-Gm-Message-State: AOJu0Yyq/Q62awNSyGEJpoEl/6ifXmlRohrrcP1vlkrmJydJy+cqMGGx
 CwJYj6WbOBWFtVjPexRyLV1pDH61HnFj4ZFJLl50h1iyDj+3NoT+/fE2XQ==
X-Google-Smtp-Source: AGHT+IEA8I/EiDm+SDGsS2cLKE0//C6htjUVeyeE8POLvTgE2veXao77t0NpciYnaPruTVCHxZ2ALg==
X-Received: by 2002:a05:6602:27c8:b0:82c:f2f5:388d with SMTP id
 ca18e2360f4ac-82d1f8fbe4amr2115684539f.7.1726597833074; 
 Tue, 17 Sep 2024 11:30:33 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec17f2esm2090985173.50.2024.09.17.11.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:30:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:30:31 -0600
Message-Id: <20240917183031.3875696-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726597833; x=1727202633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tJv62A0JGYM/+1WPN4/gER+TV6wNKunzx491V8NfiG0=;
 b=KmrilieiVbhFT8jkMb06j52Teg4xI8J5yUtUTkFoK0RZNctRzWgrz9SsZpUTTngczw
 IM7u/qGk2cJIP7YykA03vWboJ4E9kqC0gyr8+tv/0/GDPM9x0avpuIJR6SkB1wdV/MOe
 UAZpGk1dJxDnyPgAop2DHeW1b/GS6YKNhLUYR8TPSSQlCpBdgb2Qtlh2pAwRlfksX7Em
 8UATnkG+3mOcEKBJD3nmXioKFcxDkOwvhZgvXI30+iExFryK7xXx0QY8L8KQY226EhrW
 /KpZALbMUi7iqYJCHSTtvfy/YTNDp3bGrwjLyrk+QexR4F+NyH/+I2ZFMDDR4DCzw0bA
 dlDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kmriliei
Subject: [Buildroot] [PATCH 1/1] package/python-pdm-backend: bump to version
 2.3.3
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
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index cc26e58462..70cbf21c66 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  b2805090bbe41c86eb051b1311c7ba34  pdm_backend-2.3.1.tar.gz
-sha256  c03cfb3a803325c049b57ba2502b409479ebb22b6a4ee3746c1f688b939764e8  pdm_backend-2.3.1.tar.gz
+md5  ba2ab8fb453ec751bc186e9c341d4f3a  pdm_backend-2.3.3.tar.gz
+sha256  a8616f628ec84353d7a0ba86b228dcf01bab5debc9e4d1a29e5311a52425d594  pdm_backend-2.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index a95024ec9b..f1e9fc91d7 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.3.1
+PYTHON_PDM_BACKEND_VERSION = 2.3.3
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/70/f4/eaa4da6e3eaa32d902177e0b81563bb5526b2c387aa312d0dfbecf3c7109
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/75/2b/0be2d0f2eba3a4acb755fd2b0e442ef67770b2ef6c75fd646d49f20968fa
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
