Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEB9C3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 21:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB33260904;
	Sat, 10 Aug 2024 21:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLmlB4lAyG36; Sat, 10 Aug 2024 21:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2723A60748
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2723A60748;
	Sat, 10 Aug 2024 21:56:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 118E81BF2C4
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 21:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64DE2606B9
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 21:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_5H6-TMeYdp for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 21:56:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 443026072C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 443026072C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 443026072C
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 21:56:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 980E6FF802;
 Sat, 10 Aug 2024 21:56:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 23:56:20 +0200
Message-ID: <20240810215624.482529-7-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240810215624.482529-1-thomas.petazzoni@bootlin.com>
References: <20240810215624.482529-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723326994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3H+LpDmObG0EWQG3C9JjBymTDBBmg2XtBl7Jn98Yqw=;
 b=T0w9UaRJISHFSqcTCxjsIe0up0Rmsr0tcX0abOMhpqqlNro6CCwL4qeezLaRkY5YkzFa9s
 7Ig7NeDLTgERNuvMIuAgp4WQQnN9iYfVLxDdksKDvObXvi4AYWFd9Hcgjkq05kkzM4kaPK
 bNDuICCttfDXhOp05ITcXZm19VXbJat+togE2yu2DgYlBCI5duycCKiQPXHImDtb8YU2T+
 A/knf4O5xpQYmEHU8X3dl6asKtG6bU3dwS6NRvWNSG+gsHS55k+aH9iO06u9b+mvCOGQCU
 G8a9l0YfdV+jQk2sLZSSpDUVNtR7Vx1i7eCo7VpbOdy0eYa65cM0gpEMDTfBeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T0w9UaRJ
Subject: [Buildroot] [PATCH next 6/7]
 support/testing/tests/toolchain/test_external_arm.py: new test
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

Test the 3 ARM toolchains: ARM, AArch64 and AArch64 BE.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  1 +
 .../tests/toolchain/test_external_arm.py      | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 support/testing/tests/toolchain/test_external_arm.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..bf98a7642b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3190,6 +3190,7 @@ F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
+F:	support/testing/tests/toolchain/test_external_arm.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
diff --git a/support/testing/tests/toolchain/test_external_arm.py b/support/testing/tests/toolchain/test_external_arm.py
new file mode 100644
index 0000000000..1f8e5b4e56
--- /dev/null
+++ b/support/testing/tests/toolchain/test_external_arm.py
@@ -0,0 +1,41 @@
+from tests.toolchain.test_external import TestExternalToolchain
+
+
+class TestExternalToolchainArmArm(TestExternalToolchain):
+    config = """
+        BR2_arm=y
+        BR2_cortex_a8=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_ARM_ARM=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arm-none-linux-gnueabihf"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainArmAarch64(TestExternalToolchain):
+    config = """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "aarch64-none-linux-gnu"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainArmAarch64Be(TestExternalToolchain):
+    config = """
+        BR2_aarch64_be=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "aarch64_be-none-linux-gnu"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
