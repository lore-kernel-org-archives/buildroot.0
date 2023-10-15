Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ED2CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28196414EC;
	Sun, 15 Oct 2023 20:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28196414EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4h_3v1Ayh5W; Sun, 15 Oct 2023 20:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCF2A414F1;
	Sun, 15 Oct 2023 20:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCF2A414F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 230FD1BF8C7
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF85160F44
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF85160F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Jp2nL0JoD2g for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:13:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0F0960F2D
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F0960F2D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDBC285A8B; Sun, 15 Oct 2023 20:13:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:10:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea3ee730cfd5ed55d8c54289fdaeb629c0e37673
X-Git-Newrev: 828bb54c6dba795db3d71c2de42870bd77a32f68
X-Patchwork-Hint: ignore
Message-Id: <20231015201321.CDBC285A8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-utils: Fix musl build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=828bb54c6dba795db3d71c2de42870bd77a32f68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build error was introduced when bumping alsa-utils to 1.2.10
with buildroot commit f7ae22240bac0300961fa60c7d684b6584d7a631

Fixes:
http://autobuild.buildroot.net/results/5a0/5a03cba08bf24d61c816b8e2f257c18004bad3d7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0009-topology-include-locale.h.patch           | 33 ++++++++++++++++++++++
 ...0010-nhlt-dmic-info.c-include-sys-types.h.patch | 33 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/package/alsa-utils/0009-topology-include-locale.h.patch b/package/alsa-utils/0009-topology-include-locale.h.patch
new file mode 100644
index 0000000000..14a059cbf6
--- /dev/null
+++ b/package/alsa-utils/0009-topology-include-locale.h.patch
@@ -0,0 +1,33 @@
+From 8c229270f6bae83b705a03714c46067a7aa57b02 Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Date: Tue, 19 Sep 2023 13:14:29 +0200
+Subject: [PATCH] topology: include locale.h
+
+This solves an issue compiling with the musl libc.
+
+Fixes: https://github.com/alsa-project/alsa-utils/issues/239
+Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-utils/commit/8c229270f6bae83b705a03714c46067a7aa57b02
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ topology/topology.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/topology/topology.c b/topology/topology.c
+index 1840ffe..5d03a8b 100644
+--- a/topology/topology.c
++++ b/topology/topology.c
+@@ -32,6 +32,7 @@
+ #include <sys/stat.h>
+ #include <getopt.h>
+ #include <assert.h>
++#include <locale.h>
+ 
+ #include <alsa/asoundlib.h>
+ #include <alsa/topology.h>
+-- 
+2.39.2
+
diff --git a/package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch b/package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch
new file mode 100644
index 0000000000..b5f8489703
--- /dev/null
+++ b/package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch
@@ -0,0 +1,33 @@
+From 0925ad7f09b2dc77015784f9ac2f5e34dd0dd5c3 Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Date: Tue, 19 Sep 2023 13:14:30 +0200
+Subject: [PATCH] nhlt-dmic-info.c: include sys/types.h
+
+This fixes an issue compiling with the musl libc.
+
+Fixes: https://github.com/alsa-project/alsa-utils/issues/238
+Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-utils/commit/0925ad7f09b2dc77015784f9ac2f5e34dd0dd5c3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nhlt/nhlt-dmic-info.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/nhlt/nhlt-dmic-info.c b/nhlt/nhlt-dmic-info.c
+index 3f6c64d..331555a 100644
+--- a/nhlt/nhlt-dmic-info.c
++++ b/nhlt/nhlt-dmic-info.c
+@@ -33,6 +33,7 @@
+ #include <fcntl.h>
+ #include <getopt.h>
+ #include <sys/stat.h>
++#include <sys/types.h>
+ #include <arpa/inet.h>
+ 
+ int debug = 0;
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
