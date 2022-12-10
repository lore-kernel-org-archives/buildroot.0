Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CA7C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 17:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75C40607F1;
	Sat, 10 Dec 2022 17:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75C40607F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QctSk92TJMDj; Sat, 10 Dec 2022 17:33:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FBE660A65;
	Sat, 10 Dec 2022 17:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FBE660A65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F282A1BF860
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA8FF81852
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA8FF81852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eS4x0CJOBLCK for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 17:33:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4FD1817FF
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4FD1817FF
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 17:33:55 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id q190so3706049iod.10
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 09:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GhmFHx9O3kVzFrQ1Ne60yNi9ACQB5G6s7IJ1/5GHtGU=;
 b=RgFe2fOTvUprJS/4IJXGyjFoplL3DKlJK/x4Vg6Ebe36cs3mSb/EP5MqZGqha7wjbG
 qkYDcIMvCcFEqsKUrk2iYZwrVCue9AvjhQ839AVDACNLke9J/g5UqIazddHzdgyuPSYk
 Q+ZGbJfPo1TG+GxFbKTStQjh2Z2xYCJFdmc+pWoO+XtHOBBVckKx4TXXsOsUZOQhXchh
 WGi19uPYRt5R6fHwiB5qZoY9ACWUAnuBiwO9sxSlbR9vNU1Oj0JVLQHbc2+aMwSyGdPX
 /fTJf1Xe7iehVu7EwUGLnwykDsi9eZKrMJVJ6W5fNvFFCiC0PTnObO7wCCXKo1tLFI/w
 0Wsg==
X-Gm-Message-State: ANoB5pl3Werr7vtS7QFY9jrNVB5uT2Ms6GfRMVtRImwM/369bekL9/K7
 UrGHxn+NvUdd25VhQnpVwA1hpYUSYImung==
X-Google-Smtp-Source: AA0mqf7uqSVM8gIPwRQmM2wZJdN6sr4QVtxX2swOh67ByjHuYbZKbcokd08R+ZI8jweDnLexcEaGKw==
X-Received: by 2002:a6b:3c12:0:b0:6d2:5d6b:d33a with SMTP id
 k18-20020a6b3c12000000b006d25d6bd33amr8231971iob.1.1670693634645; 
 Sat, 10 Dec 2022 09:33:54 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 j24-20020a056638053800b0038a56fc3ca9sm1551989jar.124.2022.12.10.09.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 09:33:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 10:33:52 -0700
Message-Id: <20221210173353.2652856-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GhmFHx9O3kVzFrQ1Ne60yNi9ACQB5G6s7IJ1/5GHtGU=;
 b=iyXAm7FtLErx+FtVj5AIoBM4Qi9avbZMQd+rWZPmdDjyeDp5g7TE72V+/OL42ktR/Y
 xYgOxJxhdGJhCFgaGyvo37oTgARre3QWVItUU0ZVGr6OBht9G3FMtb8MUA6ZARhzVvkm
 nNwCBix+ILXgWTDO/LxO12IlBTAOsPOx1FFLaRZEWFsgCmaMuld8Fyi79Lkjpp7QFU5L
 kSiHA5+8r7W6rGAzPnbKbKoTzxi0qrwX9dniTW+RySeaPUJhXsWEEceMN0ASjWoLJKx1
 ZdP+eUx+huCAB0rceY+JDp3oFMSmv+fDMEF0zMI95XU6sH3sRBbFgbY761HZKMyUUDYC
 LBzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iyXAm7Ft
Subject: [Buildroot] [PATCH 1/2] package/python-reedsolo: new package
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
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                            |  1 +
 package/python-reedsolo/Config.in            |  6 ++++++
 package/python-reedsolo/python-reedsolo.hash |  5 +++++
 package/python-reedsolo/python-reedsolo.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-reedsolo/Config.in
 create mode 100644 package/python-reedsolo/python-reedsolo.hash
 create mode 100644 package/python-reedsolo/python-reedsolo.mk

diff --git a/package/Config.in b/package/Config.in
index f4a423c7a6..5750955cdb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1230,6 +1230,7 @@ menu "External python modules"
 	source "package/python-qrcode/Config.in"
 	source "package/python-raven/Config.in"
 	source "package/python-redis/Config.in"
+	source "package/python-reedsolo/Config.in"
 	source "package/python-reentry/Config.in"
 	source "package/python-regex/Config.in"
 	source "package/python-remi/Config.in"
diff --git a/package/python-reedsolo/Config.in b/package/python-reedsolo/Config.in
new file mode 100644
index 0000000000..6482b1e98c
--- /dev/null
+++ b/package/python-reedsolo/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_REEDSOLO
+	bool "python-reedsolo"
+	help
+	  Pure-Python Reed Solomon encoder/decoder.
+
+	  https://github.com/tomerfiliba/reedsolomon
diff --git a/package/python-reedsolo/python-reedsolo.hash b/package/python-reedsolo/python-reedsolo.hash
new file mode 100644
index 0000000000..fdafc89f49
--- /dev/null
+++ b/package/python-reedsolo/python-reedsolo.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/reedsolo/json
+md5  b67a04027a1825c63a63b6793ec660a3  reedsolo-1.6.0.tar.gz
+sha256  4e290d3b0a7207ac7aac186790766c752b5fcdf5e0b04dfd260349579052bbac  reedsolo-1.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256  0babd7b573efc3dcf5bb3c28b583150726f775d3dd8d54d6cd062834735b3d73  LICENSE
diff --git a/package/python-reedsolo/python-reedsolo.mk b/package/python-reedsolo/python-reedsolo.mk
new file mode 100644
index 0000000000..2a7fd42a05
--- /dev/null
+++ b/package/python-reedsolo/python-reedsolo.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-reedsolo
+#
+################################################################################
+
+PYTHON_REEDSOLO_VERSION = 1.6.0
+PYTHON_REEDSOLO_SOURCE = reedsolo-$(PYTHON_REEDSOLO_VERSION).tar.gz
+PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/9b/10/28d1492cc82a103bc06f18cb9a9dbb3a9168ab2e4068801fa0aa0c76b231
+PYTHON_REEDSOLO_SETUP_TYPE = setuptools
+PYTHON_REEDSOLO_LICENSE = Public Domain
+PYTHON_REEDSOLO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
