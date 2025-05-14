Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E70DC3ABCC
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 15:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 437B04154B;
	Wed, 14 May 2025 15:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LryJI2II8U4a; Wed, 14 May 2025 15:13:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B8F741542
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B8F741542;
	Wed, 14 May 2025 15:13:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BA1D153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D907382F98
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyA-ucOnngwU for <buildroot@buildroot.org>;
 Wed, 14 May 2025 15:13:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08BAE83716
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08BAE83716
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08BAE83716
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:07 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 166672C80169
 for <buildroot@buildroot.org>; Wed, 14 May 2025 17:13:06 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 17:12:45 +0200
Message-ID: <20250514151255.2316205-11-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514151255.2316205-1-buildroot@bubu1.eu>
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747235586; bh=UkX8L/hAr86aBoV6ERJJLBscInk+z960xV+UAQYBrXI=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=hudJoZibJGOI889WQvv3n6ACZHoLXKDXYKvFOAybi9OMRufbv45S+ovLeAOoEYwSi
 Yj1W7eG8wnZuiNK5HTw8tWePVAjYqd870Tn3KRt27xlGR4ymrNXeWdYQExmpFwCQW9
 k9dB1cPTpcJOn5Mj2m/vuVlD+bdoySvDp59dG2TouBqsvp+PZWMLY7nzrAjqDitq/C
 oCKuF4ZU2MS6DW2AzJ25TIY2yWkLYjThRhaxUVpPbgQQ6EfL7m7A05ZDX/z9zZMImH
 0vHlco/cNVrc/UgJ8jqmU14c9HQygKPxYSmgPtBrkkWwYS1AdBnCSBNd8lSBmMrvi1
 fLVnRfXjGTPvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=hudJoZib
Subject: [Buildroot] [PATCH v2 11/12] support/testing: new python-pydantic
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

While in theory, the fastapi tests finds problems with the pydantic
package, it's not obvious that this test should be run when the pydantic
package is updated.

Add a new test that just covers pydantic.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
added in v2
---
 DEVELOPERS                                    |  2 ++
 .../tests/package/sample_python_pydantic.py   | 32 +++++++++++++++++++
 .../tests/package/test_python_pydantic.py     | 27 ++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pydantic.py
 create mode 100644 support/testing/tests/package/test_python_pydantic.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 86a03fb74d..6138fd1ae6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2281,10 +2281,12 @@ F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-waitress/
 F:	support/testing/tests/package/test_python_fastapi.py
+F:	support/testing/tests/package/test_python_pydantic.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/sample_python_fastapi.py
+F:	support/testing/tests/package/sample_python_pydantic.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
diff --git a/support/testing/tests/package/sample_python_pydantic.py b/support/testing/tests/package/sample_python_pydantic.py
new file mode 100644
index 0000000000..4c22f5ede4
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pydantic.py
@@ -0,0 +1,32 @@
+from datetime import datetime
+
+from pydantic import BaseModel, PositiveInt
+
+
+class User(BaseModel):
+    id: int
+    name: str = "John Doe"
+    signup_ts: datetime | None
+    tastes: dict[str, PositiveInt]
+
+
+external_data = {
+    "id": 123,
+    "signup_ts": "2019-06-01 12:22",
+    "tastes": {
+        "wine": 9,
+        b"cheese": 7,
+        "cabbage": "1",
+    },
+}
+
+user = User(**external_data)
+expected_user_dump = {
+    "id": 123,
+    "name": "John Doe",
+    "signup_ts": datetime(2019, 6, 1, 12, 22),
+    "tastes": {"wine": 9, "cheese": 7, "cabbage": 1},
+}
+
+assert user.id == 123
+assert user.model_dump() == expected_user_dump
diff --git a/support/testing/tests/package/test_python_pydantic.py b/support/testing/tests/package/test_python_pydantic.py
new file mode 100644
index 0000000000..1369d82f59
--- /dev/null
+++ b/support/testing/tests/package/test_python_pydantic.py
@@ -0,0 +1,27 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Pydantic(TestPythonPackageBase):
+    __test__ = True
+    config = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYDANTIC=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_pydantic.py"]
+    timeout = 30
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="armv7", kernel="builtin", options=["-initrd", cpio_file]
+        )
+        self.emulator.login()
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
