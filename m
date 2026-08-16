Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99273C5DF6D
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 14:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5099540687;
	Sun, 16 Aug 2026 14:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRL-PPnXqP-y; Sun, 16 Aug 2026 14:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 656CD406BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786892381;
	bh=sEhW60FNuUAHiie7KXn5nAUOhLAmNum6nzWOQkTs5w0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NuUUgbzkSovGHyiV0hzs8sQo/H0iCCrIshnThr1CipZoTSvmmDcRpJvOvXOuXU+KX
	 3OrYtKTmYPdoJtIPxk8OA2UySmM06WlXQ/HtptTpLeZ1gYFIn34OzLt/uB13UlVT0h
	 sZxuV3QZtbOXQsCfuXUb2Dvzz0DrmQIxllp0ieg0+SL5umvKMz++1i0m4hv1Zb7/bf
	 WPUmHHgIOTJrGV0VyoAWqrakFn7YWGKHcr85nhr9maK/+N26eX6m4QMezTBGCtkDUr
	 toa90YfJaS9PiHzUZl9TytVs5ia+Uv7e5mnh3sD+EjXno6skYu24MAxuIvbXkneVBl
	 d7iYqv3d9wXwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 656CD406BF;
	Sun, 16 Aug 2026 14:59:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07FFF147
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 14:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E20B940687
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 14:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFWszOSbXkqc for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 14:59:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6F194062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F194062E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6F194062E
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 14:59:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C2CF36012D;
 Sun, 16 Aug 2026 16:59:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 16 Aug 2026 16:59:30 +0200
Message-ID: <20260816145930.3581966-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: quickjs: new runtime test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/15922186716
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_quickjs.py | 52 +++++++++++++++++++
 .../rootfs-overlay/root/mandel.js             | 21 ++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 support/testing/tests/package/test_quickjs.py
 create mode 100644 support/testing/tests/package/test_quickjs/rootfs-overlay/root/mandel.js

diff --git a/DEVELOPERS b/DEVELOPERS
index 98c9ee55d3..cb5348dc6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2028,6 +2028,8 @@ F:	support/testing/tests/package/test_python_pyqt5.py
 F:	support/testing/tests/package/test_python_pyqt5/
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_python_sympy.py
+F:	support/testing/tests/package/test_quickjs.py
+F:	support/testing/tests/package/test_quickjs/
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_rrdtool.py
diff --git a/support/testing/tests/package/test_quickjs.py b/support/testing/tests/package/test_quickjs.py
new file mode 100644
index 0000000000..5d5354ab26
--- /dev/null
+++ b/support/testing/tests/package/test_quickjs.py
@@ -0,0 +1,52 @@
+import os
+
+import infra.basetest
+
+
+class TestQuickJS(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_quickjs/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_QUICKJS=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check can print a message from the command line.
+        msg = "Hello Buildroot!"
+        js_expr = f"console.log(\"{msg}\");"
+        cmd = f"qjs -e '{js_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We check we can exit with a specific code.
+        exit_code = 123
+        js_expr = f"std.exit({exit_code});"
+        cmd = f"qjs --std -e '{js_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, exit_code)
+        self.assertEqual(len(out), 0)
+
+        # We check we can do basic arithmetic.
+        val1 = 1234
+        val2 = 5678
+        js_expr = f"console.log({val1} * {val2});"
+        cmd = f"qjs -e '{js_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_result = val1 * val2
+        self.assertEqual(int(out[0]), expected_result)
+
+        # We check we can run a slightly more complex program and dump
+        # the memory usage.
+        self.assertRunOk("qjs -d --std mandel.js")
diff --git a/support/testing/tests/package/test_quickjs/rootfs-overlay/root/mandel.js b/support/testing/tests/package/test_quickjs/rootfs-overlay/root/mandel.js
new file mode 100644
index 0000000000..4004a26527
--- /dev/null
+++ b/support/testing/tests/package/test_quickjs/rootfs-overlay/root/mandel.js
@@ -0,0 +1,21 @@
+function mandel(file) {
+    points = ",.:-;!/>)|&IH%*Z";
+    for (y = -15; y <= 15; y++) {
+        for (x = 1; x <= 84; x++) {
+            i = 0;
+            r = 0;
+            for (k = 0; k <= 111; k++) {
+                j = (r*r) - (i*i) - 2 + (x/25);
+                i = 2 * r * i + (y/10);
+                if ((j*j + i*i) >= 11) {
+                    break;
+                }
+                r = j;
+            }
+            file.puts(points[k & 0xF]);
+        }
+        file.puts("\n");
+    }
+}
+
+mandel(std.out);
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
