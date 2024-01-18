Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FE1C47DAF
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 21:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E053614A7;
	Thu, 18 Jan 2024 21:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E053614A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVspASTM7x42; Thu, 18 Jan 2024 21:49:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9016160EA6;
	Thu, 18 Jan 2024 21:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9016160EA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B27DA1BF37B
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 21:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8481860EA6
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 21:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8481860EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZOVUUMamIN4 for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 21:49:49 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F51360E7E
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 21:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F51360E7E
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2C86213F88F;
 Thu, 18 Jan 2024 22:49:44 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 18 Jan 2024 22:49:38 +0100
Message-ID: <20240118214938.160908-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705614585;
 bh=6ZA43xcvSHhkBA8BI/yw4axCwF22OuHgHN5ZIZnipbw=;
 h=From:To:Cc:Subject:Date:From;
 b=euOrtBgZPcMODop362pIOFf4ceIRGSdsFLnZT6tDPXe5KdcuS7QNVKVHrNwInflp7
 +Flfg3O7ReLXxB97H0T6WDpbPzBcf+cDZjoZbzvfxOojXBcyJYlsoIaGZInkkW1ki0
 e5gPcPAIQDjyDg8f5ol8Hip04cVaTynRAofLppYVrk/6NZ2zrB4l2rFTs2Q/022jzd
 Wmvc6DoJnAZ+/zWfDbjAoKjkb8C46e+n5ogJ9rqqm4spw4+ikJdNo3PR/QERnNCCmJ
 kuLrjrg1rALAtkYkt2sBy0P5ETXocxMTc2rvX7YLRjbHa9L+lL/x4k6AVymbiFXqVy
 dzJ/irpw5SNMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=euOrtBgZ
Subject: [Buildroot] [PATCH 1/1] support/testing: add tcpdump runtime test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit b200632 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_tcpdump
    ...
    OK
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_tcpdump.py | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 support/testing/tests/package/test_tcpdump.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f5b04937b6..2221724e9b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1814,6 +1814,7 @@ F:	support/testing/tests/package/test_screen.py
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
