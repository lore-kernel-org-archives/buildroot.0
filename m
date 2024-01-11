Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2721C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 04:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F01436143E;
	Thu, 11 Jan 2024 04:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F01436143E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ini7wGX32dnj; Thu, 11 Jan 2024 04:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FFE561431;
	Thu, 11 Jan 2024 04:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FFE561431
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BC361BF8B4
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5203A82969
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5203A82969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhpz3Ydgh2tP for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 04:45:34 +0000 (UTC)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 534D782923
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 04:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 534D782923
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3bbbe583e04so3052230b6e.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704948332; x=1705553132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pnn/wKN1U0QvXbdGsxYciimeYGERl+MTcehVX55nOSw=;
 b=kz8coWIHfpJ1FyRwKZ4pm2upThe09Eg1p6rmb9fHAESq4pAIIcpmRf7b9QrnKt2KnZ
 A83KGOfenqzPkRx45UOh59EkzW0TGcniOST2MxYuuVNQ5eLW4ZwO4a42VBW3P4SJKb78
 jjX2UbUz9cnMicXIZRhzEM4B5XCgR3jSJim2R8O6oDkPp1rxO3EzwTGNqts+iv4vCf1l
 OacQuar0mUryehp1E0PeeunY25WuTFHH3KgvwrRa+NJNGZ9hgIPGDHkbdrOsU7yzRcwN
 iTx7f3vd6eWyc3CpCLaQ9jWhiUPTUWg/qJdQ/jXyHzorz+1hlpmi3+pfr7Jht4XGR2J2
 TZGg==
X-Gm-Message-State: AOJu0Yy6bx9yWiVnxuzyok5ntc3790j3Y0oZpLQoedrocUz8lqab4b/7
 keDYupn0abn509+0a6cR00uRcVvvEUdg+Q==
X-Google-Smtp-Source: AGHT+IHZyPkZjUOwrVTyXAoZ3Ob0ixByuTrD/nBy/WRQ+QCEE8BVFMMOK9y1/1A9a2WGzguSzgJSew==
X-Received: by 2002:a05:6808:144e:b0:3bd:5006:e2f4 with SMTP id
 x14-20020a056808144e00b003bd5006e2f4mr768227oiv.82.1704948332606; 
 Wed, 10 Jan 2024 20:45:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 g21-20020a02cd15000000b0046df3b352casm97894jaq.38.2024.01.10.20.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 20:45:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:45:29 -0700
Message-Id: <20240111044530.2889558-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704948332; x=1705553132; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pnn/wKN1U0QvXbdGsxYciimeYGERl+MTcehVX55nOSw=;
 b=FK0HhbJuCgK9a9LSQsk/bVa5b9xqQvPrJgIs5383sGkU+gFNSexhXdxyFINdokukYo
 soQjEJvVfSg27b3asFrxGo7S1slZEjD2CgfXyB2JPkp1wtM3xnfndTqKkaNxTEYmyApt
 KZceJ6fxwKwMCRTV32a9QSXXhn0xAirFaZno2E1YntMJBsbbVJqKgcxRwcj8Kb9Xj/9E
 v37oXLUtb5DzdSTla2ibkp4epg+7Ejgf2AeZCNGB7LcLn1XNnxQ6bx7HQxTJQj0v4m5R
 UsPFzCw7vqfjReP2xC2DpWdw56BYbYvKOTf11PXCUMQ+7+VCok9jpuzWEntZj+bw1fmV
 lEIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FK0HhbJu
Subject: [Buildroot] [PATCH 1/2] package/python-pypng: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-pypng/Config.in         |  6 ++++++
 package/python-pypng/python-pypng.hash |  5 +++++
 package/python-pypng/python-pypng.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-pypng/Config.in
 create mode 100644 package/python-pypng/python-pypng.hash
 create mode 100644 package/python-pypng/python-pypng.mk

diff --git a/package/Config.in b/package/Config.in
index 5b8b15fa54..1375d28116 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1276,6 +1276,7 @@ menu "External python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pyphen/Config.in"
+	source "package/python-pypng/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
diff --git a/package/python-pypng/Config.in b/package/python-pypng/Config.in
new file mode 100644
index 0000000000..c1ed405615
--- /dev/null
+++ b/package/python-pypng/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYPNG
+	bool "python-pypng"
+	help
+	  Pure Python library for saving and loading PNG images.
+
+	  https://gitlab.com/drj11/pypng
diff --git a/package/python-pypng/python-pypng.hash b/package/python-pypng/python-pypng.hash
new file mode 100644
index 0000000000..0f55eef702
--- /dev/null
+++ b/package/python-pypng/python-pypng.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pypng/json
+md5  7d9cce86ceb19524784ade86fb13a063  pypng-0.20220715.0.tar.gz
+sha256  739c433ba96f078315de54c0db975aee537cbc3e1d0ae4ed9aab0ca1e427e2c1  pypng-0.20220715.0.tar.gz
+# Locally computed sha256 checksums
+sha256  8dd127d87bb901ab9c8f584e98b7c7aa8539db27fe62ff01b1ee4be93b6a513a  LICENCE
diff --git a/package/python-pypng/python-pypng.mk b/package/python-pypng/python-pypng.mk
new file mode 100644
index 0000000000..07ad16b67b
--- /dev/null
+++ b/package/python-pypng/python-pypng.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pypng
+#
+################################################################################
+
+PYTHON_PYPNG_VERSION = 0.20220715.0
+PYTHON_PYPNG_SOURCE = pypng-$(PYTHON_PYPNG_VERSION).tar.gz
+PYTHON_PYPNG_SITE = https://files.pythonhosted.org/packages/93/cd/112f092ec27cca83e0516de0a3368dbd9128c187fb6b52aaaa7cde39c96d
+PYTHON_PYPNG_SETUP_TYPE = setuptools
+PYTHON_PYPNG_LICENSE = MIT
+PYTHON_PYPNG_LICENSE_FILES = LICENCE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
