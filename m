Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2637C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 06:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6780082211;
	Sun,  5 Nov 2023 06:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6780082211
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cd4-3Afj52kz; Sun,  5 Nov 2023 06:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB1D882208;
	Sun,  5 Nov 2023 06:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB1D882208
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D2DC1BF42E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 180C5404A5
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 180C5404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id suSwDQPY_GEE for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 06:06:49 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9806D403CA
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 06:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9806D403CA
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7a67bc84c87so113360639f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 23:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699164408; x=1699769208;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I4U42cH0dTKRBL8eU2vrP77A982Fuo90O4O6pr7NIkU=;
 b=LrTT9L/vRvUo+pmS+FRDiuywl399ZyWevb8/AF+mJaH2Ilj7LfT22I3qkWftuC3zp7
 QFupU57nCfWJqMHtMJ2cZP/H0Egw4SS50IThlUknLA0VJFwvgEvmkvKG2lYcukYOA1Bn
 Mj1XzHEtWgRlJCr16x3/nq3nfSfHQyu9NGNLeyloH9x5TcXr3fjujEcSCH+bTNJg9Hmt
 dSuWkqWF24Hjsc3CKXeMGRfsExWlPlfHhIyCSuuCBE2Isifo28pDGEbnLEGfqyKrXsGQ
 hB2TFhyheLx5LLapKxPoppg3h7cbHdfkw6QFf4/LTkos5VZnToMjICsojw0xd2dS9DkK
 4cig==
X-Gm-Message-State: AOJu0Yx+miMT/wYYJkkr06T39hwgGHlaYr+tNpClcFQV/lEYraFPMH2W
 HTZOowuItSyVYzcBB/PRjbWQo2uCzWg=
X-Google-Smtp-Source: AGHT+IFp/jh8B6IslaZ09zUbNpy2CiQrD6e2PEVfHoNZceGUlqBFXjlB66ZBC1AxdRoTb34e7V2qhg==
X-Received: by 2002:a05:6602:2d95:b0:79f:b2c5:e8b with SMTP id
 k21-20020a0566022d9500b0079fb2c50e8bmr34652945iow.20.1699164408169; 
 Sat, 04 Nov 2023 23:06:48 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 h31-20020a056638339f00b00463ffa38f99sm635410jav.179.2023.11.04.23.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 23:06:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 00:06:45 -0600
Message-Id: <20231105060645.2850983-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699164408; x=1699769208; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I4U42cH0dTKRBL8eU2vrP77A982Fuo90O4O6pr7NIkU=;
 b=BBbU0o/3WBxmoea9tIp6aPi9xVl0EqhM65LeTg+DTuhzivmKkliYGqfiPiZ5xspcT3
 qC6NRq0SXS7ObsxgtxCZvoXVQEZnOkQJad+iKrPyTW4UgH/ij6+v64v0/p5xfHAwqrNG
 TWZUHbY4OU22CC/oy52aUrLR+eJo/WCRBhnzsw/VgFFPdgxXnPMxfNfoDXhzv5H2RA8g
 9VtJcvlNqUH/l+AxedTxJTZIIUrAE41ebKpvrDVHbE8Vxc7FbH3vhKpgFSAbhtWC1pDU
 1T7ZwmruhlN9+cPJJiN55HUV7piXKhYOoCmJe4ZCgquVV/Vqe3EwuSf/MMIN74PVoiyu
 RjPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BBbU0o/3
Subject: [Buildroot] [PATCH 1/1] package/python-flask-babel: bump to version
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-pytz runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-babel/Config.in               | 1 +
 package/python-flask-babel/python-flask-babel.hash | 9 ++++-----
 package/python-flask-babel/python-flask-babel.mk   | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-flask-babel/Config.in b/package/python-flask-babel/Config.in
index 272d9ef1c1..1248783e80 100644
--- a/package/python-flask-babel/Config.in
+++ b/package/python-flask-babel/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_FLASK_BABEL
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_BABEL # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  Flask-Babel is an extension to Flask that adds i18n and l10n
 	  support to any Flask application with the help of babel,
diff --git a/package/python-flask-babel/python-flask-babel.hash b/package/python-flask-babel/python-flask-babel.hash
index eae77ff51d..b946561308 100644
--- a/package/python-flask-babel/python-flask-babel.hash
+++ b/package/python-flask-babel/python-flask-babel.hash
@@ -1,6 +1,5 @@
-# From: https://pypi.org/project/flask-babel/#copy-hash-modal-02f7b566-78ef-46b7-be0e-da35593e2dc2
-md5  ad0a1b69044dde430ad9319d3a2f7b47  flask_babel-3.1.0.tar.gz
-sha256  be015772c5d7f046f3b99c508dcf618636eb93d21b713b356db79f3e79f69f39  flask_babel-3.1.0.tar.gz
-
-# License files
+# md5, sha256 from https://pypi.org/pypi/flask-babel/json
+md5  62116080b8d3a446e1f0f07cbaf74dc1  flask_babel-4.0.0.tar.gz
+sha256  dbeab4027a3f4a87678a11686496e98e1492eb793cbdd77ab50f4e9a2602a593  flask_babel-4.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  a526100a7047237360a394ba4f70ae801b50ff9b8c9b9e73e7795480a59f6b7e  LICENSE
diff --git a/package/python-flask-babel/python-flask-babel.mk b/package/python-flask-babel/python-flask-babel.mk
index 34c9559d1c..b3ecdf6cf6 100644
--- a/package/python-flask-babel/python-flask-babel.mk
+++ b/package/python-flask-babel/python-flask-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_BABEL_VERSION = 3.1.0
+PYTHON_FLASK_BABEL_VERSION = 4.0.0
 PYTHON_FLASK_BABEL_SOURCE = flask_babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
-PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/35/83/f31a4ff688168f9c8a73d80ebfc785dcd7703474a0802b25a78d54edd07c
+PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/58/1a/4c65e3b90bda699a637bfb7fb96818b0a9bbff7636ea91aade67f6020a31
 PYTHON_FLASK_BABEL_LICENSE = BSD-3-Clause
 PYTHON_FLASK_BABEL_SETUP_TYPE = setuptools
 PYTHON_FLASK_BABEL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
