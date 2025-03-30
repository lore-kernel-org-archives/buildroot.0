Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2C7C36011
	for <buildroot@archiver.kernel.org>; Sun, 30 Mar 2025 14:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 238014056C;
	Sun, 30 Mar 2025 14:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 339N4lvdlzeF; Sun, 30 Mar 2025 14:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F6CF4057D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F6CF4057D;
	Sun, 30 Mar 2025 14:20:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2316812A
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 14:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01C334057D
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 14:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAA3Gl4X76vJ for <buildroot@buildroot.org>;
 Sun, 30 Mar 2025 14:20:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 025FD4056C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 025FD4056C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 025FD4056C
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 14:20:39 +0000 (UTC)
Received: from home.juju.sh (unknown [82.64.214.120])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C2D21B00565;
 Sun, 30 Mar 2025 16:20:35 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 30 Mar 2025 16:20:31 +0200
Message-ID: <20250330142031.919525-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743344437;
 bh=GNS/TXxUrCjoZQZzKc4meWvQ5VdlGGDjdXbGbO3q34g=;
 h=From:To:Cc:Subject:Date:From;
 b=p0dk3rsq9gB1ntaCGCgt2t3Q63HWT4EZAo80WQMNNNOnxcCB3l1xdZU2M1LImg4BN
 GQ4GTH+XVcvHi9cdpv4Dxqua6+FKNkGLsdsxNHfPWIhYbnautWYj8SzQyMpvpGyfFL
 idpmE+1e/My97FFHhP4es4MxEZTR6pPUzMRbcttuAPNjoiROLAgtf81q2iX8HQyvfK
 ClqaMwplycNiPD1svte+8OcqJ66k0mDpHyLjXqWbcm8veF4vberGBSM+P0yQvCXZNl
 7o7HhoOSua66GJ8oi/mHshAjKgm2iQzBegpaVjf7T89jeDz+wWhJucMAuxj6JrGC1v
 iMKNIpPV19k7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p0dk3rsq
Subject: [Buildroot] [PATCH 1/1] support/testing: new hyperfine runtime test
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
https://gitlab.com/jolivain/buildroot/-/jobs/9568780110
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_hyperfine.py   | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 support/testing/tests/package/test_hyperfine.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 44f7684c97..13c630432f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1914,6 +1914,7 @@ F:	support/testing/tests/package/test_gstreamer1.py
 F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_hyperfine.py
 F:	support/testing/tests/package/test_iozone.py
 F:	support/testing/tests/package/test_iperf.py
 F:	support/testing/tests/package/test_iperf3.py
diff --git a/support/testing/tests/package/test_hyperfine.py b/support/testing/tests/package/test_hyperfine.py
new file mode 100644
index 0000000000..4db62c7116
--- /dev/null
+++ b/support/testing/tests/package/test_hyperfine.py
@@ -0,0 +1,25 @@
+import os
+
+import infra.basetest
+
+
+class TestHyperfine(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_HYPERFINE=y
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
+        self.assertRunOk("hyperfine --version")
+
+        test_cmd = "sleep 0.1"
+        cmd = f"hyperfine --style basic --runs 10 '{test_cmd}'"
+        self.assertRunOk(cmd, timeout=15)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
