Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBD0E7DEF0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CE1C4043A;
	Mon,  2 Feb 2026 15:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhCFt45IKEUV; Mon,  2 Feb 2026 15:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF32D40401
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770044498;
	bh=SrnPklfmsd0wtqVVU4CVYuW/zVgulHP9FGfYqEH08M8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=akiiIHOGkOwJ+m7300YUb1XOFQQirVncGRwu0KzJovH9uiXfnCED5iq5zOWFUDDV/
	 SRkJ0OrxUzM4Opx9UZaP0d1Z3jA090E6fpYJh3IJ6ohV9xhdWsCN5xPZbXRACGWZSx
	 M9juMNuTZLC5LNBRmaWSTLkidy4ZsbuVNJ2W679HFrQnXGr9rbMmQ8FpfGKoYNqORo
	 burNtW8V7YT0fMyLvUpiAvIzXMhU1oUauLSp/9tKGtdzLf/gWH5XzyS4Q0jptRasOa
	 KFtUgngd/PzvZTZB38yj+mNUbWJKxy/rxb578X6Ljtn71pius8xjOii0gQhjLAsbuk
	 an4SZ0gQd+BHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF32D40401;
	Mon,  2 Feb 2026 15:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACDBA1E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9939260735
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Ze0g8G1fAl3 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58E606072C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58E606072C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58E606072C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:01:33 +0000 (UTC)
Received: from framework-OT (host-109-89-232-55.dynamic.voo.be [109.89.232.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9920C2C80CBA;
 Mon, 02 Feb 2026 16:01:31 +0100 (CET)
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Date: Mon,  2 Feb 2026 16:01:41 +0100
Message-ID: <20260202150143.3996204-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770044491; bh=d48eZ0xbzp3rIz2YkxLCHN0VJ0xzG79So8EluGsthGU=;
 h=From:To:Cc:Subject:Date;
 b=cpHK9lADYOTWmTyQH5Y2oh+Wrq1lmfanh08KC3w9hQxpeDvfs40nNm30nxnZWciPO
 kcXVZfbGkXR0tlylQ2jaI1zEonU+cptxlEklHe2sobE18TpLBysDNnjrKnCTDKs4LI
 4OdD5pdzdJLqeaSWsRUhz+EDAz4yVL5qoF8veumbZtyyaetiD8AnwSN81GetxGtbyu
 VbguOdBkzC1439WzEuV77VkN1gfIrer5sLkefYydBFZZkJotmNkBh/vYfbWrMgzmWO
 f7/A/tzyNuW0NFUEuOqFBO5ouZ4b9Yb5c+0T2n3VsniQbgAUQnmUP0MhDPvvV0oxl2
 UZeRU17mlvhyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=cpHK9lAD
Subject: [Buildroot] [PATCH 1/2] support/testing: python-requests: new
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

Use an armv7 kernel because that comes with networking support.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS                                    |  2 ++
 .../tests/package/sample_python_requests.py   |  4 ++++
 .../tests/package/test_python_requests.py     | 21 +++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_requests.py
 create mode 100644 support/testing/tests/package/test_python_requests.py

diff --git a/DEVELOPERS b/DEVELOPERS
index aff26f8012..6dc83d3a38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2284,6 +2284,7 @@ F:	support/testing/tests/package/test_python_django.py
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
 F:	support/testing/tests/package/test_python_pydantic_settings.py
+F:	support/testing/tests/package/test_python_requests.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
 F:	support/testing/tests/package/test_python_tzlocal.py
@@ -2297,6 +2298,7 @@ F:	support/testing/tests/package/sample_python_django.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
 F:	support/testing/tests/package/sample_python_pydantic_settings.py
+F:	support/testing/tests/package/sample_python_requests.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
 
diff --git a/support/testing/tests/package/sample_python_requests.py b/support/testing/tests/package/sample_python_requests.py
new file mode 100644
index 0000000000..e8d2b64076
--- /dev/null
+++ b/support/testing/tests/package/sample_python_requests.py
@@ -0,0 +1,4 @@
+import requests
+
+r = requests.get("https://buildroot.org")
+assert r.status_code == 200
diff --git a/support/testing/tests/package/test_python_requests.py b/support/testing/tests/package/test_python_requests.py
new file mode 100644
index 0000000000..48f910139b
--- /dev/null
+++ b/support/testing/tests/package/test_python_requests.py
@@ -0,0 +1,21 @@
+import os
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Requests(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_REQUESTS=y
+        """
+    sample_scripts = ["tests/package/sample_python_requests.py"]
+    timeout=15
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
