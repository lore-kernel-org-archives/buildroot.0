Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DC5C61D97
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 23:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A01E1615A3;
	Fri, 24 Nov 2023 23:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A01E1615A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMfra9MfssNV; Fri, 24 Nov 2023 23:00:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0373614F8;
	Fri, 24 Nov 2023 23:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0373614F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E90D1BF20B
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 22:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F2D4004A
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 22:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42F2D4004A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TyvEc8b54OKG for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 22:59:54 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F27404010C
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 22:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F27404010C
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-35b10f45696so8023665ab.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 14:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700866792; x=1701471592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tQae4pKkiRGfjlMA7dikE7Wv/1ds3ZakKu7tHlEixF8=;
 b=XqJUNkyBK/f7O8i9OPca5GIqWotuBbqddD1olPtPvN6iPrVTEeVGefbWU6VkAoI9Cm
 j2Z6v9I57tNryGbZSEuVd99gc8bcEHbjZK6bweOlN4XBSXgHsju88RGlFhNdP+viE2Yb
 4DKYZltMF8GDYaLlBedwMy1iPEQl+6sYbcpepA9WhTdWO9KUXQPttfevgY6M1CWw1hSP
 orjsx3a5pSUvwasNlcChHqFNz/wU+jfs8cx1mIG498Lfms2gJ+C+i9qFE9E0Ml+J7vVN
 ISqYQ9U3FQomtdaZOdUxxnktPxrbXCfiueXeYq5+pHduaBVgqU9ajE4GF7A2qRHc77K9
 73YA==
X-Gm-Message-State: AOJu0YyZ6MR7d04fSVcgWINbRiWofBU6NdrQARYuTCc+ZiKPZr6aqkM7
 tBPZdq1OLscrF08vGk+VbQBjS7HknrY=
X-Google-Smtp-Source: AGHT+IH9JAokUtRV3FFo/v6wtT/TSmNtbzmdrVtW93qDHRJJr/rndQv7lRCFTFZ6xtEUtM+tY5MrXw==
X-Received: by 2002:a05:6e02:1445:b0:35c:6981:218c with SMTP id
 p5-20020a056e02144500b0035c6981218cmr3722893ilo.18.1700866792528; 
 Fri, 24 Nov 2023 14:59:52 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 m9-20020a056e020de900b0035b19b773b8sm1280412ilj.59.2023.11.24.14.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 14:59:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 15:59:45 -0700
Message-Id: <20231124225945.163643-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124225945.163643-1-james.hilliard1@gmail.com>
References: <20231124225945.163643-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700866792; x=1701471592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tQae4pKkiRGfjlMA7dikE7Wv/1ds3ZakKu7tHlEixF8=;
 b=bp9qu2eXbpDdGE2jXLVZvNcCUya78EYb/Nk9WC3lwoLNRlBgirRQTq5AGrcpklYh+x
 /99kcJJU4S4Kh3l/H4CX1e+3aMpMFaR05o/P7VT2tgNE1t4zBRQjOn3YG434CaMnA6W1
 Y+icQcmsy9S5bu7ErHkKsm/rc2/ef0MCkZipgiCx0oBPEqIgZftjopZU+yWPNc3b243n
 nTZOIPOr2A2QJWakmNpRw6hlckJ5tHjeDorflBNqRpMyizKSgJXLC56GwDjjJXIsq1Ml
 RYRaYe0EJz6DROTJ4TRHndP+Z5dTu4wkGi84a1Y87k8FxK/IXGtc9UA7kLgxfjnt6ISB
 gpOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bp9qu2eX
Subject: [Buildroot] [PATCH 2/2] package/python-opcua-asyncio: bump to
 version 1.0.5
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-aiosqlite, python-sortedcontainers and python-pyopenssl
runtime dependencies.

Remove no longer required python-lxml runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-opcua-asyncio/Config.in                 | 4 +++-
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 4 ++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-opcua-asyncio/Config.in b/package/python-opcua-asyncio/Config.in
index e5b8623f0d..139238b5e9 100644
--- a/package/python-opcua-asyncio/Config.in
+++ b/package/python-opcua-asyncio/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO
 	bool "python-opcua-asyncio"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_AIOFILES # runtime
+	select BR2_PACKAGE_PYTHON_AIOSQLITE # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
-	select BR2_PACKAGE_PYTHON_LXML # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	select BR2_PACKAGE_PYTHON_SORTEDCONTAINERS # runtime
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	help
 	  opcua-asyncio is an asyncio-based asynchronous
 	  OPC UA client based on python-opcua, removing
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index 21b5794ebf..f5856019a5 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncua/json
-md5  f67770b896d2ffe975adbaea38c5efc9  asyncua-1.0.1.tar.gz
-sha256  515342470022b9c391587dcf526015ff4c7582f566c72406c778c9f9a2757cad  asyncua-1.0.1.tar.gz
+md5  37000bc60b98b4822511ced1c2b4c020  asyncua-1.0.5.tar.gz
+sha256  2757163f2a2ff1d8b923297d4af9b8161d25bed95867c1f67078faaf7f2d3f92  asyncua-1.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index 52c5d5117e..a8be2c8722 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.1
+PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.5
 PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/9f/88/c32bd5904c92475dd30fa2c3130c4f9170a36343d390e2ce5b002fdf1cee
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/bf/c6/3c17b8b5335faffc2f08c728008c5ae7cc46d24f674bc1038a69d1849ef6
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
