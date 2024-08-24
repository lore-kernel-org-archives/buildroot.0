Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538ECC52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 16:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5715F4033D;
	Sat, 24 Aug 2024 16:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUR_spWWdN9u; Sat, 24 Aug 2024 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2057402A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2057402A0;
	Sat, 24 Aug 2024 16:25:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 700E21BF5DF
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 16:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EB774010F
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 16:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOgTFNHS0AZn for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 16:25:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E72FA4018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E72FA4018D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E72FA4018D
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 16:25:36 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9E68AB00571;
 Sat, 24 Aug 2024 18:25:32 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 18:25:23 +0200
Message-ID: <20240824162523.356508-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724516733;
 bh=p4Qk4T/NWdu3FrWgRBz7AOqAOckgcXN0T07y9HW43xQ=;
 h=From:To:Cc:Subject:Date:From;
 b=bprZEsNkuqrWOSeq+8nc7FhQg3twcSUBJQtbEe0J5PsQLzP7L4Qs59t4ppj2DSGwZ
 eCnbqxiUOS8R1yR5NORXwSXIpPnI+VN1Yi1sU6vACc21gGmUc4GZpB5wpmWR1avoAc
 r5HRytroaHGJW7AQKl5taq5Tvf7W6+HvaTsOld2puTJzjA1W+HmcINaOyrSF1N4NXE
 J1N0wawSWirj5dO8oLp/4IPx5kpeF/v+wO0D3kdqhWMEnQ9bSj4ivZlmvYkVAPyv/F
 bJv3I2yVzFovOuQFSRa8IOp47CPUrmfndd+xsI7+tcpMjTAJU344gz2k2f2DmxtD+/
 +2bxdBWcRJZLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bprZEsNk
Subject: [Buildroot] [PATCH 1/1] support/testing: add which runtime test
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
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/7658080298
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_which.py | 53 +++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 support/testing/tests/package/test_which.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 426590d5c5..4431927f0b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1972,6 +1972,7 @@ F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_vorbis_tools.py
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
+F:	support/testing/tests/package/test_which.py
 F:	support/testing/tests/package/test_wine.py
 F:	support/testing/tests/package/test_xfsprogs.py
 F:	support/testing/tests/package/test_xfsprogs/
diff --git a/support/testing/tests/package/test_which.py b/support/testing/tests/package/test_which.py
new file mode 100644
index 0000000000..38f528aa7f
--- /dev/null
+++ b/support/testing/tests/package/test_which.py
@@ -0,0 +1,53 @@
+import os
+
+import infra.basetest
+
+
+class TestWhich(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_WHICH=y
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
+        # We check the program can run. This also checks we are using
+        # the actual GNU which, since the BusyBox implementation does
+        # not accept this option.
+        self.assertRunOk("which --version")
+
+        # We check the primary usage is working.
+        out, ret = self.emulator.run("which sh")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "/bin/sh")
+
+        alias_name = "buildoot_test_alias"
+
+        # We check "which" returns an error when the program is not
+        # found.
+        _, ret = self.emulator.run(f"which {alias_name}")
+        self.assertNotEqual(ret, 0)
+
+        # We define a shell alias.
+        alias_cmd = "/bin/true"
+        alias_def = f"{alias_name}='{alias_cmd}'"
+        self.assertRunOk(f"alias {alias_def}")
+
+        # We check our alias definition actually works, just by
+        # invoking it (since it's aliased to "true").
+        self.assertRunOk(alias_name)
+
+        # We check "which" is able to read aliases from the shell.
+        cmd = f"alias | which -i {alias_name}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], alias_def)
+        self.assertEqual(out[1].strip(), alias_cmd)
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
