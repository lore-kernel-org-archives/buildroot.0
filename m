Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31E4E7737B
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 17:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86D1841563;
	Sat, 30 Sep 2023 17:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86D1841563
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GpJxE3kYsMkq; Sat, 30 Sep 2023 17:11:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5F94415C8;
	Sat, 30 Sep 2023 17:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5F94415C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0B1A1BF2A7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8928E60B29
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8928E60B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3enTuAZZxUxh for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 17:11:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E5B160AE7
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 17:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E5B160AE7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7081883C24; Sat, 30 Sep 2023 17:11:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 19:11:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9f6da877a7c8b24a79d2c784b31876c270c9cb4
X-Git-Newrev: 4c32b3d9ff8727fd61dbf2d55105c2900f0d2dec
X-Patchwork-Hint: ignore
Message-Id: <20230930171122.7081883C24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/olsr: fix build with gpsd >= 3.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c32b3d9ff8727fd61dbf2d55105c2900f0d2dec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 .checkpackageignore                               |  1 +
 package/olsr/0006-build-patch-for-gpsd-3-25.patch | 31 +++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7ff14366a9..1fd8ca79b2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1007,6 +1007,7 @@ package/olsr/0001-olsrd-migrate-to-using-bison-3.7.1.patch Upstream
 package/olsr/0002-lib-pud-Makefile-fix-parallel-build.patch Upstream
 package/olsr/0003-pud-adapt-to-API-changes-in-gpsd-3-20.patch Upstream
 package/olsr/0005-lib-pud-src-gpsdclient.c-drop-handling-of-gpsdata-fi.patch Upstream
+package/olsr/0006-build-patch-for-gpsd-3-25.patch Upstream
 package/olsr/S50olsr Indent Shellcheck Variables
 package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch Upstream
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
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
