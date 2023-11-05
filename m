Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49F5C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74013821B2;
	Sun,  5 Nov 2023 02:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74013821B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJpFskrUFrFR; Sun,  5 Nov 2023 02:51:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBBE7821A6;
	Sun,  5 Nov 2023 02:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBBE7821A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 363561BF267
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A07F60E37
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A07F60E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9x3iO-6yn8m3 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:51:48 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09D6760594
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09D6760594
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-357ccaf982eso13366145ab.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699152706; x=1699757506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U4K7DCO0kbcV4QKjTnhGFmeZGFq7GuL/YQwKFF2dcBY=;
 b=Ulumbr0eLN4FLScpEv85AeY47c2cMU32KVUP/5ZS9iV+VbIPqOiRj9b2fHX8AJha0U
 GZ5kYaKG8GSQYUTXtTwZnvISLZjGJil9Ry7iAl94Axob1UyrD6OKp1mg2GXqdzm86sUR
 elufcB8IfuAFdvqpBGARZxE53JchuKalPUrQXSGZwJcoWuR+gaUv7UXfX08D+gT6zAe9
 fHxBUmMB0Z0o/ZCVTTo5xUl2XS5fETF5c+MY77D1AI72xgjpT+K5pum9c+9uP032yyPd
 j0Ux3f2TX7tezdD/Z0oCo0wM1naYm1kZTIhQg9yg8e6jDtyeRRQLt5p/eY8cihGQ2BG2
 C5DA==
X-Gm-Message-State: AOJu0YyCBUxvm/OkJMjDxPzR8mQYrz/IJpJ1zzh4ywLxTiHNSHrWEf9L
 Jy+mdbx/xCFMII4RnBlFIMvkUvPPNoc=
X-Google-Smtp-Source: AGHT+IGmquxjR0ToLs5zy7mR23gJh4ZSk4vKBt2DbGOoApgDWFLfK1dMwsRwu0fCJY98Qe8i5Vqt2Q==
X-Received: by 2002:a05:6e02:1ba1:b0:358:1f0:4c5c with SMTP id
 n1-20020a056e021ba100b0035801f04c5cmr30569612ili.32.1699152706701; 
 Sat, 04 Nov 2023 19:51:46 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 r15-20020a92d98f000000b0035134f1a240sm1579225iln.86.2023.11.04.19.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:51:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:51:44 -0600
Message-Id: <20231105025144.2765963-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699152706; x=1699757506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U4K7DCO0kbcV4QKjTnhGFmeZGFq7GuL/YQwKFF2dcBY=;
 b=FdGrkhaSHXdBj50SD1kLv6FCzv8HuripaLhaWnDWhhYxrLtx2XoT/psTpZNpK88+xg
 9sj+YA0IhkRb7amTpsoZHkrtCfyo1+QSZZ+nWoEZVH6Y+/efoPLRD7vu0zQJZCkXzQBY
 +ihq6g16UK+4d2yhFOJ0QtCwTmt9yPW4OxbuKb/N27+z9Q5oVC/nDrIOMtFxwhFZRi+r
 n20uwxVA8JyAjZop8LlCyMnF5T5Wxe8MqSkLVdOas9AqBiq4NedGz2eUaMIQV508J7yg
 HUgmyI+soVRHceE4NJvPdUUbgIPlD+Xe0KdKMgGo9Sn2w8ksHPlGsTEpYGn7RMA+beYZ
 dtug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FdGrkhaS
Subject: [Buildroot] [PATCH 1/1] package/python-chardet: bump to version
 5.2.0
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
 package/python-chardet/python-chardet.hash | 4 ++--
 package/python-chardet/python-chardet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index 7887dd769d..bf0ed47df6 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/chardet/json
-md5  394bd03d7a258d2771040bfbd5a7bf66  chardet-5.1.0.tar.gz
-sha256  0d62712b956bc154f85fb0a266e2a3c5913c2967e00348701b32411d6def31e5  chardet-5.1.0.tar.gz
+md5  cc2d8cc9a751641463b4f7cfecad2ffa  chardet-5.2.0.tar.gz
+sha256  1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7  chardet-5.2.0.tar.gz
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 42646aa513..16e5f303b6 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARDET_VERSION = 5.1.0
+PYTHON_CHARDET_VERSION = 5.2.0
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
-PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/41/32/cdc91dcf83849c7385bf8e2a5693d87376536ed000807fa07f5eab33430d
+PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/f3/0d/f7b6ab21ec75897ed80c17d79b15951a719226b9fababf1e40ea74d69079
 PYTHON_CHARDET_SETUP_TYPE = setuptools
 PYTHON_CHARDET_LICENSE = LGPL-2.1+
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
