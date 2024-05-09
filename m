Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850A1C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5010683D97;
	Thu,  9 May 2024 15:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D05mZ_NXFq6p; Thu,  9 May 2024 15:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4268783DA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4268783DA2;
	Thu,  9 May 2024 15:17:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 062961BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFB1683DA2
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NE93R6pDMH19 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B96183D97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B96183D97
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:17:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07C4486BFA; Thu,  9 May 2024 15:17:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 17:17:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d977ec1d46f66e11b624efb310baef359937c83
X-Git-Newrev: 639f5074795d7503d8f506bc5b675d0478031147
X-Patchwork-Hint: ignore
Message-Id: <20240509151756.07C4486BFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add netsnmp runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=639f5074795d7503d8f506bc5b675d0478031147
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_netsnmp.py      | 44 ++++++++++++++++++++++
 .../rootfs-overlay/etc/snmp/snmpd.conf             |  4 ++
 3 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ff1c891ff9..7e855e580f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1850,6 +1850,8 @@ F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_mtr.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_netcat.py
+F:	support/testing/tests/package/test_netsnmp.py
+F:	support/testing/tests/package/test_netsnmp/
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_ngrep.py
diff --git a/support/testing/tests/package/test_netsnmp.py b/support/testing/tests/package/test_netsnmp.py
new file mode 100644
index 0000000000..9561e49828
--- /dev/null
+++ b/support/testing/tests/package/test_netsnmp.py
@@ -0,0 +1,44 @@
+import os
+
+import infra.basetest
+
+
+class TestNetSNMP(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_netsnmp/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_NETSNMP=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
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
+        # We check the daemon and a client program can execute.
+        self.assertRunOk("snmpd --version")
+        self.assertRunOk("snmpget --version")
+
+        # The daemon is supposed to be started by the initscript,
+        # since we included a /etc/snmp/snmpd.conf file. We should be
+        # able to walk through the SNMPv2 system MIB.
+        self.assertRunOk("snmpwalk -v 2c -c public 127.0.0.1 system")
+
+        # We check few OIDs has the expected values. sysContact and
+        # sysLocation are set in the snmpd.conf file.
+        tests = [
+            ("system.sysName.0", "STRING: buildroot"),
+            ("system.sysContact.0", "STRING: Buildroot Test User"),
+            ("system.sysLocation.0", "STRING: Buildroot Test Infra")
+        ]
+        for oid, expected_out in tests:
+            cmd = f"snmpget -v 2c -c public -Ov 127.0.0.1 {oid}"
+            out, ret = self.emulator.run(cmd)
+            self.assertEqual(ret, 0)
+            self.assertEqual(out[0], expected_out)
diff --git a/support/testing/tests/package/test_netsnmp/rootfs-overlay/etc/snmp/snmpd.conf b/support/testing/tests/package/test_netsnmp/rootfs-overlay/etc/snmp/snmpd.conf
new file mode 100644
index 0000000000..63a33694f1
--- /dev/null
+++ b/support/testing/tests/package/test_netsnmp/rootfs-overlay/etc/snmp/snmpd.conf
@@ -0,0 +1,4 @@
+# This is a simple configuration for testing.
+syslocation Buildroot Test Infra
+syscontact Buildroot Test User
+rocommunity public default system
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
