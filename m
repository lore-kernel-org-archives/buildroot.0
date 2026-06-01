Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3645CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B1CB405A3;
	Mon,  1 Jun 2026 20:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8gmXPegoT3J; Mon,  1 Jun 2026 20:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FC7C405A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780346904;
	bh=nzwye8G2q8wyFSvNfooAzr0bVUMZMeE2ShPgU4PFJxo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bZsjrs3fc5okmBG3DxcG/Kmq5QJgAaKytvbL98ZOTbg03ugvrc+jonMKLltFwQCZl
	 g1iV7WFUkjxnfzCnGkRSKBAuJii4QtN/NPqeP0KKs2zrqlePDMmzm7IYOfhBWsJVZQ
	 BI24fCYu4rykLOHBplcTZSTLBVRNpVt3wis2+z6FbsUxNTvU6zQx7mSlDMuSN0bAO/
	 JOlVJppbHr2jRzVSLoq7IEkAhVnEQfyQRd5Kb2j5yi11aS4WsYFfIooLwZU/VEQMr8
	 h1Ldq3zcnfYpzTn2ukt6HGLrk0cB+QeDGK1Ygl4gBbY14QzkhU0iRLi97yY1kXGqZ0
	 Hpr+ZYXF2aDvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FC7C405A4;
	Mon,  1 Jun 2026 20:48:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 160E12F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2771360774
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-1hXNaHf887 for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:48:12 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E54260771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E54260771
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E54260771
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:11 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5aa5f11deb2so3140390e87.3
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 13:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780346890; x=1780951690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aOgU7JQS+aGs5Krt6eb2aL0DIN2mi2BJEH+Hlf4C+8c=;
 b=aachj/Ezp+crSGJfly8LB85glDiZzvAn8Rfoo3CWNljX7IRLsK+G9HvhgFhK394K2z
 V3trzFwESxl39RbF4xaN3v8jX2QIK3trVJQq4JbwUiyyWPtv9u2QlVwXbbmenM4Ghr4n
 IU7q2LkjuZz7ayxIy3ypKskVANhADW6rRg8/YIYD0fn0iQmtk3dHgY2xOyf5VNDTvRVv
 bzZkGR/4G6Vvucpcpwe0bowk+DWTyGFLLGtcvChsZpMIuKGhMptUMgYnNKkxWVDob8Rp
 rhmfGvGB/PQu4N3tUNpIhCDL0tNYakvpPl4qTeVmRLGa/q2oiRPS8sULSThZuXZCxnKu
 eXBQ==
X-Gm-Message-State: AOJu0YyXzVwxZIsePzPKjTr+XaNYShaqIMTmMno4GkvMkcmyY/oJUtce
 2StEIJmJ2lZVjh7uwc+zsDeUylQeYeyPDJ+2viwdf0Yq1adzTG+UTUMtnpk2fLGjr9gHDZooKdJ
 6xnJqELZoCg==
X-Gm-Gg: Acq92OGUqEbzga750JDiOUiQlrFyDkUKvUmJghnqtYpzySb3jvP2JjKG0O5kL5AVmTp
 2ynUSXI9WnybC2VHdGr9P0xCfIxWxYnVPtxXTwz4VNQDoaqTDy75dBC33BL0JHfbYr3mtpQf7Ak
 /mkiXLK48KSqyW8kPxN/EUHjSd3pgQ0orHS4C+nGUkgadNn2KjgH8l6VgR7sH1FE7ix6qZOfoud
 LMCq/ueNVwOvQ5OB0WWd8476YzTUiMhTG4+ehq5nHjgE0cPZwI1Ii8pEO0WiHEKpmEnX9IHYBNd
 X2RUuomi4cir27wCdHq6TyiIcx1aAIUuvBKVSnSOEPx4YMGgb4+L1+S0R2FGVHETfw/ehVlBy1B
 IoTRs++dQpzGV/jESZ8upZXXPWHf0x4XD0b5XW+RyHfdEjVMOjBZ6IYZH1Wy97jBiZ57dmrQsz8
 QDnVQ1Y0jL2dTWciZGrgL/++wvcqZUW7sCvyEknbnR6hjVBmQSwXmlP/B4jMz+PQ==
X-Received: by 2002:a05:6512:6415:b0:5aa:7788:d1d3 with SMTP id
 2adb3069b0e04-5aa7788d34emr32762e87.23.1780346889642; 
 Mon, 01 Jun 2026 13:48:09 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-39659c91b7esm25488341fa.13.2026.06.01.13.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 13:48:09 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Date: Mon,  1 Jun 2026 22:47:35 +0200
Message-ID: <20260601204735.888967-10-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601204735.888967-1-j@j-ernberg.se>
References: <20260601204735.888967-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780346890; x=1780951690;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aOgU7JQS+aGs5Krt6eb2aL0DIN2mi2BJEH+Hlf4C+8c=;
 b=PnDqiDjS11SRk8+XGA3AMwW9Kfp95rJilCqumz8TVoTX04cUSKtCb+huYLMRybMm5G
 4+V84559+ERFyPUCvulFBPw3kOnPAuzTd/cRNnflqBDTjDtLutoJTko9+nVwo6rZNMcN
 z5A3WorUEcoEdDtjmjBEeGRChimzj5PkCM+Dvx+QLv4plMU3EgLMK5McFJH9yt+Ez8J0
 8A0WQs8uEOwlrHbCJbOSO3Gyw9ckKOBa3KrJRD2+zr1q5zfh8SAMx4/MhFr3lQ2sjuYX
 EzCFmcLUSnqm2qv3tMe2qO5rXw9vy8uGp85CclxzU6VnKYP8srB1D+LKR7UPe3v88dHz
 kORg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=PnDqiDjS
Subject: [Buildroot] [RFC PATCH 9/9] package/python-html5lib: Drop the
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, John Ernberg <j@j-ernberg.se>,
 John Ernberg <john.ernberg@actia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream has not seen any activity since early 2024 [1], and hasn't made a
release since 2020. [2]

The package will no longer build with setuptools >= 82. [3]

Link: https://github.com/html5lib/html5lib-python/commits/master/ [1]
Link: https://github.com/html5lib/html5lib-python/tags [2]
Link: https://autobuild.buildroot.org/results/994ce8ace0b6704404c3b3df4538f38334c16593/ [3]
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
---
 Config.in.legacy                              |  7 ++++
 package/Config.in                             |  1 -
 ...y-fix-version-parsing-on-Python-3.14.patch | 42 -------------------
 package/python-html5lib/Config.in             |  8 ----
 package/python-html5lib/python-html5lib.hash  |  5 ---
 package/python-html5lib/python-html5lib.mk    | 16 -------
 6 files changed, 7 insertions(+), 72 deletions(-)
 delete mode 100644 package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
 delete mode 100644 package/python-html5lib/Config.in
 delete mode 100644 package/python-html5lib/python-html5lib.hash
 delete mode 100644 package/python-html5lib/python-html5lib.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f74ee85ba8..129674b427 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.xx"
 
+config BR2_PACKAGE_PYTHON_HTML5LIB
+	bool "python-html5lib removed"
+	select BR2_LEGACY
+	help
+	  Upstream is no longer maintained, and the package does not
+	  build with setuptools >= 82.
+
 config BR2_PACKAGE_PYTHON_XLIB
 	bool "python-xlib removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 469afd751f..46429f78f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1150,7 +1150,6 @@ menu "External python modules"
 	source "package/python-hiredis/Config.in"
 	source "package/python-hkdf/Config.in"
 	source "package/python-hpack/Config.in"
-	source "package/python-html5lib/Config.in"
 	source "package/python-httpcore/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-httpx/Config.in"
diff --git a/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch b/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
deleted file mode 100644
index 0147aa1418..0000000000
--- a/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b90dafff1bf342d34d539098013d0b9f318c7641 Mon Sep 17 00:00:00 2001
-From: Andrew Sukach <andrew@sukach.org>
-Date: Fri, 12 Sep 2025 21:53:31 -0700
-Subject: [PATCH] `setup.py`: fix version parsing on Python 3.14 (ast.Str
- removed)
-
-Python 3.14 removes the ast.Str node type. String literals now appear
-as ast.Constant(value=str).
-Update the AST check to accept both ast.Str (for older Pythons) and
-ast.Constant with a string value (for Python 3.8+), allowing html5lib to
-build successfully on Python 3.14 while remaining compatible with older
-version.
-
-Upstream: https://github.com/html5lib/html5lib-python/pull/589
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- setup.py | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 30ee0575..42ab6f67 100644
---- a/setup.py
-+++ b/setup.py
-@@ -92,9 +92,14 @@ def default_environment():
-     for a in assignments:
-         if (len(a.targets) == 1 and
-                 isinstance(a.targets[0], ast.Name) and
--                a.targets[0].id == "__version__" and
--                isinstance(a.value, ast.Str)):
--            version = a.value.s
-+                a.targets[0].id == "__version__"):
-+            if hasattr(ast, "Str") and isinstance(a.value, ast.Str):
-+                version = a.value.s
-+            elif (hasattr(ast, "Constant")
-+                  and isinstance(a.value, ast.Constant)
-+                  and isinstance(a.value.value, str)):
-+                version = a.value.value
-+assert version is not None
- 
- setup(name='html5lib',
-       version=version,
diff --git a/package/python-html5lib/Config.in b/package/python-html5lib/Config.in
deleted file mode 100644
index 34e22049ad..0000000000
--- a/package/python-html5lib/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_HTML5LIB
-	bool "python-html5lib"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
-	help
-	  HTML parser based on the WHATWG HTML specification.
-
-	  https://github.com/html5lib/html5lib-python
diff --git a/package/python-html5lib/python-html5lib.hash b/package/python-html5lib/python-html5lib.hash
deleted file mode 100644
index 5023f5ab66..0000000000
--- a/package/python-html5lib/python-html5lib.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/html5lib/json
-md5  6748742e2ec4cb99287a6bc82bcfe2b0  html5lib-1.1.tar.gz
-sha256  b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f  html5lib-1.1.tar.gz
-# Locally computed sha256 checksums
-sha256  16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  LICENSE
diff --git a/package/python-html5lib/python-html5lib.mk b/package/python-html5lib/python-html5lib.mk
deleted file mode 100644
index 320ef01c7a..0000000000
--- a/package/python-html5lib/python-html5lib.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python-html5lib
-#
-################################################################################
-
-PYTHON_HTML5LIB_VERSION = 1.1
-PYTHON_HTML5LIB_SOURCE = html5lib-$(PYTHON_HTML5LIB_VERSION).tar.gz
-PYTHON_HTML5LIB_SITE = https://files.pythonhosted.org/packages/ac/b6/b55c3f49042f1df3dcd422b7f224f939892ee94f22abcf503a9b7339eaf2
-PYTHON_HTML5LIB_LICENSE = MIT
-PYTHON_HTML5LIB_LICENSE_FILES = LICENSE
-PYTHON_HTML5LIB_SETUP_TYPE = setuptools
-PYTHON_HTML5LIB_CPE_ID_VENDOR = html5lib
-PYTHON_HTML5LIB_CPE_ID_PRODUCT = html5lib
-
-$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
