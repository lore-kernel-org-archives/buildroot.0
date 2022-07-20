Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1210FC43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 17:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DA3B8249E;
	Wed, 20 Jul 2022 17:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DA3B8249E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2IcPBgydH71; Wed, 20 Jul 2022 17:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8F218244D;
	Wed, 20 Jul 2022 17:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8F218244D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2341BF47A
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 17:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7923760B9D
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 17:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7923760B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BbPOSUp-EBdS for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 17:18:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CA8D60671
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CA8D60671
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 17:18:00 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout11.t-online.de (Postfix) with SMTP id AB2D31A471;
 Wed, 20 Jul 2022 19:17:57 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oEDKe-2j90BF0; Wed, 20 Jul 2022 19:17:57 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:37674)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oEDKe-0005Oy-1k;
 Wed, 20 Jul 2022 19:17:56 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 19:17:56 +0200
Message-Id: <20220720171756.307458-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658337477-01453B16-A215600B/0/0 CLEAN NORMAL
X-TOI-MSGID: 475c64f8-6385-4f1e-8935-081caea3f0c2
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build with gcc < 7
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes various build errors

In file included from ../src/hb-kern.hh:32:0,
                 from ../src/hb-ot-shape-fallback.cc:32:
../src/hb-ot-layout-gpos-table.hh:50:117: error: specialization of 'template<class context_t> static typename context_t::return_t OT::Layout::GPOS_impl::PosLookup::dispatch_recurse_func(context_t*, unsigned int)' in different namespace [-fpermissive]

introduced by bumping harfbuzz to 4.4.1 in
03022329e02332c22f44e0e0a9b17d8454ba26ae

The build error was not yet caught by the autobuilders but can be
reproduced using this defconfig:
http://autobuild.buildroot.org/results/3fe7526b685368007ae0f66e15ef2b27d30d5063/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0004-GPOS-Fix-build-on-GCC-7.patch        | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch

diff --git a/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch b/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch
new file mode 100644
index 0000000000..ead6fc024f
--- /dev/null
+++ b/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch
@@ -0,0 +1,97 @@
+From 3238cb744bb570a75326ab4438968c59069e9af2 Mon Sep 17 00:00:00 2001
+From: Kleis Auke Wolthuizen <github@kleisauke.nl>
+Date: Wed, 6 Jul 2022 13:18:14 +0200
+Subject: [PATCH] [GPOS] Fix build on GCC < 7
+
+[Retrieved (and backported) from:
+https://github.com/harfbuzz/harfbuzz/commit/3238cb744bb570a75326ab4438968c59069e9af2]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/OT/Layout/GPOS/GPOS.hh     | 17 ++++++++++-------
+ src/hb-ot-layout-gpos-table.hh |  6 ++++--
+ 2 files changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/src/OT/Layout/GPOS/GPOS.hh b/src/OT/Layout/GPOS/GPOS.hh
+index 7fb97d7568..23b0b090a2 100644
+--- a/src/OT/Layout/GPOS.hh
++++ b/src/OT/Layout/GPOS.hh
+@@ -7,6 +7,9 @@
+ #include "GPOS/PosLookup.hh"
+ 
+ namespace OT {
++
++using Layout::GPOS_impl::PosLookup;
++
+ namespace Layout {
+ 
+ static void
+@@ -25,10 +28,10 @@ struct GPOS : GSUBGPOS
+ {
+   static constexpr hb_tag_t tableTag = HB_OT_TAG_GPOS;
+ 
+-  using Lookup = GPOS_impl::PosLookup;
++  using Lookup = PosLookup;
+ 
+-  const GPOS_impl::PosLookup& get_lookup (unsigned int i) const
+-  { return static_cast<const GPOS_impl::PosLookup &> (GSUBGPOS::get_lookup (i)); }
++  const PosLookup& get_lookup (unsigned int i) const
++  { return static_cast<const PosLookup &> (GSUBGPOS::get_lookup (i)); }
+ 
+   static inline void position_start (hb_font_t *font, hb_buffer_t *buffer);
+   static inline void position_finish_advances (hb_font_t *font, hb_buffer_t *buffer);
+@@ -37,11 +40,11 @@ struct GPOS : GSUBGPOS
+   bool subset (hb_subset_context_t *c) const
+   {
+     hb_subset_layout_context_t l (c, tableTag, c->plan->gpos_lookups, c->plan->gpos_langsys, c->plan->gpos_features);
+-    return GSUBGPOS::subset<GPOS_impl::PosLookup> (&l);
++    return GSUBGPOS::subset<PosLookup> (&l);
+   }
+ 
+   bool sanitize (hb_sanitize_context_t *c) const
+-  { return GSUBGPOS::sanitize<GPOS_impl::PosLookup> (c); }
++  { return GSUBGPOS::sanitize<PosLookup> (c); }
+ 
+   HB_INTERNAL bool is_blocklisted (hb_blob_t *blob,
+                                    hb_face_t *face) const;
+@@ -51,7 +54,7 @@ struct GPOS : GSUBGPOS
+     for (unsigned i = 0; i < GSUBGPOS::get_lookup_count (); i++)
+     {
+       if (!c->gpos_lookups->has (i)) continue;
+-      const GPOS_impl::PosLookup &l = get_lookup (i);
++      const PosLookup &l = get_lookup (i);
+       l.dispatch (c);
+     }
+   }
+@@ -59,7 +62,7 @@ struct GPOS : GSUBGPOS
+   void closure_lookups (hb_face_t      *face,
+                         const hb_set_t *glyphs,
+                         hb_set_t       *lookup_indexes /* IN/OUT */) const
+-  { GSUBGPOS::closure_lookups<GPOS_impl::PosLookup> (face, glyphs, lookup_indexes); }
++  { GSUBGPOS::closure_lookups<PosLookup> (face, glyphs, lookup_indexes); }
+ 
+   typedef GSUBGPOS::accelerator_t<GPOS> accelerator_t;
+ };
+diff --git a/src/hb-ot-layout-gpos-table.hh b/src/hb-ot-layout-gpos-table.hh
+index f5059cfa83..8fe987fc50 100644
+--- a/src/hb-ot-layout-gpos-table.hh
++++ b/src/hb-ot-layout-gpos-table.hh
+@@ -32,8 +32,8 @@
+ #include "OT/Layout/GPOS.hh"
+ 
+ namespace OT {
+-
+-using Layout::GPOS_impl::PosLookup;
++namespace Layout {
++namespace GPOS_impl {
+ 
+ // TODO(garretrieger): Move into new layout directory.
+ /* Out-of-class implementation for methods recursing */
+@@ -68,6 +68,8 @@ inline bool PosLookup::dispatch_recurse_func<hb_ot_apply_context_t> (hb_ot_apply
+ }
+ #endif
+ 
++} /* namespace GPOS_impl */
++} /* namespace Layout */
+ } /* namespace OT */
+ 
+ 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
