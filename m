Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B831C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 08:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E03FC400A4;
	Thu, 27 Jun 2024 08:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIXU7KNx1AYC; Thu, 27 Jun 2024 08:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9800240133
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9800240133;
	Thu, 27 Jun 2024 08:02:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB1AB1BF3D8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 08:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7EAA40133
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 08:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTXoEQjQxq_2 for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 08:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B5BCF400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5BCF400A4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5BCF400A4
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 08:02:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1592C000D;
 Thu, 27 Jun 2024 08:02:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sMk51-0066R3-2i;
 Thu, 27 Jun 2024 10:02:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 10:02:04 +0200
Message-Id: <20240627080205.1454694-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/dump1090: fix build with GCC 14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes http://autobuild.buildroot.net/results/1d5804974153f96e80f5200793ec8cd12c9fa18a/

GCC 14 complains if the arguments to calloc (nmemb, size) are swapped
around, causing a build failure as dump1090 builds with -Werror:

net_io.c:107:34: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
  107 |     if (!(service = calloc(sizeof(*service), 1))) {

Add a patch from an upstream pull request to fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-swap-size-arguments-to-calloc.patch  | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/dump1090/0001-swap-size-arguments-to-calloc.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
