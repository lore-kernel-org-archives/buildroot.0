Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2372DC54754
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 11:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D7C822E2;
	Sat, 17 May 2025 11:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9IuMZBXVPaP; Sat, 17 May 2025 11:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EB478299E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB478299E;
	Sat, 17 May 2025 11:22:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32E9DE4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FB8B409B1
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlUDwCz2CaMW for <buildroot@buildroot.org>;
 Sat, 17 May 2025 11:22:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77C6740905
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C6740905
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77C6740905
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:22:30 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4B2142C845F4;
 Sat, 17 May 2025 13:22:28 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Date: Sat, 17 May 2025 13:22:24 +0200
Message-ID: <20250517112226.129662-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250517112226.129662-1-buildroot@bubu1.eu>
References: <20250517112226.129662-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747480948; bh=MIlPHofJdaQPOM3ovSeBhJWt5beO1N5T1Z+hP++zJ78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hWgT+QwyWYQdI1gBuxymq+rXmXuV7Jst0YT+ETAh8lTaHnjzlWuyO/fV+kNgW0kkm
 ow/zLl8LvH/sPBBWpMIcmG5Clq3xf9WXvN0enrcPsOryeJsIZ+kpA2sMKv/uixVWBA
 inmLSo5E62uNHuDcP8qQDjhjiu8r/oAG0SgTFQo579a0d5BQIoWbl+UGA3g1uCbcCI
 5QYxFTrtoPBXUgDgVa4kCyBkKvzeW1GQJOd1SY+PqTOVO7dvnncPyExRwo3JPBICE+
 TvzUmhg0fZ5mnl0VQnSPp8I5dOViiH2YXGxaEfubhudDUV7jKsJgfZlTU5G2kusyyZ
 OrX1504ZeQ3Sw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=hWgT+Qwy
Subject: [Buildroot] [PATCH 2/2] package/python-crc: new runtime test
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
 DEVELOPERS                                         |  2 ++
 support/testing/tests/package/sample_python_crc.py |  7 +++++++
 support/testing/tests/package/test_python_crc.py   | 11 +++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_crc.py
 create mode 100644 support/testing/tests/package/test_python_crc.py

diff --git a/DEVELOPERS b/DEVELOPERS
index e43d265d7a..1d799730c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2284,12 +2284,14 @@ F:	package/python-ruamel-yaml-clib/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-waitress/
+F:	support/testing/tests/package/test_python_crc.py
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
 F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
+F:	support/testing/tests/package/sample_python_crc.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
 F:	support/testing/tests/package/sample_python_pydantic_settings.py
diff --git a/support/testing/tests/package/sample_python_crc.py b/support/testing/tests/package/sample_python_crc.py
new file mode 100644
index 0000000000..0090df11f2
--- /dev/null
+++ b/support/testing/tests/package/sample_python_crc.py
@@ -0,0 +1,7 @@
+from crc import Calculator, Crc8
+
+expected = 0xBC
+data = bytes([0, 1, 2, 3, 4, 5])
+calculator = Calculator(Crc8.CCITT)
+
+assert expected == calculator.checksum(data)
diff --git a/support/testing/tests/package/test_python_crc.py b/support/testing/tests/package/test_python_crc.py
new file mode 100644
index 0000000000..0b36580a44
--- /dev/null
+++ b/support/testing/tests/package/test_python_crc.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Crc(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CRC=y
+        """
+    sample_scripts = ["tests/package/sample_python_crc.py"]
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
