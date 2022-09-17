Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE57C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6318E402FE;
	Sat, 17 Sep 2022 09:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6318E402FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKvmxu1aTOS6; Sat, 17 Sep 2022 09:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C87F401CC;
	Sat, 17 Sep 2022 09:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C87F401CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7CB21BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91BFA84316
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91BFA84316
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7QQcy85lbj9f for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:56:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85DC184317
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85DC184317
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 73C1F8416C; Sat, 17 Sep 2022 09:56:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 11:56:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a99f1ee0f68035530247b3dfc1c054eb23549403
X-Git-Newrev: 05595cbeace38789a8727623d4b5b107e6157a2c
X-Patchwork-Hint: ignore
Message-Id: <20220917095638.73C1F8416C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: bump to 3.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=05595cbeace38789a8727623d4b5b107e6157a2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 3.24, the NTRIP and NMEA0183 drivers are now always enabled, so the
configure options ntrip and nmea0183 have been removed (upstream commits
f8cf4c922 and 838220fee respectively).

As a consequence, drop the options in menuconfig. We do not need to add
legacy support for those options. Indeed, users who had those enabled
will still get the feature, and those who did not will get them, in both
cases without loss of feature.

Finally, we need to fix a runtime issue that makes the kernel segfault
(yeah, that much), because upstream has been yoda-ifying their code, and
they actually borked a comparison. The issue has been fixed upstream,
but that is in a patch tha cobbles up many changes and brings new stuff,
so we just fix the issue with an unupstreamable patch (which we can drop
when we bump when upstream tags a newer release and we update).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpsd/0001-gpsctl-fix-yodaification.patch | 44 ++++++++++++++++++++++++
 package/gpsd/Config.in                           | 16 ---------
 package/gpsd/gpsd.hash                           |  2 +-
 package/gpsd/gpsd.mk                             | 11 +-----
 4 files changed, 46 insertions(+), 27 deletions(-)

diff --git a/package/gpsd/0001-gpsctl-fix-yodaification.patch b/package/gpsd/0001-gpsctl-fix-yodaification.patch
new file mode 100644
index 0000000000..753ff300eb
--- /dev/null
+++ b/package/gpsd/0001-gpsctl-fix-yodaification.patch
@@ -0,0 +1,44 @@
+From 72ae7ce646792b07061cbbb31ed47f55a1d2422c Mon Sep 17 00:00:00 2001
+Message-Id: <72ae7ce646792b07061cbbb31ed47f55a1d2422c.1663075350.git.yann.morin@orange.com>
+From: "Yann E. MORIN" <yann.morin@orange.com>
+Date: Tue, 13 Sep 2022 15:10:48 +0200
+Subject: [PATCH] gpsctl: fix yodaification
+
+Commit d5a672abd98a (gpsctl.c: Style tweaks.  Yoda style, braces, //
+comments.) claimed "No functional changes", but mis-treated a comparison
+when it was converted to yoda-style (simplified diff):
+
+    -    if (write(gpsdata->gps_fd, buf, strlen(buf)) <= 0) {
+    +    if (0 <= write(gpsdata->gps_fd, buf, strlen(buf))) {
+
+As one may notice, the comparison operator was not reversed while the
+operands were.
+
+This got silently fixed in commit 3219ab9f6a89 (gpsctl.c: First cut at
+--ship sending commands to running gpsd.) but this is completely
+unrelated.
+
+Fix that comparison.
+
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+Upstream status: not applicable as already fixed.
+---
+ gpsctl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gpsctl.c b/gpsctl.c
+index cb342af87..ef59a6622 100644
+--- a/gpsctl.c
++++ b/gpsctl.c
+@@ -96,7 +96,7 @@ static bool gps_query(struct gps_data_t *gpsdata,
+     if ('\n' != buf[strnlen(buf, sizeof(buf) - 1) - 1]) {
+         (void)strlcat(buf, "\n", sizeof(buf));
+     }
+-    if (0 <= write(gpsdata->gps_fd, buf, strnlen(buf, sizeof(buf)))) {
++    if (0 >= write(gpsdata->gps_fd, buf, strnlen(buf, sizeof(buf)))) {
+         GPSD_LOG(LOG_ERROR, &context.errout, "gps_query(), write failed\n");
+         return false;
+     }
+-- 
+2.25.1
+
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 126a907aa2..8c28c05efd 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -154,22 +154,11 @@ config BR2_PACKAGE_GPSD_ITRAX
 	help
 	  iTrax support
 
-config BR2_PACKAGE_GPSD_MTK3301
-	bool "MTK-3301"
-	help
-	  Mediatek MTK-3301 support
-
 config BR2_PACKAGE_GPSD_NAVCOM
 	bool "Navcom"
 	help
 	  Navcom binary support
 
-config BR2_PACKAGE_GPSD_NMEA
-	bool "NMEA"
-	default y
-	help
-	  Generic NMEA support
-
 config BR2_PACKAGE_GPSD_NMEA2000
 	bool "NMEA2000"
 	select BR2_PACKAGE_GPSD_NAVCOM
@@ -177,11 +166,6 @@ config BR2_PACKAGE_GPSD_NMEA2000
 	help
 	  NMEA2000/CAN support
 
-config BR2_PACKAGE_GPSD_NTRIP
-	bool "NTRIP"
-	help
-	  NTRIP support
-
 config BR2_PACKAGE_GPSD_OCEANSERVER
 	bool "OceanServer"
 	help
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index 6d93e7b553..f415c3af0f 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0b991ce9a46538c4ea450f7a8ee428ff44fb4f8d665fddf2ffe40fe0ae9a6c09  gpsd-3.23.1.tar.gz
+sha256  00ee13f615655284874a661be13553abe66128e6deb5cd648af9bc0cb345fe5c  gpsd-3.24.tar.gz
 sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index dec2371f68..0c7018f26d 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.23.1
+GPSD_VERSION = 3.24
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
@@ -115,15 +115,6 @@ endif
 ifneq ($(BR2_PACKAGE_GPSD_ITRAX),y)
 GPSD_SCONS_OPTS += itrax=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_MTK3301),y)
-GPSD_SCONS_OPTS += mtk3301=no
-endif
-ifneq ($(BR2_PACKAGE_GPSD_NMEA),y)
-GPSD_SCONS_OPTS += nmea0183=no
-endif
-ifneq ($(BR2_PACKAGE_GPSD_NTRIP),y)
-GPSD_SCONS_OPTS += ntrip=no
-endif
 ifneq ($(BR2_PACKAGE_GPSD_NAVCOM),y)
 GPSD_SCONS_OPTS += navcom=no
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
