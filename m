Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B483CC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EC5D40BBE;
	Wed, 14 Dec 2022 19:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC5D40BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUs3-2fKWDz6; Wed, 14 Dec 2022 19:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E0CF40BB7;
	Wed, 14 Dec 2022 19:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E0CF40BB7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 054511BF42C
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF6FD60864
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF6FD60864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRODYRkHSdVP for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:04:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B95360AA0
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 19:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B95360AA0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE4C4866A7; Wed, 14 Dec 2022 19:04:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 20:02:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b38286d7e5919693cad2dc5b19024b1c03d29c18
X-Git-Newrev: 111ab56d840a6c82367b4a3306494faccd7f934b
X-Patchwork-Hint: ignore
Message-Id: <20221214190427.EE4C4866A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cairo: fix CVE-2020-35492
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

commit: https://git.buildroot.net/buildroot/commit/?id=111ab56d840a6c82367b4a3306494faccd7f934b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
