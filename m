Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22146D2CE13
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 17:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A75FC80F84;
	Tue, 22 Oct 2024 17:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZDJn6FAjup7; Tue, 22 Oct 2024 17:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE9880F85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEE9880F85;
	Tue, 22 Oct 2024 17:43:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 890092072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 17:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82815408CB
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 17:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMTQ92RZzyUY for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 17:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D631B40260
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D631B40260
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D631B40260
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 17:43:55 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 62FBBB0051E;
 Tue, 22 Oct 2024 19:43:51 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 22 Oct 2024 19:43:45 +0200
Message-ID: <20241022174345.127042-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729619032;
 bh=rBRUrSSLlApt0uDIz7NaofP4W9o6GRf8YsElom+qS+A=;
 h=From:To:Cc:Subject:Date:From;
 b=W5LGLX48Iv1gIZK25lHWXlOCgbILcSTEcbUc39fwl9i3lgIiQL29PDzKDPjuu9Kwd
 TIIB04WLQtSvrYX+gXoQM9HzFO7NFxmSor1mKvyVSAS5RMCFwsNwWz+iL+vrFYztwC
 WzvLaFKniEipL1BhXCwRZP4fmhozkpouCT7PmTHEGRiYOHriORyaHxGFII2glt5OH6
 Cqk18jVNFhzjohxggkhnr/KpviYddvlb9O512fMeE1WBktwgoyick+0LDSGQLwUjq5
 toDXSP1i+2pv0JCeqvlILa5wYAjW/S9HSTTMj1DmW+m2KH7I6tOBDmGI2sbQgeQau/
 LUfaUUqsuEvEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=W5LGLX48
Subject: [Buildroot] [PATCH 1/1] support/testing: add iputils runtime test
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
https://gitlab.com/jolivain/buildroot/-/jobs/8156359331
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_iputils.py | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 support/testing/tests/package/test_iputils.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d9bcc2c87..b101555a5d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1911,6 +1911,7 @@ F:	support/testing/tests/package/test_iperf.py
 F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_iproute2.py
 F:	support/testing/tests/package/test_iptables.py
+F:	support/testing/tests/package/test_iputils.py
 F:	support/testing/tests/package/test_jailhouse.py
 F:	support/testing/tests/package/test_jq.py
 F:	support/testing/tests/package/test_jq/
diff --git a/support/testing/tests/package/test_iputils.py b/support/testing/tests/package/test_iputils.py
new file mode 100644
index 0000000000..5f4ba9873b
--- /dev/null
+++ b/support/testing/tests/package/test_iputils.py
@@ -0,0 +1,48 @@
+import os
+
+import infra.basetest
+
+
+class TestIputils(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_IPUTILS=y
+        BR2_SYSTEM_DHCP="eth0"
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
+        # We check all the main programs of iputils can execute and
+        # report their version. Note the "-V" option is not accepted
+        # and fails if the "ping" applet of BusyBox is used instead.
+        iputils_progs = ["arping", "clockdiff", "ping", "tracepath"]
+        for prog in iputils_progs:
+            self.assertRunOk(f"{prog} -V")
+
+        # Qemu host IP, See:
+        # https://wiki.qemu.org/Documentation/Networking#User_Networking_(SLIRP)
+        qemu_host = "10.0.2.2"
+
+        # We test the "arping" program, with 3 pings.
+        self.assertRunOk(f"arping -c 3 {qemu_host}", timeout=10)
+
+        # We test the "ping" program. We use the option "-D" which
+        # shows a timestamp and is also not supported by the "ping"
+        # BusyBox applet.
+        self.assertRunOk(f"ping -D -c 3 {qemu_host}", timeout=10)
+
+        # We test the "tracepath" program. We set the max hops to 2,
+        # since there is no intermediate routers.
+        self.assertRunOk(f"tracepath -m 2 {qemu_host}", timeout=10)
+
+        # We test the "clockdiff" program. We cannot use the Qemu host
+        # IP for this program as the ICMP TIMESTAMP is used and is not
+        # responded. We use the local host instead.
+        self.assertRunOk("clockdiff 127.0.0.1", timeout=10)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
