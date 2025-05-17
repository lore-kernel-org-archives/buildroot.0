Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F89C3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 12:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F21B040D2A;
	Sat, 17 May 2025 12:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbnsOQ7dNv-A; Sat, 17 May 2025 12:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB15D40D57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB15D40D57;
	Sat, 17 May 2025 12:14:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BDEB223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 12:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0145340821
 for <buildroot@buildroot.org>; Sat, 17 May 2025 12:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwEBdZlyPzKC for <buildroot@buildroot.org>;
 Sat, 17 May 2025 12:14:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 490A840C8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 490A840C8E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 490A840C8E
 for <buildroot@buildroot.org>; Sat, 17 May 2025 12:14:14 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C2CCC2C845F4;
 Sat, 17 May 2025 14:14:11 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Date: Sat, 17 May 2025 14:14:08 +0200
Message-ID: <20250517121410.347705-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250517121410.347705-1-buildroot@bubu1.eu>
References: <20250517121410.347705-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747484051; bh=ZW2ExKFbbyzdRsGEJkZQSEmmMSmqi9nzGJBFIRMuWds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MU+GPNbqj+Nm3RgK1j9X43NzrepyNNBTmOsZ+z9dYRyMqcLkbOhadO1uTVAoDGsQk
 37sW4R1lVdzhqPrvQ5UpX7kWeUB5uhN/HrWmOLV7KzwW+UgyEOP4ZkQWyUjrRufLn3
 ec4TSbMpx4lIl3vmAgzeEax2sc4VIonjzSDouHntdTxtXhYmzshQjCpmP03NPlLNr/
 W7Smn9WazwjKfjevk4Uxl4laRJAzrMKVT7H1W/d6mKseLiKGs7Yyx+S1hJJBGEeRGj
 6shJJ2WjK+WLvwWl5its0+YJXVoxReeTEv37hTRUjCtLAzRqJ5IkqfFzYUHbdVtGHC
 pixQsf75GEk2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=MU+GPNbq
Subject: [Buildroot] [PATCH 2/2] package/apscheduler: new runtime test
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
 .../tests/package/sample_python_apscheduler.py    | 15 +++++++++++++++
 .../tests/package/test_python_apscheduler.py      | 12 ++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_apscheduler.py
 create mode 100644 support/testing/tests/package/test_python_apscheduler.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 454fea0f66..d16ea6148e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2284,12 +2284,14 @@ F:	package/python-ruamel-yaml-clib/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-waitress/
+F:	support/testing/tests/package/test_python_apscheduler.py
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
 F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
+F:	support/testing/tests/package/sample_python_apscheduler.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
 F:	support/testing/tests/package/sample_python_pydantic_settings.py
diff --git a/support/testing/tests/package/sample_python_apscheduler.py b/support/testing/tests/package/sample_python_apscheduler.py
new file mode 100644
index 0000000000..befe424c28
--- /dev/null
+++ b/support/testing/tests/package/sample_python_apscheduler.py
@@ -0,0 +1,15 @@
+from queue import Queue
+from apscheduler.schedulers.background import BackgroundScheduler
+
+queue = Queue()
+
+
+def work():
+    queue.put("Ping!")
+
+
+scheduler = BackgroundScheduler()
+scheduler.add_job(work, "interval", seconds=1)
+scheduler.start()
+result = queue.get(timeout=3)
+assert result == "Ping!"
diff --git a/support/testing/tests/package/test_python_apscheduler.py b/support/testing/tests/package/test_python_apscheduler.py
new file mode 100644
index 0000000000..19eb8c9b41
--- /dev/null
+++ b/support/testing/tests/package/test_python_apscheduler.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Apscheduler(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_APSCHEDULER=y
+        """
+    sample_scripts = ["tests/package/sample_python_apscheduler.py"]
+    timeout = 15
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
