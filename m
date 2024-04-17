Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F390DC4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 22:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 878DE605C2;
	Wed, 17 Apr 2024 22:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xahi7WvJp3o7; Wed, 17 Apr 2024 22:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8292B606BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8292B606BB;
	Wed, 17 Apr 2024 22:06:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF4F01BF3F3
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 22:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA58981EED
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 22:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tCae2rdKUbw for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 22:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9757A81EE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9757A81EE8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9757A81EE8
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 22:06:21 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E4384B0037C;
 Thu, 18 Apr 2024 00:06:16 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 18 Apr 2024 00:06:10 +0200
Message-ID: <20240417220610.136595-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713391578;
 bh=YbVWrLy5/UPaanUu3Rk/Xsflx6x6ApSFgbMv41hTnws=;
 h=From:To:Cc:Subject:Date:From;
 b=UT6ePsEveKiJmbxaYfYPQdyG/cjlGfuaw5tAXIh0vyFJELCqjRUiXsUJwu6nlB77q
 FXHFvhxwaY0GJM4Y+kc4LuC/HX2e+AjossTdKbPjZKoOAXldNVXbFR2DuDy1RxWTU4
 xIA0Ge4/E/ViNc/PekIvwMOwNUIg64hzBmA2pX0cHGlpA76IUzejehmhy5shXbj/Gx
 VAylT0gv4WWnVYRj0Fypwr60zYSfNbx8jdWoRcnHmgLWNJxj6d8GU7quhg3kT7CU+1
 jFDzgPtl14JB5kOaj3HsiE+851SDxOZ65IHd1KpXT0YlLkc3K4Fd+wxNLKuCu6D7bb
 pdB1zYPSb+0UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UT6ePsEv
Subject: [Buildroot] [PATCH 1/1] support/testing: add netsnmp runtime test
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
 support/testing/tests/package/test_netsnmp.py | 44 +++++++++++++++++++
 .../rootfs-overlay/etc/snmp/snmpd.conf        |  4 ++
 3 files changed, 50 insertions(+)
 create mode 100644 support/testing/tests/package/test_netsnmp.py
 create mode 100644 support/testing/tests/package/test_netsnmp/rootfs-overlay/etc/snmp/snmpd.conf

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3..0b258e3cb96 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1831,6 +1831,8 @@ F:	support/testing/tests/package/test_mtools.py
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
index 00000000000..9561e49828d
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
index 00000000000..63a33694f19
--- /dev/null
+++ b/support/testing/tests/package/test_netsnmp/rootfs-overlay/etc/snmp/snmpd.conf
@@ -0,0 +1,4 @@
+# This is a simple configuration for testing.
+syslocation Buildroot Test Infra
+syscontact Buildroot Test User
+rocommunity public default system
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
