Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3481EC48BC4
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 13:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AEBC833CB;
	Fri, 16 Feb 2024 13:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tk9YILgQ_mM3; Fri, 16 Feb 2024 13:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B720983ED9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B720983ED9;
	Fri, 16 Feb 2024 13:18:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 744831BF395
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 13:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60FE74043C
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 13:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NGbZ-7IwoWnj for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 13:18:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E786403E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E786403E7
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E786403E7
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 13:18:18 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9509B2C80CDD
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 14:18:16 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 14:18:13 +0100
Message-Id: <20240216131815.318315-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708089496; bh=H3zyrkWbNctxxcfB1yPG9S8v+cOSs/BSYJtnd1MKclg=;
 h=From:To:Subject:Date;
 b=QvrhqA2uQYLpfY6YS9LFcaEU1PV1ACHwAPhijfmftEY9E/WU5cwxQ2M8Aj89HPOIM
 mft9T19rOho8VNuydVB20/A7rx2dNaotLhBC8hNCTkNSoPLlM/Lxa9EbjMKDqXOiBV
 jAoZLR5wU99GBDGY5Pb3hnJx9qBQ+7nBe6Xx/7OJXCMMTaO1Do+cwDpjuZ7VzyNufR
 jaZxZ1U6duXCizIwrS3kN/Nvh/d/FqdfehBfmlOvXlBcxiDxObhjoF+yTyhHvBdJrO
 K/55V4oVfnbMKrUgadxAJEstumsYWy0a+rk/tS+avfwkoxPwIFt7DXZCxlwspnd5Aa
 Ls7RtUipsaTwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=QvrhqA2u
Subject: [Buildroot] [PATCH 1/2] support/testing: remove hardcoded sleep
 from python-django test
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of waiting for a hardcoded time of 30s we check periodically every
second if the server is already up. If it isn't up after the full timeout
(which is the same as before) expired the test fails.

We need to redirect all output of the background started task to
/dev/null now as it otherwise confuses the emulator.run() exit code
parsing logic (as it gets out of order messages from the emulator).

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../tests/package/test_python_django.py        | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
index e1ca50f6d8..0973467a2a 100644
--- a/support/testing/tests/package/test_python_django.py
+++ b/support/testing/tests/package/test_python_django.py
@@ -1,3 +1,5 @@
+import time
+
 from tests.package.test_python import TestPythonPackageBase
 
 
@@ -16,13 +18,17 @@ class TestPythonDjango(TestPythonPackageBase):
         self.assertIn("Operations to perform:", output[0])
         self.assertEqual(exit_code, 0)
 
-        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver 0.0.0.0:1234 & "
-        # give some time to setup the server
-        cmd += "sleep {}".format(str(30 * self.emulator.timeout_multiplier))
+        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver 0.0.0.0:1234 > /dev/null 2>&1 & "
         self.assertRunOk(cmd, timeout=timeout)
-
-        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
-        self.assertRunOk(cmd)
+        # give some time to setup the server
+        for attempt in range(30 * self.emulator.timeout_multiplier):
+            time.sleep(1)
+            cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
+            _, exit_code = self.emulator.run(cmd)
+            if exit_code == 0:
+                break
+        else:
+            self.assertTrue(False, "Timeout while waiting for django server")
 
 
 class TestPythonPy3Django(TestPythonDjango):
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
