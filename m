Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE46C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F91B416F4;
	Wed,  7 Feb 2024 17:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZL2OyA8X7Cu; Wed,  7 Feb 2024 17:15:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 359D4416D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 359D4416D4;
	Wed,  7 Feb 2024 17:15:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99E631BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94856408BD
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdnCErmwsi0y for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:15:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B098F408A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B098F408A7
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B098F408A7
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:15:38 +0000 (UTC)
Received: from bubutux.localdomain (ip-185-104-138-44.ptr.icomera.net
 [185.104.138.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5542F2C83776;
 Wed,  7 Feb 2024 18:15:36 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 18:15:12 +0100
Message-ID: <20240207171513.2673706-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707326136; bh=kHlCmqJhaxFD0j9xmKBEB4Bmhv4SO22aqscvRZxQNhc=;
 h=From:To:Cc:Subject:Date;
 b=Yx3YMNLd3OTmpUASGmxjRnxHlSSufIbmDZ+wvbAdHDVpbB8i1bXhT4mqmLqnFraPS
 EzPih7k3b7WLea4WHW7Zzb1pV8kaXjBJk3K0/IxfOG5frg3Tglpts5y74If6XzfOD7
 jSv8vcoecW04+yWKZISjmbNrM3TLIDUEKwxeTOxUjbLiFlUWLoHoPKII1dNW+G2k3u
 iYIB0t3NLUTca31BWh3DsLorUEtmtSHXGFbRudaLHMsMmXw3RbWtdOzlNzk6T2PjQy
 N6eLQNSOr8YfT+xod8CFz+7FXU/uTb8GF4nnoU+SVihDRJYD+c8HdSfHoOfwIg03/K
 KtiAc00Pv4J4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Yx3YMNLd
Subject: [Buildroot] [PATCH] support/testing: remove hardcoded sleep from
 python-flask test
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
Cc: Lionel Flandrin <lionel@svkt.org>, Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Similar to the new fastapi test, instead of waiting for a hard coded
amount of time we can retry every second until the server is available
and abort if after the timeout we still didn't manage to connect.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 support/testing/tests/package/test_python_flask.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/package/test_python_flask.py b/support/testing/tests/package/test_python_flask.py
index 9d8587e918..32d9da34a5 100644
--- a/support/testing/tests/package/test_python_flask.py
+++ b/support/testing/tests/package/test_python_flask.py
@@ -21,9 +21,13 @@ class TestPythonPy3Flask(TestPythonPackageBase):
         _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
 
         # Give enough time for the flask server to start up
-        time.sleep(30)
+        for attempt in range(30):
+            time.sleep(1)
 
-        cmd = "wget -q -O - http://127.0.0.1:5000/"
-        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(output[0], "Hello, World!")
+            cmd = "wget -q -O - http://127.0.0.1:5000/"
+            output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+            if exit_code == 0:
+                self.assertEqual(output[0], 'Hello, World!')
+                break
+        else:
+            self.assertTrue(False, "Timeout while waiting for flask server")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
