Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9065C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 06:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78E1E82207;
	Sun,  5 Nov 2023 06:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E1E82207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V0HdtrtyAH-F; Sun,  5 Nov 2023 06:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B48D182203;
	Sun,  5 Nov 2023 06:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B48D182203
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 506DA1BF42E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 339DA820CA
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 339DA820CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eksmFGXiNlpW for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 06:10:48 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B502820CD
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 06:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B502820CD
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7a69a71cc1dso127642139f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 23:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699164646; x=1699769446;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R1Z7+EZwJnukUG3MH8YGRZ4mnnOC+LvXQdtd5VaWhFI=;
 b=SOMoYchUQnPfzuMIG0UD4w8nYkI+siSqFchwMUItvyaVmHc4j6i7s6V17wTclMIBq9
 WUuI3mB4lb0K215B2L66s5pEZDJtUjJyc0ZWZVziYGOcbaWWkTKfqNc40i2gpqcmgWch
 L/LYSresLRBvQGmZIgZsJad6IzsjcPaoe3oKV2+Tocc2iK/xhZ+jq0DnSfmbfyaT/k5G
 anLqe4nMFpYrHDyg6VCufhryQwdB90I8oSbZKM/K78VKNfWYycGX9Ly5j17uCadsZPEM
 NLgCkSlmZHTuceeQ5PqORNbJsx72n5owHxbvsBGEFB2ooBgL/FvBa6uRsO9ttaMcm7ie
 QBHA==
X-Gm-Message-State: AOJu0Ywf+2BO7/NLS/bietl7vimT0XlyzN/nWCnEEueFaZHoTMOs8937
 ZJEK6r7U91m+2oGKPdlFmLEZQKJbvgo=
X-Google-Smtp-Source: AGHT+IH8DS5MJDlSwGFqZMBK3C46vDdkuRnkV3w9wNlB5LOaVh/eBKJXjFI9WfaL6oQynK8AkLduUw==
X-Received: by 2002:a05:6602:3f86:b0:792:9416:9c7f with SMTP id
 fb6-20020a0566023f8600b0079294169c7fmr34691881iob.9.1699164646593; 
 Sat, 04 Nov 2023 23:10:46 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 e7-20020a056602044700b0079fce69b5c7sm1628389iov.36.2023.11.04.23.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 23:10:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 00:10:44 -0600
Message-Id: <20231105061044.2852603-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699164646; x=1699769446; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R1Z7+EZwJnukUG3MH8YGRZ4mnnOC+LvXQdtd5VaWhFI=;
 b=iZXA/a6UnWDDnQ3HIiIiqa/XALfFWlh216OrdRoU4CE03kAu9g03jWJ9GlrHvGKsCC
 XLohQvbC/LmlcHVAOwbhXfkG0SR3TxZA8q/LUpyxi0mkJmNls70zOYpRnmuyd2g6aqu3
 DNeRtwjg/oiRQovAPjBHNHNAkA3/CVANdymjpqbKUXbrYEw3JBf+TB5Wh51XLmzM2aFq
 J8dPcHlsvI3RxDAperVCVdJPyR13BGJU2O8YuFV/sw9yccvac6aGxFBEpgfdH6X+6EF0
 ALgFMlsv+rX0OsGL2y/MTV5MyqD22FAch43umWfMk4tAA1UNs4aTCuOH9Qf1biHm5VYO
 57dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iZXA/a6U
Subject: [Buildroot] [PATCH 1/1] package/python-flask-cors: bump to version
 4.0.0
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

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-cors/Config.in              | 1 -
 package/python-flask-cors/python-flask-cors.hash | 4 ++--
 package/python-flask-cors/python-flask-cors.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-cors/Config.in b/package/python-flask-cors/Config.in
index e2e84797f9..fc0908e870 100644
--- a/package/python-flask-cors/Config.in
+++ b/package/python-flask-cors/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_CORS
 	bool "python-flask-cors"
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  A Flask extension adding a decorator for CORS support.
 
diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 94ec262db8..ced7d9dcea 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
-md5  647ff0632b960ba063a077fb4063077e  Flask-Cors-3.0.10.tar.gz
-sha256  b60839393f3b84a0f3746f6cdca56c1ad7426aa738b70d6c61375857823181de  Flask-Cors-3.0.10.tar.gz
+md5  0ccfa375e744200243d85719b38cdbc6  Flask-Cors-4.0.0.tar.gz
+sha256  f268522fcb2f73e2ecdde1ef45e2fd5c71cc48fe03cffb4b441c6d1b40684eb0  Flask-Cors-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index d600157263..bfcaf63c64 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 3.0.10
+PYTHON_FLASK_CORS_VERSION = 4.0.0
 PYTHON_FLASK_CORS_SOURCE = Flask-Cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/cf/25/e3b2553d22ed542be807739556c69621ad2ab276ae8d5d2560f4ed20f652
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/c8/b0/bd7130837a921497520f62023c7ba754e441dcedf959a43e6d1fd86e5451
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
