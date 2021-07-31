Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AD0C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 21:51:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A5BE60F48
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 21:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A5BE60F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC505607B0;
	Sat, 31 Jul 2021 21:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CGq07dXk9jo6; Sat, 31 Jul 2021 21:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F7AA607AB;
	Sat, 31 Jul 2021 21:51:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 630791BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 21:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 510134014C
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 21:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xq1U59KESwLI for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 21:51:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61957400C3
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 21:51:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9AB768A394; Sat, 31 Jul 2021 21:51:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 23:50:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28c118814dbc394a4600f025b8e0f0f38b0d9eae
X-Git-Newrev: ddd0330fe1360de5843f72306d2c766e3b4e6124
X-Patchwork-Hint: ignore
Message-Id: <20210731215120.9AB768A394@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/olsr: backport upstream patch to
 fix compat with gpsd 3.21
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ddd0330fe1360de5843f72306d2c766e3b4e6124
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
