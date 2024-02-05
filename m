Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EEDC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0DCB417A1;
	Mon,  5 Feb 2024 10:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0DCB417A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5DNPe7qZXGnV; Mon,  5 Feb 2024 10:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00A1D4180B;
	Mon,  5 Feb 2024 10:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00A1D4180B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D7BF1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA5444180B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA5444180B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o16q5jZOjkKD for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:34:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0436141802
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0436141802
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4AA186A99; Mon,  5 Feb 2024 10:34:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:34:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 988a2115c2fe65c8a2f5cfa049aa8f4e38c149dc
X-Git-Newrev: 035b4ee8a9ccacfa20c483595acaa65a1af4ad8f
X-Patchwork-Hint: ignore
Message-Id: <20240205103443.E4AA186A99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add tcpdump runtime test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=035b4ee8a9ccacfa20c483595acaa65a1af4ad8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_tcpdump.py | 46 +++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8d280eff47..a03018ab2b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1822,6 +1822,7 @@ F:	support/testing/tests/package/test_strace.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
+F:	support/testing/tests/package/test_tcpdump.py
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_xz.py
diff --git a/support/testing/tests/package/test_tcpdump.py b/support/testing/tests/package/test_tcpdump.py
new file mode 100644
index 0000000000..42bfc96082
--- /dev/null
+++ b/support/testing/tests/package/test_tcpdump.py
@@ -0,0 +1,46 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestTcpdump(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_TCPDUMP=y
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
+        capture_file = "capture.pcap"
+        decode_log = "decode.log"
+
+        # Check the program can execute.
+        self.assertRunOk("tcpdump --version")
+
+        # Run ping in background.
+        cmd = "ping localhost >/dev/null &"
+        self.assertRunOk(cmd)
+
+        time.sleep(1)
+
+        # Capture 3 packets with the message.
+        cmd = f"tcpdump -c 3 -w {capture_file} icmp"
+        self.assertRunOk(cmd)
+
+        # Decode the capture file.
+        cmd = f"tcpdump -r {capture_file} > {decode_log}"
+        self.assertRunOk(cmd)
+
+        # Check we have ICMP echo requests/replies in the
+        # decoded capture.
+        cmd = f"grep -E 'ICMP echo (request|reply)' {decode_log}"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
