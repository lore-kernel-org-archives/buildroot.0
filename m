Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEC3C4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 12:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD2C083C19;
	Mon, 12 Feb 2024 12:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zrD7CGnhVew3; Mon, 12 Feb 2024 12:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F118583C1A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F118583C1A;
	Mon, 12 Feb 2024 12:48:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBFB01BF3D8
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 12:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A934C610DD
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 12:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4n0T-RPsrYty for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 12:48:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAD026105B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAD026105B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAD026105B
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 12:48:02 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 906792C837B0
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 13:48:00 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 13:47:59 +0100
Message-Id: <20240212124759.209203-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707742080; bh=jWRCzsNXhLQ7OryaaPqRNQFzWiqa4i4UR93BS+Dv5F0=;
 h=From:To:Subject:Date;
 b=GxPVFxOSFe0uaZJTpTmwydVkcd+xwWXVdsO6+ah2fEYZiSldph6XIIADeMqFxXu4d
 j09K6695d9ESogYDL1Sq7PJoGZa39vdlSbv9i0hUuTTMjUCb2NdM0HtN3c7GDgqHN4
 x2rsl5TnNWm+yh8Mg2ugg8zg6uktLg6QkdMROlg8gXKKCPJo+8UYpQt5x5ct8ZEyUn
 Mir4PG5i9n1QmVuwmneQnXiGv+oUQ049aZ8A5T/+jMS8sAYkt2/cW9PUsp7sgIKJCU
 he+iDR3V+2uW3M0k7/XY0K85jCeAhNxl4d+t6SJiFXc5YJxLj4PBVW5YkTg1iL9v5b
 H2KGNMLbLZRAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=GxPVFxOS
Subject: [Buildroot] [PATCH] support/testing: add python-asn1crypto runtime
 test
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

---
 .../tests/package/sample_python_asn1crypto.py       | 11 +++++++++++
 .../testing/tests/package/test_python_asn1crypto.py | 13 +++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_asn1crypto.py
 create mode 100644 support/testing/tests/package/test_python_asn1crypto.py

diff --git a/support/testing/tests/package/sample_python_asn1crypto.py b/support/testing/tests/package/sample_python_asn1crypto.py
new file mode 100644
index 0000000000..0b10487572
--- /dev/null
+++ b/support/testing/tests/package/sample_python_asn1crypto.py
@@ -0,0 +1,11 @@
+from asn1crypto import pem, x509
+
+
+with open('/etc/ssl/certs/ISRG_Root_X2.pem', 'rb') as f:
+    der_bytes = f.read()
+    if pem.detect(der_bytes):
+        type_name, headers, der_bytes = pem.unarmor(der_bytes)
+
+cert = x509.Certificate.load(der_bytes)
+
+assert cert.subject.native["common_name"] == "ISRG Root X2"
diff --git a/support/testing/tests/package/test_python_asn1crypto.py b/support/testing/tests/package/test_python_asn1crypto.py
new file mode 100644
index 0000000000..97df3d3ac8
--- /dev/null
+++ b/support/testing/tests/package/test_python_asn1crypto.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Asn1Crypto(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_ASN1CRYPTO=y
+        """
+    sample_scripts = ["tests/package/sample_python_asn1crypto.py"]
+    timeout = 40
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
