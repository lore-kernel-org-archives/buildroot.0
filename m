Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90717C25B6F
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3D4541842;
	Thu, 26 Oct 2023 09:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3D4541842
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4JSqWZsqSo6; Thu, 26 Oct 2023 09:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68559417FF;
	Thu, 26 Oct 2023 09:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68559417FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5CD31BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B10A4839B4
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B10A4839B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FM2Z_R6DJ1e9 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:23 +0000 (UTC)
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A92288399E
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A92288399E
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-9c3aec5f326so385556566b.1
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312440; x=1698917240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QPWj0SPW9pi50/GAfwgi3VMnrXJFo7dj1LAga3igjvE=;
 b=JdR2mMjS3+tSZzr/e/zKDCvsLTd84NNi2fGsHohRoZ76bbpuURU9iP7vo+Kb/tOrwd
 DIhF3Hm7d+YQ8lqgy0e/ctV/3FHNtY7td3pdimKXyfTiwK2gyomGKkj9m1vcIuBUhNqv
 uFWbW2rvJG5asGbHS/NtK4p+uZlrSCKlHBx0MMEjjUKWdv224jnhHXqHW9yFV8lesr2C
 N9V9MZiD4KB6SV39Z4ioS+bgZbXGActGiqeCRxjkcsBkAKxcaNdSYK06mtj+A9LtYuMI
 yXY5WtPMZxrN0JsYcP5ygG9W3Ed4kGYiWlg4sfW2TqSunMRF+WqKuyoWITJH4YRynAuR
 txKg==
X-Gm-Message-State: AOJu0Yy9x3CB78pHZpCW8Oz1afcfyyw36TR0oJreKApvaJLjxU7cYZ34
 AEo5x4wWy65SqKFqm0CrGH0h72AGef+XFNKhnHXphgSitm+3ZJVp
X-Google-Smtp-Source: AGHT+IHxA754W9bMUzSoYcQDAtQNOYS1aHWpiW6yNkfiyudVVolAXIdPh3Nl8Vrm0nfhvqGBv3uC9Q==
X-Received: by 2002:a17:906:c146:b0:9a1:b85d:c952 with SMTP id
 dp6-20020a170906c14600b009a1b85dc952mr2166037ejc.12.1698312440608; 
 Thu, 26 Oct 2023 02:27:20 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:48 +0200
Message-ID: <20231026092701.12345-18-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312440; x=1698917240;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPWj0SPW9pi50/GAfwgi3VMnrXJFo7dj1LAga3igjvE=;
 b=G5lTshwCXFJ1EOJ7EGiFgaDALQeZv3yCUuNb32nGr3fM5SGHHeeGQ057A2nZacDzJQ
 yvgsM0pGQ/KWCb+rCthywh4Da9LauIGv/FGEqLjzGN0YQY73SvAoQ73JPwzKiOvCE7kt
 /MtRj/TBk862k7xXONMi9ltLMZmVb1fJ+pHSM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=G5lTshwC
Subject: [Buildroot] [PATCH 17/30] package/python-systemd: bump version to
 235
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-systemd/python-systemd.hash | 4 ++--
 package/python-systemd/python-systemd.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-systemd/python-systemd.hash b/package/python-systemd/python-systemd.hash
index 789b48590d..6cc6639218 100644
--- a/package/python-systemd/python-systemd.hash
+++ b/package/python-systemd/python-systemd.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/systemd-python/
-md5  5071ea5bcb976186e92a3f5e75df221d  systemd-python-234.tar.gz
+md5  93f3ca09f35719ca6a4edd1d62d38dd4  systemd-python-235.tar.gz
 # Locally computed
-sha256  fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7  systemd-python-234.tar.gz
+sha256  4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b8008e695c0a  systemd-python-235.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.txt
diff --git a/package/python-systemd/python-systemd.mk b/package/python-systemd/python-systemd.mk
index 3ccfd57ce5..24ba84df76 100644
--- a/package/python-systemd/python-systemd.mk
+++ b/package/python-systemd/python-systemd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SYSTEMD_VERSION = 234 # Should be kept in sync with $(SYSTEMD_VERSION)
+PYTHON_SYSTEMD_VERSION = 235 # Should be kept in sync with $(SYSTEMD_VERSION)
 PYTHON_SYSTEMD_SOURCE = systemd-python-$(PYTHON_SYSTEMD_VERSION).tar.gz
-PYTHON_SYSTEMD_SITE = https://pypi.python.org/packages/e8/a8/00ba0f605837a8f69523e6c3a4fb14675a6430c163f836540129c50b3aef
-PYTHON_SYSTEMD_SETUP_TYPE = distutils
+PYTHON_SYSTEMD_SITE = https://files.pythonhosted.org/packages/10/9e/ab4458e00367223bda2dd7ccf0849a72235ee3e29b36dce732685d9b7ad9
+PYTHON_SYSTEMD_SETUP_TYPE = setuptools
 PYTHON_SYSTEMD_LICENSE = LGPL-2.1
 PYTHON_SYSTEMD_LICENSE_FILES = LICENSE.txt
 PYTHON_SYSTEMD_DEPENDENCIES = systemd # To be able to link against libsystemd
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
