Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251C5C64EC4
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 16:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC78881EE8;
	Sat,  4 Mar 2023 16:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC78881EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCZUhHMSrV53; Sat,  4 Mar 2023 16:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0177481E39;
	Sat,  4 Mar 2023 16:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0177481E39
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38F4F1BF853
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 16:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D4A760AD4
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 16:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D4A760AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6oMIEJf_2uHO for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 16:31:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59F5160A4F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59F5160A4F
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 16:31:15 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 77B99B0059A;
 Sat,  4 Mar 2023 17:31:10 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 Mar 2023 17:31:01 +0100
Message-Id: <20230304163101.3986363-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304163101.3986363-1-ju.o@free.fr>
References: <20230304163101.3986363-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677947473;
 bh=CZUCxgeInc9YatvjAn8EZIOt4zCTsqLSe2k4RSgM79k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YFNSE29mir0jzCASf7Hf0Q7y1chxuIGRV3x2MVmPuAspAp0uqNdZkbsl0/FUorcby
 41EkRJygHWbm/UfUqmmWobONj9QGR+hBzCpcVEKS8wlGMYg/OQ6O7i0MW8lObyfP6s
 sUGxzuKPKQH6bcD6suRgn2tBEyCm4wb7s+M/g7D105ynCz26XwlKcEllygtHV8rtAu
 t/tYQVTR1IOu+ClBK6+HKOpzy1urMz74Xi3cHpMoyMbl2vQNob2DPUV71PIIwEl0zD
 67gEf0eNrjdYEQUvwMzh4fLbDgowPa2Ej8M/1jac9KgB4wqZwGS5PlJ1c8gEi7byJ8
 AscyryFWk/GSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YFNSE29m
Subject: [Buildroot] [PATCH next 2/2]
 support/testing/tests/package/test_iperf3.py: new runtime test
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
Patch tested on branch next at commit b793f3a with commands:

    python3 -m flake8 support/testing/tests/package/test_iperf3.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_iperf3
    ...
    OK
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_iperf3.py | 23 ++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 support/testing/tests/package/test_iperf3.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d052e59122..f5cbb12631 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1718,6 +1718,7 @@ F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
diff --git a/support/testing/tests/package/test_iperf3.py b/support/testing/tests/package/test_iperf3.py
new file mode 100644
index 0000000000..9aac4c6fd0
--- /dev/null
+++ b/support/testing/tests/package/test_iperf3.py
@@ -0,0 +1,23 @@
+import os
+
+import infra.basetest
+
+
+class TestIperf3(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_IPERF3=y
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
+        self.assertRunOk("iperf3 --version")
+        self.assertRunOk("iperf3 -s -D")
+        self.assertRunOk("iperf3 -c 127.0.0.1 -t 3")
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
