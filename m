Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2BEC47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 06:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F9AE40042;
	Tue,  9 Jan 2024 06:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F9AE40042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2uoGJ9A2fJ-z; Tue,  9 Jan 2024 06:02:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAAF240069;
	Tue,  9 Jan 2024 06:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAAF240069
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79FA81BF3D8
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52D8D41920
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52D8D41920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhmTz2f42L6v for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 06:01:37 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89B8541901
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 06:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89B8541901
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3608402ab93so11697215ab.0
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 22:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704780096; x=1705384896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ollZAMu7ebU/hUNuehNqJ7VZ1th5+xqXYd2tfR5OfO4=;
 b=bfyxATIBNweKOndsG3fWRTzmydGK3vRHrvSwgWcTiptB8Eo/35uubEfY2FkEUDUQMt
 ILZ78CgvwOD8/6R05P4aH3ILDieOBHmVgN4CPgc2haqmt05rK9KJhny7NCV5rVtXy/PI
 U08L/+rrlpzeXWDN7rsq5dKqF+Wbv+PLe0Di/XApMkXzH80Jhrr+IWJce2YzGpxPUpHV
 K6WQ9CK8fLawFKvYAMrhF2mGX5AnxB4Mw1FNAco2AdurPDFnjANfbtx7H+dBsAnRopR3
 yoAyc/6H0/I+0JcOOxOBcr1f1L6glLKAPq9FtZmFurVyoTBn6Xj4CRZ2nIiV5b+JgbAg
 2ByQ==
X-Gm-Message-State: AOJu0YzMGuC/KO9zgpmAF0MeaJBpZlw93nCT21aB6GsaNhajZAipb0oj
 FsH8GxhqR6YIMGRN39CdZp/GVnW6kp6ZHw==
X-Google-Smtp-Source: AGHT+IFw3F7ZKm+0g/HVEqTADzWKPDA5q08g6UpART39PkjjnjWmb/nBGqUq/tgzCsw1dMQQ0/8AyA==
X-Received: by 2002:a05:6e02:2185:b0:360:7425:17b5 with SMTP id
 j5-20020a056e02218500b00360742517b5mr6054472ila.24.1704780095878; 
 Mon, 08 Jan 2024 22:01:35 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 n15-20020a92d9cf000000b0036063b51610sm410975ilq.27.2024.01.08.22.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 22:01:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 23:01:28 -0700
Message-Id: <20240109060128.3974794-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109060128.3974794-1-james.hilliard1@gmail.com>
References: <20240109060128.3974794-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704780096; x=1705384896; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ollZAMu7ebU/hUNuehNqJ7VZ1th5+xqXYd2tfR5OfO4=;
 b=lhwtIYSJSGyTPLYfT9fORfp4KfvnwM4r2CL1AZs//hPrYj46f2proChI029twKD/w8
 i2az4omFZHq9QQ0/XeEqP9TxAK02C4pUJ57W+Tzls9DsHrStq3DFTzJdqoiPCixSNUFW
 FlTDIpYpm6/dDiIRcDGNXksq/O47XltVwLFLk9kZ+pNwFThdtoSECHwm0QlIKZv1LSPm
 WHw7TbcpppGhm5CyvOX4Jv0IOGWRHbOf5lrkk3rY+6DAsTY0Zr2OSljyngJryUyDkrkV
 YIpLMLU8kZn3P+NsvdDCeeQUmXkDUEIIOG8TM5p2/NRG81dj3GDxo62JcHdtfEdLx6VU
 cINg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lhwtIYSJ
Subject: [Buildroot] [PATCH 6/6] package/python-cherrypy: bump to version
 18.9.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-setuptools-scm-git-archive build dependency.

Add new python-jaraco-collections runtime dependency.

Add new python-more-itertools runtime dependency.

Add new python-zc-lockfile runtime dependency.

Drop no longer required python-six and python-jaraco-classes runtime
dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cherrypy/Config.in            | 6 ++++--
 package/python-cherrypy/python-cherrypy.hash | 4 ++--
 package/python-cherrypy/python-cherrypy.mk   | 8 +++++---
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/python-cherrypy/Config.in b/package/python-cherrypy/Config.in
index 7548dcf91b..fd67872873 100644
--- a/package/python-cherrypy/Config.in
+++ b/package/python-cherrypy/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_PYTHON_CHERRYPY
 	bool "python-cherrypy"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jaraco-collections -> python-jaraco-text -> python-inflect -> python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_CHEROOT # runtime
-	select BR2_PACKAGE_PYTHON_JARACO_CLASSES # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_COLLECTIONS # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_PORTEND # runtime
+	select BR2_PACKAGE_PYTHON_ZC_LOCKFILE # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  A minimalist web framework
diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index cd8f8756d8..92697e5f06 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cherrypy/json
-md5  033c58bf3da497f283b039911d1c882b  CherryPy-18.8.0.tar.gz
-sha256  9b48cfba8a2f16d5b6419cc657e6d51db005ba35c5e3824e4728bb03bbc7ef9b  CherryPy-18.8.0.tar.gz
+md5  014dbd400aeda9d2b098ed01c95b4a30  CherryPy-18.9.0.tar.gz
+sha256  6b06c191ce71a86461f30572a1ab57ffc09f43143ba8e42c103c7b3347220eb1  CherryPy-18.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  45ade933c280ece37e3e01d3a91afeed9505746a456f72ad10b0897c49e65104  LICENSE.md
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 9b6ad0e99a..244491a040 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_CHERRYPY_VERSION = 18.8.0
+PYTHON_CHERRYPY_VERSION = 18.9.0
 PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
-PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/60/ea/6c4d16b0cd1f4f64a478bac8a37d75a585e854afb5693ce80a9711efdc4a
+PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/bd/5f/e265a49883bfcfb7f2c3d3d9e96197cfe8136783e96c5ce20e201550aaa0
 PYTHON_CHERRYPY_LICENSE = BSD-3-Clause
 PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.md
 PYTHON_CHERRYPY_SETUP_TYPE = setuptools
-PYTHON_CHERRYPY_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_CHERRYPY_DEPENDENCIES = \
+	host-python-setuptools-scm \
+	host-python-setuptools-scm-git-archive
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
