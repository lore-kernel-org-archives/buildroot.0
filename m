Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80B7C4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 00:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BDFD40AE2;
	Mon, 12 Feb 2024 00:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fq7E4BEeipAo; Mon, 12 Feb 2024 00:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D55744064A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D55744064A;
	Mon, 12 Feb 2024 00:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 194091BF329
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07058418FD
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlEyQQ1pfp8k for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 00:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4516418FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4516418FC
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4516418FC
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 00:01:32 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 73FF82C83901
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 01:01:29 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 01:00:57 +0100
Message-ID: <20240212000058.3000442-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707696089; bh=y7P6955hEdyQ+er524WHDdI/JRR3cCjDoBxwP5ZwhDw=;
 h=From:To:Subject:Date;
 b=iwHFnIW3CpfZbfMI+K2HTmWSc0VUYsvZnC7bLDE++dF+H4vQkej2Pd+Q5psdfRIrD
 ffNrZbi5xXvVyVdKR2lXKf3Qa4zORdMOcWNJVEkoL0dylj6oO0KdKjxMMrP57IOH7U
 6NI6pt7BOqZW3mdWwU/C9/FBnQFgFV0gZ24nJimHphcjo7lhzhwyeYLJXAoeEK1rLg
 4ayAxDoZ0pT74GXbmtogMeVvbbRVrwHALofaSP7k3iWlLEnZt5Uk6X+sD2Kvno+hhb
 amoLc9cbA11pi9pSYIyP9EA9qy6g+evuiDFWOX0Qfbf6cnWiL0CibLiN6gyVUjuSPI
 K1xbEiOZi6+Wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=iwHFnIW3
Subject: [Buildroot] [PATCH] support/testing: add python-msgpack runtime test
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

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../testing/tests/package/sample_python_msgpack.py   |  5 +++++
 support/testing/tests/package/test_python_msgpack.py | 12 ++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_msgpack.py
 create mode 100644 support/testing/tests/package/test_python_msgpack.py

diff --git a/support/testing/tests/package/sample_python_msgpack.py b/support/testing/tests/package/sample_python_msgpack.py
new file mode 100644
index 0000000000..1940f70821
--- /dev/null
+++ b/support/testing/tests/package/sample_python_msgpack.py
@@ -0,0 +1,5 @@
+import msgpack
+
+packaed = msgpack.packb([1, 2, 3], use_bin_type=True)
+
+assert msgpack.unpackb(packaed, raw=False) == [1, 2, 3]
diff --git a/support/testing/tests/package/test_python_msgpack.py b/support/testing/tests/package/test_python_msgpack.py
new file mode 100644
index 0000000000..e5876e400d
--- /dev/null
+++ b/support/testing/tests/package/test_python_msgpack.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3MsgPack(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MSGPACK=y
+        """
+    sample_scripts = ["tests/package/sample_python_msgpack.py"]
+    timeout = 40
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
