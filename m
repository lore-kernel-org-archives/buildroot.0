Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29CCC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 20:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11324607DB;
	Sun, 21 Jul 2024 20:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaXAvTHr3iVa; Sun, 21 Jul 2024 20:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A34C605DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A34C605DE;
	Sun, 21 Jul 2024 20:57:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6CEA1BF32D
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 20:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0DA4605DE
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 20:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9mRAB1OnJdb for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 20:57:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BC13605DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BC13605DD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BC13605DD
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 20:57:42 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 96BF2B00548;
 Sun, 21 Jul 2024 22:57:38 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 22:57:31 +0200
Message-ID: <20240721205731.266149-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1721595460;
 bh=U58DwzUWTKOC5ewxsKelgxWuCjXvIOE67erM7Oo6+xk=;
 h=From:To:Cc:Subject:Date:From;
 b=X23QH7xBT3EiATBHsJBc4DBlwbHdqlJttJNY9bJYOu9fZkTRH7kleA9ywZrlToQWu
 /USsAXIHFFrEYzjUSYQh3tHdA7AiYCzz2BWGLs5l6PG0lu50zWiHHdrNEieS5F62bd
 bKFKfL89Vw00YNncCvpdX8iJ9BhwWpGH1wQBx9GGWcD8fH5fQ5f9UTTpSMCTBLrJGU
 yrg9Gy+plO46U+hwp7OdkG3qAmAn/JPZtQjIgDeU2PcjbKCTMXHc0+zTCoixgZZwrd
 yOi7kpCZVvEyTzqQK84taoahEluvcZ2OQqO6yyghSZam23uRkPNwHq6NAvWTSUVQXP
 NEjpahq4uc68g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X23QH7xB
Subject: [Buildroot] [PATCH 1/1] support/testing: add nmap runtime test
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
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_nmap.py | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 support/testing/tests/package/test_nmap.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 333e26d74e..60f6b740c7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1918,6 +1918,7 @@ F:	support/testing/tests/package/test_netsnmp/
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_ngrep.py
+F:	support/testing/tests/package/test_nmap.py
 F:	support/testing/tests/package/test_ntp.py
 F:	support/testing/tests/package/test_ntp/
 F:	support/testing/tests/package/test_numactl.py
diff --git a/support/testing/tests/package/test_nmap.py b/support/testing/tests/package/test_nmap.py
new file mode 100644
index 0000000000..92b085ece9
--- /dev/null
+++ b/support/testing/tests/package/test_nmap.py
@@ -0,0 +1,42 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestNmap(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_NMAP=y
+        BR2_PACKAGE_NMAP_NCAT=y
+        BR2_PACKAGE_NMAP_NMAP=y
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
+        # Check the program can execute.
+        self.assertRunOk("nmap --version")
+
+        # We open few ports, using the nmap netcat "nc" commands.
+        ports = [21, 23, 25, 80]
+        for port in ports:
+            cmd = f"nc -l -p {port} </dev/null &>/dev/null &"
+            self.assertRunOk(cmd)
+
+        time.sleep(1 * self.timeout_multiplier)
+
+        # We run a local port scan. We should see in the output the
+        # ports we previously opened.
+        out, ret = self.emulator.run("nmap -n -sS 127.0.0.1", timeout=20)
+        self.assertEqual(ret, 0)
+        nmap_out = "\n".join(out)
+        for port in ports:
+            self.assertRegex(nmap_out, f"{port}/tcp *open")
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
