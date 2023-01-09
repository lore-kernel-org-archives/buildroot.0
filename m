Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E663C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 06:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E82660BB0;
	Mon,  9 Jan 2023 06:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E82660BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGwoY62Xpu_T; Mon,  9 Jan 2023 06:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBA4A60B91;
	Mon,  9 Jan 2023 06:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBA4A60B91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 876851BF4D7
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 06:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F15581A12
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 06:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F15581A12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJmR0xYYC0nU for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 06:26:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ED9E81A0D
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5ED9E81A0D
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 06:26:59 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id y4so4176130iof.0
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 22:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0UYOLHh/dmuLvS6VgFvdscfSi5qp9afgWmF2Pj4bzBE=;
 b=17+00nIWNVUZsbBC2jw0HjlZL3yZh6IPy1pVt+v4ssuoIIT4y8hbyjhKZ9zR2D+EiE
 s8bX9OcSelU0ZqEkwPlAvVpANnZdVvl+su4Pq23Hoiiqkk7rpEonVwhnUF4q81jeodfq
 xbNDYvQymO+CWVAgxMxWHRpSyegT9uCBS1lB2TV3pTcBz+Onm63noo0qVWfKbEUy3VWq
 otUqiNpOAeOtioR+6motvhtGORQjeFScq7OLBz4qULLF9zuNHSNgB7DpEJt1AymeD2b4
 eHr2wRqkUWL4oUsvD5po/jTLFRG3zRG9vZHPs7njCrLBCNMhma9/yOGzmDYWtE3BkI89
 la4A==
X-Gm-Message-State: AFqh2kpbYNY6/B5qKlBjucGcApO26jrcj83iGrlBNa8u9/OwlJ/qVPTk
 kthPlCaqSV2nadGsDlDILZ4zu3MNcXxVKEjM
X-Google-Smtp-Source: AMrXdXtn30ZdyzHIgaO6NYhdtk6vGZ/tIYhsSzsXX7cmOyy4PBj2WBiQJC71EZuYFSgEswjxyyNUhA==
X-Received: by 2002:a6b:d00a:0:b0:6d4:264f:2427 with SMTP id
 x10-20020a6bd00a000000b006d4264f2427mr44815200ioa.21.1673245618277; 
 Sun, 08 Jan 2023 22:26:58 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 u10-20020a02c04a000000b0039d756fb908sm2558730jam.40.2023.01.08.22.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 22:26:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 23:26:56 -0700
Message-Id: <20230109062656.2966277-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0UYOLHh/dmuLvS6VgFvdscfSi5qp9afgWmF2Pj4bzBE=;
 b=PBA5dIoPVNMysYPdb+T6B03Mb1DJx16z1Rqq2DJnjmH46NEbqm+jpPfwPhjUeZGl9D
 6qwdRGrOt/8fpq75EHCV6nK6W/YMuFWKM+wL6z7xMzPYZGC6LlkPlT8RIpoTDyWKW3eQ
 4lXiuoVdu6tM1xQ/7X0WSdHdkQE+8CEeAs6j+lcmZU1/uhcUwF5hgHdJt9U07MRK8UvZ
 Sah6uwYlsnwgbL4HkIzgRLVw+uFs8hu8DA78XVNINaVUaSpajfFWJeDWp0EB0PvZvOXa
 sh6+z1FghiQvQWlK+zuYoMPveghrTSJfTevqSWopLbDyF8VcLlWT6c52yg6i+BWfOyta
 ey1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PBA5dIoP
Subject: [Buildroot] [PATCH 1/1] package/python-traitlets: bump to version
 5.8.0
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-traitlets/python-traitlets.hash | 4 ++--
 package/python-traitlets/python-traitlets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 0c68e04518..80fa8d4d44 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5  74ad03a0c8dd45d5621b12e0be0ab38f  traitlets-5.7.1.tar.gz
-sha256  fde8f62c05204ead43c2c1b9389cfc85befa7f54acb5da28529d671175bb4108  traitlets-5.7.1.tar.gz
+md5  95b21c721316bbc06922df9d97af5158  traitlets-5.8.0.tar.gz
+sha256  6cc57d6dc28c85d5365961726ffd19b538739347749e13ebe34e03323a0e8f84  traitlets-5.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3dcd47086529bf178cf7d10f35a8c188a1e9710391acecceef700898a4cf099b  COPYING.md
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index 8cda56817f..7054557a48 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 5.7.1
+PYTHON_TRAITLETS_VERSION = 5.8.0
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/0b/db/9adbbb2bef9a43ecfa4f1cbcec1d662adade10262328a4b7ef65effc6341
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/56/48/0eb99357330a02974d537be8e4096bc58cfac1089e3153570119ccea7a40
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
 PYTHON_TRAITLETS_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
