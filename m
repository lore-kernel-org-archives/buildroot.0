Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27524C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 08:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A43E260E47;
	Sat, 25 Nov 2023 08:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A43E260E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXb4UnJiPS2r; Sat, 25 Nov 2023 08:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11D660B6C;
	Sat, 25 Nov 2023 08:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C11D660B6C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4701BF3D2
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 08:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 454AC41EBE
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 08:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 454AC41EBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCD8ZV-1tA69 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 08:10:58 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 175EE41841
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 08:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 175EE41841
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7b37dd4bb35so39038039f.3
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 00:10:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700899856; x=1701504656;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w2NDxEOlsFkpeZBwbHs1lzEgOvjgvAtnDO43Zgn//fo=;
 b=JpPPTJRDGFk3zm1mgq3PbxjsgAvEQeVxd5JNO3m0Q6Shw9PPwImnzWyMsilYxwaezF
 IZ4F5/yhr9CBB6RqOpZXDU0xmWAFfRrcNScey2ZhleBC+2FTp1LQCst3exN6FscCMZ5b
 /EJxPRNt48ywaZRKJKQ2ucOclSf7vafd1ZOHpBoj+a4aqN9WAtuN/OxUHdvajZXOM4Mp
 7lZ3nnsT3Kq/zwpEl/ymORxujPNFCoZ0rXxUetTr9yuS4dPIOwRPZxlaQUrCfgrYvzOf
 S4f+xjjsBNC3rvqgeS2pcVN3d0YUyt9mAgw4cjIcYegWigjqmOuusAshu09K43phYLCc
 pakQ==
X-Gm-Message-State: AOJu0YwgaN70XvcVUDvFiKDsZPN9dee7yvudDoevcVte4zsCa7t3vOPT
 RvKOkF/2oSBa8rML1HYexyYL8mHvlTA=
X-Google-Smtp-Source: AGHT+IGMYQC58Rm8BbRaoOLchTLvfhs6Wjzg48iBRjyUF9PGYBd2DUsynSFpv1B0oLLlYfjdHqCszQ==
X-Received: by 2002:a5e:df43:0:b0:783:4f8d:4484 with SMTP id
 g3-20020a5edf43000000b007834f8d4484mr5819329ioq.2.1700899856568; 
 Sat, 25 Nov 2023 00:10:56 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 z23-20020a6b0a17000000b007a667c41368sm1294634ioi.54.2023.11.25.00.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 00:10:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 01:10:50 -0700
Message-Id: <20231125081052.881728-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700899856; x=1701504656; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w2NDxEOlsFkpeZBwbHs1lzEgOvjgvAtnDO43Zgn//fo=;
 b=VHTL4jhGb4N384930CpQjeMJX4JPlXZPVQxtRzqr05yWFNBZ5BHOAPqFrOteK8tyRJ
 p60S5lkJlOJmy4DeygJaPbmqnqL9z2ugD/G8hKiFvjgEjqNbiMbNajoARTTEaBZVaFZw
 0ETIpCR1E8469+Hy07anCRGDR+NVAwX38nzxmKMzxbnQMTtmeR7MESY8Z8DXAEEUFanC
 55TSuGkEwoG02TDmPyhifvsJq/xELfe86Q6VABZym7h++RELtDX4wxXJ/obsu5sqZTnR
 B+qy950URmY+lDlED4y9KaJ2afTc+pxs1eVKnBUijY/QElHu/y7dbqodyG5+qndnEyGJ
 X/Pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VHTL4jhG
Subject: [Buildroot] [PATCH 1/3] package/python-annotated-types: new package
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
 package/Config.in                                 |  1 +
 package/python-annotated-types/Config.in          |  6 ++++++
 .../python-annotated-types.hash                   |  5 +++++
 .../python-annotated-types.mk                     | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-annotated-types/Config.in
 create mode 100644 package/python-annotated-types/python-annotated-types.hash
 create mode 100644 package/python-annotated-types/python-annotated-types.mk

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..68e6e29a4d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -974,6 +974,7 @@ menu "External python modules"
 	source "package/python-aiozipkin/Config.in"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
+	source "package/python-annotated-types/Config.in"
 	source "package/python-ansicolors/Config.in"
 	source "package/python-apispec/Config.in"
 	source "package/python-appdirs/Config.in"
diff --git a/package/python-annotated-types/Config.in b/package/python-annotated-types/Config.in
new file mode 100644
index 0000000000..36525a526b
--- /dev/null
+++ b/package/python-annotated-types/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ANNOTATED_TYPES
+	bool "python-annotated-types"
+	help
+	  Reusable constraint types to use with typing.Annotated.
+
+	  https://github.com/annotated-types/annotated-types
diff --git a/package/python-annotated-types/python-annotated-types.hash b/package/python-annotated-types/python-annotated-types.hash
new file mode 100644
index 0000000000..1663bcb51f
--- /dev/null
+++ b/package/python-annotated-types/python-annotated-types.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/annotated-types/json
+md5  5fe2125b08851f0d05a8efad6456861c  annotated_types-0.6.0.tar.gz
+sha256  563339e807e53ffd9c267e99fc6d9ea23eb8443c08f112651963e24e22f84a5d  annotated_types-0.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256  fe1049884b1a0d9342901e88e07f32925d24b3121d9972b6a6805fb9824b095d  LICENSE
diff --git a/package/python-annotated-types/python-annotated-types.mk b/package/python-annotated-types/python-annotated-types.mk
new file mode 100644
index 0000000000..8bc617069d
--- /dev/null
+++ b/package/python-annotated-types/python-annotated-types.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-annotated-types
+#
+################################################################################
+
+PYTHON_ANNOTATED_TYPES_VERSION = 0.6.0
+PYTHON_ANNOTATED_TYPES_SOURCE = annotated_types-$(PYTHON_ANNOTATED_TYPES_VERSION).tar.gz
+PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/67/fe/8c7b275824c6d2cd17c93ee85d0ee81c090285b6d52f4876ccc47cf9c3c4
+PYTHON_ANNOTATED_TYPES_SETUP_TYPE = pep517
+PYTHON_ANNOTATED_TYPES_LICENSE = MIT
+PYTHON_ANNOTATED_TYPES_LICENSE_FILES = LICENSE
+PYTHON_ANNOTATED_TYPES_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
