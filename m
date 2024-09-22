Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFC6CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 05:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4EA405EF;
	Sun, 22 Sep 2024 05:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAbDDEYRYZLn; Sun, 22 Sep 2024 05:27:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 335694067F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 335694067F;
	Sun, 22 Sep 2024 05:27:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EA181BF3C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E0298137E
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTdTnIuhHEEi for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 05:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 545878137A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 545878137A
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 545878137A
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 05:27:15 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82a626d73efso124581539f.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726982834; x=1727587634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nQd7cFgOCOsvDVoAomqWMXpdO14gWEFAKNBSg7iIiQc=;
 b=B/Dd2H+/+W+R6MdbLsh4PhMSFziEvUIT/i7p5t873Lm0ouSspPgdsTtkw5n5TQri79
 P1KKKR10qAbdFzM+P5kjGt5xB3wOaOY97f3m4ZbHyAtvX3h2yRMKU4iJfMsFSdqWTqRJ
 pgJhV+R5Va7vpOnn5Kx08vdZBPxHh+NZIrIXfXCxH2GCNNTbGVyZ0B2S7y2jCrGhxrdT
 pNdqdwZNWxKB9WR9TQMhuMkJgUwkKj14xhAQisJoO1/HaUpgBXc70FiXdApHOp0sEw82
 uqBpP0SaXq7EUFBq2dWAGIV9hRqQmA4+5js43vzzXRGRhcd//NSw5GAYK69H9RPFYJJg
 ioaw==
X-Gm-Message-State: AOJu0Yyq2Wu/j7b7qe/E5UrftcVmaxfomfa0M9QF/BrZwkzaGFeK58Dk
 1/ak9ZZypUfjlZGDPsGaymnVwsLpRkA4/xLGTUiQW1GcCEkNSxp6jw0dig==
X-Google-Smtp-Source: AGHT+IHRCtEMdFTXYsA5KaI3zMpbUwCXvSLrskK/1fHIDyK/YzjNljiDIskUoi6lDGVftZcL6ajhIA==
X-Received: by 2002:a05:6e02:2148:b0:3a0:9244:191d with SMTP id
 e9e14a558f8ab-3a0c9d77da6mr49628775ab.16.1726982834059; 
 Sat, 21 Sep 2024 22:27:14 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed597dfsm4461164173.166.2024.09.21.22.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 22:27:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 23:27:11 -0600
Message-Id: <20240922052711.938687-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726982834; x=1727587634; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nQd7cFgOCOsvDVoAomqWMXpdO14gWEFAKNBSg7iIiQc=;
 b=JlN64YNDrxdJfqGuXlkyoMehVzfSBQw6D6T/0xMQub70pnynpr4sT0QvAT7+WEGHHa
 nQJSS00RuSZDYslSGs7EnHSOdL2HJRJVkOLeKbLlX6mAF3wIByaK6nJa/gBr4CDqAgT5
 b/rr5Y8ktREDxcbwdKnfIvnAepI64gWH8CH5bOk03LvQhJrllHL0Otz6Ma0nXQsMqxRd
 ncROwFMWMukHtJC3LWiiA+DfeIEsACMRYIE+8cCw3JSpjbuDyuIK+yahYz1fZbloRP/l
 zWioQgrQY2kAFYUja3uyljuRJYpVxNI9MB+JrNv9isxUXqdaPkW/793zF25Yo+4PvzNA
 uS/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JlN64YND
Subject: [Buildroot] [PATCH 1/1] package/python-twisted: bump to version
 24.7.0
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

Drop no longer required python-pyhamcrest runtime dependency.

Drop no longer required python-pyasn1 runtime dependency.

Migrate from setuptools to hatchling build backend.

License hash changed due to year update:
https://github.com/twisted/twisted/commit/4ed1a5b8ad9aaa1e3c5adb13076a2d79ec4279f1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-twisted/Config.in           |  2 --
 package/python-twisted/python-twisted.hash |  8 ++++----
 package/python-twisted/python-twisted.mk   | 13 ++++++++-----
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 1f3baf57e2..84786689b7 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
 	select BR2_PACKAGE_PYTHON_CONSTANTLY # runtime
 	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
-	select BR2_PACKAGE_PYTHON_PYHAMCREST # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
@@ -35,7 +34,6 @@ config BR2_PACKAGE_PYTHON_TWISTED_CONCH
 	select BR2_PACKAGE_PYTHON_APPDIRS # runtime
 	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
-	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 
 config BR2_PACKAGE_PYTHON_TWISTED_SERIAL
 	bool "Serial support"
diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 36612ff5e7..a414058ca7 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  c9a5dad0813512fabd9de502738c0bf8  Twisted-22.10.0.tar.gz
-sha256  32acbd40a94f5f46e7b42c109bfae2b302250945561783a8b7a059048f2d4d31  Twisted-22.10.0.tar.gz
-# Locally computed sha256
-sha256  686f6426a775450eb3afd00bc3a5c2621f305ddb9c8478ee9bf28a368ef2dece  LICENSE
+md5  f89c2542ea9cb39c5343472fdefb4a22  twisted-24.7.0.tar.gz
+sha256  5a60147f044187a127ec7da96d170d49bcce50c6fd36f594e60f4587eff4d394  twisted-24.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  78d059391dddba18a695c1998ac9dde68160a1df1635f34adcfb3ecba4564802  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 398baed2a8..71d1b32df2 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,14 +4,17 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 22.10.0
-PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/b2/ce/cbb56597127b1d51905b0cddcc3f314cc769769efc5e9a8a67f4617f7bca
-PYTHON_TWISTED_SETUP_TYPE = setuptools
+PYTHON_TWISTED_VERSION = 24.7.0
+PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/8b/bf/f30eb89bcd14a21a36b4cd3d96658432d4c590af3c24bbe08ea77fa7bbbb
+PYTHON_TWISTED_SETUP_TYPE = pep517
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
 PYTHON_TWISTED_CPE_ID_VENDOR = twistedmatrix
 PYTHON_TWISTED_CPE_ID_PRODUCT = twisted
-PYTHON_TWISTED_DEPENDENCIES = python-incremental host-python-incremental
+PYTHON_TWISTED_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-incremental
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
