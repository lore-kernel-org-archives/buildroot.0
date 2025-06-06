Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABBBC61CE7
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 17:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C77178111F;
	Fri,  6 Jun 2025 17:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hT15l9Wps_Mn; Fri,  6 Jun 2025 17:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CECCF8112D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CECCF8112D;
	Fri,  6 Jun 2025 17:57:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BCF51F2
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DE6140B7A
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VN2JIOVExpr0 for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 17:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D8764124A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D8764124A
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:57:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A98383548; Fri,  6 Jun 2025 17:57:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 6 Jun 2025 19:54:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 18b5a86e1b91034350795c22d0941d30d4de86f9
X-Git-Newrev: 9188bf42e4e9adde2fd71242843d9207b33c786f
X-Patchwork-Hint: ignore
Message-Id: <20250606175745.8A98383548@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gpsd: bump to 3.26.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9188bf42e4e9adde2fd71242843d9207b33c786f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://gitlab.com/gpsd/gpsd/-/blob/release-3.26.1/NEWS

Support for RTCM104v2 and v3, as well as for ublox, are now
unconditionally built, so drop our corresponding options. No
needfor legacy options: users that had those enabled will
still get them.

Support for Oceanserver has been dropped upstream, so drop our
option and add legacy handling to infrom users they should
complain upstream if they needed it (very unlikely).

Also, a bug introduced in gpsd 3.26 makes the Buildroot gpsd runtime
test failing. See [1]. As a workaround, this commit also changes
this runtime test to emulate a gps over TCP, instead of UDP.

[1] https://gitlab.com/gpsd/gpsd/-/issues/337

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien:
 - rebased on branch next
 - add gpsd version removing OceanServer option in Config.in.legacy
 - add link to NEWS in commit log
 - switch test_gpsd to use tcp instead of udp
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                     |  7 +++++++
 package/gpsd/Config.in                               | 20 --------------------
 package/gpsd/gpsd.hash                               |  2 +-
 package/gpsd/gpsd.mk                                 | 14 +-------------
 support/testing/tests/package/test_gpsd.py           |  4 ++--
 .../rootfs-overlay/root/{udp-nmea.log => nmea.log}   |  2 +-
 6 files changed, 12 insertions(+), 37 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 563d532604..7cb3d945a1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_GPSD_OCEANSERVER
+	bool "gpsd OceanServer removed upstream"
+	select BR2_LEGACY
+	help
+	  Support for OceanServer has been removed upstream in gpsd
+	  v3.26.
+
 config BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
 	bool "mesa3d OSMesa (Gallium) library support removed"
 	select BR2_LEGACY
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index fa4dc7a814..0848f8181a 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -166,26 +166,11 @@ config BR2_PACKAGE_GPSD_NMEA2000
 	help
 	  NMEA2000/CAN support
 
-config BR2_PACKAGE_GPSD_OCEANSERVER
-	bool "OceanServer"
-	help
-	  OceanServer Digital Compass support
-
 config BR2_PACKAGE_GPSD_ONCORE
 	bool "OnCore"
 	help
 	  OnCore support
 
-config BR2_PACKAGE_GPSD_RTCM104V2
-	bool "RTCM104 v2"
-	help
-	  RTCM104 v2 support
-
-config BR2_PACKAGE_GPSD_RTCM104V3
-	bool "RTCM104 v3"
-	help
-	  RTCM104 v3 support
-
 config BR2_PACKAGE_GPSD_SIRF
 	bool "SiRF"
 	help
@@ -216,11 +201,6 @@ config BR2_PACKAGE_GPSD_TRUE_NORTH
 	help
 	  True North Technologies support
 
-config BR2_PACKAGE_GPSD_UBX
-	bool "UBX"
-	help
-	  uBlox UBX binary support
-
 endif  # GPSD_DAEMON
 
 config BR2_PACKAGE_GPSD_CLIENTS
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index 15e1181ed9..984ddab125 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b368b6a305e3f7a6382d23a0cbfc1d78923060b6b7f54cf7987a73c7b4a9afc2  gpsd-3.25.tar.gz
+sha256  dc7e465968c1540e61bc57c7586d6a57a0047212a014efdad348f907bc2e0990  gpsd-3.26.1.tar.gz
 sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 8f87766dcc..1b20210c49 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.25
+GPSD_VERSION = 3.26.1
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
@@ -120,18 +120,9 @@ endif
 ifneq ($(BR2_PACKAGE_GPSD_NMEA2000),y)
 GPSD_SCONS_OPTS += nmea2000=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_OCEANSERVER),y)
-GPSD_SCONS_OPTS += oceanserver=no
-endif
 ifneq ($(BR2_PACKAGE_GPSD_ONCORE),y)
 GPSD_SCONS_OPTS += oncore=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_RTCM104V2),y)
-GPSD_SCONS_OPTS += rtcm104v2=no
-endif
-ifneq ($(BR2_PACKAGE_GPSD_RTCM104V3),y)
-GPSD_SCONS_OPTS += rtcm104v3=no
-endif
 ifneq ($(BR2_PACKAGE_GPSD_SIRF),y)
 GPSD_SCONS_OPTS += sirf=no
 endif
@@ -150,9 +141,6 @@ endif
 ifneq ($(BR2_PACKAGE_GPSD_TRUE_NORTH),y)
 GPSD_SCONS_OPTS += tnt=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_UBX),y)
-GPSD_SCONS_OPTS += ublox=no
-endif
 
 # Features
 ifeq ($(BR2_PACKAGE_GPSD_SQUELCH),y)
diff --git a/support/testing/tests/package/test_gpsd.py b/support/testing/tests/package/test_gpsd.py
index 2c44e25cec..c232e97d7f 100644
--- a/support/testing/tests/package/test_gpsd.py
+++ b/support/testing/tests/package/test_gpsd.py
@@ -33,7 +33,7 @@ class TestGpsd(infra.basetest.BRTest):
         # We start the "gpsfake" GPS emulator instead.
         cmd = "gpsfake"
         cmd += " --slow --cycle 0.1 --quiet"
-        cmd += " /root/udp-nmea.log &> /dev/null &"
+        cmd += " /root/nmea.log &> /dev/null &"
         self.assertRunOk(cmd)
 
         # Wait a bit, to let the gpsfake and gpsd to settle...
@@ -42,7 +42,7 @@ class TestGpsd(infra.basetest.BRTest):
         # List the GPS devices. We should see our local UDP test GPS.
         out, ret = self.emulator.run("gpsctl")
         self.assertEqual(ret, 0)
-        self.assertTrue(out[0].startswith("udp://127.0.0.1"))
+        self.assertTrue(out[0].startswith("tcp://127.0.0.1"))
         self.assertIn("NMEA0183", out[0])
 
         # Collect some of our fake GPS data, and check we got the
diff --git a/support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log b/support/testing/tests/package/test_gpsd/rootfs-overlay/root/nmea.log
similarity index 92%
rename from support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log
rename to support/testing/tests/package/test_gpsd/rootfs-overlay/root/nmea.log
index f3730da7c5..d063ef1ef9 100644
--- a/support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log
+++ b/support/testing/tests/package/test_gpsd/rootfs-overlay/root/nmea.log
@@ -1,5 +1,5 @@
 # Name: NMEA 0183 messages for gpsd Buildroot test
-# Transport: UDP
+# Transport: TCP
 # For packet format, see:
 # https://gpsd.gitlab.io/gpsd/NMEA.html
 $GPGGA,123456.789,4336.2634,N,0126.6016,E,1,04,1.7,143.5,M,,,,*3A
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
