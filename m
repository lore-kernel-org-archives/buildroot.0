Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFC6CA9EBD
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 02:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C976405ED;
	Mon, 12 Oct 2026 02:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VENnYdbfJTmD; Mon, 12 Oct 2026 02:05:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5A00C405F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791770744;
	b=jEkL4WQ27qWfx93UbNSyX4XjWiU7GdXpLTOvFVXYj4apIsxL6PJhXEMkKYv7EoAt8ClS
	 YgJx+j2IcSDlYLgREu/UpIiuJXjWDQI9sm7CyLQrs5F4dlqwm7/pYHvAf4ePczOHJ9v3X
	 dbzE/rT5ZQPuxnmIkFMFI/49dDGLVpk63UDPswIRmRI8yP6dTtKNASCJ2NEKROsRDDo+o
	 xhheAETyDyOmFiNAMmtgC5LUGpt8mDdivn0hSorrkju9MNEVMb0uGbj4/AvtX3XJwVKRG
	 K6VrIztrfagZO/8AuIucyQRASkDAr4QS/ixH9ugT+RiocfomkQMKmWPzdoEjpnO6jtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791770744;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pHKj7EpcryGPe+VvjRlzf/4+i7I2+YEIpIbyZZo+5Cc=;
	b=fs+Nhkowiug6u4Ibz6WJdSuePrn+Oi6Qj8MtGmIcsCKdNOxmMLTS0iT7vG2LhasxZ8TX
	 KMpwqdAMOMzlhoHbSv5aC7Eua6Yw/K3eCHCaqiJxpKtlYIkWF1OZ/UGu6HOIqL1OEHjIT
	 kSALPZUAikmi8RIsAOhOPFYRUZoYq5S6Tt45iKsfML1WW+/rEiRudMu2aCn3KncPp39gY
	 tO2qbuQBhR60yDgK4S9Pkk17FILXvkUUHqCAIc0J0NNE+RI7PGfx32BS+xfqpvMcLJL8a
	 9kwMgY38wnPPj/EPzKEAQp8BImgBhZBcphJMGLOjoKWGGhF669ezVOxJqSCE4JABkuQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791770744;
	bh=pHKj7EpcryGPe+VvjRlzf/4+i7I2+YEIpIbyZZo+5Cc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P4MZoL2+U/r6QAEQc4GsbcnPSkUs9m4V+4kivR0YEvqF4IwWFrDu+avJYALJgPt/g
	 Wvsewj8G1qk5VRaBN+7JobfEAvU7Wm+EUg9XHDljf5cyImfewT9za1q3YzqZ+ctr+M
	 028EM487icqokTfmNC68EKPe/9dzy3g0CCftkgF69eMHEHycyeCPnigGsnT38oNNh6
	 OSHPRVWAvlJjxi11RQOw2lgtEqmbI5oKUjHavlabABVwVyzGp+eOHQU4WpAwpuUE6e
	 bHQ9Fx7oWyBJSRRR/p142sgEXbT2qsEZoV8quB3IwpQq6+k14OEpsUP2WatEFmTXco
	 gAxNYVndNeVyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A00C405F8;
	Mon, 12 Oct 2026 02:05:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3950B1A6
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 02:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A3EB80CA4
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 02:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0u614D6-tps for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 02:05:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2F8D180C9C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791770742;
 b=PxU1kj3iZCsn8xSxVVdbMqgpx1sXvDA2Ar55DyR25yoc8hiGneY48hqgWL1d1bs04QII
 /10nE6cnVm5ZU45InkACaQJPdzWaqk0HvrPECizahP7dlhVmBaMDYugNTMDlD1kSAT9lD
 ArOjGncMjNqehdI+8UlOBZcV1clQieoVR8s20hHTszCkLQOqyuzUTfWjz4x4n+B7vvlhP
 I1h0ZJl/FyR5Q9PmeajUg9O5vJp5KYX44h8uZXWD+VRgOo6AkFLcRUhxg5KnlU8Y6qdPJ
 9mqxPeTt82pb4r0d3iKZ7/obvLW3xugxNgKOOjK1i80eb3Kid7uaIhym6OyBxVJtodQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791770742;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+uF+sYP8n/vnLKFEjiX/pmActkBbtrJW8Vp1sPCf878=;
 b=AisllMpTIv1O4qU+W5BR7bfKArgHnjskJGi+zR/m5Mwk11enGMwXQPHob82Ww3Z4GGIy
 PmwbU/nna+CCX1IPiXqe/fp8gLC+VmaqhlDSZGfpiNNexbnxkgwytnjbHjUgsd//Uu/r7
 9OC/wLRYdy+/9Z7WGerR7ysrmr/EE6SE5+bRgxroIzZ4RZZfLqQqkLz7WyjQvG3DnQWdK
 urwjD/n/bN0jUX78zfW7NgzUZiK6ykd6Pl8PSm3Cq+XzzMYaWlghTnEaz8lR23P7MG7BX
 USeTwrqpGUSoDTkc+cYtiFL/uacLIpIQMlUDMU6smFMEHyGQ26zcdtO0oE9PpXkTBYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aRrgitCe; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aRrgitCe
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F8D180C9C
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 02:05:41 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-8266c388b67so1373035a34.0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791770741; x=1792375541; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+uF+sYP8n/vnLKFEjiX/pmActkBbtrJW8Vp1sPCf878=;
 b=aRrgitCeXVXZeAQRt1Snoiv9VIMFKzrceMxz2fQ6qRPtCaPNFv7inZNe285p2H5dZF
 keKnM989UwGZgDfVOnscAXt6AN61LTcDDHGADjhRppEKx4XS0UKJDlhoSnFcR4idPbt4
 LfsSohBuU0sDOGuPH4gCUpOoOiseLbqGerywGnucXGWCVlaIPlO4Zq7KzEenWsNazQEe
 M35Zy0e5MbeKcSEh1BUarAi1yPFYRsIWx6fqR/YvB8f+FvvsItH/fD5crX2ErHDZ10m4
 Q1kn2M5xNSbaW9UKE0+tFf6Wn/85qtaZnpbBBZccWOHWB72U7a2QeiPHyZ7gDtUqCqF0
 mWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791770741; x=1792375541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+uF+sYP8n/vnLKFEjiX/pmActkBbtrJW8Vp1sPCf878=;
 b=uDWPcHc2cwKAyyLSYU6UHEISm32RiHXhcrZ0Ja1pJ4DhJMfQjobzICUPGFOie4OAxY
 ITICjFLRgpoZmn60QZyhJ3NCyPOq2Apzz/b7loACaV3l8jrKmDDox8/GKvr+5dGbeuTU
 0TsdFZmjFWcHwhon9oq1k+TS1xwWKGys2MEAgFk94HnvryeKnKAZHJKrfsP1elZE51Ao
 c/yE7ulIwtxqJJ4zoydjOZTWY2/Jkk8RlTtCYFSkpKm5iAoKldwdRdv4xMD2QS+BZibq
 R09U20MPi4c6l9RsynLSvu/SgTjeOu/EV9pTY1+Xuf7lnYWv5hGHsbvviL8c0C0qtY7y
 4YLg==
X-Gm-Message-State: AFq9FYJzgRfMH5joBA3kqWybItq5jsCJ5Q0NFw6uGW6UHrFFZSnBfk90
 85hMF2UnKB8PdJEYQ44KXL/VsLOA6o1zTU3ir+zrKB7v/UO5WYBWm+ue8QxyLA==
X-Gm-Gg: AYBFou3vj/R1h6WZBGZtw6J+33TQb3pUc1SrcH43uQg9ZFUoZYb6G3DiG6gB5BTGmpn
 vFeaKgmU+v/mR/CH5E6nyddXY7SOVxMq2cjLFAGhiQozCN8L6WPKVcuu3C4f2vIQ+Llw9+1L2v0
 7OznC8WGkLGWSMIYIsA/pV7GPHyOXkQiHgCmWKeVAlMEqrs2P6tsE/5FWGCBMioqeCZY/xIaqlA
 LSSpvvlBtegs6mOhzy1m/Y8JFqvDBmZj9fV3yBLiPuCfdfwFM7yhR/+JDAm/B3rmKJtYWeCdBe9
 TCl2933HopH6W183BiddkzWjGmkTu8fZX/hsmEUPv5Ib+sKZICMkvdpA1Qg12xOEBTmlEh+me9B
 EdSL/mRn6bm1MWDTbVh0q8qkSs8Khqk5uwKp9FUQsNaNri52nkO9TAA3kztZc8sW6X7Q1C9s6ZF
 PdDYERNvdpT1sr0766R3nrHsD2PB7M4UdQIpkmrSfv8wl6E/ObaJNqqz/aHLLBi2YIP0Xzk3C5y
 j6cYfuQ5/pqtTBfYTlnz0cdJq3IxKmCkVVJyU4rZFG6D2gvPME4Zp7ciDZ1B9+PCG1lSvPunznm
 W9lpdAFXdy21jsrTkBTETpCs0c56L1YBtzc/pmJty2xwk7xy91SlygjJTDx+/aMia7lCvLV4UTF
 +EjWDTaMNtPLIV2BMKzxAuYQmp/lziv8JNC26CNAjEY0=
X-Received: by 2002:a05:6830:4423:b0:81c:e293:7d66 with SMTP id
 46e09a7af769-830971a487emr8287302a34.21.1791770740674; 
 Sun, 11 Oct 2026 19:05:40 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-83039a3e016sm8475929a34.17.2026.10.11.19.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 19:05:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 11 Oct 2026 20:05:36 -0600
Message-ID: <20261012020536.562497-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: add python-httpx2 runtime
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Exercise synchronous and asynchronous HTTP requests with python-httpx2
against a local HTTP server, checking the response status and JSON body.
This covers the httpcore2 socket transports and the AnyIO asyncio backend
used by the asynchronous client.

Bind the server to an ephemeral loopback port so the test does not depend
on external services, and shut it down when the sample finishes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../tests/package/sample_python_httpx2.py     | 37 +++++++++++++++++++
 .../tests/package/test_python_httpx2.py       | 12 ++++++
 2 files changed, 49 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_httpx2.py
 create mode 100644 support/testing/tests/package/test_python_httpx2.py

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
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
