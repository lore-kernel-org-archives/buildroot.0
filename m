Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE6BC52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 14:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8042A605BD;
	Sat, 24 Aug 2024 14:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIgE7oNSTt9Z; Sat, 24 Aug 2024 14:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A278605C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A278605C7;
	Sat, 24 Aug 2024 14:19:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A44F11BF329
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 14:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92DB6605C7
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 14:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOwJHmDaLi1a for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 14:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69E8F605BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69E8F605BD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69E8F605BD
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 14:19:45 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2A78DB00592;
 Sat, 24 Aug 2024 16:19:41 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 16:19:35 +0200
Message-ID: <20240824141935.209950-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724509182;
 bh=ePySCRqFYPzis5pBq3U3Dc3bFXP59CivZ8TSiC0v0oc=;
 h=From:To:Cc:Subject:Date:From;
 b=dF9XbU6CHhPzSQNX8qdtvuECwWqD4XD2wzdnXmwmXZsHTrxSp7amlGCzA96Oo1upK
 pgebIaDSFs9b/Zrjvy9Qu/64LpHiO+vwqJjcxBAbJjU+fLrvhGretZKklbbED9yTvH
 sKY74KFmkluiVF2EdPe5WkRy/ijNEpxpnFDsWChmFA9MfejxCU3UcBjQzuRX5q36DZ
 y7eud41zwSiz/bQqGb9AyKiA67tswkZVQ+qvBLvHEPIjwePUE509S4aVZg5mFLyS9H
 UJTi4lFUhDabH3W+eozRkwo5Qt86cKEhO8oDaGV8xqqQiUKf9rr1O7dd+REj3JZJ4X
 xNNW9KYXDNpnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dF9XbU6C
Subject: [Buildroot] [PATCH 1/1] support/testing: add pv runtime test
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
https://gitlab.com/jolivain/buildroot/-/jobs/7657843473
---
 DEVELOPERS                               |  1 +
 support/testing/tests/package/test_pv.py | 57 ++++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 support/testing/tests/package/test_pv.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 426590d5c5..419c3e75ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1937,6 +1937,7 @@ F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_pigz.py
 F:	support/testing/tests/package/test_postgresql.py
+F:	support/testing/tests/package/test_pv.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_hkdf.py
diff --git a/support/testing/tests/package/test_pv.py b/support/testing/tests/package/test_pv.py
new file mode 100644
index 0000000000..cfa3c29392
--- /dev/null
+++ b/support/testing/tests/package/test_pv.py
@@ -0,0 +1,57 @@
+import os
+
+import infra.basetest
+
+
+class TestPv(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_PV=y
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
+        # We check the program can run.
+        self.assertRunOk("pv --version")
+
+        # We check that "pv" works like the "cat" command. We print a
+        # message on its standard input and redirect its output to a
+        # file. We also force the pv terminal width to 80, since
+        # "infra.emulator" is setting a large width to prevent
+        # line wrapping.
+        msg = "Hello Buildroot!"
+        out_file = "/tmp/out.txt"
+        cmd = f"echo '{msg}' | pv -w80 > {out_file}"
+        self.assertRunOk(cmd)
+
+        # We check the pv output file contains exactly our message.
+        cmd = f"cat {out_file}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # Finally, we check that "pv" correctly shows a progress
+        # bar. We print few lines, one per second into "pv" setup in
+        # line mode. We check the last pv status line contains the
+        # correct count and a "100%" string that shows completion.
+        lines = 5
+        print_ln_cmd = f"( for X in $(seq {lines}) ; do echo $X ; sleep 1 ; done )"
+        cmd = f"{print_ln_cmd} | pv -s{lines} -l -w80 > /dev/null"
+        out, ret = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        # pv updates status may contain extra spaces, and is updated
+        # with carriage return characters. We strip lines and filter
+        # out empty remaining lines, to make sure we get the last
+        # meaningful status line.
+        pv_out = [ln.strip() for ln in out]
+        pv_out = [ln for ln in pv_out if ln]
+        last_line = pv_out[-1]
+        self.assertTrue(last_line.startswith(str(lines)))
+        self.assertTrue(last_line.endswith("100%"))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
