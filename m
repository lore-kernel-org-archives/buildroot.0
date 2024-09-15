Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49204C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F396380F50;
	Sun, 15 Sep 2024 08:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCmsJk73N4JK; Sun, 15 Sep 2024 08:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB3F81499
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDB3F81499;
	Sun, 15 Sep 2024 08:28:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 160DF1BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1142C4061C
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tc0hP1eJizbf for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82B9E40619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82B9E40619
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82B9E40619
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:27:57 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82aa93774ceso202466939f.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 01:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726388876; x=1726993676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mUnA2PTD3bCml910O+9WlhLK1nhIDzM651Cq5e4IvUo=;
 b=GKRZne8Rg8HAOjLDifIhzQR0GklsO9iUYVF1vFWw8uuVbliT4zGwBOk1ZT8+dCin4B
 VhWNRnWwqc70cL4V/mDD4bSyDgd9L2pulHmRieozV1zOn5aWti18VQx1PTm+knmoPlTh
 CiE4c3sgJFcSIxYWyz8nqqo2WP5wmGefOIgjZRzac6oZSy2kx9QKNr+RVSiB+bPoAsD6
 tvjQW9qBte+t5j6I8U4X9ey597LcMlH6RaU1PjIrBI/IjB6+nKGrYgCRxtCo5K6JWCin
 tke1W1zHh3qfoFsVCkW7jBCz/F0TtWlN6u7kjYPeqvJckuFmYg3g1bBjEVKEmZem5XI+
 Naaw==
X-Gm-Message-State: AOJu0YynNHQ7y36WSTlZNgn18AEPCdnIrH4XV9PCbqnrjone9GIiZzpc
 +xKF4JRhzvhuiUYZVocu/PlvP/y8EQ7QYK33fCXYOEMbhVAeDtwLFr3edw==
X-Google-Smtp-Source: AGHT+IEbzJwptynTIZwMc1DBZxGoWNquCTt5EU5dZh2o+q3qrkyLGP8nIFZOXD/LseAXo8+2psjy3g==
X-Received: by 2002:a05:6e02:1a0e:b0:39f:558a:e404 with SMTP id
 e9e14a558f8ab-3a0848ac716mr119790825ab.4.1726388876291; 
 Sun, 15 Sep 2024 01:27:56 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e960ecsm9129935ab.88.2024.09.15.01.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 01:27:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 02:27:53 -0600
Message-Id: <20240915082753.1574945-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726388876; x=1726993676; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mUnA2PTD3bCml910O+9WlhLK1nhIDzM651Cq5e4IvUo=;
 b=fPxLIVGjq6TsucXDfQvaXkks9g6xzP1mSguH28zG/j1oV7gBVX1AJC/X5DraSwndh8
 H4NDoIiZqMqeMTnlGeSMsTs1gTgT+BAsOtQ0nky5ywnKwcpLERGuMUH41Dx2BkQhijaf
 1Ed877amVGWwhhGVBCWRI90cDMghp7DGCWdXrOf3FBCpQgMXajbwcWcusXabTYfHf+xw
 vKQ3dZSl6fPy63C7jR9ySsL+xUKDMGa5RbSpgfk4bzih62snS7uwtQ886LMIefYy0Q6x
 NdsXlR+xnkC5LKy6ZPCjqw8Ysk8TBHaVYko8SIUtcZgXdrQlBU5E9nlZt8VzM7JDE2Br
 dVyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fPxLIVGj
Subject: [Buildroot] [PATCH 1/1] package/python-inflect: bump to version
 7.4.0
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

Drop no longer required python-pydantic runtime dependency and
propagate reverse dependency removal.

Drop no longer required python-typing-extensions runtime dependency.

Add new python-more-itertools runtime dependency.

Add new python-typeguard runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cherrypy/Config.in           | 1 -
 package/python-inflect/Config.in            | 5 ++---
 package/python-inflect/python-inflect.hash  | 4 ++--
 package/python-inflect/python-inflect.mk    | 4 ++--
 package/python-jaraco-collections/Config.in | 1 -
 package/python-jaraco-text/Config.in        | 1 -
 6 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/python-cherrypy/Config.in b/package/python-cherrypy/Config.in
index fd67872873..24e244f3b3 100644
--- a/package/python-cherrypy/Config.in
+++ b/package/python-cherrypy/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CHERRYPY
 	bool "python-cherrypy"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jaraco-collections -> python-jaraco-text -> python-inflect -> python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_CHEROOT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_COLLECTIONS # runtime
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
diff --git a/package/python-inflect/Config.in b/package/python-inflect/Config.in
index daf6bd4a32..c2773aae45 100644
--- a/package/python-inflect/Config.in
+++ b/package/python-inflect/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_INFLECT
 	bool "python-inflect"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
-	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_TYPEGUARD # runtime
 	help
 	  Correctly generate plurals, singular nouns, ordinals,
 	  indefinite articles; convert numbers to words.
diff --git a/package/python-inflect/python-inflect.hash b/package/python-inflect/python-inflect.hash
index 3faa4cc5a5..8b373b8a7e 100644
--- a/package/python-inflect/python-inflect.hash
+++ b/package/python-inflect/python-inflect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/inflect/json
-md5  61c670cf5c4d09314f6a4d3b99d3b98d  inflect-7.0.0.tar.gz
-sha256  63da9325ad29da81ec23e055b41225795ab793b4ecb483be5dc1fa363fd4717e  inflect-7.0.0.tar.gz
+md5  7201084aafe65ed5925a8f055f9281a7  inflect-7.4.0.tar.gz
+sha256  904baa17cc2cb74827a6c27b95692e95670dadc72b208b3e8c1c05aeed47026b  inflect-7.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-inflect/python-inflect.mk b/package/python-inflect/python-inflect.mk
index cef4c06627..926f2c43ef 100644
--- a/package/python-inflect/python-inflect.mk
+++ b/package/python-inflect/python-inflect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INFLECT_VERSION = 7.0.0
+PYTHON_INFLECT_VERSION = 7.4.0
 PYTHON_INFLECT_SOURCE = inflect-$(PYTHON_INFLECT_VERSION).tar.gz
-PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/9f/90/1d0a889847fdce963ebe9684de24a749e4fad627bf595e9f0d32730f85a8
+PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/e1/dc/02614acece4d578e709c606594c989cfd9f15cf6401444e5603e60df9b26
 PYTHON_INFLECT_SETUP_TYPE = setuptools
 PYTHON_INFLECT_LICENSE = MIT
 PYTHON_INFLECT_LICENSE_FILES = LICENSE
diff --git a/package/python-jaraco-collections/Config.in b/package/python-jaraco-collections/Config.in
index a6fa721d4d..6cb1024b88 100644
--- a/package/python-jaraco-collections/Config.in
+++ b/package/python-jaraco-collections/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_JARACO_COLLECTIONS
 	bool "python-jaraco-collections"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jaraco-text -> python-inflect -> python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_JARACO_TEXT # runtime
 	help
 	  Collection objects similar to those in stdlib by jaraco.
diff --git a/package/python-jaraco-text/Config.in b/package/python-jaraco-text/Config.in
index 5044ea3233..9ce179b056 100644
--- a/package/python-jaraco-text/Config.in
+++ b/package/python-jaraco-text/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_JARACO_TEXT
 	bool "python-jaraco-text"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-inflect -> python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_AUTOCOMMAND # runtime
 	select BR2_PACKAGE_PYTHON_INFLECT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_CONTEXT # runtime
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
