Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BBDC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 07:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7497D60EAB;
	Mon,  8 Jan 2024 07:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7497D60EAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPHcFMpXYQ_3; Mon,  8 Jan 2024 07:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2CB660D88;
	Mon,  8 Jan 2024 07:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2CB660D88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37FE51BF580
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08618403E7
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08618403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SycL12qalx1H for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 07:24:39 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1BB3400A4
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 07:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BB3400A4
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3606de7f4bdso9618905ab.0
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 23:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704698678; x=1705303478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdh3bSEuTLOp6IazLJTiFKALeiVXMZUBVtQtVCq9zdM=;
 b=fK5PrPIRUFE2T+iNhl/oCCVMPm8vhCFwUvFMWOjiwTq25lfyGR8UYJC6gNyXoABPGc
 +UKnULN0wHjBqwQ5v68KVkJLrKpBGY28B+MlpNSr92q/klX7vWeum2ZTG0MkVmiMTBFQ
 IYYoT19J12ElTx1gMMorEh1wODkZ6Kz1zSDt1Tln5kfITmZVa2MhWTk/Bc2ijc09tHBS
 iCwFfv5snXJ3Vma27CuR5ZWDJ5kRYVjteMXCEzI3TyV7kDZVyvgFYlZAqEBkDrbM5OTJ
 yKcItjsrXo+EYhTat+t9MLlv8H1rYRGvBFXuDzGPQXANizhTLy/qzxHsLfmQS5Bo8fZb
 cf6g==
X-Gm-Message-State: AOJu0YzOrrgbxkMc4tbWoOXqp1j0ie623sQzVrwhB8wGVSEy6Siscs+9
 TebrF53flwIVJvfe3uT8iVV9SItwtbtuCQ==
X-Google-Smtp-Source: AGHT+IElSLxwK9yTPj6smRqLs8707sjcg6AsIeuttoIPwD9k+xvVoFR8PLgBoBZh6Zx8ZipLpoJzDw==
X-Received: by 2002:a05:6e02:3283:b0:360:7244:6089 with SMTP id
 bk3-20020a056e02328300b0036072446089mr5808282ilb.43.1704698678392; 
 Sun, 07 Jan 2024 23:24:38 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cd15-20020a056e02320f00b003608be77593sm810035ilb.18.2024.01.07.23.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 23:24:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 00:24:36 -0700
Message-Id: <20240108072436.3487976-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704698678; x=1705303478; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xdh3bSEuTLOp6IazLJTiFKALeiVXMZUBVtQtVCq9zdM=;
 b=Ek5jQu7KTcqP7N89VQ5OoAH8L6mI+FQCKIUsTjcr6imzws0JYgk10Qh8Zhrt31wVQ6
 fVd/CsPKEqJYkq0tBo83igtiKXnLW8a5Ayy81PS69vf3TvMpJ3lRiUGXUy8oTazOXENu
 y0htiTblC9U0DFHmrpUDhmCYDg8uAddMR5fuDyy2rw7YzjWh1CRltMZ5b35GiWA+beSJ
 OFyoNr+UHJpK7kd9YGr6yxfnymk9OvtplJXROMuAds4useFHC3PKrl09DKzsm+bB9SUR
 NiEfEsFSdfPaLEA4Z97/fhsi6NWiNcPvIh4xM2+3BM6Yo0cj28P4WMkAal+bG4gJ2Uwv
 A3Dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ek5jQu7K
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.34.14
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 253a9de85e..02440a2960 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  12a1c0bb1e9ab692a1e33204a0da7f12  boto3-1.28.78.tar.gz
-sha256  aa970b1571321846543a6e615848352fe7621f1cb96b4454e919421924af95f7  boto3-1.28.78.tar.gz
+md5  7cc00aa828c5d3a5c09e3af284e6d23e  boto3-1.34.14.tar.gz
+sha256  5c1bb487c68120aae236354d81b8a1a55d0aa3395d30748a01825ef90891921e  boto3-1.34.14.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index f60f3467d4..52bb5bc3b1 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.28.78
+PYTHON_BOTO3_VERSION = 1.34.14
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/70/f7/da69e173dd5663775f114fad3827dcc49537e232e36266463ff70529f1a4
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/5f/b6/1e45c3a145304c3feaf48959c6a46efe9a256eec4d417a445b0d9827d20c
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
