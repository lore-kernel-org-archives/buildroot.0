Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2708ECDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCA0280B88;
	Fri, 13 Oct 2023 06:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCA0280B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2w3vDVy9E0y; Fri, 13 Oct 2023 06:25:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3E9682438;
	Fri, 13 Oct 2023 06:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3E9682438
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 588DC1BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34F3941C22
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34F3941C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1TXyEyXR6HDb for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7E06418AB
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7E06418AB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7202846C2; Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 08:13:15 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1c00ef0684ab83b1af01397e78bb30dcda51df95
X-Git-Newrev: 40f8284dd627910603ce86cdc79691dd3df214f2
X-Patchwork-Hint: ignore
Message-Id: <20231013062403.A7202846C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/olsr: fix build
 with gpsd >= 3.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=40f8284dd627910603ce86cdc79691dd3df214f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure with gpsd >= 3.25 raised since commit
3c7fece853f3def9a425eccc384b9dacb1010051:

In file included from src/configuration.h:50,
                 from src/configuration.c:46:
src/gpsdclient.h:64:8: error: redefinition of 'struct fixsource_t'
   64 | struct fixsource_t {
      |        ^~~~~~~~~~~
In file included from src/gpsdclient.h:49,
                 from src/configuration.h:50,
                 from src/configuration.c:46:
/tmp/instance-17/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/gps.h:2714:8: note: originally defined here
 2714 | struct fixsource_t
      |        ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/47a619686bb47debd525c92aa7e14bee5c40ca9e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4c32b3d9ff8727fd61dbf2d55105c2900f0d2dec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/olsr/0006-build-patch-for-gpsd-3-25.patch | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/olsr/0006-build-patch-for-gpsd-3-25.patch b/package/olsr/0006-build-patch-for-gpsd-3-25.patch
new file mode 100644
index 0000000000..c82bc1bb28
--- /dev/null
+++ b/package/olsr/0006-build-patch-for-gpsd-3-25.patch
@@ -0,0 +1,31 @@
+From 17d583258969c1d182361e0e168b3cad79ef64e6 Mon Sep 17 00:00:00 2001
+From: Rui Chen <rui@chenrui.dev>
+Date: Mon, 16 Jan 2023 18:35:32 -0500
+Subject: [PATCH] build: patch for gpsd 3.25
+
+Signed-off-by: Rui Chen <rui@chenrui.dev>
+[Retrieved from: https://github.com/OLSR/olsrd/pull/119]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/pud/src/gpsdclient.h | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/lib/pud/src/gpsdclient.h b/lib/pud/src/gpsdclient.h
+index 061056b12..a51dd2211 100644
+--- a/lib/pud/src/gpsdclient.h
++++ b/lib/pud/src/gpsdclient.h
+@@ -60,14 +60,6 @@ struct GpsdConnectionState {
+     struct devconfig_t dev[MAXUSERDEVS];
+ };
+ 
+-/* describe a data source */
+-struct fixsource_t {
+-    char spec[PATH_MAX]; /* working space, will be modified */
+-    char *server; /* pointer into spec field */
+-    char *port; /* pointer into spec field */
+-    char *device; /* pointer into spec field */
+-};
+-
+ /**
+  * The gpsd daemon spec
+  */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
