Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D59C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 21:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6581B6075E;
	Sat, 10 Aug 2024 21:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuTCoPXUxmFY; Sat, 10 Aug 2024 21:57:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37F2261317
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F2261317;
	Sat, 10 Aug 2024 21:57:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10A2A1BF2C4
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 21:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB4E160748
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 21:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqYDoKBrSUT3 for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 21:56:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FDE760737
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FDE760737
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FDE760737
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 21:56:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4672EFF804;
 Sat, 10 Aug 2024 21:56:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 23:56:21 +0200
Message-ID: <20240810215624.482529-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240810215624.482529-1-thomas.petazzoni@bootlin.com>
References: <20240810215624.482529-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723326995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DxGQNd2SEiYNyyRM99Gw2uIwPJYdkLMdiZKGB0GYLAI=;
 b=BA16wwtTPi7L5QpTtzIG2ljg3pyufzQdGzs3bL5m45mvp2iQrD6BJiel5hBF7tqisSkXL6
 cFNhpm+hSqZjurleXvTthjchwcP3NVjJzst7SXYCKkH6loRMzl4LxTavboV/Y93Qjvvn5/
 oO6+xwkSBeishaHMDPZgmBof9mQSUJwUXkTIV2eWUe/SPxm6SbcCzckJO25zJrJ9JpMovM
 pjpN0hfEdHsGLz0ePWXrmMGJx8e8u7llkjMDColJA030HjwO9K5G8qMaHPH2de+bWz1Eua
 2Pz675yztX2hR0zM+5HVCy0spCv8OEGewo8dyT+oXgP61UwBd8i+kIzmWcyi8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BA16wwtT
Subject: [Buildroot] [PATCH next 7/7]
 support/testing/tests/toolchain/test_external_synopsys.py: new test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Test the 6 combinations of Synopsys toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  1 +
 .../tests/toolchain/test_external_synopsys.py | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 support/testing/tests/toolchain/test_external_synopsys.py

diff --git a/DEVELOPERS b/DEVELOPERS
index bf98a7642b..92e13c69bc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3191,6 +3191,7 @@ F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 F:	support/testing/tests/toolchain/test_external_arm.py
+F:	support/testing/tests/toolchain/test_external_synopsys.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
diff --git a/support/testing/tests/toolchain/test_external_synopsys.py b/support/testing/tests/toolchain/test_external_synopsys.py
new file mode 100644
index 0000000000..19ed9f67b0
--- /dev/null
+++ b/support/testing/tests/toolchain/test_external_synopsys.py
@@ -0,0 +1,91 @@
+from tests.toolchain.test_external import TestExternalToolchain
+
+
+class TestExternalToolchainSynopsysArc700LE(TestExternalToolchain):
+    config = """
+        BR2_arcle=y
+        BR2_arc770d=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainSynopsysArc700BE(TestExternalToolchain):
+    config = """
+        BR2_arceb=y
+        BR2_arc770d=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arceb-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainSynopsysArcHSGlibcLE(TestExternalToolchain):
+    config = """
+        BR2_arcle=y
+        BR2_archs38_full=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainSynopsysArcHSGlibcBE(TestExternalToolchain):
+    config = """
+        BR2_arceb=y
+        BR2_archs38_full=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arceb-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainSynopsysArcHSuClibcLE(TestExternalToolchain):
+    config = """
+        BR2_arcle=y
+        BR2_archs38_full=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainSynopsysArcHSuClibcBE(TestExternalToolchain):
+    config = """
+        BR2_arceb=y
+        BR2_archs38_full=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arceb-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
