Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B46C48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 19:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A1E640141;
	Fri,  9 Feb 2024 19:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gy2OXU4ZJw89; Fri,  9 Feb 2024 19:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BB124033F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BB124033F;
	Fri,  9 Feb 2024 19:37:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 657651BF318
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 19:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52263421D4
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 19:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZaWg2N1sJl9w for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 19:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E26D421C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E26D421C8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E26D421C8
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 19:37:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 10BD013F81D;
 Fri,  9 Feb 2024 20:37:48 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  9 Feb 2024 20:37:43 +0100
Message-ID: <20240209193743.1204013-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707507469;
 bh=mJjVmM1HICW0hW7scMqQkY3k+kKJFD8gRetczRAAzIE=;
 h=From:To:Cc:Subject:Date:From;
 b=BVGh4Eq14FHQc2D2Qpe6mKzAtkYT7UHvJBfD+YXy4gblMLNFe6VEjKiZi7qaA4uyG
 iN+jlyNtOHv6+aV5LTtj77ccRzpcV1cmIozGp8URft8BLksr6OJF8Ow2kbaPWFYnzi
 rZYYzv8P8FCYqKvXdhN8hicsVJlueTfe2/u0YJqss59NdRKTLQujvUr6RIsSPq2VLO
 t1490n81r6P8kmGRJm0WBkOBfR/2asQS0fTzMirSDjpdn/im1wxqLOSthXxyKbi8Il
 hPqsODwMa8A2NB+kIORSGU/WqV6YSeaAu2H6oOGC/w5PrDNUxXoQx+wrSquNFlH+Ty
 CTg+xpjXEccjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BVGh4Eq1
Subject: [Buildroot] [PATCH 1/1] support/testing: add iozone runtime test
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
 support/testing/tests/package/test_iozone.py | 22 ++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 support/testing/tests/package/test_iozone.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c6c84b05b..45cafc6a03 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1791,6 +1791,7 @@ F:	support/testing/tests/package/test_gnuradio/
 F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_iozone.py
 F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_jq.py
 F:	support/testing/tests/package/test_jq/
diff --git a/support/testing/tests/package/test_iozone.py b/support/testing/tests/package/test_iozone.py
new file mode 100644
index 0000000000..9a9843df56
--- /dev/null
+++ b/support/testing/tests/package/test_iozone.py
@@ -0,0 +1,22 @@
+import os
+
+import infra.basetest
+
+
+class TestIozone(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_IOZONE=y
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
+        self.assertRunOk("iozone -v")
+        self.assertRunOk("iozone -s64 -r4")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
