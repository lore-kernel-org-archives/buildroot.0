Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510FBC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 11:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A46E54150E;
	Wed, 14 Dec 2022 11:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A46E54150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PMECaXyqSoQw; Wed, 14 Dec 2022 11:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9409D4161C;
	Wed, 14 Dec 2022 11:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9409D4161C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BC741BF909
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 11:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62E004150E
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 11:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62E004150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yj_oZgX2EBfA for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 11:32:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 737CD415FD
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 737CD415FD
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 11:32:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 2A289D22F1
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 11:16:23 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 229CA240006;
 Wed, 14 Dec 2022 11:16:16 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Date: Wed, 14 Dec 2022 12:16:01 +0100
Message-Id: <20221213-cairo-cves-v1-1-b802b492d112@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213-cairo-cves-v1-0-b802b492d112@theobroma-systems.com>
References: <20221213-cairo-cves-v1-0-b802b492d112@theobroma-systems.com>
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-141d4
Subject: [Buildroot] [PATCH 1/2] package/cairo: fix CVE-2019-6462
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Add an upstream patch to fix CVE-2019-6462:

An issue was discovered in cairo 1.16.0. There is an infinite loop in
the function _arc_error_normalized in the file cairo-arc.c, related to
_arc_max_angle_for_tolerance_normalized.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
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
 

-- 
2.38.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
