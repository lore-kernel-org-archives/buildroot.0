Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBC1CF884C
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 12:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC4A40F8A;
	Thu, 20 Nov 2025 12:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tban-kuwk-Qo; Thu, 20 Nov 2025 12:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55F0040F30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F0040F30;
	Thu, 20 Nov 2025 12:17:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22541158
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1405E40E11
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omP1Ph_IFfTB for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 12:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 756BD4037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 756BD4037E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 756BD4037E
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:17:41 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B56882C8315C;
 Thu, 20 Nov 2025 13:17:39 +0100 (CET)
From: Marcus Hoffmann <buildroot@bubu1.eu>
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 13:17:36 +0100
Message-ID: <20251120121739.1365133-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763641059; bh=9xjMEHPel6eVqv0awPg6hOCIAa2ktA9oW/TPn71UeFY=;
 h=From:To:Cc:Subject:Date;
 b=rMzmGicoZIKRJr+/yukcBia3mKGsqK1UKwB9seNEGqEEWahBJij2Lxvau4FbRE+Yf
 AuhUoICtCxgPPosrMz6V0jEbQxO/7Pax6RP1wK2hd5XMcIoqD9X96tXREmGG7SssiL
 9Pa0PuKixVMITc65TzwbPA7CWNDfw6F9QaHNPEm5qKDB/uKuCBRloXnQRTykageT+p
 xTK5yyZZ6C7vY5+LZ4Pg9fKuya94B+0WzdZxZpoJRDRxTu1nvq9+pcCk41nZeNvC+L
 YQz5EnK4fmfXstFPt1HhYuEBd8OiiTc6Ms/1gHUl7QBd2v8Lg54svX6OqFQ9MykHqD
 oVnyMjuZcM7gA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=rMzmGico
Subject: [Buildroot] [PATCH 1/3] package/python-sdbus-systemd: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/python-sdbus-systemd/Config.in             | 11 +++++++++++
 .../python-sdbus-systemd/python-sdbus-systemd.hash |  5 +++++
 .../python-sdbus-systemd/python-sdbus-systemd.mk   | 14 ++++++++++++++
 .../tests/package/sample_python_sdbus_systemd.py   | 11 +++++++++++
 .../tests/package/test_python_sdbus_systemd.py     | 14 ++++++++++++++
 7 files changed, 59 insertions(+)
 create mode 100644 package/python-sdbus-systemd/Config.in
 create mode 100644 package/python-sdbus-systemd/python-sdbus-systemd.hash
 create mode 100644 package/python-sdbus-systemd/python-sdbus-systemd.mk
 create mode 100644 support/testing/tests/package/sample_python_sdbus_systemd.py
 create mode 100644 support/testing/tests/package/test_python_sdbus_systemd.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 0272b4ba33..b9e7e12a86 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2273,6 +2273,7 @@ F:	package/python-ruamel-yaml-clib/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-sdbus-modemmanager/
+F:	package/python-sdbus-systemd/
 F:	package/python-waitress/
 F:	package/python-whitenoise/
 F:	support/testing/tests/package/test_python_apscheduler.py
@@ -2283,6 +2284,7 @@ F:	support/testing/tests/package/test_python_pydantic.py
 F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
+F:	support/testing/tests/package/test_python_sdbus_systemd.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/test_python_whitenoise.py
@@ -2294,6 +2296,7 @@ F:	support/testing/tests/package/sample_python_pydantic.py
 F:	support/testing/tests/package/sample_python_pydantic_settings.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
+F:	support/testing/tests/package/sample_python_sdbus_systemd.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
diff --git a/package/Config.in b/package/Config.in
index 12f327cb27..1cd4a64290 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1385,6 +1385,7 @@ menu "External python modules"
 	source "package/python-sdbus/Config.in"
 	source "package/python-sdbus-modemmanager/Config.in"
 	source "package/python-sdbus-networkmanager/Config.in"
+	source "package/python-sdbus-systemd/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
diff --git a/package/python-sdbus-systemd/Config.in b/package/python-sdbus-systemd/Config.in
new file mode 100644
index 0000000000..0244f4dc0f
--- /dev/null
+++ b/package/python-sdbus-systemd/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_SDBUS_SYSTEMD
+	bool "python-sdbus-systemd"
+	depends on BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_PYTHON_SDBUS # runtime
+	help
+	  Systemd bindings for python-sdbus.
+
+	  https://github.com/bernhardkaindl/python-sdbus-systemd
+
+comment "python-sdbus-systemd needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
diff --git a/package/python-sdbus-systemd/python-sdbus-systemd.hash b/package/python-sdbus-systemd/python-sdbus-systemd.hash
new file mode 100644
index 0000000000..31eb2a0c64
--- /dev/null
+++ b/package/python-sdbus-systemd/python-sdbus-systemd.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/sdbus-modemmanager/json
+md5  726a016b518e3ac47fde0e51b751b6b0  sdbus-systemd-1.0.0.tar.gz
+sha256  80aef69a69685ac7807ba1cc7db48e10e59104260beda1deef6cd5f81e1ad297  sdbus-systemd-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-sdbus-systemd/python-sdbus-systemd.mk b/package/python-sdbus-systemd/python-sdbus-systemd.mk
new file mode 100644
index 0000000000..0599d2794a
--- /dev/null
+++ b/package/python-sdbus-systemd/python-sdbus-systemd.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sdbus-systemd
+#
+################################################################################
+
+PYTHON_SDBUS_SYSTEMD_VERSION = 1.0.0
+PYTHON_SDBUS_SYSTEMD_SOURCE = sdbus-systemd-$(PYTHON_SDBUS_SYSTEMD_VERSION).tar.gz
+PYTHON_SDBUS_SYSTEMD_SITE = https://files.pythonhosted.org/packages/e1/84/911de0ea63a0dab814dc94f73e7b916bfd4675e1e983b58a725a26a65db4
+PYTHON_SDBUS_SYSTEMD_SETUP_TYPE = setuptools
+PYTHON_SDBUS_SYSTEMD_LICENSE = LGPL-2.1+
+PYTHON_SDBUS_SYSTEMD_LICENSE_FILES = COPYING.LESSER
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_sdbus_systemd.py b/support/testing/tests/package/sample_python_sdbus_systemd.py
new file mode 100644
index 0000000000..6cb1925ac3
--- /dev/null
+++ b/support/testing/tests/package/sample_python_sdbus_systemd.py
@@ -0,0 +1,11 @@
+#!/usr/bin/env python3
+
+import sdbus
+
+from sdbus_block.systemd.objects import Systemd, SystemdUnit
+
+sdbus.set_default_bus(sdbus.sd_bus_open_system())
+unit_object_path = Systemd().load_unit("systemd-journald.service")
+unit = SystemdUnit(unit_object_path)
+
+assert unit.active_enter_timestamp != None
diff --git a/support/testing/tests/package/test_python_sdbus_systemd.py b/support/testing/tests/package/test_python_sdbus_systemd.py
new file mode 100644
index 0000000000..9e97df6465
--- /dev/null
+++ b/support/testing/tests/package/test_python_sdbus_systemd.py
@@ -0,0 +1,14 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3SdbusSystemd(TestPythonPackageBase):
+    __test__ = True
+    config = (
+        TestPythonPackageBase.config
+        + """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_PYTHON_SDBUS_SYSTEMD=y
+        """
+    )
+    sample_scripts = ["tests/package/sample_python_sdbus_systemd.py"]
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
