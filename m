Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F9DC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 11:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0392481E3C;
	Wed, 14 Dec 2022 11:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0392481E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uADKLEYgL8Ah; Wed, 14 Dec 2022 11:16:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AF7481DEA;
	Wed, 14 Dec 2022 11:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF7481DEA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1D21BF909
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 11:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 044FD41550
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 11:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 044FD41550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDUuY7tDVP0C for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 11:16:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7213B4151D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7213B4151D
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 11:16:23 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 8FA40240013;
 Wed, 14 Dec 2022 11:16:19 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Date: Wed, 14 Dec 2022 12:16:02 +0100
Message-Id: <20221213-cairo-cves-v1-2-b802b492d112@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213-cairo-cves-v1-0-b802b492d112@theobroma-systems.com>
References: <20221213-cairo-cves-v1-0-b802b492d112@theobroma-systems.com>
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-141d4
Subject: [Buildroot] [PATCH 2/2] package/cairo: fix CVE-2020-35492
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

Add an upstream patch to fix CVE-2020-35492:
A flaw was found in cairo's image-compositor.c in all versions prior to
1.17.4. This flaw allows an attacker who can provide a crafted input
file to cairo's image-compositor (for example, by convincing a user to
open a file in an application using cairo, or if an application uses
cairo on untrusted input) to cause a stack buffer overflow ->
out-of-bounds WRITE. The highest impact from this vulnerability is to
confidentiality, integrity, as well as system availability.

Important note: this is not the exact upstream patch. Indeed, the
upstream patch[1] contains a png file which appears as a binary diff
inside the patch. The `patch` tool which is used by Buildroot to apply
patches does not handle that kind of diff. Since it is just a test, it
shouldn't impact the quality of the CVE fix and all changes related to
the test are removed from the patch.

[1] https://gitlab.freedesktop.org/cairo/cairo/-/commit/03a820b173ed1fdef6ff14b4468f5dbc02ff59be
Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 .../0004-Fix-mask-usage-in-image-compositor.patch  | 56 ++++++++++++++++++++++
 package/cairo/cairo.mk                             |  2 +
 2 files changed, 58 insertions(+)

diff --git a/package/cairo/0004-Fix-mask-usage-in-image-compositor.patch b/package/cairo/0004-Fix-mask-usage-in-image-compositor.patch
new file mode 100644
index 0000000000..54a95593c5
--- /dev/null
+++ b/package/cairo/0004-Fix-mask-usage-in-image-compositor.patch
@@ -0,0 +1,56 @@
+From 03a820b173ed1fdef6ff14b4468f5dbc02ff59be Mon Sep 17 00:00:00 2001
+From: Heiko Lewin <heiko.lewin@worldiety.de>
+Date: Tue, 15 Dec 2020 16:48:19 +0100
+Subject: [PATCH] Fix mask usage in image-compositor
+
+[Retrieved from
+https://gitlab.freedesktop.org/cairo/cairo/-/commit/03a820b173ed1fdef6ff14b4468f5dbc02ff59be]
+[Removed changes in test/ directory to remove binary diff so that the
+patch can be applied by `patch` tool]
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ src/cairo-image-compositor.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/cairo-image-compositor.c b/src/cairo-image-compositor.c
+index bbf4cf228..2352c478e 100644
+--- a/src/cairo-image-compositor.c
++++ b/src/cairo-image-compositor.c
+@@ -2601,14 +2601,14 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
+ 		    unsigned num_spans)
+ {
+     cairo_image_span_renderer_t *r = abstract_renderer;
+-    uint8_t *m;
++    uint8_t *m, *base = (uint8_t*)pixman_image_get_data(r->mask);
+     int x0;
+ 
+     if (num_spans == 0)
+ 	return CAIRO_STATUS_SUCCESS;
+ 
+     x0 = spans[0].x;
+-    m = r->_buf;
++    m = base;
+     do {
+ 	int len = spans[1].x - spans[0].x;
+ 	if (len >= r->u.composite.run_length && spans[0].coverage == 0xff) {
+@@ -2646,7 +2646,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
+ 				      spans[0].x, y,
+ 				      spans[1].x - spans[0].x, h);
+ 
+-	    m = r->_buf;
++	    m = base;
+ 	    x0 = spans[1].x;
+ 	} else if (spans[0].coverage == 0x0) {
+ 	    if (spans[0].x != x0) {
+@@ -2675,7 +2675,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
+ #endif
+ 	    }
+ 
+-	    m = r->_buf;
++	    m = base;
+ 	    x0 = spans[1].x;
+ 	} else {
+ 	    *m++ = spans[0].coverage;
+-- 
+2.38.1
+
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 8bb7ca121d..e8a704c7da 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -16,6 +16,8 @@ CAIRO_INSTALL_STAGING = YES
 CAIRO_IGNORE_CVES += CVE-2018-19876
 # 0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
 CAIRO_IGNORE_CVES += CVE-2019-6462
+# 0004-Fix-mask-usage-in-image-compositor.patch
+CAIRO_IGNORE_CVES += CVE-2020-35492
 
 CAIRO_CONF_ENV = LIBS="$(CAIRO_LIBS)"
 

-- 
2.38.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
