Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D74D1712A
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 19:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E437280D76;
	Mon, 21 Oct 2024 19:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAJfMct6a76g; Mon, 21 Oct 2024 19:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6119180D41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6119180D41;
	Mon, 21 Oct 2024 19:20:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F01A2072
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 19:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BD7980D41
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 19:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74ppiAb7w1da for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 19:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF99480D3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF99480D3D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF99480D3D
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 19:20:35 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8A8AFB0053E;
 Mon, 21 Oct 2024 21:20:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 21 Oct 2024 21:20:25 +0200
Message-ID: <20241021192025.201742-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729538432;
 bh=d2Vpv63UFqysHbnEVQS+nuD2mxHqqSNeINdX+nFzOYc=;
 h=From:To:Cc:Subject:Date:From;
 b=Z/3knY9Lmu02gLYli//b9mZ/7OszBFiPMOTUaAvDbOHKArkzQ9gobyIg2mjdRegcJ
 z0TdUYh+x3JfWxEw0euUoB8sRyx5f/4t7PCVY5CRkkwT04QcTYw+0UxszrpLx/6g2a
 3+epGw3c0ZmPaT9+CXXqn1j68AUzWwBbjSWqUqq1X21CacJodUH9z/ng78XLBdozE1
 RWAD4jNvS7letVz43cOQSXmfkfZl4hg/Vt7B9kqDsICCLf6jV+QhCd6ksNNxtPYjPo
 eCl6oDqj+Wh6GyyIf/vEAxu+KoMapNsH3LiNtZ8eY9ICR960gWLNzALfkjzZWO6Uc9
 nQ4jNvUK3IeIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Z/3knY9L
Subject: [Buildroot] [PATCH 1/1] support/testing: add pppd runtime test
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
https://gitlab.com/jolivain/buildroot/-/jobs/8145740231
---
 DEVELOPERS                                    |   2 +
 support/testing/tests/package/test_pppd.py    | 125 ++++++++++++++++++
 .../package/test_pppd/linux-ppp.fragment      |   2 +
 3 files changed, 129 insertions(+)
 create mode 100644 support/testing/tests/package/test_pppd.py
 create mode 100644 support/testing/tests/package/test_pppd/linux-ppp.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d9bcc2c87..c649d3d6f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1968,6 +1968,8 @@ F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_pigz.py
 F:	support/testing/tests/package/test_postgresql.py
+F:	support/testing/tests/package/test_pppd.py
+F:	support/testing/tests/package/test_pppd/
 F:	support/testing/tests/package/test_pv.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
diff --git a/support/testing/tests/package/test_pppd.py b/support/testing/tests/package/test_pppd.py
new file mode 100644
index 0000000000..015f10f02d
--- /dev/null
+++ b/support/testing/tests/package/test_pppd.py
@@ -0,0 +1,125 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestPppd(infra.basetest.BRTest):
+    # This test needs a Kernel with ppp support.
+    kern_frag = \
+        infra.filepath("tests/package/test_pppd/linux-ppp.fragment")
+    # Our test config also enables socat and iproute2 used as
+    # supporting tools for this test.
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.57"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_IPROUTE2=y
+        BR2_PACKAGE_PPPD=y
+        BR2_PACKAGE_SOCAT=y
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
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M", "-initrd", img])
+        self.emulator.login()
+
+        # We define our socat output log file.
+        socat_log = "/tmp/socat.log"
+
+        # We define two PTY names we will use for this test.
+        pty0 = "/dev/ttyppp0"
+        pty1 = "/dev/ttyppp1"
+
+        # We define two IP addresses.
+        local_ip = "192.168.12.34"
+        remote_ip = "10.20.30.40"
+
+        # We define few parameters for our ping.
+        ping_count = 3
+        ping_size = 32
+        ping_payload = "aa"
+
+        # We check the program can execute.
+        self.assertRunOk("pppd --version")
+
+        # We create two PTYs connected to each other with socat. We
+        # will connect a pppd on each one to create connection end
+        # points. We also enable some debugging to print the content
+        # of packets forwarded by socat. We will use that to later
+        # validate data actually passed through this channel. Note: we
+        # start the command in a subshell to suppress the job control
+        # message, when this background process will be killed later
+        # in this test.
+        cmd = "( socat -d2 -x -lu"
+        cmd += f" PTY,link={pty0},rawer,b115200 PTY,link={pty1},rawer,b115200"
+        cmd += f" > {socat_log} 2>&1 & )"
+        self.assertRunOk(cmd)
+
+        # We create a network namespace. We will use it to isolate one
+        # of the two pppd instances (our fake remote). We do so to
+        # make sure our network test will not use the default routes
+        # (or local loopback). This will make sure our communication
+        # data will go through our PPP link.
+        namespace = "remote-ppp"
+        self.assertRunOk(f"ip netns add {namespace}")
+
+        # We start our (fake) remote pppd instance, in our netns.
+        cmd = f"ip netns exec {namespace} "
+        cmd += f"pppd noauth ifname ppp1 {pty1} {remote_ip}:{local_ip}"
+        self.assertRunOk(cmd)
+
+        # We wait a bit for the pppd to settle...
+        time.sleep(3)
+
+        # We start out local pppd instance, this time in the default
+        # network namespace.
+        cmd = f"pppd noauth ifname ppp0 {pty0} {local_ip}:{remote_ip}"
+        self.assertRunOk(cmd)
+
+        # We wait again...
+        time.sleep(3)
+
+        # We check we can ping our two IPs. The local IP is expected
+        # to go through the interface loopback (and not go through our
+        # PPP link). Only the remote IP ping is expected to go through
+        # our socat PTYs.
+        for ip in local_ip, remote_ip:
+            cmd = f"ping -c {ping_count} -s {ping_size} -p {ping_payload} {ip}"
+            self.assertRunOk(cmd)
+
+        # We stop our pppd and socat processes.
+        self.assertRunOk("killall pppd")
+        self.assertRunOk("killall socat")
+
+        # For debugging this test, it can be useful to print the socat
+        # log on the console. Uncomment this line, if needed.
+        # self.assertRunOk(f"cat {socat_log}")
+
+        # The actual ping payload set with our payload_data is
+        # slightly smaller as the ping packet size, due other data
+        # written by the ping command. This is why we subtract 4 bytes
+        # to the size.
+        pattern = " ".join([ping_payload] * (ping_size - 4))
+        # We count the number of packets with this payload transmitted
+        # through socat...
+        out, ret = self.emulator.run(f"grep -Fc '{pattern}' {socat_log}")
+        self.assertEqual(ret, 0)
+        # We check we have exactly twice our requested ping count (one
+        # for ICMP ECHO, one for the REPLY).
+        self.assertEqual(int(out[0]), ping_count * 2)
diff --git a/support/testing/tests/package/test_pppd/linux-ppp.fragment b/support/testing/tests/package/test_pppd/linux-ppp.fragment
new file mode 100644
index 0000000000..18bedc2831
--- /dev/null
+++ b/support/testing/tests/package/test_pppd/linux-ppp.fragment
@@ -0,0 +1,2 @@
+CONFIG_PPP=y
+CONFIG_PPP_ASYNC=y
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
