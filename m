Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5425CE77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 20:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06DAA60631;
	Fri, 20 Dec 2024 20:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P584fr1HX89T; Fri, 20 Dec 2024 20:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2C7760666
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2C7760666;
	Fri, 20 Dec 2024 20:58:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FC99920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 20:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DC0F60666
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 20:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xzT1MRu7zI2 for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 20:58:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A3496062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A3496062E
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A3496062E
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 20:58:55 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-844e161a957so176650639f.0
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 12:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734728334; x=1735333134;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5xG0ccY4K1K4YAr22Bp8NllVtWRYJcJGtG7n8Xc8p4M=;
 b=s7p7bEfxroJqkkOCaglA/nrNdXL9yZxRHbsewQmKTKttvSKHtLYO3AjpcI2UaVwNK4
 lsjQlB8Ial2wudcHEXNSWdHaPvUn7sl+8lz21UdbeRlaHrMcIL9fkzVKM2Izwb02G5y0
 +V6QA7Ig78xdAv8zV1lNWjdWI54YqX5wdFwuuaMqSjk0H/K2IKBiP2UtQxuarPhcFbMj
 p6BStx98w0kW5MGdiAgX1g5mGHnJJPuY/KI7u+MS/bhhWiKyJkhj8W+vAIv825GLJAcq
 BnyWVXPCHmXgpXZ4sUmtkrA2vwXXYeTp6KTE6Hb19qhpacWYF6aPxlsgCfCb69KuBlPP
 hAqQ==
X-Gm-Message-State: AOJu0YwOJet+m+Zu4VCG/shSzKPFXn2xa5uy0rPpl03gQHbmSNF1Tmik
 7VuKRj/wnzdBVrOrU9/TV7b1eim3tKPPUZKXIoyifTi65Lr3xK3wfUQljr5wrEQ=
X-Gm-Gg: ASbGncug/SIETQTA+IAjc69aFkit5j0p1f8FIesf8dIR/QuQoGrOKl9f9fyZxaBugN7
 xYkqejoA6IXrdXKSkOLXA0GIxjwfuWQWtTaYqohPQ7i0rJlmx0StcYnIjL2lw45A/2QEZJOo/jX
 aVi83gTW/qV5VN3MvoOefMrFqjFaXmMWGw1cNnrDti39ebNr1H4ZKczgF1lxE48K5b0dmXrL+lK
 AsKisnBG0KUrj24mRqvfgMEsgcEDp0q6goQq23JMBHhBxPfn9RWXmy75h4ZfcpQXOm4eJB8viDw
 HR7jyQdPGagQK4Qk6G5ZJj7FQ+/1KfoU3A==
X-Google-Smtp-Source: AGHT+IFoHK4jhC/Kbf5wmcKC0pinCGBeBjxYCHNE6ked/yzTgufvorr93ckkvR6GOP6otsjsbnmSfg==
X-Received: by 2002:a05:6e02:260a:b0:3a7:81d6:c177 with SMTP id
 e9e14a558f8ab-3c2d2f4b59emr43129945ab.14.1734728334647; 
 Fri, 20 Dec 2024 12:58:54 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c1de08esm989442173.138.2024.12.20.12.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 12:58:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Dec 2024 13:58:52 -0700
Message-Id: <20241220205852.3180626-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734728334; x=1735333134; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5xG0ccY4K1K4YAr22Bp8NllVtWRYJcJGtG7n8Xc8p4M=;
 b=GPuFVVJNtTA8leSbLYYrmk6iG6hoyVSc3ElY7aLqEFIMbW4v4ntQjc0dbHl/7M+aAG
 Cs5gOfX6te+5zJKwMFTWb7L6mBG1FsBrYf/ReTqFrB6YfL2xKP0svdIG87cz/SwH+hgR
 hCT9K+LXTI4CiS1m1B4EMtu4ws9klkdocoZxXzz/wdMvGblPoMU97iYOAa4iM0g8qnwP
 cjzqM65Y04NoI0oInvuMpsWpiodneFn6t46ZZXmBeLYK+5h6EjhehAUl1Xl5z94xtYhN
 YTOZuWI/T9jZqGdeXNxurGPsrIIcs8fAaYFRF+Lg6jtPfVsXf188yA3dEg3Ldd8pirjb
 fJtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GPuFVVJN
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.8.2
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
 James Hilliard <james.hilliard1@gmail.com>
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
index 1c51c5b2ab..09b8508efd 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  7fca9b2c51dce7e1d8585bb1d96dd7d1  pymodbus-3.8.1.tar.gz
-sha256  543e3fabb10e9012801d235108ec81c8db15cc8f8e2c398861d0dc5acf9c623e  pymodbus-3.8.1.tar.gz
+md5  e677f59321fd2ffa9969f586a10c4341  pymodbus-3.8.2.tar.gz
+sha256  c57e41662cb7c26830f2f0e0166ffe2fe08ffd8749e0ce0a56f3d9f4bdc2a5c6  pymodbus-3.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index fe74e3d211..f0cf8cca0d 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.8.1
+PYTHON_PYMODBUS_VERSION = 3.8.2
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/ff/81/7a7bae73b54d3545a1da420886abea0641273bbd87956dc7217b54ef524f
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/49/99/375ce7b037e89ebaf55a55e219ffbf83efdcc0b93a9d39a71d6a1f848e57
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
