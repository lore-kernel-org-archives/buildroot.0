Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CB0C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 09:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B93DE416E3;
	Fri, 17 Mar 2023 09:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B93DE416E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VG0aowf2V6kq; Fri, 17 Mar 2023 09:20:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E774033D;
	Fri, 17 Mar 2023 09:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95E774033D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A48281BF2FE
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 09:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EC0D8219C
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 09:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EC0D8219C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZoXU8XIx_Bo for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 09:20:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA10D81FE2
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 09:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA10D81FE2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9EF5874FA; Fri, 17 Mar 2023 09:20:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 09:53:38 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 75693dbdd01a3a9fbb486b1603edee9e054ad640
X-Git-Newrev: 5ca621375ab5885ad3de1dfa6d88bbcd19bce0e5
X-Patchwork-Hint: ignore
Message-Id: <20230317092052.A9EF5874FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/nut: ensure
 time_t is defined
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ca621375ab5885ad3de1dfa6d88bbcd19bce0e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Ensure time_t is defined to fix the following collectd build failure on
musl:

src/nut.c:40:2: error: #error "Unable to determine the UPS connection type."
   40 | #error "Unable to determine the UPS connection type."
      |  ^~~~~
src/nut.c:46:3: error: unknown type name 'collectd_upsconn_t'
   46 |   collectd_upsconn_t *conn;
      |   ^~~~~~~~~~~~~~~~~~

libupsclient is an optional dependency of nut plugin since version
5.10.0 of collectd and
https://github.com/collectd/collectd/commit/bc2d94024d0250211c1e498db1b43bb4525324da

Fixes:
 - http://autobuild.buildroot.org/results/22b758097e8fb72c68e41329cbc7abc748d81ca6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 02c8901791d8d65094ecf56d9773babe74dd1845)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ents-upsclient-h-ensure-time_t-is-defined.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch b/package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch
new file mode 100644
index 0000000000..c9fb04b8cd
--- /dev/null
+++ b/package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch
@@ -0,0 +1,35 @@
+From cafd77993ec5e16634b774b65bf6da9b34a21fc5 Mon Sep 17 00:00:00 2001
+From: Jim Klimov <jimklimov+nut@gmail.com>
+Date: Wed, 31 Aug 2022 11:24:19 +0200
+Subject: [PATCH] clients/upsclient.h: ensure time_t is defined
+
+[Retrieved from:
+https://github.com/networkupstools/nut/commit/cafd77993ec5e16634b774b65bf6da9b34a21fc5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ clients/upsclient.h | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/clients/upsclient.h b/clients/upsclient.h
+index 08574b8f8b..e346d8f519 100644
+--- a/clients/upsclient.h
++++ b/clients/upsclient.h
+@@ -41,6 +41,18 @@
+ 	#include <limits.h>
+ #endif
+ 
++/* Not including NUT timehead.h because this is part of end-user API */
++#ifdef TIME_WITH_SYS_TIME
++# include <sys/time.h>
++# include <time.h>
++#else
++# ifdef HAVE_SYS_TIME_H
++#  include <sys/time.h>
++# else
++#  include <time.h>
++# endif
++#endif
++
+ #ifdef __cplusplus
+ /* *INDENT-OFF* */
+ extern "C" {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
