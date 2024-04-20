Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15591C4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 10:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3215406A6;
	Sat, 20 Apr 2024 10:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfVl13nv1ZzB; Sat, 20 Apr 2024 10:54:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FA11406AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA11406AF;
	Sat, 20 Apr 2024 10:54:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2BC1BF591
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 10:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82CEF4019A
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 10:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeeOfn-y-mOA for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 10:54:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 885794016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 885794016D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 885794016D
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 10:54:49 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ED90EB00579;
 Sat, 20 Apr 2024 12:54:45 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 12:54:41 +0200
Message-ID: <20240420105441.35505-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713610487;
 bh=TaE196OzW6/F+XIlUZlvsv5d3mzPZYKD1u6cnqJpGYE=;
 h=From:To:Cc:Subject:Date:From;
 b=vYye5eaPBBuNSotN5LLeQTOmG9V8cWjNv/Jee50s5uF2yj2lKQ3UKQXMJkn7cUyN/
 rbdDUk+pnoAE2zJ7JqxOitrThTYqsavZpTj8uxpLYNRWiSjLTyQfKQIrUNmxMu4aAK
 yPQK4pePdU18CPPwjsJ9khSwdk/zX1/LD3rPw9tyj0WdzqwkPGFplCmX2YLbycmvrj
 w41kg963orBABPxd1Zv4a3FmGUEm+DJpD7CGO4Eu2p302JmyMax/vwMn9zZi2Pmf6v
 IwxVe4RCgARDIp4zAjiZXYd8ip7cFPsUaKPpngEjRxpqHd7tp6ifktEOe9rzxaFbE+
 cVDjWcCm4Lryw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vYye5eaP
Subject: [Buildroot] [PATCH 1/1] support/testing: add iperf runtime test
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
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_iperf.py | 23 +++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 support/testing/tests/package/test_iperf.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3..2f8bacda2d9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1801,6 +1801,7 @@ F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iozone.py
+F:	support/testing/tests/package/test_iperf.py
 F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_iptables.py
 F:	support/testing/tests/package/test_jailhouse.py
diff --git a/support/testing/tests/package/test_iperf.py b/support/testing/tests/package/test_iperf.py
new file mode 100644
index 00000000000..31f04d98967
--- /dev/null
+++ b/support/testing/tests/package/test_iperf.py
@@ -0,0 +1,23 @@
+import os
+
+import infra.basetest
+
+
+class TestIperf(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_IPERF=y
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
+        self.assertRunOk("iperf --version")
+        self.assertRunOk("iperf -s -D")
+        self.assertRunOk("iperf -c 127.0.0.1 -t 3")
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
