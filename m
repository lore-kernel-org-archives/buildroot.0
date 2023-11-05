Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA815C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 06:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7694082211;
	Sun,  5 Nov 2023 06:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7694082211
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OYLfqqJ2mjC; Sun,  5 Nov 2023 06:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACBDF82207;
	Sun,  5 Nov 2023 06:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACBDF82207
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CD351BF42E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32D4860F8F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D4860F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9yRQ9A5HUdmG for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 06:13:50 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4706F60F84
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 06:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4706F60F84
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3594560fa09so13495065ab.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 23:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699164829; x=1699769629;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cAySvSe0zkYvmv5qTWpWYpDSCIBbpcXnMW7yEwQzm/Q=;
 b=UbaIVnw17THqTjUIerZP01QAECviM4CGHUhnO1tp+r8R/d3JC8NjjxRzgvmBVqd85s
 CigLLNicdT+17F4nibrJ8Sfq8toofEU4JNdgNAs6u+48aqUNbtbYwzNMZJAb+0LV3DUQ
 bOJrvvyX9Kcz1Ny34ujZTFiBtJ0Dz6gI4BNXGtB2bPldlYx9LOoXXvg1uO5zR38vittZ
 mUcTyeMdyUED74TdrmIoh7Umcc+axbtJajHAJ5BZJV1sVNT4pvyvhbikUUor9qRdwy/S
 Tnr89FRhgQP6N139pNCXac/j0F8L0VbTRECe6TfzEPcehNdgadhyoAKLbM6iEW4FXz3j
 dHMA==
X-Gm-Message-State: AOJu0Yw8cAwRibk8Hjwz6UJz3BpB1VNrBLfPVceQL5hHaZ3hSXXJDf3y
 6Tw9QCg2wjeOCMyNwJvFg74vlbxIvQ4=
X-Google-Smtp-Source: AGHT+IEOdx/3kAQXHTg/JcQgKlDTVXZ6q/X0v/xTHquEeASQ470As4i5NBK5kp2pgquBTYiI/oScAw==
X-Received: by 2002:a92:6f02:0:b0:359:4ae3:cd9c with SMTP id
 k2-20020a926f02000000b003594ae3cd9cmr11022385ilc.10.1699164828801; 
 Sat, 04 Nov 2023 23:13:48 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 o7-20020a927307000000b00359638f8ec3sm1663236ilc.29.2023.11.04.23.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 23:13:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 00:13:47 -0600
Message-Id: <20231105061347.2854218-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699164829; x=1699769629; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cAySvSe0zkYvmv5qTWpWYpDSCIBbpcXnMW7yEwQzm/Q=;
 b=QabaISslsvyBJ2A0AvInn2dLIZgw7FsaMwjTG5haQvsT0ZlPHcdYuUyZgpcM0kGzzT
 fhVVUGcrN+PkiTakPmvqg0ZfZZBml+zSKuAkvgGLPNoAq6kdeXw8aqpWKYC84+VNPAlj
 8bIrnYU6GhyTx4Gf4sNyYwcrpqy4ksHd7jJzhthSwhdtgx3x0edK7cOXMNIJ27dAo8m4
 C8cHDd6jOli9HYFVG6FGBVnFujDyh1k9pRY1DuTB5FoYz7I8vk4sw6N2xy4X91G+0YBA
 vIQwuvAFh671VPDpMw9j52JNh724vbCXExCJ/YmaHB0vEO/de2HAhkL4kbYWeV2yJYaI
 dYDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QabaISsl
Subject: [Buildroot] [PATCH 1/1] package/python-flask-login: bump to version
 0.6.3
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-login/python-flask-login.hash | 4 ++--
 package/python-flask-login/python-flask-login.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-login/python-flask-login.hash b/package/python-flask-login/python-flask-login.hash
index c88b70f2d5..af034ae751 100644
--- a/package/python-flask-login/python-flask-login.hash
+++ b/package/python-flask-login/python-flask-login.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-login/json
-md5  8020b22ad7ec6f17034f90117a520633  Flask-Login-0.6.2.tar.gz
-sha256  c0a7baa9fdc448cdd3dd6f0939df72eec5177b2f7abe6cb82fc934d29caac9c3  Flask-Login-0.6.2.tar.gz
+md5  689564b8b7f3782f0db382b7aa85bbc2  Flask-Login-0.6.3.tar.gz
+sha256  5e23d14a607ef12806c699590b89d0f0e0d67baeec599d75947bf9c147330333  Flask-Login-0.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  7a9dfb9c5da204ed1370f3b62c13e2992a12da1da707f47e156897eeb4344e5b  LICENSE
diff --git a/package/python-flask-login/python-flask-login.mk b/package/python-flask-login/python-flask-login.mk
index 394fe197e3..ed10c98f5a 100644
--- a/package/python-flask-login/python-flask-login.mk
+++ b/package/python-flask-login/python-flask-login.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_LOGIN_VERSION = 0.6.2
+PYTHON_FLASK_LOGIN_VERSION = 0.6.3
 PYTHON_FLASK_LOGIN_SOURCE = Flask-Login-$(PYTHON_FLASK_LOGIN_VERSION).tar.gz
-PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/cc/da/eae45ba9ec58af45b46ef94c6ca04fb211ee57c06421b696e894eb11b064
+PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/c3/6e/2f4e13e373bb49e68c02c51ceadd22d172715a06716f9299d9df01b6ddb2
 PYTHON_FLASK_LOGIN_LICENSE = MIT
 PYTHON_FLASK_LOGIN_LICENSE_FILES = LICENSE
 PYTHON_FLASK_LOGIN_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
