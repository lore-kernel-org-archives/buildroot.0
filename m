Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE82CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4125C6075F;
	Tue, 13 Oct 2026 08:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGzvT-JfIHR8; Tue, 13 Oct 2026 08:06:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 40AF860763
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878776;
	b=Gb0okyKj/pw8IEEg23v5aL3qeNJTh9Am4j/hFQpPQwEd+P4oVsQMVmNx94CA9QDicUIB
	 fqMPNNEgyKQ/zxfq3te1idUUR+cxa96aNu09hX6Zp/JnwwGGffrwptf7mUsEfHwJvfJmu
	 WRHuZuKC1itOMzDd/WSm76q5V81hV/qjpfJGoGafQSyJkYL3AFpdBCqhwYSdLMvU8ScaW
	 11ey65bFRJKA+z3eTdGZWzolyQSQckG+43sTXb+dlJeOVViU3m7BAZCoPesRbN0Gu5JJf
	 hkGa4LZHQI4wPLRTX2T3ku70+alBL7WbqFv9rASAmo9NDpv+A9Zk9pQipjV8+nSndrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878776;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w8v/ixllucRPk+CvaMoxTm2KP/wcaaibunF+hWr0q4o=;
	b=sSmk8S1sffFGzGZiWij6vRSvtFdFhmUZs+6puD2K91QdIwT5z2ms8c5ImzlCsmnowM30
	 Qadi0y2VfR8rRXu41a6jSscF2/Yj5mT+4aiNwge9t2AikaDrDLHFi1SMjkMLZv6vW/h8q
	 /LcXWqXE9K7duX5tZtGz3u519IEs65lg2Vt7NEzdmOFvLSP408BYQWzoczwS2h2//+n3s
	 nzENLfeE3m4SJ8qntdrQqywLiHkC+7aDfHJmhg4lPNDe7I5hffn2EVndtcMcQQyLekf3G
	 x5IwJRU+zRn0Vm92kibtuRmQi8eQips5qTBDnRIaVQjHWigOncvnxOtHqu1+L4z5QSA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878776;
	bh=w8v/ixllucRPk+CvaMoxTm2KP/wcaaibunF+hWr0q4o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NlnK/18CGz7wUxDK69GhCF/7vt1GWz9ItUOGDz+GyMeQBHv/jctXhMoJykrbVCCR1
	 AZsED1pkdDfCufvboVTtEbRMs4dIc+c2/u/gcDyvasA2dDF3MCTfT3/NYyeqk5cr+H
	 ckTrFej4Seqi/a6F1Y+EJOgRcEhcd/dAUiMPQXrQjuBhnhb2UEppoFTtJ8XnsrSkEN
	 lYAO3CNUv5UATDvDNDZWXUI8PrbLW0qzaXJoxHWSZfWrnUTNEqAmAj7ttZy/m99Pi7
	 GLPBVD9dyYf6BB6r93vgBIARmrH6+LBq8VEffvuXMMVj9hnTmTm+JaNSM1ZLZRGba1
	 g61sWbgpwGAjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40AF860763;
	Tue, 13 Oct 2026 08:06:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72CB0788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 707F080C92
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVtmNDM-ERLm for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:06:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A500980C93
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878773;
 b=aQz5ABBrnUXyzH0g2MohAXGKHmbvwovUuxha34PY0B30RexTZQzLMrPzb+bFzFEtPDCq
 S3tvurSyN1w0j7B5CnVTvk96j4dBnqBKHtoRCqApb4tXqmuVFWmtAUdnJMdQJXWRp6Lx2
 VRiRcI0TZ4HI+ljmE/ow767dTW9INRbSufr+EoQrtcNmZKyC07ngvagCmD8AyKbcJjBDB
 7WxXlMfa1I9gx3gKvIEYrQgFFu02ucXUBS3WTRthr7y9zWEI3tHBBQYojEAjBW1o5+VAn
 Jzx7ROHn+DYx9hfysJ8FZuM+C+k3TMeWxos/BKD+kLU4PJvpxJjk0LRUjChsy6WMFEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878773;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wU5sXmeqnLSHGsIFm/VFZZNU22Nm6Okw1EMgKxP66b8=;
 b=QcpCz3shc02Vn62eSnUQFL53rGvGP3K5jaGNld97FGbO19Mpq5j846t+NwRztZv5MShQ
 6ZMgJqjKRVkcWrbKAKvCwbWkivi4DiKLFTmVbrQ6lHsWh6Ft33LjzX3oqqYYwN9qkfwz9
 ZrzIQXA2+Xt6kd8EbQGeCLsfF0t7N4JLbzSaRDRyATvN2FV2ef2pVK0poN8nLEfcicxMG
 QFnyRMajLR0b1VsQBCHJp1CMiTy0lp8d52SASI13dZ15Sf3VoX1jWXNESXmUr9+zlRWdB
 OV1QFAZVmwUCr6pOl7Lh7Dx4LcKnZvKP/fcDCGpNLlqS3BuNLdeszPiKc63qYAwg6ww==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A500980C93
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:06:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1033195466; Tue, 13 Oct 2026 08:04:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:05:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a498c7cbf61089f154e9f53a033e77bb25089340
X-Git-Newrev: 260b6ad8f02f44695a4be6848f24f7557e7c6b84
X-Patchwork-Hint: ignore
Message-Id: <20261013080454.1033195466@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add python-httpx2 runtime
 test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/260b6ad8f02f44695a4be6848f24f7557e7c6b84
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Exercise synchronous and asynchronous HTTP requests with python-httpx2
against a local HTTP server, checking the response status and JSON body.
This covers the httpcore2 socket transports and the AnyIO asyncio backend
used by the asynchronous client.

Bind the server to an ephemeral loopback port so the test does not depend
on external services, and shut it down when the sample finishes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 ++
 .../testing/tests/package/sample_python_httpx2.py  | 37 ++++++++++++++++++++++
 .../testing/tests/package/test_python_httpx2.py    | 12 +++++++
 3 files changed, 51 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d731d5a0ba..349fb1d26a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1562,7 +1562,9 @@ F:	package/superiotool/
 F:	package/tailscale/
 F:	package/uefisettings/
 F:	package/zchunk/
+F:	support/testing/tests/package/sample_python_httpx2.py
 F:	support/testing/tests/package/sample_python_rtoml.py
+F:	support/testing/tests/package/test_python_httpx2.py
 F:	support/testing/tests/package/test_python_rtoml.py
 
 N:	James Knight <james.knight@collins.com>
diff --git a/support/testing/tests/package/sample_python_httpx2.py b/support/testing/tests/package/sample_python_httpx2.py
new file mode 100644
index 0000000000..645ceb97f8
--- /dev/null
+++ b/support/testing/tests/package/sample_python_httpx2.py
@@ -0,0 +1,37 @@
+import asyncio
+from http.server import BaseHTTPRequestHandler, HTTPServer
+from threading import Thread
+
+import httpx2
+
+
+class RequestHandler(BaseHTTPRequestHandler):
+    def do_GET(self):
+        body = b'{"message": "Hello, Buildroot!"}'
+        self.send_response(200)
+        self.send_header("Content-Type", "application/json")
+        self.send_header("Content-Length", str(len(body)))
+        self.end_headers()
+        self.wfile.write(body)
+
+
+async def test_async(url):
+    async with httpx2.AsyncClient(trust_env=False) as client:
+        response = await client.get(url)
+        assert response.status_code == 200
+        assert response.json() == {"message": "Hello, Buildroot!"}
+
+
+with HTTPServer(("127.0.0.1", 0), RequestHandler) as server:
+    thread = Thread(target=server.serve_forever)
+    thread.start()
+    try:
+        url = f"http://127.0.0.1:{server.server_port}/"
+        with httpx2.Client(trust_env=False) as client:
+            response = client.get(url)
+            assert response.status_code == 200
+            assert response.json() == {"message": "Hello, Buildroot!"}
+        asyncio.run(test_async(url))
+    finally:
+        server.shutdown()
+        thread.join()
diff --git a/support/testing/tests/package/test_python_httpx2.py b/support/testing/tests/package/test_python_httpx2.py
new file mode 100644
index 0000000000..d3865ea8f2
--- /dev/null
+++ b/support/testing/tests/package/test_python_httpx2.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Httpx2(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_HTTPX2=y
+        """
+    sample_scripts = ["tests/package/sample_python_httpx2.py"]
+    timeout = 30
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
