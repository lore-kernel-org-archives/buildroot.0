Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26391CF2586
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 22:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EACF1407AB;
	Sat, 12 Oct 2024 22:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rg8r91sRB91q; Sat, 12 Oct 2024 22:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 681C8407AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 681C8407AC;
	Sat, 12 Oct 2024 22:15:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42E051BF38D
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 22:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31FD88126A
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 22:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBaWa9MS7hcI for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 22:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96E4981240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96E4981240
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96E4981240
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 22:15:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D7360B0053E;
 Sun, 13 Oct 2024 00:15:35 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 00:15:29 +0200
Message-ID: <20241012221529.91515-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728771337;
 bh=GPYzCXfozqpxNrFYxEEh8KARuaRS/eTLAcqw3neLM7Y=;
 h=From:To:Cc:Subject:Date:From;
 b=bThplRZrvIM2XwU0tm+TcKVljYQhOdCWUTbPReOYgrtwGcGfOlh9rxj35k3c7LKb/
 UmS5XDFmNvD8UbgihZkaDebOVMuRp1+gcSPT7e76j5r6e2IYVUEnNjnsEz0SY2IYGa
 JrUqDFVlkFTZMa1/xTFSFBv71x3AtxYrYtasS5qoeuXJFNZhM9wR1uAnS4jiYDbkx+
 kMIebVVRnJEcn071h+gErZ7Ev1xPm18c8Y2sIfHFyp4estWE0nUv0jCt09Q1Z6YvJ2
 aA/UTQLQGTotLBSO5LAKqFwy1Kul89leKXz4z43lRd7Xd+A/fQwC+t7qtQXCtoj1YI
 LdItIFkExMgDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bThplRZr
Subject: [Buildroot] [PATCH 1/1] support/testing: add rrdtool runtime test
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
https://gitlab.com/jolivain/buildroot/-/jobs/8070566041
---
 DEVELOPERS                                    |   1 +
 support/testing/tests/package/test_rrdtool.py | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 support/testing/tests/package/test_rrdtool.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 44b1947487..e63e9c0ff3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1981,6 +1981,7 @@ F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_python_sympy.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
+F:	support/testing/tests/package/test_rrdtool.py
 F:	support/testing/tests/package/test_rt_tests.py
 F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_sed.py
diff --git a/support/testing/tests/package/test_rrdtool.py b/support/testing/tests/package/test_rrdtool.py
new file mode 100644
index 0000000000..431a867bf2
--- /dev/null
+++ b/support/testing/tests/package/test_rrdtool.py
@@ -0,0 +1,100 @@
+import os
+
+import infra.basetest
+
+
+class TestRRDTool(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_RRDTOOL=y
+        BR2_PACKAGE_RRDTOOL_RRDGRAPH=y
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
+        self.assertRunOk("rrdtool --version")
+
+        # This test sequence is inspired from parts of the RRDTool
+        # tutorial:
+        # https://oss.oetiker.ch/rrdtool/tut/rrdtutorial.en.html
+
+        rrd_file = "test.rrd"
+        data_source = "speed"
+
+        cmd = f"rrdtool create {rrd_file}"
+        cmd += " --start 920804400"
+        cmd += f" DS:{data_source}:COUNTER:600:U:U"
+        cmd += " RRA:AVERAGE:0.5:1:24"
+        cmd += " RRA:AVERAGE:0.5:6:10"
+        self.assertRunOk(cmd)
+
+        # Some data to fill in our database, from the tutorial page.
+        data = [12345, 12357, 12363, 12363, 12363,
+                12373, 12383, 12393, 12399, 12405,
+                12411, 12415, 12420, 12422, 12423]
+        timestamp = 920804700  # timestamp of: Sun Mar  7 12:05:00 PM CET 1999
+
+        # We check we can put our data in the database. We start at
+        # our timestamp, then increase by 5 minutes.
+        for d in data:
+            cmd = f"rrdtool update {rrd_file} {timestamp}:{d}"
+            timestamp += 300
+            self.assertRunOk(cmd)
+
+        # We check we can read back our data.
+        cmd = f"rrdtool fetch {rrd_file}"
+        cmd += " AVERAGE --start 920804400 --end 920809200"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0].strip(), data_source)
+        # We check that at time=920805600 we have speed=0.
+        data_line = next(ln for ln in out if ln.strip().startswith('920805600:'))
+        speed = float(data_line.split(':')[1])
+        self.assertAlmostEqual(speed, 0.)
+
+        # We generate a first simple image graph.
+        cmd = "rrdtool graph speed.png"
+        cmd += " --start 920804400 --end 920808000"
+        cmd += f" DEF:myspeed={rrd_file}:{data_source}:AVERAGE"
+        cmd += " LINE2:myspeed#FF0000"
+        self.assertRunOk(cmd, timeout=20)
+
+        # We check the output file exists and has a size
+        # greater than zero.
+        self.assertRunOk("test -s speed.png")
+
+        # We generate a slightly more complex graph.
+        cmd = "rrdtool graph speed2.png"
+        cmd += " --start 920804400 --end 920808000"
+        cmd += " --vertical-label m/s"
+        cmd += f" DEF:myspeed={rrd_file}:{data_source}:AVERAGE"
+        cmd += " CDEF:realspeed=myspeed,1000,\\*"
+        cmd += " LINE2:realspeed#FF0000"
+        self.assertRunOk(cmd, timeout=20)
+
+        # Again, we check the output file exists.
+        self.assertRunOk("test -s speed2.png")
+
+        # Finally, we generate the last graph, with some rules.
+        cmd = "rrdtool graph speed3.png"
+        cmd += " --start 920804400 --end 920808000"
+        cmd += " --vertical-label km/h"
+        cmd += f" DEF:myspeed={rrd_file}:{data_source}:AVERAGE"
+        cmd += " \"CDEF:kmh=myspeed,3600,*\""
+        cmd += " CDEF:fast=kmh,100,GT,kmh,0,IF"
+        cmd += " CDEF:good=kmh,100,GT,0,kmh,IF"
+        cmd += " HRULE:100#0000FF:\"Maximum allowed\""
+        cmd += " AREA:good#00FF00:\"Good speed\""
+        cmd += " AREA:fast#FF0000:\"Too fast\""
+        self.assertRunOk(cmd, timeout=20)
+
+        # And again, we check the output file exists.
+        self.assertRunOk("test -s speed3.png")
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
