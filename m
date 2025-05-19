Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268C6C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C7940D64;
	Mon, 19 May 2025 10:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuUX0gXiY3EM; Mon, 19 May 2025 10:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1B1340D40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1B1340D40;
	Mon, 19 May 2025 10:15:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F22C0D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEE2A40460
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28W2dfysbRLS for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:15:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0829401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0829401AD
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0829401AD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:15:25 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6F97E2C8455C;
 Mon, 19 May 2025 12:15:23 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Date: Mon, 19 May 2025 12:15:19 +0200
Message-ID: <20250519101521.322507-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519101521.322507-1-buildroot@bubu1.eu>
References: <20250519101521.322507-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747649723; bh=xzYRUBUTwLX/jn9UEy4cOuHGFiJDKHUZS/1GVFsD1q0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=s5S034zrAHbMHdTqGOenROF7KZOUMM/QR5ie5wLyXa1AJJGn8Ny0DnG6GEf8qivP5
 QTWQl/aZqagNqC3PwyR+v3J73dW/wBXpsU69Su9K9owibMKr5sKGcrl1ttTHEKX1aP
 54ciYmVXz+/QdIfDY8/YuVsMr4huV7o8szGlnJXIgQ7wW5n1Qhv4qM381NH5IhRods
 Kg5jJlFuSAQ9P1QEM+KdV6n0b9gk+2qXZoiMVQgt5ZdjJyg6qA+aHJvyIddSZ8svt0
 pT+cdJlkRdQpag5MWInWuznkPLxvZ+XAudOeutv8l8eKNRIeclNHLPxeo3ItitJZV2
 iiqrdSm5Yuysg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=s5S034zr
Subject: [Buildroot] [PATCH 2/2] package/python-sdbus-modemmanager: new
 runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS                                        |  2 ++
 .../package/sample_python_sdbus_modemmanager.py   | 10 ++++++++++
 .../package/test_python_sdbus_modemmanager.py     | 15 +++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_sdbus_modemmanager.py
 create mode 100644 support/testing/tests/package/test_python_sdbus_modemmanager.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 087500c755..57738ee2fb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2288,12 +2288,14 @@ F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
 F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
+F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
 F:	support/testing/tests/package/sample_python_pydantic_settings.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
+F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
diff --git a/support/testing/tests/package/sample_python_sdbus_modemmanager.py b/support/testing/tests/package/sample_python_sdbus_modemmanager.py
new file mode 100644
index 0000000000..9c4c3017d6
--- /dev/null
+++ b/support/testing/tests/package/sample_python_sdbus_modemmanager.py
@@ -0,0 +1,10 @@
+#!/usr/bin/env python3
+
+from sdbus_block.modemmanager import MM, MMModems
+
+import sdbus
+
+sdbus.set_default_bus(sdbus.sd_bus_open_system())
+mm = MM()
+
+assert mm.version != None
diff --git a/support/testing/tests/package/test_python_sdbus_modemmanager.py b/support/testing/tests/package/test_python_sdbus_modemmanager.py
new file mode 100644
index 0000000000..34ab66e3bf
--- /dev/null
+++ b/support/testing/tests/package/test_python_sdbus_modemmanager.py
@@ -0,0 +1,15 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3SdbusNetworkmanager(TestPythonPackageBase):
+    __test__ = True
+    config = (
+        TestPythonPackageBase.config
+        + """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_MODEM_MANAGER=y
+        BR2_PACKAGE_PYTHON_SDBUS_MODEMMANAGER=y
+        """
+    )
+    sample_scripts = ["tests/package/sample_python_sdbus_modemmanager.py"]
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
