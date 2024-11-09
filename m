Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC65D5E37A
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45CC280F3B;
	Sat,  9 Nov 2024 17:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UI_ZrelF2zvf; Sat,  9 Nov 2024 17:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 458C680F45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458C680F45;
	Sat,  9 Nov 2024 17:55:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDA49D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9B41403BB
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laWDrEfVBgoi for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:55:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C746403BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C746403BD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C746403BD
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:55:29 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BB405B00571;
 Sat,  9 Nov 2024 18:55:23 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Sat,  9 Nov 2024 18:55:09 +0100
Message-ID: <20241109175509.1364647-2-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241109175509.1364647-1-ju.o@free.fr>
References: <20241109175509.1364647-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731174927;
 bh=1qHjVcvN/E4QG1VyCh0KyFbKbKoLsWXI5l3qWSb95FE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YIQ1OSURwfN1DWP3bliW3Quid0raOM+h2Bi2tRXykypffVVIrSzF11j9k0x3VKDTx
 ldC6N8l422sxFglB4/lpTDvd+RWD9dfm22IiI8jtpPRXsa/nDnC5pG+WInaLa6jKUG
 +PIou50F9gwSf5UNVBu9GXAcm9osLO0frzSqKHARQDWPiDhHG5M6pVpwKFPTXjVLXv
 t8mREyZMHPbJgthkDkV3TJP8uMyeF31CMzaNcAi2sWtQg0YC4u14KJKOInmfHodYS+
 uKIeyZiOTxhMPqo9OLhm4FDaJWcb5JsSYfjxvu6iKctPpLyNEpfgb3CWu1B7CS2jkT
 zzAa4GDWoN5nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YIQ1OSUR
Subject: [Buildroot] [PATCH 2/2] support/testing: new proj runtime test
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
Patch series runtime tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8316072722
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_proj.py | 59 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 support/testing/tests/package/test_proj.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d70e46e8d..1eb2a58502 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1970,6 +1970,7 @@ F:	support/testing/tests/package/test_pigz.py
 F:	support/testing/tests/package/test_postgresql.py
 F:	support/testing/tests/package/test_pppd.py
 F:	support/testing/tests/package/test_pppd/
+F:	support/testing/tests/package/test_proj.py
 F:	support/testing/tests/package/test_pv.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
diff --git a/support/testing/tests/package/test_proj.py b/support/testing/tests/package/test_proj.py
new file mode 100644
index 0000000000..ed23c229fd
--- /dev/null
+++ b/support/testing/tests/package/test_proj.py
@@ -0,0 +1,59 @@
+import os
+
+import infra.basetest
+
+
+class TestProj(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_PROJ=y
+        BR2_PACKAGE_PROJ_APPS=y
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
+        # We check the program can run. The "proj" command does not
+        # have a "--version" option. It will just show its version
+        # when invoked without any argument.
+        self.assertRunOk("proj")
+
+        # The commands in this tests are taken from the Proj
+        # documentation quickstart page, at:
+        # https://proj.org/en/9.5/usage/quickstart.html
+
+        proj_str = "+proj=merc +lat_ts=56.5 +ellps=GRS80"
+        cmd = "echo 55.2 12.2"
+        cmd += f" | proj {proj_str}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_values = [3399483.80, 752085.60]
+        values = list(map(lambda x: float(x), out[0].split()))
+        for i in range(len(expected_values)):
+            self.assertAlmostEqual(values[i], expected_values[i])
+
+        proj_str = "+proj=merc +lat_ts=56.5 +ellps=GRS80 +to +proj=utm +zone=32"
+        cmd = "echo 3399483.80 752085.60"
+        cmd += f" | cs2cs {proj_str}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_values = [6103992.36, 1924052.47, 0.00]
+        values = list(map(lambda x: float(x), out[0].split()))
+        for i in range(len(expected_values)):
+            self.assertAlmostEqual(values[i], expected_values[i])
+
+        proj_str = "+init=epsg:4326 +to +init=epsg:25832"
+        cmd = "echo 56 12"
+        cmd += f" | cs2cs {proj_str}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_values = [6231950.54, 1920310.71, 0.00]
+        values = list(map(lambda x: float(x), out[0].split()))
+        for i in range(len(expected_values)):
+            self.assertAlmostEqual(values[i], expected_values[i])
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
