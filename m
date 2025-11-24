Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF5ECFA466
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 14:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E8C5607F8;
	Mon, 24 Nov 2025 14:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4C6fetgn1wiG; Mon, 24 Nov 2025 14:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0ED460F81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0ED460F81;
	Mon, 24 Nov 2025 14:05:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 018AB358
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F384C407B3
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJsaoMsGataE for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 14:05:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3DE14407B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DE14407B1
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DE14407B1
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:05:19 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 142022C80043;
 Mon, 24 Nov 2025 15:05:16 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 15:05:15 +0100
Message-ID: <20251124140517.2833351-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763993116; bh=BELeeLLwCZ1HexLaWx/KT33rD+c1FGbE/BPMUmaM67w=;
 h=From:To:Cc:Subject:Date;
 b=AeHvaRxfgfvyRYRMRMLoG/gCVnSmb8ePAWCDzgXNDol+wu89Oppwm+iAD1ZfPz6+P
 tI4i7+Jcm7JqfKbyKqVKYAXJY0azHYXFo5Y+1SPZ8O96AY44/N+WAWs+LIH18CK8tZ
 EljXsiRoL0eNUuklw+E5nZPVVrg6i02G5RcPk6E7WcvltAe+xkAu5JqdI1+zgDQawl
 Mkrcxo0FPi8ggWvQm2d/ohFN9H9qH3TavexuKChowcXABk1bHjLbb7hNDSHFB8EAPH
 hjtidPOOb/Yr10VrScPCicxAT/yUD3bJROX6eiV/Drwgydr/qHiTAvu//bkPXzrZ5+
 dckxL1PQB5hcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=AeHvaRxf
Subject: [Buildroot] [PATCH 1/2] package/python-varlink: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are currently problems in updating the pypi.org release[1], so we
pull the package from the github generated tarball instead. This in turn
then requires manually setting the version for setuptools_scm in the
environment.

[1] https://github.com/varlink/python/issues/81

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-varlink/Config.in           |  6 ++++++
 package/python-varlink/python-varlink.hash |  3 +++
 package/python-varlink/python-varlink.mk   | 15 +++++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/python-varlink/Config.in
 create mode 100644 package/python-varlink/python-varlink.hash
 create mode 100644 package/python-varlink/python-varlink.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index db001d6bb0..658023a4f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2273,6 +2273,7 @@ F:	package/python-ruamel-yaml-clib/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-sdbus-modemmanager/
+F:	package/python-varlink/
 F:	package/python-waitress/
 F:	package/python-whitenoise/
 F:	support/testing/tests/package/test_python_apscheduler.py
diff --git a/package/Config.in b/package/Config.in
index 12f327cb27..2fb9cd8472 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1476,6 +1476,7 @@ menu "External python modules"
 	source "package/python-uvicorn/Config.in"
 	source "package/python-uvloop/Config.in"
 	source "package/python-validators/Config.in"
+	source "package/python-varlink/Config.in"
 	source "package/python-versiontools/Config.in"
 	source "package/python-visitor/Config.in"
 	source "package/python-waitress/Config.in"
diff --git a/package/python-varlink/Config.in b/package/python-varlink/Config.in
new file mode 100644
index 0000000000..609fa22219
--- /dev/null
+++ b/package/python-varlink/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_VARLINK
+	bool "python-varlink"
+	help
+	  Python implementation of the Varlink protocol.
+
+	  https://github.com/varlink/python
diff --git a/package/python-varlink/python-varlink.hash b/package/python-varlink/python-varlink.hash
new file mode 100644
index 0000000000..5d8dfa9d8e
--- /dev/null
+++ b/package/python-varlink/python-varlink.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256  d31aee370ded51bc2bf8ad375fcd8b4cf3b7587306c0e05cffb45026ea9b9c40  python-varlink-32.1.0.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/python-varlink/python-varlink.mk b/package/python-varlink/python-varlink.mk
new file mode 100644
index 0000000000..1180cc4cc3
--- /dev/null
+++ b/package/python-varlink/python-varlink.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-varlink
+#
+################################################################################
+
+PYTHON_VARLINK_VERSION = 32.1.0
+PYTHON_VARLINK_SITE = $(call github,varlink,python,$(PYTHON_VARLINK_VERSION))
+PYTHON_VARLINK_SETUP_TYPE = setuptools
+PYTHON_VARLINK_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_VARLINK_LICENSE = Apache-2.0
+PYTHON_VARLINK_LICENSE_FILES = LICENSE.txt
+PYTHON_VARLINK_ENV = SETUPTOOLS_SCM_PRETEND_VERSION_FOR_VARLINK=$(PYTHON_VARLINK_VERSION)
+
+$(eval $(python-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
