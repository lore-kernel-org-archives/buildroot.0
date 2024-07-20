Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F79CC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 17:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FAF06073D;
	Sat, 20 Jul 2024 17:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OT4BjvUYzMTs; Sat, 20 Jul 2024 17:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 146D56073A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 146D56073A;
	Sat, 20 Jul 2024 17:38:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 218B01BF359
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 17:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E21881D4F
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 17:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-pvE0QHUEMn for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 17:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A47E481D46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A47E481D46
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A47E481D46
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 17:38:43 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 347E8B00535;
 Sat, 20 Jul 2024 19:38:39 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 19:38:34 +0200
Message-ID: <20240720173834.302209-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1721497120;
 bh=h/ly2DU8GV3Ms0Ia3u/u1XI8hqptaUOsp8n/pNc+xEU=;
 h=From:To:Cc:Subject:Date:From;
 b=LyIrXqT0XMtm/w8cSjjYPiP6MpYQvtLkYiHRQY1LzFwsmyDlUDfj4CXz+xIktztGP
 4S9sI3AI56IFkECSNs6iQTjMvqBCOia6nr4pIMNcPEfEzYZalcFhvUjRPt8yIYaHBt
 1ux4HRqLuO6jZ0HNraRAOq6OYnbYT2bhp3xCpSdihiilbLW5ZfDtB58ZYn2HswnyoR
 OLwSuqYtnmDTjujaIwI/uKmQ3Y32fS49tBqVjiioc8rBeB7NgZX9yLvBzG6b6F1byq
 5W9yHiIQqCU6htmxs/vay+JXIf/pVlv0Y/bAFR9PKEkMHiyQ0t+JgeOSFBma2uk+Q3
 a3Z2Llxd3kIlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LyIrXqT0
Subject: [Buildroot] [PATCH 1/1] support/testing: add gpsd runtime testing
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
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_gpsd.py    | 56 +++++++++++++++++++
 .../rootfs-overlay/root/udp-nmea.log          |  6 ++
 3 files changed, 64 insertions(+)
 create mode 100644 support/testing/tests/package/test_gpsd.py
 create mode 100644 support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log

diff --git a/DEVELOPERS b/DEVELOPERS
index c4f1565edd..5495f7a3f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1870,6 +1870,8 @@ F:	support/testing/tests/package/test_gnuplot.py
 F:	support/testing/tests/package/test_gnuplot/
 F:	support/testing/tests/package/test_gnuradio.py
 F:	support/testing/tests/package/test_gnuradio/
+F:	support/testing/tests/package/test_gpsd.py
+F:	support/testing/tests/package/test_gpsd/
 F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
diff --git a/support/testing/tests/package/test_gpsd.py b/support/testing/tests/package/test_gpsd.py
new file mode 100644
index 0000000000..deed586c17
--- /dev/null
+++ b/support/testing/tests/package/test_gpsd.py
@@ -0,0 +1,56 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestGpsd(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_gpsd/rootfs-overlay")
+    # This test is using the gpsfake Python script.
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_GPSD=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
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
+        # We check the program can execute.
+        self.assertRunOk("gpsd --version")
+
+        # Since gpsd needs a real GPS device, we stop the service.
+        self.assertRunOk("/etc/init.d/S50gpsd stop")
+
+        # We start the "gpsfake" GPS emulator instead.
+        cmd = "gpsfake"
+        cmd += " --slow --cycle 0.1 --quiet"
+        cmd += "/root/udp-nmea.log &> /dev/null &"
+        self.assertRunOk(cmd)
+
+        # Wait a bit, to let the gpsfake and gpsd to settle...
+        time.sleep(3 * self.timeout_multiplier)
+
+        # List the GPS devices. We should see our local UDP test GPS.
+        out, ret = self.emulator.run("gpsctl")
+        self.assertEqual(ret, 0)
+        self.assertTrue(out[0].startswith("udp://127.0.0.1"))
+        self.assertIn("NMEA0183", out[0])
+
+        # Collect some of our fake GPS data, and check we got the
+        # coordinates from our test data file.
+        # Our expected coordinates are:
+        # https://www.openstreetmap.org/#map=19/43.60439/1.44336
+        out, ret = self.emulator.run("gpscsv --header 0 --count 3")
+        self.assertEqual(ret, 0)
+        _, gps_lat, gps_long, _ = out[0].split(",")
+        self.assertAlmostEqual(float(gps_lat), 43.60439)
+        self.assertAlmostEqual(float(gps_long), 1.44336)
diff --git a/support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log b/support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log
new file mode 100644
index 0000000000..f3730da7c5
--- /dev/null
+++ b/support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log
@@ -0,0 +1,6 @@
+# Name: NMEA 0183 messages for gpsd Buildroot test
+# Transport: UDP
+# For packet format, see:
+# https://gpsd.gitlab.io/gpsd/NMEA.html
+$GPGGA,123456.789,4336.2634,N,0126.6016,E,1,04,1.7,143.5,M,,,,*3A
+$GPZDA,123456.789,20,07,2024,2,00*64
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
