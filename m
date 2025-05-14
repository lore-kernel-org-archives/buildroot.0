Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F0CC3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 15:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3AC560A7B;
	Wed, 14 May 2025 15:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuYLl6MqD6XR; Wed, 14 May 2025 15:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1272260BBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1272260BBD;
	Wed, 14 May 2025 15:13:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1030912A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 911AA82F98
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnbs7nW5tQFO for <buildroot@buildroot.org>;
 Wed, 14 May 2025 15:13:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D73A881007
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D73A881007
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D73A881007
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:08 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DEF0E2C845CE
 for <buildroot@buildroot.org>; Wed, 14 May 2025 17:13:06 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 17:12:46 +0200
Message-ID: <20250514151255.2316205-12-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514151255.2316205-1-buildroot@bubu1.eu>
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747235587; bh=fAmFgaSQFer8mibB/yqNCh+HI8x8lK+TXmAKGU4h2aw=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=Ov8HJ78ezaENZBad0QnSL1sajGS5xj3F+j9lbFIhgyTUcSLvrFSi3iu1qLlJbsMMR
 oi/RGzymmSa+N1HEWoIyRCRVg98B1h06OaIsI048bc8irXnrLEXwL7VOmKdMx/2pti
 z+NUw7xeKnQHs1oWcZQCgxxoMVBwqJbAm8Fpx7Yl0yKVN22iC/YLudjn7AzBC5hs7T
 g5inpYOXsurfBwzWxr0egJonx1/ZAaWqbaicH5ls16RzHVdPeVRKohSZmXmsmaDnP3
 aoxVp19is1542juFacq+FpGQtqL3TvboxL99eGpfpb0lT+Rqbzthp3DOksfGeSFdNh
 +GFy6PTy+GSQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Ov8HJ78e
Subject: [Buildroot] [PATCH v2 12/12] support/testing: new
 python-pydantic-settings runtime test
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
added in v2
---
 DEVELOPERS                                    |  2 ++
 .../sample_python_pydantic_settings.py        |  8 +++++
 .../package/test_python_pydantic_settings.py  | 35 +++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pydantic_settings.py
 create mode 100644 support/testing/tests/package/test_python_pydantic_settings.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 6138fd1ae6..cc2ecb76a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2282,11 +2282,13 @@ F:	package/python-tzlocal/
 F:	package/python-waitress/
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
+F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
+F:	support/testing/tests/package/sample_python_pydantic_settings.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
diff --git a/support/testing/tests/package/sample_python_pydantic_settings.py b/support/testing/tests/package/sample_python_pydantic_settings.py
new file mode 100644
index 0000000000..c98d1ce9c1
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pydantic_settings.py
@@ -0,0 +1,8 @@
+from pydantic_settings import BaseSettings
+
+
+class Settings(BaseSettings):
+    api_key: str
+
+
+assert Settings().api_key == "ABCD1234"
diff --git a/support/testing/tests/package/test_python_pydantic_settings.py b/support/testing/tests/package/test_python_pydantic_settings.py
new file mode 100644
index 0000000000..608cbbc5b1
--- /dev/null
+++ b/support/testing/tests/package/test_python_pydantic_settings.py
@@ -0,0 +1,35 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3PydanticSettings(TestPythonPackageBase):
+    __test__ = True
+    config = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYDANTIC_SETTINGS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_pydantic_settings.py"]
+    timeout = 30
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="armv7", kernel="builtin", options=["-initrd", cpio_file]
+        )
+        self.emulator.login()
+
+    def run_sample_scripts(self):
+        """Run sample script while setting an environment variable"""
+        for script in self.sample_scripts:
+            cmd = (
+                "api_key=ABCD1234 " + self.interpreter + " " + os.path.basename(script)
+            )
+            self.assertRunOk(cmd, timeout=self.timeout)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
