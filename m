Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D295C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 04:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCC1B606FD;
	Sun, 15 Sep 2024 04:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBgoPpb0aCGD; Sun, 15 Sep 2024 04:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5464607E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5464607E4;
	Sun, 15 Sep 2024 04:02:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02B2D1BF8A8
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3F0440169
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oT-pGeg7Qcmt for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 04:02:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6CC1400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6CC1400EF
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6CC1400EF
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 04:02:41 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a09cdeab8eso894095ab.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726372960; x=1726977760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ML7m4C+1GOuzh5MiaCq4t2gGedS3QWMcH0Bzh0fY0Hw=;
 b=kK7DPrJjCgPk3qbh/klvU6FveIgQpWTuDrPehJfUv2J/13yAClM+8ER6P52CJJ2w/P
 sToF7Z4WRww+HoA70grwCGpD9QI0K6hC7C+tWB55vlB2KROoVkWP+l46CLKZ5YHe6hRN
 GNJmK2W2DqEA7r503DTtx1Lxyd1mBMtUjL7zSukK8FNXOJvlo6rehHiZCkmf5886QR2w
 GBSdIkdvcACxJI0EZbcAS3iG2LRDAp/3x2Z97jonzUFpf86NeKbBZbEGQ61bMEzsit5V
 N3O9IQICLekL5F1NbuD16RKSvoJdejOflIilqAwVXDkZKyIY9bOo4lfVagh2Y67c2B5t
 irKw==
X-Gm-Message-State: AOJu0Yyeah1/baRAPsG7Y7Qsk2FRlEZdMAT7faxjJKJyhfjykR2rBqiz
 EkXg0ySDwiDLJj7IWaU8+4169WNipQ4wEd/+jG4oM5JDGRSzj6LbOMYt5Q==
X-Google-Smtp-Source: AGHT+IEJlJLVEfY5cTq0jPKIMcjXLziZsNY79/vogqLM4gmwz9x8qgFdzD7xh9U2j1k8BZuxb0gJ/w==
X-Received: by 2002:a05:6e02:b4c:b0:3a0:4c4e:2e53 with SMTP id
 e9e14a558f8ab-3a08b6f86c2mr78591715ab.5.1726372959965; 
 Sat, 14 Sep 2024 21:02:39 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e7171asm8121365ab.56.2024.09.14.21.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 21:02:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 22:02:37 -0600
Message-Id: <20240915040237.1380704-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726372960; x=1726977760; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ML7m4C+1GOuzh5MiaCq4t2gGedS3QWMcH0Bzh0fY0Hw=;
 b=BwZOtEaKUehpMDcu3PWy7m9a2v6Y7JZNPxekzrqIASLTJZ06ga7xn0r7aV/OEzwTA5
 xNHoMIFdBX9V4exNPDhFxcDloTzr/kastfUIdEWignWdOlkpgY5WBCbTXPUnqpwN0IOP
 Yf0wO1e+IyxvHzWjIyxNaNEqyf7uL8ajRQtREkYXht7NNVA6LuilDaE4iS0oqNIZWkWB
 qAxcYKH3VfAgE3dN9EyzcKz2wZgOAU/tqnRYViWS/QuDlct5oZEPIsyl88e1zg9h8xxi
 E14bpWvgj2zl5DkjLIR4lgBLQyvIhjFZmWm8NdiTX30yVp92Pt6ZcpdF4bjiKY25y9eD
 iF0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BwZOtEaK
Subject: [Buildroot] [PATCH 1/1] package/python-cherrypy: bump to version
 18.10.0
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

Drop no longer required host-python-setuptools-scm-git-archive
build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cherrypy/python-cherrypy.hash |  4 ++--
 package/python-cherrypy/python-cherrypy.mk   | 10 ++++------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index 92697e5f06..73df447a44 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cherrypy/json
-md5  014dbd400aeda9d2b098ed01c95b4a30  CherryPy-18.9.0.tar.gz
-sha256  6b06c191ce71a86461f30572a1ab57ffc09f43143ba8e42c103c7b3347220eb1  CherryPy-18.9.0.tar.gz
+md5  3f7cf1b729467945218bf553f7232da8  cherrypy-18.10.0.tar.gz
+sha256  6c70e78ee11300e8b21c0767c542ae6b102a49cac5cfd4e3e313d7bb907c5891  cherrypy-18.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  45ade933c280ece37e3e01d3a91afeed9505746a456f72ad10b0897c49e65104  LICENSE.md
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 244491a040..1f995ed1df 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CHERRYPY_VERSION = 18.9.0
-PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
-PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/bd/5f/e265a49883bfcfb7f2c3d3d9e96197cfe8136783e96c5ce20e201550aaa0
+PYTHON_CHERRYPY_VERSION = 18.10.0
+PYTHON_CHERRYPY_SOURCE = cherrypy-$(PYTHON_CHERRYPY_VERSION).tar.gz
+PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/93/e8/2f7ef142d1962d08a8885c4c9942212abecad6a80ccdd1620fd1f5c993fd
 PYTHON_CHERRYPY_LICENSE = BSD-3-Clause
 PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.md
 PYTHON_CHERRYPY_SETUP_TYPE = setuptools
-PYTHON_CHERRYPY_DEPENDENCIES = \
-	host-python-setuptools-scm \
-	host-python-setuptools-scm-git-archive
+PYTHON_CHERRYPY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
