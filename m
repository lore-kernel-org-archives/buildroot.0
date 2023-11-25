Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78131C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 06:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D21B60AFF;
	Sat, 25 Nov 2023 06:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D21B60AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eY6_slJ6SpaP; Sat, 25 Nov 2023 06:34:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4160360B9E;
	Sat, 25 Nov 2023 06:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4160360B9E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA8181BF39E
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F012821EB
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F012821EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXefo_G0597l for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 06:34:07 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85A1A821D6
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 06:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A1A821D6
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7b35b9645e1so91482039f.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 22:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700894046; x=1701498846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uZIH59UCfMu+Wbl7kRRBoYvPr17ieO00GBv4KCplotg=;
 b=Gd7ryQ2k0xZX4LMD3j+lkqVnycmcpg1t711ZRlRydiMrv+gi9htpNUoi9hBe8CcOvx
 MCNaU6TowNBJ95dw2Zqce0MNAQ8HfaYjq8oDGkXmCaT7UmZ0opOrJhA099+aWlWAL5Hi
 GO56oErpClbemxbKNKNjoxiyXo8E+1LbNcauMS3oYThZgMAR/JuUkXogBUn+Kw9nBUPn
 fkS01KR7vSNmMNpyVTFtvHDCA84FKgP2TNGD0yP0UVZ80tmUQgdpOuh8AvBl1s0VrfvF
 1ArFBPg32b/SziRd9fsz5JXX9AGy9z1ZOojQk+3Xqd1vef2118Al/AZrif45LuJm0//+
 9dBg==
X-Gm-Message-State: AOJu0Ywonc+hCm6eDJiTCWW44c1LJEoXA4/MQkjp9Q6OB8zFZd9TJDMD
 gVYkPSWhMl3aAVk0EDYnSkFQ4oJBigw=
X-Google-Smtp-Source: AGHT+IE7u/auevssOQiZE9KzkEqBPGQ8TnuvPyv2vVDgpZaMPlgYawJAkVoP+4ZLuBkQ4gjVt+ze/g==
X-Received: by 2002:a05:6e02:1647:b0:35c:1c86:6819 with SMTP id
 v7-20020a056e02164700b0035c1c866819mr8309318ilu.16.1700894045939; 
 Fri, 24 Nov 2023 22:34:05 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 cb8-20020a056e02318800b00357f979d56csm1512633ilb.12.2023.11.24.22.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 22:34:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 23:34:03 -0700
Message-Id: <20231125063403.715780-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700894046; x=1701498846; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uZIH59UCfMu+Wbl7kRRBoYvPr17ieO00GBv4KCplotg=;
 b=jsRp7S2IJQ2bkRljwv9YvGZw7oYfEfncFuUQxaUM5lWnjNUAMgBJkVKTKvZ/MqpQ/U
 +eU3Foq4f8oX8W/rQDD3scJkYHnB+3sKwYmxH46o5+KAKPZuS4XZZATQTkfwfIzXDovW
 3Qdg8ZFkJXkUScTcTOuu9+N6P/itc3WkzWC9Tj9ovbzlpnCn16ZEEX8p7OdrM67Fi/Z7
 mcpmg5CxaTiAhbLh26Vem1DBhV1P0wBakdv5Dtr3JhZJEInWlowa8e3iV2evyNne5ZmH
 9LN+b3rIhLld0J7x/QHCDyv3RSpGVPeDDLvlE+7hHi8OxfjC2erCg1D4FrOEyDexMXWu
 N/LA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jsRp7S2I
Subject: [Buildroot] [PATCH 1/1] package/python-pyasn1-modules: bump to
 version 0.3.0
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

Update github url to new repository.

License hash changed due to year update:
https://github.com/pyasn1/pyasn1-modules/commit/848e7d6a6e8c16d68fb7bedd0715f724ef538b5d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyasn1-modules/Config.in                  | 2 +-
 package/python-pyasn1-modules/python-pyasn1-modules.hash | 6 +++---
 package/python-pyasn1-modules/python-pyasn1-modules.mk   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pyasn1-modules/Config.in b/package/python-pyasn1-modules/Config.in
index 6aff4d935b..cb486d33ae 100644
--- a/package/python-pyasn1-modules/Config.in
+++ b/package/python-pyasn1-modules/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_PYASN1_MODULES
 	help
 	  A collection of ASN.1-based protocols modules.
 
-	  https://github.com/etingof/pyasn1-modules
+	  https://github.com/pyasn1/pyasn1-modules
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.hash b/package/python-pyasn1-modules/python-pyasn1-modules.hash
index 2305596585..6f4bb6faf0 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.hash
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1-modules/json
-md5  107e1ece7d0a41d782f69f8a95a4d9bc  pyasn1-modules-0.2.8.tar.gz
-sha256  905f84c712230b2c592c19470d3ca8d552de726050d1d1716282a1f6146be65e  pyasn1-modules-0.2.8.tar.gz
+md5  94ee572b06ae09f1903b11333575b091  pyasn1_modules-0.3.0.tar.gz
+sha256  5bd01446b736eb9d31512a30d46c1ac3395d676c6f3cafa4c03eb54b9925631c  pyasn1_modules-0.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.txt
+sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.txt
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.mk b/package/python-pyasn1-modules/python-pyasn1-modules.mk
index 9933a63aa7..41987028fc 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.mk
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_MODULES_VERSION = 0.2.8
-PYTHON_PYASN1_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
-PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/88/87/72eb9ccf8a58021c542de2588a867dbefc7556e14b2866d1e40e9e2b587e
+PYTHON_PYASN1_MODULES_VERSION = 0.3.0
+PYTHON_PYASN1_MODULES_SOURCE = pyasn1_modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
+PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/3b/e4/7dec823b1b5603c5b3c51e942d5d9e65efd6ff946e713a325ed4146d070f
 PYTHON_PYASN1_MODULES_SETUP_TYPE = setuptools
 PYTHON_PYASN1_MODULES_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_MODULES_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
