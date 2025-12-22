Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6D0E6780A
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 17:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 571DB40315;
	Mon, 22 Dec 2025 17:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4DMUMnTfaWG; Mon, 22 Dec 2025 17:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896AD406C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766424402;
	bh=wvY3fxSP35mGzbhtHmo6wf4WaZlPQ1wCpAuGcyEKi1c=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=j/jtPMdxdb6xXK2DVFgMXFhBdz7nW8brad/5HJd/hA++CoAyMm7sQuRw0Qy6PuzPT
	 TJ+kKV/wc/mlc9rt9FKtsrblUm+3w4dr/IX2ctlIViQAdwc+9AsOZILAXLhgn0J6uO
	 po4C76sjOrG0o09j7yw6OIh6lVS7T6z3naAira1Ir2NpLiencnYC8OMGpfmhbJEtoa
	 jeZMR088VflmctyMGwJlacVVYxrWkcuZjg/gtA28Wm0rT35q2p94i50jGKgOxFTLQg
	 3UwV5Ylc87yvfVG5HbBi9+Xj4xlsjh/sP1AjNtjvE5Pilter88Gvr+XVqU4Li7kEeO
	 Ew6NADUBqOvOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 896AD406C2;
	Mon, 22 Dec 2025 17:26:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED2BFBC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 17:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDD7040149
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 17:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrC5lSeFAsO6 for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 17:26:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4456640365
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4456640365
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4456640365
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 17:26:39 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A50772C894CE
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:26:36 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 18:26:37 +0100
Message-ID: <20251222172638.839720-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222172638.839720-1-buildroot@bubu1.eu>
References: <20251222172638.839720-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1766424396; bh=v/vHkh0cM4fsflWz+F8YTkPBSdxuAgFcRmUmqsRzbqA=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=rxGUKAN70L3sJmu3G75uzAx4nUf8hi8bfGMSCbs9yTVI16hEufwnEJa4Eealmcta8
 5w+0sjp0tduLfXnsrpTF2kMQimgCNvNxFuJChjojO46VM0tK7WB1yGM2asEmww2mOh
 fs/LvkjIBK+9CkVYrqDuWxkaq+XDi/QMONo4rWIg6LZezKECrVt9+mFk2YQoH9kwYe
 vtwr5uz/K+t0uoNgxoEYeIWKf+DE8YjMvrqv6y+ZIG7C6imWdHumHgdsQkAdjFDEm1
 JYehoUrgxjf7olHovm3qnCENA3vzIVcLOaSPm1PhAeWI2sPcD4FzFIgOXZcsPKK9YL
 QzoNl4gm/ALhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=rxGUKAN7
Subject: [Buildroot] [PATCH 2/2] support/testing: add libiio python bindings
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
 .../tests/package/sample_libiio_bindings_python.py  |  3 +++
 .../tests/package/test_libiio_bindings_python.py    | 13 +++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 support/testing/tests/package/sample_libiio_bindings_python.py
 create mode 100644 support/testing/tests/package/test_libiio_bindings_python.py

diff --git a/support/testing/tests/package/sample_libiio_bindings_python.py b/support/testing/tests/package/sample_libiio_bindings_python.py
new file mode 100644
index 0000000000..74452192c2
--- /dev/null
+++ b/support/testing/tests/package/sample_libiio_bindings_python.py
@@ -0,0 +1,3 @@
+import iio
+
+assert len(iio.scan_contexts()) == 1
diff --git a/support/testing/tests/package/test_libiio_bindings_python.py b/support/testing/tests/package/test_libiio_bindings_python.py
new file mode 100644
index 0000000000..e8cf5c3d13
--- /dev/null
+++ b/support/testing/tests/package/test_libiio_bindings_python.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestLibiioBindingsPython(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_LIBIIO=y
+        BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON=y
+        """
+    sample_scripts = ["tests/package/sample_libiio_bindings_python.py"]
+    timeout = 10
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
