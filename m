Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F02CAC5B2
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 00:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E228A41A3C;
	Wed, 18 Sep 2024 00:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ex9ILkK38pRh; Wed, 18 Sep 2024 00:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F12141A76
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F12141A76;
	Wed, 18 Sep 2024 00:44:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5121B1BF977
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 00:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA70B41A76
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 00:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7vci3-NtFta for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 00:44:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B16F41A3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B16F41A3C
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B16F41A3C
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 00:44:03 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-831e62bfa98so50811739f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 17:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726620242; x=1727225042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WfCP8XB2MXfj8THeHym1QQ0EXMCFN8uTtUqaFSBPfUA=;
 b=g7RvgmVaYDZJAleYnU04oBwGoSuXh3XiB57CAyUvUQQ+oy7knuljZff5yIUgDfBGhL
 +GJkG9jhDjFzrBJ+fPeOjNCMyzDlaLYhABUg9R7ASi1C8plBfkfdNX754g/KqJYRwnQY
 CJk8YeTdvw22pU7awKK+KL1Peo8g8WDZSRXw2ymks8kVcJA3ZdnEPToBKkSF7lZRaSXC
 +0jH6D7Z4DVc7o5+/EOHNMZTsTME9rzsh4HJvq4xMqUY1Fo76YZ5aS1C08WmH7y4darA
 6qRhD1DTl86Np67Ji2xyH8vuytnPCY5kdKf3dR2M1V10hdJJ9Ry/q6d+7NzzlSJ2F6Nh
 0gRw==
X-Gm-Message-State: AOJu0YxfwNmPb5+dcULKkuKO/MqGple5nwqjGN4hau1WQVvijhg756h0
 s8/IX8q8yHtvV6C2/2GS183bvfoM/Ven7DT2CFWiJQ4u1qTVby0bqIdja/46
X-Google-Smtp-Source: AGHT+IEM3y2mQJmQGyQssTGTw9zmJYRuxyrvx9X/gUOHOTQB32ZPqyylwgTLmi4VhmA4KdRTR2E29Q==
X-Received: by 2002:a05:6e02:20ee:b0:3a0:ac5a:2015 with SMTP id
 e9e14a558f8ab-3a0ac5a2062mr47445625ab.6.1726620242250; 
 Tue, 17 Sep 2024 17:44:02 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d027sm2246193173.80.2024.09.17.17.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 17:44:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 18:43:58 -0600
Message-Id: <20240918004359.422768-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726620242; x=1727225042; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WfCP8XB2MXfj8THeHym1QQ0EXMCFN8uTtUqaFSBPfUA=;
 b=kwx+HaEM5L7oNXjvHNsyc2vKQNDv0nwYLWVkt50ezM/yjqK8cmVAGrXjnLUYKMv/Tj
 RSqBH1dwmC1vhuo4LjsznJuJCMWYnd5irFAs+l4UDD/ekTos0FZpLCUxRO3gRL/3FCs9
 whF1KnYZAM5l6U6OShuMH1GgXCCP0xAt3pjRDWiFgWDJWdlsJuSjzmF1reJSEmyBod3t
 mbEt9WTvaOlPBCJHnG071iD2lBjbgTguMI3U2dqxACbFbKipOnlRU4IXvQQiGDqzzS9I
 zr2lLaQoZ6HJZe1+5lda4AfsWylapxva5vWm3yNRi9hIxlWR/BDohod1FUdIkOM4marE
 6RRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kwx+HaEM
Subject: [Buildroot] [PATCH 1/2] package/python-path: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-path/Config.in        |  6 ++++++
 package/python-path/python-path.hash |  5 +++++
 package/python-path/python-path.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-path/Config.in
 create mode 100644 package/python-path/python-path.hash
 create mode 100644 package/python-path/python-path.mk

diff --git a/package/Config.in b/package/Config.in
index 2200f16520..1033cfdef1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1246,6 +1246,7 @@ menu "External python modules"
 	source "package/python-paramiko/Config.in"
 	source "package/python-parso/Config.in"
 	source "package/python-passlib/Config.in"
+	source "package/python-path/Config.in"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathspec/Config.in"
 	source "package/python-pathtools/Config.in"
diff --git a/package/python-path/Config.in b/package/python-path/Config.in
new file mode 100644
index 0000000000..a03b568593
--- /dev/null
+++ b/package/python-path/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PATH
+	bool "python-path"
+	help
+	  Object-oriented file system path manipulation.
+
+	  https://github.com/jaraco/path
diff --git a/package/python-path/python-path.hash b/package/python-path/python-path.hash
new file mode 100644
index 0000000000..9a0d1a3681
--- /dev/null
+++ b/package/python-path/python-path.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/path/json
+md5  b970d0bcde985133cae6926a02e496b9  path-17.0.0.tar.gz
+sha256  e1540261d22df1416fb1b498b3b1ed5353a371a48fe197d66611bb01e7fab2d5  path-17.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-path/python-path.mk b/package/python-path/python-path.mk
new file mode 100644
index 0000000000..6e094aaad5
--- /dev/null
+++ b/package/python-path/python-path.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-path
+#
+################################################################################
+
+PYTHON_PATH_VERSION = 17.0.0
+PYTHON_PATH_SOURCE = path-$(PYTHON_PATH_VERSION).tar.gz
+PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/ff/a3/5dac44ce60ad6543578736a5729c5c2130cdac1c3117c61aad0583c2e3c6
+PYTHON_PATH_SETUP_TYPE = setuptools
+PYTHON_PATH_LICENSE = MIT
+PYTHON_PATH_LICENSE_FILES = LICENSE
+PYTHON_PATH_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
