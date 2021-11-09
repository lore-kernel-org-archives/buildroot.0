Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DE9C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:04:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2CBA611C4
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2CBA611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A90814032F;
	Tue,  9 Nov 2021 10:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AwxngRXIYCxi; Tue,  9 Nov 2021 10:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7195240331;
	Tue,  9 Nov 2021 10:04:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EED81BF34A
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E07560732
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1-ZF3SrYhi1 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:03:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 940AD60720
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:03:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2BFB28B7A4; Tue,  9 Nov 2021 09:59:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 10:57:31 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 4a2a410d24da11b0b85787c4a2ac44ca8ef97b5c
X-Git-Newrev: 996616bb397988177be996d860c5ed2a3f4a9b1a
X-Patchwork-Hint: ignore
Message-Id: <20211109095934.2BFB28B7A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/olsr: add
 upstream patch to fix compile with gpsd-3.23.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=996616bb397988177be996d860c5ed2a3f4a9b1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- add upstream patch ([1]) to fix compile with gpsd-3.23.1

Fixes:

  - http://autobuild.buildroot.org/results/53b06e72fb2d8b4c8b6ba41baf775ff33654cd18
  - http://autobuild.buildroot.net/results/54cae924711e26f04045f8208db0d772292a3933

  src/gpsdclient.c: In function 'nmeaInfoFromGpsd':
  src/gpsdclient.c:374:30: error: 'STATUS_NO_FIX' undeclared (first use in this function); did you mean 'STATUS_PPS_FIX'?
    374 |   if (gpsdata->fix.status == STATUS_NO_FIX) {
        |                              ^~~~~~~~~~~~~
        |                              STATUS_PPS_FIX

[1] https://github.com/OLSR/olsrd/commit/665051a845464c0f95edb81432104dac39426f79

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cc54ac17f8060134f93d1b8965d297b3f91e575a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-gpsdclient.c-drop-handling-of-gpsdata-fi.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/olsr/0005-lib-pud-src-gpsdclient.c-drop-handling-of-gpsdata-fi.patch b/package/olsr/0005-lib-pud-src-gpsdclient.c-drop-handling-of-gpsdata-fi.patch
new file mode 100644
index 0000000000..7ea3fbadd7
--- /dev/null
+++ b/package/olsr/0005-lib-pud-src-gpsdclient.c-drop-handling-of-gpsdata-fi.patch
@@ -0,0 +1,49 @@
+From 665051a845464c0f95edb81432104dac39426f79 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 6 Nov 2021 15:50:58 +0100
+Subject: [PATCH] lib/pud/src/gpsdclient.c: drop handling of
+ gpsdata->fix.status
+
+Here is an extract of https://gpsd.gitlab.io/gpsd/gpsd_json.html:
+
+The optional "status" field (aka fix type), is a modifier (adjective) to
+mode. It is not a replacement for, or superset of, the "mode" field. It
+is almost, but not quite, the same as the NMEA 4.x xxGGA GPS Quality
+Indicator Values. Many GNSS receivers do not supply it. Those that do
+interpret the specification in various incompatible ways.
+
+So status field is optional and STATUS_NO_FIX has been explicitly
+renamed into STATUS_UNK to avoid confusion with MODE_NO_FIX (which is
+already handled by gpsdclient.c) so drop the if block to fix the build
+failure with gpsd >= 3.23.1.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream: https://github.com/OLSR/olsrd/commit/665051a845464c0f95edb81432104dac39426f79]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ lib/pud/src/gpsdclient.c | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/lib/pud/src/gpsdclient.c b/lib/pud/src/gpsdclient.c
+index a2a9cee0..d448867d 100644
+--- a/lib/pud/src/gpsdclient.c
++++ b/lib/pud/src/gpsdclient.c
+@@ -370,15 +370,6 @@ void nmeaInfoFromGpsd(struct gps_data_t *gpsdata, NmeaInfo *info, struct GpsdCon
+           );
+ 
+   gpsdata->set &= ~STATUS_SET; /* always valid */
+-  #if GPSD_API_MAJOR_VERSION >= 10
+-  if (gpsdata->fix.status == STATUS_NO_FIX) {
+-  #else
+-  if (gpsdata->status == STATUS_NO_FIX) {
+-  #endif
+-    nmeaInfoClear(info);
+-    nmeaTimeSet(&info->utc, &info->present, NULL);
+-    return;
+-  }
+ 
+   if (!gpsdata->set) {
+     return;
+-- 
+2.33.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
