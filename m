Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3F6C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EF5C40276;
	Wed, 14 Dec 2022 19:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EF5C40276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLoHHEBkedIE; Wed, 14 Dec 2022 19:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1314440332;
	Wed, 14 Dec 2022 19:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1314440332
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B14451BF42C
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3785607F4
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3785607F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sW_Bgifx7ufI for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:04:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01ADA60A9C
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 19:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01ADA60A9C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E433A866AF; Wed, 14 Dec 2022 19:04:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 20:02:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e38d5190ea16a7fda9f3045ba9ba316e4da53f5c
X-Git-Newrev: b38286d7e5919693cad2dc5b19024b1c03d29c18
X-Patchwork-Hint: ignore
Message-Id: <20221214190427.E433A866AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cairo: fix CVE-2019-6462
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

commit: https://git.buildroot.net/buildroot/commit/?id=b38286d7e5919693cad2dc5b19024b1c03d29c18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream patch to fix CVE-2019-6462:

An issue was discovered in cairo 1.16.0. There is an infinite loop in
the function _arc_error_normalized in the file cairo-arc.c, related to
_arc_max_angle_for_tolerance_normalized.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...gle_for_tolerance_normalized-fix-infinite.patch | 39 ++++++++++++++++++++++
 package/cairo/cairo.mk                             |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch b/package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
new file mode 100644
index 0000000000..078e90fa42
--- /dev/null
+++ b/package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
@@ -0,0 +1,39 @@
+From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 2001
+From: Heiko Lewin <hlewin@gmx.de>
+Date: Sun, 1 Aug 2021 11:16:03 +0000
+Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite loop
+
+[Retrieved from:
+https://gitlab.freedesktop.org/cairo/cairo/-/commit/ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0]
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ src/cairo-arc.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+index 390397bae..1c891d1a0 100644
+--- a/src/cairo-arc.c
++++ b/src/cairo-arc.c
+@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
+ 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
+     };
+     int table_size = ARRAY_LENGTH (table);
++    const int max_segments = 1000; /* this value is chosen arbitrarily. this gives an error of about 1.74909e-20 */
+ 
+     for (i = 0; i < table_size; i++)
+ 	if (table[i].error < tolerance)
+ 	    return table[i].angle;
+ 
+     ++i;
++
+     do {
+ 	angle = M_PI / i++;
+ 	error = _arc_error_normalized (angle);
+-    } while (error > tolerance);
++    } while (error > tolerance && i < max_segments);
+ 
+     return angle;
+ }
+-- 
+2.38.1
+
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index f479aa252a..8bb7ca121d 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -14,6 +14,8 @@ CAIRO_INSTALL_STAGING = YES
 
 # 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
 CAIRO_IGNORE_CVES += CVE-2018-19876
+# 0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
+CAIRO_IGNORE_CVES += CVE-2019-6462
 
 CAIRO_CONF_ENV = LIBS="$(CAIRO_LIBS)"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
