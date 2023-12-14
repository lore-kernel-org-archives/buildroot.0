Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71188C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 11:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E8C760A99;
	Thu, 14 Dec 2023 11:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E8C760A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgmtyiSbRP2O; Thu, 14 Dec 2023 11:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37A8360864;
	Thu, 14 Dec 2023 11:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37A8360864
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5661BF2F0
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 11:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 284514096A
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 11:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284514096A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R22ya1UTla7u for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 11:24:42 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EF584095A
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 11:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EF584095A
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-35f77a076e1so1143725ab.1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 03:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702553080; x=1703157880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lztgJgKQmDHZtDfOK8sy2CD4CmlaUQu8hM+z8B9arhI=;
 b=WuiJ5OVB0axFeNZOhykBLbtdqBoWYzyjrvnmE7+92J0ki/rXL0kAPi96yitUDPnrCK
 jkjs0zjkigrHfVmdKjL6FJ3JFBXJhyopXm+5+8OGLNEakfFayDfXZ2ldSZTHqPSyOoFe
 zZUhAox9mjK3gV+YD1g6B1XI32rZUGp9cj3UwLLtmQoeLMObFFD06s0R6e0pb0SB5Hml
 +srGf9k93yYCijOw00J1U0fgVQHflCX/XfQGArH3ZnMItcMdYfKjplnTPIz3nv2rVQAF
 eQ7o60TbEFoMyW3XYXaDw1X3Jzhs6+LxHvumOZZhuP8n04MfElVkwdsagEYH8nbSkLky
 mgXg==
X-Gm-Message-State: AOJu0YzyFlstjUBZluHGn+LYuDp3jfFh1uZbHX/8IMtTRpltunSbIaB9
 4/fmTg4TtYf/bYNQ070KxQrx56H9dYsGOQ==
X-Google-Smtp-Source: AGHT+IG7fq4UpaBTcW/pNcF6OOxcppLee7vHMeG96eE+jzKIssXttJ2eg7+L2WnYm6Ejz/ROPVItNg==
X-Received: by 2002:a05:6e02:1a66:b0:35f:72ec:7c17 with SMTP id
 w6-20020a056e021a6600b0035f72ec7c17mr2008132ilv.11.1702553080577; 
 Thu, 14 Dec 2023 03:24:40 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 x10-20020a02970a000000b00468ea2264e1sm3338599jai.73.2023.12.14.03.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 03:24:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 04:24:34 -0700
Message-Id: <20231214112436.144804-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702553080; x=1703157880; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lztgJgKQmDHZtDfOK8sy2CD4CmlaUQu8hM+z8B9arhI=;
 b=VhOO9v1RwUe5dl+7T2YkUUCUAEV3m3T0DlOIBuNO1uz/Z7r3YmqUA8hdqfDEw3Uzq2
 x1QtY/79ivwtbvPNBqZ3YWZb5POmaB11ajiLWwr5tJtMM69ocpSrIy1wSs8dBjfFtYuJ
 gxeMgGMtChh6BlO1j4HsEKlLJbY4lMlg5OKl77a0/Ez+u1eE7B7a2CPtcxP0xa8OGYe1
 MqLXx58Dtu69AuonWdzX5FJMwZBGiP18BPiOFB7iPdL9f50rxC6cx1/MIUh1dQKJmSZj
 5hUtf2eqgDo4XRQjO86i/WAEigXFZPu9D1q4sGdt09R1iwGRl3El4nSJ0UCw3/U/KROo
 tJPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VhOO9v1R
Subject: [Buildroot] [PATCH v2 1/3] package/python-anyio: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - downgrade to version 3.7.1
---
 package/Config.in                      |  1 +
 package/python-anyio/Config.in         |  9 +++++++++
 package/python-anyio/python-anyio.hash |  5 +++++
 package/python-anyio/python-anyio.mk   | 15 +++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-anyio/Config.in
 create mode 100644 package/python-anyio/python-anyio.hash
 create mode 100644 package/python-anyio/python-anyio.mk

diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..c023e0ef3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -976,6 +976,7 @@ menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-annotated-types/Config.in"
 	source "package/python-ansicolors/Config.in"
+	source "package/python-anyio/Config.in"
 	source "package/python-apispec/Config.in"
 	source "package/python-appdirs/Config.in"
 	source "package/python-argh/Config.in"
diff --git a/package/python-anyio/Config.in b/package/python-anyio/Config.in
new file mode 100644
index 0000000000..d843f37af0
--- /dev/null
+++ b/package/python-anyio/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ANYIO
+	bool "python-anyio"
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
+	help
+	  High level compatibility layer for multiple asynchronous
+	  event loop implementations.
+
+	  https://github.com/agronholm/anyio
diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
new file mode 100644
index 0000000000..1cea549bc1
--- /dev/null
+++ b/package/python-anyio/python-anyio.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/anyio/json
+md5  58d288dd84e28e2507ff9ce7e4620010  anyio-3.7.1.tar.gz
+sha256  44a3c9aba0f5defa43261a8b3efb97891f2bd7d804e0e1f56419befa1adfc780  anyio-3.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
new file mode 100644
index 0000000000..80404ac660
--- /dev/null
+++ b/package/python-anyio/python-anyio.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-anyio
+#
+################################################################################
+
+PYTHON_ANYIO_VERSION = 3.7.1
+PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/28/99/2dfd53fd55ce9838e6ff2d4dac20ce58263798bd1a0dbe18b3a9af3fcfce
+PYTHON_ANYIO_SETUP_TYPE = setuptools
+PYTHON_ANYIO_LICENSE = MIT
+PYTHON_ANYIO_LICENSE_FILES = LICENSE
+PYTHON_ANYIO_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
