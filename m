Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C0EC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 19:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5940183BCB;
	Thu, 14 Dec 2023 19:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5940183BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tQ3zpPIzPTo5; Thu, 14 Dec 2023 19:24:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9347D83BDD;
	Thu, 14 Dec 2023 19:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9347D83BDD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 289B51BF3EA
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0099660C11
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0099660C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J59qF0DVVwNI for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 19:24:43 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D83FF60BF8
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 19:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D83FF60BF8
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7b71b10391aso316158339f.3
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 11:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702581881; x=1703186681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FVwONlfOm+aMvQ8aLEzZ59EI1JLQCF78ihG2Ny1wE/k=;
 b=RYH9ZJrMaI9RMnGY1DtwggVL3pRQ5pgeH7Gct/jWbBPsDLizcKqIxsFXMEjJH4pwRm
 NoX9aM9Q+RZpKrUuPW0Xv/H/skNvrKGO9xce78d2vwSzWTiVlo6rjeRNVLux3pP4ghDb
 87ck5/vPl7mpLvxBk/o520ZmaIj7esv5VKh5ZnCK+qzQHDzlzroBAtgd++Vg9+67vCAN
 0eUN9KsagL0AXigWEsXhhfLFyzRS6H+E1pY2lnl6SyhHGGLHLKEyMSPitnxilfV+RCET
 lgJTzOCCZ8t1pg5e+umVUYDgA9bBPxh2mbjWH5UMBMWa+hwWdsGeklyiRpUdlgZ+G4nU
 ZwRQ==
X-Gm-Message-State: AOJu0Ywo2RgODOXA31PvxzUGMZDnJpl2rtqYBOeUKbvCc8wnDn+MDSl9
 QngLTfHQrdmoiU6ZpqQZ4Nq8FfB/x2JS7g==
X-Google-Smtp-Source: AGHT+IH2/3dMPquboM8ZDmzb4tlidbR9AyDKJm+eu1z5eokiqTI67GsEGXE7PfOmvtYisw0azu+rEA==
X-Received: by 2002:a6b:7a0a:0:b0:7b7:34:1fc4 with SMTP id
 h10-20020a6b7a0a000000b007b700341fc4mr8516896iom.23.1702581881357; 
 Thu, 14 Dec 2023 11:24:41 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 c16-20020a0290d0000000b00468e80fa254sm1345615jag.148.2023.12.14.11.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 11:24:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 12:24:33 -0700
Message-Id: <20231214192439.259156-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702581881; x=1703186681; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FVwONlfOm+aMvQ8aLEzZ59EI1JLQCF78ihG2Ny1wE/k=;
 b=cWov2PYKBTc+uQhIO5mMZSYAcAFWD5KE8d0DJZy8jGIPfez0wHUTYAlFWPJ5Yxz/kV
 VB6R3Ume7MqL2+KvbuMmk9+uK64sXl04FQIhYLr8WpCUvkO4MKRSnDYLsNKq+WkB7xnx
 KD8nPyEMWa6mD23ce/cLU/+xjreyADabUL9IlF2/tyYUm4plXqU37yb8F3BwGHiLBETV
 r3xGHR0AZzskXiOHUtJIOEa10xFLKVunPG4fRXoy0pCXs2VKhGSAVSue2cRvTzeyMY5R
 37M3S8TIyR+mhIDwOmNJ0NHt+y1MZeOTGwpEcA/7+3tskGHvEWojegTneD1so4GpyJY2
 y+KA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cWov2PYK
Subject: [Buildroot] [PATCH 1/7] package/python-grpcio: new package
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
 package/Config.in                        |  1 +
 package/python-grpcio/Config.in          |  6 ++++++
 package/python-grpcio/python-grpcio.hash |  5 +++++
 package/python-grpcio/python-grpcio.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-grpcio/Config.in
 create mode 100644 package/python-grpcio/python-grpcio.hash
 create mode 100644 package/python-grpcio/python-grpcio.mk

diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..69972156eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1094,6 +1094,7 @@ menu "External python modules"
 	source "package/python-gobject/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
+	source "package/python-grpcio/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
new file mode 100644
index 0000000000..e63ac2ae34
--- /dev/null
+++ b/package/python-grpcio/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_GRPCIO
+	bool "python-grpcio"
+	help
+	  HTTP/2-based RPC framework.
+
+	  https://grpc.io
diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
new file mode 100644
index 0000000000..39366f576e
--- /dev/null
+++ b/package/python-grpcio/python-grpcio.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/grpcio/json
+md5  480bfb7435426de392a883e6516aae79  grpcio-1.60.0.tar.gz
+sha256  2199165a1affb666aa24adf0c97436686d0a61bc5fc113c037701fb7c7fceb96  grpcio-1.60.0.tar.gz
+# Locally computed sha256 checksums
+sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
new file mode 100644
index 0000000000..3d264de4af
--- /dev/null
+++ b/package/python-grpcio/python-grpcio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-grpcio
+#
+################################################################################
+
+PYTHON_GRPCIO_VERSION = 1.60.0
+PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/61/38/c615b5c2be690fb31871f294cc08a96e598b085b8d07c5967a5018e0b90c
+PYTHON_GRPCIO_SETUP_TYPE = setuptools
+PYTHON_GRPCIO_LICENSE = Apache-2.0
+PYTHON_GRPCIO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
