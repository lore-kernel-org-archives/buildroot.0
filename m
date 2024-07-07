Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9486EC3DA41
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 20:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F42540294;
	Sun,  7 Jul 2024 20:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8d7zzRj6v5ZA; Sun,  7 Jul 2024 20:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F9C40493
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6F9C40493;
	Sun,  7 Jul 2024 20:57:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3F741BF293
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE0A0606A7
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lR3MnDXY8XL4 for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 20:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7CBA9606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CBA9606A5
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CBA9606A5
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 20:57:48 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7f38da3800aso146995239f.0
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 13:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720385867; x=1720990667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MPQELqk8glbpod3tW7Sicc44uJpLXBFRCvhxlMSdZoQ=;
 b=myHqk1i/tsZJ3x3JwT/iTIk2cTGS6Pni8WGjG5zS0qHyyDI0ED5qWVmemlnB6XqURy
 9N/ANEDWTWwhPO/dUepnimD+7ZIRV9Ir5Itt7uXd2h/vl12hcip/TkHvgs9OdGFRdVIz
 waL9FB8wlyajSsz0HT1VpkuB4Iwvfzdxjub94gRq73rzZr+BMK/EF2/2ruY9GP0/i8CD
 Ig2VJSsYmbOCO44UmaB7I8UR1BOnukW6vOoriua6dYeamcJhGPE8SbjOL6U+I7s7Na7F
 iEHlRRbovr3tWV8Fh+DCEwpM0U7D4qU+JBWG2o/aan9c/8Yhdag10ZEy9vl+/ewLO9/E
 nuoA==
X-Gm-Message-State: AOJu0YzjVraTIOR/2ak3syLq3bvhM/yYkHg1E/ExlN7lQh0tCWCt17YN
 +0kck9NCZb93gdK+EwkZ0KmXGDW6c+P3SR4c/XwFC+3hwI2wGou7eL+QyD9m
X-Google-Smtp-Source: AGHT+IGs24M8H6uUPzvFP3Kf3PndNdHay6BgZj8uye/2Vka0AjpyAaj9tlwp5cHZnvknWfBKRu0Idg==
X-Received: by 2002:a5e:de42:0:b0:7f9:c925:24d0 with SMTP id
 ca18e2360f4ac-7f9c925265dmr419695739f.9.1720385867083; 
 Sun, 07 Jul 2024 13:57:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bbb41e2608sm4924736173.7.2024.07.07.13.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 13:57:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 14:57:45 -0600
Message-Id: <20240707205745.2271680-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720385867; x=1720990667; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MPQELqk8glbpod3tW7Sicc44uJpLXBFRCvhxlMSdZoQ=;
 b=X6WooAa8FOHcV8K6QzXdvQJjG9AtOQmgzTvR7pAk6asbGl4F+m/rLFMODA4JwEdHM/
 RaoiKlA8goy8u4FKEl+ENm0V+W4I1N+Az2pXU8sTZVsDtnOb+Ar/Hj+m8H7LDBNi0itl
 nMwRM6lYe3Nj1fP+Ebb+9VFg3cOj7lKbujnlP+m0rqfUHV45w2XV7a2tun4G7Aq28rE/
 5rh7Z63daUHO1UI8lQ9sN4nb5Mt28jB/eZjQ71AJdJ6MPvHwQHVKTmDXa4+SxU2FX8zf
 uMa+po82pVlLbnbrAwidkLFfaDxKNT4EPY1xhVadvM97FgGkP+i2sO2ADhqiRVRQeSx3
 BgRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X6WooAa8
Subject: [Buildroot] [PATCH 1/1] package/python-pypa-build: bump to version
 1.2.1
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
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index 6941f2c012..a4e207e4e4 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  45f216f02135c6acb486ba325e8f8da3  build-1.0.3.tar.gz
-sha256  538aab1b64f9828977f84bc63ae570b060a8ed1be419e7870b8b4fc5e6ea553b  build-1.0.3.tar.gz
+md5  9675d7b278f4533b9b75701e6e87390b  build-1.2.1.tar.gz
+sha256  526263f4870c26f26c433545579475377b2b7588b6f1eac76a001e873ae3e19d  build-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index 266720a555..d8a23ddd8b 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 1.0.3
+PYTHON_PYPA_BUILD_VERSION = 1.2.1
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/98/e3/83a89a9d338317f05a68c86a2bbc9af61235bc55a0c6a749d37598fb2af1
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/ce/9e/2d725d2f7729c6e79ca62aeb926492abbc06e25910dd30139d60a68bcb19
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
