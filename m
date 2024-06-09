Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8DFC27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 17:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FD10607C1;
	Sun,  9 Jun 2024 17:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cM67s104fbxK; Sun,  9 Jun 2024 17:22:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E97A2605CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97A2605CB;
	Sun,  9 Jun 2024 17:22:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A36B61BF3E8
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 17:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F36083806
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 17:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwJSxeprQFEU for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 17:22:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC81E837DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC81E837DA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC81E837DA
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 17:22:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AE356B00593;
 Sun,  9 Jun 2024 19:22:10 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  9 Jun 2024 19:21:48 +0200
Message-ID: <20240609172148.88446-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717953732;
 bh=YYBBej2XF1whb5xNdTrXOrKEkdFCeDQEJ8xJFMVqtiY=;
 h=From:To:Cc:Subject:Date:From;
 b=F4G9ZlgTLQrAx2sEAYuos0INpluJPB7EGKXec79P8r5qlclnBM4eJvMpZd5ZfDste
 CpcfYtabO9bijnqGJ7pT/mS4jIgZqZEa81J3uAQaOgRBHlOvXBJiOPsxPSAkOfoREJ
 ciL3FmEYYcuOAAyMVQS7HTgNSIFsOvwSgKVOZb7WKsEd4lT8Dq/UaO8UDLcCHUT1Qp
 8R2ZebVRRac3u7l0J0qsChNaTLo2CCkvtgyVYuVyQYcPVCAhK1TtWw+pA8humgJ3QF
 m81x9VBAdQbVFaEQz8FCYqAxWDmsuFUwUeFnp/w04ily0z96P09wU9T5njqyhfCcvq
 Y+gAXXshN/8Ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=F4G9ZlgT
Subject: [Buildroot] [PATCH 1/1] support/testing: add ntp runtime test
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
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_ntp.py     | 86 +++++++++++++++++++
 .../test_ntp/rootfs-overlay/etc/ntp.conf      | 10 +++
 3 files changed, 98 insertions(+)
 create mode 100644 support/testing/tests/package/test_ntp.py
 create mode 100644 support/testing/tests/package/test_ntp/rootfs-overlay/etc/ntp.conf

diff --git a/DEVELOPERS b/DEVELOPERS
index 03aa7bfa742..0fc43592c26 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1870,6 +1870,8 @@ F:	support/testing/tests/package/test_netsnmp/
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_ngrep.py
+F:	support/testing/tests/package/test_ntp.py
+F:	support/testing/tests/package/test_ntp/
 F:	support/testing/tests/package/test_numactl.py
 F:	support/testing/tests/package/test_numactl/
 F:	support/testing/tests/package/test_octave.py
diff --git a/support/testing/tests/package/test_ntp.py b/support/testing/tests/package/test_ntp.py
new file mode 100644
index 00000000000..13fff6419be
--- /dev/null
+++ b/support/testing/tests/package/test_ntp.py
@@ -0,0 +1,86 @@
+import os
+import re
+import time
+
+import infra.basetest
+
+
+class TestNtp(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_ntp/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_NTP=y
+        BR2_PACKAGE_NTP_NTPD=y
+        BR2_PACKAGE_NTP_NTPQ=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def dict_from_ntpq_output(self, output):
+        d = {}
+        for line in output:
+            if ':' not in line:
+                continue
+            fields = re.split(r":", line, maxsplit=2)
+            name = fields[0].strip()
+            value = fields[1].strip()
+            d[name] = value
+        return d
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check our binaries can execute.
+        self.assertRunOk("ntpd --version")
+        self.assertRunOk("ntpq --version")
+
+        # The ntp daemon is expected to be started from init startup
+        # scripts, for the Buildroot package recipe. We wait a bit
+        # here to let the daemon settle. The next test step checks for
+        # the local peer to be the system peer (by checking the
+        # '*'). If querying the peers too soon after startup the peer
+        # will not be marked as such.
+        time.sleep(3 * self.timeout_multiplier)
+
+        # We query the ntp daemon peers. From our test configuration
+        # file, we should have exactly one.
+        out, ret = self.emulator.run("ntpq --peers")
+        self.assertEqual(ret, 0)
+        # ntpq --peers produces two lines of headers. So we check we
+        # have at least 3 lines of output.
+        self.assertGreaterEqual(len(out), 3)
+        # We check we see our undisciplined local clock and it's the
+        # system peer.
+        self.assertTrue(out[2].startswith("*LOCAL(0)"))
+
+        # We query the refid variable. We expect to see our
+        # undisciplined local clock.
+        out, ret = self.emulator.run("ntpq -c 'readvar 0 refid'")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "refid=LOCAL(0)")
+
+        # We query the ntp system info. We check the reference ID is
+        # the same as in the test configuration file.
+        out, ret = self.emulator.run("ntpq -c sysinfo")
+        self.assertEqual(ret, 0)
+        sysinfo = self.dict_from_ntpq_output(out)
+        refid = "reference ID"
+        self.assertIn(refid, sysinfo)
+        self.assertEqual(sysinfo[refid], "127.127.1.0")
+
+        # Finally, we query the ntp system statistics. We check we can
+        # see some uptime. We waited a bit at the beginning of this
+        # test, plus the few queries we previously did should have
+        # accumulated some uptime.
+        out, ret = self.emulator.run("ntpq -c sysstats")
+        self.assertEqual(ret, 0)
+        sysstats = self.dict_from_ntpq_output(out)
+        up = "uptime"
+        self.assertIn(up, sysstats)
+        self.assertGreater(int(sysstats[up]), 0)
diff --git a/support/testing/tests/package/test_ntp/rootfs-overlay/etc/ntp.conf b/support/testing/tests/package/test_ntp/rootfs-overlay/etc/ntp.conf
new file mode 100644
index 00000000000..2ead3deb6ab
--- /dev/null
+++ b/support/testing/tests/package/test_ntp/rootfs-overlay/etc/ntp.conf
@@ -0,0 +1,10 @@
+# Set an undisciplined local clock for testing without the need of
+# network connectivity.
+server 127.127.1.0 iburst prefer
+fudge  127.127.1.0 stratum 10
+
+# Keep standard access control setup. The test is doing local queries
+# from 127.0.0.1.
+restrict default nomodify nopeer noquery limited kod
+restrict 127.0.0.1
+restrict [::1]
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
