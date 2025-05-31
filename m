Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B0EC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 14:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B662081E1A;
	Sat, 31 May 2025 14:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HY15sH01V3pm; Sat, 31 May 2025 14:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E58EA81E0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E58EA81E0F;
	Sat, 31 May 2025 14:07:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58A3E127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EB3181E0D
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llR7mhKElKks for <buildroot@buildroot.org>;
 Sat, 31 May 2025 14:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA77B81DFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA77B81DFF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA77B81DFF
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:07:30 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 80FEFB0055E;
 Sat, 31 May 2025 16:07:26 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 31 May 2025 16:07:21 +0200
Message-ID: <20250531140721.515340-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748700447;
 bh=TdWQH1jurnWinY6/4LsoybCUvwp8jrSgwkDpifdyaDE=;
 h=From:To:Cc:Subject:Date:From;
 b=jjSO2JkYppcMkKppJaa6bKV8Y9tSMXyyHo7HkkCneWDpFWdZnkDZJfzf4nvR5oC5e
 ECYOMn24eJoAUNY3y6KVOI5MihOwPcBxV8xBNrHBPgg4T/CgLOIQv78cDXa8yFsCEl
 DO6cbDir2IVCSqgS9ywianRpd1NkAVBqEujPodpjpOcwrWtBrr4Ar7JrNiLzALmqT1
 0v6cG5w4xf0ICEW2U3RQ6v30YvQOnMH4eXCvXzRrEqqnNMlbZuH8Yxrn96DJE3L2gH
 ptL+LEfJTN0plRBcAEu5tXBXefERSH/t7TfP5PYQfV8A277IcFgVajSGv/7Yh6fLpb
 HE5iSGI1bGgKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jjSO2JkY
Subject: [Buildroot] [PATCH 1/1] support/testing: add tree runtime test
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

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/10209445587
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_tree.py | 54 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 support/testing/tests/package/test_tree.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d471b9ab6f..a7bb3bd834 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2031,6 +2031,7 @@ F:	support/testing/tests/package/test_tesseract_ocr.py
 F:	support/testing/tests/package/test_thttpd.py
 F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
+F:	support/testing/tests/package/test_tree.py
 F:	support/testing/tests/package/test_unbound.py
 F:	support/testing/tests/package/test_unbound/
 F:	support/testing/tests/package/test_usbip.py
diff --git a/support/testing/tests/package/test_tree.py b/support/testing/tests/package/test_tree.py
new file mode 100644
index 0000000000..3865932642
--- /dev/null
+++ b/support/testing/tests/package/test_tree.py
@@ -0,0 +1,54 @@
+import json
+import os
+import xml.etree.ElementTree as ET
+
+import infra.basetest
+
+
+class TestTree(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_TREE=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.assertRunOk("tree --version")
+
+        # Simple invocations on a path.
+        self.assertRunOk("tree /usr")
+        self.assertRunOk("tree -d /usr")
+        self.assertRunOk("tree -dx /")
+
+        # Check we see the /usr/bin/tree file in the output.
+        out, ret = self.emulator.run("tree -f /usr")
+        self.assertEqual(ret, 0)
+        self.assertIn("/usr/bin/tree", "\n".join(out))
+
+        # Check we can parse the JSON output and the summary report.
+        out, ret = self.emulator.run("tree -J /usr")
+        self.assertEqual(ret, 0)
+        json_str = "\n".join(out)
+        json_data = json.loads(json_str)
+        # Report is the last element.
+        json_report = json_data[-1]
+        self.assertEqual(json_report["type"], "report")
+        self.assertGreater(json_report["directories"], 0)
+        self.assertGreater(json_report["files"], 0)
+
+        # Check we can parse the XML output and the summary report.
+        out, ret = self.emulator.run("tree -X /usr")
+        self.assertEqual(ret, 0)
+        xml_str = "\n".join(out)
+        xml_root = ET.fromstring(xml_str)
+        self.assertEqual(xml_root.tag, "tree")
+        xml_report = xml_root.find("report")
+        self.assertGreater(int(xml_report.find("directories").text), 0)
+        self.assertGreater(int(xml_report.find("files").text), 0)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
