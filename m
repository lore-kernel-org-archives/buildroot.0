Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6063C54E67
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D57605AD;
	Sat, 23 Mar 2024 20:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uT2epBbOlhRX; Sat, 23 Mar 2024 20:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93E28606EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93E28606EB;
	Sat, 23 Mar 2024 20:35:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F17071BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBA3340109
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dHzXOaEybTpr for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:35:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1253400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1253400B8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1253400B8
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:35:24 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A04F1B00535;
 Sat, 23 Mar 2024 21:35:20 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 21:35:16 +0100
Message-ID: <20240323203516.19205-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711226121;
 bh=HrMX3ydN5IRfuY2JRswM/cm6mB6lyuDdrx7u4cO/m/c=;
 h=From:To:Cc:Subject:Date:From;
 b=pDL91oU4JsqhvhmreBBDXQQrwGAkEwbwWgO7oTwRzQ+zlTbpNRHsPVpHc/HgJI6iB
 oWJZRfBEqe74ljUYi2unVZrf9CYF5RUc3zpYeUA23m9rTv3r6I5VWQ4tMRH2hgr5+k
 IEcLtZ2zA8B2TJHGw6UzxaAp1+q+YSTujO4dsUs6cI/b/A7Xsce4qR1Sw7toj4neOK
 +JkJOeJlmPvUB5mFNi9/SaTbR3+H+8fH7OUS/C4MaxIRK7dFC08VFjXw1Jhp69PA03
 uUSWVT/yFt6HardGCUBDEAXSCGm13t8eHtWbQaB2ywTAzfsVn/c7WvBNhiGGmrnrYm
 58nCtbMQqSAGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pDL91oU4
Subject: [Buildroot] [PATCH 1/1] support/testing: add iptables runtime test
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
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_iptables.py    | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 support/testing/tests/package/test_iptables.py

diff --git a/DEVELOPERS b/DEVELOPERS
index a6364cdd441..328c654faed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1797,6 +1797,7 @@ F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iozone.py
 F:	support/testing/tests/package/test_iperf3.py
+F:	support/testing/tests/package/test_iptables.py
 F:	support/testing/tests/package/test_jailhouse.py
 F:	support/testing/tests/package/test_jq.py
 F:	support/testing/tests/package/test_jq/
diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
new file mode 100644
index 00000000000..ee57b315589
--- /dev/null
+++ b/support/testing/tests/package/test_iptables.py
@@ -0,0 +1,78 @@
+import os
+
+import infra.basetest
+
+
+class TestIptables(infra.basetest.BRTest):
+    # The iptables package has _LINUX_CONFIG_FIXUPS, so we cannot use
+    # the runtime test pre-built Kernel. We need to compile a Kernel
+    # to make sure it will include the required configuration.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.82"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_IPTABLES=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("iptables --version")
+
+        # We delete all rules in all chains. We also set default
+        # policies to ACCEPT for INPUT and OUPUT chains. This should
+        # already be the case (default Kernel config). This makes sure
+        # this test starts from a known state and also those common
+        # command invocations works.
+        self.assertRunOk("iptables --flush")
+        self.assertRunOk("iptables --policy INPUT ACCEPT")
+        self.assertRunOk("iptables --policy OUTPUT ACCEPT")
+
+        # We add a filter rule to drop all the ICMP protocol to the
+        # IPv4 destination 127.0.0.2, in the INPUT chain. This should
+        # block all pings (icmp echo-requests).
+        cmd = "iptables --append INPUT"
+        cmd += " --protocol icmp --destination 127.0.0.2 --jump DROP"
+        self.assertRunOk(cmd)
+
+        # We check we can list rules.
+        self.assertRunOk("iptables --list")
+
+        # A ping to 127.0.0.1 is expected to work, because it's not
+        # matching our rule. We expect 3 replies (-c), with 0.5s
+        # internal (-i), and set a maximum timeout of 2s.
+        ping_cmd_prefix = "ping -c 3 -i 0.5 -W 2 "
+        self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
+
+        # A ping to 127.0.0.2 is expected to fail, because our rule is
+        # supposed to drop it.
+        ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
+        _, exit_code = self.emulator.run(ping_test_cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # We delete our only rule #1 in the INPUT chain.
+        self.assertRunOk("iptables --delete INPUT 1")
+
+        # Since we deleted the rule, the ping test command which was
+        # supposed to fail earlier is now supposed to succeed.
+        self.assertRunOk(ping_test_cmd)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
