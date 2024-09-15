Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60770C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2550540136;
	Sun, 15 Sep 2024 07:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsyKPleJDyfP; Sun, 15 Sep 2024 07:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6D504028E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6D504028E;
	Sun, 15 Sep 2024 07:34:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3A51BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3541A403DA
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHX8koe1y2_d for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2FF4403B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2FF4403B4
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2FF4403B4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:34:28 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82aa4fd82a4so115805439f.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726385668; x=1726990468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BJIU3VRONHSYxamrwzEAcj5xA0OGOYwKLuEBszuGAkI=;
 b=HkdJCDrF8FiboNRp7vJ35lUfUbvxFIA6Ef4B6uakJQR7AarwtNcQWmMIgqQKZ4qWIk
 DSiHzsVtx7kRTJMnnbf2d+06E0cure52HC/VxP80IdhiJ3ngti7DrBdZ/uckbh2eYG9B
 HtRHyXcSVlVuIuWUeBcBTeZbIfLzWeVu1oWp6qbbOMRFeCaduO8Xa0calHcnuYazbSOn
 EwCikPC/xC+0tnRJalIBwrGxhF1Mtde6iTWXz1FKlNKeQuutONfxf7QoH4RC9pg0EMni
 +ABerQahM3HjwVUZMzMKlJvejYR5uEEVo2DPNRFl0QGX5IZYd6FzCZol+9gpvyAiwwie
 JUMg==
X-Gm-Message-State: AOJu0Yz1XqowbMJ06uHNBttqguzvZmPDq0v/coyXE5HQZLIfIdWypaB4
 i4jdYQm+wuQ1a6Z1QLQh22TlmkzwWKyzFJ2A8EWA1PwkJi6vLs+jFRORbQ==
X-Google-Smtp-Source: AGHT+IGFxwjKZlwmUL66nUyQcm9y/1AoY2TMAACO1uPlyro9pVxPGHAtEfPmloyFgf2rBPYuHQf75Q==
X-Received: by 2002:a05:6602:6087:b0:804:1579:182c with SMTP id
 ca18e2360f4ac-82d1f8c9fe4mr1128820739f.5.1726385667673; 
 Sun, 15 Sep 2024 00:34:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d4935471esm83430439f.45.2024.09.15.00.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:34:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:34:25 -0600
Message-Id: <20240915073425.1550619-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726385668; x=1726990468; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BJIU3VRONHSYxamrwzEAcj5xA0OGOYwKLuEBszuGAkI=;
 b=Lphs0QqFX8Ma0tcaAizDR1/n0p5OGy+uvC9fhoBfT4T89D9xcR8lkWoh3+CpSJ5uQ+
 YTtbZ9Bmk51tvmPInD4S4hADBjSjuvB1hGmnuZVhbnSUPC79kUPDzcb2TTVSnY8mIXlf
 YV9MwtnlFoVHYKQRkxRDnik2R1V1g7qvOiRZ0hSADXi20npgjXVSs21Ze6c8lf9LJteR
 EHXeRSNa5KfRIIR+V3pUxltAcvUors4acD0pDs18H+0CkrAGmeqS+fUd411qRyYeJObC
 UzgJz4xmKUEtfr3vyOuJZY7bqnvisjWjm5m2TYjR0WZ4bYFzv2IhluT/JDxycD8sZedx
 2Shg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Lphs0QqF
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to version
 3.1.0
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
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index 61e7f05346..59be4fbff9 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  170495b0af3b63ca40ca637dd6e5c6ef  greenlet-3.0.3.tar.gz
-sha256  43374442353259554ce33599da8b692d5aa96f8976d567d4badf263371fbe491  greenlet-3.0.3.tar.gz
+md5  9ff064be5bce917f9a60b609ca65f54b  greenlet-3.1.0.tar.gz
+sha256  b395121e9bbe8d02a750886f108d540abe66075e61e22f7353d9acb0b81be0f0  greenlet-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 1af104519b..6e041d5ffe 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 3.0.3
+PYTHON_GREENLET_VERSION = 3.1.0
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/17/14/3bddb1298b9a6786539ac609ba4b7c9c0842e12aa73aaa4d8d73ec8f8185
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/65/1b/3d91623c3eff61c11799e7f3d6c01f6bfa9bd2d1f0181116fd0b9b108a40
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
