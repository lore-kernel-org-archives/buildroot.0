Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADE8C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 17:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 823DA423C0;
	Fri, 22 Jul 2022 17:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 823DA423C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIG3zNTrHpGt; Fri, 22 Jul 2022 17:24:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F352C423AF;
	Fri, 22 Jul 2022 17:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F352C423AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59BA81BF316
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 17:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 406B140AD4
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 17:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 406B140AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQ1yO4PClZHp for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 17:24:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AA28403A9
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 17:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AA28403A9
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1442F8416A; Fri, 22 Jul 2022 17:11:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 19:22:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d6e07e525617ee0c4ccc4f07345b1b1a70526f7
X-Git-Newrev: 9b6714bf2aa828ded86e1ca63a42f86793d6b8c2
X-Patchwork-Hint: ignore
Message-Id: <20220722171103.1442F8416A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: fix build with gcc < 7
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b6714bf2aa828ded86e1ca63a42f86793d6b8c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch    | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
