Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3025BC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 17:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6D57605BA;
	Sun, 21 Jul 2024 17:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwMOkgbF3KOT; Sun, 21 Jul 2024 17:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D826E605F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D826E605F0;
	Sun, 21 Jul 2024 17:09:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E1EF1BF2C3
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 17:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C130605F0
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 17:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5G74UOv9oem3 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 17:09:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6CB48605BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CB48605BA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CB48605BA
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 17:09:23 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 04106B0051B;
 Sun, 21 Jul 2024 19:09:19 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 19:09:12 +0200
Message-ID: <20240721170912.138847-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1721581761;
 bh=dV6V2UqsMUYGO60njqT8M9ZJFEgVioq5AElRg6rqU4Q=;
 h=From:To:Cc:Subject:Date:From;
 b=AKV34awVPY0vZPz20PAkaeX4UMom39ltqxOhogqH0qAlPv6nBoJBqR3IIxI2XGBeS
 taFyeFjws2oMbnLRXUwmblBWZrd92Sg2I5TfSg+VhH9r3IZdgZlCF3mhUBVoBUHGwq
 tFaORIFJLitxnsApfvhpuwyr7W0XjsRfjMC1Fq4o+HUt0wYKF8dGUEc2m9cxSe3Tri
 2twzcvuuzETET1epAXSjq7KNu0CIWp6faTcxQ0B1iuk/EqK8PSTdtr/1jTJ89QnaG9
 Wb197WfKCQx15IuFwcO+FtKWLlfnl3+DtUVUsVGP3W40Xw+64Bu6SibMQ5ZzE4wbfY
 cZMKxNyfuyQDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AKV34awV
Subject: [Buildroot] [PATCH 1/1] support/testing: add iproute2 runtime test
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
 .../testing/tests/package/test_iproute2.py    | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 support/testing/tests/package/test_iproute2.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 333e26d74e..77a798b25c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1878,6 +1878,7 @@ F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iozone.py
 F:	support/testing/tests/package/test_iperf.py
 F:	support/testing/tests/package/test_iperf3.py
+F:	support/testing/tests/package/test_iproute2.py
 F:	support/testing/tests/package/test_iptables.py
 F:	support/testing/tests/package/test_jailhouse.py
 F:	support/testing/tests/package/test_jq.py
diff --git a/support/testing/tests/package/test_iproute2.py b/support/testing/tests/package/test_iproute2.py
new file mode 100644
index 0000000000..91d9006e23
--- /dev/null
+++ b/support/testing/tests/package/test_iproute2.py
@@ -0,0 +1,77 @@
+import os
+
+import infra.basetest
+
+
+class TestIpRoute2(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_IPROUTE2=y
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
+        # Check the program can execute. This also check we are
+        # actually using the version from the iproute2 package, rather
+        # than the BusyBox version (which does not understand this
+        # option).
+        self.assertRunOk("ip -Version")
+
+        # We run simple invocations of iproute2 tools.
+        self.assertRunOk("ifstat")
+        self.assertRunOk("ip link show dev lo")
+
+        # Buildroot is supposed to have setup the loopback "lo"
+        # interface. We should be able to ping any address in
+        # the 127.0.0.0/8 subnet.
+        addrs = ["127.0.0.1", "127.0.1.2", "127.1.2.3"]
+        ping_cmd = "ping -c 3 -i 0.2"
+        for addr in addrs:
+            self.assertRunOk(f"{ping_cmd} {addr}")
+
+        # We now change this 127.0.0.1/8 to a /16.
+        self.assertRunOk("ip addr del 127.0.0.1/8 dev lo")
+        self.assertRunOk("ip addr add 127.0.0.1/16 dev lo")
+
+        # The IPs in the 127.0.0.0/16 subnet are still supposed to
+        # ping...
+        addrs = ["127.0.0.1", "127.0.1.2"]
+        for addr in addrs:
+            self.assertRunOk(f"{ping_cmd} {addr}")
+        # ...but the IP outside is supposed to fail.
+        _, ret = self.emulator.run(f"{ping_cmd} 127.1.2.3")
+        self.assertNotEqual(ret, 0)
+
+        # We add a prohibited route.
+        self.assertRunOk("ip route add prohibit 127.0.1.0/24")
+
+        # Now, only 127.0.0.1 is supposed to ping...
+        self.assertRunOk(f"{ping_cmd} 127.0.0.1")
+        # ...while the other IPs expected to fail.
+        addrs = ["127.0.1.2", "127.1.2.3"]
+        for addr in addrs:
+            _, ret = self.emulator.run(f"{ping_cmd} {addr}")
+            self.assertNotEqual(ret, 0)
+
+        # We should be able to see our prohibited route.
+        out, ret = self.emulator.run("ip route list")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0].strip(), "prohibit 127.0.1.0/24")
+
+        # We create a new network namespace, and create a new shell
+        # process in it.
+        self.assertRunOk("ip netns add br-test")
+        self.assertRunOk("ip netns exec br-test /bin/sh")
+
+        # Since we are in a new namespace, we should no longer see the
+        # prohibited route. The route list output should be empty.
+        out, ret = self.emulator.run("ip route list")
+        self.assertEqual(ret, 0)
+        self.assertEqual(len(out), 0)
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
