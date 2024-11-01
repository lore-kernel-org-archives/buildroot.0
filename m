Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C99AE6F07D
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 19:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C293860686;
	Fri,  1 Nov 2024 19:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFTQ8Vx-_u-b; Fri,  1 Nov 2024 19:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9E8F60680
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9E8F60680;
	Fri,  1 Nov 2024 19:18:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C472F979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A49FE40163
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHzVvkkT1fuv for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 19:18:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7AF0D40141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AF0D40141
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AF0D40141
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:18:18 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-83abf71f244so77594039f.1
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 12:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730488697; x=1731093497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gf64QXmkbzXxdE7QbPPjs6LTR7gP5/OtJz5ddu/D/C8=;
 b=kpCotraNEGbIXT4clbCFDu6661jZYTy2ASt+qdlEY31gI48v4QgOt9rYCtnpvC+Knl
 dVEK2zIRae2HHp4+wZIPmXTTySAGZ4iI8+Om6WUrHnqzj4jt8rMY89EhOQvv82aDXc79
 ZitSSRghbe4ANggwdz5T+T5L4m2LHjPHTHMUbgDhFNVpzy4L6RSUd6MlNLLbFEMSpkpi
 AWsJp5RowCC8S8Mc94zwZjS1k612PJ4RKf4b1IWggf9equKscpNmvyMmpnfQeH+WSOh2
 eSrZ7wvBWTI3pYZjDHOyXLNRiB9IFM6npL8Ar8mNzSYpOZ+vKc0Ifc+iJUHaevELOC+P
 uIDw==
X-Gm-Message-State: AOJu0Yw/qDskBZr3Plnjnzk9ihD09YK2xuJ7JcTIt4qpXDqSRSDgxg1w
 +Vbncl9YNnU3Y6T5Pi0Rb1BCdaJr2Igz39ptaD3KX/4fRyM4yYLB+L6FQg==
X-Google-Smtp-Source: AGHT+IFmhzSINrFbqZmwwdvhvfQAsbv0hfeWknbkDTGCXiiLFZn8ItWi2W1bpFGcU+7agKr/iwFXsQ==
X-Received: by 2002:a05:6602:1589:b0:83a:a8c6:21ad with SMTP id
 ca18e2360f4ac-83b64fc3438mr734749839f.7.1730488697077; 
 Fri, 01 Nov 2024 12:18:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de049a4e31sm867865173.143.2024.11.01.12.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 12:18:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 13:18:15 -0600
Message-Id: <20241101191815.1050446-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730488697; x=1731093497; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gf64QXmkbzXxdE7QbPPjs6LTR7gP5/OtJz5ddu/D/C8=;
 b=DyHRT7NWuzoyKZUQcEDnvxOz0lBcNMvg5NUNfyglh7yacMdBYRpSDT2SkI6H5m7uMK
 XVqoa30cO0CLJo3Y21h+T6gEBfgMe1cNE9rjRXO4kujyjWAAYq/ytK1+v1T5iotmZl0p
 cch2qh4fP0iuyeI3jN4+tE7Lu4gbEI8FxbeYosN8bLvXbTwz/K2m7IGjDB5y8S8/exWG
 a4c5LOxyCWQ9Gic2jBq/TyMgvFBWl7f1/0O4wz+KZO3E3rcLaX7cmO0zv1HCypAZlhWm
 vXi5S9AkIZsFcgPC3Oe/VEvou1GXTzPfkKQ71U4Ihty/84TC6XrDQelhxNjjGK4yI+kt
 vQCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DyHRT7NW
Subject: [Buildroot] [PATCH 1/1] package/python-pydal: bump to version
 20241027.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 09b952fea1..ae4e1bab2f 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  db5439288a58ee0442967f81f2f0492e  pydal-20240906.1.tar.gz
-sha256  9b4a8a16324453d52930d2778c48c37fb3135555d4e04f3390e8a4b00c96c62d  pydal-20240906.1.tar.gz
+md5  7e6e1e955750752715f0f135a9f5cd4f  pydal-20241027.1.tar.gz
+sha256  8f7e9eeb5806d4433dcebda53efca1954eafd5c776fa19ee91e3efad1b9ff414  pydal-20241027.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 3265e21692..4eff89b0d7 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20240906.1
+PYTHON_PYDAL_VERSION = 20241027.1
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/9f/80/cbaf7c90eec1da2404b1e6d100687ec2f01e6ccfbe695922a00de882ec84
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/31/7c/aa20d1d25f22d575e180181feeae4a077ff36414e0547060434c398d159a
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
