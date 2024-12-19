Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC96E7718A
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 01:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58012851E8;
	Thu, 19 Dec 2024 01:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tw73JZcxR8st; Thu, 19 Dec 2024 01:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54F72851EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54F72851EA;
	Thu, 19 Dec 2024 01:08:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEBAFC0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CD3F4265C
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTpKj1VDsnQ2 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 01:08:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37D8741A76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37D8741A76
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37D8741A76
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:08:15 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a9c9f2a569so1978425ab.0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 17:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734570494; x=1735175294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wAHDvrnED8Tx4Tr0XSZ5+Y1fYO4yOL+VL7stqz8og/w=;
 b=SLB03cw/lwrQKM+gBAChuFMYz7T1KfZ04giA+vthS/6Qo/0OX3nga+ERkuehgg65HX
 3NYsplodDxkLtNOVUm1ICxjiTZoTFTekxnoD6ARwAqmVS7kylqUe4t/MrgIRpdwD6UFG
 dwWC65aZJX8kPV1q2TtXBN0FSlVbEcrGAz70/mBbUOe5SS4k1DKxgwXBKVwPXEkitnLC
 ap7qvH8noh3SkUa33h4l/1QXqV5mutm0RCu9k+FJxccZyDlu0zI2gQ2iCWyXPkRxk3A5
 J+Tsz7Xjg0DiN9dOisM+FOfhRZ6s4afkS0bzAItIB7PECCaZ1b5VNR56hg6uODhuP2rJ
 uayQ==
X-Gm-Message-State: AOJu0YyXu8VB+w+Vazvjm6KtiSAGyEA6pEBJ+BO4GHhmQaZMU2LygMSQ
 kVXFUZeQXPD8Kl59zcQbaJuL47rcCm4e2ggXcpxLifwF3ODk6jay+8y3twY2Ajc=
X-Gm-Gg: ASbGncthUq8Fx0AO0U9zPZofDw0C833YAuApbkIwVhRlnIE7Y6elirC3Y4FD0RsofFQ
 RFzsG+/1Ynjhr4hR7d1JO64e4XducJYwp0eBIpXoOYdIYv0tDT6csmqVZ32oBGVgMr6ZbzHH0Yr
 J0i/P96JCMhbC9b7Zh1endMwprKBX36BCQ2bKpIA/zXrouNqehwoE3NtXI6VR933dpcy5KAi5XL
 AC7fpMxFKO/HnH45yyDRru9f3DdK5O0vdTVi96ksvVjd9TaTcFAOfjas7/8aMaPKbKLhx9gNGjU
 j1dyCIZ6E0+YpBXnRSkmSrNSS1auj0l5sQ==
X-Google-Smtp-Source: AGHT+IEIyLV8wJzxBSKh2QyPe/sIopKanF2vHG0wkbxtOWSm7bexA18eb2P5gWGOh4WI7RKh9/55OQ==
X-Received: by 2002:a05:6e02:1c81:b0:3a7:4674:d637 with SMTP id
 e9e14a558f8ab-3bdc003e97dmr57403255ab.3.1734570493898; 
 Wed, 18 Dec 2024 17:08:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0e3f36273sm369345ab.55.2024.12.18.17.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 17:08:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 18:08:10 -0700
Message-Id: <20241219010810.237875-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219010810.237875-1-james.hilliard1@gmail.com>
References: <20241219010810.237875-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734570494; x=1735175294; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wAHDvrnED8Tx4Tr0XSZ5+Y1fYO4yOL+VL7stqz8og/w=;
 b=Laf6fQAd/w5CNQo53mEPDjIJuQgUx+Lzd8iZb3yWQzUG1ufEZofHYUXaduph12HyTn
 2ZcJAE5BXZehhlRMO6revQgbPksriqNV3UD++ne7Y8uVM26HaK2IWR2m03TEtUW/rq+G
 FZ0mZY1w6SDr2O+lDdcAzNy5DWgQJ9e/NOi2XC9sta+3IcJ3MGtaoZzZJ1EyuhAST8G7
 4UCuGf47NtZSLaIfD/7LdOrX+TbCTDxyPzPo/Lrlbg2QPFBykUvXcbOTNc6DobTuIfY8
 2M1FLrZlAfqmuDy41KE61xSDVJlXRhoQz845kV8RSkfpUW+lYqf3ukvO2PYw9JzPzff3
 QGOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Laf6fQAd
Subject: [Buildroot] [PATCH 2/2] package/python-aerich: bump to version 0.8.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Replace python-click with python-asyncclick runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ild-backend-to-support-editable-inst.patch | 29 -------------------
 package/python-aerich/Config.in               |  2 +-
 package/python-aerich/python-aerich.hash      |  4 +--
 package/python-aerich/python-aerich.mk        |  4 +--
 4 files changed, 5 insertions(+), 34 deletions(-)
 delete mode 100644 package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch

diff --git a/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch b/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch
deleted file mode 100644
index 67d7c45bfb..0000000000
--- a/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e729bb9b602ba74dea7ccc978dac709283a0934a Mon Sep 17 00:00:00 2001
-From: strayge <strayge@gmail.com>
-Date: Fri, 18 Aug 2023 15:03:38 +0400
-Subject: [PATCH] update poetry build-backend to support editable install
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/tortoise/aerich/commit/e729bb9b602ba74dea7ccc978dac709283a0934a
----
- pyproject.toml | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index b9390e1..7673d70 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -45,8 +45,8 @@ location = "./migrations"
- src_folder = "./."
- 
- [build-system]
--requires = ["poetry>=0.12"]
--build-backend = "poetry.masonry.api"
-+requires = ["poetry-core>=1.0.0"]
-+build-backend = "poetry.core.masonry.api"
- 
- [tool.poetry.scripts]
- aerich = "aerich.cli:main"
--- 
-2.34.1
-
diff --git a/package/python-aerich/Config.in b/package/python-aerich/Config.in
index 3aa39e176d..39c0a50aa1 100644
--- a/package/python-aerich/Config.in
+++ b/package/python-aerich/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_AERICH
 	bool "python-aerich"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
-	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_ASYNCCLICK # runtime
 	select BR2_PACKAGE_PYTHON_DICTDIFFER # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
 	select BR2_PACKAGE_PYTHON_TOMLKIT # runtime
diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index c104c3d58e..ba1ea35997 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  26a99a2c6c604a370b228b74e12c7981  aerich-0.7.2.tar.gz
-sha256  31d67de7b96184636b89de99062e059e5e6204b6251d24c33eb21fc9cf982e09  aerich-0.7.2.tar.gz
+md5  22db080bf0e608344dbd837ff29ee2e8  aerich-0.8.0.tar.gz
+sha256  13786a91469626c025a2e2c5e524cac2b82b900de063b317f402710ee4c11ccb  aerich-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index 6df3dc4f6e..ea4ee07697 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.7.2
+PYTHON_AERICH_VERSION = 0.8.0
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/ca/cd/ae9c60ffc21e2d41e22c62cbf24a60dfad937222d880489703842d179746
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/35/a5/fc8f6e70cedf47757c4738ed6f79420b9cca6ed1655daf527f86e73f3159
 PYTHON_AERICH_SETUP_TYPE = poetry
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
