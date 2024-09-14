Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E30C021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F1A406CF;
	Sat, 14 Sep 2024 21:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIWlQJzcDwN7; Sat, 14 Sep 2024 21:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327D9406C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 327D9406C3;
	Sat, 14 Sep 2024 21:52:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB92B1BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9ACE406C2
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a928ubgVN9yD for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 592E0406C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 592E0406C3
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 592E0406C3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:51:58 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82ceab75c27so127385039f.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726350717; x=1726955517;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yFiZiNLEolf4fKU0tXbnrZPHiX5Yh91FVrl0Gp782Jk=;
 b=AOLG9ILBRfjICylRuVv8x7FokBAIb8ZTcJ4NkGgytFZOfGL88oWIZDb9jOangN9+tc
 oOZ4m+JrJQ31jPb/19n/4+97IdkCFWc9DaW/OOXY9WJTmMGteYSYur+/V484tDNUMTDE
 2BZIjHKensboNyeUQhyzK62xTiHI7EVBEWVJrwm/c/Vy8qsYJGqfw70EmYUx3rmXona/
 pn7/Az0pN2rX9ynptztKnSXHZ/m5UP1Vlzgy33oiHNU4USo+ua6uPG1Ox8zOCmEcBjuK
 sByzI9bysvtfr2CiitvgSrvev/LcssBPFfQwvQPkZvAKswlz0HmkqS+nryX2Ay8N7n45
 ouZA==
X-Gm-Message-State: AOJu0YzE7Zxm7MzpggKP4zKmkjT6vTRmBHNGfTsr0BatleNi/2QUjlWC
 hvcfRJcBE4aYd9zMlyvXS4BPWeTKmvGWP+mqsiZ4loJe48dw8sbSsRiy4g==
X-Google-Smtp-Source: AGHT+IEuvynZLpeATjmGys9RMgfyDZyXjb95G/cKYL1SzB8Th9cqR8iV5jTg2RuSRN7+wmrftRGFeA==
X-Received: by 2002:a05:6602:3419:b0:82d:1cf:5e0c with SMTP id
 ca18e2360f4ac-82d376aa563mr815640539f.4.1726350716990; 
 Sat, 14 Sep 2024 14:51:56 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4e1csm602306173.20.2024.09.14.14.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 14:51:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:51:54 -0600
Message-Id: <20240914215154.1325864-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726350717; x=1726955517; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yFiZiNLEolf4fKU0tXbnrZPHiX5Yh91FVrl0Gp782Jk=;
 b=RVQXRPOwVTD17z5A1PI4yBZKgujJdeu/eeBc3qSoyhEstwMdUdPqCcuBtQ1pypA0Zz
 0TV/itREqfm8m7XIwhF180btUBrRpIPDAWK7+P3tiAqg+stgGqcRMBXQc9fAHTXoRS43
 THKi9Uf2AsIaFoi8SxiWVW9YaHc9kQLvbGah70PVVnnnAL7L0ue6kbxAHPCx8mIOrC7/
 LkPIlFgQszu7ezzTPD3KGIHJ7PUFtBhc6fm5idmi719tiwjuXYjCtKv0AvD2ylChSvr4
 ZB32BPMhu2v/6L58VWDAiJ/0n9G733kYkO30Ou30pnEuDlxflA1m5QHN8TfHJ/FeDU29
 Pl5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RVQXRPOw
Subject: [Buildroot] [PATCH 1/1] package/python-automat: bump to version
 24.8.1
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

Drop no longer required patch.

Drop no longer required python-six and python-attrs runtime
dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...1-Remove-uneeded-dependency-to-wheel.patch | 28 -------------------
 package/python-automat/Config.in              |  2 --
 package/python-automat/python-automat.hash    |  4 +--
 package/python-automat/python-automat.mk      |  6 ++--
 4 files changed, 5 insertions(+), 35 deletions(-)
 delete mode 100644 package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch

diff --git a/package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch b/package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch
deleted file mode 100644
index 2be7ec6cda..0000000000
--- a/package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d04d51d62a23370869ad466fa95b7d4ec2e0fa6e Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Mon, 14 Nov 2022 22:30:33 +0100
-Subject: [PATCH] Remove uneeded dependency to "wheel"
-
-Attempting to build Automat in Buildroot fails while trying
-to check for this undeeded dependency.
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index c2f9816..afa8012 100644
---- a/setup.py
-+++ b/setup.py
-@@ -15,7 +15,6 @@ setup(
-     packages=find_packages(exclude=[]),
-     package_dir={'automat': 'automat'},
-     setup_requires=[
--        'wheel',
-         'setuptools-scm',
-     ],
-     install_requires=[
--- 
-2.38.1
-
diff --git a/package/python-automat/Config.in b/package/python-automat/Config.in
index ee02d22b5b..7d3186f1ca 100644
--- a/package/python-automat/Config.in
+++ b/package/python-automat/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_PYTHON_AUTOMAT
 	bool "python-automat"
-	select BR2_PACKAGE_PYTHON_ATTRS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Self-service finite-state machines for the programmer on the
 	  go.
diff --git a/package/python-automat/python-automat.hash b/package/python-automat/python-automat.hash
index cfb16ac664..4edc9f3f09 100644
--- a/package/python-automat/python-automat.hash
+++ b/package/python-automat/python-automat.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/automat/json
-md5  b8064994239aabb172748f984489ce75  Automat-22.10.0.tar.gz
-sha256  e56beb84edad19dcc11d30e8d9b895f75deeb5ef5e96b84a467066b3b84bb04e  Automat-22.10.0.tar.gz
+md5  c023f8848366053a76f99cffba3ea34e  automat-24.8.1.tar.gz
+sha256  b34227cf63f6325b8ad2399ede780675083e439b20c323d376373d8ee6306d88  automat-24.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b2201301678d0a937d938543827ca1360712eb34e23de8ee3f3bfffbd4c0e376  LICENSE
diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index 101197b15b..85bc890fc5 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOMAT_VERSION = 22.10.0
-PYTHON_AUTOMAT_SOURCE = Automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
-PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/7a/7b/9c3d26d8a0416eefbc0428f168241b32657ca260fb7ef507596ff5c2f6c4
+PYTHON_AUTOMAT_VERSION = 24.8.1
+PYTHON_AUTOMAT_SOURCE = automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
+PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/8d/2d/ede4ad7fc34ab4482389fa3369d304f2fa22e50770af706678f6a332fa82
 PYTHON_AUTOMAT_SETUP_TYPE = setuptools
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
