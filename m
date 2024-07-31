Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AFEC3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 16:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6A1380BAB;
	Wed, 31 Jul 2024 16:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KEyrrATqx43; Wed, 31 Jul 2024 16:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08AD980D39
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08AD980D39;
	Wed, 31 Jul 2024 16:54:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67AFA1BF3D8
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 554AB606EB
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IduNuqVX-bZr for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BFAC60647
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BFAC60647
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ADD683771; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 18:53:14 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 629869f2dd4334acef6e0d3ad5ab69f718c442c6
X-Git-Newrev: 47c331f0da56580912c6187b69f989fb65bdc88d
X-Patchwork-Hint: ignore
Message-Id: <20240731165429.6ADD683771@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/dump1090: fix
 build with GCC 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=47c331f0da56580912c6187b69f989fb65bdc88d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fixes http://autobuild.buildroot.net/results/1d5804974153f96e80f5200793ec8cd12c9fa18a/

GCC 14 complains if the arguments to calloc (nmemb, size) are swapped
around, causing a build failure as dump1090 builds with -Werror:

net_io.c:107:34: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
  107 |     if (!(service = calloc(sizeof(*service), 1))) {

Add a patch from an upstream pull request to fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fd358b97c053af9e45fcb94e59ade63b4d895f10)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-swap-size-arguments-to-calloc.patch       | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/dump1090/0001-swap-size-arguments-to-calloc.patch b/package/dump1090/0001-swap-size-arguments-to-calloc.patch
new file mode 100644
index 0000000000..1c2d502793
--- /dev/null
+++ b/package/dump1090/0001-swap-size-arguments-to-calloc.patch
@@ -0,0 +1,43 @@
+From be8f5b7ab1223076ba0086f14aeeb53ace2d4b5c Mon Sep 17 00:00:00 2001
+From: Jeff Lawson <jeff.lawson@flightaware.com>
+Date: Tue, 18 Jun 2024 15:58:24 +0000
+Subject: [PATCH] swap size arguments to calloc
+
+fixes #241
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Upstream: https://github.com/flightaware/dump1090/pull/243
+---
+ adaptive.c | 2 +-
+ net_io.c   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/adaptive.c b/adaptive.c
+index f16e16c..d656433 100644
+--- a/adaptive.c
++++ b/adaptive.c
+@@ -195,7 +195,7 @@ void adaptive_init()
+     adaptive_burst_window_remaining = adaptive_samples_per_window;
+     adaptive_burst_window_counter = 0;
+ 
+-    adaptive_range_radix = calloc(sizeof(unsigned), 65536);
++    adaptive_range_radix = calloc(65536, sizeof(unsigned));
+     adaptive_range_state = RANGE_RESCAN_UP;
+ 
+     // select and enforce gain limits
+diff --git a/net_io.c b/net_io.c
+index bf98028..8abd510 100644
+--- a/net_io.c
++++ b/net_io.c
+@@ -104,7 +104,7 @@ struct net_service *serviceInit(const char *descr, struct net_writer *writer, he
+ {
+     struct net_service *service;
+ 
+-    if (!(service = calloc(sizeof(*service), 1))) {
++    if (!(service = calloc(1, sizeof(*service)))) {
+         fprintf(stderr, "Out of memory allocating service %s\n", descr);
+         exit(1);
+     }
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
