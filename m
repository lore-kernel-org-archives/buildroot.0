Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B89FC3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 13:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6C1F8117F;
	Tue,  2 Jul 2024 13:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CkoXGoF5GEl; Tue,  2 Jul 2024 13:19:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8CD9811A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8CD9811A1;
	Tue,  2 Jul 2024 13:19:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7011A1BF30C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6945740185
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HF7EKBtjYDu for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 13:19:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A496400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A496400D7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A496400D7
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 13:19:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1DEDDB0061D;
 Tue,  2 Jul 2024 15:19:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 15:19:25 +0200
Message-ID: <20240702131925.248165-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719926372;
 bh=UIAhwl24JFExWT9jSIADHLEPScd6nyCyJP368YGwcK8=;
 h=From:To:Cc:Subject:Date:From;
 b=gyp+3d1SXLWP9yIKDiG1Ef6kuldOl711x1uBr9px6J9rNE5NZ4eFN5PyDm6l3FFM+
 YEE8MxvKX9sxgXIXO6WZjvYnuU9glQyaIY7C8dBKzdP41GG8InRll6W/0eCQJCnbPC
 SC7b4q7/iGRnsGHTGn2EfPpadFaf+v7yY/PGfYzJk6aEdjheaIsYpTANGvU/98Wfqa
 00Woh+gqwN7iJfq7we/ARFRf+MALIvRKy9CXaYX5IRX8JN5mgLlSz/U7pp7aMKPqjQ
 EJ5GI7KMt2nfayK4FyGrv57x0H4ymayN39ou2/O2Va6sXPnY9Gy6jJ+yP4SsGFOphl
 LJd5WpiuYcLhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gyp+3d1S
Subject: [Buildroot] [PATCH 1/1] support/testing: new rt-tests runtime test
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
Patch tested on branch master at commit b2c2c48 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    python3 -m flake8 \
        support/testing/tests/package/test_rt_tests.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_rt_tests
    ...
    OK
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_rt_tests.py    | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 support/testing/tests/package/test_rt_tests.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 6d9fcd97dfe..90d1a111ab4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1893,6 +1893,7 @@ F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_python_sympy.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
+F:	support/testing/tests/package/test_rt_tests.py
 F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_sed.py
 F:	support/testing/tests/package/test_socat.py
diff --git a/support/testing/tests/package/test_rt_tests.py b/support/testing/tests/package/test_rt_tests.py
new file mode 100644
index 00000000000..0795d7afd2f
--- /dev/null
+++ b/support/testing/tests/package/test_rt_tests.py
@@ -0,0 +1,39 @@
+import os
+
+import infra.basetest
+
+
+class TestRtTests(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_RT_TESTS=y
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
+        # We cannot easily test realtime properties in a CI/emulator
+        # environment. Instead, this test runs few rt-tests programs
+        # in small scenario configurations (to make sure the execution
+        # will remain short). It just makes sure the execution returns
+        # a success code. Also, to avoid making the logs too big, we
+        # generally pass the "--quiet" option to have a summary at the
+        # end of the execution.
+        test_cmds = [
+            "cyclictest --quiet --loops=200",
+            "hackbench --fds=2 --groups=3 --loops=5",
+            "pi_stress --inversions=100",
+            "ptsematest --quiet --loops=100",
+            "rt-migrate-test --quiet --loops=5",
+            "signaltest --quiet --loops=200",
+            "sigwaittest --quiet --loops=100"
+        ]
+
+        for cmd in test_cmds:
+            self.assertRunOk(cmd)
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
