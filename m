Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6207BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 12:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF019402D4;
	Sat, 10 Dec 2022 12:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF019402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXftbiXoKdqR; Sat, 10 Dec 2022 12:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0244440184;
	Sat, 10 Dec 2022 12:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0244440184
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC5211BF399
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 12:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4F1C40184
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 12:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4F1C40184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g_usvrjJUZjX for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 12:31:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEC15400DC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEC15400DC
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:31:07 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.222.34])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 46F9913F8C6;
 Sat, 10 Dec 2022 13:31:01 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:30:48 +0100
Message-Id: <20221210123048.306724-2-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210123048.306724-1-ju.o@free.fr>
References: <20221210123048.306724-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670675465;
 bh=nVKUbboDTE+QPya4x+Wqjyo7+VKNtI+LgAAOaEYVy/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uK0lowZ/jehTQOaeIDOjzl/FyIp7nmr+5xDI53/ZPXrUTBIciIrspv8zkP/aSo1Xy
 ujBfzOslDbLc02mOGvz0o5xo0Dowx4j6MuMRbguLMM/H5w1AXMMRK/d2XNPeV8KxXj
 vFIQIoKZnUmGBHtMH/vRqwLt2p+Rr7BBZZ8IIUy3gd4Bl0KknMy2P4K9oWAZa18Zgs
 2Q9zw8wwlbV3MAi1riaOn+xJzFma8McQmnQgvxKMgVUXehKu54INjZuinU/PMw4fkF
 hhYcEDLVQEVUs+v62V8S9JBqNd8iKm1GxXuemgenR45gI1kX7oeJduwRvR9l8S0XMB
 RUirQgYlFJOAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uK0lowZ/
Subject: [Buildroot] [PATCH 2/2] support/testing/tests/package/test_ncdu.py:
 new runtime test
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
Cc: Bogdan Radulescu <bogdan@nimblex.net>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested on master branch at commit 4744cfb with commands:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8  support/testing/tests/package/test_ncdu.py
    [no-output]

    ./utils/test-pkg -p ncdu
    ...
    6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_ncdu.TestNcdu
    ...
    OK
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_ncdu.py | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 support/testing/tests/package/test_ncdu.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 20677ef8ce..04047d43da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1683,6 +1683,7 @@ F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/support/testing/tests/package/test_ncdu.py b/support/testing/tests/package/test_ncdu.py
new file mode 100644
index 0000000000..cbbb27f751
--- /dev/null
+++ b/support/testing/tests/package/test_ncdu.py
@@ -0,0 +1,23 @@
+import os
+
+import infra.basetest
+
+
+class TestNcdu(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_NCDU=y
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
+        self.assertRunOk("ncdu --version")
+        self.assertRunOk("ncdu -x -o /tmp/ncdu.list /")
+        self.assertRunOk("grep -F '\"name\":\"ncdu\"' /tmp/ncdu.list")
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
