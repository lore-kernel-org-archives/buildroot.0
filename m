Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B15C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 06:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 682DA8222A;
	Sun,  5 Nov 2023 06:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 682DA8222A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTEr8Y2rQG52; Sun,  5 Nov 2023 06:33:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB0982218;
	Sun,  5 Nov 2023 06:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB0982218
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 314221BF592
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 050B682218
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 050B682218
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pwR6S2M92eS for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 06:33:39 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BDBC82217
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 06:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BDBC82217
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3594c100735so8724645ab.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 23:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699166018; x=1699770818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dsGq6FhyKSZb4YQvt3N0zRzeZLCWsqi1E1T/qnzi4VU=;
 b=pQs1m9Dj03R2ob7/pL1JWAV2kuVl4XvDV0c0v+vVeaR+cv1+WG+UlvHQ3/FmqPVxhf
 b7jsLq0GEODpI1vQN9md3JJK7lfdoW4uZ88dFPc9IzlDCDnsVZjDhTPe4DuKDudG7lVV
 tfl8/qZ3GbRNE+3DS9B8PUIvesxbfv+2Dumr5AJi3mBFvZCjXtLVMwvXEqHqnh1wgO3e
 93rAODNx+xdDraqbkp56BOR6sRUZM+Za6qjbX4auj66jdbxcf+RmYONO7bOdylM1BrQQ
 Vq8ZlnusJm0kirNdFkMcWvJNJDTaBKSLh7taJB4pW41tgscPRB6l9nBG4uLO6w2ZSi7t
 CdDg==
X-Gm-Message-State: AOJu0Yy+0jJqvqHnnik6lRZCderLdO4a5MI4O6ry4qk62rGh08QhF3gd
 GPmBV7wIXqoKf++sjnm8lTXcnOhLj+Y=
X-Google-Smtp-Source: AGHT+IFLKRpx41Pt/u7t4lSnBNlIXKB/vR+puEq5G3TDmj54mGkzY6ZpdIVdAbxdvN3CxoJ/pYG6OA==
X-Received: by 2002:a05:6e02:180e:b0:357:4779:9dbc with SMTP id
 a14-20020a056e02180e00b0035747799dbcmr8075039ilv.10.1699166018279; 
 Sat, 04 Nov 2023 23:33:38 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 b14-20020a92340e000000b003599c671eedsm483219ila.50.2023.11.04.23.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 23:33:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 00:33:36 -0600
Message-Id: <20231105063336.2858782-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699166018; x=1699770818; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dsGq6FhyKSZb4YQvt3N0zRzeZLCWsqi1E1T/qnzi4VU=;
 b=Bn/9vfmwtqBv7TAHGg7q/mJ92fB2GF0QRfXgVLwdiBRw/mb5MtYUY1KTQvrE7mWSCL
 mL2/8mh/PosybF4hjPmXbwA+HmrqnQiu5z3Wo0in0r5QJBtdvujpDi/9vjpYPU2+Ss6p
 pcs8F1HBkcJraO11TVkdPzEWaswFnWTaLdStAij3YNrdaezlMAWPcAnYd+WT/WMw+AEn
 XIndMRavjyL1eHkv4MUgnbGypEbPLMlg+/VhjiopEunznwrHx5aLA5xOCZl9ulKIOuVv
 FOcj3xvEDl/ueCMNrEfnq832IZ/Cf1rQ2nguixhLh7qwFb7kN7SePFRXTp7+02FgMRMd
 ziKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bn/9vfmw
Subject: [Buildroot] [PATCH 1/1] package/python-flask-sqlalchemy: bump to
 version 3.1.1
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
 .../python-flask-sqlalchemy/python-flask-sqlalchemy.hash    | 4 ++--
 package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
index 50ca14371d..637733d002 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-sqlalchemy/json
-md5  cbc5756b7e14683de1a540516159a81a  Flask-SQLAlchemy-3.0.2.tar.gz
-sha256  16199f5b3ddfb69e0df2f52ae4c76aedbfec823462349dabb21a1b2e0a2b65e9  Flask-SQLAlchemy-3.0.2.tar.gz
+md5  b2439ba29a86fd594e0de4fc0e42ceb6  flask_sqlalchemy-3.1.1.tar.gz
+sha256  e4b68bb881802dda1a7d878b2fc84c06d1ee57fb40b874d3dc97dabfa36b8312  flask_sqlalchemy-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
index ca6fd0c793..2ee53d4b00 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SQLALCHEMY_VERSION = 3.0.2
-PYTHON_FLASK_SQLALCHEMY_SOURCE = Flask-SQLAlchemy-$(PYTHON_FLASK_SQLALCHEMY_VERSION).tar.gz
-PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/0b/b7/05a8f9c3f010775275f8dec53e40ff7ea1ae61bf1cfa4b524caf4d3da982
+PYTHON_FLASK_SQLALCHEMY_VERSION = 3.1.1
+PYTHON_FLASK_SQLALCHEMY_SOURCE = flask_sqlalchemy-$(PYTHON_FLASK_SQLALCHEMY_VERSION).tar.gz
+PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/91/53/b0a9fcc1b1297f51e68b69ed3b7c3c40d8c45be1391d77ae198712914392
 PYTHON_FLASK_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_FLASK_SQLALCHEMY_LICENSE = BSD-3-Clause
 PYTHON_FLASK_SQLALCHEMY_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
