Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCD7E77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5BB360E30;
	Thu, 19 Dec 2024 02:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjEjY_zXwu2u; Thu, 19 Dec 2024 02:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9E8C61334
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9E8C61334;
	Thu, 19 Dec 2024 02:46:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 627DFE9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 507B56156F
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1ow1Ng7SdEb for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:46:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46C1960E1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46C1960E1B
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46C1960E1B
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:46:14 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a816cc9483so2184945ab.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:46:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734576373; x=1735181173;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZaE8GWmXdRXBOOWqoxmK1r24CtBBtH5M1Eqp1IE4No=;
 b=OLAQ3h/g61bRRYUeboQkbCQ7JRHOr0h6nBt0v+VD7TNfWVYl+nXz9hfSFbJeONFkxr
 yhHNiS3lAy8nSR5ZxRX7r4WsEaISZGDQ6URyeV+PGNPCqN6Ru/uujx6J1XqLuC/x9gZf
 mVB7MDkoVeeUI2dR/fnD8Jn1XnzV7qixtPxh3YqNaBWyRz+p3IFAE9XnKJdR8zdgRWlI
 0CSR+4U48uiG1gHlS6BMvNfo05vO02G2J9hXs4vnKFKEwXagRwpVkBNHsBB/s8G93Tlp
 IwOQs0+fbUNgUKTVcndUEYE59mdMkXOJh3jxVY9kr7s3V7OeYR88zWJHvX+P8iTx4d3u
 85zg==
X-Gm-Message-State: AOJu0YzaF6uuDbuF+/d2QdHHPJAazTIbR40SmAn6Vh3iujCi8wKTmcv0
 55X/aOChm6OLV6VGwPy7yW/Jo+eSFkiK524V2rgvDgYj9pYGpcq9789+Z/fgTNA=
X-Gm-Gg: ASbGncsJXClYeZgC7xHeYX6ImkB8SphWkfhREUOYs4UmfX8Ye7Y0Axvtx7/a+qP46rQ
 dsYf82x8BCykG4PdLB1cCGHx3QT3BFQxWInHsvLk0hsRZu/7gDN7gEcaSjlB8XjuwmCDAfFEPIt
 cDEuRRGKmRFhzZPN8M6derFvVdPk5VYj1ONwdH8eE9fJefjn26kJKv8M/cv3m/HAxTp34XPicRY
 Qg15fGvfk0qX8MponRIeHuAOt17vQE/45a8+4TxkooUjlhOUWcCpzY/RqVf/pm2YLmrtOmbBXqn
 oaGReB/dubCD18ZEbSSaltCXYeeWSraROw==
X-Google-Smtp-Source: AGHT+IEV5as6krBXxjZoHc7j9Qicnn8krZ8aNhjFzlKPTXvPwS4AmpYz7P8nyzYloIgdgVeAvvqmAA==
X-Received: by 2002:a05:6e02:1f84:b0:3a7:e528:6f1e with SMTP id
 e9e14a558f8ab-3bdc1b2aac5mr44482965ab.11.1734576373019; 
 Wed, 18 Dec 2024 18:46:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c19afc3sm60308173.104.2024.12.18.18.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:46:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:46:10 -0700
Message-Id: <20241219024610.293582-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734576373; x=1735181173; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rZaE8GWmXdRXBOOWqoxmK1r24CtBBtH5M1Eqp1IE4No=;
 b=OwAhyDdeGDGv1Z7nYtstAEdVCIG6r89bYcARvhKEZTkIhFYOqxMNGKyLEr8bWRIIob
 foar42s1nJuhyDeHvs7tam5+sjp/KjuAPcY3LkWPhQWzfZkXbH7oSeMWTJBBMkKKkKG8
 WSNlAM7QAHFZScJErEV0pmQFPzozDdl81DpcRxY/y4mt8IqQ9nXGVa2PfG2MBM//zvCx
 eA/ufP3qXxPIf+Ezs9vco2TJkAKJm1W8P5BDXkWY3XHOlBAH8Xlx8w/jWjvzBh8lDc+o
 mJVbGMs++jgbsWV9aFD/RhbHcSKro5zajBMoWMt1JgzqPiZoeMkgsFOvu6Be0p32EoM5
 EYvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OwAhyDde
Subject: [Buildroot] [PATCH 1/1] package/python-uvicorn: bump to version
 0.34.0
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
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index 42f29766db..bbaf98dfff 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  ec8e5bbfecd14029c81730c0a42ed731  uvicorn-0.32.0.tar.gz
-sha256  f78b36b143c16f54ccdb8190d0a26b5f1901fe5a3c777e1ab29f26391af8551e  uvicorn-0.32.0.tar.gz
+md5  9944ee2becd37cb1c1e804a96c34a9e0  uvicorn-0.34.0.tar.gz
+sha256  404051050cd7e905de2c9a7e61790943440b3416f49cb409f965d9dcd0fa73e9  uvicorn-0.34.0.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 35eb6f42c0..fbb3937af1 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.32.0
+PYTHON_UVICORN_VERSION = 0.34.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/e0/fc/1d785078eefd6945f3e5bab5c076e4230698046231eb0f3747bc5c8fa992
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/4b/4d/938bd85e5bf2edeec766267a5015ad969730bb91e31b44021dfe8b22df6c
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
