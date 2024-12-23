Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A2DE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28F3E40568;
	Mon, 23 Dec 2024 16:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChhLHQu8WvgW; Mon, 23 Dec 2024 16:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E82BB40830
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E82BB40830;
	Mon, 23 Dec 2024 16:32:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59C37D8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A93D60663
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3R0zo0xCobke for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A591605A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A591605A8
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A591605A8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:32:30 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-844c9993c56so384860039f.2
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734971549; x=1735576349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rfrSi5EB7Kn92DG+lxdYcgbXAj1EufmsgS3Q9Pws0do=;
 b=VoSdot6aDTHxkmukIV/m9lEjVVFM0Z5eVMpDNqgyiQfiHqrPgtPyU0qsk7AYDa9CXo
 yRE1ViZ/tJz1F3UtEODQ1hgP9tuKbEH+tzdXfVUAIBjSaHMHKotqZMp/T5c4p3jOdztx
 amnlFcc/rAo2YlD6oZt/ZeRMYXOV0/g9fssXljcNhODhiSdcKyYCyh2BtTwpEAA5urMo
 9ZQHevtBfgBQlr6El6uD02qAVwMEwDGDMXjtAk8dDkNcEY4Nvi6Zci4q/IRamfcpKuqj
 BIIy0F6kRZkoMOU6IPAJa+fW22zVkD47jN8gBWs/COU7/p3AMLGz8C8PiTY0WLmmFpsv
 7sbQ==
X-Gm-Message-State: AOJu0YwNsjyRNUkQT9UEYLCMT4/2cqSPuw4cGBbjxhDKqI6jjDs0yxl5
 dBbUNWHlJ2K1luXJkuXeciRWL68Jm0U80RSLAsEqNPa3y56IxeQVELpBHYl2MqI=
X-Gm-Gg: ASbGncuAYI4qqyTZzDg6TaQcESbtLU92y+4Vy67itO7t4HtS61eCJhxQinVyuSo/ZtR
 GRkhDdSP9NpYUeueh9YtTUVsQNv4Le0vxgbYQxusZL9yFv6JiVnR/PLtFH34mTBFdi64ZJMMKle
 qB+IfW46a7HptlCV8w8wmdiTqlEeZYkDxGNVP0Y6DPSd4W+npUsirtAQNX7X1hGYwOddaBwv4A+
 hocFILWem0SMON3vPBKeJ2RBGuKs5v95v7ZCSj4MxSjAj9pY4s5YZ5Caex7b+f3uvsQCygJ0ohL
 hun/shFczMlnaFrnAJgzqRwnPdyuSMt6cA==
X-Google-Smtp-Source: AGHT+IFwQEklkth9aF5wl6E2KQKgIhWPAq+LmviE40kxdrwRN3gU68BGgaaxMJD9L9fByg0unzCuAw==
X-Received: by 2002:a05:6602:160f:b0:844:ddde:c9cb with SMTP id
 ca18e2360f4ac-8499e49e7d9mr1144793939f.1.1734971549049; 
 Mon, 23 Dec 2024 08:32:29 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8498d8aa81bsm229185339f.36.2024.12.23.08.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:32:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:32:27 -0700
Message-Id: <20241223163227.1869650-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734971549; x=1735576349; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rfrSi5EB7Kn92DG+lxdYcgbXAj1EufmsgS3Q9Pws0do=;
 b=b2JjGkrzuGksaJ6p7bvxNqDUeddb4tN/18swsZUd0/RjLbmQwA4Xduu+okSROtZxeW
 ayMAzqECm65e1GQeki0gcDeXyUVew9nqiaLp+eStUxd5vmdlfDZLHvBc4tDOfMXc6uvH
 mFz0DI1IrOTJ+jytZqdplG1i5XCRUqYhXtIN61FIqZeu+FgHrcUYIrWbbGwOqa20cgML
 Bp6FOuJ+mnhdvBCxZHNzuVSFHEcceVlKs/UdYuWz6NIfo4VDD7zinpQ7olfg49fgne3j
 1gmotsEMOmu6BDvDFMeoR6BnSHpad39SAfQYGlDFfx9Ov16mJdV7PTsIva6fhxktDh0E
 DZMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b2JjGkrz
Subject: [Buildroot] [PATCH 1/1] package/python-engineio: bump to version
 4.11.1
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
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index ecf4d2898e..427e6cea12 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  3e45a23dd8df2d611681cb6970c1fd27  python_engineio-4.10.1.tar.gz
-sha256  166cea8dd7429638c5c4e3a4895beae95196e860bc6f29ed0b9fe753d1ef2072  python_engineio-4.10.1.tar.gz
+md5  cfed3d8b399a2a9889ee2e2371e5e03f  python_engineio-4.11.1.tar.gz
+sha256  ff8a23a843c223ec793835f1bcf584ff89ce0f1c2bcce37dffa6436c6fa74133  python_engineio-4.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 49d5e298fe..99a7dae0a3 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.10.1
+PYTHON_ENGINEIO_VERSION = 4.11.1
 PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/9e/d2/b985b0affc5944620e1f812969322f40204f75297c5087fc4cdd44f1a14e
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/17/54/39e4c942296943cc79a1fd7d744a1a10ba2fc3af59293f26a8bd48c2aa74
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
