Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A541CFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 14:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D68F780AB2;
	Mon, 24 Nov 2025 14:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFssHuLzzvND; Mon, 24 Nov 2025 14:05:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B438380746
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B438380746;
	Mon, 24 Nov 2025 14:05:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7688158
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDCE9403B6
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hI2uv8YAoZt7 for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 14:05:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE5E240391
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE5E240391
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE5E240391
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:05:20 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7D9682C893E7;
 Mon, 24 Nov 2025 15:05:17 +0100 (CET)
From: Marcus Hoffmann <buildroot@bubu1.eu>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Date: Mon, 24 Nov 2025 15:05:16 +0100
Message-ID: <20251124140517.2833351-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124140517.2833351-1-buildroot@bubu1.eu>
References: <20251124140517.2833351-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763993117; bh=aaOlKdYQ0m8KpjcqQ7etrW87thNesPAy8KMOnFhrIpE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ju5uwmX7kaOuhhHaSN239eoaFOgTVLhmqp4GgCO8cT7hpMPN81VvySAdCuuYCDJ1z
 oA/MVoReEf2LZgq7l3LID9widhk4OOMgZxN9L5XW4Mj+z9m8awMVuq7dS2hQMywBHu
 uO+U/Bk+fbC6Bfqpz0bDDXzXLdrFFoeSiVgplnni9/1KuGRTKAD7tOTiKitf0bAJpM
 4hDcoZayDRWG3ObEpvfSvsvAqlXKSx2i3QltSSwz8fSRE4m2s858t9gwDoCZJqd13R
 0yKX/NJrpSbGc1kljDA4ey38sV3d8klkqdTJ+U2SftrM+hnq02iSIs9GoPR77IwqEO
 qYPs/hcme0rPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Ju5uwmX7
Subject: [Buildroot] [PATCH 2/2] support/testing: python-varlink: new
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new runtime test for python-varlink. Add this in a subdirectory, so
the separate example interface file (which should be named in reverse
DNS notation) does not sit loosly in the general package test dir.

As always when we need to start a separate server process inside a test
case this gets slightly fiddly.

We override the test_run() function to first start the varlink example server,
then call the packages cli interface to do a varlink call against the
server. The cli defaults to pretty printing the result, which makes it
more annoying to compare to the expected result in the test case, so we
un-prettyprint it with python's builtin json.tool module.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS                                    |  1 +
 .../org.example.test.varlink                  |  5 +++
 .../sample_python_varlink.py                  | 22 +++++++++++++
 .../test_python_varlink.py                    | 31 +++++++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_varlink/org.example.test.varlink
 create mode 100644 support/testing/tests/package/test_python_varlink/sample_python_varlink.py
 create mode 100644 support/testing/tests/package/test_python_varlink/test_python_varlink.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 658023a4f4..695b738d7e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2285,6 +2285,7 @@ F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
 F:	support/testing/tests/package/test_python_tzlocal.py
+F:	support/testing/tests/package/test_python_varlink/
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/test_python_whitenoise.py
 F:	support/testing/tests/package/sample_python_apscheduler.py
diff --git a/support/testing/tests/package/test_python_varlink/org.example.test.varlink b/support/testing/tests/package/test_python_varlink/org.example.test.varlink
new file mode 100644
index 0000000000..c199824e6e
--- /dev/null
+++ b/support/testing/tests/package/test_python_varlink/org.example.test.varlink
@@ -0,0 +1,5 @@
+# Example Varlink service
+interface org.example.test
+
+# Returns the same string
+method Ping(ping: string) -> (pong: string)
diff --git a/support/testing/tests/package/test_python_varlink/sample_python_varlink.py b/support/testing/tests/package/test_python_varlink/sample_python_varlink.py
new file mode 100644
index 0000000000..6cf0378d88
--- /dev/null
+++ b/support/testing/tests/package/test_python_varlink/sample_python_varlink.py
@@ -0,0 +1,22 @@
+import os
+
+import varlink
+
+service = varlink.Service(interface_dir=os.path.dirname(__file__))
+
+
+class ServiceRequestHandler(varlink.RequestHandler):
+    service = service
+
+
+@service.interface("org.example.test")
+class Example:
+    def Ping(self, ping):
+        return {"pong": ping}
+
+def run_server(address):
+    with varlink.ThreadingServer(address, ServiceRequestHandler) as server:
+        print("Listening on", server.server_address)
+        server.serve_forever()
+
+run_server("unix:@test")
diff --git a/support/testing/tests/package/test_python_varlink/test_python_varlink.py b/support/testing/tests/package/test_python_varlink/test_python_varlink.py
new file mode 100644
index 0000000000..0979f22847
--- /dev/null
+++ b/support/testing/tests/package/test_python_varlink/test_python_varlink.py
@@ -0,0 +1,31 @@
+import os
+import time
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Varlink(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_VARLINK=y
+        """
+    sample_scripts = ["tests/package/test_python_varlink/sample_python_varlink.py",
+                      "tests/package/test_python_varlink/org.example.test.varlink"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        # we need to supress any output here as otherwise the commnd output parsing
+        # gets confused for the second command
+        cmd = "%s %s  > /dev/null 2>&1 &" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
+
+        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+
+        varlink_cli_call = "-m varlink.cli call 'unix:@test/org.example.test.Ping' '{\"ping\": \"hello\"}'"
+        unprettyprint = "| python -m json.tool --compact"
+        cmd = "%s %s %s" % (self.interpreter, varlink_cli_call, unprettyprint)
+        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], '{"pong":"hello"}')
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
