Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F99C83F25
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 13:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3209419A5;
	Thu, 29 Aug 2024 13:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1s0Wt5BQTTb; Thu, 29 Aug 2024 13:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16C93419C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16C93419C7;
	Thu, 29 Aug 2024 13:43:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45C151BF8B4
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAD6E40118
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLWK5UhLwe40 for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 13:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E618401BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E618401BA
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 13:43:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C3B48669C; Thu, 29 Aug 2024 13:43:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 15:38:30 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: fcaba8e25fc25a6f9f8f82d020aa2e1eb5a5ee51
X-Git-Newrev: fa2f8886dfb822cce96c3fa25d6b0e2fdb737245
X-Patchwork-Hint: ignore
Message-Id: <20240829134333.6C3B48669C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] support/testing: add gpsd
 runtime testing
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fa2f8886dfb822cce96c3fa25d6b0e2fdb737245
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9c8f6dc5e4d7244b493e290c055202cadc9a12cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_gpsd.py         | 56 ++++++++++++++++++++++
 .../test_gpsd/rootfs-overlay/root/udp-nmea.log     |  6 +++
 3 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ec3b49e2d0..12379434e1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1833,6 +1833,8 @@ F:	support/testing/tests/package/test_gnuplot.py
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
