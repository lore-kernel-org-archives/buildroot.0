Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8EBC4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 21:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1362C81434;
	Tue, 16 Apr 2024 21:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZxFLLaAZND1; Tue, 16 Apr 2024 21:40:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDC5B81E19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDC5B81E19;
	Tue, 16 Apr 2024 21:40:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D02711BF4E2
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 21:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCC734114E
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 21:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6QOK9H9XDMU for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 21:40:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 258EE40C53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 258EE40C53
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 258EE40C53
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 21:40:07 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 38C1BB0055E;
 Tue, 16 Apr 2024 23:40:03 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 23:39:58 +0200
Message-ID: <20240416213958.782150-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713303604;
 bh=QkJM1e7AhmV+5c4C+iuivqZwLeouob2WJrpFz0hT0jU=;
 h=From:To:Cc:Subject:Date:From;
 b=gzsx1wBrtKZzlA/gWL88c6lIHVU0q+hk9rbvS8QpXnxdSv2SQ9vbrpLCShc1e+hAM
 trWLoMlcnRWT9HRU9JgMgsVAbq+77anm2Tpm5vN9by8k7Wf56kxvEJlAWMRiDyid7K
 ewlf2O64S2j3W+keFpsUUktsUmubRIdnYMJwsks+9oM79XP2OicxvYDtPw345bRDBH
 wdhYm0ENag4spitnjL6Q8MJiL/N8Cpzc+xKXiqYjpauBg8toLZCgeXGhk+xcDeQipU
 UWy+1ubFmk8Jt1uGjBwbQ0BX/QLnQOWLuGNFbcO1YCBILzjycIE1/P3ACClbF0BZPR
 O3ja1BbM4/SAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gzsx1wBr
Subject: [Buildroot] [PATCH 1/1] support/testing: add ethtool runtime test
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
 support/testing/tests/package/test_ethtool.py | 71 +++++++++++++++++++
 .../test_ethtool/linux-e1000e.fragment        |  1 +
 3 files changed, 74 insertions(+)
 create mode 100644 support/testing/tests/package/test_ethtool.py
 create mode 100644 support/testing/tests/package/test_ethtool/linux-e1000e.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3..a1b87b363eb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1784,6 +1784,8 @@ F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_ed.py
+F:	support/testing/tests/package/test_ethtool.py
+F:	support/testing/tests/package/test_ethtool/
 F:	support/testing/tests/package/test_file.py
 F:	support/testing/tests/package/test_file/
 F:	support/testing/tests/package/test_fluidsynth.py
diff --git a/support/testing/tests/package/test_ethtool.py b/support/testing/tests/package/test_ethtool.py
new file mode 100644
index 00000000000..7a2627c6e9e
--- /dev/null
+++ b/support/testing/tests/package/test_ethtool.py
@@ -0,0 +1,71 @@
+import os
+
+import infra.basetest
+
+
+class TestEthtool(infra.basetest.BRTest):
+    # This ethtool test uses an emulated Intel e1000e adapted (which
+    # is well supported by Qemu, the Kernel and ethtool). We are not
+    # using the usual virtio_net because it's not supporting some
+    # ethtool features like adapter testing. For that reason, we need
+    # to compile a Kernel.
+    kernel_fragment = \
+        infra.filepath("tests/package/test_ethtool/linux-e1000e.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_PACKAGE_ETHTOOL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-netdev", "user,id=test_net",
+                                    "-net", "nic,model=e1000e,netdev=test_net",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # We check the program can run.
+        self.assertRunOk("ethtool --version")
+
+        # We check a simple query runs correctly.
+        self.assertRunOk("ethtool eth0")
+
+        # We query the driver name and check it's the expected e1000e.
+        out, ret = self.emulator.run("ethtool -i eth0")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "driver: e1000e")
+
+        # We request an adapter online self test.
+        self.assertRunOk("ethtool -t eth0 online", timeout=30)
+
+        # We query offload parameters and check TSO are enabled (this
+        # is the driver default).
+        out, ret = self.emulator.run("ethtool -k eth0")
+        self.assertEqual(ret, 0)
+        self.assertIn("tcp-segmentation-offload: on", out)
+
+        # We request to disable TSO.
+        self.assertRunOk("ethtool -K eth0 tcp-segmentation-offload off")
+
+        # We check again. TSO should now be disabled.
+        out, ret = self.emulator.run("ethtool -k eth0")
+        self.assertEqual(ret, 0)
+        self.assertIn("tcp-segmentation-offload: off", out)
diff --git a/support/testing/tests/package/test_ethtool/linux-e1000e.fragment b/support/testing/tests/package/test_ethtool/linux-e1000e.fragment
new file mode 100644
index 00000000000..cc3fe0047ee
--- /dev/null
+++ b/support/testing/tests/package/test_ethtool/linux-e1000e.fragment
@@ -0,0 +1 @@
+CONFIG_E1000E=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
