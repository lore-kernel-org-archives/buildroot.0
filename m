Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4079C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 11:59:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42D46610A0
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 11:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42D46610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB8FC401C2;
	Wed, 27 Oct 2021 11:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Akkt6yJXhJZJ; Wed, 27 Oct 2021 11:59:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33260400EE;
	Wed, 27 Oct 2021 11:59:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 879911BF2F4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 11:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76DE46077E
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 11:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6eCnDIUnBG-y for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 11:59:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95CCF60669
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 11:59:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 176A9879A2; Wed, 27 Oct 2021 11:56:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 13:59:35 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8244ce10ed6ce7de1f180c687784ccfdac07cfe0
X-Git-Newrev: e0518531f693af12829b94fcb1a3377e812b778e
X-Patchwork-Hint: ignore
Message-Id: <20211027115621.176A9879A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/olsr: backport
 upstream patch to fix compat with gpsd 3.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0518531f693af12829b94fcb1a3377e812b778e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Since the update of gpsd to 3.21, olsr was failing to build with:

src/gpsdclient.c: In function 'nmeaInfoFromGpsd':
src/gpsdclient.c:373:14: error: 'struct gps_data_t' has no member named 'status'
  373 |   if (gpsdata->status == STATUS_NO_FIX) {
      |              ^~

This is due to an API change in gpsd. This commit fixes that by
backporting an upstream commit from olsr.

Fixes:

  http://autobuild.buildroot.net/results/d8c5564b24ff5b646cdd786d07b3a45ce5fa01ea/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ddd0330fe1360de5843f72306d2c766e3b4e6124)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...4-pud-adapt-gpsdclient.c-to-new-gpsd-3.21.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/olsr/0004-pud-adapt-gpsdclient.c-to-new-gpsd-3.21.patch b/package/olsr/0004-pud-adapt-gpsdclient.c-to-new-gpsd-3.21.patch
new file mode 100644
index 0000000000..8001343941
--- /dev/null
+++ b/package/olsr/0004-pud-adapt-gpsdclient.c-to-new-gpsd-3.21.patch
@@ -0,0 +1,35 @@
+From 2f9ee6079b20fb5d3884472825a40c5c65550fa2 Mon Sep 17 00:00:00 2001
+From: Nick Hainke <vincent@systemli.org>
+Date: Sun, 30 May 2021 19:13:48 +0200
+Subject: [PATCH] pud: adapt gpsdclient.c to new gpsd 3.21
+
+As mentioned:
+"Move gps_data_t->status to gps_fix_t.status for better fix merging"
+https://gitlab.com/gpsd/gpsd/-/commit/29991d6ffeb41ecfc8297db68bb68be0128c8514
+
+Signed-off-by: Nick Hainke <vincent@systemli.org>
+Upstream: 79a28cdb4083b66c5d3a5f9c0d70dbdc86c0420c
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ lib/pud/src/gpsdclient.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/pud/src/gpsdclient.c b/lib/pud/src/gpsdclient.c
+index 2a7a26ee..a2a9cee0 100644
+--- a/lib/pud/src/gpsdclient.c
++++ b/lib/pud/src/gpsdclient.c
+@@ -370,7 +370,11 @@ void nmeaInfoFromGpsd(struct gps_data_t *gpsdata, NmeaInfo *info, struct GpsdCon
+           );
+ 
+   gpsdata->set &= ~STATUS_SET; /* always valid */
++  #if GPSD_API_MAJOR_VERSION >= 10
++  if (gpsdata->fix.status == STATUS_NO_FIX) {
++  #else
+   if (gpsdata->status == STATUS_NO_FIX) {
++  #endif
+     nmeaInfoClear(info);
+     nmeaTimeSet(&info->utc, &info->present, NULL);
+     return;
+-- 
+2.31.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
