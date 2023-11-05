Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5391FC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 01:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01C4060DC6;
	Sun,  5 Nov 2023 01:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01C4060DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13zQDQRD1-2S; Sun,  5 Nov 2023 01:48:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4219960D7B;
	Sun,  5 Nov 2023 01:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4219960D7B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB2641BF263
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF4A660D7B
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF4A660D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id toXI6Ms1EPYN for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 01:48:40 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8795260B89
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 01:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8795260B89
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7a94de8c70cso106167739f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 18:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699148919; x=1699753719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b3R5Iu2j4PSe1Z01o9yXQQ7zHad1dNZF/osUxnq7a7U=;
 b=nYYq1CaOe56RyitHF2aJfASEcpiAvntBwtp+bzn7auGT/FLAdYxnlstpicz1Azoa3Z
 c+J2Ly88ejuLiCETMZM4lXQ5BMAhV45jUkF6+GQENrHaHwDwzoIEhnvFKgw2+rgMHPxT
 k/+flZF0bn0lXUhgSw5wE2CirjSc831uGzzEa4mvTgiEY+qJ6UOtpdz4IEGNzMis67/b
 nQyyTEpIYoiqWqXHkvyMQnVqaX36gKxAfN2S2IlcNpwLSyaGWj/8CSS8bSFZ6VylUMvi
 NlTh+tSwegbvsFEX+TNC8hYb09328c4eoihQNe/sb1GgsDB0qf22AbzkrvZRIuN7Fcs4
 DN4w==
X-Gm-Message-State: AOJu0YxBsDa6aYGv2oyoz26T8hXyWxFvPXgWPewsAwq01lG8+hSaH7k+
 5SmiovtPTz+WGqJOSN6c2e4WHGkiA9A=
X-Google-Smtp-Source: AGHT+IEUkrUsL5MHA0LrLuIWWenRJvd6gvLKJ/C97963HVol5Ip075/lx1M2eXNcS/ztpi3WfDm5Gw==
X-Received: by 2002:a05:6602:3fc7:b0:79f:cf6a:cc55 with SMTP id
 fc7-20020a0566023fc700b0079fcf6acc55mr30615581iob.20.1699148919201; 
 Sat, 04 Nov 2023 18:48:39 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 o3-20020a02cc23000000b0045a27acea65sm1312605jap.38.2023.11.04.18.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 18:48:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 19:48:37 -0600
Message-Id: <20231105014837.2727953-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699148919; x=1699753719; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b3R5Iu2j4PSe1Z01o9yXQQ7zHad1dNZF/osUxnq7a7U=;
 b=A4weg1+KCwEdyCpSprwDvMwtgsa585wHdLQ+5L7OZtbbdBfbNEjQXm858O1SKjUfs0
 SNX+DQ9wSUHkFdO0VlSsrn7zm1prPvuWZbTcUkSoaimXqVr1NspffeCSsAB8pRr69CAz
 YZH+kesEhTSOxnRGd51vNP0vncP5ll++NgoCuT+fG0PQrI85A+yKbA7S8KQ9LsAgKmL4
 x3I/AIqWgt6jJPqXTZtLEapfcULhY05Shr7pi89Uxs+RQD2LelalMjLwyDiVLUIKr8Mq
 6eU59QaSwlbuPFg2XPSsRXq2IF6wC+zPnerOXkOMDG7p9fTxFxvdJkw58uMDYjbDu4oy
 FnYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A4weg1+K
Subject: [Buildroot] [PATCH 1/1] package/python-babel: bump to version 2.13.1
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-babel/python-babel.hash | 4 ++--
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index f2026cafb3..dc48831c44 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  9ac7d8aac42c17a1e6d922017058d2c8  Babel-2.12.1.tar.gz
-sha256  cc2d99999cd01d44420ae725a21c9e3711b3aadc7976d6147f622d8581963455  Babel-2.12.1.tar.gz
+md5  3162229c2daa7c32674ed26f87b63127  Babel-2.13.1.tar.gz
+sha256  33e0952d7dd6374af8dbf6768cc4ddf3ccfefc244f9986d4074704f2fbd18900  Babel-2.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  908e0ad72053ae27c1d17e3340bd14cff9bf935992ed56526d17c983ab6e7af7  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index 69c38c1a6e..f8d2ccd258 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.12.1
+PYTHON_BABEL_VERSION = 2.13.1
 PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/ba/42/54426ba5d7aeebde9f4aaba9884596eb2fe02b413ad77d62ef0b0422e205
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/aa/6c/737d2345d86741eeb594381394016b9c74c1253b4cbe274bb1e7b5e2138e
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
