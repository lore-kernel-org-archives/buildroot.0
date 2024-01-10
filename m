Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDD7C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 05:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0451C8142D;
	Wed, 10 Jan 2024 05:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0451C8142D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBeZ4-Fbrsyv; Wed, 10 Jan 2024 05:13:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5029F813A8;
	Wed, 10 Jan 2024 05:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5029F813A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13B1E1BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD6C5424AB
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD6C5424AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kVdWTJzfIG93 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 05:13:25 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C97742468
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 05:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C97742468
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7bed8faf6ebso65565039f.2
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 21:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704863604; x=1705468404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lDzipy5l0tr3Wu3fvswfuuR837I0V9Nn6gGcqraOyzI=;
 b=ea4auyg25X3f0O8IInzD4/00Km+lInMXiNORWEM8K8nt7p5LlucnlmCaaVlJS3TCGC
 PY7RsT2FiYjawfoSknGyuI+G/SDYJ6tDxC2i6OGXFLin0ydpWdk8zyKCYAK+g8h/pL9z
 F5fTZ+UFkcUlbxXh7R1yMVRR7wzTOgGpyAWMXxpBjVqeL4VM2IUd/66OiyYhFkj0bXtf
 fPAjyo/JW9w7BUIfWrUI+bc2nsry1oanx3w8dRKuV432LbnLKuIAd+YaBSUNXg5BgDq7
 u/522rJacP96r4n7oitM4RybbZEefDJSOZEF++GwmC5WCXWuIh6LH4z0wcWOLWH6PmoP
 ya+Q==
X-Gm-Message-State: AOJu0YzBGasp/uOh1h0i5snfQiE3CcPV58FfnHuyboqCd71VpZctb7Dp
 N66M3GOIKEPNOInAY2sdG8C6pfZsOfalTQ==
X-Google-Smtp-Source: AGHT+IG9zhSpRGEZmDUOt0AbAWBSD3v+GpoekXdXBQU+MAxqi83FoedMrOPB0T44dyoFInsnvnuxwA==
X-Received: by 2002:a6b:680b:0:b0:7bb:296d:34fa with SMTP id
 d11-20020a6b680b000000b007bb296d34famr226103ioc.12.1704863603764; 
 Tue, 09 Jan 2024 21:13:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 v12-20020a02b90c000000b0046b4f448cc5sm1080979jan.91.2024.01.09.21.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 21:13:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 22:13:21 -0700
Message-Id: <20240110051321.1132678-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704863604; x=1705468404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lDzipy5l0tr3Wu3fvswfuuR837I0V9Nn6gGcqraOyzI=;
 b=KNBQEQN43A32LrwSeuh4miHPDApBH+vUzuFHKsQGGP+pFZHR0lONWypjwKrUus01zC
 Wqkcw/ZRNuwnf+zsHJ8W8aGMTOfY7RdzCFxP74cUokxOdDQQoxN0lVY1L7Hqs6pOnq/j
 tr1I5T47pCTjeZCAsgh2mmmFoVOwbswI++7ETAOK3VWocofLNfLZmIw8hnda6QOzx3yn
 XDheQ3bmVX9S1x+QT9ocMG7ijFNjoC/wmnlaCFKyKZJkIgmbmazZRgeEpK/fMGoxdW9C
 oxmVTQYLThYvfQOLrvw11iQubqlf7gPEPYHeQhiXZQW6Z6as1i+nOkc7lL4pos/4HDV/
 JFog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KNBQEQN4
Subject: [Buildroot] [PATCH 1/1] package/python-pyicu: bump to version 2.12
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
Cc: Bernd Kuhls <bernd@kuhls.net>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index 395d2fe47b..01d4bf7fdf 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyicu/json
-md5  f13ffa91014efde6962c4c1ed6ee7a3c  PyICU-2.11.tar.gz
-sha256  3ab531264cfe9132b3d2ac5d708da9a4649d25f6e6813730ac88cf040a08a844  PyICU-2.11.tar.gz
+md5  a4411ff1ed8a09e3e9c1d0d02dc89ad8  PyICU-2.12.tar.gz
+sha256  bd7ab5efa93ad692e6daa29cd249364e521218329221726a113ca3cb281c8611  PyICU-2.12.tar.gz
 # Locally computed sha256 checksums
 sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 213c099d07..50962f601e 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 2.11
+PYTHON_PYICU_VERSION = 2.12
 PYTHON_PYICU_SOURCE = PyICU-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/03/1b/800fce0236be0b8a99b3ccbb797786dd178028960b3fd65544e2d8bad5ac
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/c8/25/38a2104fd48373cfd4eac5104f104ef486f61527e48d627de74794354a2c
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
