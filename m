Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D3AC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7207C41E0A;
	Sat, 13 Jan 2024 20:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7207C41E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02bBqR734Hn4; Sat, 13 Jan 2024 20:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F1F41699;
	Sat, 13 Jan 2024 20:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5F1F41699
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1A3C1BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A33F60ACC
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A33F60ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mah6q7ovj3ZL for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:15:44 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 896DF60A9A
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 896DF60A9A
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 65B7E13F88D;
 Sat, 13 Jan 2024 21:15:39 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:15:31 +0100
Message-ID: <20240113201532.121274-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705176940;
 bh=EyqeulJ5sKg9WHNigNX27QS6Qbrh/tI5YBZpdf3CWdU=;
 h=From:To:Cc:Subject:Date:From;
 b=H2eXdi+s87yH6J0SVKBVAHhp95ixEloiGXw/dWbL0tYygF3s8iBKco/q2Ft3GhIpR
 fStrmA7uZ5HMa4OBa0o1Twdi4lUyRUYd/LrTECaJzGOfzH5B+B6XlEhnKKP5WwKrdI
 ixLvITzQG5BuPFyap1AXqBe8WM8EUsYCuOBFM6ng5LJpGqGfhmIto7CepsJ14tXrQK
 NBp1X3MkeYA6oPDpaMOQMIJrNb3pJ3181LGTz9iVYkI08bTxLKxEoPGDDYZdqMjJL+
 cLx2g35SaeSWQAiHICNGqIrRKI8CCe/CSB5hh0ncJyo1FzXgw/zaUnxbCrwBVovZTe
 MO2s07b3QJtBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H2eXdi+s
Subject: [Buildroot] [PATCH 1/1] support/testing: add netcat runtime test
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
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_netcat.py | 41 ++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 support/testing/tests/package/test_netcat.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 94a89c63d5..d25f31f0ff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1791,6 +1791,7 @@ F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
 F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_ncdu.py
+F:	support/testing/tests/package/test_netcat.py
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_octave.py
diff --git a/support/testing/tests/package/test_netcat.py b/support/testing/tests/package/test_netcat.py
new file mode 100644
index 0000000000..b3efa4c40b
--- /dev/null
+++ b/support/testing/tests/package/test_netcat.py
@@ -0,0 +1,41 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestNetCat(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_NETCAT=y
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
+        self.assertRunOk("nc --version")
+
+        in_file = "input.bin"
+        out_file = "output.bin"
+        port = 12345
+
+        cmd = f"dd if=/dev/urandom of={in_file} bs=1k count=1k"
+        self.assertRunOk(cmd)
+
+        cmd = f"nc -l -p {port} > {out_file} &"
+        self.assertRunOk(cmd)
+
+        time.sleep(1)
+
+        cmd = f"cat {in_file} | nc -c 127.0.0.1 {port}"
+        self.assertRunOk(cmd)
+
+        cmd = f"cmp {in_file} {out_file}"
+        self.assertRunOk(cmd)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
