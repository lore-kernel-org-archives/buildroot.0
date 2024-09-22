Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13881CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA22540639;
	Sun, 22 Sep 2024 09:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9A9hb5Y3oz2d; Sun, 22 Sep 2024 09:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B98E4063A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B98E4063A;
	Sun, 22 Sep 2024 09:04:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4671BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08FA1400CF
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tw_bm9zCGfWY for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:04:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF30940022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF30940022
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF30940022
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:04:35 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82aac438539so154354539f.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726995874; x=1727600674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DpgbqCsK+kii78Xpu3E3VPAqFcxVrFAntCVu2PIzwDE=;
 b=BzwCXgmzxTp/ZZ9+2Wu8Z2Y1ruwNzTQjJqlk/LdkxhdhKx3Mlz7Cb6Zm6+bnC7eTLO
 +s6z6i/MKCHmyitx6oTFoZATyKjGh2qUI7+9KajAFJYswtapXpWylABIiICT13jy8Sp8
 B1WUMRdLvsZHrCOqZLwDWHAl+pmPrnS21cbl3D2GCDA8sC9o4Fdy4NlSoI0rZexc08U3
 MU13aXC0MVVRofbDGwQxlmHBaG7Mhj/EUCV8QLFi7hJvYbzGVYowS+lTczjGCfWniE4s
 pkOi2h7awVmVYDKVrGcwB9FfZBlNkQcqwPLtEeo76Rdv3yfY67Gtu/VHkylUcDuWB2LS
 0vmA==
X-Gm-Message-State: AOJu0YylqDneQVmytoIpAoxx+vvNMUy39ZU3gC2dcFGqxJ/YSy73JYQJ
 q7qYnc57v4XFqn9gb4Nl3k+ihU6WMtNGPYNZOFrVkAWW5zSEHtxHzOEOOw==
X-Google-Smtp-Source: AGHT+IHJOT8cPKDEzPaulB07p0IA3RwXHCWBp0m0QSBtmurMxGuT+FrCnjT49oiFiCVhULMxS4cxoA==
X-Received: by 2002:a05:6602:2cd1:b0:82c:f30d:fc72 with SMTP id
 ca18e2360f4ac-83209ce79b4mr753624339f.2.1726995874524; 
 Sun, 22 Sep 2024 02:04:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d093sm4493066173.74.2024.09.22.02.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:04:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 03:04:32 -0600
Message-Id: <20240922090432.1025967-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726995874; x=1727600674; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DpgbqCsK+kii78Xpu3E3VPAqFcxVrFAntCVu2PIzwDE=;
 b=PQICOpi+vyUv+yYh/q9jSJT1CfGMRRNmY6iCsg8pjFMqM7rx8o0LhI78uR2Rl699Jn
 ych5iiaZOTl/eYpXFxdo64+df0Y09b44ffVb981HyFRohOKX6Zq+atJeuBy1aFhuh1/Q
 AkI5QFhj7YSQ8LB7RJ5yF9egYaJ5QseDimrDl4I9wyhxcR3tAk5aJBbH867kV+TYpJ21
 yqJCH8eOcq+7ZxrF5qW0Aqly6GRvivRDrq7SsyNubm/x4fnun8155XAA4n34nusgscMn
 DhIYcRDgGyMYXinXRuEHCfAZnO0iRIGUb3iXf0ra4ZH4ZaFIEe0KC7v3jBtq7R2lgBhJ
 feIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PQICOpi+
Subject: [Buildroot] [PATCH 1/1] package/python-keyring: bump to version
 25.4.1
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-keyring/python-keyring.hash | 4 ++--
 package/python-keyring/python-keyring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index ca94170de0..e45e108055 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  024f9ec53601f6b91670c31d705546fe  keyring-25.3.0.tar.gz
-sha256  8d85a1ea5d6db8515b59e1c5d1d1678b03cf7fc8b8dcfb1651e8c4a524eb42ef  keyring-25.3.0.tar.gz
+md5  18421ba10fcf6af96586aa0761cc667d  keyring-25.4.1.tar.gz
+sha256  b07ebc55f3e8ed86ac81dd31ef14e81ace9dd9c3d4b5d77a6e9a2016d0d71a1b  keyring-25.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index a0f8a0a647..dff2d19e0c 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 25.3.0
+PYTHON_KEYRING_VERSION = 25.4.1
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/32/30/bfdde7294ba6bb2f519950687471dc6a0996d4f77ab30d75c841fa4994ed
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/a5/1c/2bdbcfd5d59dc6274ffb175bc29aa07ecbfab196830e0cfbde7bd861a2ea
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
